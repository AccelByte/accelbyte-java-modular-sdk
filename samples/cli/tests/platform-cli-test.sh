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
echo "1..510"

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
    --id 'kWeYGXAF' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'G9Z6epq5' \
    --body '{"grantDays": "5Ju3S2Nw"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '0530fvol' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'kcdK0aTY' \
    --body '{"grantDays": "5v6tlZKa"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "nNAtDwwW", "dryRun": true, "fulfillmentUrl": "UmhR5Vk5", "itemType": "SEASON", "purchaseConditionUrl": "eCJh58gL"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'UhKDTTJV' \
    --itemType 'OPTIONBOX' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'gSwqPjyp' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'ln1Vl73L' \
    --body '{"clazz": "Vpc9CFjD", "dryRun": true, "fulfillmentUrl": "SzviE333", "purchaseConditionUrl": "LyPdvgPM"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '4pGAXnrZ' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --name 'hbDuqqga' \
    --offset '31' \
    --tag 'vxDqAYC2' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "UJ3Zy6Ux", "discountConfig": {"categories": [{"categoryPath": "mLAvVXnw", "includeSubCategories": true}, {"categoryPath": "T7fT2dID", "includeSubCategories": true}, {"categoryPath": "s2K8bsZc", "includeSubCategories": true}], "currencyCode": "tIp2otjk", "currencyNamespace": "qdjagRl3", "discountAmount": 58, "discountPercentage": 81, "discountType": "PERCENTAGE", "items": [{"itemId": "NRSPYqNb", "itemName": "SgoryVUx"}, {"itemId": "xa1BYWYS", "itemName": "TkCwVhLm"}, {"itemId": "7H6Sq97U", "itemName": "rM7S8nCs"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 53, "itemId": "zVZyHk7D", "itemName": "ZajkEWnQ", "quantity": 85}, {"extraSubscriptionDays": 85, "itemId": "X33g452u", "itemName": "E5Q1za56", "quantity": 44}, {"extraSubscriptionDays": 29, "itemId": "7qrhDBDt", "itemName": "Vb3Vh64T", "quantity": 86}], "maxRedeemCountPerCampaignPerUser": 74, "maxRedeemCountPerCode": 99, "maxRedeemCountPerCodePerUser": 43, "maxSaleCount": 51, "name": "q5A1fZj7", "redeemEnd": "1985-04-28T00:00:00Z", "redeemStart": "1999-11-17T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["qpX0b6jo", "OnZmHnJG", "KgRLNDbr"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'RtmpaWWx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'zaZ9rrXN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HV2peJCZ", "discountConfig": {"categories": [{"categoryPath": "LNkAdIRx", "includeSubCategories": false}, {"categoryPath": "QDSk3gHt", "includeSubCategories": true}, {"categoryPath": "k2vinNXi", "includeSubCategories": true}], "currencyCode": "hSew1dQq", "currencyNamespace": "8AeS0t7b", "discountAmount": 83, "discountPercentage": 100, "discountType": "AMOUNT", "items": [{"itemId": "LOD6GWdC", "itemName": "fBhAMZ2L"}, {"itemId": "QnuamiJo", "itemName": "OES7PjTE"}, {"itemId": "VOJEjDrg", "itemName": "DpB62U6U"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 7, "itemId": "vfRfiPY4", "itemName": "nHNS9tOF", "quantity": 32}, {"extraSubscriptionDays": 5, "itemId": "uTJbB3Es", "itemName": "R9gp76e1", "quantity": 59}, {"extraSubscriptionDays": 5, "itemId": "zyCyxssi", "itemName": "a98NIzpx", "quantity": 42}], "maxRedeemCountPerCampaignPerUser": 84, "maxRedeemCountPerCode": 44, "maxRedeemCountPerCodePerUser": 86, "maxSaleCount": 20, "name": "2LfhFYZg", "redeemEnd": "1982-12-15T00:00:00Z", "redeemStart": "1998-12-16T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["VsNSz008", "JZwTyMlE", "a0gl0KFt"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'b3pwOm9p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "qFlYGAK5", "oldName": "tkDviIkr"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'FJqZqB94' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'T0EK8dzD' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'iybp2uj0' \
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
    --body '{"enableInventoryCheck": false, "itemDeletionCheckConfig": ["CATALOG", "IAP", "REWARD"]}' \
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
    --body '{"appConfig": {"appName": "5R51V9wT"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "oW1ULkTE"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "fIASHRXJ"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "tOMhEqgq"}, "extendType": "CUSTOM"}' \
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
    --storeId 'czT8zc6K' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'npHaiO44' \
    --body '{"categoryPath": "B5kSedXE", "localizationDisplayNames": {"jltdqeFl": "Vk3Zr2w0", "O04RRM2S": "HTQHa0uq", "VzGJphKR": "egY5u7yg"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SyPHY40h' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'qTrGORlm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'S4xtbiiH' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'DMxMsVNK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'muJeLPfU' \
    --body '{"localizationDisplayNames": {"d7fwm5Bu": "oo0yheoW", "5KMkHXEF": "90zQrtS1", "z1TZnD78": "L52vPpP5"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '23IlL5CX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'plRgGRaN' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'OImEQe6n' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U6QfpYPM' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'LgwiEqeH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WqxAgZzP' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'SeAWLJWL' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'F6WR82Ag' \
    --batchNo '89,32,98' \
    --code 'sLU9tCTd' \
    --limit '99' \
    --offset '45' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'i5EeYmNC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "N63Oovfh", "codeValue": "syEYs8yg", "quantity": 100}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'WDRjtT7p' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'iPTjfhgV' \
    --batchNo '100,90,29' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'zQm6CyGZ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'D4IsgUIc' \
    --batchNo '65,51,13' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'n31SkIf2' \
    --namespace "$AB_NAMESPACE" \
    --batchName '4lyS4T25' \
    --batchNo '30,46,83' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'uWbuFMvf' \
    --namespace "$AB_NAMESPACE" \
    --code 'bPnc28L0' \
    --limit '65' \
    --offset '20' \
    --userId 'WJhXXiAz' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'nTra7NNY' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'ES1AWWmL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'WUoxFKUb' \
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
    --body '{"currencyCode": "GCy0F3vB", "currencySymbol": "MZtmzsYZ", "currencyType": "REAL", "decimals": 24, "localizationDescriptions": {"sLIvzQhM": "xxh83nID", "j1PIxxJB": "RGZ84TVZ", "C9cEXssg": "UtB7U96q"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'KvNBLFtR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"PBTHpDF9": "MVkmQXL8", "GF3ln0hq": "OcF5xJBR", "DNQRyH5m": "ilkbuUVh"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'JsL78VQt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'Wa3lyIbE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'tYspfOwx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'Xn4qvsot' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'T9RVBJfY' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": false, "id": "95KXbm3M", "rewards": [{"currency": {"currencyCode": "6ZjqhbE2", "namespace": "3lV5K1Xm"}, "item": {"itemId": "gfw7Uvle", "itemName": "dtcPNMUZ", "itemSku": "h6wn2AHt", "itemType": "oPkZsPdg"}, "quantity": 33, "type": "CURRENCY"}, {"currency": {"currencyCode": "Hp6gRUQo", "namespace": "2IlSTf1e"}, "item": {"itemId": "XX8HVsDx", "itemName": "TP2j54tF", "itemSku": "NL2RTJ8X", "itemType": "l64fPURS"}, "quantity": 74, "type": "CURRENCY"}, {"currency": {"currencyCode": "9WFTzfWl", "namespace": "o21wIXqF"}, "item": {"itemId": "AQy1bSYf", "itemName": "mjp73QVG", "itemSku": "713cvPxU", "itemType": "yAHAuKsw"}, "quantity": 53, "type": "ITEM"}], "rvn": 17}, {"autoUpdate": false, "enableRevocation": false, "id": "2d3XyBjb", "rewards": [{"currency": {"currencyCode": "hwCZXf2q", "namespace": "pISRbra7"}, "item": {"itemId": "nqRBnaek", "itemName": "uWGaz1CW", "itemSku": "KyUP2BRd", "itemType": "JZKTK9cG"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "RctTzbVQ", "namespace": "jaMCEVX5"}, "item": {"itemId": "nn3WnpPm", "itemName": "v97G97rM", "itemSku": "BVB63aVp", "itemType": "ZkLUadxC"}, "quantity": 12, "type": "CURRENCY"}, {"currency": {"currencyCode": "NiyKtATx", "namespace": "y77uxSNV"}, "item": {"itemId": "UQRdLjMy", "itemName": "T3RCOjIk", "itemSku": "O42dc0nu", "itemType": "vtJqtZ4z"}, "quantity": 28, "type": "ITEM"}], "rvn": 23}, {"autoUpdate": false, "enableRevocation": true, "id": "9S7goLTo", "rewards": [{"currency": {"currencyCode": "r3qeCHfW", "namespace": "wSl7ioZI"}, "item": {"itemId": "G654MPhT", "itemName": "9cdjQg6F", "itemSku": "PVWTVugJ", "itemType": "Ldw3Tb0P"}, "quantity": 61, "type": "CURRENCY"}, {"currency": {"currencyCode": "RnXCYf1y", "namespace": "8ZXdd0WQ"}, "item": {"itemId": "bZwMPs2R", "itemName": "zRUuVhQw", "itemSku": "nDorJXzm", "itemType": "mQ5QP1XR"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "B0XkidZv", "namespace": "oLiUzSqc"}, "item": {"itemId": "0C4kdjZF", "itemName": "518ohWoo", "itemSku": "cjIpQSYs", "itemType": "d6frsThS"}, "quantity": 69, "type": "CURRENCY"}], "rvn": 64}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"qPxIxgiC": "0SRH3H5w", "hFkeha7d": "3zd2aFb8", "M958PUWK": "MDtHS06R"}}, {"platform": "PSN", "platformDlcIdMap": {"jie9vPUo": "tysoEhx9", "1XNM6zyk": "g7TrYABG", "Noy5xW1q": "ucD1T7Bd"}}, {"platform": "OCULUS", "platformDlcIdMap": {"59SuraQU": "i7ZRxDUy", "o2SMxFD6": "RbXO8uvE", "uN7OfjBS": "CDHU9FQP"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'H3LZCGFQ' \
    --itemId 'gy6EcLOX,RSMC1Mcq,D8CmRk1a' \
    --limit '16' \
    --offset '69' \
    --origin 'Xbox' \
    --userId 'wJtmHatU' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'KBZZBMUQ,ET0dOnp7,mTQT6tWq' \
    --limit '61' \
    --offset '72' \
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
    --body '{"entitlementGrantList": [{"collectionId": "Eums51dO", "endDate": "1989-09-09T00:00:00Z", "grantedCode": "XEEdnG1W", "itemId": "wQ7vkPxV", "itemNamespace": "MmGJ146m", "language": "cId", "metadata": {"XIHRDBPe": {}, "Y8q2FKIs": {}, "VLYigDEz": {}}, "origin": "Twitch", "quantity": 64, "region": "6lcQgrtN", "source": "REWARD", "startDate": "1990-02-18T00:00:00Z", "storeId": "WR2nJSZ2"}, {"collectionId": "2w0Joffe", "endDate": "1976-03-09T00:00:00Z", "grantedCode": "keYKDxpt", "itemId": "DzTroqM1", "itemNamespace": "PIsJQBbu", "language": "udBj_pPzh_zP", "metadata": {"U1SHXUot": {}, "1fnlR1Cl": {}, "uaGACEET": {}}, "origin": "Steam", "quantity": 53, "region": "wBNu0NcF", "source": "PURCHASE", "startDate": "1986-11-04T00:00:00Z", "storeId": "CNwRqec8"}, {"collectionId": "tAUhsuvt", "endDate": "1971-03-21T00:00:00Z", "grantedCode": "etlBqt1z", "itemId": "a27xr4BV", "itemNamespace": "Jnr3jXYP", "language": "PUD-VPmM-458", "metadata": {"aBuirNuQ": {}, "Qx1zhQ31": {}, "ONXW4xdr": {}}, "origin": "GooglePlay", "quantity": 7, "region": "53C9moBW", "source": "PROMOTION", "startDate": "1975-05-29T00:00:00Z", "storeId": "cA5a7ZZO"}], "userIds": ["SKzqE9UN", "iWDaY6V9", "kxduuxX2"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["z0ysPGx4", "AIqPjDpN", "QqeoAIW5"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'LbnNxSPi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '2' \
    --status 'FAIL' \
    --userId 'KG4ZLcoM' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DGTatNxt' \
    --eventType 'REVOKED' \
    --externalOrderId 'ptgDlRw3' \
    --limit '15' \
    --offset '89' \
    --startTime 'EsEO40Vl' \
    --status 'IGNORED' \
    --userId 'FobTVFbv' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "vHVUAjFm", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 1, "clientTransactionId": "HFijlV00"}, {"amountConsumed": 84, "clientTransactionId": "sFlUfxjE"}, {"amountConsumed": 96, "clientTransactionId": "mfOmYQc2"}], "entitlementId": "gxafPtNo", "usageCount": 26}, {"clientTransaction": [{"amountConsumed": 19, "clientTransactionId": "v9guFe9x"}, {"amountConsumed": 74, "clientTransactionId": "9ssqwRkD"}, {"amountConsumed": 43, "clientTransactionId": "jWxcNCwN"}], "entitlementId": "YBBVISpn", "usageCount": 39}, {"clientTransaction": [{"amountConsumed": 65, "clientTransactionId": "D8K3K8nt"}, {"amountConsumed": 53, "clientTransactionId": "cEAXFOxr"}, {"amountConsumed": 73, "clientTransactionId": "OArrrKQm"}], "entitlementId": "43TQmiFw", "usageCount": 40}], "purpose": "DammwH3u"}, "originalTitleName": "mcitE5mb", "paymentProductSKU": "ebOekWBr", "purchaseDate": "3LCH1XAt", "sourceOrderItemId": "yHaJahZz", "titleName": "L0eTs42X"}, "eventDomain": "EsYQoA6c", "eventSource": "4XCgWCuR", "eventType": "c5tiiAlR", "eventVersion": 60, "id": "F0MYxO2U", "timestamp": "yZQiSAX3"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "xbQFX47R", "eventState": "UBKCRKpH", "lineItemId": "uotZt6o5", "orderId": "IAmQ98Ae", "productId": "lDmxq50q", "productType": "gd4YkYfn", "purchasedDate": "VxJokuFX", "sandboxId": "C5VQpiuL", "skuId": "ZNDEvR55", "subscriptionData": {"consumedDurationInDays": 15, "dateTime": "djtdzhFM", "durationInDays": 7, "recurrenceId": "B1wpbujf"}}, "datacontenttype": "Nt6xv03c", "id": "2dkRynqz", "source": "zEFz64KL", "specVersion": "dHKYj4Jl", "subject": "2PXazM1w", "time": "ZQACFc3j", "traceparent": "WKOl402Z", "type": "rph8gPq8"}' \
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
    --body '{"appAppleId": 69, "bundleId": "odWUSjFd", "issuerId": "jTcDevtT", "keyId": "yI7LUWKl", "password": "2rntEeQV", "version": "V1"}' \
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
    --body '{"sandboxId": "rtAgJOCs"}' \
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
    --body '{"applicationName": "gTP135oN", "notificationTokenAudience": "Ys2wa7kE", "notificationTokenEmail": "GC00XCNh", "packageName": "CBUqfoXS", "serviceAccountId": "mTDWseYr"}' \
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
    --body '{"data": [{"itemIdentity": "ByiYF0gA", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"N6uXMX1J": "VLzBv3rx", "5qDTmkLo": "YrE1yX1s", "P8Qcb2C2": "1jpuLsfS"}}, {"itemIdentity": "NU3cZGZf", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"6jEWl2bi": "zF6PT40i", "LK2HLXKq": "UY43qw4R", "QLPlaPFC": "gfYj5Bnc"}}, {"itemIdentity": "6wKVlndK", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"NHM1WFSk": "hKYR9qCo", "ziKiYaE6": "gVqoQ4CM", "agKffhrs": "wZjC9UH5"}}]}' \
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
    --body '{"appId": "AXUJ3eDV", "appSecret": "xl0oj5uU", "webhookVerifyToken": "g4CliugH"}' \
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
    --body '{"sku": "2IQFVp9x"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'FaRBoBW6' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'CLFf0aPo' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "RcvHw0nz", "sku": "2UenXAt3"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'vLGdg6Co' \
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
    --body '{"backOfficeServerClientId": "FKhn2Y8J", "backOfficeServerClientSecret": "xjz2zkjg", "enableStreamJob": false, "environment": "c5D6d0JQ", "streamName": "ThBWGxx9", "streamPartnerName": "LZAmBvoL"}' \
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
    --body '{"backOfficeServerClientId": "9rZE0f8M", "backOfficeServerClientSecret": "1WN18qK1", "enableStreamJob": false, "environment": "RytAh6q0", "streamName": "IHy7X0CK", "streamPartnerName": "ouln0dcn"}' \
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
    --body '{"appId": "mAh87XfT", "env": "LIVE", "publisherAuthenticationKey": "C0CDYgHK", "syncMode": "TRANSACTION"}' \
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
    --body '{"clientId": "tz2Cp5OJ", "clientSecret": "33pZNixe", "organizationId": "zQCgAA0b"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "qJ7m2HEr", "entraAppClientSecret": "64T0ryOk", "entraTenantId": "cs0RCcin", "relyingPartyCert": "2ScBoQNt"}' \
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
    --password 'YDWvmvPR' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'JvXNyzqi' \
    --externalId 'XN3W1syY' \
    --limit '88' \
    --offset '40' \
    --source 'APPLE' \
    --startDate 'vJCx5eyQ' \
    --status 'ERROR' \
    --type 'UG3KVjOp' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '53' \
    --orderId '83nKG8Sq' \
    --steamId 'NVdJP55K' \
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
    --body '{"env": "SANDBOX", "lastTime": "1990-03-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo '8HmcEFOq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '29' \
    --orderId 'mDVs6pb9' \
    --processStatus 'PROCESSED' \
    --steamId 'ZIfQ4pdb' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'uM8bLVfa' \
    --limit '17' \
    --offset '61' \
    --platform 'STEAM' \
    --productId 'eOnXF0J8' \
    --userId 'npl5ebEp' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'Q0RJ9N06' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime '0Xfr8GOd' \
    --feature 'kILxvUcg' \
    --itemId 'g08VY63v' \
    --itemType 'CODE' \
    --startTime '3XEX4fta' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ToFmT5aC' \
    --feature 'qVP3fMwf' \
    --itemId 'jhlynjMF' \
    --itemType 'EXTENSION' \
    --startTime 'mg79PnE5' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'azkTZ0RD' \
    --body '{"categoryPath": "u8IF0bJR", "targetItemId": "PMZRWKq6", "targetNamespace": "YUQvP2Gy"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YiocY1Uh' \
    --body '{"appId": "dThl5CRd", "appType": "GAME", "baseAppId": "WgLEXwPU", "boothName": "CFeBzDBo", "categoryPath": "qe6wYZ62", "clazz": "oOiyRrRd", "displayOrder": 81, "entitlementType": "DURABLE", "ext": {"bxhMD2e8": {}, "eHA6Q4fa": {}, "v3p1caqS": {}}, "features": ["R3Xe9nVY", "l1vvW2tP", "RzeyMdUi"], "flexible": false, "images": [{"as": "sNOs0WpT", "caption": "RmpgSpvW", "height": 12, "imageUrl": "niuot0NB", "smallImageUrl": "01Z18yGl", "width": 72}, {"as": "vvVcA2gs", "caption": "71WPLhTi", "height": 79, "imageUrl": "YwVIfgib", "smallImageUrl": "fKswSG1n", "width": 5}, {"as": "swnyqYyT", "caption": "F1zebVi7", "height": 44, "imageUrl": "HsSSN5Tt", "smallImageUrl": "AbeuIMqq", "width": 90}], "inventoryConfig": {"customAttributes": {"SjSIsZl5": {}, "wak836o0": {}, "qheGTcJM": {}}, "serverCustomAttributes": {"HJJF6Ij7": {}, "B3ipvD9P": {}, "ssjdSeLR": {}}, "slotUsed": 46}, "itemId": "7Z7NH0qn", "itemIds": ["IZUmWq4O", "3kfXPn0V", "eRBieiwD"], "itemQty": {"W1kpYyxq": 3, "drjzcVMV": 85, "8GkELoE1": 94}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"zwgazxgj": {"description": "l2XOTSzU", "localExt": {"eF3JYDWc": {}, "WAeyrSJe": {}, "rTcPEThp": {}}, "longDescription": "Ski9kgzV", "title": "2N8Kqym3"}, "f4dpO7Nb": {"description": "NSJFUStL", "localExt": {"26fdt41l": {}, "jdJ3WTiX": {}, "UQR5gxLJ": {}}, "longDescription": "GHKX50Kj", "title": "kr0VW4BM"}, "Hy0OIEHi": {"description": "Z0P90LJZ", "localExt": {"YIaY1XFq": {}, "8EJOYSam": {}, "mFN9WVOr": {}}, "longDescription": "iOcjvffH", "title": "xy54RBrV"}}, "lootBoxConfig": {"rewardCount": 76, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 25, "endDate": "1997-12-27T00:00:00Z", "itemId": "XPRbWp2E", "itemSku": "dQ8R5ju9", "itemType": "m1lDkSqm"}, {"count": 87, "duration": 72, "endDate": "1994-06-28T00:00:00Z", "itemId": "HMUv9sMw", "itemSku": "OEvnrcNA", "itemType": "V5XjHATR"}, {"count": 95, "duration": 95, "endDate": "1980-07-14T00:00:00Z", "itemId": "654yKUOy", "itemSku": "4Ai3OSxR", "itemType": "zT7m6vSc"}], "name": "tTqeI2nR", "odds": 0.7226123197908366, "type": "REWARD", "weight": 78}, {"lootBoxItems": [{"count": 29, "duration": 12, "endDate": "1986-10-27T00:00:00Z", "itemId": "viWafDAa", "itemSku": "7JT7bneg", "itemType": "Wn1lWQqr"}, {"count": 9, "duration": 9, "endDate": "1990-04-11T00:00:00Z", "itemId": "WNngnsp9", "itemSku": "4LLPbKRD", "itemType": "h67tmIz9"}, {"count": 39, "duration": 89, "endDate": "1995-01-30T00:00:00Z", "itemId": "SKdorCJ4", "itemSku": "KAu6vPXM", "itemType": "9TIt2RuL"}], "name": "EFglowT2", "odds": 0.6649745395217712, "type": "REWARD", "weight": 72}, {"lootBoxItems": [{"count": 58, "duration": 45, "endDate": "1971-02-12T00:00:00Z", "itemId": "SLA3XM1B", "itemSku": "s3lx0Jh4", "itemType": "SZhtSBfq"}, {"count": 65, "duration": 56, "endDate": "1997-01-18T00:00:00Z", "itemId": "OWp020gW", "itemSku": "ehpIdvip", "itemType": "wtmKDDje"}, {"count": 26, "duration": 13, "endDate": "1974-04-30T00:00:00Z", "itemId": "4JE0yMN3", "itemSku": "9AZsnn1J", "itemType": "OutFgHag"}], "name": "4qEyff0S", "odds": 0.7891899804864486, "type": "PROBABILITY_GROUP", "weight": 41}], "rollFunction": "CUSTOM"}, "maxCount": 59, "maxCountPerUser": 6, "name": "pR6tVMC6", "optionBoxConfig": {"boxItems": [{"count": 55, "duration": 61, "endDate": "1997-05-21T00:00:00Z", "itemId": "WmoSgK6R", "itemSku": "bdkE1jUA", "itemType": "U724izIr"}, {"count": 47, "duration": 82, "endDate": "1975-06-01T00:00:00Z", "itemId": "3WurKIEz", "itemSku": "SoOKCvjG", "itemType": "x5hRwExl"}, {"count": 0, "duration": 28, "endDate": "1979-12-05T00:00:00Z", "itemId": "VYBR6yhC", "itemSku": "k6mg4X5R", "itemType": "CS3VO190"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 11, "fixedTrialCycles": 92, "graceDays": 18}, "regionData": {"sj7og6B5": [{"currencyCode": "h9X3nq8r", "currencyNamespace": "SimZNzsZ", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1992-08-26T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1972-03-19T00:00:00Z", "expireAt": "1978-12-22T00:00:00Z", "price": 62, "purchaseAt": "1979-03-14T00:00:00Z", "trialPrice": 7}, {"currencyCode": "jUzEfxXX", "currencyNamespace": "EzdFl8k1", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1997-04-08T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1985-06-16T00:00:00Z", "expireAt": "1989-04-26T00:00:00Z", "price": 94, "purchaseAt": "1988-05-01T00:00:00Z", "trialPrice": 18}, {"currencyCode": "71h7zOtF", "currencyNamespace": "atxYYLUJ", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1984-10-18T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1995-09-04T00:00:00Z", "expireAt": "1974-11-06T00:00:00Z", "price": 65, "purchaseAt": "1987-02-27T00:00:00Z", "trialPrice": 35}], "ZnoIejXl": [{"currencyCode": "TJJs6vtK", "currencyNamespace": "U5Y1UAgf", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1972-06-29T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1992-02-13T00:00:00Z", "expireAt": "1998-02-24T00:00:00Z", "price": 11, "purchaseAt": "1974-06-25T00:00:00Z", "trialPrice": 76}, {"currencyCode": "sprAJG5e", "currencyNamespace": "uJtfTdLR", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1991-02-11T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1988-08-10T00:00:00Z", "expireAt": "1999-11-12T00:00:00Z", "price": 26, "purchaseAt": "1986-06-24T00:00:00Z", "trialPrice": 79}, {"currencyCode": "iSjiAovD", "currencyNamespace": "zhUTtf2m", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1986-04-09T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1997-08-05T00:00:00Z", "expireAt": "1991-05-25T00:00:00Z", "price": 33, "purchaseAt": "1983-10-22T00:00:00Z", "trialPrice": 49}], "2K8JbeoO": [{"currencyCode": "vqJdM1en", "currencyNamespace": "GWFCoGJS", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1974-01-19T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1996-08-02T00:00:00Z", "expireAt": "1994-09-24T00:00:00Z", "price": 97, "purchaseAt": "1975-11-23T00:00:00Z", "trialPrice": 90}, {"currencyCode": "u8A47mpi", "currencyNamespace": "jmnXT6tn", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1993-10-24T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1974-02-23T00:00:00Z", "expireAt": "1975-06-05T00:00:00Z", "price": 57, "purchaseAt": "1980-05-17T00:00:00Z", "trialPrice": 58}, {"currencyCode": "PUE8feRh", "currencyNamespace": "qcJT12Pe", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1979-09-27T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1993-09-16T00:00:00Z", "expireAt": "1999-04-13T00:00:00Z", "price": 34, "purchaseAt": "1978-06-30T00:00:00Z", "trialPrice": 32}]}, "saleConfig": {"currencyCode": "6xHbK8GI", "price": 48}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "rvxDZKm9", "stackable": false, "status": "INACTIVE", "tags": ["fDRxEQeg", "tHTzxJmo", "0ot6byjP"], "targetCurrencyCode": "exjBZ9oC", "targetNamespace": "391uKbZ8", "thumbnailUrl": "XoPDV1eH", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8Utf7SBs' \
    --appId '7iYwF4hm' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate '58NAeCht' \
    --baseAppId 'qZpm9KBt' \
    --categoryPath 'cZJKDnHF' \
    --features 'LxRDJQ0K' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '88' \
    --offset '35' \
    --region 'MAH2fPKL' \
    --sortBy 'name,updatedAt:desc,displayOrder:asc' \
    --storeId 'IisAsdi5' \
    --tags 'n0MM9NMJ' \
    --targetNamespace '3jlM4g2o' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'arfOK2sl,JMa65vHJ,GSJqHVfZ' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zEVyWm82' \
    --itemIds 'hWr6JtDo' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5TJjEQ8q' \
    --sku 'J5l05q2G' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'P9j0RbEh' \
    --populateBundle  \
    --region 'UyNXOQTy' \
    --storeId 'qVjZTcpi' \
    --sku 'd15wdkKh' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'sCRqqTwm' \
    --region 'mZ7KTplg' \
    --storeId 'TLYlbKJT' \
    --itemIds 'RuvMmYpA' \
    --userId 't2rvHRRl' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'eXEj2QtA' \
    --sku 'BaVlmcbq' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'Oe4Zl2oO,oB2PkxTf,xcTJNfdZ' \
    --storeId 'zgYrLM1O' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zDOx4NYB' \
    --region '03jtIwVU' \
    --storeId '92WI7myy' \
    --itemIds 'DEckrt8Z' \
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
    --platform 'CjMkCvVB' \
    --userId 'j9W8wjLJ' \
    --body '{"itemIds": ["i1OyzEhK", "ET5ikYtC", "YWUwRKoR"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId '1pSFWvtU' \
    --body '{"changes": [{"itemIdentities": ["yQWekEqY", "IaKVbN4Z", "1LwsIFXd"], "itemIdentityType": "ITEM_ID", "regionData": {"LfFFskzp": [{"currencyCode": "RZAODC6M", "currencyNamespace": "bQP8vD97", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1979-09-13T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1974-08-01T00:00:00Z", "discountedPrice": 35, "expireAt": "1983-03-22T00:00:00Z", "price": 95, "purchaseAt": "1979-07-31T00:00:00Z", "trialPrice": 8}, {"currencyCode": "kM2cwXiI", "currencyNamespace": "f20lWyQX", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1979-02-03T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1978-07-28T00:00:00Z", "discountedPrice": 47, "expireAt": "1985-02-28T00:00:00Z", "price": 44, "purchaseAt": "1972-08-20T00:00:00Z", "trialPrice": 87}, {"currencyCode": "cSS5VQew", "currencyNamespace": "pgak5dVV", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1974-08-07T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1987-04-05T00:00:00Z", "discountedPrice": 65, "expireAt": "1974-01-10T00:00:00Z", "price": 17, "purchaseAt": "1974-05-10T00:00:00Z", "trialPrice": 68}], "WamvyR01": [{"currencyCode": "Ldj3lpI2", "currencyNamespace": "K1ZN2aAz", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1981-03-07T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1971-05-29T00:00:00Z", "discountedPrice": 98, "expireAt": "1990-12-15T00:00:00Z", "price": 1, "purchaseAt": "1993-01-29T00:00:00Z", "trialPrice": 81}, {"currencyCode": "JQ5ltn1M", "currencyNamespace": "nuQFqTlx", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1998-08-06T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1977-02-02T00:00:00Z", "discountedPrice": 1, "expireAt": "1992-11-17T00:00:00Z", "price": 53, "purchaseAt": "1992-03-04T00:00:00Z", "trialPrice": 88}, {"currencyCode": "n1zZl0B6", "currencyNamespace": "F2FNkb02", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1987-02-28T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1973-10-07T00:00:00Z", "discountedPrice": 39, "expireAt": "1975-03-23T00:00:00Z", "price": 6, "purchaseAt": "1992-04-24T00:00:00Z", "trialPrice": 2}], "z049C7AZ": [{"currencyCode": "K0hQ8UOq", "currencyNamespace": "bMYJfbXr", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1975-10-09T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1981-02-09T00:00:00Z", "discountedPrice": 12, "expireAt": "1971-09-13T00:00:00Z", "price": 33, "purchaseAt": "1975-07-11T00:00:00Z", "trialPrice": 90}, {"currencyCode": "LnDvl5yX", "currencyNamespace": "w7lLGuOB", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1979-10-06T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1999-10-03T00:00:00Z", "discountedPrice": 31, "expireAt": "1986-12-16T00:00:00Z", "price": 85, "purchaseAt": "1994-06-06T00:00:00Z", "trialPrice": 32}, {"currencyCode": "P8T45YA9", "currencyNamespace": "iRaTilTu", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1983-01-24T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-08-29T00:00:00Z", "discountedPrice": 87, "expireAt": "1981-05-14T00:00:00Z", "price": 76, "purchaseAt": "1981-04-01T00:00:00Z", "trialPrice": 24}]}}, {"itemIdentities": ["XwWQzPh4", "RXPPMnR8", "VLieQd0W"], "itemIdentityType": "ITEM_SKU", "regionData": {"VGTMSMRk": [{"currencyCode": "TVBvACXk", "currencyNamespace": "UuYkCw5H", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1976-09-04T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1999-02-17T00:00:00Z", "discountedPrice": 68, "expireAt": "1979-04-03T00:00:00Z", "price": 56, "purchaseAt": "1987-09-12T00:00:00Z", "trialPrice": 86}, {"currencyCode": "ExVGKA0q", "currencyNamespace": "Xz5IlGqC", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1987-03-11T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1981-05-29T00:00:00Z", "discountedPrice": 76, "expireAt": "1993-01-25T00:00:00Z", "price": 4, "purchaseAt": "1972-01-23T00:00:00Z", "trialPrice": 51}, {"currencyCode": "OSgJ5Qa8", "currencyNamespace": "bIKEBvfa", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1987-09-10T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1978-10-23T00:00:00Z", "discountedPrice": 17, "expireAt": "1990-04-04T00:00:00Z", "price": 65, "purchaseAt": "1980-10-12T00:00:00Z", "trialPrice": 38}], "ChZ4yPHE": [{"currencyCode": "QPt5TDG8", "currencyNamespace": "cS5kowa8", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1975-02-07T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1989-08-12T00:00:00Z", "discountedPrice": 29, "expireAt": "1972-08-13T00:00:00Z", "price": 14, "purchaseAt": "1979-02-08T00:00:00Z", "trialPrice": 21}, {"currencyCode": "gUH8DiPP", "currencyNamespace": "slPhAaTk", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1973-12-07T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1992-05-29T00:00:00Z", "discountedPrice": 62, "expireAt": "1996-10-01T00:00:00Z", "price": 51, "purchaseAt": "1971-12-19T00:00:00Z", "trialPrice": 68}, {"currencyCode": "JBDWZbn9", "currencyNamespace": "1ozrnLSf", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1972-07-25T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1994-07-27T00:00:00Z", "discountedPrice": 72, "expireAt": "1979-03-16T00:00:00Z", "price": 18, "purchaseAt": "1982-05-07T00:00:00Z", "trialPrice": 12}], "1V6Cqgbx": [{"currencyCode": "zTWaN5mr", "currencyNamespace": "Rx1F7gSq", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1981-01-20T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1991-05-12T00:00:00Z", "discountedPrice": 7, "expireAt": "1996-09-01T00:00:00Z", "price": 45, "purchaseAt": "1977-03-20T00:00:00Z", "trialPrice": 89}, {"currencyCode": "yRccMOsS", "currencyNamespace": "ZzO6r8eG", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1973-04-26T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1998-10-29T00:00:00Z", "discountedPrice": 82, "expireAt": "1979-06-01T00:00:00Z", "price": 9, "purchaseAt": "1998-08-15T00:00:00Z", "trialPrice": 90}, {"currencyCode": "RN345Bh3", "currencyNamespace": "sJtMFPOx", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1980-10-04T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1978-08-21T00:00:00Z", "discountedPrice": 89, "expireAt": "1993-12-30T00:00:00Z", "price": 52, "purchaseAt": "1981-07-16T00:00:00Z", "trialPrice": 63}]}}, {"itemIdentities": ["5HtPbArW", "bB9dnpbx", "qTzAgsZQ"], "itemIdentityType": "ITEM_ID", "regionData": {"xVfcthQ1": [{"currencyCode": "6dsp58cg", "currencyNamespace": "JvS0nmKc", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1992-11-30T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1999-11-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1976-09-15T00:00:00Z", "price": 37, "purchaseAt": "1975-04-01T00:00:00Z", "trialPrice": 54}, {"currencyCode": "SVgjVKt8", "currencyNamespace": "4CDRBd34", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1981-05-15T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1977-03-21T00:00:00Z", "discountedPrice": 100, "expireAt": "1986-04-10T00:00:00Z", "price": 77, "purchaseAt": "1975-01-25T00:00:00Z", "trialPrice": 67}, {"currencyCode": "tc7KDzgp", "currencyNamespace": "VO9Walnv", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1975-10-31T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1974-05-26T00:00:00Z", "discountedPrice": 51, "expireAt": "1987-07-31T00:00:00Z", "price": 81, "purchaseAt": "1978-07-15T00:00:00Z", "trialPrice": 56}], "BPLj0b7V": [{"currencyCode": "1Li9km8M", "currencyNamespace": "Kx0XPFk9", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1999-01-18T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1983-07-30T00:00:00Z", "discountedPrice": 94, "expireAt": "1978-03-05T00:00:00Z", "price": 8, "purchaseAt": "1981-03-15T00:00:00Z", "trialPrice": 76}, {"currencyCode": "dDBOsX8l", "currencyNamespace": "visiU5bK", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1993-02-12T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1993-09-14T00:00:00Z", "discountedPrice": 8, "expireAt": "1981-04-03T00:00:00Z", "price": 50, "purchaseAt": "1974-05-29T00:00:00Z", "trialPrice": 66}, {"currencyCode": "FmC2Iroz", "currencyNamespace": "DeeyZTqF", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1999-09-22T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1981-11-15T00:00:00Z", "discountedPrice": 63, "expireAt": "1985-04-18T00:00:00Z", "price": 98, "purchaseAt": "1971-03-31T00:00:00Z", "trialPrice": 1}], "1qeBwO4s": [{"currencyCode": "EkLWqjG5", "currencyNamespace": "kEgpqQaT", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1993-12-08T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1973-02-05T00:00:00Z", "discountedPrice": 93, "expireAt": "1973-08-03T00:00:00Z", "price": 86, "purchaseAt": "1998-01-24T00:00:00Z", "trialPrice": 20}, {"currencyCode": "dUVBpQZT", "currencyNamespace": "m0WUfAPo", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1973-10-05T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1976-09-04T00:00:00Z", "discountedPrice": 84, "expireAt": "1981-08-23T00:00:00Z", "price": 25, "purchaseAt": "1996-01-24T00:00:00Z", "trialPrice": 28}, {"currencyCode": "IjxyL4oo", "currencyNamespace": "an8uaSHP", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1990-08-10T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1992-05-18T00:00:00Z", "discountedPrice": 44, "expireAt": "1979-10-01T00:00:00Z", "price": 66, "purchaseAt": "1981-08-14T00:00:00Z", "trialPrice": 46}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '26' \
    --offset '41' \
    --sortBy 'Wf1LyRiz' \
    --storeId 'vO3ee1Nc' \
    --keyword 'rsx9HtYw' \
    --language '6u5Eq7W8' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '38' \
    --offset '37' \
    --sortBy 'updatedAt:asc,name:asc,name' \
    --storeId 'zehh1KgZ' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'FTDJLwTW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'MFYN48Hu' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'NMkInrd8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4qr5alFd' \
    --body '{"appId": "eTpjw2Cg", "appType": "DLC", "baseAppId": "W2rAs8mv", "boothName": "ncbu1Lu7", "categoryPath": "jq9t7x5L", "clazz": "aVj3fZ3d", "displayOrder": 24, "entitlementType": "DURABLE", "ext": {"0FaWbTD6": {}, "D8oRHKyX": {}, "uhtsDCMk": {}}, "features": ["28zMlGeF", "WhzkRUAR", "KW9Vi0Eb"], "flexible": true, "images": [{"as": "6QO9zcAf", "caption": "4ouQ2Tnu", "height": 31, "imageUrl": "h959AgsT", "smallImageUrl": "txqq3ucU", "width": 46}, {"as": "Tb39cIMk", "caption": "mNckGtdA", "height": 29, "imageUrl": "K1LK978i", "smallImageUrl": "EsWu1is7", "width": 14}, {"as": "M7l8N3rq", "caption": "kNffLAIj", "height": 93, "imageUrl": "ccCtn8kr", "smallImageUrl": "gFSiF4Mt", "width": 53}], "inventoryConfig": {"customAttributes": {"CU8IRjli": {}, "gqytB8AW": {}, "ddUv6boF": {}}, "serverCustomAttributes": {"tcDbWFMU": {}, "R4sTi0eL": {}, "oPCAGVpF": {}}, "slotUsed": 67}, "itemIds": ["8ZYDtYQ9", "42nUGXJA", "6zQP60Rm"], "itemQty": {"KZ2RsKfy": 99, "nqEmshfL": 71, "DWJuGjF0": 20}, "itemType": "BUNDLE", "listable": false, "localizations": {"E5V1KmEH": {"description": "dNOCOoCi", "localExt": {"wJigjkN0": {}, "BQs0Ejja": {}, "Zz584ABQ": {}}, "longDescription": "WmRmEaX8", "title": "CUS1qy4m"}, "KfvClQez": {"description": "apoVYcQ7", "localExt": {"eQJEN3tk": {}, "qTrS1088": {}, "ghaf0B7q": {}}, "longDescription": "ONCO1uuN", "title": "HFw1XWwg"}, "ln28qcNE": {"description": "R5a05wAz", "localExt": {"zsybzE7m": {}, "FBhTUEab": {}, "bsMMIXc0": {}}, "longDescription": "3qeffXnd", "title": "h5uYnI06"}}, "lootBoxConfig": {"rewardCount": 87, "rewards": [{"lootBoxItems": [{"count": 31, "duration": 48, "endDate": "1977-07-13T00:00:00Z", "itemId": "QoaLEdbT", "itemSku": "VzhaWy5y", "itemType": "dCJwnXGd"}, {"count": 4, "duration": 97, "endDate": "1980-06-15T00:00:00Z", "itemId": "ZfDRgrIk", "itemSku": "mjBW73gC", "itemType": "FS4AbIcR"}, {"count": 41, "duration": 84, "endDate": "1993-09-02T00:00:00Z", "itemId": "Gq778epD", "itemSku": "KdKYEPOs", "itemType": "LC4Q4qDE"}], "name": "Mx35GlxB", "odds": 0.527031626011644, "type": "REWARD_GROUP", "weight": 49}, {"lootBoxItems": [{"count": 39, "duration": 80, "endDate": "1988-10-09T00:00:00Z", "itemId": "fATTSa06", "itemSku": "KgmKCxS8", "itemType": "H07jvtpb"}, {"count": 37, "duration": 75, "endDate": "1984-10-22T00:00:00Z", "itemId": "W7zhFN4e", "itemSku": "s0tE5jJ2", "itemType": "1VmMtVrv"}, {"count": 7, "duration": 8, "endDate": "1993-10-04T00:00:00Z", "itemId": "AmdgLiAA", "itemSku": "8R8xu3sN", "itemType": "Q0mIB3B6"}], "name": "Uotc7IqR", "odds": 0.36771520346463904, "type": "REWARD", "weight": 50}, {"lootBoxItems": [{"count": 81, "duration": 87, "endDate": "1998-08-27T00:00:00Z", "itemId": "I4qFRNyN", "itemSku": "EEGxDbnY", "itemType": "gVR5EeLr"}, {"count": 50, "duration": 65, "endDate": "1977-05-17T00:00:00Z", "itemId": "l9IeTLaT", "itemSku": "pUIYrpUI", "itemType": "koe3Ud3O"}, {"count": 85, "duration": 92, "endDate": "1989-07-29T00:00:00Z", "itemId": "kTSKYALd", "itemSku": "5M8kXV88", "itemType": "bUxrjOMF"}], "name": "JcZKMgjJ", "odds": 0.4985717461827254, "type": "REWARD_GROUP", "weight": 100}], "rollFunction": "CUSTOM"}, "maxCount": 44, "maxCountPerUser": 18, "name": "4uZV9fsv", "optionBoxConfig": {"boxItems": [{"count": 19, "duration": 32, "endDate": "1998-06-27T00:00:00Z", "itemId": "1rrsP6SC", "itemSku": "LbNZ7QKk", "itemType": "qotmgBC7"}, {"count": 97, "duration": 82, "endDate": "1997-05-02T00:00:00Z", "itemId": "pOlxt5tR", "itemSku": "32Byos34", "itemType": "f5nTNVxZ"}, {"count": 95, "duration": 7, "endDate": "1998-08-14T00:00:00Z", "itemId": "aGjl52jJ", "itemSku": "4VItE46F", "itemType": "IZ2flPOV"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 79, "fixedTrialCycles": 100, "graceDays": 81}, "regionData": {"4ka4vNNs": [{"currencyCode": "O6teHxTv", "currencyNamespace": "RQbvgjiN", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1994-08-28T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1993-08-08T00:00:00Z", "expireAt": "1992-11-22T00:00:00Z", "price": 3, "purchaseAt": "1992-04-02T00:00:00Z", "trialPrice": 50}, {"currencyCode": "wRz5lF3R", "currencyNamespace": "nHEIdwY4", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1972-01-01T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1992-03-04T00:00:00Z", "expireAt": "1995-08-08T00:00:00Z", "price": 94, "purchaseAt": "1998-06-24T00:00:00Z", "trialPrice": 77}, {"currencyCode": "usC3bdDI", "currencyNamespace": "9KJIBM8m", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1998-08-03T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1980-12-06T00:00:00Z", "expireAt": "1974-01-07T00:00:00Z", "price": 38, "purchaseAt": "1987-12-13T00:00:00Z", "trialPrice": 97}], "Qc7jcYeZ": [{"currencyCode": "sGoQcRXi", "currencyNamespace": "Axys6f0r", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1977-11-04T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1976-01-18T00:00:00Z", "expireAt": "1971-05-16T00:00:00Z", "price": 94, "purchaseAt": "1975-07-02T00:00:00Z", "trialPrice": 25}, {"currencyCode": "o9mMrgdz", "currencyNamespace": "R7qnf7Wi", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1979-10-28T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1997-04-27T00:00:00Z", "expireAt": "1982-10-26T00:00:00Z", "price": 93, "purchaseAt": "1986-04-25T00:00:00Z", "trialPrice": 94}, {"currencyCode": "8hweuLui", "currencyNamespace": "YUdhFN5y", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1975-11-05T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1988-07-29T00:00:00Z", "expireAt": "1989-11-10T00:00:00Z", "price": 68, "purchaseAt": "1998-11-13T00:00:00Z", "trialPrice": 69}], "3n9KeTZy": [{"currencyCode": "LD8gSiCL", "currencyNamespace": "aAxEko2r", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1998-12-24T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1975-02-12T00:00:00Z", "expireAt": "1997-08-22T00:00:00Z", "price": 51, "purchaseAt": "1992-08-25T00:00:00Z", "trialPrice": 59}, {"currencyCode": "67C5eZ4u", "currencyNamespace": "cf8WwHYy", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1991-10-26T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1978-10-09T00:00:00Z", "expireAt": "1999-05-17T00:00:00Z", "price": 62, "purchaseAt": "1974-11-05T00:00:00Z", "trialPrice": 29}, {"currencyCode": "XVwmJmMA", "currencyNamespace": "Xoy10Orx", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-03-22T00:00:00Z", "expireAt": "1975-08-07T00:00:00Z", "price": 75, "purchaseAt": "1985-09-04T00:00:00Z", "trialPrice": 79}]}, "saleConfig": {"currencyCode": "uiyfNFmt", "price": 67}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "ygFv3nSI", "stackable": true, "status": "ACTIVE", "tags": ["AuItsXmW", "cR32LD6b", "dZKdRGNp"], "targetCurrencyCode": "Yc7Xekr9", "targetNamespace": "wubWYppG", "thumbnailUrl": "ryX7HZ2x", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'rQY13RiY' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,IAP,ENTITLEMENT' \
    --force  \
    --storeId 'yf0RIggO' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'A40mSQpr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 8, "orderNo": "2aXg4SFt"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'JSv66x3o' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EJux5FUK' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'TMi677Qo' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WMSrllBY' \
    --body '{"carousel": [{"alt": "S1e2bJjL", "previewUrl": "rpLttuYa", "thumbnailUrl": "1wah5ICV", "type": "video", "url": "Hxhin0hr", "videoSource": "youtube"}, {"alt": "OFj0Wh30", "previewUrl": "h40kFPUH", "thumbnailUrl": "LPlMy8GR", "type": "image", "url": "o2hEODJJ", "videoSource": "generic"}, {"alt": "LoAQTJkV", "previewUrl": "hJkobgZI", "thumbnailUrl": "cwo1iBP5", "type": "image", "url": "PqkZumKy", "videoSource": "vimeo"}], "developer": "IGTC59YV", "forumUrl": "MLU7HNs5", "genres": ["Action", "Racing", "Strategy"], "localizations": {"HxFxeMio": {"announcement": "Z7J6zfGC", "slogan": "1h1f8FIZ"}, "H7HO715t": {"announcement": "7lGFkvx3", "slogan": "itbGcMtr"}, "kRBmBU7o": {"announcement": "yV014FSM", "slogan": "4lLpaDeH"}}, "platformRequirements": {"oTo1pUeC": [{"additionals": "LvTaDUwW", "directXVersion": "FKDceBvQ", "diskSpace": "ehUtfIzF", "graphics": "2LIUOiNk", "label": "3RP8n6jz", "osVersion": "oqbLpnmb", "processor": "rnQnctix", "ram": "bPO2n4aj", "soundCard": "Cz7v57T2"}, {"additionals": "zxjrKLQy", "directXVersion": "7pHRrkqC", "diskSpace": "51oPWyQT", "graphics": "FRocTGgK", "label": "oAPx26j1", "osVersion": "grWxYP4m", "processor": "OllqNSl8", "ram": "hemS7bqP", "soundCard": "kS0KVwDd"}, {"additionals": "fZGpxOik", "directXVersion": "CQaPn4xj", "diskSpace": "uXsWLW0B", "graphics": "Pc3J2fQv", "label": "tMct5ISW", "osVersion": "DZDyfN5B", "processor": "Ihw6dxrt", "ram": "VSqmJZ1S", "soundCard": "p2Pl96Zt"}], "REsCX3XO": [{"additionals": "JAeiODhN", "directXVersion": "we2rbwSY", "diskSpace": "1kc6pc6e", "graphics": "vdP8K3Xq", "label": "2msYbXV5", "osVersion": "lUvIwRST", "processor": "Kn51quWI", "ram": "9BumJ8eY", "soundCard": "nsROWSHy"}, {"additionals": "wD07Gh4B", "directXVersion": "W1mNo3N1", "diskSpace": "IkqrbGt6", "graphics": "lcQwR4Un", "label": "G8u0tHd4", "osVersion": "TQLhk9QG", "processor": "Vt3bMFFr", "ram": "PUFJfD43", "soundCard": "gZ6R4lvr"}, {"additionals": "5CY5chdD", "directXVersion": "2rErZdsG", "diskSpace": "olYwdgvK", "graphics": "ULmkgLGc", "label": "Kp8rnOjk", "osVersion": "zmDovij1", "processor": "XgKQzeTv", "ram": "KUvMjzWI", "soundCard": "w02j8Afi"}], "5nVwYmFU": [{"additionals": "HsSwUYIX", "directXVersion": "kcKJ3zgz", "diskSpace": "t5zfiNvJ", "graphics": "eA0D8PvA", "label": "YFRvuJo0", "osVersion": "adafOzYK", "processor": "GG5R2P02", "ram": "6YeesfiN", "soundCard": "vOYKUeF7"}, {"additionals": "23EMgP6O", "directXVersion": "yIH6RBeQ", "diskSpace": "91MSYo5U", "graphics": "rXUzTBYV", "label": "0KrbfnnY", "osVersion": "TFxpLSAi", "processor": "uquBoPYf", "ram": "CrzsCR6O", "soundCard": "h5af522H"}, {"additionals": "7EbyRWcs", "directXVersion": "ETGLrTWz", "diskSpace": "BahB7Pms", "graphics": "OiWxgK0f", "label": "j1SSc5eA", "osVersion": "ZUzIjmWp", "processor": "jKIfKaFg", "ram": "VxGa0wXV", "soundCard": "RX0YtXPz"}]}, "platforms": ["MacOS", "IOS", "Android"], "players": ["LocalCoop", "Single", "Multi"], "primaryGenre": "Simulation", "publisher": "TES4Luwq", "releaseDate": "1978-04-19T00:00:00Z", "websiteUrl": "DaIlqPTH"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '70HWs5B7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Otex73HW' \
    --body '{"featuresToCheck": ["CATALOG", "DLC"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'zyJPiaPm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'v0OlDPWW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GVWTUHtH' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '3ipb2jrn' \
    --itemId 'GayilfdW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zfVlwAv7' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'NebdFg5Z' \
    --itemId '7OAt8JC0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xmvyqqCN' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'CHdQaB0Q' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'xPq4Hngv' \
    --populateBundle  \
    --region '0EL2Lak2' \
    --storeId '57BmTVS6' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'c7eYu1C8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fnWoXqEr' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 10, "code": "Twpbypou", "comparison": "isGreaterThanOrEqual", "name": "Sq7BXOwP", "predicateType": "SeasonTierPredicate", "value": "P797F7uN", "values": ["DegbcbIj", "7MBY5ZNC", "DB2hZCm3"]}, {"anyOf": 35, "code": "4tag4O6s", "comparison": "isGreaterThan", "name": "1aWOq7wj", "predicateType": "StatisticCodePredicate", "value": "3XlAVOjd", "values": ["RTHSjtpd", "l8OK2yYs", "N7SlwVwI"]}, {"anyOf": 17, "code": "GpRA8td7", "comparison": "isLessThanOrEqual", "name": "muie52RL", "predicateType": "SeasonTierPredicate", "value": "9cmHb0UG", "values": ["IGeCYRST", "Q5q8bBvY", "gUSot7l0"]}]}, {"operator": "or", "predicates": [{"anyOf": 60, "code": "8SUY3Tn2", "comparison": "isGreaterThan", "name": "4csDQalf", "predicateType": "SeasonTierPredicate", "value": "MZ5UlxjD", "values": ["xqobg8Kp", "txDr0kZJ", "bD9xxyfK"]}, {"anyOf": 80, "code": "k6Bx3rIy", "comparison": "isNot", "name": "TALNglZe", "predicateType": "StatisticCodePredicate", "value": "GlB4aJ4t", "values": ["J4mTZIEp", "7aSCbvJp", "crZVnoW4"]}, {"anyOf": 57, "code": "ulTuOkVI", "comparison": "isNot", "name": "bFV7bFNP", "predicateType": "SeasonPassPredicate", "value": "Pb825Vap", "values": ["81Vbmxvb", "w7pC7nOP", "dSBw6Dxa"]}]}, {"operator": "and", "predicates": [{"anyOf": 80, "code": "eXymrE38", "comparison": "excludes", "name": "ACpHn7mS", "predicateType": "SeasonTierPredicate", "value": "K8nqcDje", "values": ["RAM5LM0d", "4s1GmaCR", "8i7YADKq"]}, {"anyOf": 57, "code": "3pbexBTU", "comparison": "isNot", "name": "BGkZmnsh", "predicateType": "SeasonTierPredicate", "value": "GuYpqDN9", "values": ["YYLbIcKa", "LrITWrtr", "xtZpK1qK"]}, {"anyOf": 81, "code": "rchlT9HF", "comparison": "isGreaterThanOrEqual", "name": "gOCTMtKa", "predicateType": "EntitlementPredicate", "value": "GxkmA053", "values": ["LdqO713N", "CwxYjXcb", "BM1Xj0IL"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'ONI2tm70' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'REWARD,CATALOG,DLC' \
    --storeId 'JnZyA2K9' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'z2UhtxHm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "QZObeFo6"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --name 'C6I7VKGO' \
    --offset '46' \
    --tag 'DSApIDO6' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uc3hvNm0", "name": "HNck3aRt", "status": "INACTIVE", "tags": ["DvVtcdmr", "jlltAvdg", "kcbn4ogw"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'z1kKFKTy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'CHawwpuD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "g8zrTHMd", "name": "Wy0X4xM2", "status": "INACTIVE", "tags": ["pbA2Mxrt", "w0HLAWjw", "HmSvyyDu"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'elGglXGI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'MR1zRVww' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '37' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'reaL9f7B' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '39GNYBwp' \
    --limit '62' \
    --offset '54' \
    --orderNos '1QzVPPOg,pdWpg0MT,PB8sur5N' \
    --sortBy 'fQ9Mz8BJ' \
    --startTime '9zsnJGeX' \
    --status 'CHARGED' \
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
    --orderNo '6yIXRvKi' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1KSgrjM4' \
    --body '{"description": "0LMCeTSX"}' \
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
    --body '{"domains": ["eEZJjOA5", "rL7Ed9eE", "pnFpShrv"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'DMVGChHR' \
    --externalId 'lCaMADag' \
    --limit '37' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'cgVsbbkq' \
    --offset '30' \
    --paymentOrderNo 'apXG1shZ' \
    --startDate 't4wrB78L' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'KqlFxFEU' \
    --limit '55' \
    --offset '80' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "NEn8eDFX", "currencyNamespace": "yNXICpHO", "customParameters": {"R3ZlXKJ3": {}, "89rfqpW3": {}, "F9Mjnofg": {}}, "description": "k4uGbrmi", "extOrderNo": "tvHg7Pbh", "extUserId": "m4UpkA3g", "itemType": "COINS", "language": "PF_Qsid-Sa", "metadata": {"q2Iv3lLk": "iRhl3GwS", "7yP5hEZR": "qHWfYYZm", "7fNuXs5O": "5RCeglYY"}, "notifyUrl": "QQT1rFU1", "omitNotification": false, "platform": "fm10y78k", "price": 77, "recurringPaymentOrderNo": "YDZfFCKt", "region": "ZBqBjczd", "returnUrl": "LiPVph2B", "sandbox": false, "sku": "Y1yT42g1", "subscriptionId": "n77gBlgp", "targetNamespace": "hIU4iy7A", "targetUserId": "09Xa600v", "title": "jGnpNqIf"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'L8WTdFFS' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dazvvo5L' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pD0LBEK2' \
    --body '{"extTxId": "F8qFiFAL", "paymentMethod": "TttQGSi8", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZUs77y3m' \
    --body '{"description": "IPjiFyai"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QgeYdbG9' \
    --body '{"amount": 48, "currencyCode": "MHLymSH2", "notifyType": "REFUND", "paymentProvider": "WALLET", "salesTax": 45, "vat": 39}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Atu27kWo' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'fnfL9NRX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "kbVco87Q", "serviceLabel": 65}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'fqr3NLxT' \
    --body '{"delegationToken": "VTF0bsR0", "sandboxId": "LGzKyofn"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["Other", "Other", "Other"]}' \
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
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Epic", "Other", "Twitch"]}' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime 'nTeLQUn9' \
    --limit '77' \
    --offset '70' \
    --source 'IAP' \
    --startTime 'OFoX3zz8' \
    --status 'FAIL' \
    --transactionId 'Wiov2YNS' \
    --userId 'LOgjSZzD' \
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
    --body '{"appConfig": {"appName": "dUjMWfjl"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "73yqSHBu"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateRevocationPluginConfig' test.out

#- 194 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'DeleteRevocationPluginConfig' test.out

#- 195 UploadRevocationPluginConfigCertV2
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCertV2 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCertV2' test.out

#- 196 UploadRevocationPluginConfigCert
eval_tap 0 196 'UploadRevocationPluginConfigCert # SKIP deprecated' test.out

#- 197 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "KZudLjCU", "eventTopic": "TWsSDLST", "maxAwarded": 19, "maxAwardedPerUser": 12, "namespaceExpression": "BZG7uM0C", "rewardCode": "WF9dlORm", "rewardConditions": [{"condition": "SY58h7RV", "conditionName": "EKWB0zN5", "eventName": "yvcN3rGi", "rewardItems": [{"duration": 68, "endDate": "1982-09-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0Yzks0pm", "quantity": 43, "sku": "hdvgouDL"}, {"duration": 42, "endDate": "1974-08-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "3cUoYLK8", "quantity": 90, "sku": "a9QgJBaF"}, {"duration": 50, "endDate": "1991-11-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "oH7Ua49L", "quantity": 69, "sku": "5Z2CHe8F"}]}, {"condition": "C58iXK0v", "conditionName": "V17juHzd", "eventName": "maGruj6Y", "rewardItems": [{"duration": 42, "endDate": "1984-01-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "949MIzlA", "quantity": 61, "sku": "CJtTxT2j"}, {"duration": 96, "endDate": "1995-01-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nCGtvTbi", "quantity": 76, "sku": "mbZPehXP"}, {"duration": 52, "endDate": "1996-08-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "loP9kY3v", "quantity": 69, "sku": "qji5PAEa"}]}, {"condition": "LSrWX4rc", "conditionName": "p6lCNkVm", "eventName": "Pbou1tZp", "rewardItems": [{"duration": 34, "endDate": "1990-02-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "FznHdfLv", "quantity": 5, "sku": "EeSC3Myb"}, {"duration": 74, "endDate": "1981-07-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "4E3rc2AJ", "quantity": 21, "sku": "jyNtfORV"}, {"duration": 71, "endDate": "1979-07-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6Wl8joSD", "quantity": 99, "sku": "1jFr50th"}]}], "userIdExpression": "M4tM7TkP"}' \
    > test.out 2>&1
eval_tap $? 197 'CreateReward' test.out

#- 198 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'fsG9TUNU' \
    --limit '4' \
    --offset '3' \
    --sortBy 'rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 198 'QueryRewards' test.out

#- 199 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'ExportRewards' test.out

#- 200 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 200 'ImportRewards' test.out

#- 201 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HK2hOTnw' \
    > test.out 2>&1
eval_tap $? 201 'GetReward' test.out

#- 202 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ht6A8QcY' \
    --body '{"description": "m2vhu2bB", "eventTopic": "PxRuRR7Y", "maxAwarded": 79, "maxAwardedPerUser": 14, "namespaceExpression": "cvni9h0F", "rewardCode": "VHH6nQWa", "rewardConditions": [{"condition": "lEkk6OWa", "conditionName": "VoQ7bIfR", "eventName": "moIQ4HNT", "rewardItems": [{"duration": 75, "endDate": "1975-07-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ELHgGbiM", "quantity": 48, "sku": "zmHWH0Sk"}, {"duration": 56, "endDate": "1975-12-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "SHP8cenL", "quantity": 2, "sku": "sQlKeyIJ"}, {"duration": 58, "endDate": "1993-02-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "eAOnE8QH", "quantity": 33, "sku": "mUVO3nLk"}]}, {"condition": "QPDbyQoi", "conditionName": "AOtGWqpm", "eventName": "OTvbL2Px", "rewardItems": [{"duration": 22, "endDate": "1973-08-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "GyOEWKjI", "quantity": 5, "sku": "VrlRwRTn"}, {"duration": 14, "endDate": "1997-03-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "pJLvHhzX", "quantity": 21, "sku": "uPodMwTQ"}, {"duration": 46, "endDate": "1990-04-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "bF7XfIDQ", "quantity": 95, "sku": "J6OC1fG1"}]}, {"condition": "ikY7HL8o", "conditionName": "G0HdvCJN", "eventName": "DoPvasXZ", "rewardItems": [{"duration": 3, "endDate": "1997-01-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "WLTXE4GG", "quantity": 34, "sku": "yxSsZReu"}, {"duration": 6, "endDate": "1991-08-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MGNGDcQy", "quantity": 26, "sku": "jcNzw4HM"}, {"duration": 34, "endDate": "1981-08-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "W1olmnap", "quantity": 89, "sku": "3nCanRrE"}]}], "userIdExpression": "Vd2nBd0g"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateReward' test.out

#- 203 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zGESFcEf' \
    > test.out 2>&1
eval_tap $? 203 'DeleteReward' test.out

#- 204 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OkoCfcDm' \
    --body '{"payload": {"u7f0w3OZ": {}, "ndDy61hn": {}, "Q6nWwBUJ": {}}}' \
    > test.out 2>&1
eval_tap $? 204 'CheckEventCondition' test.out

#- 205 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'imOlAsm0' \
    --body '{"conditionName": "8haHSxwT", "userId": "wpIjo6re"}' \
    > test.out 2>&1
eval_tap $? 205 'DeleteRewardConditionRecord' test.out

#- 206 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'XF7gXaKu' \
    --limit '35' \
    --offset '50' \
    --start 'NC4l9GxF' \
    --storeId 'bTyxdQ7a' \
    --viewId 'qcmmYPIn' \
    > test.out 2>&1
eval_tap $? 206 'QuerySections' test.out

#- 207 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZTX2P7KN' \
    --body '{"active": true, "displayOrder": 47, "endDate": "1977-02-03T00:00:00Z", "ext": {"kjYEAIK4": {}, "uvQfdHhO": {}, "3fuuiwrc": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 10, "itemCount": 31, "rule": "SEQUENCE"}, "items": [{"id": "BeMoOjxQ", "sku": "QiWpv859"}, {"id": "GnApk9gS", "sku": "jnLrEnWU"}, {"id": "Beuj0Ngv", "sku": "MVzFIkoH"}], "localizations": {"MeXsRBHR": {"description": "oSCjl1MR", "localExt": {"WkcyIdnI": {}, "qm2Sfxkm": {}, "wWcK6RzW": {}}, "longDescription": "fBAnCGz0", "title": "BmlVmJLa"}, "VFwj5Pa1": {"description": "7eKrx8ml", "localExt": {"gYeHMFCu": {}, "HDbdqHJ1": {}, "ctI18jgJ": {}}, "longDescription": "mopRkQFa", "title": "2XXyeQKF"}, "TLQnqMSa": {"description": "co6q1NKN", "localExt": {"oIbn7hOY": {}, "lZe7IyRd": {}, "Lj3gKnzd": {}}, "longDescription": "Gfqz4Nqh", "title": "GJUkwhZf"}}, "name": "qiQKlxUP", "rotationType": "FIXED_PERIOD", "startDate": "1993-04-25T00:00:00Z", "viewId": "ueI529mQ"}' \
    > test.out 2>&1
eval_tap $? 207 'CreateSection' test.out

#- 208 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a0L42BjE' \
    > test.out 2>&1
eval_tap $? 208 'PurgeExpiredSection' test.out

#- 209 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '4u2Kygs1' \
    --storeId 'VYdDQSLC' \
    > test.out 2>&1
eval_tap $? 209 'GetSection' test.out

#- 210 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '51Bb3mAe' \
    --storeId 'CA99NWAT' \
    --body '{"active": false, "displayOrder": 86, "endDate": "1973-01-04T00:00:00Z", "ext": {"t6QUvbq3": {}, "4BAcJSaF": {}, "ekhm44fk": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 41, "itemCount": 47, "rule": "SEQUENCE"}, "items": [{"id": "VA5Hpnzh", "sku": "Gn1r6CAl"}, {"id": "xUqkAdmL", "sku": "JQI5EFfs"}, {"id": "OJrq5rHz", "sku": "GSlV6bGq"}], "localizations": {"H4OTpExE": {"description": "y6aE2sxI", "localExt": {"61OOSxTL": {}, "WdBTPpSo": {}, "BH3lYrnV": {}}, "longDescription": "5lfsn3TS", "title": "vEoZqyzg"}, "yMVTRPrv": {"description": "GMWACwxG", "localExt": {"BR3uX0vn": {}, "QzxP5w5x": {}, "W9UBwX5b": {}}, "longDescription": "hoYEK8fB", "title": "XduvNN1K"}, "oo1j8DPm": {"description": "0usYjPwA", "localExt": {"gM6bMcCv": {}, "26X3J970": {}, "qidwD5QM": {}}, "longDescription": "DYLnD6sx", "title": "4E0ynyzy"}}, "name": "eWVZgCbl", "rotationType": "FIXED_PERIOD", "startDate": "1980-01-02T00:00:00Z", "viewId": "o7ry2E2R"}' \
    > test.out 2>&1
eval_tap $? 210 'UpdateSection' test.out

#- 211 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'j1Z9Uc7S' \
    --storeId '4H8bS6BK' \
    > test.out 2>&1
eval_tap $? 211 'DeleteSection' test.out

#- 212 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'ListStores' test.out

#- 213 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "b3fAc691", "defaultRegion": "0ehDV8Yq", "description": "XBNPE2PA", "supportedLanguages": ["guGKQeP9", "oTtJzfso", "OkXuIYuQ"], "supportedRegions": ["eCYIDCoc", "8Uxnrxaw", "8abBXS7H"], "title": "oYHXCZhd"}' \
    > test.out 2>&1
eval_tap $? 213 'CreateStore' test.out

#- 214 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 214 'GetCatalogDefinition' test.out

#- 215 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 215 'DownloadCSVTemplates' test.out

#- 216 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["salXIGBy", "o284BvZ8", "nsUisraL"], "idsToBeExported": ["e1okZED1", "107YUYIR", "d2aQcs02"], "storeId": "7FhQP6Nr"}' \
    > test.out 2>&1
eval_tap $? 216 'ExportStoreByCSV' test.out

#- 217 ImportStore
eval_tap 0 217 'ImportStore # SKIP deprecated' test.out

#- 218 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetPublishedStore' test.out

#- 219 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'DeletePublishedStore' test.out

#- 220 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetPublishedStoreBackup' test.out

#- 221 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 221 'RollbackPublishedStore' test.out

#- 222 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VdewugDu' \
    > test.out 2>&1
eval_tap $? 222 'GetStore' test.out

#- 223 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BBIhu03c' \
    --body '{"defaultLanguage": "Q2M5zFeI", "defaultRegion": "U4eTl4TP", "description": "Rnhj4pI6", "supportedLanguages": ["JcLiLZjs", "PFfi3aAo", "jbNqQxo3"], "supportedRegions": ["T1VN8r75", "xN4XbtfR", "kb2ztnaY"], "title": "7L6vtBra"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateStore' test.out

#- 224 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XwYKC8Gj' \
    > test.out 2>&1
eval_tap $? 224 'DeleteStore' test.out

#- 225 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sKNIfmtJ' \
    --action 'UPDATE' \
    --itemSku 'oHv5ATOC' \
    --itemType 'OPTIONBOX' \
    --limit '20' \
    --offset '70' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'ZsmHC4t0' \
    --updatedAtStart 'f1LIJKrN' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 225 'QueryChanges' test.out

#- 226 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cWyY8EmE' \
    > test.out 2>&1
eval_tap $? 226 'PublishAll' test.out

#- 227 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KCs62UMw' \
    > test.out 2>&1
eval_tap $? 227 'PublishSelected' test.out

#- 228 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gkhXmRTN' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecords' test.out

#- 229 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '66xDSpPO' \
    --action 'CREATE' \
    --itemSku '8vK4fscJ' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd 'JwahjSe0' \
    --updatedAtStart 'n5Suqjti' \
    > test.out 2>&1
eval_tap $? 229 'SelectAllRecordsByCriteria' test.out

#- 230 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '4iqYBkp7' \
    --action 'DELETE' \
    --itemSku 'ArUqk5PM' \
    --itemType 'SUBSCRIPTION' \
    --type 'ITEM' \
    --updatedAtEnd 'Fa4QmdTU' \
    --updatedAtStart 'QyyVJt8T' \
    > test.out 2>&1
eval_tap $? 230 'GetStatistic' test.out

#- 231 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J0TnW3oc' \
    > test.out 2>&1
eval_tap $? 231 'UnselectAllRecords' test.out

#- 232 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'PqOuv65r' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2kdRmVYT' \
    > test.out 2>&1
eval_tap $? 232 'SelectRecord' test.out

#- 233 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'YJkGx6dY' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7HOnJmss' \
    > test.out 2>&1
eval_tap $? 233 'UnselectRecord' test.out

#- 234 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UKHKGc8m' \
    --targetStoreId 'yM7hlNXB' \
    > test.out 2>&1
eval_tap $? 234 'CloneStore' test.out

#- 235 ExportStore
eval_tap 0 235 'ExportStore # SKIP deprecated' test.out

#- 236 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M8efm6FM' \
    --end 'SKcBqKwV' \
    --limit '24' \
    --offset '69' \
    --sortBy 'YEjkVJIW' \
    --start 'ISDABB9R' \
    --success  \
    > test.out 2>&1
eval_tap $? 236 'QueryImportHistory' test.out

#- 237 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '63q0DN5i' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'MEzRZS46' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 237 'ImportStoreByCSV' test.out

#- 238 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'SoAuKhQA' \
    --limit '82' \
    --offset '20' \
    --sku 'nq4HpB00' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId '1PQDTF8m' \
    > test.out 2>&1
eval_tap $? 238 'QuerySubscriptions' test.out

#- 239 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Hhwo5O0v' \
    > test.out 2>&1
eval_tap $? 239 'RecurringChargeSubscription' test.out

#- 240 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '65btcgBy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'GetTicketDynamic' test.out

#- 241 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'kTWMgllk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "5LMXU4Fo"}' \
    > test.out 2>&1
eval_tap $? 241 'DecreaseTicketSale' test.out

#- 242 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'SgwAXP24' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'GetTicketBoothID' test.out

#- 243 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'yhFMHh1D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 42, "orderNo": "UiSvq4cZ"}' \
    > test.out 2>&1
eval_tap $? 243 'IncreaseTicketSale' test.out

#- 244 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 96, "currencyCode": "sy5WuMj9", "expireAt": "1982-05-26T00:00:00Z"}, "debitPayload": {"count": 62, "currencyCode": "tDQVlDjP", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 3, "entitlementCollectionId": "vtO538YL", "entitlementOrigin": "Playstation", "itemIdentity": "9UT1bZgz", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 61, "entitlementId": "wOP2Kgf0"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 0, "currencyCode": "RRJIlwWN", "expireAt": "1998-05-10T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "bnVmKgui", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 3, "entitlementCollectionId": "6gG2P0cC", "entitlementOrigin": "Playstation", "itemIdentity": "TpmjW4fD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "PyX6qGpI"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 26, "currencyCode": "K9S4gZoM", "expireAt": "1973-11-14T00:00:00Z"}, "debitPayload": {"count": 50, "currencyCode": "nRXGSeDf", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 32, "entitlementCollectionId": "k9V3nicU", "entitlementOrigin": "Oculus", "itemIdentity": "ohVwAhU6", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 95, "entitlementId": "rWZIFdaJ"}, "type": "DEBIT_WALLET"}], "userId": "7Z6uOW9h"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 81, "currencyCode": "OByKpv2s", "expireAt": "1995-07-24T00:00:00Z"}, "debitPayload": {"count": 49, "currencyCode": "dCyOuQZ1", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 55, "entitlementCollectionId": "gfWyefhe", "entitlementOrigin": "GooglePlay", "itemIdentity": "iH4f761w", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 84, "entitlementId": "lWaHZWl3"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 61, "currencyCode": "L5W9Ngwk", "expireAt": "1976-12-13T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "o2Y7hv2h", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 16, "entitlementCollectionId": "0H24MMl0", "entitlementOrigin": "System", "itemIdentity": "qDJTRi46", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 0, "entitlementId": "fAnMyTIw"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 65, "currencyCode": "Fm7eDvXT", "expireAt": "1976-12-07T00:00:00Z"}, "debitPayload": {"count": 87, "currencyCode": "ZhdxmYrt", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "gMzwzi1y", "entitlementOrigin": "Steam", "itemIdentity": "A4Ejbqfl", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 71, "entitlementId": "vOLyFw8M"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "oMhIsF1W"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 6, "currencyCode": "6YTuA639", "expireAt": "1991-06-07T00:00:00Z"}, "debitPayload": {"count": 10, "currencyCode": "HqnhIJua", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 76, "entitlementCollectionId": "zK1lwdEs", "entitlementOrigin": "Xbox", "itemIdentity": "U9B9eI7x", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 84, "entitlementId": "m1rNEP7r"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 91, "currencyCode": "IzwulQ0Q", "expireAt": "1976-11-22T00:00:00Z"}, "debitPayload": {"count": 74, "currencyCode": "KfrIHi9M", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 23, "entitlementCollectionId": "WF2naRf7", "entitlementOrigin": "Xbox", "itemIdentity": "y8x4WJ72", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "AtLF0tis"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 85, "currencyCode": "NNNkYVfs", "expireAt": "1994-03-16T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "HSsUE7LO", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 33, "entitlementCollectionId": "m6bS6kh2", "entitlementOrigin": "GooglePlay", "itemIdentity": "Hl1EnjJl", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 1, "entitlementId": "sBkvU5hU"}, "type": "CREDIT_WALLET"}], "userId": "wnxGQ8Li"}], "metadata": {"4JYSBhcI": {}, "y2tHDWdo": {}, "mn8AjmrA": {}}, "needPreCheck": false, "transactionId": "rejpMxFD", "type": "rW2PmzRU"}' \
    > test.out 2>&1
eval_tap $? 244 'Commit' test.out

#- 245 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '11' \
    --status 'INIT' \
    --type 'jNaGvpmE' \
    --userId 'a4L1SGyv' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByCriteria' test.out

#- 246 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'scgNgj2X' \
    > test.out 2>&1
eval_tap $? 246 'GetTradeHistoryByTransactionId' test.out

#- 247 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '1XbuoUoI' \
    --body '{"achievements": [{"id": "77zsXR45", "value": 55}, {"id": "7eCbJnF6", "value": 11}, {"id": "qg4Wf2Cn", "value": 79}], "steamUserId": "IlrrPyUG"}' \
    > test.out 2>&1
eval_tap $? 247 'UnlockSteamUserAchievement' test.out

#- 248 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQQiofef' \
    --xboxUserId '2ARnnYaG' \
    > test.out 2>&1
eval_tap $? 248 'GetXblUserAchievements' test.out

#- 249 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsXghFGR' \
    --body '{"achievements": [{"id": "CFeVCKkV", "percentComplete": 17}, {"id": "6RFvvxL5", "percentComplete": 13}, {"id": "V779fVcV", "percentComplete": 80}], "serviceConfigId": "InX4FXvw", "titleId": "GvdAYBv0", "xboxUserId": "vtwQOROO"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateXblUserAchievement' test.out

#- 250 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '9Cv0izpm' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeCampaign' test.out

#- 251 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQmfnVrg' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeEntitlement' test.out

#- 252 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLFUlHIo' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeFulfillment' test.out

#- 253 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'hsfAVYTh' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeIntegration' test.out

#- 254 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'jE2YmkEv' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizeOrder' test.out

#- 255 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMQllp7w' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizePayment' test.out

#- 256 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '46MMHfSj' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeRevocation' test.out

#- 257 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '01mqb9TP' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeSubscription' test.out

#- 258 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '1fqoHwov' \
    > test.out 2>&1
eval_tap $? 258 'AnonymizeWallet' test.out

#- 259 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwhXjbyH' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLCByPlatform' test.out

#- 260 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QhHzOvLB' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 260 'GetUserDLC' test.out

#- 261 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jpuymutz' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId '24MjiLyV' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'FInDVSCl' \
    --features 'sT558vtn,tsZ1nmQH,c8ZegN2o' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'vqv1yAuS,MjfJ1vZ9,UZx9XYDM' \
    --limit '74' \
    --offset '22' \
    --origin 'IOS' \
    > test.out 2>&1
eval_tap $? 261 'QueryUserEntitlements' test.out

#- 262 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'k6SwJcW3' \
    --body '[{"collectionId": "IDt2TAbz", "endDate": "1995-04-17T00:00:00Z", "grantedCode": "Q5KTzqAX", "itemId": "tVFtxzV5", "itemNamespace": "vIYCu0BG", "language": "rQQ-IexV-321", "metadata": {"KkbPgn2s": {}, "J4uEuWJQ": {}, "LXQaIenX": {}}, "origin": "Playstation", "quantity": 66, "region": "crN7tiLg", "source": "OTHER", "startDate": "1985-06-29T00:00:00Z", "storeId": "7I7VSDmG"}, {"collectionId": "1KVW6XlZ", "endDate": "1993-08-27T00:00:00Z", "grantedCode": "pyfzRiCP", "itemId": "OzdDSrYA", "itemNamespace": "6j4Ecehy", "language": "Rkz-qTuP", "metadata": {"CBCbKvcK": {}, "JMZIve3T": {}, "4rbe618Z": {}}, "origin": "Steam", "quantity": 32, "region": "qpZTNqbm", "source": "PURCHASE", "startDate": "1987-05-05T00:00:00Z", "storeId": "UeJqtwqW"}, {"collectionId": "XE5soTdS", "endDate": "1989-08-11T00:00:00Z", "grantedCode": "HUZGLec7", "itemId": "JuUsEkjI", "itemNamespace": "0qJJFW6Q", "language": "yJh_emTX_736", "metadata": {"MPUAxUBB": {}, "syjbK0y7": {}, "9xBauLes": {}}, "origin": "Epic", "quantity": 1, "region": "WHdsX5nL", "source": "REWARD", "startDate": "1972-09-23T00:00:00Z", "storeId": "ifjGChuy"}]' \
    > test.out 2>&1
eval_tap $? 262 'GrantUserEntitlement' test.out

#- 263 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1ELjYLr' \
    --activeOnly  \
    --appId 'JUYf8Rg3' \
    > test.out 2>&1
eval_tap $? 263 'GetUserAppEntitlementByAppId' test.out

#- 264 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '3FkmQB7N' \
    --activeOnly  \
    --limit '34' \
    --offset '17' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 264 'QueryUserEntitlementsByAppType' test.out

#- 265 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'V3t4QjDh' \
    --ids '2ham6PGf,6DHAkDQa,Qc1sKR7x' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementsByIds' test.out

#- 266 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4Eala0fg' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform '74r1HZ1l' \
    --itemId 'SC7Q20Pi' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementByItemId' test.out

#- 267 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8M9UN0k' \
    --ids 'mDdjyaRP,zGLnWLOW,HoRplMow' \
    --platform 'hxhTyVG7' \
    > test.out 2>&1
eval_tap $? 267 'GetUserActiveEntitlementsByItemIds' test.out

#- 268 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1cgeT2S' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform '6ehkaGoA' \
    --sku 'gylCv3ar' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlementBySku' test.out

#- 269 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'F1ebiMwb' \
    --appIds 'ijlHQ9iG,IDSS1boI,zGvnM719' \
    --itemIds 'lzlMNAwL,5uslAi9y,Mhn0aEON' \
    --platform 'JHZRo11O' \
    --skus 'tXy4eLt4,7LyFFdXv,Utryj9r0' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlement' test.out

#- 270 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vIiwqsOS' \
    --platform '7bldVjfv' \
    --itemIds 'ITdxRqi7,6zZBbslB,qZ1Z8hco' \
    > test.out 2>&1
eval_tap $? 270 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 271 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDfp2KNm' \
    --appId 'pXXSEcoN' \
    > test.out 2>&1
eval_tap $? 271 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 272 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4Y0VpCg8' \
    --entitlementClazz 'CODE' \
    --platform '7O0fybLz' \
    --itemId '7Jg1ScFh' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemId' test.out

#- 273 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'HRbOPXD8' \
    --ids 'zuRQS0fU,qEa9kLfQ,RV2vNI6L' \
    --platform 'kodAatmo' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipByItemIds' test.out

#- 274 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'EBYTuI07' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'r9DNzSza' \
    --sku 'EjpmZyXe' \
    > test.out 2>&1
eval_tap $? 274 'GetUserEntitlementOwnershipBySku' test.out

#- 275 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2RePYJvT' \
    > test.out 2>&1
eval_tap $? 275 'RevokeAllEntitlements' test.out

#- 276 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'egK2EWGv' \
    --entitlementIds 'QW5uKgvd' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlements' test.out

#- 277 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '7KssXEdd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S4291YMb' \
    > test.out 2>&1
eval_tap $? 277 'GetUserEntitlement' test.out

#- 278 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'PbQiqT4g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GiRLlmPV' \
    --body '{"collectionId": "YIp6iXUK", "endDate": "1996-06-25T00:00:00Z", "nullFieldList": ["INU2TAWK", "HyaNoAtk", "pYllfpgk"], "origin": "IOS", "reason": "e5pJ4BWb", "startDate": "1979-02-06T00:00:00Z", "status": "REVOKED", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 278 'UpdateUserEntitlement' test.out

#- 279 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'pkCo7mTI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W70uuRvs' \
    --body '{"metadata": {"Z4d3hG8C": {}, "S1FmOf1p": {}, "YPRAcTK5": {}}, "options": ["OempJ59U", "76qZU0GF", "3w3byJCx"], "platform": "YF1HSQtU", "requestId": "WrLFYEkD", "useCount": 81}' \
    > test.out 2>&1
eval_tap $? 279 'ConsumeUserEntitlement' test.out

#- 280 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'KPaQO2NF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CiJZHJPl' \
    > test.out 2>&1
eval_tap $? 280 'DisableUserEntitlement' test.out

#- 281 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '6D17LtNl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAgOTP7g' \
    > test.out 2>&1
eval_tap $? 281 'EnableUserEntitlement' test.out

#- 282 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'a2P9d2GW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVBu57CL' \
    > test.out 2>&1
eval_tap $? 282 'GetUserEntitlementHistories' test.out

#- 283 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '8941hAQj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KXpV5QYf' \
    --body '{"metadata": {"x0pLGxyz": {}, "a9k387Y5": {}, "383lYIZa": {}}}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlement' test.out

#- 284 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'B9p7aVx5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dAEqBMY9' \
    --body '{"reason": "POpMHub3", "useCount": 10}' \
    > test.out 2>&1
eval_tap $? 284 'RevokeUserEntitlementByUseCount' test.out

#- 285 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'gmeP5mmU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F4rH8lzk' \
    --quantity '25' \
    > test.out 2>&1
eval_tap $? 285 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 286 RevokeUseCount
eval_tap 0 286 'RevokeUseCount # SKIP deprecated' test.out

#- 287 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'CCuMpwiS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ReIZv2XB' \
    --body '{"platform": "EwhOlTO7", "requestId": "JgyFHPlB", "useCount": 78}' \
    > test.out 2>&1
eval_tap $? 287 'SellUserEntitlement' test.out

#- 288 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rki7e3MR' \
    --body '{"duration": 26, "endDate": "1986-11-26T00:00:00Z", "entitlementCollectionId": "3Pz1bKQk", "entitlementOrigin": "Other", "itemId": "0ruVYbai", "itemSku": "9cTWDZsK", "language": "movwAlfd", "metadata": {"zj61R3D6": {}, "VYBY2pLG": {}, "1So6ALaY": {}}, "order": {"currency": {"currencyCode": "XFLeZ4K5", "currencySymbol": "cruWe3hO", "currencyType": "VIRTUAL", "decimals": 60, "namespace": "mrTP5rtU"}, "ext": {"BFoaFJVT": {}, "e1c15fN8": {}, "LYiogOeI": {}}, "free": true}, "orderNo": "GnAu5Cao", "origin": "Playstation", "overrideBundleItemQty": {"fk0THb60": 99, "MGEalxsX": 46, "XtZpXrcn": 20}, "quantity": 23, "region": "WvR7d8v3", "source": "IAP", "startDate": "1971-12-15T00:00:00Z", "storeId": "n93rJTRT"}' \
    > test.out 2>&1
eval_tap $? 288 'FulfillItem' test.out

#- 289 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLZ2ciod' \
    --body '{"code": "536mr4G9", "language": "roM", "region": "NYBC6cKc"}' \
    > test.out 2>&1
eval_tap $? 289 'RedeemCode' test.out

#- 290 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xjUlDDMK' \
    --body '{"itemId": "d3j8OPD4", "itemSku": "JOGgzZbi", "quantity": 50}' \
    > test.out 2>&1
eval_tap $? 290 'PreCheckFulfillItem' test.out

#- 291 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6joiMzmF' \
    --body '{"entitlementCollectionId": "dqwaDtjF", "entitlementOrigin": "Nintendo", "metadata": {"ZRfuK7Be": {}, "tWBafnbb": {}, "Qv6uMPh6": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "EaKSlxir", "namespace": "eqqjvWfZ"}, "item": {"itemId": "KlYiHhVh", "itemName": "5aJq2Oo6", "itemSku": "SEEBtVet", "itemType": "DZf8jwAo"}, "quantity": 5, "type": "ITEM"}, {"currency": {"currencyCode": "P9AI3edz", "namespace": "LqTxYYt7"}, "item": {"itemId": "VCfX0bVK", "itemName": "uPJvDH2K", "itemSku": "DjeAjZtL", "itemType": "NRL21MuJ"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "sGWbuU0d", "namespace": "htfqqwsS"}, "item": {"itemId": "FvptMb3Z", "itemName": "EN5K0164", "itemSku": "1wkeS3Hx", "itemType": "xM9AFbWR"}, "quantity": 37, "type": "ITEM"}], "source": "PAYMENT", "transactionId": "NIj6MFyH"}' \
    > test.out 2>&1
eval_tap $? 291 'FulfillRewards' test.out

#- 292 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rucj7bPA' \
    --endTime 'zwd349Kb' \
    --limit '38' \
    --offset '55' \
    --productId 'rOQzSIGD' \
    --startTime 'YxqBPZs8' \
    --status 'REVOKE_FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserIAPOrders' test.out

#- 293 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ocv6GU2E' \
    > test.out 2>&1
eval_tap $? 293 'QueryAllUserIAPOrders' test.out

#- 294 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCdMOY2v' \
    --endTime 'EzSm9ujD' \
    --limit '74' \
    --offset '5' \
    --startTime 'W5MxAnCH' \
    --status 'PENDING' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 294 'QueryUserIAPConsumeHistory' test.out

#- 295 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZW1MKaU' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "vVWM-ds", "productId": "VwHre7Wp", "region": "AYgtN2YD", "transactionId": "N7Hi01Jj", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 295 'MockFulfillIAPItem' test.out

#- 296 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fkt3AUyJ' \
    --body '{"skus": ["fHx5Y1h3", "MDvgQqYk", "0dcPZvKc"]}' \
    > test.out 2>&1
eval_tap $? 296 'AdminSyncOculusSubscriptions' test.out

#- 297 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'hk8Kxe0M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ycg3HSes' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetIAPOrderLineItems' test.out

#- 298 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANwWnWEw' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamAbnormalTransaction' test.out

#- 299 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '8vDh2CQn' \
    --body '{"orderId": "jw7iEF6R"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminSyncSteamIAPByTransaction' test.out

#- 300 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'k4XL2SYW' \
    --activeOnly  \
    --groupId 'Ai60pvG7' \
    --limit '81' \
    --offset '11' \
    --platform 'STADIA' \
    --productId 'sFsTaE03' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserThirdPartySubscription' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    --userId 'zH0kgweM' \
    --groupId 'TFDIFMns' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 302 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId 'Ff0DzqsN' \
    --productId '3rXOpN9G' \
    > test.out 2>&1
eval_tap $? 302 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 303 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'b9kfsB70' \
    --activeOnly  \
    --groupId '1trXEX18' \
    --limit '60' \
    --offset '71' \
    --platform 'PLAYSTATION' \
    --productId '0mWBoGn0' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 304 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'V66eZxPT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Au9BKPRt' \
    > test.out 2>&1
eval_tap $? 304 'GetThirdPartySubscriptionDetails' test.out

#- 305 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id '4HYp8sYa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0hQzipT' \
    --limit '42' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 305 'GetSubscriptionHistory' test.out

#- 306 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id '3uVbSJJE' \
    --namespace "$AB_NAMESPACE" \
    --userId '9hrfIDcq' \
    > test.out 2>&1
eval_tap $? 306 'SyncSubscriptionTransaction' test.out

#- 307 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'CfukVPE8' \
    --namespace "$AB_NAMESPACE" \
    --userId 's16gMDGw' \
    > test.out 2>&1
eval_tap $? 307 'GetThirdPartyUserSubscriptionDetails' test.out

#- 308 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'gHDMUzjP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W3WopdyB' \
    > test.out 2>&1
eval_tap $? 308 'SyncSubscription' test.out

#- 309 AdminSyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform adminSyncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqrG4QyX' \
    --body '{"gameId": "tlMr1UOV", "language": "vJ_pEmc", "region": "3fy3iHau"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminSyncTwitchDropsEntitlement' test.out

#- 310 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6gTAfSY' \
    --discounted  \
    --itemId 'Ii3wsDZc' \
    --limit '2' \
    --offset '69' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 310 'QueryUserOrders' test.out

#- 311 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'B1k1cJV3' \
    --body '{"currencyCode": "UAH7k2ZJ", "currencyNamespace": "NetlsjFm", "discountCodes": ["Xb9GyLjc", "gMYwhieY", "3cfeiF5G"], "discountedPrice": 7, "entitlementPlatform": "Xbox", "ext": {"wz0a87qR": {}, "Do00IWXY": {}, "xsvwP4in": {}}, "itemId": "zgBZIlIl", "language": "3V4uFhbA", "options": {"skipPriceValidation": false}, "platform": "Epic", "price": 97, "quantity": 87, "region": "tt49JcIZ", "returnUrl": "xHa9gobN", "sandbox": true, "sectionId": "9H3g3gzt"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminCreateUserOrder' test.out

#- 312 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2l0vfuZ' \
    --itemId 'PkKrrmiz' \
    > test.out 2>&1
eval_tap $? 312 'CountOfPurchasedItem' test.out

#- 313 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mi5MVezl' \
    --userId 'mlFwDB5H' \
    > test.out 2>&1
eval_tap $? 313 'GetUserOrder' test.out

#- 314 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9mUSi7uf' \
    --userId 'UfP94hI0' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "ZothBVUg"}' \
    > test.out 2>&1
eval_tap $? 314 'UpdateUserOrderStatus' test.out

#- 315 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WpRQanNL' \
    --userId 'aKsPKf9V' \
    > test.out 2>&1
eval_tap $? 315 'FulfillUserOrder' test.out

#- 316 GetUserOrderGrant
eval_tap 0 316 'GetUserOrderGrant # SKIP deprecated' test.out

#- 317 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0RkZ1GRW' \
    --userId '3cEk2rj2' \
    > test.out 2>&1
eval_tap $? 317 'GetUserOrderHistories' test.out

#- 318 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'prIz3yPk' \
    --userId 'CwQnwauH' \
    --body '{"additionalData": {"cardSummary": "TFh2b94k"}, "authorisedTime": "1972-03-15T00:00:00Z", "chargebackReversedTime": "1991-07-18T00:00:00Z", "chargebackTime": "1974-07-09T00:00:00Z", "chargedTime": "1996-05-30T00:00:00Z", "createdTime": "1986-05-14T00:00:00Z", "currency": {"currencyCode": "PSZRGPS6", "currencySymbol": "DYvtf0Lr", "currencyType": "VIRTUAL", "decimals": 3, "namespace": "MNVNh4uR"}, "customParameters": {"Qfu7oHVr": {}, "xpfVRhUo": {}, "iqQCRXhq": {}}, "extOrderNo": "3unuTylH", "extTxId": "COE3GkX3", "extUserId": "ddPTXzXx", "issuedAt": "1977-04-30T00:00:00Z", "metadata": {"6ip9ztom": "w6gibLQv", "JOJqVJ8F": "NicyrFpc", "h8mUxKFG": "8i1AT0z0"}, "namespace": "k05ghkNv", "nonceStr": "kPAGhBR7", "paymentData": {"discountAmount": 41, "discountCode": "lRgnZCol", "subtotalPrice": 27, "tax": 62, "totalPrice": 22}, "paymentMethod": "4FtDhrRb", "paymentMethodFee": 55, "paymentOrderNo": "MDrUOK0a", "paymentProvider": "WXPAY", "paymentProviderFee": 26, "paymentStationUrl": "h2qz8kHt", "price": 4, "refundedTime": "1989-11-03T00:00:00Z", "salesTax": 80, "sandbox": false, "sku": "KtepbMUo", "status": "REFUND_FAILED", "statusReason": "oACiCwtD", "subscriptionId": "y4WivqZQ", "subtotalPrice": 16, "targetNamespace": "BQqb3g1y", "targetUserId": "f8q360fw", "tax": 88, "totalPrice": 85, "totalTax": 64, "txEndTime": "1983-03-10T00:00:00Z", "type": "al4vDItI", "userId": "66u9oSKS", "vat": 74}' \
    > test.out 2>&1
eval_tap $? 318 'ProcessUserOrderNotification' test.out

#- 319 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uDcrGGWF' \
    --userId 'SXZhADBl' \
    > test.out 2>&1
eval_tap $? 319 'DownloadUserOrderReceipt' test.out

#- 320 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'rNFq6Tbb' \
    --body '{"currencyCode": "jLj1dNmW", "currencyNamespace": "bHqx6dzk", "customParameters": {"IIp7kfLM": {}, "qz7aKNdJ": {}, "XT2qhh9d": {}}, "description": "pgtdz9Kx", "extOrderNo": "O6cEwPlo", "extUserId": "LK2DOSDf", "itemType": "SEASON", "language": "Ytbs-Jx", "metadata": {"pcVqfXJK": "5CUXzB5l", "5vL3wAu0": "8kFHk9Hv", "mfoM27Yw": "qOtW5S4A"}, "notifyUrl": "bO1ijkxa", "omitNotification": false, "platform": "RqZHqvm3", "price": 87, "recurringPaymentOrderNo": "ixiWiEge", "region": "ot4bzoL3", "returnUrl": "xuDIRBIq", "sandbox": false, "sku": "835lI2wi", "subscriptionId": "oU2EAAIO", "title": "jAVOa7Xj"}' \
    > test.out 2>&1
eval_tap $? 320 'CreateUserPaymentOrder' test.out

#- 321 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'eQuUfNAd' \
    --userId 'GSljAk7B' \
    --body '{"description": "DqmDfAZ9"}' \
    > test.out 2>&1
eval_tap $? 321 'RefundUserPaymentOrder' test.out

#- 322 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'nHD02PwZ' \
    > test.out 2>&1
eval_tap $? 322 'GetUserPlatformAccountClosureHistories' test.out

#- 323 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'fRKTKXW9' \
    --body '{"code": "jrkBlUyP", "orderNo": "AushpuKA"}' \
    > test.out 2>&1
eval_tap $? 323 'ApplyUserRedemption' test.out

#- 324 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiXhbQHC' \
    --body '{"meta": {"D1HEP17e": {}, "x5aii5rl": {}, "mPoRianf": {}}, "reason": "JkrPs36G", "requestId": "dN8DTJwY", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "S5XE6VCI", "namespace": "g9McuE7f"}, "entitlement": {"entitlementId": "uSL94Vu5"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "qmrJ8o2A", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 34, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "bsSlj3gi", "namespace": "bz3rUC56"}, "entitlement": {"entitlementId": "Jtfl8t2X"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "WmP4Q6w9", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 86, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "YIbTcJJu", "namespace": "B6jlwKgp"}, "entitlement": {"entitlementId": "wp5ovLEx"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "mw7QriIN", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 0, "type": "ITEM"}], "source": "DLC", "transactionId": "bCA1mCGk"}' \
    > test.out 2>&1
eval_tap $? 324 'DoRevocation' test.out

#- 325 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'pBYQzzVf' \
    --body '{"gameSessionId": "ugqym99c", "payload": {"4qImWMU2": {}, "2SHrPPSb": {}, "ZGJO0nRs": {}}, "scid": "YEeS0pVd", "sessionTemplateName": "23e4eJaP"}' \
    > test.out 2>&1
eval_tap $? 325 'RegisterXblSessions' test.out

#- 326 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZ9rne4i' \
    --chargeStatus 'SETUP' \
    --itemId 'kC7rYaLR' \
    --limit '91' \
    --offset '21' \
    --sku 'YxXJ3FUq' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserSubscriptions' test.out

#- 327 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrYsXb5T' \
    --excludeSystem  \
    --limit '2' \
    --offset '45' \
    --subscriptionId 'n2g7z9D7' \
    > test.out 2>&1
eval_tap $? 327 'GetUserSubscriptionActivities' test.out

#- 328 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '6XbZpIjx' \
    --body '{"grantDays": 53, "itemId": "41mvwKOq", "language": "fryfzRYl", "reason": "uC3BKFkn", "region": "86rCCdmp", "source": "MHwelXX2"}' \
    > test.out 2>&1
eval_tap $? 328 'PlatformSubscribeSubscription' test.out

#- 329 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3jdW741' \
    --itemId 'JOXXtW8V' \
    > test.out 2>&1
eval_tap $? 329 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 330 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NRsFPkhS' \
    --userId 'tlP8GIAa' \
    > test.out 2>&1
eval_tap $? 330 'GetUserSubscription' test.out

#- 331 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nMLXxO7W' \
    --userId '7hhCjWH0' \
    > test.out 2>&1
eval_tap $? 331 'DeleteUserSubscription' test.out

#- 332 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Dno9exgY' \
    --userId 'BA7gF9ue' \
    --force  \
    --body '{"immediate": true, "reason": "g73XigZZ"}' \
    > test.out 2>&1
eval_tap $? 332 'CancelSubscription' test.out

#- 333 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jYCh5GDx' \
    --userId 'bnDRlawl' \
    --body '{"grantDays": 31, "reason": "OH7jSQUi"}' \
    > test.out 2>&1
eval_tap $? 333 'GrantDaysToSubscription' test.out

#- 334 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LCyCKBtX' \
    --userId 'WIybC409' \
    --excludeFree  \
    --limit '89' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 334 'GetUserSubscriptionBillingHistories' test.out

#- 335 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'w0FuRMpi' \
    --userId 'BuBo9y4N' \
    --body '{"additionalData": {"cardSummary": "TqjqJH9y"}, "authorisedTime": "1991-04-05T00:00:00Z", "chargebackReversedTime": "1971-10-16T00:00:00Z", "chargebackTime": "1975-08-27T00:00:00Z", "chargedTime": "1997-02-07T00:00:00Z", "createdTime": "1998-02-10T00:00:00Z", "currency": {"currencyCode": "kV6QV4Ux", "currencySymbol": "gZXPJex4", "currencyType": "REAL", "decimals": 71, "namespace": "X2Y0jjK9"}, "customParameters": {"Na7gqcxr": {}, "L6GnP6d1": {}, "aq3jQt6v": {}}, "extOrderNo": "muIpPVYd", "extTxId": "fn3WFitl", "extUserId": "n6Be6KQT", "issuedAt": "1976-10-19T00:00:00Z", "metadata": {"q6zuHSt1": "4RRFaxxk", "BTxUApgC": "5ZPtKwH4", "qj7PiTlN": "RrKJUqHM"}, "namespace": "Uv4cFyAD", "nonceStr": "lroIXpSY", "paymentData": {"discountAmount": 59, "discountCode": "u33b4J3Q", "subtotalPrice": 3, "tax": 1, "totalPrice": 36}, "paymentMethod": "c8JYyhmv", "paymentMethodFee": 27, "paymentOrderNo": "xo5xwiaz", "paymentProvider": "PAYPAL", "paymentProviderFee": 69, "paymentStationUrl": "x0OtwOFZ", "price": 68, "refundedTime": "1996-03-17T00:00:00Z", "salesTax": 11, "sandbox": false, "sku": "CLm75XBa", "status": "CHARGEBACK_REVERSED", "statusReason": "3I6iR9gK", "subscriptionId": "NHKPtOsa", "subtotalPrice": 26, "targetNamespace": "u4Gp1rrW", "targetUserId": "3z4laLQp", "tax": 68, "totalPrice": 81, "totalTax": 9, "txEndTime": "1986-06-16T00:00:00Z", "type": "X1uTWoGN", "userId": "iArYNLpm", "vat": 20}' \
    > test.out 2>&1
eval_tap $? 335 'ProcessUserSubscriptionNotification' test.out

#- 336 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'B18WWEYU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xj04ncFO' \
    --body '{"count": 69, "orderNo": "WVF2Vlow"}' \
    > test.out 2>&1
eval_tap $? 336 'AcquireUserTicket' test.out

#- 337 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'hrfQpMon' \
    > test.out 2>&1
eval_tap $? 337 'QueryUserCurrencyWallets' test.out

#- 338 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'BEly8UEe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E4aQHRed' \
    --body '{"allowOverdraft": true, "amount": 6, "balanceOrigin": "Playstation", "balanceSource": "IAP_REVOCATION", "metadata": {"Pr1ApjbE": {}, "P45GiVe0": {}, "N0Sr0WHU": {}}, "reason": "iMKuu1gP"}' \
    > test.out 2>&1
eval_tap $? 338 'DebitUserWalletByCurrencyCode' test.out

#- 339 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'M6aGehc9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IZEXKMes' \
    --limit '14' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 339 'ListUserCurrencyTransactions' test.out

#- 340 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'dEOHLEWV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'klQyA3Jd' \
    --request '{"amount": 54, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"OC910Azd": {}, "yfxqufG1": {}, "qmQiQRmA": {}}, "reason": "R5oeCQoR", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 340 'CheckBalance' test.out

#- 341 CheckWallet
eval_tap 0 341 'CheckWallet # SKIP deprecated' test.out

#- 342 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'ei8jzoYR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oE1PB8QT' \
    --body '{"amount": 75, "expireAt": "1993-12-06T00:00:00Z", "metadata": {"9k6pnOgt": {}, "PWg8H27L": {}, "tnvSXNgp": {}}, "origin": "Oculus", "reason": "nH1rjkwJ", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 342 'CreditUserWallet' test.out

#- 343 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'opXHngpd' \
    --namespace "$AB_NAMESPACE" \
    --userId '9zmXTVye' \
    --request '{"amount": 59, "debitBalanceSource": "PAYMENT", "metadata": {"OkyTVYhe": {}, "dyE93LZr": {}, "wfOrEmbL": {}}, "reason": "UqL4HxSg", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 343 'DebitByWalletPlatform' test.out

#- 344 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'JnA7eh5v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTcjYHaI' \
    --body '{"amount": 57, "metadata": {"rDc9Z4a4": {}, "86BIQlJD": {}, "Gm76pr2A": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 344 'PayWithUserWallet' test.out

#- 345 GetUserWallet
eval_tap 0 345 'GetUserWallet # SKIP deprecated' test.out

#- 346 DebitUserWallet
eval_tap 0 346 'DebitUserWallet # SKIP deprecated' test.out

#- 347 DisableUserWallet
eval_tap 0 347 'DisableUserWallet # SKIP deprecated' test.out

#- 348 EnableUserWallet
eval_tap 0 348 'EnableUserWallet # SKIP deprecated' test.out

#- 349 ListUserWalletTransactions
eval_tap 0 349 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 350 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gLvFngBf' \
    > test.out 2>&1
eval_tap $? 350 'ListViews' test.out

#- 351 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZThvLCuX' \
    --body '{"displayOrder": 74, "localizations": {"8waA9r4M": {"description": "m2AAOp7g", "localExt": {"jQU6uGaP": {}, "Aa64nBHY": {}, "cHdXNz0L": {}}, "longDescription": "mbQ95gtd", "title": "8wHDuMNN"}, "ZuBq22KR": {"description": "y9RL9mhO", "localExt": {"JjlMvIub": {}, "s0OmYDOa": {}, "OZAEg4yP": {}}, "longDescription": "lAV0pD9j", "title": "SnJE5wDM"}, "JUwInzw3": {"description": "6Fp0j1jS", "localExt": {"96iy4INp": {}, "iF4zwQ77": {}, "GQSHppAS": {}}, "longDescription": "2iv5LvYY", "title": "f3GXldYP"}}, "name": "QDzcFksl"}' \
    > test.out 2>&1
eval_tap $? 351 'CreateView' test.out

#- 352 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '5fBM6pOY' \
    --storeId '3xlCwJFO' \
    > test.out 2>&1
eval_tap $? 352 'GetView' test.out

#- 353 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'WKJfmLcP' \
    --storeId 'jhNTg2NG' \
    --body '{"displayOrder": 55, "localizations": {"OOnsVEv9": {"description": "Y5aTNg1j", "localExt": {"J5PimL5l": {}, "5wsSVjta": {}, "Ulw5KvdW": {}}, "longDescription": "X3qDCrNn", "title": "bGsslQa6"}, "LeE63pco": {"description": "ErLyBq4Q", "localExt": {"hAJhMPPw": {}, "SWNstsyi": {}, "zcHViBMQ": {}}, "longDescription": "Eyuxkg8j", "title": "EyWGTnex"}, "BuArfqBM": {"description": "VjrBdk8Q", "localExt": {"VaO5G90X": {}, "3NWvK3sp": {}, "6A5bhTss": {}}, "longDescription": "c2ntHCZt", "title": "QEEsn8iv"}}, "name": "ZUMTFMeQ"}' \
    > test.out 2>&1
eval_tap $? 353 'UpdateView' test.out

#- 354 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'W7RJnzcJ' \
    --storeId 't0udjBmD' \
    > test.out 2>&1
eval_tap $? 354 'DeleteView' test.out

#- 355 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'GetWalletConfig' test.out

#- 356 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateWalletConfig' test.out

#- 357 QueryWallets
eval_tap 0 357 'QueryWallets # SKIP deprecated' test.out

#- 358 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 87, "expireAt": "1994-09-30T00:00:00Z", "metadata": {"SkhXUq07": {}, "z2edRBI9": {}, "QenGpEaJ": {}}, "origin": "IOS", "reason": "RAyzEHEA", "source": "PURCHASE"}, "currencyCode": "LymgLxb0", "userIds": ["2Pja6iiz", "vkuVgCQJ", "g7cywypN"]}, {"creditRequest": {"amount": 80, "expireAt": "1973-06-20T00:00:00Z", "metadata": {"0CvJvyoH": {}, "VPh13Lnn": {}, "cuQboapU": {}}, "origin": "IOS", "reason": "FZAwZxB4", "source": "TRADE"}, "currencyCode": "6YI6nh8w", "userIds": ["cg5vzgh8", "9UwQfZ5D", "kkBWY3S6"]}, {"creditRequest": {"amount": 11, "expireAt": "1988-08-03T00:00:00Z", "metadata": {"CxTFrqU6": {}, "xemPotjH": {}, "8KBEZMyd": {}}, "origin": "Steam", "reason": "IxYV7eM6", "source": "ACHIEVEMENT"}, "currencyCode": "Rr6JCVwM", "userIds": ["pHdrdkyo", "KRMtxNPS", "Yj9zuKAT"]}]' \
    > test.out 2>&1
eval_tap $? 358 'BulkCredit' test.out

#- 359 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "pLUSvyCz", "request": {"allowOverdraft": false, "amount": 53, "balanceOrigin": "Oculus", "balanceSource": "ORDER_REVOCATION", "metadata": {"hsZBLkFR": {}, "mdiexjZU": {}, "sZhegYJF": {}}, "reason": "bZLqctdI"}, "userIds": ["qYUhYjAL", "dPaQP2dP", "vBihLzDz"]}, {"currencyCode": "ZpIkV9SE", "request": {"allowOverdraft": true, "amount": 23, "balanceOrigin": "Other", "balanceSource": "TRADE", "metadata": {"vwdGEpYD": {}, "vTuYAtHq": {}, "UmwYTVQy": {}}, "reason": "s8Re1dz7"}, "userIds": ["SiTQbrcx", "vTQZOa15", "KzFbSSS7"]}, {"currencyCode": "B4i9hEpQ", "request": {"allowOverdraft": true, "amount": 41, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"f3dZQLDX": {}, "UUesEL8z": {}, "wJlyDdIY": {}}, "reason": "Mdg339uU"}, "userIds": ["pfb25IHg", "cPmu90QQ", "uEedLX4S"]}]' \
    > test.out 2>&1
eval_tap $? 359 'BulkDebit' test.out

#- 360 GetWallet
eval_tap 0 360 'GetWallet # SKIP deprecated' test.out

#- 361 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'O1al2IKe' \
    --end 'taufLqsV' \
    --start '6wgK9KUL' \
    > test.out 2>&1
eval_tap $? 361 'SyncOrders' test.out

#- 362 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["4UuSgblD", "2ajYgo7V", "cjeBMK5i"], "apiKey": "AvybX0LM", "authoriseAsCapture": false, "blockedPaymentMethods": ["V0kjrrRj", "XddrXTxN", "UeUa81VM"], "clientKey": "0sndgpFh", "dropInSettings": "SEoeKvKu", "liveEndpointUrlPrefix": "5xBrv3wH", "merchantAccount": "MYUmeYJr", "notificationHmacKey": "tYfbWOuT", "notificationPassword": "I9j7eorU", "notificationUsername": "ovZZxYB5", "returnUrl": "Agcreag0", "settings": "yNluPWc4"}' \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfig' test.out

#- 363 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "C5RvFo7H", "privateKey": "eOqigaTA", "publicKey": "pDHByMeY", "returnUrl": "jFfpBJ9m"}' \
    > test.out 2>&1
eval_tap $? 363 'TestAliPayConfig' test.out

#- 364 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "Sb0gB9lw", "secretKey": "5zLB8fcI"}' \
    > test.out 2>&1
eval_tap $? 364 'TestCheckoutConfig' test.out

#- 365 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'tpsREoAq' \
    > test.out 2>&1
eval_tap $? 365 'DebugMatchedPaymentMerchantConfig' test.out

#- 366 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "HWOXGdW1", "webhookSecretKey": "qVNkMd9o"}' \
    > test.out 2>&1
eval_tap $? 366 'TestNeonPayConfig' test.out

#- 367 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "0qxZe3ii", "clientSecret": "3M6jPgsR", "returnUrl": "uORLp8ct", "webHookId": "MvIy9gMf"}' \
    > test.out 2>&1
eval_tap $? 367 'TestPayPalConfig' test.out

#- 368 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["c0CEg3XC", "DXKmhGAA", "cOpcTwNu"], "publishableKey": "zy2XLEOb", "secretKey": "iFBsq7U2", "webhookSecret": "liIqIgk7"}' \
    > test.out 2>&1
eval_tap $? 368 'TestStripeConfig' test.out

#- 369 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "2oJ3SISp", "key": "0MZnP2FC", "mchid": "ZJcoPmiX", "returnUrl": "9PaXM82G"}' \
    > test.out 2>&1
eval_tap $? 369 'TestWxPayConfig' test.out

#- 370 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "wqKUzYm0", "flowCompletionUrl": "921d8h3u", "merchantId": 15, "projectId": 78, "projectSecretKey": "LpQJTtZi"}' \
    > test.out 2>&1
eval_tap $? 370 'TestXsollaConfig' test.out

#- 371 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'umEDKnVh' \
    > test.out 2>&1
eval_tap $? 371 'GetPaymentMerchantConfig1' test.out

#- 372 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'rWEx2dM6' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["UjnrGFjY", "quWMmGsf", "LWF4yHFG"], "apiKey": "BSfvpumU", "authoriseAsCapture": false, "blockedPaymentMethods": ["vzugRSGq", "YOGKKHxF", "esML1X8w"], "clientKey": "seY8WBNI", "dropInSettings": "A1UTsu6i", "liveEndpointUrlPrefix": "6IoojFK6", "merchantAccount": "xeDcG9eZ", "notificationHmacKey": "1pYQ3sKW", "notificationPassword": "fFGQrgWi", "notificationUsername": "86wG9HQ7", "returnUrl": "EVZBSsVE", "settings": "sCzjP6fX"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAdyenConfig' test.out

#- 373 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'VAcwx9Ft' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAdyenConfigById' test.out

#- 374 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'D2Es5NVm' \
    --sandbox  \
    --validate  \
    --body '{"appId": "a3tWCx5C", "privateKey": "BnrewxC3", "publicKey": "B1rPlpyL", "returnUrl": "HIsYFVw1"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateAliPayConfig' test.out

#- 375 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Dp7GAb3X' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestAliPayConfigById' test.out

#- 376 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '2Fe1UeWn' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "ufcnssTh", "secretKey": "bDZlFIDY"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateCheckoutConfig' test.out

#- 377 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '3JM5kEDw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestCheckoutConfigById' test.out

#- 378 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'hklYF2DT' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "XWpLbrfl", "webhookSecretKey": "1bS5CcRU"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateNeonPayConfig' test.out

#- 379 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'OeIfOBNG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestNeonPayConfigById' test.out

#- 380 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'G6RNsk0i' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "vvraLKbh", "clientSecret": "XiTDP2EX", "returnUrl": "nuxCMhtV", "webHookId": "CSl2AEJI"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdatePayPalConfig' test.out

#- 381 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'u9cYpiny' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestPayPalConfigById' test.out

#- 382 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'Oof9lEWi' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["y838mN0o", "1Ia5xX40", "IiiI8fEk"], "publishableKey": "gMnFQxSl", "secretKey": "IBLD2TJT", "webhookSecret": "BvdxpIe7"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateStripeConfig' test.out

#- 383 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'sxwqyRn6' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 383 'TestStripeConfigById' test.out

#- 384 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'pq3lBRz3' \
    --validate  \
    --body '{"appId": "qPXTjqVe", "key": "1KP0viEs", "mchid": "ShXOVzEn", "returnUrl": "x5Mkb6RL"}' \
    > test.out 2>&1
eval_tap $? 384 'UpdateWxPayConfig' test.out

#- 385 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'gGblf3L9' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 385 'UpdateWxPayConfigCert' test.out

#- 386 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'IUQiEMC8' \
    > test.out 2>&1
eval_tap $? 386 'TestWxPayConfigById' test.out

#- 387 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'qrOjjJPf' \
    --validate  \
    --body '{"apiKey": "QjKeeeaQ", "flowCompletionUrl": "Wk0LfUPD", "merchantId": 72, "projectId": 79, "projectSecretKey": "DljTQjED"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaConfig' test.out

#- 388 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'lnoBEwrF' \
    > test.out 2>&1
eval_tap $? 388 'TestXsollaConfigById' test.out

#- 389 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '9qHO7oqx' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 389 'UpdateXsollaUIConfig' test.out

#- 390 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '42' \
    --namespace "$AB_NAMESPACE" \
    --offset '29' \
    --region 'xeBsDb4t' \
    > test.out 2>&1
eval_tap $? 390 'QueryPaymentProviderConfig' test.out

#- 391 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "unXnoHi2", "region": "nDevo12q", "sandboxTaxJarApiToken": "ncwlq7vZ", "specials": ["ALIPAY", "ALIPAY", "PAYPAL"], "taxJarApiToken": "E4vrnuzc", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 391 'CreatePaymentProviderConfig' test.out

#- 392 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetAggregatePaymentProviders' test.out

#- 393 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '1iFajHaT' \
    > test.out 2>&1
eval_tap $? 393 'DebugMatchedPaymentProviderConfig' test.out

#- 394 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 394 'GetSpecialPaymentProviders' test.out

#- 395 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'KCXWvgpX' \
    --body '{"aggregate": "STRIPE", "namespace": "35MZt5gQ", "region": "gsgnqZsI", "sandboxTaxJarApiToken": "SZaMJtIY", "specials": ["XSOLLA", "NEONPAY", "WALLET"], "taxJarApiToken": "vNRE9huz", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 395 'UpdatePaymentProviderConfig' test.out

#- 396 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'tnUkH7cb' \
    > test.out 2>&1
eval_tap $? 396 'DeletePaymentProviderConfig' test.out

#- 397 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 397 'GetPaymentTaxConfig' test.out

#- 398 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "YXnFq6FZ", "taxJarApiToken": "ASSdX9Dx", "taxJarEnabled": true, "taxJarProductCodesMapping": {"c7O5f4UW": "jp8b0uFK", "n3p7QBzi": "GNNOOyQq", "S5POb9Wz": "VxWP7uf0"}}' \
    > test.out 2>&1
eval_tap $? 398 'UpdatePaymentTaxConfig' test.out

#- 399 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'sdyWIUBH' \
    --end 'ftvwvlDA' \
    --start 'VDEWyFPW' \
    > test.out 2>&1
eval_tap $? 399 'SyncPaymentOrders' test.out

#- 400 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'HXjRtKEB' \
    --storeId 'poOvN1Uk' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetRootCategories' test.out

#- 401 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '3d48VQ9a' \
    --storeId 'ynjIO3lJ' \
    > test.out 2>&1
eval_tap $? 401 'DownloadCategories' test.out

#- 402 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'xrAwbi5B' \
    --namespace "$AB_NAMESPACE" \
    --language 'ubx1QwNY' \
    --storeId 'fj1zVkO4' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetCategory' test.out

#- 403 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Tr9snec4' \
    --namespace "$AB_NAMESPACE" \
    --language 'Deo69fbh' \
    --storeId 'kQ8AJh58' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetChildCategories' test.out

#- 404 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'ZYdDKXjo' \
    --namespace "$AB_NAMESPACE" \
    --language 'gBJHhwjI' \
    --storeId 'aVLORjLf' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetDescendantCategories' test.out

#- 405 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 405 'PublicListCurrencies' test.out

#- 406 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 406 'GeDLCDurableRewardShortMap' test.out

#- 407 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 407 'GetAppleConfigVersion' test.out

#- 408 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 408 'GetIAPItemMapping' test.out

#- 409 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'PioRNhEe' \
    --region 'SlFivREd' \
    --storeId 'M8kHpLgY' \
    --appId 'QLI9khgq' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemByAppId' test.out

#- 410 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'oDlzv2gB' \
    --categoryPath 'VrDw1ZJc' \
    --features '46fX0Ehw' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'GQaL2U9c' \
    --limit '81' \
    --offset '55' \
    --region 'Qj0VQuFD' \
    --sortBy 'displayOrder,updatedAt:desc,name:asc' \
    --storeId 'I41v1IGP' \
    --tags '8KNr557R' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryItems' test.out

#- 411 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Ez6XWQtC' \
    --region 'ANy7EdVE' \
    --storeId 'NUcnzjoX' \
    --sku 'vQ9n8F4n' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetItemBySku' test.out

#- 412 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'CfJUAmyA' \
    --storeId '8MqktLXU' \
    --itemIds 'xoancQm6' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetEstimatedPrice' test.out

#- 413 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'DS284Wnt' \
    --region '7jqSgtDm' \
    --storeId 'SMw3lR0t' \
    --itemIds 'tKgqDNfN' \
    > test.out 2>&1
eval_tap $? 413 'PublicBulkGetItems' test.out

#- 414 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["QFcS0Pq8", "gvBqkPnR", "E7LcYIUn"]}' \
    > test.out 2>&1
eval_tap $? 414 'PublicValidateItemPurchaseCondition' test.out

#- 415 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'SEASON' \
    --limit '55' \
    --offset '59' \
    --region 'ZiHx0NWL' \
    --storeId 'Vl1fpe13' \
    --keyword 'BdO6rkZB' \
    --language 'mV3KyrV9' \
    > test.out 2>&1
eval_tap $? 415 'PublicSearchItems' test.out

#- 416 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'HJUn1Qsx' \
    --namespace "$AB_NAMESPACE" \
    --language 'tMIdqDp9' \
    --region 'LvX61nsT' \
    --storeId 'B2BfVO1t' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetApp' test.out

#- 417 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'EVSJDtlh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetItemDynamicData' test.out

#- 418 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'CrQdjTTr' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '0Egkl1m7' \
    --populateBundle  \
    --region 'wu3fU0sU' \
    --storeId 'PnocW9dT' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetItem' test.out

#- 419 GetPaymentCustomization
eval_tap 0 419 'GetPaymentCustomization # SKIP deprecated' test.out

#- 420 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "Qr3aRSht", "successUrl": "na3AYRnu"}, "paymentOrderNo": "2NE5LBd6", "paymentProvider": "XSOLLA", "returnUrl": "GTzfqSvR", "ui": "IRRmPvRb", "zipCode": "v6jk20S9"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentUrl' test.out

#- 421 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MkwEpk6T' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetPaymentMethods' test.out

#- 422 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JvxzAYpj' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUnpaidPaymentOrder' test.out

#- 423 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tnhhIUF9' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'BNoqu3g1' \
    --body '{"token": "WYdv4SyL"}' \
    > test.out 2>&1
eval_tap $? 423 'Pay' test.out

#- 424 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WcXsyqMV' \
    > test.out 2>&1
eval_tap $? 424 'PublicCheckPaymentOrderPaidStatus' test.out

#- 425 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'Q3zC1v6G' \
    > test.out 2>&1
eval_tap $? 425 'GetPaymentPublicConfig' test.out

#- 426 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'UU24NGiK' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetQRCode' test.out

#- 427 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'fZPgfxH4' \
    --foreinginvoice 'yFE5Gc7w' \
    --invoiceId 'hC9GkAKb' \
    --payload 'BcGbwaqT' \
    --redirectResult 'zwhkVb3l' \
    --resultCode '2LGDqUaB' \
    --sessionId 'YaA0F2VY' \
    --status 'XIxMjIAS' \
    --token 'phOhmBPJ' \
    --type 'fvqm9QWv' \
    --userId 'M8uy52eu' \
    --orderNo 'jItEpVCU' \
    --paymentOrderNo 'ILWGbV4O' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'ZmpctxEH' \
    > test.out 2>&1
eval_tap $? 427 'PublicNormalizePaymentReturnUrl' test.out

#- 428 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'PMjpUQhN' \
    --paymentOrderNo 'LjtfvjYV' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 428 'GetPaymentTaxValue' test.out

#- 429 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'pqfAzrnq' \
    > test.out 2>&1
eval_tap $? 429 'GetRewardByCode' test.out

#- 430 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'FKkbnhfj' \
    --limit '72' \
    --offset '51' \
    --sortBy 'namespace,namespace:asc' \
    > test.out 2>&1
eval_tap $? 430 'QueryRewards1' test.out

#- 431 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'cmhrn3w9' \
    > test.out 2>&1
eval_tap $? 431 'GetReward1' test.out

#- 432 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 432 'PublicListStores' test.out

#- 433 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'wu2s56aw,VjJxXoml,0COHzPYd' \
    --itemIds '192AEs3l,TV5THbly,Z6bMfuIU' \
    --skus '2GsNruii,qMUAf14i,zBqwfrf2' \
    > test.out 2>&1
eval_tap $? 433 'PublicExistsAnyMyActiveEntitlement' test.out

#- 434 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '9yVq0PuX' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 435 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'x4nBw4jw' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 436 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'RqonzrmT' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 437 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'CZFnsPVz,mXtzwUme,wg3jRPK7' \
    --itemIds 'ZUBt4yNk,thEnvnXe,ZmGvDfmS' \
    --skus 'nuqwSmow,lVZnUkOw,Z5jmJPmO' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetEntitlementOwnershipToken' test.out

#- 438 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "drMHbZJJ", "language": "Wk-zWXT", "region": "ZKiUw0yV"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncTwitchDropsEntitlement' test.out

#- 439 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'v4jbK51i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 439 'PublicGetMyWallet' test.out

#- 440 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wvEnXTWF' \
    --body '{"epicGamesJwtToken": "Cp1f70bm"}' \
    > test.out 2>&1
eval_tap $? 440 'SyncEpicGameDLC' test.out

#- 441 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'xpQOKQPJ' \
    > test.out 2>&1
eval_tap $? 441 'SyncOculusDLC' test.out

#- 442 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTVtvhiL' \
    --body '{"serviceLabel": 39}' \
    > test.out 2>&1
eval_tap $? 442 'PublicSyncPsnDlcInventory' test.out

#- 443 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '8z6CifNr' \
    --body '{"serviceLabels": [60, 15, 71]}' \
    > test.out 2>&1
eval_tap $? 443 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 444 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'S6GGozf0' \
    --body '{"appId": "3Zy4R5nj", "steamId": "vSBpbnyz"}' \
    > test.out 2>&1
eval_tap $? 444 'SyncSteamDLC' test.out

#- 445 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'lWk50eLK' \
    --body '{"xstsToken": "8pcRYyXB"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncXboxDLC' test.out

#- 446 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5sCXmpWV' \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName '91lGERM7' \
    --features 'oNuoD7t0,bOPcuInH,REFaBc6c' \
    --itemId 'CG6Pb6fs,vqwBpuQw,AGMW138y' \
    --limit '62' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlements' test.out

#- 447 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vEfGxVvY' \
    --appId 'Vfwe4sy9' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserAppEntitlementByAppId' test.out

#- 448 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'i54ccUJO' \
    --limit '85' \
    --offset '55' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 448 'PublicQueryUserEntitlementsByAppType' test.out

#- 449 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'P5EIdFfj' \
    --availablePlatformOnly  \
    --ids 'GtLt17pa,hiEQUxux,HZKx9eNW' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlementsByIds' test.out

#- 450 PublicGetUserEntitlementByItemId
eval_tap 0 450 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 451 PublicGetUserEntitlementBySku
eval_tap 0 451 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 452 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGPbrGt6' \
    --endDate 'nMA9M6xB' \
    --entitlementClazz 'CODE' \
    --limit '72' \
    --offset '19' \
    --startDate 'wbcH9GgZ' \
    > test.out 2>&1
eval_tap $? 452 'PublicUserEntitlementHistory' test.out

#- 453 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmEWrCwV' \
    --appIds 'WuypKdrE,zNglHxFo,PiuaWOtY' \
    --itemIds 'JJcCs5W9,EslgLXR8,6wl24zdy' \
    --skus 'hsCShDde,IWdVhESN,TZdaV2a6' \
    > test.out 2>&1
eval_tap $? 453 'PublicExistsAnyUserActiveEntitlement' test.out

#- 454 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ADPmvn17' \
    --appId 'E0mtjOxl' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 455 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9ddQhw8G' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'br5dkhmb' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 456 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSXoXKMT' \
    --ids '4ExJXQ9F,dFSpl2Fj,sa9ngeGb' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 457 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQIwv5YB' \
    --entitlementClazz 'MEDIA' \
    --sku 'EMS7uw7k' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 458 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '4QWqAnmU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hk7f0LRT' \
    > test.out 2>&1
eval_tap $? 458 'PublicGetUserEntitlement' test.out

#- 459 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'I10R5hPM' \
    --namespace "$AB_NAMESPACE" \
    --userId '5argCOMn' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["kI0VFtHf", "dxObII8o", "dY4UKzuV"], "requestId": "WYUUV1c4", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 459 'PublicConsumeUserEntitlement' test.out

#- 460 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'GXdqFOnH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'adYqSWEX' \
    --body '{"requestId": "g42Kd9JE", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSellUserEntitlement' test.out

#- 461 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId '1RTLQhPC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bvg88MLN' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 89}' \
    > test.out 2>&1
eval_tap $? 461 'PublicSplitUserEntitlement' test.out

#- 462 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '9JafZRsQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ck3N7sIl' \
    --body '{"entitlementId": "vqcpvHd5", "metadata": {"operationSource": "INVENTORY"}, "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 462 'PublicTransferUserEntitlement' test.out

#- 463 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ysuxPD8J' \
    --body '{"code": "pWEnObTY", "language": "nRFB-jZXf-GT", "region": "r5zRUEDy"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicRedeemCode' test.out

#- 464 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dLyosKo4' \
    --body '{"excludeOldTransactions": false, "language": "EEa-DDvy-XZ", "productId": "WaumzB43", "receiptData": "q7iBUq7m", "region": "wFzeYkJz", "transactionId": "4IEsaA5h"}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillAppleIAPItem' test.out

#- 465 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gk3CmGHg' \
    --body '{"epicGamesJwtToken": "XsglvwT8"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncEpicGamesInventory' test.out

#- 466 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUua0NEM' \
    --body '{"autoAck": false, "autoConsume": true, "language": "mk-iDnR", "orderId": "HZzLtJxc", "packageName": "pAlJFuiQ", "productId": "VbuSdzXv", "purchaseTime": 73, "purchaseToken": "maHzZ5Fa", "region": "dgunH2h4", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 466 'PublicFulfillGoogleIAPItem' test.out

#- 467 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '5SO9ynp6' \
    --body '{"skus": ["Z1D9k54i", "D711W6fm", "SUKdNjkI"]}' \
    > test.out 2>&1
eval_tap $? 467 'SyncOculusSubscriptions' test.out

#- 468 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'D25gJfU4' \
    > test.out 2>&1
eval_tap $? 468 'SyncOculusConsumableEntitlements' test.out

#- 469 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '8RNnGkBy' \
    --body '{"currencyCode": "ZBRMXtCQ", "price": 0.8534976052257566, "productId": "zRyC9Ky9", "serviceLabel": 47}' \
    > test.out 2>&1
eval_tap $? 469 'PublicReconcilePlayStationStore' test.out

#- 470 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'nXfSuCBL' \
    --body '{"currencyCode": "vguoyfQo", "price": 0.4363427739164204, "productId": "G7gXFvdY", "serviceLabels": [73, 4, 38]}' \
    > test.out 2>&1
eval_tap $? 470 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 471 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ld75Ju0e' \
    --body '{"appId": "4j8BOJlF", "currencyCode": "SVTObP3z", "language": "ri-598", "price": 0.6434666730175821, "productId": "JEDj5pqx", "region": "JGJy8IDK", "steamId": "04avdC7E"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamInventory' test.out

#- 472 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'G12S2pA2' \
    > test.out 2>&1
eval_tap $? 472 'SyncSteamAbnormalTransaction' test.out

#- 473 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'R4mD5JVx' \
    --body '{"orderId": "U61MrciQ"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncSteamIAPByTransaction' test.out

#- 474 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId '5lf5p2Qu' \
    --activeOnly  \
    --groupId 'Gwx9qyD8' \
    --limit '100' \
    --offset '13' \
    --productId '1VZGJO3E' \
    > test.out 2>&1
eval_tap $? 474 'PublicQueryUserThirdPartySubscription' test.out

#- 475 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'onoEtnTA' \
    --body '{"gameId": "jXz1aAwx", "language": "rdUS-eDKY-ZS", "region": "0LGSKmoN"}' \
    > test.out 2>&1
eval_tap $? 475 'SyncTwitchDropsEntitlement1' test.out

#- 476 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxgT6Wly' \
    --body '{"currencyCode": "hZP4EC8j", "price": 0.9538667841643348, "productId": "xv7OaOS0", "xstsToken": "xrCYBcO9"}' \
    > test.out 2>&1
eval_tap $? 476 'SyncXboxInventory' test.out

#- 477 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ORTTwDew' \
    --discounted  \
    --itemId 'j17rBLB4' \
    --limit '86' \
    --offset '80' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserOrders' test.out

#- 478 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'xQ4obQdP' \
    --body '{"currencyCode": "AcKygN8F", "discountCodes": ["Ae5uoo6F", "nBJk9LqH", "d97N6iYS"], "discountedPrice": 90, "ext": {"Jbjw5rIF": {}, "AuSGkc0o": {}, "oPUrqHGT": {}}, "itemId": "QBPTujYE", "language": "Jg-lsbb-815", "price": 86, "quantity": 9, "region": "G4j3UjB3", "returnUrl": "ZFVJB1YX", "sectionId": "wP6FOgYb"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicCreateUserOrder' test.out

#- 479 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQ8sAZ80' \
    --body '{"currencyCode": "kX2HEjAq", "discountCodes": ["7fEP57k0", "hrCyE1eU", "KMa9loyT"], "discountedPrice": 21, "itemId": "kchBn2FH", "price": 18, "quantity": 39}' \
    > test.out 2>&1
eval_tap $? 479 'PublicPreviewOrderPrice' test.out

#- 480 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lFKxVwF5' \
    --userId 'jhUTEROw' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrder' test.out

#- 481 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QrNBhDtF' \
    --userId 'uNZSCXrV' \
    > test.out 2>&1
eval_tap $? 481 'PublicCancelUserOrder' test.out

#- 482 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'b0HJlFDn' \
    --userId 'XDYISXTD' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetUserOrderHistories' test.out

#- 483 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rUzBIjtf' \
    --userId 'hCSSIMtn' \
    > test.out 2>&1
eval_tap $? 483 'PublicDownloadUserOrderReceipt' test.out

#- 484 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ROQQ23Qq' \
    > test.out 2>&1
eval_tap $? 484 'PublicGetPaymentAccounts' test.out

#- 485 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'TJqmUvCU' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'W7XD8Nfz' \
    > test.out 2>&1
eval_tap $? 485 'PublicDeletePaymentAccount' test.out

#- 486 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHo0e24f' \
    --autoCalcEstimatedPrice  \
    --language '2ru0p3s9' \
    --region 'Jww3Sh18' \
    --storeId 'Ns5Olcz6' \
    --viewId 'OhNchGIC' \
    > test.out 2>&1
eval_tap $? 486 'PublicListActiveSections' test.out

#- 487 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'jL2o1coL' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '3QWR3aXx' \
    --limit '4' \
    --offset '5' \
    --sku 'cAiYF9GP' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 487 'PublicQueryUserSubscriptions' test.out

#- 488 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUsFZhKV' \
    --body '{"currencyCode": "euliM3qN", "itemId": "3HLgKwh3", "language": "NaNd", "region": "wnQJbkqD", "returnUrl": "gU3ZxZw5", "source": "xToHQ0sE"}' \
    > test.out 2>&1
eval_tap $? 488 'PublicSubscribeSubscription' test.out

#- 489 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WnuqfE9q' \
    --itemId '6ZK6jWYw' \
    > test.out 2>&1
eval_tap $? 489 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 490 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mRsa4i3g' \
    --userId 'sFsbZLL0' \
    > test.out 2>&1
eval_tap $? 490 'PublicGetUserSubscription' test.out

#- 491 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uMT7Dtut' \
    --userId 'tINmEYBy' \
    > test.out 2>&1
eval_tap $? 491 'PublicChangeSubscriptionBillingAccount' test.out

#- 492 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XzOechCA' \
    --userId 'LovifBLT' \
    --body '{"immediate": false, "reason": "WqCDC1MG"}' \
    > test.out 2>&1
eval_tap $? 492 'PublicCancelSubscription' test.out

#- 493 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'j1Vfkoqa' \
    --userId 'pBEivG6x' \
    --excludeFree  \
    --limit '6' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetUserSubscriptionBillingHistories' test.out

#- 494 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'XBIbqHkj' \
    --language 'dGMdUrRX' \
    --storeId 'TomQsiDq' \
    > test.out 2>&1
eval_tap $? 494 'PublicListViews' test.out

#- 495 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '36x0flQM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAu0sfly' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetWallet' test.out

#- 496 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'AVD1MTK3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wb16oaeC' \
    --limit '22' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 496 'PublicListUserWalletTransactions' test.out

#- 497 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 497 'PublicGetMyDLCContent' test.out

#- 498 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'rdPEEQrv' \
    --limit '78' \
    --offset '83' \
    --startTime 'OMRLNHuM' \
    --state 'FULFILL_FAILED' \
    --transactionId 'jcXb8sHH' \
    --userId 'XhYZUGSR' \
    > test.out 2>&1
eval_tap $? 498 'QueryFulfillments' test.out

#- 499 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'k5rGA1i6' \
    --baseAppId 'VCzdb3Mq' \
    --categoryPath 'At8DT1dy' \
    --features 'jql94Bss' \
    --includeSubCategoryItem  \
    --itemName 'bhRUcNaJ' \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM,APP,BUNDLE' \
    --limit '29' \
    --offset '29' \
    --region 'RqNVZP21' \
    --sectionExclusive  \
    --sortBy 'createdAt:asc,displayOrder:desc' \
    --storeId 'UJb8HgKJ' \
    --tags '1nSVzx77' \
    --targetNamespace 'kjZOvvf6' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 499 'QueryItemsV2' test.out

#- 500 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '6YGl0yc4' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 500 'ImportStore1' test.out

#- 501 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '5uuGIK7u' \
    --body '{"itemIds": ["0fX26bQV", "UBpMEOHd", "UCAguUMR"]}' \
    > test.out 2>&1
eval_tap $? 501 'ExportStore1' test.out

#- 502 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCU28rY9' \
    --body '{"entitlementCollectionId": "HswlBosm", "entitlementOrigin": "Steam", "metadata": {"eIMwxomZ": {}, "QYhFTknM": {}, "r4qEEpC7": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "zPafFdDi", "namespace": "dHJVwx1I"}, "item": {"itemId": "DeEXsNTa", "itemName": "w6cHcC42", "itemSku": "kZTHrtQu", "itemType": "fVxfHba4"}, "quantity": 51, "type": "ITEM"}, {"currency": {"currencyCode": "RPXz7QHh", "namespace": "0VWjAzBt"}, "item": {"itemId": "dWU0XOIe", "itemName": "lSW1Lflo", "itemSku": "0SuFj4na", "itemType": "aTJN5HSr"}, "quantity": 93, "type": "ITEM"}, {"currency": {"currencyCode": "Qh20JjUz", "namespace": "MT6bsWOR"}, "item": {"itemId": "cl5Jr1iX", "itemName": "jeJoWCet", "itemSku": "YiNK4lwW", "itemType": "bG58og7y"}, "quantity": 27, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "1HFpzd0C"}' \
    > test.out 2>&1
eval_tap $? 502 'FulfillRewardsV2' test.out

#- 503 FulfillItems
eval_tap 0 503 'FulfillItems # SKIP deprecated' test.out

#- 504 RetryFulfillItems
eval_tap 0 504 'RetryFulfillItems # SKIP deprecated' test.out

#- 505 RevokeItems
eval_tap 0 505 'RevokeItems # SKIP deprecated' test.out

#- 506 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdZRPAmo' \
    --body '{"transactionId": "w0ddqEnW"}' \
    > test.out 2>&1
eval_tap $? 506 'V2PublicFulfillAppleIAPItem' test.out

#- 507 BulkFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform bulkFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tdD6zpxa' \
    --body '[{"items": [{"duration": 52, "endDate": "1980-01-31T00:00:00Z", "entitlementCollectionId": "ccYUVLjj", "entitlementOrigin": "Other", "itemId": "WmiF7oyQ", "itemSku": "wi1WPPsA", "language": "fe8dCr78", "metadata": {"eREZbzQm": {}, "6et4GDwc": {}, "7BScgyId": {}}, "orderNo": "pOvkqZkM", "origin": "Nintendo", "quantity": 66, "region": "cdkeIeGO", "source": "REWARD", "startDate": "1988-10-07T00:00:00Z", "storeId": "AHiQkZzF"}, {"duration": 70, "endDate": "1983-04-29T00:00:00Z", "entitlementCollectionId": "7gzjkUFI", "entitlementOrigin": "IOS", "itemId": "WKrwdS92", "itemSku": "w3yitWEi", "language": "rzbT8FoT", "metadata": {"XZ2DbWDr": {}, "1rQaKYJx": {}, "hMdK0xgV": {}}, "orderNo": "5RE2R7bt", "origin": "Nintendo", "quantity": 27, "region": "SHva1QLt", "source": "REWARD", "startDate": "1995-03-28T00:00:00Z", "storeId": "manXeTYz"}, {"duration": 68, "endDate": "1990-07-07T00:00:00Z", "entitlementCollectionId": "OU4O9lZ7", "entitlementOrigin": "Oculus", "itemId": "EMehR4IA", "itemSku": "I4F2wd2L", "language": "M7Tnj166", "metadata": {"b27nguZp": {}, "0rI9267c": {}, "Qsn2V33j": {}}, "orderNo": "6MWCziF1", "origin": "Steam", "quantity": 67, "region": "oy4HkAfj", "source": "EXPIRATION", "startDate": "1988-12-26T00:00:00Z", "storeId": "lUM5agsE"}], "transactionId": "WwWi2vbt"}, {"items": [{"duration": 47, "endDate": "1997-07-25T00:00:00Z", "entitlementCollectionId": "ZbkfaQaN", "entitlementOrigin": "Steam", "itemId": "zHIcuOL2", "itemSku": "1hcro9YL", "language": "oGx07Vtj", "metadata": {"DBGHnYCk": {}, "HlTVC6B4": {}, "aUfo39ZZ": {}}, "orderNo": "heiokoPI", "origin": "IOS", "quantity": 46, "region": "X64ZMh3P", "source": "REFERRAL_BONUS", "startDate": "1996-12-12T00:00:00Z", "storeId": "QDQ7C1pY"}, {"duration": 3, "endDate": "1992-07-31T00:00:00Z", "entitlementCollectionId": "V3VWylKp", "entitlementOrigin": "Oculus", "itemId": "dw8RpHd6", "itemSku": "YoBIkHSA", "language": "W9AuUK2t", "metadata": {"aKtcLjI3": {}, "8YMtPC05": {}, "efLFM0EH": {}}, "orderNo": "P8ZCitRh", "origin": "Oculus", "quantity": 77, "region": "H2KTM5Uc", "source": "REDEEM_CODE", "startDate": "1999-12-12T00:00:00Z", "storeId": "DhOfkbPP"}, {"duration": 8, "endDate": "1976-07-09T00:00:00Z", "entitlementCollectionId": "TmdBVPv9", "entitlementOrigin": "System", "itemId": "DPiSx5zh", "itemSku": "ZFhrcGym", "language": "xuhXzJFx", "metadata": {"39xEtCus": {}, "okeMim5M": {}, "BqteIoub": {}}, "orderNo": "mD6NDqbk", "origin": "Xbox", "quantity": 96, "region": "HIQX6YZw", "source": "ORDER_REVOCATION", "startDate": "1998-01-09T00:00:00Z", "storeId": "Dus8dAtm"}], "transactionId": "gLiDmVc4"}, {"items": [{"duration": 57, "endDate": "1991-02-05T00:00:00Z", "entitlementCollectionId": "VwSsP0Xo", "entitlementOrigin": "Xbox", "itemId": "Ta9fCxmn", "itemSku": "smQf88pY", "language": "GmucgGf5", "metadata": {"v2u1js7D": {}, "0IkNwkQu": {}, "eGrDG7Ik": {}}, "orderNo": "CEIA1911", "origin": "Oculus", "quantity": 91, "region": "19weT016", "source": "ORDER_REVOCATION", "startDate": "1988-07-29T00:00:00Z", "storeId": "BpfZCIWi"}, {"duration": 7, "endDate": "1992-10-10T00:00:00Z", "entitlementCollectionId": "YlrsD7EZ", "entitlementOrigin": "Epic", "itemId": "YuOaIuL7", "itemSku": "F3zSEu2q", "language": "2gInMGud", "metadata": {"wjX7RmZw": {}, "xbhcidbD": {}, "Kr48NBIx": {}}, "orderNo": "pxPYHc5B", "origin": "Oculus", "quantity": 69, "region": "lxMLOIMd", "source": "CONSUME_ENTITLEMENT", "startDate": "1999-02-01T00:00:00Z", "storeId": "0uczN2ad"}, {"duration": 88, "endDate": "1989-10-24T00:00:00Z", "entitlementCollectionId": "KwaSsQyf", "entitlementOrigin": "Nintendo", "itemId": "i11dF4Ts", "itemSku": "VFvY80d7", "language": "ETRJ3abs", "metadata": {"XugQORUT": {}, "ku3iBAWx": {}, "ZeybywxC": {}}, "orderNo": "LFX3bNjn", "origin": "Oculus", "quantity": 21, "region": "vAxF5nRS", "source": "REDEEM_CODE", "startDate": "1977-09-23T00:00:00Z", "storeId": "VWayXJ3T"}], "transactionId": "vnxT2gEn"}]' \
    > test.out 2>&1
eval_tap $? 507 'BulkFulfillItemsV3' test.out

#- 508 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'E4u6XUld' \
    --userId 'k3xqWiTN' \
    --body '{"items": [{"duration": 83, "endDate": "1986-02-23T00:00:00Z", "entitlementCollectionId": "keVWO9e8", "entitlementOrigin": "Playstation", "itemId": "n54ZPQRn", "itemSku": "Fp9sqc68", "language": "lxNuS3YX", "metadata": {"arZEW5yO": {}, "YCEVihc0": {}, "0g97uUAx": {}}, "orderNo": "IzI9CYAF", "origin": "IOS", "quantity": 55, "region": "EfY9p9bW", "source": "SELL_BACK", "startDate": "1974-05-28T00:00:00Z", "storeId": "Ews3LGJm"}, {"duration": 62, "endDate": "1983-08-04T00:00:00Z", "entitlementCollectionId": "rLFvg4LR", "entitlementOrigin": "GooglePlay", "itemId": "00O1g2KK", "itemSku": "pHiT1zQX", "language": "asfp2Cz8", "metadata": {"kWviur5P": {}, "ZKHftiTh": {}, "ovSPItcL": {}}, "orderNo": "gU8ZPnkd", "origin": "Other", "quantity": 49, "region": "o0djNng2", "source": "DLC", "startDate": "1986-09-13T00:00:00Z", "storeId": "5LniHqMh"}, {"duration": 89, "endDate": "1997-11-05T00:00:00Z", "entitlementCollectionId": "rx61JZh4", "entitlementOrigin": "Steam", "itemId": "XNCee75w", "itemSku": "pMd1tPb8", "language": "SEaj02jS", "metadata": {"lzzInYDP": {}, "RElIT6LH": {}, "jpCPsbPw": {}}, "orderNo": "D5kNW4k7", "origin": "Twitch", "quantity": 46, "region": "HNYwfvMm", "source": "PROMOTION", "startDate": "1972-06-01T00:00:00Z", "storeId": "e73QGY2Q"}]}' \
    > test.out 2>&1
eval_tap $? 508 'FulfillItemsV3' test.out

#- 509 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '9ZKSvmVR' \
    --userId 'fzLtVjf1' \
    > test.out 2>&1
eval_tap $? 509 'RetryFulfillItemsV3' test.out

#- 510 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'dsNiAsRI' \
    --userId '9CfsGD1o' \
    > test.out 2>&1
eval_tap $? 510 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
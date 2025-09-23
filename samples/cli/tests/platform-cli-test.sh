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
    --id 'bOK92WSs' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '9zKh5AZ3' \
    --body '{"grantDays": "lYu7CsPb"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'yTndljKE' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'nLK6crLE' \
    --body '{"grantDays": "kKcEU5aX"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "5P9YQlT6", "dryRun": true, "fulfillmentUrl": "E2my4Dxc", "itemType": "CODE", "purchaseConditionUrl": "ut7tASud"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'kGn8mkFu' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '51llUOTU' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '7iUaRV9S' \
    --body '{"clazz": "qQoK4Qfj", "dryRun": true, "fulfillmentUrl": "stRSUE4S", "purchaseConditionUrl": "AdiK8OHL"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '2My4yL8e' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --name 'aF4aPK2r' \
    --offset '60' \
    --tag 'Ih50nt6J' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HMPvByl3", "discountConfig": {"categories": [{"categoryPath": "S6igPYym", "includeSubCategories": true}, {"categoryPath": "bZFZlDGa", "includeSubCategories": false}, {"categoryPath": "uMnBRlII", "includeSubCategories": true}], "currencyCode": "wrWygs1n", "currencyNamespace": "1b45fp3r", "discountAmount": 36, "discountPercentage": 16, "discountType": "PERCENTAGE", "items": [{"itemId": "qABGDndZ", "itemName": "0dOgj4ta"}, {"itemId": "TQP0GcxG", "itemName": "tppplCPd"}, {"itemId": "dpyD2kJD", "itemName": "vNy4KFBe"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 49, "itemId": "YRWKzSxV", "itemName": "QLJVI5Bk", "quantity": 39}, {"extraSubscriptionDays": 23, "itemId": "2fWoLwFI", "itemName": "HvquaShV", "quantity": 9}, {"extraSubscriptionDays": 72, "itemId": "yCQLfemm", "itemName": "veY9kv0h", "quantity": 17}], "maxRedeemCountPerCampaignPerUser": 3, "maxRedeemCountPerCode": 14, "maxRedeemCountPerCodePerUser": 29, "maxSaleCount": 55, "name": "oibPdGrq", "redeemEnd": "1989-04-27T00:00:00Z", "redeemStart": "1973-08-07T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["JM4sU7Zi", "8nUQfTKT", "niAKokth"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'WGrozlcU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'lbbZrF5N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "MneIRNt2", "discountConfig": {"categories": [{"categoryPath": "rhlRx9fH", "includeSubCategories": true}, {"categoryPath": "1crr92BF", "includeSubCategories": true}, {"categoryPath": "Zi9p2jAf", "includeSubCategories": false}], "currencyCode": "Qf0SZOcb", "currencyNamespace": "RlV3AJUr", "discountAmount": 73, "discountPercentage": 74, "discountType": "PERCENTAGE", "items": [{"itemId": "bIPDKtKY", "itemName": "465qEHJo"}, {"itemId": "PBZCUV09", "itemName": "n5vC0GX6"}, {"itemId": "YE2jNCap", "itemName": "T20Ne5lJ"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 43, "itemId": "gwGSZsYM", "itemName": "TPPel54j", "quantity": 79}, {"extraSubscriptionDays": 63, "itemId": "ZbHpb5QF", "itemName": "bObywJTH", "quantity": 54}, {"extraSubscriptionDays": 13, "itemId": "isyFoxG9", "itemName": "ZfgzKhTV", "quantity": 9}], "maxRedeemCountPerCampaignPerUser": 14, "maxRedeemCountPerCode": 15, "maxRedeemCountPerCodePerUser": 72, "maxSaleCount": 62, "name": "BApXhB1u", "redeemEnd": "1987-06-28T00:00:00Z", "redeemStart": "1983-10-17T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["3UWvqRcn", "CldH8zr3", "622ltyrK"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId '6IUdTVSO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "cApmoHPo", "oldName": "bnaOFTBt"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'N4BgzVrQ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'cCiAnwce' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'JnqGckxA' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "CAMPAIGN", "ENTITLEMENT"]}' \
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
    --body '{"appConfig": {"appName": "ADDMlNS2"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "3PnAWbGp"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "OCU2lTIN"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "NgfahaQ2"}, "extendType": "APP"}' \
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
    --storeId 'L7SpXU67' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rmLF1F46' \
    --body '{"categoryPath": "uQEOFZUS", "localizationDisplayNames": {"WOxODEe0": "HZuOXKea", "zqcNiRGu": "sK7uFoYo", "CqOI1zIg": "iAWP0gQZ"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cF91LpdK' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'rZHeZImA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pzHlOs3Z' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'vYBFBH7i' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wvWAG5Mv' \
    --body '{"localizationDisplayNames": {"Lqa8rnoX": "R8LgMGVG", "PYnBo9u0": "xHSPAhNV", "uEjz4nWD": "NkGzjTJe"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'NMFyQgCn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rHl915mj' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'XHSLstPv' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0GuNcdvK' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '0LfiRaWI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vBWpzPGb' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'PT2Mi3CG' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'qnsxq5v7' \
    --batchNo '24,86,40' \
    --code 'ZoXhIDDX' \
    --limit '97' \
    --offset '37' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '4x2Jt6zk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "D9BD3dHw", "codeValue": "0gUFVBKL", "quantity": 91}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'IVdZ26da' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'P4x6lpxr' \
    --batchNo '18,33,42' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'VDl4rCrT' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'CurZHq7L' \
    --batchNo '76,14,48' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'crScm36J' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'oGuucgal' \
    --batchNo '23,13,46' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'CfRaAFNw' \
    --namespace "$AB_NAMESPACE" \
    --code 'KEQMFlif' \
    --limit '56' \
    --offset '11' \
    --userId 'LOv8I3Od' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'iodDTtP6' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'WmZ673Iz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'wAcpT220' \
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
    --body '{"currencyCode": "jq4QuxCm", "currencySymbol": "6rZwfbsU", "currencyType": "VIRTUAL", "decimals": 20, "localizationDescriptions": {"HEoqUZSl": "4FsF79oJ", "URSMd7ty": "S1VKIhur", "taZFQq9y": "dNgmPLty"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'PKIVCdrM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"PqaQqBgT": "WJG0Rmfv", "1FDkVNgO": "pU20emcI", "sFDLuc1y": "MOkqv65t"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'SBOKIjzf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '24L2swnZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'aJaI2OsB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId '4GjQmf5a' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'Jd44Dm4t' \
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
    --body '{"data": [{"autoUpdate": false, "enableRevocation": false, "id": "vSGniK3p", "rewards": [{"currency": {"currencyCode": "7V4uYjy4", "namespace": "cuVGERTP"}, "item": {"itemId": "lIKc7o43", "itemName": "2lfnMh4w", "itemSku": "CXmb6LSl", "itemType": "tiM70wlZ"}, "quantity": 28, "type": "ITEM"}, {"currency": {"currencyCode": "l8M6GA0C", "namespace": "rzDQahq4"}, "item": {"itemId": "g5rBKb5y", "itemName": "rx5nsExp", "itemSku": "ede9VUYm", "itemType": "98Nel5fd"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "Bvm6meqc", "namespace": "zv8W1Z5w"}, "item": {"itemId": "OEHm3cWL", "itemName": "QTv80Gmo", "itemSku": "sHwAjIrx", "itemType": "WKlof4Ck"}, "quantity": 44, "type": "ITEM"}], "rvn": 61}, {"autoUpdate": true, "enableRevocation": true, "id": "sfA69gDp", "rewards": [{"currency": {"currencyCode": "u4H8ADLw", "namespace": "FlZQyRR2"}, "item": {"itemId": "eeHuqr8I", "itemName": "geK7hhmq", "itemSku": "InGwpGQk", "itemType": "thPynnis"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "kOEZna6h", "namespace": "E3fvJPFd"}, "item": {"itemId": "j2UzrpvK", "itemName": "tYVup9hM", "itemSku": "DQ7sDXh2", "itemType": "qIogSFOX"}, "quantity": 40, "type": "CURRENCY"}, {"currency": {"currencyCode": "luPXWFXV", "namespace": "s1ZmzInp"}, "item": {"itemId": "eWMAa2sG", "itemName": "BQV3EhiJ", "itemSku": "HnWlf96p", "itemType": "c9UOKqRl"}, "quantity": 19, "type": "ITEM"}], "rvn": 89}, {"autoUpdate": false, "enableRevocation": false, "id": "Qih4hJ68", "rewards": [{"currency": {"currencyCode": "h7efs0Js", "namespace": "LlWz6exd"}, "item": {"itemId": "xQ2o7Xke", "itemName": "2XqCCiye", "itemSku": "1p2JmleT", "itemType": "nqr8Cii9"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "Ud68QoOQ", "namespace": "KSbUvd2x"}, "item": {"itemId": "2KEbcwyC", "itemName": "dA2snmOG", "itemSku": "t9m1qv7c", "itemType": "KkvfAIWU"}, "quantity": 77, "type": "ITEM"}, {"currency": {"currencyCode": "X50wVZKM", "namespace": "LnMqsK9n"}, "item": {"itemId": "a1xkFoyY", "itemName": "BDiDxaBL", "itemSku": "mzu7oete", "itemType": "nOzyE7hx"}, "quantity": 58, "type": "ITEM"}], "rvn": 20}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"n2nR9A7Y": "ReCWM7zz", "PsCkQ4ef": "Fad6Ol9n", "CVz7YNS9": "LWrWe2Wk"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"WVfY2YIF": "2uhMlOqU", "95XGOFUC": "3xY5DKJv", "69dVsHRB": "oHD0eINh"}}, {"platform": "OCULUS", "platformDlcIdMap": {"UQ5zwFd7": "BgpZgP2V", "hgDjpmyH": "0BfCC9jv", "Iz73Soqr": "w3XPOVJm"}}]}' \
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
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'J2JEhL1v' \
    --itemId 'vOLvFl1D,SEZF6AIn,h9lvPzb2' \
    --limit '39' \
    --offset '34' \
    --origin 'Oculus' \
    --userId 'PmOqweuH' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '3BQcz3Lt,6ZUy8NRn,8A62iL9D' \
    --limit '30' \
    --offset '29' \
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
    --body '{"entitlementGrantList": [{"collectionId": "ot2WMwqM", "endDate": "1972-01-12T00:00:00Z", "grantedCode": "zDxUcK0c", "itemId": "N5Hla358", "itemNamespace": "6H6F7ler", "language": "nU", "metadata": {"isIMo6ip": {}, "SAXhJta8": {}, "mYoNTzNX": {}}, "origin": "Playstation", "quantity": 47, "region": "EuBRP7mw", "source": "GIFT", "startDate": "1978-02-02T00:00:00Z", "storeId": "JXBnHt5K"}, {"collectionId": "AfWLD2g3", "endDate": "1999-01-26T00:00:00Z", "grantedCode": "CMwZSOmF", "itemId": "MYUkN0n6", "itemNamespace": "Bmgy97yq", "language": "lzrb_iRsU", "metadata": {"j086Qhql": {}, "hiVLgyE4": {}, "4Y7HLMJ8": {}}, "origin": "System", "quantity": 19, "region": "jzUQw85L", "source": "ACHIEVEMENT", "startDate": "1982-11-09T00:00:00Z", "storeId": "p3HAmH53"}, {"collectionId": "WFZupah3", "endDate": "1994-04-05T00:00:00Z", "grantedCode": "mq4H4Vde", "itemId": "oS8SCWte", "itemNamespace": "SCaz0HNO", "language": "RK", "metadata": {"ieA9kDDG": {}, "YnCVQUaF": {}, "nMmqs4rj": {}}, "origin": "Other", "quantity": 18, "region": "kd7tSidf", "source": "ACHIEVEMENT", "startDate": "1971-07-16T00:00:00Z", "storeId": "amV2mXT0"}], "userIds": ["ZypL37m9", "602bXzJC", "whe6pR1J"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["W93Zg4pd", "HOCTRP5R", "3SnII08f"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'wi3GwBBD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '10' \
    --status 'FAIL' \
    --userId 'tqwOD8jG' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'qbaLTLFC' \
    --eventType 'REFUND' \
    --externalOrderId 'cwDtiCM7' \
    --limit '98' \
    --offset '7' \
    --startTime 'Sly4ljJ9' \
    --status 'IGNORED' \
    --userId '84et5mpn' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "kQrvmIhi", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 34, "clientTransactionId": "4gRQJcFy"}, {"amountConsumed": 21, "clientTransactionId": "JivVVOwc"}, {"amountConsumed": 99, "clientTransactionId": "McapkT4B"}], "entitlementId": "vvC3YB7g", "usageCount": 72}, {"clientTransaction": [{"amountConsumed": 65, "clientTransactionId": "W6sspstt"}, {"amountConsumed": 51, "clientTransactionId": "wApu9hAG"}, {"amountConsumed": 33, "clientTransactionId": "b3IwHR9z"}], "entitlementId": "qiJntkRC", "usageCount": 15}, {"clientTransaction": [{"amountConsumed": 7, "clientTransactionId": "It8goWsR"}, {"amountConsumed": 83, "clientTransactionId": "gYzH54MJ"}, {"amountConsumed": 49, "clientTransactionId": "3mXUvA7k"}], "entitlementId": "PgNlEH8I", "usageCount": 88}], "purpose": "RwKrpfZi"}, "originalTitleName": "zWUL7AtC", "paymentProductSKU": "8Zwf5ajV", "purchaseDate": "6soXTV5s", "sourceOrderItemId": "5EaEPsnd", "titleName": "XI3imO7I"}, "eventDomain": "Zhoxx4ei", "eventSource": "8BPATORT", "eventType": "yJ0l1SzJ", "eventVersion": 77, "id": "jyyVVuc0", "timestamp": "M8BFJx94"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "5awDcVOQ", "eventState": "TKzgvGxh", "lineItemId": "qrLPB8AH", "orderId": "4WQ9AcKP", "productId": "mXN62JDf", "productType": "mfxOek8K", "purchasedDate": "oThUjxb6", "sandboxId": "SpyC30Cg", "skuId": "i9yUQsLp", "subscriptionData": {"consumedDurationInDays": 77, "dateTime": "4AA7LyGg", "durationInDays": 87, "recurrenceId": "RxrvuDyo"}}, "datacontenttype": "AyA66Aen", "id": "Wh7641UH", "source": "8QwfTaw9", "specVersion": "yEgyyZXr", "subject": "HUYJss12", "time": "SIoFAAPt", "traceparent": "5q4Fhu6K", "type": "ko2Bm1g8"}' \
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
    --body '{"appAppleId": 17, "bundleId": "TYdgnYS8", "issuerId": "UpRvaAgL", "keyId": "CUefuzZn", "password": "mdiqB8Re", "version": "V2"}' \
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
    --body '{"sandboxId": "v9ExUqFt"}' \
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
    --body '{"applicationName": "4yQGcsGF", "notificationTokenAudience": "rfEhv5eV", "notificationTokenEmail": "2NjLOcrg", "packageName": "F0uVm1K7", "serviceAccountId": "gvWjeKLJ"}' \
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
    --body '{"data": [{"itemIdentity": "Ox9RhQ7K", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"EaNqKt38": "lYo56NpH", "mankIzhL": "FMkNFxcp", "rUQhu97S": "WPqLtJfN"}}, {"itemIdentity": "4TfaJmRo", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"T9TEikst": "rwk2CWOl", "QfgKRiA6": "PFWPRCtr", "eXxUzI1y": "oNtAAYJE"}}, {"itemIdentity": "pDSMK0mV", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"ZtM5b3Sc": "d4oisyEO", "Af7eCnl2": "7Om8L4Xs", "YPOLQNKV": "AXf6pHeH"}}]}' \
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
    --body '{"appId": "ipH4sHsl", "appSecret": "WxLKIjnY"}' \
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
    --body '{"backOfficeServerClientId": "C74ZDtlW", "backOfficeServerClientSecret": "a08qGsJ5", "enableStreamJob": false, "environment": "OUanpphG", "streamName": "SGe7sXeQ", "streamPartnerName": "8akgqZOt"}' \
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
    --body '{"backOfficeServerClientId": "Da3kbRfs", "backOfficeServerClientSecret": "mGQX4oad", "enableStreamJob": false, "environment": "4YzLZxzR", "streamName": "RQtfY0lJ", "streamPartnerName": "ekzhzeQO"}' \
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
    --body '{"appId": "xY9dUBOe", "env": "LIVE", "publisherAuthenticationKey": "l6cwlDnd", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "zlBRlBcI", "clientSecret": "ge0MLvAK", "organizationId": "AmQ9pOES"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "NTy1jXzQ", "entraAppClientSecret": "1Fw2Ex3t", "entraTenantId": "6kQZD9WI", "relyingPartyCert": "JYOQwjrr"}' \
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
    --password 'xO9yJmwn' \
    > test.out 2>&1
eval_tap $? 107 'UpdateXblBPCertFile' test.out

#- 108 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'KVCyCjnY' \
    --externalId 'hugCBJhr' \
    --limit '46' \
    --offset '25' \
    --source 'OCULUS' \
    --startDate 'ce9krSOl' \
    --status 'ERROR' \
    --type '42prrNe4' \
    > test.out 2>&1
eval_tap $? 108 'QueryThirdPartyNotifications' test.out

#- 109 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '99' \
    --orderId 'MkyAAHvw' \
    --steamId 'Cc0HC57w' \
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
    --body '{"env": "SANDBOX", "lastTime": "1982-11-29T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminResetSteamJobTime' test.out

#- 112 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'WGROj0q9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminRefundIAPOrder' test.out

#- 113 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '94' \
    --orderId 'U9hwbA8N' \
    --processStatus 'PROCESSED' \
    --steamId 'LuwLWGSk' \
    > test.out 2>&1
eval_tap $? 113 'QuerySteamReportHistories' test.out

#- 114 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'gROrBzo8' \
    --limit '1' \
    --offset '32' \
    --platform 'EPICGAMES' \
    --productId '4gs89llG' \
    --userId 'XgUpt4Ag' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartySubscription' test.out

#- 115 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'joIHzCoE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetIAPOrderConsumeDetails' test.out

#- 116 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'zvUJIQF8' \
    --feature 'CsJZDdI7' \
    --itemId '1pN9ojvT' \
    --itemType 'LOOTBOX' \
    --startTime '0YeTjKgp' \
    > test.out 2>&1
eval_tap $? 116 'DownloadInvoiceDetails' test.out

#- 117 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FSRpvR9J' \
    --feature 'Hvz0VWM4' \
    --itemId 'q0yrCCsU' \
    --itemType 'SEASON' \
    --startTime 'P5A2A9Fn' \
    > test.out 2>&1
eval_tap $? 117 'GenerateInvoiceSummary' test.out

#- 118 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '252rdrPr' \
    --body '{"categoryPath": "2xTLje5v", "targetItemId": "7XRqZd4i", "targetNamespace": "pHi06ftk"}' \
    > test.out 2>&1
eval_tap $? 118 'SyncInGameItem' test.out

#- 119 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CLObiCQk' \
    --body '{"appId": "I5fI1tnL", "appType": "SOFTWARE", "baseAppId": "bLhL6ZP7", "boothName": "M9zpvcq2", "categoryPath": "SZTfjyda", "clazz": "80PRGlmm", "displayOrder": 95, "entitlementType": "DURABLE", "ext": {"U2wKElU8": {}, "OugtXviy": {}, "x607Ipjt": {}}, "features": ["uBSrVU9l", "gaJ6XVH4", "112hLI4o"], "flexible": false, "images": [{"as": "MUlglzr9", "caption": "kpLxMLaJ", "height": 3, "imageUrl": "DMCPeqG0", "smallImageUrl": "yhRLxXKY", "width": 69}, {"as": "QPwOtm6o", "caption": "9J13iCcb", "height": 57, "imageUrl": "0rYjZLlI", "smallImageUrl": "ceFgJ7QC", "width": 65}, {"as": "r2btuVB7", "caption": "pBT4M6RE", "height": 99, "imageUrl": "koowYKkY", "smallImageUrl": "8Z0J6dXO", "width": 86}], "inventoryConfig": {"customAttributes": {"4V3hFL1d": {}, "NT8jHnwE": {}, "yy1LzfLf": {}}, "serverCustomAttributes": {"QYKLYPrX": {}, "jJZEeRcs": {}, "JIcxAt79": {}}, "slotUsed": 56}, "itemIds": ["GKc6T3e2", "Px9E4JbA", "FwoQLXvj"], "itemQty": {"Y53dQMsO": 25, "wn49DWBK": 41, "aZpweShc": 56}, "itemType": "BUNDLE", "listable": false, "localizations": {"vMsGJ8sN": {"description": "QLyetyCR", "localExt": {"jR8LMdHQ": {}, "z4Ag45K9": {}, "SBF4ug4J": {}}, "longDescription": "ZkoHNGtj", "title": "FhySXGVK"}, "q50FQyUE": {"description": "k9a14irO", "localExt": {"KHj0qSzN": {}, "Z1qB1UtI": {}, "XMl5J0YM": {}}, "longDescription": "A4xDqViQ", "title": "M1UXxVKC"}, "JXL42eAP": {"description": "HCwt2Nm9", "localExt": {"dsztghLY": {}, "Jg6iK4W8": {}, "dBaxGxEU": {}}, "longDescription": "KIiSLW6U", "title": "TpoEjRTT"}}, "lootBoxConfig": {"rewardCount": 77, "rewards": [{"lootBoxItems": [{"count": 43, "duration": 42, "endDate": "1996-12-18T00:00:00Z", "itemId": "ZaVAWKBm", "itemSku": "8JvNK14a", "itemType": "TuZRgd6w"}, {"count": 84, "duration": 65, "endDate": "1999-03-12T00:00:00Z", "itemId": "IftqPage", "itemSku": "HBOGXAjT", "itemType": "ILT5TYkA"}, {"count": 66, "duration": 85, "endDate": "1974-12-01T00:00:00Z", "itemId": "inmYLDkO", "itemSku": "eXLrWNwy", "itemType": "3ZneKLRD"}], "name": "m7NITF4p", "odds": 0.18952544473264088, "type": "PROBABILITY_GROUP", "weight": 12}, {"lootBoxItems": [{"count": 74, "duration": 47, "endDate": "1983-12-02T00:00:00Z", "itemId": "yYmammBA", "itemSku": "Im9ANKFr", "itemType": "cC6y5U6Y"}, {"count": 8, "duration": 70, "endDate": "1996-07-20T00:00:00Z", "itemId": "sgA0dD9H", "itemSku": "JFbg6gAo", "itemType": "noax9QNZ"}, {"count": 45, "duration": 76, "endDate": "1984-03-10T00:00:00Z", "itemId": "MiO6Orov", "itemSku": "BxZKZNhD", "itemType": "1hMKlS60"}], "name": "wfTyPcbO", "odds": 0.14261285631627652, "type": "REWARD", "weight": 86}, {"lootBoxItems": [{"count": 44, "duration": 76, "endDate": "1976-04-04T00:00:00Z", "itemId": "3T6neJ62", "itemSku": "P3x73BHz", "itemType": "KfbLGbvZ"}, {"count": 8, "duration": 81, "endDate": "1977-05-12T00:00:00Z", "itemId": "RBrRTPUs", "itemSku": "JUozLx2H", "itemType": "Apep2GnT"}, {"count": 100, "duration": 33, "endDate": "1992-01-04T00:00:00Z", "itemId": "UdwNBQIc", "itemSku": "BTolc35G", "itemType": "u2By9Bp4"}], "name": "CMxssdsB", "odds": 0.9170340748019387, "type": "REWARD", "weight": 24}], "rollFunction": "DEFAULT"}, "maxCount": 3, "maxCountPerUser": 93, "name": "ATM8TEZN", "optionBoxConfig": {"boxItems": [{"count": 56, "duration": 29, "endDate": "1980-09-26T00:00:00Z", "itemId": "QhDCCK95", "itemSku": "gYJ2t21a", "itemType": "QUGRFZej"}, {"count": 7, "duration": 41, "endDate": "1973-09-03T00:00:00Z", "itemId": "nmnPJifI", "itemSku": "JTd9yU8t", "itemType": "MoN3NHgq"}, {"count": 42, "duration": 71, "endDate": "1994-08-23T00:00:00Z", "itemId": "Qz6ITi2y", "itemSku": "Jpr3TQMh", "itemType": "tK4ddXH9"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 82, "fixedTrialCycles": 46, "graceDays": 73}, "regionData": {"2AToN8kG": [{"currencyCode": "gRx7mqIY", "currencyNamespace": "Jqbw8tqm", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1971-04-23T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1974-05-11T00:00:00Z", "expireAt": "1990-06-06T00:00:00Z", "price": 62, "purchaseAt": "1972-05-20T00:00:00Z", "trialPrice": 17}, {"currencyCode": "W2Da5V6r", "currencyNamespace": "LUJuJvTa", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1971-09-24T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1971-10-28T00:00:00Z", "expireAt": "1991-01-20T00:00:00Z", "price": 22, "purchaseAt": "1996-12-21T00:00:00Z", "trialPrice": 35}, {"currencyCode": "WES25Xqr", "currencyNamespace": "vePaBSPi", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1972-07-13T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1996-10-01T00:00:00Z", "expireAt": "1991-06-14T00:00:00Z", "price": 90, "purchaseAt": "1991-12-14T00:00:00Z", "trialPrice": 100}], "vj92yHw7": [{"currencyCode": "I4nWqmTB", "currencyNamespace": "AsEqEKDo", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1993-09-29T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1972-06-17T00:00:00Z", "expireAt": "1977-06-01T00:00:00Z", "price": 22, "purchaseAt": "1971-06-05T00:00:00Z", "trialPrice": 19}, {"currencyCode": "4x5TUdsx", "currencyNamespace": "YlMfKzpx", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1998-03-01T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1975-08-12T00:00:00Z", "expireAt": "1973-11-12T00:00:00Z", "price": 51, "purchaseAt": "1994-12-13T00:00:00Z", "trialPrice": 1}, {"currencyCode": "0rv2BSS1", "currencyNamespace": "VyJwAsCe", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1980-03-29T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1980-09-26T00:00:00Z", "expireAt": "1974-01-28T00:00:00Z", "price": 82, "purchaseAt": "1985-01-01T00:00:00Z", "trialPrice": 86}], "hswyWxks": [{"currencyCode": "a0M2J7Kc", "currencyNamespace": "ABF3Mc9k", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1984-04-08T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1995-07-25T00:00:00Z", "expireAt": "1974-03-30T00:00:00Z", "price": 38, "purchaseAt": "1997-08-05T00:00:00Z", "trialPrice": 68}, {"currencyCode": "arvtkl4O", "currencyNamespace": "Qpx6767i", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1973-03-05T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1977-11-01T00:00:00Z", "expireAt": "1989-10-14T00:00:00Z", "price": 59, "purchaseAt": "1980-11-20T00:00:00Z", "trialPrice": 16}, {"currencyCode": "Efq3d4nw", "currencyNamespace": "23rc53GI", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1988-05-02T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1984-11-14T00:00:00Z", "expireAt": "1997-05-06T00:00:00Z", "price": 19, "purchaseAt": "1986-08-29T00:00:00Z", "trialPrice": 92}]}, "saleConfig": {"currencyCode": "JwN3xC2l", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "qRZzvzfk", "stackable": true, "status": "ACTIVE", "tags": ["bXhh7fxi", "rd2l57hX", "zoQEKW8c"], "targetCurrencyCode": "jm5hgUDA", "targetNamespace": "rUeTv7nz", "thumbnailUrl": "NnyrKUdk", "useCount": 2}' \
    > test.out 2>&1
eval_tap $? 119 'CreateItem' test.out

#- 120 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Wgh2gAET' \
    --appId 'vgjgszYH' \
    > test.out 2>&1
eval_tap $? 120 'GetItemByAppId' test.out

#- 121 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate '3YHkl4q2' \
    --baseAppId 'NGNdmPGV' \
    --categoryPath 'RPvZ6tG3' \
    --features 'Gpr9OiMu' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '4' \
    --offset '99' \
    --region 'uIRx7Jnu' \
    --sortBy 'displayOrder,name:desc,createdAt:desc' \
    --storeId 'gKZxWd7I' \
    --tags 'dAS1dGx6' \
    --targetNamespace 'NZyf11jZ' \
    > test.out 2>&1
eval_tap $? 121 'QueryItems' test.out

#- 122 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'sIsx3OjH,6tnq4old,tVlcblMN' \
    > test.out 2>&1
eval_tap $? 122 'ListBasicItemsByFeatures' test.out

#- 123 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'jQzESqa7' \
    --itemIds 'lTe3wUVC' \
    > test.out 2>&1
eval_tap $? 123 'GetItems' test.out

#- 124 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'H85zqMG7' \
    --sku 'RzPnv8qB' \
    > test.out 2>&1
eval_tap $? 124 'GetItemBySku' test.out

#- 125 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '5nfh5541' \
    --populateBundle  \
    --region 'gYqQulsI' \
    --storeId 'qHdSTNqQ' \
    --sku '3Z4cxx6h' \
    > test.out 2>&1
eval_tap $? 125 'GetLocaleItemBySku' test.out

#- 126 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'geMgYbsz' \
    --region 'yhLilNlS' \
    --storeId '4QRTrWst' \
    --itemIds '8CbEXEJM' \
    --userId 'XhsVFMT4' \
    > test.out 2>&1
eval_tap $? 126 'GetEstimatedPrice' test.out

#- 127 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '14YW9iqQ' \
    --sku 'Nmbystvm' \
    > test.out 2>&1
eval_tap $? 127 'GetItemIdBySku' test.out

#- 128 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'T79IDJtd,n50KGv9F,gfJRAOkj' \
    --storeId 'piCE3kzx' \
    > test.out 2>&1
eval_tap $? 128 'GetBulkItemIdBySkus' test.out

#- 129 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'l65cjIX1' \
    --region 'jnCYrHWn' \
    --storeId 'nZwenSjQ' \
    --itemIds 'N8zvX64J' \
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
    --platform 'w5s0aPFu' \
    --userId '15NR4I4S' \
    --body '{"itemIds": ["dFfxi0QC", "qlWLgvil", "q9lf4Qa0"]}' \
    > test.out 2>&1
eval_tap $? 131 'ValidateItemPurchaseCondition' test.out

#- 132 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LZHGd0vz' \
    --body '{"changes": [{"itemIdentities": ["lRx5JI1r", "GHGt7BVK", "I5nsrwHq"], "itemIdentityType": "ITEM_ID", "regionData": {"9U9P6VrW": [{"currencyCode": "qihDufuE", "currencyNamespace": "ofZJKdty", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1988-03-12T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1997-01-30T00:00:00Z", "discountedPrice": 43, "expireAt": "1991-12-11T00:00:00Z", "price": 74, "purchaseAt": "1986-04-25T00:00:00Z", "trialPrice": 37}, {"currencyCode": "1KykQkVW", "currencyNamespace": "JVzWrHMy", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1995-08-16T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1978-10-01T00:00:00Z", "discountedPrice": 70, "expireAt": "1997-03-17T00:00:00Z", "price": 74, "purchaseAt": "1990-01-01T00:00:00Z", "trialPrice": 81}, {"currencyCode": "4YBp77Gy", "currencyNamespace": "FnmHkqs3", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1997-11-02T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1978-09-19T00:00:00Z", "discountedPrice": 56, "expireAt": "1994-01-15T00:00:00Z", "price": 98, "purchaseAt": "1992-02-09T00:00:00Z", "trialPrice": 16}], "iYINUrOP": [{"currencyCode": "AVacl4NT", "currencyNamespace": "dYpmrTFY", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1977-02-28T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1974-09-14T00:00:00Z", "discountedPrice": 11, "expireAt": "1996-11-01T00:00:00Z", "price": 62, "purchaseAt": "1981-08-03T00:00:00Z", "trialPrice": 15}, {"currencyCode": "TVktDa9Q", "currencyNamespace": "vHY2u6Z2", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1996-11-07T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1995-03-08T00:00:00Z", "discountedPrice": 87, "expireAt": "1991-12-06T00:00:00Z", "price": 68, "purchaseAt": "1984-12-14T00:00:00Z", "trialPrice": 65}, {"currencyCode": "qsogB3Wt", "currencyNamespace": "3gSBjzdi", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1984-01-23T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1988-06-28T00:00:00Z", "discountedPrice": 7, "expireAt": "1978-10-15T00:00:00Z", "price": 24, "purchaseAt": "1998-09-05T00:00:00Z", "trialPrice": 56}], "4mWrT7be": [{"currencyCode": "rsTuKKHs", "currencyNamespace": "VM0G0hOf", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1989-02-14T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1986-02-13T00:00:00Z", "discountedPrice": 99, "expireAt": "1983-06-22T00:00:00Z", "price": 55, "purchaseAt": "1998-03-24T00:00:00Z", "trialPrice": 60}, {"currencyCode": "o29QM1P6", "currencyNamespace": "c3I3be3p", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1977-10-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1993-08-26T00:00:00Z", "discountedPrice": 72, "expireAt": "1983-09-09T00:00:00Z", "price": 46, "purchaseAt": "1997-03-19T00:00:00Z", "trialPrice": 34}, {"currencyCode": "kXKqVSay", "currencyNamespace": "hY1xuxwY", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1983-10-31T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1984-06-13T00:00:00Z", "discountedPrice": 68, "expireAt": "1992-09-13T00:00:00Z", "price": 1, "purchaseAt": "1987-03-15T00:00:00Z", "trialPrice": 60}]}}, {"itemIdentities": ["xoJ1PaGI", "wnV0u9j4", "Y3w60ttA"], "itemIdentityType": "ITEM_ID", "regionData": {"d8WBM8Q0": [{"currencyCode": "M50F7T4V", "currencyNamespace": "XYd6CqdG", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1978-01-15T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1981-09-26T00:00:00Z", "discountedPrice": 5, "expireAt": "1991-10-22T00:00:00Z", "price": 92, "purchaseAt": "1991-10-04T00:00:00Z", "trialPrice": 41}, {"currencyCode": "wTVnJbMq", "currencyNamespace": "9gcRGzRC", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1974-07-15T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1995-12-15T00:00:00Z", "discountedPrice": 65, "expireAt": "1983-08-30T00:00:00Z", "price": 74, "purchaseAt": "1971-04-23T00:00:00Z", "trialPrice": 45}, {"currencyCode": "3copovnT", "currencyNamespace": "OUB3SDgf", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1996-04-19T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1996-07-25T00:00:00Z", "discountedPrice": 12, "expireAt": "1979-02-02T00:00:00Z", "price": 4, "purchaseAt": "1991-01-17T00:00:00Z", "trialPrice": 19}], "XvhfmYw3": [{"currencyCode": "LozyHP7s", "currencyNamespace": "TPWmuCM8", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1989-08-30T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1979-11-21T00:00:00Z", "discountedPrice": 97, "expireAt": "1994-09-08T00:00:00Z", "price": 100, "purchaseAt": "1980-08-16T00:00:00Z", "trialPrice": 87}, {"currencyCode": "QG9FRSHP", "currencyNamespace": "2kWpLrSn", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1971-08-21T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1993-08-23T00:00:00Z", "discountedPrice": 5, "expireAt": "1990-08-26T00:00:00Z", "price": 38, "purchaseAt": "1999-09-19T00:00:00Z", "trialPrice": 4}, {"currencyCode": "Q0JQigna", "currencyNamespace": "PoSf546X", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1993-06-21T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1982-01-27T00:00:00Z", "discountedPrice": 17, "expireAt": "1994-03-01T00:00:00Z", "price": 85, "purchaseAt": "1992-03-17T00:00:00Z", "trialPrice": 43}], "YNzPxYgv": [{"currencyCode": "EJZosg2d", "currencyNamespace": "8skUezRL", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1992-04-26T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1979-06-18T00:00:00Z", "discountedPrice": 17, "expireAt": "1995-02-08T00:00:00Z", "price": 31, "purchaseAt": "1974-03-03T00:00:00Z", "trialPrice": 89}, {"currencyCode": "KfxQX1DF", "currencyNamespace": "EFF1jKoK", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1978-01-22T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1994-04-07T00:00:00Z", "discountedPrice": 7, "expireAt": "1973-04-27T00:00:00Z", "price": 19, "purchaseAt": "1991-08-24T00:00:00Z", "trialPrice": 47}, {"currencyCode": "gktDqa2j", "currencyNamespace": "kFSXchiL", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1971-11-30T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1995-09-20T00:00:00Z", "discountedPrice": 97, "expireAt": "1981-08-01T00:00:00Z", "price": 82, "purchaseAt": "1978-01-21T00:00:00Z", "trialPrice": 78}]}}, {"itemIdentities": ["frU8Q1dV", "PPOEhOp5", "j134YGNx"], "itemIdentityType": "ITEM_SKU", "regionData": {"nKra2E4d": [{"currencyCode": "MOIbwysM", "currencyNamespace": "EyfOkdbe", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1973-01-31T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1985-03-14T00:00:00Z", "discountedPrice": 71, "expireAt": "1994-04-26T00:00:00Z", "price": 19, "purchaseAt": "1974-10-19T00:00:00Z", "trialPrice": 10}, {"currencyCode": "DDFiVQaM", "currencyNamespace": "GbyKaFoJ", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1978-09-11T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1986-12-21T00:00:00Z", "discountedPrice": 9, "expireAt": "1999-06-24T00:00:00Z", "price": 6, "purchaseAt": "1987-12-27T00:00:00Z", "trialPrice": 88}, {"currencyCode": "xSOEdnYC", "currencyNamespace": "cTxaIzok", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1980-03-31T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1987-08-06T00:00:00Z", "discountedPrice": 75, "expireAt": "1972-12-01T00:00:00Z", "price": 40, "purchaseAt": "1989-05-09T00:00:00Z", "trialPrice": 85}], "Ve5q7Fur": [{"currencyCode": "VaivD8tL", "currencyNamespace": "VTd0zvg2", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1993-02-07T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1981-07-11T00:00:00Z", "discountedPrice": 1, "expireAt": "1998-03-17T00:00:00Z", "price": 82, "purchaseAt": "1973-06-07T00:00:00Z", "trialPrice": 23}, {"currencyCode": "VfHngMJZ", "currencyNamespace": "bp4u3Co2", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1973-06-02T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1977-08-17T00:00:00Z", "discountedPrice": 22, "expireAt": "1973-06-07T00:00:00Z", "price": 96, "purchaseAt": "1975-11-13T00:00:00Z", "trialPrice": 26}, {"currencyCode": "YGwVXiMB", "currencyNamespace": "Ue6KAef7", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1983-05-23T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1993-04-24T00:00:00Z", "discountedPrice": 9, "expireAt": "1990-09-23T00:00:00Z", "price": 95, "purchaseAt": "1982-09-15T00:00:00Z", "trialPrice": 80}], "qr3hyCVp": [{"currencyCode": "yG2n9J3j", "currencyNamespace": "OOnGTb5M", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1992-07-04T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1983-04-07T00:00:00Z", "discountedPrice": 27, "expireAt": "1972-11-20T00:00:00Z", "price": 37, "purchaseAt": "1997-09-17T00:00:00Z", "trialPrice": 10}, {"currencyCode": "jjVBw76T", "currencyNamespace": "70Cmvwi6", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1992-06-16T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1976-06-14T00:00:00Z", "discountedPrice": 99, "expireAt": "1989-03-13T00:00:00Z", "price": 58, "purchaseAt": "1974-05-22T00:00:00Z", "trialPrice": 7}, {"currencyCode": "rUe5kFDS", "currencyNamespace": "99znbyEw", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1972-10-11T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1972-12-23T00:00:00Z", "discountedPrice": 95, "expireAt": "1985-04-02T00:00:00Z", "price": 29, "purchaseAt": "1983-02-18T00:00:00Z", "trialPrice": 98}]}}]}' \
    > test.out 2>&1
eval_tap $? 132 'BulkUpdateRegionData' test.out

#- 133 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '69' \
    --offset '4' \
    --sortBy 'yZyiDWe0' \
    --storeId '9G16Fv2P' \
    --keyword 'Aqrf7lok' \
    --language 'N2GX3kvh' \
    > test.out 2>&1
eval_tap $? 133 'SearchItems' test.out

#- 134 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '33' \
    --offset '77' \
    --sortBy 'createdAt:asc,updatedAt:desc,createdAt' \
    --storeId 'x8Gl4a6x' \
    > test.out 2>&1
eval_tap $? 134 'QueryUncategorizedItems' test.out

#- 135 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'xR9xAdNQ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nhQdVhT1' \
    > test.out 2>&1
eval_tap $? 135 'GetItem' test.out

#- 136 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'KA6pAMnJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'He1XqOIl' \
    --body '{"appId": "n8PzhR4x", "appType": "SOFTWARE", "baseAppId": "hDj7KJYK", "boothName": "NkvL50v8", "categoryPath": "zmuSi87j", "clazz": "hBqFwgDR", "displayOrder": 88, "entitlementType": "DURABLE", "ext": {"vQBDHvb1": {}, "6gA2vP3f": {}, "i2iEkodC": {}}, "features": ["LsVN85No", "kSCVnJVu", "3mynDhjb"], "flexible": false, "images": [{"as": "Z8hWYd6U", "caption": "7qOhUVmh", "height": 26, "imageUrl": "LqQUyodx", "smallImageUrl": "bdDRs7YQ", "width": 15}, {"as": "NwpD9LLO", "caption": "9QzI6Bhv", "height": 87, "imageUrl": "AEM4REA0", "smallImageUrl": "pntmWiq9", "width": 85}, {"as": "SJBuML6H", "caption": "6hXYcFI4", "height": 22, "imageUrl": "AFwyyNGF", "smallImageUrl": "jtgq34fg", "width": 3}], "inventoryConfig": {"customAttributes": {"Id1qDvLP": {}, "sKVYJj1S": {}, "ZrjbbtcS": {}}, "serverCustomAttributes": {"6e1BsfpD": {}, "01C11NBW": {}, "nUIDHY5s": {}}, "slotUsed": 34}, "itemIds": ["4WahAc1n", "zT8eQeVl", "aMb64oke"], "itemQty": {"YNyshgal": 70, "EGftwEUb": 99, "AELOOuBe": 76}, "itemType": "CODE", "listable": false, "localizations": {"V9lcPy1s": {"description": "x7Rdq5ku", "localExt": {"cSa69D9s": {}, "5rLaFdbk": {}, "9U2n3BCc": {}}, "longDescription": "b7qqpjCv", "title": "Kh0fUdJH"}, "6W8C6QHW": {"description": "D7Zj0G4V", "localExt": {"4PiFAz1Y": {}, "fHPpxcsu": {}, "lR4H753K": {}}, "longDescription": "Dn4X3caw", "title": "0uLdqYjg"}, "r3htPy8f": {"description": "9D6O0H2v", "localExt": {"OWQTaMm0": {}, "Jt60cmYb": {}, "SZTuJZaU": {}}, "longDescription": "VVYJzAUp", "title": "TYqPcNrw"}}, "lootBoxConfig": {"rewardCount": 94, "rewards": [{"lootBoxItems": [{"count": 96, "duration": 38, "endDate": "1981-08-16T00:00:00Z", "itemId": "yeLpCVsR", "itemSku": "wedvtjpM", "itemType": "pevmm5zG"}, {"count": 55, "duration": 100, "endDate": "1984-11-15T00:00:00Z", "itemId": "CuIhv2f6", "itemSku": "5rDwobfD", "itemType": "SdR1tMnk"}, {"count": 80, "duration": 14, "endDate": "1991-08-15T00:00:00Z", "itemId": "3X2eRlAb", "itemSku": "awxShH0b", "itemType": "WGsqIFC8"}], "name": "SxYZ5S2u", "odds": 0.20580009982139646, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 16, "duration": 48, "endDate": "1973-12-05T00:00:00Z", "itemId": "ANt7M73t", "itemSku": "zLDFmoEu", "itemType": "3Sqtd2HJ"}, {"count": 97, "duration": 1, "endDate": "1999-03-07T00:00:00Z", "itemId": "jmF7DBGc", "itemSku": "bnBjVJrl", "itemType": "UPxNn7KD"}, {"count": 49, "duration": 70, "endDate": "1993-12-05T00:00:00Z", "itemId": "tTBe0qfJ", "itemSku": "FLXXThxn", "itemType": "8SiS7TMM"}], "name": "AcFVgwLK", "odds": 0.9728762265282264, "type": "REWARD", "weight": 32}, {"lootBoxItems": [{"count": 17, "duration": 5, "endDate": "1993-07-10T00:00:00Z", "itemId": "bTwO262Y", "itemSku": "1MkIwDX0", "itemType": "8rRYYYpY"}, {"count": 24, "duration": 18, "endDate": "1990-10-22T00:00:00Z", "itemId": "p7j0b8MR", "itemSku": "A9Mh1ZMx", "itemType": "ukDPcbOe"}, {"count": 65, "duration": 47, "endDate": "1999-01-12T00:00:00Z", "itemId": "KJr5zUd8", "itemSku": "4NDa2X9y", "itemType": "bZbS4i9F"}], "name": "IGXB0UH5", "odds": 0.4806012566922294, "type": "REWARD", "weight": 13}], "rollFunction": "DEFAULT"}, "maxCount": 16, "maxCountPerUser": 21, "name": "fpxKfSPX", "optionBoxConfig": {"boxItems": [{"count": 63, "duration": 57, "endDate": "1973-04-17T00:00:00Z", "itemId": "cO4HXE3J", "itemSku": "sBLbqKKT", "itemType": "PS2hQDx1"}, {"count": 13, "duration": 8, "endDate": "1986-09-12T00:00:00Z", "itemId": "T3G8fAP0", "itemSku": "GyNCrIBK", "itemType": "IecChQ5J"}, {"count": 11, "duration": 27, "endDate": "1972-04-04T00:00:00Z", "itemId": "MEwBOIwG", "itemSku": "c8OLRvSY", "itemType": "B3BU6L6G"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 73, "fixedTrialCycles": 72, "graceDays": 0}, "regionData": {"myjuAKDr": [{"currencyCode": "ijIVRtCi", "currencyNamespace": "9ohO3omG", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1984-04-29T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1975-08-27T00:00:00Z", "expireAt": "1999-08-29T00:00:00Z", "price": 72, "purchaseAt": "1992-09-26T00:00:00Z", "trialPrice": 19}, {"currencyCode": "ENEAVWiW", "currencyNamespace": "nekVtPZ9", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1978-11-28T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1974-01-23T00:00:00Z", "expireAt": "1978-01-12T00:00:00Z", "price": 96, "purchaseAt": "1979-07-21T00:00:00Z", "trialPrice": 17}, {"currencyCode": "56G2yA6f", "currencyNamespace": "zpdOBuoU", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1998-09-17T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1981-02-13T00:00:00Z", "expireAt": "1977-11-17T00:00:00Z", "price": 28, "purchaseAt": "1982-07-09T00:00:00Z", "trialPrice": 80}], "fxgGiVlt": [{"currencyCode": "OD5zY8Vd", "currencyNamespace": "DPNdcjdA", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1974-11-10T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1985-04-24T00:00:00Z", "expireAt": "1972-06-28T00:00:00Z", "price": 97, "purchaseAt": "1975-06-25T00:00:00Z", "trialPrice": 19}, {"currencyCode": "mobxRuiq", "currencyNamespace": "owGY8TPT", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1992-09-20T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1994-11-20T00:00:00Z", "expireAt": "1998-03-16T00:00:00Z", "price": 26, "purchaseAt": "1979-12-23T00:00:00Z", "trialPrice": 31}, {"currencyCode": "FZnwbZje", "currencyNamespace": "YjfJDvRL", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1973-07-22T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1972-03-09T00:00:00Z", "expireAt": "1994-01-22T00:00:00Z", "price": 3, "purchaseAt": "1989-05-21T00:00:00Z", "trialPrice": 7}], "UBJDBCMJ": [{"currencyCode": "RS3w88z0", "currencyNamespace": "gacBf7sl", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1999-09-30T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1984-03-01T00:00:00Z", "expireAt": "1977-06-04T00:00:00Z", "price": 48, "purchaseAt": "1995-08-30T00:00:00Z", "trialPrice": 35}, {"currencyCode": "gu8KBvr8", "currencyNamespace": "CnA2dqPZ", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1982-01-04T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1983-09-24T00:00:00Z", "expireAt": "1986-03-03T00:00:00Z", "price": 24, "purchaseAt": "1973-05-08T00:00:00Z", "trialPrice": 27}, {"currencyCode": "yUngN6xy", "currencyNamespace": "hA1wDJix", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1993-04-11T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1993-12-07T00:00:00Z", "expireAt": "1999-02-22T00:00:00Z", "price": 72, "purchaseAt": "1994-03-17T00:00:00Z", "trialPrice": 70}]}, "saleConfig": {"currencyCode": "fZTubL02", "price": 77}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "qQlCTIYl", "stackable": true, "status": "INACTIVE", "tags": ["BZzXZpDD", "y4qvWJ2q", "atQrKALj"], "targetCurrencyCode": "BQ1xneXs", "targetNamespace": "38nzCBhQ", "thumbnailUrl": "9BKNddZQ", "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateItem' test.out

#- 137 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'nYah1yT9' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,DLC,CAMPAIGN' \
    --force  \
    --storeId 'N2bjpf9d' \
    > test.out 2>&1
eval_tap $? 137 'DeleteItem' test.out

#- 138 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'HFjOUgEb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83, "orderNo": "WVQvlkaQ"}' \
    > test.out 2>&1
eval_tap $? 138 'AcquireItem' test.out

#- 139 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'CkRpwGly' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'azlZsMiu' \
    > test.out 2>&1
eval_tap $? 139 'GetApp' test.out

#- 140 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '0hDVqJGB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'boebxt6i' \
    --body '{"carousel": [{"alt": "UjZ1wiZ2", "previewUrl": "oqILU4qw", "thumbnailUrl": "56bArxvl", "type": "video", "url": "nWDNLv9p", "videoSource": "vimeo"}, {"alt": "GSfYpU6N", "previewUrl": "nww5xPeo", "thumbnailUrl": "mbN5GrrK", "type": "video", "url": "qVoYvAZ8", "videoSource": "youtube"}, {"alt": "MkvvgnPf", "previewUrl": "xTjAtFxf", "thumbnailUrl": "VR11xKoQ", "type": "image", "url": "YDnYR81F", "videoSource": "youtube"}], "developer": "xxMzxlI9", "forumUrl": "1QKkV2KF", "genres": ["MassivelyMultiplayer", "MassivelyMultiplayer", "Action"], "localizations": {"xtNYHdVs": {"announcement": "KPdj8Pwl", "slogan": "QvmT0pkj"}, "vsLuyyrR": {"announcement": "DU1Z15Az", "slogan": "798LFeYa"}, "pfRiwfzx": {"announcement": "9fNLRNWO", "slogan": "ov6y7177"}}, "platformRequirements": {"CmIxhfEl": [{"additionals": "m42bBHaq", "directXVersion": "xhiloFWB", "diskSpace": "cvDp5PR5", "graphics": "kaJ0isy3", "label": "muaBSppF", "osVersion": "VIxEnJ2d", "processor": "ptSqEwvF", "ram": "ePQpZsZl", "soundCard": "LwPsO5Lq"}, {"additionals": "wngND5cu", "directXVersion": "jS1CSvV4", "diskSpace": "QFgrCdB7", "graphics": "KhCseCIu", "label": "hBDLdsAV", "osVersion": "Aw83frH4", "processor": "am2byU6y", "ram": "4HgIl0gC", "soundCard": "WUyV5YuW"}, {"additionals": "sGLiAnIN", "directXVersion": "hqOyvRRm", "diskSpace": "dAQIbj1r", "graphics": "tZgQfgue", "label": "biKrLt6K", "osVersion": "sUgAGxu5", "processor": "OBS9SV5L", "ram": "gJJ9fRq2", "soundCard": "UFFmiacG"}], "gwECk92a": [{"additionals": "B68UrEQ8", "directXVersion": "BMyQh6ag", "diskSpace": "P7xpkFkd", "graphics": "XxRam2H6", "label": "OuP3zirj", "osVersion": "WAeiPyYn", "processor": "PhlV43un", "ram": "MN0qDE3a", "soundCard": "FmfOri3j"}, {"additionals": "SSikzO5Q", "directXVersion": "4H58SPe4", "diskSpace": "UksqDLOt", "graphics": "WbllancF", "label": "RqeNkuiY", "osVersion": "e3cEFRf3", "processor": "JmHjBISi", "ram": "hCIAhKnT", "soundCard": "qTwXKZk7"}, {"additionals": "ZtyVpdqU", "directXVersion": "SJDDNMaS", "diskSpace": "2rxmVbsF", "graphics": "1za28QyT", "label": "MQBMNkeB", "osVersion": "nqCg5rmx", "processor": "JJHXrrRm", "ram": "Wyv3LG90", "soundCard": "UmFF4jCD"}], "VscRHKof": [{"additionals": "yxNKfaOu", "directXVersion": "tHXevNtE", "diskSpace": "Y6xyEnH2", "graphics": "vVNInlRv", "label": "vUu4iGXX", "osVersion": "dH2ACGeN", "processor": "LZoj5GVI", "ram": "I79FhNEQ", "soundCard": "kD2lQzRN"}, {"additionals": "mPZjHuAK", "directXVersion": "lCauG3Z4", "diskSpace": "ISPjafOS", "graphics": "wGbuwB1G", "label": "RkWf0glp", "osVersion": "kapewTrS", "processor": "5NdU2pUa", "ram": "BSW6PHB2", "soundCard": "YGtxk05c"}, {"additionals": "gleUVokC", "directXVersion": "38oHD1U8", "diskSpace": "rV846Xma", "graphics": "K6h1xYRM", "label": "zhC1F3u9", "osVersion": "BcHhjDCw", "processor": "xKsupbF2", "ram": "fjwiOQdd", "soundCard": "IIoEZpF3"}]}, "platforms": ["MacOS", "Linux", "Linux"], "players": ["Coop", "LocalCoop", "Coop"], "primaryGenre": "Strategy", "publisher": "lkqut6f9", "releaseDate": "1982-12-11T00:00:00Z", "websiteUrl": "9xlC6KDa"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateApp' test.out

#- 141 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '7FWQ19Ub' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9DEzjp1g' \
    --body '{"featuresToCheck": ["IAP", "DLC", "ENTITLEMENT"]}' \
    > test.out 2>&1
eval_tap $? 141 'DisableItem' test.out

#- 142 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '6VSg1Aeq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetItemDynamicData' test.out

#- 143 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'xN4FiwZE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XZVRcejM' \
    > test.out 2>&1
eval_tap $? 143 'EnableItem' test.out

#- 144 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'zxi1MtLH' \
    --itemId 'ku73JQ2l' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pzOfcqhV' \
    > test.out 2>&1
eval_tap $? 144 'FeatureItem' test.out

#- 145 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'hmXtQlCB' \
    --itemId 'qeY7kbFX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dMLPvmRi' \
    > test.out 2>&1
eval_tap $? 145 'DefeatureItem' test.out

#- 146 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '4lOPUeQe' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'muzj778X' \
    --populateBundle  \
    --region 'ZTcHyfwD' \
    --storeId 'ymT0reFi' \
    > test.out 2>&1
eval_tap $? 146 'GetLocaleItem' test.out

#- 147 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'EYnwxXDk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nAaJfxJe' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 92, "code": "nE0qbjc0", "comparison": "isNot", "name": "iNUsRAg8", "predicateType": "EntitlementPredicate", "value": "CPFABwcb", "values": ["CPtcvdCM", "q3CyyVAO", "nB2aOO0d"]}, {"anyOf": 2, "code": "i0nVRfUw", "comparison": "isLessThanOrEqual", "name": "Q9N3WXcm", "predicateType": "EntitlementPredicate", "value": "uC1PJcUu", "values": ["iHZxDVLr", "EJtTdQnI", "2YelsXqB"]}, {"anyOf": 53, "code": "Ta4BFtqU", "comparison": "isGreaterThan", "name": "lGXH8TMK", "predicateType": "EntitlementPredicate", "value": "AXJA59Or", "values": ["qG7Hko4B", "CMW3wc0m", "zJa9Lxij"]}]}, {"operator": "and", "predicates": [{"anyOf": 5, "code": "bYM0jIvg", "comparison": "includes", "name": "8po3b79H", "predicateType": "StatisticCodePredicate", "value": "Ru6K3M4h", "values": ["UVfiS9hZ", "jfsktoNI", "c6wL0b9u"]}, {"anyOf": 48, "code": "K2hbVBV8", "comparison": "is", "name": "iwHlz7Oc", "predicateType": "SeasonPassPredicate", "value": "7m24Ju7T", "values": ["tr2K02we", "a8Ki6ZYt", "EvosMgZM"]}, {"anyOf": 57, "code": "I9HA25YH", "comparison": "isNot", "name": "6s4SDiWL", "predicateType": "EntitlementPredicate", "value": "BmN6qAqw", "values": ["sCEENhwK", "pi0ZVedc", "iBCiJ7qT"]}]}, {"operator": "or", "predicates": [{"anyOf": 27, "code": "iH4erjCS", "comparison": "isNot", "name": "8le2ZSqs", "predicateType": "StatisticCodePredicate", "value": "srDTxXlK", "values": ["qoSk1L4Z", "Oep9f1EM", "Z7peNOYC"]}, {"anyOf": 34, "code": "RQiB6aKi", "comparison": "is", "name": "1Dyoygkc", "predicateType": "SeasonPassPredicate", "value": "WiRjr6Vv", "values": ["5STZZuWk", "P68xXPxW", "wFenqb6J"]}, {"anyOf": 62, "code": "yWt4jMJD", "comparison": "isGreaterThanOrEqual", "name": "gkV4fpfx", "predicateType": "SeasonPassPredicate", "value": "PbFknFPv", "values": ["pOL3VivP", "ci2iDGDQ", "lrwOTW3h"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 147 'UpdateItemPurchaseCondition' test.out

#- 148 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'JHW5euPC' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,DLC,ENTITLEMENT' \
    --storeId 'yLzdtbyk' \
    > test.out 2>&1
eval_tap $? 148 'QueryItemReferences' test.out

#- 149 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'QCmouE8e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "nsM4T1Bo"}' \
    > test.out 2>&1
eval_tap $? 149 'ReturnItem' test.out

#- 150 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --name 'tRKu31gB' \
    --offset '34' \
    --tag 'm0OnZ6v1' \
    > test.out 2>&1
eval_tap $? 150 'QueryKeyGroups' test.out

#- 151 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "XCR0l05h", "name": "dm2zZddD", "status": "ACTIVE", "tags": ["BuAbBKik", "rkd4VJJO", "68ttkNnS"]}' \
    > test.out 2>&1
eval_tap $? 151 'CreateKeyGroup' test.out

#- 152 GetKeyGroupByBoothName
eval_tap 0 152 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 153 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'TGYPYZ1f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroup' test.out

#- 154 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'RUvXVZ9c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "v9TUTRx4", "name": "CJPMRRcn", "status": "INACTIVE", "tags": ["WkAPdXXC", "rUloVd8w", "HrHWLiYX"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateKeyGroup' test.out

#- 155 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'KG3JbVh1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetKeyGroupDynamic' test.out

#- 156 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'bHy9gtH4' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '38' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 156 'ListKeys' test.out

#- 157 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'TheLF5nx' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 157 'UploadKeys' test.out

#- 158 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '31dtSzx0' \
    --limit '34' \
    --offset '91' \
    --orderNos 'P98zx7WF,k4VuoK12,3mqDMU6F' \
    --sortBy 'HAn4CyJE' \
    --startTime 'HVgPAVAu' \
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
    --orderNo '8l4zqYZ2' \
    > test.out 2>&1
eval_tap $? 160 'GetOrder' test.out

#- 161 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a21Ze5xb' \
    --body '{"description": "amIszpbm"}' \
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
    --body '{"domains": ["szJ50Zf8", "RhKXHkhy", "6MZTwlGR"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePaymentDomainWhitelistConfig' test.out

#- 166 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '7Jfpojqb' \
    --externalId 'NslmZjtE' \
    --limit '100' \
    --notificationSource 'XSOLLA' \
    --notificationType 'TYTRTKgu' \
    --offset '61' \
    --paymentOrderNo 'aaRB3FDq' \
    --startDate 'bFHHubIE' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 166 'QueryPaymentNotifications' test.out

#- 167 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'dbV0vyuY' \
    --limit '9' \
    --offset '57' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 167 'QueryPaymentOrders' test.out

#- 168 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "6DFcfCbz", "currencyNamespace": "jDmcE3yG", "customParameters": {"TJarGSlt": {}, "QqK1fh9h": {}, "DLkBowcb": {}}, "description": "VtAvzhPm", "extOrderNo": "67cn0qgQ", "extUserId": "4XJC4fv6", "itemType": "MEDIA", "language": "PYK", "metadata": {"rEzqgORa": "nNqLF4hO", "mkiVRMY1": "Bhzhm4Jk", "zebgs7wf": "acc9gdzo"}, "notifyUrl": "EAjdLbDb", "omitNotification": true, "platform": "uUibHkXn", "price": 70, "recurringPaymentOrderNo": "GY48MvxM", "region": "2OmSa6Vh", "returnUrl": "NjNWhuCU", "sandbox": false, "sku": "wD5HSdNQ", "subscriptionId": "E69ZGxo8", "targetNamespace": "1WPq7ptE", "targetUserId": "9l7SAyR3", "title": "rOJpP5nA"}' \
    > test.out 2>&1
eval_tap $? 168 'CreatePaymentOrderByDedicated' test.out

#- 169 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'fmLDNAaz' \
    > test.out 2>&1
eval_tap $? 169 'ListExtOrderNoByExtTxId' test.out

#- 170 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MEeit366' \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentOrder' test.out

#- 171 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AtvJIpje' \
    --body '{"extTxId": "t1WtMM6R", "paymentMethod": "DdKenpZs", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 171 'ChargePaymentOrder' test.out

#- 172 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ng8YV7mJ' \
    --body '{"description": "TBdgsLRa"}' \
    > test.out 2>&1
eval_tap $? 172 'RefundPaymentOrderByDedicated' test.out

#- 173 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3wKpn4hz' \
    --body '{"amount": 30, "currencyCode": "A4J3K8jU", "notifyType": "CHARGE", "paymentProvider": "NEONPAY", "salesTax": 98, "vat": 74}' \
    > test.out 2>&1
eval_tap $? 173 'SimulatePaymentOrderNotification' test.out

#- 174 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TG2ltczk' \
    > test.out 2>&1
eval_tap $? 174 'GetPaymentOrderChargeStatus' test.out

#- 175 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'RVs9UzdT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "sVshYvqw", "serviceLabel": 12}' \
    > test.out 2>&1
eval_tap $? 175 'GetPsnEntitlementOwnership' test.out

#- 176 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'kmuIBPKD' \
    --body '{"delegationToken": "yLvXvaK8", "sandboxId": "fmWwVlJl"}' \
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
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Other", "Oculus", "Nintendo"]}' \
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
    --body '{"allowedBalanceOrigins": ["Oculus", "Twitch", "Playstation"]}' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
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
    --endTime 'T2CvLR6J' \
    --limit '93' \
    --offset '93' \
    --source 'DLC' \
    --startTime 'eiC81rDe' \
    --status 'SUCCESS' \
    --transactionId 'ETiQDWRi' \
    --userId '2iBynwZE' \
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
    --body '{"appConfig": {"appName": "2T8Z8yZW"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "omLbwPZE"}, "extendType": "APP"}' \
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
    --body '{"description": "JQGnYdRQ", "eventTopic": "E9wD1RQy", "maxAwarded": 18, "maxAwardedPerUser": 23, "namespaceExpression": "o1gR0J5K", "rewardCode": "OLiWAckZ", "rewardConditions": [{"condition": "PCXz8oBS", "conditionName": "GcgEgQSv", "eventName": "Xha468e5", "rewardItems": [{"duration": 93, "endDate": "1991-06-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "uZKCd5e0", "quantity": 41, "sku": "otRsQuna"}, {"duration": 35, "endDate": "1977-08-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RNmhlUil", "quantity": 49, "sku": "Rs3EpNVU"}, {"duration": 32, "endDate": "1978-06-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "H1clsZ1A", "quantity": 64, "sku": "qZVRU49U"}]}, {"condition": "jiW7vaHH", "conditionName": "5WByMiEG", "eventName": "XLt9QN69", "rewardItems": [{"duration": 13, "endDate": "1972-12-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "IzUs55pY", "quantity": 44, "sku": "ITGejfuJ"}, {"duration": 30, "endDate": "1988-09-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "3fjEdgmn", "quantity": 10, "sku": "pV80b0k9"}, {"duration": 68, "endDate": "1987-10-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "usYhoaHV", "quantity": 14, "sku": "vRBIU9F0"}]}, {"condition": "ATIa1UIn", "conditionName": "3sdsgZDN", "eventName": "vX4JDcr9", "rewardItems": [{"duration": 23, "endDate": "1977-03-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "zUExXcnW", "quantity": 90, "sku": "FcvdQ9tQ"}, {"duration": 8, "endDate": "1977-02-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "DROIJRX2", "quantity": 56, "sku": "cXbqmbBY"}, {"duration": 13, "endDate": "1973-02-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "AetIBnJ5", "quantity": 48, "sku": "UOhRSIXH"}]}], "userIdExpression": "2LJAJs0i"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateReward' test.out

#- 191 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '6celo7C0' \
    --limit '1' \
    --offset '37' \
    --sortBy 'rewardCode:asc,namespace:desc' \
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
    --rewardId 'ImANy4hb' \
    > test.out 2>&1
eval_tap $? 194 'GetReward' test.out

#- 195 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'FgCfKZQ8' \
    --body '{"description": "s5lot0S3", "eventTopic": "B5sMgz3z", "maxAwarded": 84, "maxAwardedPerUser": 43, "namespaceExpression": "c7IMjvX0", "rewardCode": "0q41CXYr", "rewardConditions": [{"condition": "ZRj4wek5", "conditionName": "7QyUFuxd", "eventName": "p9EKJZtG", "rewardItems": [{"duration": 26, "endDate": "1985-12-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "U3e54yWq", "quantity": 2, "sku": "ONojuqMx"}, {"duration": 53, "endDate": "1975-12-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jPe6wz3i", "quantity": 46, "sku": "9hXxiByG"}, {"duration": 47, "endDate": "1992-04-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lQNhtmUn", "quantity": 89, "sku": "8lviSFVk"}]}, {"condition": "ZYe0pr9t", "conditionName": "iROLbvGD", "eventName": "4WlQGxLY", "rewardItems": [{"duration": 47, "endDate": "1999-03-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Zp2VIK46", "quantity": 81, "sku": "y41ApZGU"}, {"duration": 91, "endDate": "1975-11-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Y5k295Np", "quantity": 73, "sku": "Tr29V3Lf"}, {"duration": 19, "endDate": "1987-10-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "wmV5zzvq", "quantity": 36, "sku": "fgHNTojC"}]}, {"condition": "noUZUt9M", "conditionName": "qHFcSIyL", "eventName": "azyeubey", "rewardItems": [{"duration": 86, "endDate": "1998-02-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "jqIJQzVU", "quantity": 54, "sku": "NC9YUC2z"}, {"duration": 60, "endDate": "1997-04-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "H4PiWcnV", "quantity": 33, "sku": "XsvcNwjn"}, {"duration": 4, "endDate": "1993-05-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "eEWWcYbD", "quantity": 86, "sku": "1b6fvbAh"}]}], "userIdExpression": "pdNDmnoa"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateReward' test.out

#- 196 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'DYmnfaet' \
    > test.out 2>&1
eval_tap $? 196 'DeleteReward' test.out

#- 197 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '8StuPx2B' \
    --body '{"payload": {"uRTRPcui": {}, "IU4mOrnq": {}, "LuZwJoYE": {}}}' \
    > test.out 2>&1
eval_tap $? 197 'CheckEventCondition' test.out

#- 198 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lG38J9Ut' \
    --body '{"conditionName": "zLxYzKqC", "userId": "xfWsN1TA"}' \
    > test.out 2>&1
eval_tap $? 198 'DeleteRewardConditionRecord' test.out

#- 199 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'SISStMbh' \
    --limit '89' \
    --offset '99' \
    --start '8M9y4VKl' \
    --storeId 'CebW6VHn' \
    --viewId 'ibzw08Ed' \
    > test.out 2>&1
eval_tap $? 199 'QuerySections' test.out

#- 200 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PGIoEpiL' \
    --body '{"active": false, "displayOrder": 53, "endDate": "1981-09-06T00:00:00Z", "ext": {"sbA4tu6o": {}, "EH0WY14z": {}, "JuLbdc9W": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 84, "itemCount": 16, "rule": "SEQUENCE"}, "items": [{"id": "5uszlmMN", "sku": "mmo2uxes"}, {"id": "q0afFJFj", "sku": "LeJydtn6"}, {"id": "4BtNZUAR", "sku": "yFGTbIMp"}], "localizations": {"W3oLuKqm": {"description": "XKE9I4V8", "localExt": {"JbSc6yLS": {}, "m9P1HHi6": {}, "Pw29ECmP": {}}, "longDescription": "GFHmrv0R", "title": "C6nRyioE"}, "33LgyZ2X": {"description": "TahAdaCV", "localExt": {"rVf2sK3w": {}, "0PwLzHO7": {}, "OH68tMLu": {}}, "longDescription": "Qlhp7amI", "title": "qa8N02jo"}, "hhyaPJdk": {"description": "339b2CWR", "localExt": {"uVutOSjQ": {}, "9FFjHBQN": {}, "9GbmtnuO": {}}, "longDescription": "4n87cdBG", "title": "T2FHCBHk"}}, "name": "UBdL1I20", "rotationType": "FIXED_PERIOD", "startDate": "1987-02-07T00:00:00Z", "viewId": "L5TthuQ8"}' \
    > test.out 2>&1
eval_tap $? 200 'CreateSection' test.out

#- 201 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uIluw4Cg' \
    > test.out 2>&1
eval_tap $? 201 'PurgeExpiredSection' test.out

#- 202 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'GAlDU9cF' \
    --storeId 'wNnQrhzR' \
    > test.out 2>&1
eval_tap $? 202 'GetSection' test.out

#- 203 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '0YxqEbdx' \
    --storeId 'k8OmSCAT' \
    --body '{"active": false, "displayOrder": 48, "endDate": "1972-09-13T00:00:00Z", "ext": {"oU0zBvFr": {}, "C2dZFhdh": {}, "LAJzXZHt": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 19, "itemCount": 15, "rule": "LOOP"}, "items": [{"id": "rBUfm6Ve", "sku": "xAWu5vfr"}, {"id": "tckrPRwa", "sku": "t5HVWlK9"}, {"id": "JNKdgRfy", "sku": "Gra6ldeS"}], "localizations": {"nwPRoEoC": {"description": "UgbeuCUq", "localExt": {"jVvKyUXU": {}, "vN8bjcCx": {}, "7vXA5JEA": {}}, "longDescription": "JwXnj0Uz", "title": "0ocgbnR3"}, "mVpXsJZD": {"description": "KHxK856a", "localExt": {"QsMItcpi": {}, "cxKjq617": {}, "Z0ivzrO1": {}}, "longDescription": "gq29KvuR", "title": "BGd8xJFN"}, "LWvTyzzs": {"description": "VsZM2Kwk", "localExt": {"DAXGooWt": {}, "PzpbKh2o": {}, "qPrCvE33": {}}, "longDescription": "JRzGutlb", "title": "1On7j65p"}}, "name": "oX7VC8lv", "rotationType": "CUSTOM", "startDate": "1980-11-26T00:00:00Z", "viewId": "vrCvgWZs"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateSection' test.out

#- 204 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '05m7mlvx' \
    --storeId 'uaAbqlJ7' \
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
    --body '{"defaultLanguage": "96JMLLSo", "defaultRegion": "1f8G2wcY", "description": "eVMQ4BRn", "supportedLanguages": ["7xUKpYOB", "Hlle1Pnb", "SJ78rL4S"], "supportedRegions": ["lSXtc5KD", "56bIGNoO", "vDO88vRY"], "title": "jkBiOOMY"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateStore' test.out

#- 207 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
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
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["RnKvQvZB", "zZ4rMR8R", "03xP19aq"], "idsToBeExported": ["l3yFfAyx", "snB6Vdb4", "l0sabeBq"], "storeId": "giLwW7wx"}' \
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
    --storeId 'FcQ6pikD' \
    > test.out 2>&1
eval_tap $? 215 'GetStore' test.out

#- 216 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ObvQnYW0' \
    --body '{"defaultLanguage": "wXl6VUxQ", "defaultRegion": "v7JCHp3D", "description": "0l1XXYYF", "supportedLanguages": ["3PIyyc3L", "NLNbTG1J", "c7nuB7z7"], "supportedRegions": ["pFkLhJKS", "jZhaAQJG", "DSANyHve"], "title": "HOKCWkGc"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateStore' test.out

#- 217 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kgakr0x8' \
    > test.out 2>&1
eval_tap $? 217 'DeleteStore' test.out

#- 218 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eBRiW45l' \
    --action 'DELETE' \
    --itemSku 'kcWIrcBa' \
    --itemType 'COINS' \
    --limit '45' \
    --offset '80' \
    --selected  \
    --sortBy 'updatedAt,updatedAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'hsd8sfsj' \
    --updatedAtStart 'V0iQIzpv' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 218 'QueryChanges' test.out

#- 219 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FNSJaGyh' \
    > test.out 2>&1
eval_tap $? 219 'PublishAll' test.out

#- 220 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NJKSD1PZ' \
    > test.out 2>&1
eval_tap $? 220 'PublishSelected' test.out

#- 221 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xqseTPj1' \
    > test.out 2>&1
eval_tap $? 221 'SelectAllRecords' test.out

#- 222 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RxuHLRgH' \
    --action 'CREATE' \
    --itemSku 'KyIGO5ZL' \
    --itemType 'CODE' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd '5BEBkdfc' \
    --updatedAtStart 'DABSGEwH' \
    > test.out 2>&1
eval_tap $? 222 'SelectAllRecordsByCriteria' test.out

#- 223 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iin0vIeT' \
    --action 'DELETE' \
    --itemSku 'mISxUQlI' \
    --itemType 'COINS' \
    --type 'CATEGORY' \
    --updatedAtEnd 'YPBfPdyh' \
    --updatedAtStart 'B5KUL96f' \
    > test.out 2>&1
eval_tap $? 223 'GetStatistic' test.out

#- 224 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'akhJRA0V' \
    > test.out 2>&1
eval_tap $? 224 'UnselectAllRecords' test.out

#- 225 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'hIUACevZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rCV7f6ng' \
    > test.out 2>&1
eval_tap $? 225 'SelectRecord' test.out

#- 226 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '8I5Zkzin' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TBhWfVv2' \
    > test.out 2>&1
eval_tap $? 226 'UnselectRecord' test.out

#- 227 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wCwdVUUN' \
    --targetStoreId 'F65BFJPt' \
    > test.out 2>&1
eval_tap $? 227 'CloneStore' test.out

#- 228 ExportStore
eval_tap 0 228 'ExportStore # SKIP deprecated' test.out

#- 229 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MQ5GGBlb' \
    --end 'LNbyKXMs' \
    --limit '31' \
    --offset '93' \
    --sortBy 'zUTQt9ym' \
    --start 'woRvCPIa' \
    --success  \
    > test.out 2>&1
eval_tap $? 229 'QueryImportHistory' test.out

#- 230 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jcCmt6Z7' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'xJJcwFvH' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 230 'ImportStoreByCSV' test.out

#- 231 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'NqxpQZAD' \
    --limit '50' \
    --offset '26' \
    --sku 'QhwlQI1K' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'tywVkXbw' \
    > test.out 2>&1
eval_tap $? 231 'QuerySubscriptions' test.out

#- 232 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'c6S2HRoB' \
    > test.out 2>&1
eval_tap $? 232 'RecurringChargeSubscription' test.out

#- 233 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '2xjK5G0O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketDynamic' test.out

#- 234 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'zWarLUdH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "RznOjnh0"}' \
    > test.out 2>&1
eval_tap $? 234 'DecreaseTicketSale' test.out

#- 235 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ZOB9jd8o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetTicketBoothID' test.out

#- 236 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'HFEjDl0X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 56, "orderNo": "yORYRC9P"}' \
    > test.out 2>&1
eval_tap $? 236 'IncreaseTicketSale' test.out

#- 237 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 23, "currencyCode": "wyrLzEg1", "expireAt": "1993-10-23T00:00:00Z"}, "debitPayload": {"count": 57, "currencyCode": "a3tRTJvM", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 44, "entitlementCollectionId": "PHBbe8cP", "entitlementOrigin": "Twitch", "itemIdentity": "SgiJsu45", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "jUbWm2PG"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 14, "currencyCode": "FITyDivL", "expireAt": "1975-09-13T00:00:00Z"}, "debitPayload": {"count": 76, "currencyCode": "K2WGWpH4", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 77, "entitlementCollectionId": "MICXs7YY", "entitlementOrigin": "GooglePlay", "itemIdentity": "FsB8AW9B", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "3ykLBLEx"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 78, "currencyCode": "culsSVkO", "expireAt": "1976-10-29T00:00:00Z"}, "debitPayload": {"count": 72, "currencyCode": "Jhyq0kLo", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "cFGfXMYN", "entitlementOrigin": "IOS", "itemIdentity": "xAvvllH2", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "8moIe9qb"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "oY5pyxkW"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 68, "currencyCode": "rMJeZz2R", "expireAt": "1982-06-09T00:00:00Z"}, "debitPayload": {"count": 11, "currencyCode": "JwnndOkf", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 34, "entitlementCollectionId": "M8mJ4iuM", "entitlementOrigin": "Other", "itemIdentity": "qyy6rsRK", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "BOJuqqji"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 77, "currencyCode": "NwVF3ZPs", "expireAt": "1998-07-08T00:00:00Z"}, "debitPayload": {"count": 20, "currencyCode": "jzBn34ZP", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 72, "entitlementCollectionId": "iyvdgOlL", "entitlementOrigin": "Xbox", "itemIdentity": "hVuY8QPT", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 73, "entitlementId": "DRG5pk51"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 62, "currencyCode": "lMI9Yh8s", "expireAt": "1997-02-23T00:00:00Z"}, "debitPayload": {"count": 53, "currencyCode": "iMZ92JvK", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 93, "entitlementCollectionId": "L3H4000f", "entitlementOrigin": "Epic", "itemIdentity": "5ZaUskTw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 71, "entitlementId": "bKTP2hHr"}, "type": "CREDIT_WALLET"}], "userId": "qXtDWm1Y"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 36, "currencyCode": "Q927ID9Q", "expireAt": "1979-06-26T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "VL1i6hRq", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 11, "entitlementCollectionId": "C2UilCZd", "entitlementOrigin": "Nintendo", "itemIdentity": "ugDKIFXI", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 37, "entitlementId": "w6F6yLml"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 49, "currencyCode": "EiRJQnr0", "expireAt": "1982-08-10T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "d6zlcsmU", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 5, "entitlementCollectionId": "uUOGeigi", "entitlementOrigin": "GooglePlay", "itemIdentity": "rNttWFw4", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 85, "entitlementId": "0AKRyXLz"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 100, "currencyCode": "IlLh4H1A", "expireAt": "1999-02-26T00:00:00Z"}, "debitPayload": {"count": 53, "currencyCode": "fzE3J9ds", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "0v0p6MOu", "entitlementOrigin": "System", "itemIdentity": "pPNBfwB7", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 59, "entitlementId": "XwVwVJgI"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "HRGHUfSh"}], "metadata": {"NhvKHH9q": {}, "GjokKWus": {}, "awVpKRbp": {}}, "needPreCheck": false, "transactionId": "OO4JdAfl", "type": "ZhSImbXz"}' \
    > test.out 2>&1
eval_tap $? 237 'Commit' test.out

#- 238 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '87' \
    --status 'INIT' \
    --type 'BtuwNO4c' \
    --userId 'jTtibgUY' \
    > test.out 2>&1
eval_tap $? 238 'GetTradeHistoryByCriteria' test.out

#- 239 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'uvCJcX6q' \
    > test.out 2>&1
eval_tap $? 239 'GetTradeHistoryByTransactionId' test.out

#- 240 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPSzHbIK' \
    --body '{"achievements": [{"id": "XLJBQD6x", "value": 87}, {"id": "Ovjv3thx", "value": 51}, {"id": "4ij9iblu", "value": 59}], "steamUserId": "6ehfU2Nf"}' \
    > test.out 2>&1
eval_tap $? 240 'UnlockSteamUserAchievement' test.out

#- 241 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '62KtIsN2' \
    --xboxUserId 'JqIKRXmO' \
    > test.out 2>&1
eval_tap $? 241 'GetXblUserAchievements' test.out

#- 242 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XEcIpZax' \
    --body '{"achievements": [{"id": "JRYo4ptt", "percentComplete": 34}, {"id": "x5AYAUyA", "percentComplete": 17}, {"id": "BJEzbt6z", "percentComplete": 21}], "serviceConfigId": "Nni7vem4", "titleId": "mP23OMol", "xboxUserId": "IQoCXXTN"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateXblUserAchievement' test.out

#- 243 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'dEL8dV8h' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeCampaign' test.out

#- 244 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hu4zJMlb' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeEntitlement' test.out

#- 245 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'cV1WPNQM' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeFulfillment' test.out

#- 246 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '9wxjWyfu' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizeIntegration' test.out

#- 247 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'vy8QM3rA' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeOrder' test.out

#- 248 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'MmEBKuuN' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizePayment' test.out

#- 249 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '7gqNchF2' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeRevocation' test.out

#- 250 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'scfhdD4Z' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeSubscription' test.out

#- 251 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANHS2nKW' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeWallet' test.out

#- 252 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'BChoGrlJ' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 252 'GetUserDLCByPlatform' test.out

#- 253 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '9lOMvj0E' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 253 'GetUserDLC' test.out

#- 254 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNYcW8jH' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'yrJTsCcD' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'Fa9jNaNx' \
    --features 'WvIqnV1f,PKujFxFg,cqYb5zRl' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'yXa3B7gn,ttfm5DvQ,5tdN6z4R' \
    --limit '39' \
    --offset '48' \
    --origin 'Other' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserEntitlements' test.out

#- 255 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XZmAblst' \
    --body '[{"collectionId": "dQ9l2zgZ", "endDate": "1999-12-12T00:00:00Z", "grantedCode": "MyhOdF99", "itemId": "geBq8WYo", "itemNamespace": "PPj1jj4u", "language": "pBmV-KKYt_722", "metadata": {"7lEKyUtU": {}, "uzj4HXmm": {}, "BZ1IYAq2": {}}, "origin": "System", "quantity": 24, "region": "AWbvNgrb", "source": "PROMOTION", "startDate": "1992-04-20T00:00:00Z", "storeId": "Levvhyn6"}, {"collectionId": "IOZSb4iD", "endDate": "1984-04-17T00:00:00Z", "grantedCode": "p9gMgR99", "itemId": "LZnDUfg7", "itemNamespace": "hhzMu8my", "language": "xFx-saiJ", "metadata": {"1DJovHUL": {}, "qYGM65lt": {}, "EfiCLh3T": {}}, "origin": "Epic", "quantity": 96, "region": "dEwYf9sG", "source": "PURCHASE", "startDate": "1988-04-08T00:00:00Z", "storeId": "0bTurMx4"}, {"collectionId": "EaqJh0Wl", "endDate": "1974-01-23T00:00:00Z", "grantedCode": "yOa5RF4W", "itemId": "3xWxSWCj", "itemNamespace": "YqZ7EF70", "language": "MQB_720", "metadata": {"1gzgLdFD": {}, "8A9m0ChW": {}, "lUWGzSXF": {}}, "origin": "GooglePlay", "quantity": 28, "region": "1yQWc1FD", "source": "PROMOTION", "startDate": "1997-01-31T00:00:00Z", "storeId": "vXqYvWQK"}]' \
    > test.out 2>&1
eval_tap $? 255 'GrantUserEntitlement' test.out

#- 256 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'v68L1ign' \
    --activeOnly  \
    --appId '11yqDfL3' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementByAppId' test.out

#- 257 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'uc9ggeLz' \
    --activeOnly  \
    --limit '1' \
    --offset '24' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 257 'QueryUserEntitlementsByAppType' test.out

#- 258 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'cFsXfMMG' \
    --ids '16OZeSMy,V9yVDoDu,lUfmhmxS' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementsByIds' test.out

#- 259 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFqtMXAS' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'q1odnlhL' \
    --itemId 'ue3wesc5' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementByItemId' test.out

#- 260 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'r47zlKuX' \
    --ids 'F6agphdz,AH2LudDb,MwmN89jJ' \
    --platform 'NpkY9hzd' \
    > test.out 2>&1
eval_tap $? 260 'GetUserActiveEntitlementsByItemIds' test.out

#- 261 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKPAM4eo' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform 'xIAcRO5L' \
    --sku '8jJOJuvr' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementBySku' test.out

#- 262 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dm2dMPoP' \
    --appIds '9kImq4sc,ZRUoRBPy,3PObJiKs' \
    --itemIds 'lkqA3zcB,X5Ny9gs2,q1qwD2dc' \
    --platform '7l8kiNw0' \
    --skus 'jmxCld68,IBLUTfN7,JFb7oWwX' \
    > test.out 2>&1
eval_tap $? 262 'ExistsAnyUserActiveEntitlement' test.out

#- 263 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQ42bFAb' \
    --platform 'vMOzFFDn' \
    --itemIds 'pnHKoZcL,E0bgP44W,NHnXVxtN' \
    > test.out 2>&1
eval_tap $? 263 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 264 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxzD9pA5' \
    --appId 'PcsnZHgX' \
    > test.out 2>&1
eval_tap $? 264 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 265 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'p3vGBNOe' \
    --entitlementClazz 'OPTIONBOX' \
    --platform '8PxnzSUi' \
    --itemId 'U9gElZ6Z' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipByItemId' test.out

#- 266 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QEfnw6rl' \
    --ids 'bIHJBObe,Jl3E1S16,8fq9Lor2' \
    --platform 'iGMoI1u4' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementOwnershipByItemIds' test.out

#- 267 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmlydXaY' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'giupe07X' \
    --sku 'k2BmMWwR' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementOwnershipBySku' test.out

#- 268 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgnt1BZB' \
    > test.out 2>&1
eval_tap $? 268 'RevokeAllEntitlements' test.out

#- 269 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeziWAdZ' \
    --entitlementIds 'Gl6FvDqw' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlements' test.out

#- 270 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'W91rzjfl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BkRDleT5' \
    > test.out 2>&1
eval_tap $? 270 'GetUserEntitlement' test.out

#- 271 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'A69O2cab' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZRQSd5pF' \
    --body '{"collectionId": "LCY9wyUN", "endDate": "1987-01-04T00:00:00Z", "nullFieldList": ["cZJ86Iqt", "XlmjEboS", "yzRqOq93"], "origin": "Nintendo", "reason": "hPJtem9Z", "startDate": "1999-09-14T00:00:00Z", "status": "REVOKED", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserEntitlement' test.out

#- 272 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'h9xzDrUK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNVinZuO' \
    --body '{"metadata": {"l577trlh": {}, "BXdQV963": {}, "0oL5G7FG": {}}, "options": ["z8MRzVTI", "UpduLwWE", "4z6eLm30"], "platform": "adjQdTNM", "requestId": "OFFFbuva", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 272 'ConsumeUserEntitlement' test.out

#- 273 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'uPPkFyMG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gZdMaT4O' \
    > test.out 2>&1
eval_tap $? 273 'DisableUserEntitlement' test.out

#- 274 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'h064gNWU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a7bY1WzY' \
    > test.out 2>&1
eval_tap $? 274 'EnableUserEntitlement' test.out

#- 275 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'lUoLWeml' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NpTUh1sg' \
    > test.out 2>&1
eval_tap $? 275 'GetUserEntitlementHistories' test.out

#- 276 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'RFzLloC5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yAM6hJtX' \
    --body '{"metadata": {"iKhyGUFo": {}, "9r6PNrkR": {}, "nhm08MsN": {}}}' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlement' test.out

#- 277 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'ajzyzzcc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xKUowHxe' \
    --body '{"reason": "Be0YXfyT", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 277 'RevokeUserEntitlementByUseCount' test.out

#- 278 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'GpFLgsWv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MpDCeohy' \
    --quantity '76' \
    > test.out 2>&1
eval_tap $? 278 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 279 RevokeUseCount
eval_tap 0 279 'RevokeUseCount # SKIP deprecated' test.out

#- 280 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'K6ixv3ex' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ad76fyym' \
    --body '{"platform": "PV456oQp", "requestId": "aofjz01g", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 280 'SellUserEntitlement' test.out

#- 281 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rBbtTuSy' \
    --body '{"duration": 13, "endDate": "1984-10-10T00:00:00Z", "entitlementCollectionId": "D524FV3H", "entitlementOrigin": "Other", "itemId": "SPTK3iQJ", "itemSku": "kyND4PsZ", "language": "1Et64NJu", "metadata": {"5Hr9CM4w": {}, "xsBgj2Pb": {}, "OZ7PZymh": {}}, "order": {"currency": {"currencyCode": "ZNIU8FKt", "currencySymbol": "mUmx5Sc8", "currencyType": "REAL", "decimals": 91, "namespace": "MMzILkIx"}, "ext": {"0df8nh46": {}, "rbFpUSMP": {}, "IOMGtzIf": {}}, "free": true}, "orderNo": "bwYth4xw", "origin": "Twitch", "overrideBundleItemQty": {"OEbEiPBA": 49, "b6rTk07k": 76, "tsEUrVTB": 65}, "quantity": 39, "region": "898xYbmA", "source": "SELL_BACK", "startDate": "1984-04-25T00:00:00Z", "storeId": "1DZE0YfI"}' \
    > test.out 2>&1
eval_tap $? 281 'FulfillItem' test.out

#- 282 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oDz6DHlT' \
    --body '{"code": "0F8hs2Gl", "language": "Sdx_qpDt_aA", "region": "HXJMngYd"}' \
    > test.out 2>&1
eval_tap $? 282 'RedeemCode' test.out

#- 283 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVqLDdmv' \
    --body '{"itemId": "FP88yzGd", "itemSku": "iPLwZBeO", "quantity": 86}' \
    > test.out 2>&1
eval_tap $? 283 'PreCheckFulfillItem' test.out

#- 284 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PTQ5fNzg' \
    --body '{"entitlementCollectionId": "jQ5aKeG9", "entitlementOrigin": "Steam", "metadata": {"oSKa9s4Y": {}, "kWoKYZyX": {}, "CpGQ4aRm": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "1HaWDzCt", "namespace": "InzNxNaZ"}, "item": {"itemId": "16UVdSMW", "itemName": "wTw6MYeg", "itemSku": "y9GsCyqh", "itemType": "dRGfe4Wh"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"currencyCode": "wNE1SCOu", "namespace": "3CoYQsfu"}, "item": {"itemId": "qIpHO6Pe", "itemName": "NhZMd9pb", "itemSku": "EGo57ViS", "itemType": "oCAEbnCW"}, "quantity": 82, "type": "CURRENCY"}, {"currency": {"currencyCode": "rS0UpgC0", "namespace": "XnTFWMaP"}, "item": {"itemId": "YoEiHjpK", "itemName": "bsd3mNXO", "itemSku": "9HDNqzpp", "itemType": "5hG01Fcj"}, "quantity": 44, "type": "ITEM"}], "source": "GIFT", "transactionId": "7C6RRTnb"}' \
    > test.out 2>&1
eval_tap $? 284 'FulfillRewards' test.out

#- 285 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '7veoX9Re' \
    --endTime '0gR01aFd' \
    --limit '59' \
    --offset '68' \
    --productId 'zQbHVFnz' \
    --startTime 'C0Mv1WgC' \
    --status 'VERIFIED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPOrders' test.out

#- 286 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvf1BZ6p' \
    > test.out 2>&1
eval_tap $? 286 'QueryAllUserIAPOrders' test.out

#- 287 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'AzHv5tLm' \
    --endTime 'XoNpIzo1' \
    --limit '44' \
    --offset '62' \
    --startTime 'lBmwP5hz' \
    --status 'FAIL' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserIAPConsumeHistory' test.out

#- 288 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNQ0DaBo' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "PIkh_mf", "productId": "a1CzBonw", "region": "XxT5YB8F", "transactionId": "94GLARMH", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 288 'MockFulfillIAPItem' test.out

#- 289 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'VuJUmW1V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFjQjZNM' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetIAPOrderLineItems' test.out

#- 290 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'MuD8rW1B' \
    > test.out 2>&1
eval_tap $? 290 'AdminSyncSteamAbnormalTransaction' test.out

#- 291 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '0sPPmVpb' \
    --body '{"orderId": "OdqqrHxQ"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminSyncSteamIAPByTransaction' test.out

#- 292 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '2lAFdbF2' \
    --activeOnly  \
    --groupId 'hlbcPBVh' \
    --limit '88' \
    --offset '19' \
    --platform 'APPLE' \
    --productId 'e0TYO0B2' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserThirdPartySubscription' test.out

#- 293 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId '4RbRHPii' \
    --groupId '9A2Zaj8s' \
    > test.out 2>&1
eval_tap $? 293 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 294 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId 'nuJvQz8a' \
    --productId 'U1z3bBwd' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 295 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'BWbJxEni' \
    --activeOnly  \
    --groupId 'LCeikN5w' \
    --limit '69' \
    --offset '32' \
    --platform 'STADIA' \
    --productId 'irc2QQvD' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 296 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'Vox5OPfm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pxpspqtk' \
    > test.out 2>&1
eval_tap $? 296 'GetThirdPartySubscriptionDetails' test.out

#- 297 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'SPqxknFJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '623PDFUy' \
    --limit '45' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 297 'GetSubscriptionHistory' test.out

#- 298 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'cwaXoCzq' \
    --namespace "$AB_NAMESPACE" \
    --userId '15kczOZB' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscriptionTransaction' test.out

#- 299 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'MseZDtca' \
    --namespace "$AB_NAMESPACE" \
    --userId 'olU2VIgg' \
    > test.out 2>&1
eval_tap $? 299 'GetThirdPartyUserSubscriptionDetails' test.out

#- 300 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'umR9YYFu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FkfBqNwz' \
    > test.out 2>&1
eval_tap $? 300 'SyncSubscription' test.out

#- 301 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'F92mkBMt' \
    --discounted  \
    --itemId 'Blp3eBjg' \
    --limit '22' \
    --offset '53' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 301 'QueryUserOrders' test.out

#- 302 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BkfZKCNq' \
    --body '{"currencyCode": "ZNyNhVRo", "currencyNamespace": "tFMh7wu7", "discountCodes": ["n1SRPGPd", "hlr8ctAJ", "23jzF0hZ"], "discountedPrice": 85, "entitlementPlatform": "Nintendo", "ext": {"91j3YDLa": {}, "rzFWapgq": {}, "7kiddLfU": {}}, "itemId": "y8dSnUJe", "language": "z3GcprTM", "options": {"skipPriceValidation": true}, "platform": "Nintendo", "price": 96, "quantity": 89, "region": "zwIM22hF", "returnUrl": "MZXhqtRT", "sandbox": true, "sectionId": "IzLxIsl1"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateUserOrder' test.out

#- 303 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2zbnaCBd' \
    --itemId 'WFa79Qa2' \
    > test.out 2>&1
eval_tap $? 303 'CountOfPurchasedItem' test.out

#- 304 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'v25Z16N2' \
    --userId 'LLPbbYk2' \
    > test.out 2>&1
eval_tap $? 304 'GetUserOrder' test.out

#- 305 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KN075hu3' \
    --userId 'ZkMctWbX' \
    --body '{"status": "REFUNDING", "statusReason": "9PEBUXfi"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateUserOrderStatus' test.out

#- 306 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7RKm8LJK' \
    --userId '4y5dGaL4' \
    > test.out 2>&1
eval_tap $? 306 'FulfillUserOrder' test.out

#- 307 GetUserOrderGrant
eval_tap 0 307 'GetUserOrderGrant # SKIP deprecated' test.out

#- 308 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HSb3sLoN' \
    --userId 'MIE0KUQ1' \
    > test.out 2>&1
eval_tap $? 308 'GetUserOrderHistories' test.out

#- 309 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Hie3cJfj' \
    --userId 'HaW5WtNy' \
    --body '{"additionalData": {"cardSummary": "7kuf6H0x"}, "authorisedTime": "1977-09-03T00:00:00Z", "chargebackReversedTime": "1972-10-11T00:00:00Z", "chargebackTime": "1989-08-12T00:00:00Z", "chargedTime": "1989-02-19T00:00:00Z", "createdTime": "1999-02-27T00:00:00Z", "currency": {"currencyCode": "giy72Zrf", "currencySymbol": "0g6v5icg", "currencyType": "VIRTUAL", "decimals": 12, "namespace": "fV9lhGYO"}, "customParameters": {"IuhxtkeT": {}, "kRtMxxzB": {}, "XjGEN9uq": {}}, "extOrderNo": "VwpfHsmN", "extTxId": "yiHJdotN", "extUserId": "PKPgZaBz", "issuedAt": "1972-03-01T00:00:00Z", "metadata": {"67kndU6C": "fGfXCMHM", "GfidwDnq": "4J1KEwRI", "8HjByYPp": "4cG6yDhu"}, "namespace": "ejhfUcOK", "nonceStr": "U83PUCtI", "paymentData": {"discountAmount": 97, "discountCode": "jl50kK8C", "subtotalPrice": 11, "tax": 20, "totalPrice": 35}, "paymentMethod": "mMo1crEl", "paymentMethodFee": 100, "paymentOrderNo": "AfY6AnEe", "paymentProvider": "CHECKOUT", "paymentProviderFee": 42, "paymentStationUrl": "NpmiJuwZ", "price": 55, "refundedTime": "1991-12-31T00:00:00Z", "salesTax": 30, "sandbox": true, "sku": "TB4lcSMf", "status": "REQUEST_FOR_INFORMATION", "statusReason": "i4cG8ocp", "subscriptionId": "HyNlC3Gq", "subtotalPrice": 69, "targetNamespace": "TG57rwtU", "targetUserId": "SIubieKX", "tax": 73, "totalPrice": 45, "totalTax": 57, "txEndTime": "1972-08-16T00:00:00Z", "type": "4HNtnuVh", "userId": "WVsKsO8z", "vat": 5}' \
    > test.out 2>&1
eval_tap $? 309 'ProcessUserOrderNotification' test.out

#- 310 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zDvIwWC5' \
    --userId 'plubMvTO' \
    > test.out 2>&1
eval_tap $? 310 'DownloadUserOrderReceipt' test.out

#- 311 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHlP3gbb' \
    --body '{"currencyCode": "7ZKFBj4H", "currencyNamespace": "cxUCJoDk", "customParameters": {"DZ91jjyX": {}, "UDKxQVbE": {}, "RLjntRnx": {}}, "description": "Hr2eQgUu", "extOrderNo": "iP0xFNTP", "extUserId": "OQGS7CNe", "itemType": "SEASON", "language": "ZPz_wcmS_fQ", "metadata": {"rjcbWG09": "pt5ZNQEp", "2ZE6PXd1": "OgLmwNrB", "F9tarvpr": "mWofvH6w"}, "notifyUrl": "Fuh7yFOL", "omitNotification": true, "platform": "UxTifDql", "price": 51, "recurringPaymentOrderNo": "k5IUQW6W", "region": "XxeNgDjB", "returnUrl": "3K3vB2NU", "sandbox": true, "sku": "Dse8sZa2", "subscriptionId": "kgr3dKPL", "title": "DjLUQ9xk"}' \
    > test.out 2>&1
eval_tap $? 311 'CreateUserPaymentOrder' test.out

#- 312 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NaCOcIer' \
    --userId 'SK4VzK5L' \
    --body '{"description": "hiYqkPjB"}' \
    > test.out 2>&1
eval_tap $? 312 'RefundUserPaymentOrder' test.out

#- 313 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'NQsoum0v' \
    > test.out 2>&1
eval_tap $? 313 'GetUserPlatformAccountClosureHistories' test.out

#- 314 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'haKPTA1z' \
    --body '{"code": "PRcp5841", "orderNo": "K3xiEI49"}' \
    > test.out 2>&1
eval_tap $? 314 'ApplyUserRedemption' test.out

#- 315 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'YRcXMfIf' \
    --body '{"meta": {"h0MC5kGA": {}, "j92FpySV": {}, "anULYnLn": {}}, "reason": "WKWPLeGm", "requestId": "PuxSQQjr", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "lvtMA2ze", "namespace": "l9PdHqg0"}, "entitlement": {"entitlementId": "tdR5czIL"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "n54SU8UZ", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "9j4cdq8B", "namespace": "00F6deAN"}, "entitlement": {"entitlementId": "bd9hQWob"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "7DHVKGjA", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 70, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "WoqAoJZ9", "namespace": "xjuqnZEV"}, "entitlement": {"entitlementId": "l6OxOCGg"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "1sfjQR4m", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 75, "type": "ITEM"}], "source": "IAP", "transactionId": "dJyRnLHf"}' \
    > test.out 2>&1
eval_tap $? 315 'DoRevocation' test.out

#- 316 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '1nUBLZMr' \
    --body '{"gameSessionId": "wZKFlxdN", "payload": {"hZFxhRQV": {}, "qJPfyi2Y": {}, "D3yOCiki": {}}, "scid": "bWnkhaYt", "sessionTemplateName": "xZZcfmLz"}' \
    > test.out 2>&1
eval_tap $? 316 'RegisterXblSessions' test.out

#- 317 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'i1WY1nqG' \
    --chargeStatus 'CHARGED' \
    --itemId 'LLcc3xFA' \
    --limit '35' \
    --offset '54' \
    --sku 'fhNBudKs' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserSubscriptions' test.out

#- 318 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNU4Id7Q' \
    --excludeSystem  \
    --limit '30' \
    --offset '65' \
    --subscriptionId 'DUb0q7RF' \
    > test.out 2>&1
eval_tap $? 318 'GetUserSubscriptionActivities' test.out

#- 319 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'tzOlvpCz' \
    --body '{"grantDays": 42, "itemId": "SRtBPz7I", "language": "5B8oLPCa", "reason": "1yx2l909", "region": "xlK7vtsz", "source": "gb38icbS"}' \
    > test.out 2>&1
eval_tap $? 319 'PlatformSubscribeSubscription' test.out

#- 320 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1uharvKN' \
    --itemId '3EU6KSqO' \
    > test.out 2>&1
eval_tap $? 320 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 321 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yBvYMn5j' \
    --userId 'fToD4zsU' \
    > test.out 2>&1
eval_tap $? 321 'GetUserSubscription' test.out

#- 322 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CTJDd3rS' \
    --userId '6R8lOITJ' \
    > test.out 2>&1
eval_tap $? 322 'DeleteUserSubscription' test.out

#- 323 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SkmbaNpW' \
    --userId 'oz6XDZyS' \
    --force  \
    --body '{"immediate": false, "reason": "EofwOEh3"}' \
    > test.out 2>&1
eval_tap $? 323 'CancelSubscription' test.out

#- 324 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CbhzYNxt' \
    --userId 'jpWipMFZ' \
    --body '{"grantDays": 31, "reason": "wtLhuc8N"}' \
    > test.out 2>&1
eval_tap $? 324 'GrantDaysToSubscription' test.out

#- 325 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ylXPaw28' \
    --userId 'AWWhXEYU' \
    --excludeFree  \
    --limit '14' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionBillingHistories' test.out

#- 326 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lV5o4TU0' \
    --userId '3NgJbNHd' \
    --body '{"additionalData": {"cardSummary": "kWamkVXl"}, "authorisedTime": "1976-05-20T00:00:00Z", "chargebackReversedTime": "1971-05-07T00:00:00Z", "chargebackTime": "1988-10-18T00:00:00Z", "chargedTime": "1971-08-07T00:00:00Z", "createdTime": "1993-07-11T00:00:00Z", "currency": {"currencyCode": "YxdSQDLq", "currencySymbol": "UvbquHb8", "currencyType": "REAL", "decimals": 86, "namespace": "z6x0kCcJ"}, "customParameters": {"4v9h7srm": {}, "fXUe5eE2": {}, "xOPB9u2Z": {}}, "extOrderNo": "X0s4DEMB", "extTxId": "0iEZoddK", "extUserId": "QvfHeZ8n", "issuedAt": "1990-12-14T00:00:00Z", "metadata": {"NJHKua6w": "B7jZYRGw", "pGROKDVl": "8HlC2jjv", "BAfeHtJg": "MMZR8V67"}, "namespace": "WiDpIc89", "nonceStr": "no8BXT4O", "paymentData": {"discountAmount": 67, "discountCode": "pcYaA2Sd", "subtotalPrice": 100, "tax": 10, "totalPrice": 56}, "paymentMethod": "vJEf1dT0", "paymentMethodFee": 73, "paymentOrderNo": "b9IcnIrr", "paymentProvider": "NEONPAY", "paymentProviderFee": 2, "paymentStationUrl": "40QBDVaT", "price": 51, "refundedTime": "1996-12-26T00:00:00Z", "salesTax": 52, "sandbox": false, "sku": "yXGJ0SZK", "status": "DELETED", "statusReason": "IVej4uMm", "subscriptionId": "38htAYwr", "subtotalPrice": 43, "targetNamespace": "mfgUx27H", "targetUserId": "Ar20bRBM", "tax": 54, "totalPrice": 46, "totalTax": 26, "txEndTime": "1984-10-02T00:00:00Z", "type": "G8rK2Yy6", "userId": "SR9MK3F1", "vat": 88}' \
    > test.out 2>&1
eval_tap $? 326 'ProcessUserSubscriptionNotification' test.out

#- 327 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'nulY2orE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qH3QGtuf' \
    --body '{"count": 94, "orderNo": "WsxpF8OK"}' \
    > test.out 2>&1
eval_tap $? 327 'AcquireUserTicket' test.out

#- 328 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSVCYcRB' \
    > test.out 2>&1
eval_tap $? 328 'QueryUserCurrencyWallets' test.out

#- 329 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'zyzwTPeG' \
    --namespace "$AB_NAMESPACE" \
    --userId '5U01Kbru' \
    --body '{"allowOverdraft": false, "amount": 1, "balanceOrigin": "Epic", "balanceSource": "TRADE", "metadata": {"S8QVSn2J": {}, "5nsrwm8y": {}, "9LlvUrGX": {}}, "reason": "HgWurbvi"}' \
    > test.out 2>&1
eval_tap $? 329 'DebitUserWalletByCurrencyCode' test.out

#- 330 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'iPIwX12I' \
    --namespace "$AB_NAMESPACE" \
    --userId '6nQiKRXj' \
    --limit '68' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 330 'ListUserCurrencyTransactions' test.out

#- 331 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'b37qAdli' \
    --namespace "$AB_NAMESPACE" \
    --userId '9VSCtszg' \
    --request '{"amount": 31, "debitBalanceSource": "TRADE", "metadata": {"UwCvjYu5": {}, "jmBUglF2": {}, "p09HqJvG": {}}, "reason": "CcQebQEw", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 331 'CheckBalance' test.out

#- 332 CheckWallet
eval_tap 0 332 'CheckWallet # SKIP deprecated' test.out

#- 333 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'lOmrxAhj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd4GDkbbi' \
    --body '{"amount": 75, "expireAt": "1982-11-10T00:00:00Z", "metadata": {"MJXMdxXL": {}, "x9cCZ81I": {}, "gsDlCPZQ": {}}, "origin": "Oculus", "reason": "UeLEn4a5", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 333 'CreditUserWallet' test.out

#- 334 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'k4rX8op1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1amNpyM5' \
    --request '{"amount": 58, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"cD4eqU4W": {}, "5PwBbwGh": {}, "8T61o9IA": {}}, "reason": "xhSQFCFl", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 334 'DebitByWalletPlatform' test.out

#- 335 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Mpvuerol' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODz4Cy9P' \
    --body '{"amount": 9, "metadata": {"DfIQTixE": {}, "8KcuoxsJ": {}, "tZZ1Ok5Z": {}}, "walletPlatform": "Epic"}' \
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
    --storeId 'wD3a1En0' \
    > test.out 2>&1
eval_tap $? 341 'ListViews' test.out

#- 342 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'upRD3sRY' \
    --body '{"displayOrder": 29, "localizations": {"ozBYegaS": {"description": "2UvkrfgV", "localExt": {"J5Gm5k8q": {}, "pN4RpdcZ": {}, "KjcEbIRJ": {}}, "longDescription": "719Cfzmg", "title": "yeQQM9qV"}, "xRwlrUHa": {"description": "aFdX9p0g", "localExt": {"ssKdew4Y": {}, "NXhGsjSt": {}, "ODcUvP6s": {}}, "longDescription": "Ae11H4Xh", "title": "6Q08wdmL"}, "bTCj2xYl": {"description": "kOiVtGXN", "localExt": {"38BQdwRV": {}, "hPRgE8gG": {}, "zGylkRRr": {}}, "longDescription": "yusQhuIW", "title": "7wHcnUXK"}}, "name": "zyo5Ifvb"}' \
    > test.out 2>&1
eval_tap $? 342 'CreateView' test.out

#- 343 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'thZXPQqn' \
    --storeId '4cwsrxQw' \
    > test.out 2>&1
eval_tap $? 343 'GetView' test.out

#- 344 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'W8vE01AO' \
    --storeId 'nwCQ7MgF' \
    --body '{"displayOrder": 20, "localizations": {"UzRblIQV": {"description": "T7weMPSg", "localExt": {"biGjzznV": {}, "gBs6YwwN": {}, "iJNF9luI": {}}, "longDescription": "j94klicu", "title": "OYnlWp3R"}, "vwW93mZS": {"description": "B3N414Xq", "localExt": {"9BkshVKY": {}, "bRz7Ubk6": {}, "36mZS7Ky": {}}, "longDescription": "RF33AySB", "title": "K6FTjgT8"}, "R1GtDW0X": {"description": "0GKURkOe", "localExt": {"U8OTDwKA": {}, "Si85uGa9": {}, "EQYefVdw": {}}, "longDescription": "yFMjRGXR", "title": "tErNpSgE"}}, "name": "SrwPpf8p"}' \
    > test.out 2>&1
eval_tap $? 344 'UpdateView' test.out

#- 345 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '1vYtpfWz' \
    --storeId 'sCP7Sw6S' \
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
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateWalletConfig' test.out

#- 348 QueryWallets
eval_tap 0 348 'QueryWallets # SKIP deprecated' test.out

#- 349 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 67, "expireAt": "1980-06-06T00:00:00Z", "metadata": {"jJdSIflM": {}, "dlPmsT2x": {}, "FEUrT1bz": {}}, "origin": "Nintendo", "reason": "kz9Zmz1s", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "GpFZ1Uf8", "userIds": ["dSk3JPj7", "CVdBrJDk", "y57fTVZ4"]}, {"creditRequest": {"amount": 74, "expireAt": "1993-09-04T00:00:00Z", "metadata": {"OHD0pRW5": {}, "cr9djRdA": {}, "BycGgEKo": {}}, "origin": "Twitch", "reason": "JXDQp3xc", "source": "REWARD"}, "currencyCode": "Nt3bW2r3", "userIds": ["V2UG6bHl", "Ll2agECl", "oCBQS01O"]}, {"creditRequest": {"amount": 49, "expireAt": "1997-03-07T00:00:00Z", "metadata": {"fHsPnSEi": {}, "FZG6UDuF": {}, "gTXnpXzZ": {}}, "origin": "Playstation", "reason": "fNCSMYTa", "source": "REFERRAL_BONUS"}, "currencyCode": "jL3jDZun", "userIds": ["o2Wi2E7c", "jU8PIBkA", "h98OjEW0"]}]' \
    > test.out 2>&1
eval_tap $? 349 'BulkCredit' test.out

#- 350 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "T8rWGthu", "request": {"allowOverdraft": false, "amount": 94, "balanceOrigin": "Twitch", "balanceSource": "EXPIRATION", "metadata": {"Qmeg6bu9": {}, "a7m8b4vW": {}, "L1fKYa7J": {}}, "reason": "9JBpQemB"}, "userIds": ["pLiYvn8e", "SOfHnn4L", "ce3QKMpa"]}, {"currencyCode": "xihcqYVM", "request": {"allowOverdraft": false, "amount": 26, "balanceOrigin": "Steam", "balanceSource": "TRADE", "metadata": {"rRK0Bswk": {}, "6l4CzuHq": {}, "xymHFsQM": {}}, "reason": "9acRcI3h"}, "userIds": ["NtOfPmeX", "5h7Y6afP", "5AUfMQgm"]}, {"currencyCode": "jI2E4ush", "request": {"allowOverdraft": true, "amount": 98, "balanceOrigin": "Nintendo", "balanceSource": "PAYMENT", "metadata": {"C94TSua2": {}, "iRkosfti": {}, "jQ7vYqp5": {}}, "reason": "BFoPUyKq"}, "userIds": ["Qf8pJs8Z", "lhV5FUu0", "Ud5B7tFi"]}]' \
    > test.out 2>&1
eval_tap $? 350 'BulkDebit' test.out

#- 351 GetWallet
eval_tap 0 351 'GetWallet # SKIP deprecated' test.out

#- 352 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '0G18PrWE' \
    --end '7GM4XdGy' \
    --start 'WZnlD7bj' \
    > test.out 2>&1
eval_tap $? 352 'SyncOrders' test.out

#- 353 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["imaNnia8", "f2q992Ff", "MOP7zYWk"], "apiKey": "xd2a8pyf", "authoriseAsCapture": true, "blockedPaymentMethods": ["W0DeFDfz", "LU2hDUtP", "fXVzTcS0"], "clientKey": "0iFXyo7V", "dropInSettings": "B1wCcO43", "liveEndpointUrlPrefix": "IOsoImt6", "merchantAccount": "OLisS7q4", "notificationHmacKey": "Zg9Uou8h", "notificationPassword": "TahLb6hS", "notificationUsername": "9Hj03n35", "returnUrl": "HGOKTGlr", "settings": "azSOBrG1"}' \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfig' test.out

#- 354 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "FCVWXUJK", "privateKey": "uvT4Jnwd", "publicKey": "AB76zrH8", "returnUrl": "7WGy60Xj"}' \
    > test.out 2>&1
eval_tap $? 354 'TestAliPayConfig' test.out

#- 355 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "qXxxagKr", "secretKey": "guaLPqj0"}' \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfig' test.out

#- 356 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'D2A0oUms' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentMerchantConfig' test.out

#- 357 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "5gtDnIz4", "webhookSecretKey": "Lz6Jdya4"}' \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfig' test.out

#- 358 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "PZaARkCe", "clientSecret": "743on0mk", "returnUrl": "XTHTGA5f", "webHookId": "Ib6oiFbt"}' \
    > test.out 2>&1
eval_tap $? 358 'TestPayPalConfig' test.out

#- 359 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["6YJgjyhr", "CWBb1D5a", "EaMHFsEa"], "publishableKey": "GCNfMEPP", "secretKey": "PdYpSsfB", "webhookSecret": "AhLuz8xh"}' \
    > test.out 2>&1
eval_tap $? 359 'TestStripeConfig' test.out

#- 360 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "L4wUZbXO", "key": "21VJbW6G", "mchid": "FZEJBusM", "returnUrl": "BRYP05re"}' \
    > test.out 2>&1
eval_tap $? 360 'TestWxPayConfig' test.out

#- 361 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "XwmCB460", "flowCompletionUrl": "nF6iz98t", "merchantId": 67, "projectId": 82, "projectSecretKey": "wRHKL9TZ"}' \
    > test.out 2>&1
eval_tap $? 361 'TestXsollaConfig' test.out

#- 362 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'lGoSBKQW' \
    > test.out 2>&1
eval_tap $? 362 'GetPaymentMerchantConfig1' test.out

#- 363 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'GcvQNc2j' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["WGuZhiqj", "7SsnF72c", "w00URRZt"], "apiKey": "7a3HBnmi", "authoriseAsCapture": false, "blockedPaymentMethods": ["6GRNTTol", "EOIrtnwg", "NsM54HBV"], "clientKey": "iudMhYOn", "dropInSettings": "bmFVGeON", "liveEndpointUrlPrefix": "p9t14HWL", "merchantAccount": "upaM1nlo", "notificationHmacKey": "HKPHkWPf", "notificationPassword": "UZMP2tYS", "notificationUsername": "sIraDzhd", "returnUrl": "exGAJkWF", "settings": "oSgJuEPU"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAdyenConfig' test.out

#- 364 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'p7Dm9c7Q' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAdyenConfigById' test.out

#- 365 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'AiAi2TbG' \
    --sandbox  \
    --validate  \
    --body '{"appId": "sj6twxPG", "privateKey": "v5700Z3l", "publicKey": "w2qClPss", "returnUrl": "Lb1yFRjr"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateAliPayConfig' test.out

#- 366 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'qPCBIxJy' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestAliPayConfigById' test.out

#- 367 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'ZQsxB8oY' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "9rKrc552", "secretKey": "op9SanNE"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateCheckoutConfig' test.out

#- 368 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'T9F5pxPr' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestCheckoutConfigById' test.out

#- 369 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'jDOZsxdT' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "ICniHs3X", "webhookSecretKey": "CYf0ISVO"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateNeonPayConfig' test.out

#- 370 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'JhqGOrfu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestNeonPayConfigById' test.out

#- 371 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ba92FPOV' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "t6TCVIRT", "clientSecret": "exNw1ClS", "returnUrl": "dmMZY1WV", "webHookId": "wEz2FYIa"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdatePayPalConfig' test.out

#- 372 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '373SUjcj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestPayPalConfigById' test.out

#- 373 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 't2jevEPD' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["gQ7omuSH", "5FVcLwIm", "NdOm2bgJ"], "publishableKey": "9o3hQzpF", "secretKey": "OXM2ixS5", "webhookSecret": "um1w79n5"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateStripeConfig' test.out

#- 374 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'kfJ82XdZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestStripeConfigById' test.out

#- 375 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'aFFnT7rc' \
    --validate  \
    --body '{"appId": "xkdyiUyj", "key": "zzYRQDuZ", "mchid": "HX7XPVuz", "returnUrl": "hYRoNr5L"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateWxPayConfig' test.out

#- 376 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'Oen1FzM0' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'UpdateWxPayConfigCert' test.out

#- 377 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Laz0rEll' \
    > test.out 2>&1
eval_tap $? 377 'TestWxPayConfigById' test.out

#- 378 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'etfpdoW4' \
    --validate  \
    --body '{"apiKey": "EjS34BYx", "flowCompletionUrl": "gvxNEizw", "merchantId": 44, "projectId": 71, "projectSecretKey": "CbJQd2Ad"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaConfig' test.out

#- 379 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'HpIYRIzX' \
    > test.out 2>&1
eval_tap $? 379 'TestXsollaConfigById' test.out

#- 380 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'lWlVEopa' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateXsollaUIConfig' test.out

#- 381 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '82' \
    --namespace "$AB_NAMESPACE" \
    --offset '59' \
    --region '06PbHieY' \
    > test.out 2>&1
eval_tap $? 381 'QueryPaymentProviderConfig' test.out

#- 382 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "1dU3d5bi", "region": "mjfqJrmt", "sandboxTaxJarApiToken": "vtM1nUiy", "specials": ["NEONPAY", "ALIPAY", "WXPAY"], "taxJarApiToken": "OMCxpO95", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 382 'CreatePaymentProviderConfig' test.out

#- 383 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetAggregatePaymentProviders' test.out

#- 384 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'U2cjafdx' \
    > test.out 2>&1
eval_tap $? 384 'DebugMatchedPaymentProviderConfig' test.out

#- 385 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 385 'GetSpecialPaymentProviders' test.out

#- 386 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'FXMsAtUb' \
    --body '{"aggregate": "XSOLLA", "namespace": "0Q4HJQGU", "region": "YonWzegH", "sandboxTaxJarApiToken": "g9kGOM6K", "specials": ["STRIPE", "XSOLLA", "WXPAY"], "taxJarApiToken": "OcquRY34", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 386 'UpdatePaymentProviderConfig' test.out

#- 387 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'JWQvGlQQ' \
    > test.out 2>&1
eval_tap $? 387 'DeletePaymentProviderConfig' test.out

#- 388 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxConfig' test.out

#- 389 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "wLp1pIFQ", "taxJarApiToken": "0XbFio6k", "taxJarEnabled": true, "taxJarProductCodesMapping": {"fkcKWnfu": "afTELKyz", "BI6tebiS": "ePS9H5oS", "pxiLLlCe": "KWfjZcoe"}}' \
    > test.out 2>&1
eval_tap $? 389 'UpdatePaymentTaxConfig' test.out

#- 390 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'Walcz8WW' \
    --end 'qsll07cy' \
    --start 'DLvOsoh8' \
    > test.out 2>&1
eval_tap $? 390 'SyncPaymentOrders' test.out

#- 391 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'TWRKV6tZ' \
    --storeId '1zWPgdG1' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetRootCategories' test.out

#- 392 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'sFNADn6J' \
    --storeId 'qw8IKd4B' \
    > test.out 2>&1
eval_tap $? 392 'DownloadCategories' test.out

#- 393 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'S3e2q3qM' \
    --namespace "$AB_NAMESPACE" \
    --language 'UhWHWxQO' \
    --storeId 'UbzHCOId' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetCategory' test.out

#- 394 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'YIHXPb0L' \
    --namespace "$AB_NAMESPACE" \
    --language 'u3hTytZq' \
    --storeId 'StAHokry' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetChildCategories' test.out

#- 395 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'bJmSLbPg' \
    --namespace "$AB_NAMESPACE" \
    --language 'XheVvSW5' \
    --storeId 'PdFGQesw' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetDescendantCategories' test.out

#- 396 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 396 'PublicListCurrencies' test.out

#- 397 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
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
    --platform 'STADIA' \
    > test.out 2>&1
eval_tap $? 399 'GetIAPItemMapping' test.out

#- 400 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'r9IWK8va' \
    --region 'M70fCLcI' \
    --storeId 'VI6y65t3' \
    --appId 'sPcv4duF' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemByAppId' test.out

#- 401 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId '4ubxjIIK' \
    --categoryPath 'PkQRoAPy' \
    --features 'GAYTbcAA' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --language 'f3RXeQps' \
    --limit '91' \
    --offset '57' \
    --region 'sgww2uvM' \
    --sortBy 'createdAt,name:desc,createdAt:desc' \
    --storeId 'B2xbFefm' \
    --tags 'jhg3jMhT' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryItems' test.out

#- 402 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'ATNxbomL' \
    --region 'hiGY2NG9' \
    --storeId 'M2XDkFdV' \
    --sku 'fh3iQRTX' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetItemBySku' test.out

#- 403 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '1AAGYuXq' \
    --storeId 'hZVm9S93' \
    --itemIds 'khwO19Jv' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetEstimatedPrice' test.out

#- 404 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Dv0yCjum' \
    --region 'oj7rXnly' \
    --storeId 'WYvtfMW4' \
    --itemIds 'r5Q1MDZH' \
    > test.out 2>&1
eval_tap $? 404 'PublicBulkGetItems' test.out

#- 405 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["IwSpRH5h", "DiRd9Apl", "AGsaF3tg"]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicValidateItemPurchaseCondition' test.out

#- 406 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '36' \
    --offset '38' \
    --region 'nam7KX34' \
    --storeId 'QguXRZ9A' \
    --keyword 'sZLQBofJ' \
    --language 'oxoVCt1a' \
    > test.out 2>&1
eval_tap $? 406 'PublicSearchItems' test.out

#- 407 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'KLtgCbxK' \
    --namespace "$AB_NAMESPACE" \
    --language 'dPVbAQ5Q' \
    --region 'BjHw5Q2a' \
    --storeId 'W3EqnfZT' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetApp' test.out

#- 408 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'X1WOBB2A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemDynamicData' test.out

#- 409 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'F0q19Aqr' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'zbHmiwKp' \
    --populateBundle  \
    --region 'x9obsh8k' \
    --storeId 'TqJXHKWN' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItem' test.out

#- 410 GetPaymentCustomization
eval_tap 0 410 'GetPaymentCustomization # SKIP deprecated' test.out

#- 411 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "PrVcPF7K", "successUrl": "XvN9WAY7"}, "paymentOrderNo": "9NjHjWOR", "paymentProvider": "WALLET", "returnUrl": "Y62Dwcfj", "ui": "M0mokZZL", "zipCode": "trhsMe3k"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentUrl' test.out

#- 412 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iYYl99yO' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetPaymentMethods' test.out

#- 413 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xEd2MbpV' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUnpaidPaymentOrder' test.out

#- 414 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QA2TlcFu' \
    --paymentProvider 'ADYEN' \
    --zipCode 'qnpzMVkT' \
    --body '{"token": "kHsiI1Yl"}' \
    > test.out 2>&1
eval_tap $? 414 'Pay' test.out

#- 415 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'YWpynhUg' \
    > test.out 2>&1
eval_tap $? 415 'PublicCheckPaymentOrderPaidStatus' test.out

#- 416 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'ND75ILb4' \
    > test.out 2>&1
eval_tap $? 416 'GetPaymentPublicConfig' test.out

#- 417 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'XwTrRdhR' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetQRCode' test.out

#- 418 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'h8EeXyos' \
    --foreinginvoice 'TtRAyWJR' \
    --invoiceId 'AAJ1UAK1' \
    --payload 'CefQ4YO5' \
    --redirectResult '8BPMmrr5' \
    --resultCode 'xv7ThVPE' \
    --sessionId 'S0CLG0WA' \
    --status 'SSCuwToM' \
    --token 'Q9hwpFoE' \
    --type 'VgvpfvDt' \
    --userId 'cTXWo5aE' \
    --orderNo 'medphVmU' \
    --paymentOrderNo 'BsPhDnei' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'cjPPrdLg' \
    > test.out 2>&1
eval_tap $? 418 'PublicNormalizePaymentReturnUrl' test.out

#- 419 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '4uOiENp2' \
    --paymentOrderNo 'BnHFE8gQ' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 419 'GetPaymentTaxValue' test.out

#- 420 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'AJLnJTeB' \
    > test.out 2>&1
eval_tap $? 420 'GetRewardByCode' test.out

#- 421 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Y59IH9Xy' \
    --limit '31' \
    --offset '96' \
    --sortBy 'namespace:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 421 'QueryRewards1' test.out

#- 422 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'V8DrTQwd' \
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
    --appIds 'moaW6mFr,PycIYzN8,hSrRXylN' \
    --itemIds '26hFrPXf,FzdcWb1f,EgZDHy6z' \
    --skus 'i4olAVCu,Csb8qHjI,IIGJ0ado' \
    > test.out 2>&1
eval_tap $? 424 'PublicExistsAnyMyActiveEntitlement' test.out

#- 425 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '5ykeU88a' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 426 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'hGdFdxGj' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 427 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'NmgXHZLf' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 428 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'cY8kASDl,mwteq5ql,zlWgv2qX' \
    --itemIds 'L9UmXrr9,Q8lqyaby,rmmrJWme' \
    --skus 'mRbUe1qt,WNeYV7wg,Azj0JcOH' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetEntitlementOwnershipToken' test.out

#- 429 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "zz2H9CAU", "language": "SF", "region": "MMkju18Z"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncTwitchDropsEntitlement' test.out

#- 430 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '1e5vOmag' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicGetMyWallet' test.out

#- 431 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'thTy6mFe' \
    --body '{"epicGamesJwtToken": "izBV3065"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncEpicGameDLC' test.out

#- 432 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijwc5E0p' \
    > test.out 2>&1
eval_tap $? 432 'SyncOculusDLC' test.out

#- 433 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHfD8ca1' \
    --body '{"serviceLabel": 69}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSyncPsnDlcInventory' test.out

#- 434 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'OfG9eG4u' \
    --body '{"serviceLabels": [25, 52, 86]}' \
    > test.out 2>&1
eval_tap $? 434 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 435 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '39DAm0bf' \
    --body '{"appId": "DqLQIeQu", "steamId": "harw1K3e"}' \
    > test.out 2>&1
eval_tap $? 435 'SyncSteamDLC' test.out

#- 436 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '8thSiq2X' \
    --body '{"xstsToken": "cRPjaGvW"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncXboxDLC' test.out

#- 437 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tD9a7pEr' \
    --appType 'DLC' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'alMMOXD3' \
    --features 'A3kSVMvZ,8lYGynSo,9rghqqug' \
    --itemId 'T7PTgUGI,67cg37Yt,i0TWjlym' \
    --limit '19' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlements' test.out

#- 438 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fD7Hht3k' \
    --appId 'oBi2dKlW' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserAppEntitlementByAppId' test.out

#- 439 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIFKAhT3' \
    --limit '72' \
    --offset '76' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 439 'PublicQueryUserEntitlementsByAppType' test.out

#- 440 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'UYwzSOxL' \
    --availablePlatformOnly  \
    --ids 'k9oL3TIh,OLaMl2nS,x0eLrNMn' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserEntitlementsByIds' test.out

#- 441 PublicGetUserEntitlementByItemId
eval_tap 0 441 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 442 PublicGetUserEntitlementBySku
eval_tap 0 442 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 443 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gNUPyYMe' \
    --endDate 'wJHAWkzK' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '66' \
    --offset '12' \
    --startDate 'eNjLDntO' \
    > test.out 2>&1
eval_tap $? 443 'PublicUserEntitlementHistory' test.out

#- 444 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'reHjvBn5' \
    --appIds 'oPZOVzT7,jZCdQZ9F,5eVFC848' \
    --itemIds 'SqYsQPQx,5OVOEPZx,gWKR7LkW' \
    --skus '4JFlAOqf,LQDEbJXf,NtUeVny0' \
    > test.out 2>&1
eval_tap $? 444 'PublicExistsAnyUserActiveEntitlement' test.out

#- 445 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lz8Odzun' \
    --appId 'FY37IbAK' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 446 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'u81NZ3Gh' \
    --entitlementClazz 'MEDIA' \
    --itemId 'cQyLyjQJ' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 447 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '2KLL3GXQ' \
    --ids 'SoD4eIUt,9zfjh5dT,9RyMAyCZ' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 448 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'mwFp0ri0' \
    --entitlementClazz 'OPTIONBOX' \
    --sku '8C6GnHCq' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 449 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '3Oy9XKj9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Imuqh7gu' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlement' test.out

#- 450 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '7b4dJfeQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '6KqLtdTt' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["2IeuyQCa", "mcPbKgI3", "rDet7RLx"], "requestId": "QwniqJ0L", "useCount": 30}' \
    > test.out 2>&1
eval_tap $? 450 'PublicConsumeUserEntitlement' test.out

#- 451 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'ihsYxom2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oFgamtzO' \
    --body '{"requestId": "YJxDGjqg", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 451 'PublicSellUserEntitlement' test.out

#- 452 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'JK6mmXWO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c2pybLS7' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 14}' \
    > test.out 2>&1
eval_tap $? 452 'PublicSplitUserEntitlement' test.out

#- 453 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'JEZwRaD0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AU0SJrgt' \
    --body '{"entitlementId": "P1FisGnX", "metadata": {"operationSource": "INVENTORY"}, "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 453 'PublicTransferUserEntitlement' test.out

#- 454 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IKb74QrD' \
    --body '{"code": "saSrNMV4", "language": "PAZ-FrIP", "region": "5doC9nkD"}' \
    > test.out 2>&1
eval_tap $? 454 'PublicRedeemCode' test.out

#- 455 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yj30tbob' \
    --body '{"excludeOldTransactions": true, "language": "XC_MXSr", "productId": "BAWg9xHn", "receiptData": "i2ZpQmDg", "region": "q8Oef0EN", "transactionId": "1bYiWhJr"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillAppleIAPItem' test.out

#- 456 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRvmS18V' \
    --body '{"epicGamesJwtToken": "2bJbN4c9"}' \
    > test.out 2>&1
eval_tap $? 456 'SyncEpicGamesInventory' test.out

#- 457 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rXyjNDVE' \
    --body '{"autoAck": true, "autoConsume": false, "language": "eor-utvJ", "orderId": "lHw2JY1l", "packageName": "mWdyhlee", "productId": "4QAQGnHo", "purchaseTime": 67, "purchaseToken": "5I5S7KN6", "region": "SXjXUASa", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 457 'PublicFulfillGoogleIAPItem' test.out

#- 458 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdqmE9He' \
    > test.out 2>&1
eval_tap $? 458 'SyncOculusConsumableEntitlements' test.out

#- 459 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9ecoZZV' \
    --body '{"currencyCode": "zKdzarqo", "price": 0.019759905514097675, "productId": "NexbnkCd", "serviceLabel": 31}' \
    > test.out 2>&1
eval_tap $? 459 'PublicReconcilePlayStationStore' test.out

#- 460 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'wmCUBMGC' \
    --body '{"currencyCode": "zmCDKWKA", "price": 0.341557693317727, "productId": "Uwjoe5d2", "serviceLabels": [72, 25, 26]}' \
    > test.out 2>&1
eval_tap $? 460 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 461 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kS6LUGor' \
    --body '{"appId": "BD9v7RMB", "currencyCode": "3xWpP1Nx", "language": "LT-909", "price": 0.04788372891645987, "productId": "JwEiXuIh", "region": "SLe1MH9C", "steamId": "6YAkeOEW"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamInventory' test.out

#- 462 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'PPskiCzp' \
    > test.out 2>&1
eval_tap $? 462 'SyncSteamAbnormalTransaction' test.out

#- 463 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'AsvNDfHY' \
    --body '{"orderId": "AfRXsKuo"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncSteamIAPByTransaction' test.out

#- 464 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'WyMB0nBn' \
    --activeOnly  \
    --groupId 'rzwCm1cd' \
    --limit '55' \
    --offset '66' \
    --productId 'ADc2FmT1' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserThirdPartySubscription' test.out

#- 465 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFqrjeVM' \
    --body '{"gameId": "JYcq2GMm", "language": "zSa-IleQ_GN", "region": "Gmhf0eyA"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncTwitchDropsEntitlement1' test.out

#- 466 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'dcY5qkny' \
    --body '{"currencyCode": "vSXkRjbq", "price": 0.8615303569428674, "productId": "VHQUTBht", "xstsToken": "RKLZAATT"}' \
    > test.out 2>&1
eval_tap $? 466 'SyncXboxInventory' test.out

#- 467 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQSr86dz' \
    --discounted  \
    --itemId 'ey05xy8s' \
    --limit '45' \
    --offset '31' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 467 'PublicQueryUserOrders' test.out

#- 468 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ME3XLMEj' \
    --body '{"currencyCode": "za9zu7F9", "discountCodes": ["06VemLb5", "bKrYtU5a", "BNE2XogB"], "discountedPrice": 94, "ext": {"OazeVD35": {}, "1UiFSHD9": {}, "HiEMbDbx": {}}, "itemId": "2oSy7iNk", "language": "pg_APud-737", "price": 89, "quantity": 88, "region": "8NdQGyl9", "returnUrl": "WoOHmWZm", "sectionId": "8wCkJCrV"}' \
    > test.out 2>&1
eval_tap $? 468 'PublicCreateUserOrder' test.out

#- 469 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jiw2Dadu' \
    --body '{"currencyCode": "bZnZvDST", "discountCodes": ["NUqiU6w3", "LOaHy0Ae", "zMbP1eXv"], "discountedPrice": 38, "itemId": "jt5wvZAN", "price": 77, "quantity": 63}' \
    > test.out 2>&1
eval_tap $? 469 'PublicPreviewOrderPrice' test.out

#- 470 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SOPz3cjN' \
    --userId 'ZcI1Rabo' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrder' test.out

#- 471 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZcToeyDK' \
    --userId 'KWUkRB92' \
    > test.out 2>&1
eval_tap $? 471 'PublicCancelUserOrder' test.out

#- 472 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'w2Vtgf6r' \
    --userId '5ty4AHdW' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetUserOrderHistories' test.out

#- 473 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4NW6AmL3' \
    --userId 'nw3moCjv' \
    > test.out 2>&1
eval_tap $? 473 'PublicDownloadUserOrderReceipt' test.out

#- 474 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'aph15qOb' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetPaymentAccounts' test.out

#- 475 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'iHSCPJDf' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'GciGp9Vm' \
    > test.out 2>&1
eval_tap $? 475 'PublicDeletePaymentAccount' test.out

#- 476 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '3wg6sFTK' \
    --autoCalcEstimatedPrice  \
    --language 'PEfOX6Sh' \
    --region 'S9eXaTWE' \
    --storeId 'o0j8VQtt' \
    --viewId '1f876rcJ' \
    > test.out 2>&1
eval_tap $? 476 'PublicListActiveSections' test.out

#- 477 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '9ZW0BsVE' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'TDsHxnvT' \
    --limit '63' \
    --offset '3' \
    --sku 'Ng7VWfvi' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserSubscriptions' test.out

#- 478 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'MTaUjfgh' \
    --body '{"currencyCode": "x4QZushR", "itemId": "8jpDtEg4", "language": "fX-PEGd-tn", "region": "WbML21IK", "returnUrl": "NLkUjFFS", "source": "QR0ziinG"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicSubscribeSubscription' test.out

#- 479 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tvsgXHUM' \
    --itemId 'dieUCFca' \
    > test.out 2>&1
eval_tap $? 479 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 480 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PfQg8QsD' \
    --userId 'XaZLxirL' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserSubscription' test.out

#- 481 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EpNna3DO' \
    --userId 'An3ngrrf' \
    > test.out 2>&1
eval_tap $? 481 'PublicChangeSubscriptionBillingAccount' test.out

#- 482 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'y93djOMO' \
    --userId 'TRZ9sWN4' \
    --body '{"immediate": false, "reason": "Vp2AjVh6"}' \
    > test.out 2>&1
eval_tap $? 482 'PublicCancelSubscription' test.out

#- 483 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Xwz8tHKw' \
    --userId '49sfaL1T' \
    --excludeFree  \
    --limit '17' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetUserSubscriptionBillingHistories' test.out

#- 484 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'rcnmab8W' \
    --language 'Ac9Nb3M9' \
    --storeId 'IdXYkyjD' \
    > test.out 2>&1
eval_tap $? 484 'PublicListViews' test.out

#- 485 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Fc5YkG6r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4SCNlWr' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetWallet' test.out

#- 486 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'dDS54hcp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5APHhqo' \
    --limit '29' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 486 'PublicListUserWalletTransactions' test.out

#- 487 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 487 'PublicGetMyDLCContent' test.out

#- 488 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'vvfPHCyK' \
    --limit '28' \
    --offset '73' \
    --startTime 'FavZiVuF' \
    --state 'FULFILL_FAILED' \
    --transactionId 'j1VLwE6T' \
    --userId 'GUMdWZVm' \
    > test.out 2>&1
eval_tap $? 488 'QueryFulfillments' test.out

#- 489 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'PvJek3JR' \
    --baseAppId 'Mhx5ZCei' \
    --categoryPath '3LeTEBSI' \
    --features 'k5BSeaeC' \
    --includeSubCategoryItem  \
    --itemName '8ytM0sYL' \
    --itemStatus 'INACTIVE' \
    --itemType 'SUBSCRIPTION,COINS,EXTENSION' \
    --limit '16' \
    --offset '84' \
    --region 'fQNjdARx' \
    --sectionExclusive  \
    --sortBy 'name,updatedAt:desc,createdAt:desc' \
    --storeId 'wXM0CzQm' \
    --tags '1Yi7ClVx' \
    --targetNamespace 'Nl03Sku9' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 489 'QueryItemsV2' test.out

#- 490 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZEmlcLQy' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 490 'ImportStore1' test.out

#- 491 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uGpkUSRr' \
    --body '{"itemIds": ["tHnZ1GGM", "pMCzB6QF", "mBr9rEAD"]}' \
    > test.out 2>&1
eval_tap $? 491 'ExportStore1' test.out

#- 492 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OCw8OpZ7' \
    --body '{"entitlementCollectionId": "hfr0aLho", "entitlementOrigin": "System", "metadata": {"OPcYIhiR": {}, "CAlxdU63": {}, "qgMdNZ6F": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "gDEPh18S", "namespace": "zhF2nc6B"}, "item": {"itemId": "7Cih6Z7O", "itemName": "O3pBW1qS", "itemSku": "hWLuuke0", "itemType": "beyhq8Hv"}, "quantity": 32, "type": "ITEM"}, {"currency": {"currencyCode": "fsq9E2GE", "namespace": "0Y8eiMa1"}, "item": {"itemId": "S7bUyk47", "itemName": "IGscTKtt", "itemSku": "DFLktUIm", "itemType": "LrjlQCER"}, "quantity": 87, "type": "ITEM"}, {"currency": {"currencyCode": "wCa47mIW", "namespace": "Wb2EXMzJ"}, "item": {"itemId": "pSCSrdgH", "itemName": "9DLMm2zN", "itemSku": "ZuMbn3nn", "itemType": "PCotLA8P"}, "quantity": 31, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "BqF8pu7q"}' \
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
    --userId 'DevzFAXp' \
    --body '{"transactionId": "BotxnQGP"}' \
    > test.out 2>&1
eval_tap $? 496 'V2PublicFulfillAppleIAPItem' test.out

#- 497 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '0F0iDGMe' \
    --userId 'EXk8rGUH' \
    --body '{"items": [{"duration": 13, "endDate": "1981-05-14T00:00:00Z", "entitlementCollectionId": "RhnUXV1D", "entitlementOrigin": "Other", "itemId": "Duko3oEM", "itemSku": "LCqsYrzw", "language": "lIeUuC5r", "metadata": {"jvnXyfeg": {}, "MKKYkReq": {}, "ACIluMdJ": {}}, "orderNo": "9d6g9BUG", "origin": "Epic", "quantity": 16, "region": "FWYJvyyU", "source": "OTHER", "startDate": "1973-01-17T00:00:00Z", "storeId": "WpCfgT7l"}, {"duration": 35, "endDate": "1976-09-14T00:00:00Z", "entitlementCollectionId": "r9yLc5B0", "entitlementOrigin": "IOS", "itemId": "RhspRAaT", "itemSku": "cNQFVRMg", "language": "88Gd2Eos", "metadata": {"ZJL8xSjr": {}, "lURRkyUN": {}, "LPOEppvS": {}}, "orderNo": "xRoY2Rex", "origin": "Playstation", "quantity": 28, "region": "iRnoItlU", "source": "OTHER", "startDate": "1985-08-12T00:00:00Z", "storeId": "zlOcVMsK"}, {"duration": 7, "endDate": "1990-11-09T00:00:00Z", "entitlementCollectionId": "7an9fodL", "entitlementOrigin": "Nintendo", "itemId": "CzvxB8HR", "itemSku": "RN7Ntzfj", "language": "Lu0cqYv8", "metadata": {"ZVvbVm30": {}, "VONrD3aG": {}, "9OAcz1w6": {}}, "orderNo": "9w5rGKlX", "origin": "Steam", "quantity": 46, "region": "tnjGhi8U", "source": "PROMOTION", "startDate": "1987-05-27T00:00:00Z", "storeId": "VPC7SpmI"}]}' \
    > test.out 2>&1
eval_tap $? 497 'FulfillItemsV3' test.out

#- 498 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '3aIKAcVU' \
    --userId 'hkPkH3hi' \
    > test.out 2>&1
eval_tap $? 498 'RetryFulfillItemsV3' test.out

#- 499 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '0rRoBkee' \
    --userId 'kkDgWISz' \
    > test.out 2>&1
eval_tap $? 499 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --id 'Wbek4XVN' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'QnJE5NgN' \
    --body '{"grantDays": "vsQOP0cn"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'UcmiyRsd' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '43BtIRsH' \
    --body '{"grantDays": "GvQjwOUJ"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "lfvm0Rdr", "dryRun": false, "fulfillmentUrl": "4aekKmid", "itemType": "CODE", "purchaseConditionUrl": "LUQVTULj"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'AkZcAMN9' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'SQErKuiI' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'CRPJBtE3' \
    --body '{"clazz": "GDJBbWfA", "dryRun": false, "fulfillmentUrl": "Fzaj0iSb", "purchaseConditionUrl": "njTZmzZR"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'GMiUrLsF' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --name 'uDw8IHty' \
    --offset '8' \
    --tag 'hAPcdnDA' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uXbs8RfY", "discountConfig": {"categories": [{"categoryPath": "3zZsNhVJ", "includeSubCategories": true}, {"categoryPath": "HYmjleKo", "includeSubCategories": true}, {"categoryPath": "Iu5ORypc", "includeSubCategories": true}], "currencyCode": "OAwYRBvR", "currencyNamespace": "uTcEjXzf", "discountAmount": 0, "discountPercentage": 84, "discountType": "PERCENTAGE", "items": [{"itemId": "ud6pvDKY", "itemName": "hi0Ebdqy"}, {"itemId": "nvGO5saN", "itemName": "55xyenWX"}, {"itemId": "LYucFFKf", "itemName": "5jed3nUl"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 44, "itemId": "nh6spAI9", "itemName": "XaeFVOTl", "quantity": 31}, {"extraSubscriptionDays": 46, "itemId": "mDTsWkm3", "itemName": "XutnJAj7", "quantity": 13}, {"extraSubscriptionDays": 55, "itemId": "NR79fYDh", "itemName": "QLXSoeFd", "quantity": 13}], "maxRedeemCountPerCampaignPerUser": 9, "maxRedeemCountPerCode": 70, "maxRedeemCountPerCodePerUser": 71, "maxSaleCount": 85, "name": "cKE3Rmrl", "redeemEnd": "1999-08-29T00:00:00Z", "redeemStart": "1979-02-10T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["Ma45wvmH", "LpBSuzvv", "oRYLU8NL"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '19W1FPJW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'wumPnTbx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "BgbtEeTQ", "discountConfig": {"categories": [{"categoryPath": "6fJhhXbK", "includeSubCategories": false}, {"categoryPath": "IZXGwfq8", "includeSubCategories": false}, {"categoryPath": "oGa4MIfs", "includeSubCategories": true}], "currencyCode": "PG6KHror", "currencyNamespace": "qi7UmZOI", "discountAmount": 81, "discountPercentage": 62, "discountType": "AMOUNT", "items": [{"itemId": "d7zgZ9tk", "itemName": "ScrECaye"}, {"itemId": "zAsifYfK", "itemName": "X8ZwYyeC"}, {"itemId": "KusvveIC", "itemName": "OB0xSxjp"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 15, "itemId": "uv6caZt5", "itemName": "RqlCustT", "quantity": 42}, {"extraSubscriptionDays": 4, "itemId": "Wry6wsXf", "itemName": "9kVNfj9O", "quantity": 77}, {"extraSubscriptionDays": 4, "itemId": "4dyAzOju", "itemName": "3koHXEwB", "quantity": 74}], "maxRedeemCountPerCampaignPerUser": 32, "maxRedeemCountPerCode": 46, "maxRedeemCountPerCodePerUser": 35, "maxSaleCount": 19, "name": "AgLysS5V", "redeemEnd": "1997-08-26T00:00:00Z", "redeemStart": "1999-05-26T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["hiYdzBB1", "DAJUttpG", "4GJM5fRQ"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'XiHiGcpB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "bMQulcgK", "oldName": "Py1j2iXa"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'EIo2O7SR' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'UTQIwMXa' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'N2UmhVGC' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "IAP", "REWARD"]}' \
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
    --body '{"appConfig": {"appName": "BEujLlJe"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "ly46QiBp"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "OhjCS9VE"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "hFrHSQaP"}, "extendType": "APP"}' \
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
    --storeId 'HUKuXjgh' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wpeuU9Cf' \
    --body '{"categoryPath": "2w7d4a1j", "localizationDisplayNames": {"Br4IhaQ4": "VHU8lg9p", "2abvzO4a": "A3PXLP5K", "8UxZYL30": "U09ZJ9kk"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Oa5bQsV9' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'oLsX8MRu' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5YiEFkiw' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'WlQ5RsWt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uBFJxLpk' \
    --body '{"localizationDisplayNames": {"KiGITGqO": "EsFGO6ZM", "7d5R4FdW": "52OPCkcD", "Dp8TAkKV": "K2LIg8Pg"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'zltIlxei' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7hdLpOey' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'RQFd051m' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9jVpaexb' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'O2E01KuR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XmefoGHK' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'JCllXWzZ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'CL8Ic2ZF' \
    --batchNo '89,15,36' \
    --code 'BfUVFZaL' \
    --limit '24' \
    --offset '57' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'Gdvam4Qa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "7JLzniWh", "codeValue": "Egsh7QP0", "quantity": 40}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'PGzE7nbx' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'zBTfjSHw' \
    --batchNo '12,57,63' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'wPP4zhbo' \
    --namespace "$AB_NAMESPACE" \
    --batchName '35hLSQ58' \
    --batchNo '60,38,17' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '7FhaLJxX' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'nZ7Jh9AD' \
    --batchNo '14,2,67' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '5Gxr2vdR' \
    --namespace "$AB_NAMESPACE" \
    --code 'llW0BZsp' \
    --limit '67' \
    --offset '11' \
    --userId '5abas59c' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '7rJfNiL2' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'KhbH3hmz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'M34hriQJ' \
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
    --body '{"currencyCode": "PptSo2jo", "currencySymbol": "bcOo9DOg", "currencyType": "REAL", "decimals": 64, "localizationDescriptions": {"3VntlKNg": "FTcF0d3r", "0vAR7Tzz": "RmLk1WEv", "hENXcvPb": "oUFJLBhd"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '4mM4qSic' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"AX0hxTpn": "b4Yjbvrl", "umxWaQKu": "XlvfcLMh", "uUx9FBfd": "0tY6sQAQ"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'N0LnUO6g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '3Y2VfwJW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'hELBAjZ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'YUVOtTz8' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'iAY0yquu' \
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
    --body '{"data": [{"autoUpdate": false, "enableRevocation": false, "id": "XJFNPYj4", "rewards": [{"currency": {"currencyCode": "OcDBsiwu", "namespace": "pGiDnJrM"}, "item": {"itemId": "nMgaWpvg", "itemName": "dDw72bPG", "itemSku": "mLgnrWBf", "itemType": "OeKZeP4c"}, "quantity": 100, "type": "ITEM"}, {"currency": {"currencyCode": "9xeN8OqV", "namespace": "tXFYBBtF"}, "item": {"itemId": "GRCiPo1H", "itemName": "vGRQriGr", "itemSku": "JsgR7Gpf", "itemType": "CoimwFM8"}, "quantity": 7, "type": "CURRENCY"}, {"currency": {"currencyCode": "lvbKA2KZ", "namespace": "Zq38BOhN"}, "item": {"itemId": "q7hLnCna", "itemName": "vxVYTqv5", "itemSku": "FnEWdLeS", "itemType": "Oo4L9JEP"}, "quantity": 69, "type": "CURRENCY"}], "rvn": 43}, {"autoUpdate": false, "enableRevocation": false, "id": "bpM2oFvg", "rewards": [{"currency": {"currencyCode": "WxHMYnHf", "namespace": "4HxlF6pr"}, "item": {"itemId": "5Uv1qnKC", "itemName": "zl5xipBQ", "itemSku": "WZEvy3kX", "itemType": "k00MK3iI"}, "quantity": 29, "type": "ITEM"}, {"currency": {"currencyCode": "pzZYyWQa", "namespace": "MFxdS9J7"}, "item": {"itemId": "4r9mdetQ", "itemName": "lPbzx0o5", "itemSku": "MpGX2XkO", "itemType": "TDpdwAsa"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"currencyCode": "CNPVUGFI", "namespace": "1x3z2dH3"}, "item": {"itemId": "eYPA236Z", "itemName": "BITIi0Mo", "itemSku": "p82C0gkq", "itemType": "skrEA9mD"}, "quantity": 65, "type": "ITEM"}], "rvn": 14}, {"autoUpdate": false, "enableRevocation": true, "id": "MDoioWwJ", "rewards": [{"currency": {"currencyCode": "nQhUXLsY", "namespace": "HXxnxIZW"}, "item": {"itemId": "tcBSsary", "itemName": "4l4VFhqL", "itemSku": "zwdKSpCC", "itemType": "wXFXOOWY"}, "quantity": 27, "type": "ITEM"}, {"currency": {"currencyCode": "r4t7PkV0", "namespace": "Wtabf2N2"}, "item": {"itemId": "BqUOsRik", "itemName": "OGaSMZGF", "itemSku": "XtkGDbSu", "itemType": "Jk1N6GbK"}, "quantity": 77, "type": "ITEM"}, {"currency": {"currencyCode": "XDITxpvP", "namespace": "uOAeYZ9g"}, "item": {"itemId": "6LrVAi7B", "itemName": "sbBRVCDX", "itemSku": "c5iteyJ7", "itemType": "j0XApPw5"}, "quantity": 30, "type": "CURRENCY"}], "rvn": 41}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"rFygtu9S": "kiMIWudb", "SRQTl2OS": "rTcO64Ps", "1evodHK9": "dyXk5go3"}}, {"platform": "PSN", "platformDlcIdMap": {"bZZvl6zF": "pi4t1bhu", "okBtSUJ4": "SGTnyAAi", "bgqemK6a": "e9padBnZ"}}, {"platform": "XBOX", "platformDlcIdMap": {"VhITiWBH": "AWiXuJHf", "d0VxcFg6": "oMmo1fZJ", "O39rDU9A": "8Gx3hW6O"}}]}' \
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
    --entitlementClazz 'MEDIA' \
    --entitlementName 'A52EHfuo' \
    --itemId 'JHux40Ue,OPMyAeVH,OUcWYLIC' \
    --limit '34' \
    --offset '89' \
    --origin 'Nintendo' \
    --userId '5i9qQCmF' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'qpOW5uhF,owHVPjSM,6M9mszW0' \
    --limit '11' \
    --offset '86' \
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
    --body '{"entitlementGrantList": [{"collectionId": "y1TLnf7m", "endDate": "1971-05-17T00:00:00Z", "grantedCode": "Ew8KUGcy", "itemId": "uWvgCd2k", "itemNamespace": "P9yOEVLj", "language": "Ir_EdlX-Sd", "metadata": {"tgvxBZfz": {}, "V7LMtNCs": {}, "pIUygpx5": {}}, "origin": "System", "quantity": 23, "region": "tCsj1qON", "source": "PROMOTION", "startDate": "1998-05-30T00:00:00Z", "storeId": "pWmuneGS"}, {"collectionId": "FPrZBkNJ", "endDate": "1978-11-24T00:00:00Z", "grantedCode": "PMMkEygw", "itemId": "AvbFOht6", "itemNamespace": "IJa13qUI", "language": "hRUi_nS", "metadata": {"ZeveEtfC": {}, "L5GeEtYp": {}, "CmIuG5V5": {}}, "origin": "IOS", "quantity": 1, "region": "2ZkHF3fX", "source": "GIFT", "startDate": "1984-07-17T00:00:00Z", "storeId": "yjthB0r7"}, {"collectionId": "sZFQ8UPh", "endDate": "1973-10-31T00:00:00Z", "grantedCode": "9TMQkhxj", "itemId": "fhhMa5HF", "itemNamespace": "MDIbd3SY", "language": "AGU-425", "metadata": {"2tAPE6ks": {}, "zdsRsV6l": {}, "7jtt974V": {}}, "origin": "Epic", "quantity": 0, "region": "P8w5H8BE", "source": "OTHER", "startDate": "1995-12-07T00:00:00Z", "storeId": "GtStwAwf"}], "userIds": ["MWdyJAkW", "rudhLhWC", "jCm8fQvi"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["EXV8KikH", "AMCRpGwZ", "61eKR8g8"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '6nZEOqaH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '29' \
    --status 'SUCCESS' \
    --userId 'FY0XlhRz' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '9db8whmG' \
    --eventType 'REFUND' \
    --externalOrderId 'Yqr0W4N9' \
    --limit '89' \
    --offset '67' \
    --startTime 'cgruVln8' \
    --status 'SUCCESS' \
    --userId '9kVvRmWn' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "4eXNxk6Z", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 53, "clientTransactionId": "oaMkHwJU"}, {"amountConsumed": 84, "clientTransactionId": "rUA1KpFX"}, {"amountConsumed": 41, "clientTransactionId": "Wnbx7NZd"}], "entitlementId": "iWgmvu7w", "usageCount": 33}, {"clientTransaction": [{"amountConsumed": 21, "clientTransactionId": "Z9eqkKIU"}, {"amountConsumed": 7, "clientTransactionId": "g9rf42ti"}, {"amountConsumed": 85, "clientTransactionId": "cogxYc5G"}], "entitlementId": "FzOKp5Po", "usageCount": 32}, {"clientTransaction": [{"amountConsumed": 75, "clientTransactionId": "IWcvRgec"}, {"amountConsumed": 47, "clientTransactionId": "19yYm5yl"}, {"amountConsumed": 6, "clientTransactionId": "qX5ynaEL"}], "entitlementId": "Akf3PmSX", "usageCount": 29}], "purpose": "m77eycfP"}, "originalTitleName": "PAPrjPjP", "paymentProductSKU": "VnGVFJ5T", "purchaseDate": "DT1xdGNh", "sourceOrderItemId": "A7QcVVAH", "titleName": "HZhsd5Uj"}, "eventDomain": "sN5WybxS", "eventSource": "pNHbYY2E", "eventType": "B3J1cCWC", "eventVersion": 98, "id": "dmYMfrXg", "timestamp": "5ZRWRVTN"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "DJKdLGBk", "eventState": "yNHRixrN", "lineItemId": "KWCGohAl", "orderId": "SXZdPC69", "productId": "K5AJ2JcR", "productType": "gC3Xejh7", "purchasedDate": "MrPFbO94", "sandboxId": "GgAB22ur", "skuId": "u8e2uNVC", "subscriptionData": {"consumedDurationInDays": 45, "dateTime": "hUGtTUfe", "durationInDays": 100, "recurrenceId": "ESebcN9h"}}, "datacontenttype": "IXgQyO82", "id": "iWpYkSHd", "source": "w244C2sf", "specVersion": "qlH0EMuU", "subject": "ywG53fX7", "time": "TyoBG6aD", "traceparent": "iZ1TViyI", "type": "D972yC78"}' \
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
    --body '{"appAppleId": 76, "bundleId": "UBv3nU2e", "issuerId": "IQ7QlO4e", "keyId": "gCtlEcCx", "password": "fFcrLICI", "version": "V1"}' \
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
    --body '{"sandboxId": "Wh1FVaaW"}' \
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
    --body '{"applicationName": "WQsk9CFt", "notificationTokenAudience": "Id8TTuiS", "notificationTokenEmail": "1ufSsxhF", "packageName": "UD72QaeP", "serviceAccountId": "LLMe3RDE"}' \
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
    --body '{"data": [{"itemIdentity": "gM6qkxz4", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"1qlOtGNX": "5yBdH9G3", "L4WmALy8": "AcmLv7I7", "fd8zs3ex": "rs3bZgJ1"}}, {"itemIdentity": "LhEmyhy9", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"d5fQXosA": "kYWuqLCm", "8At8TzQ4": "nDS2Aw5g", "uPE1xCJc": "3Avbi94v"}}, {"itemIdentity": "2071GDOS", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"8ClJS9VQ": "S8wfSS3x", "4DReVzNp": "pVz8FTGH", "cx1SFWkw": "EhcvSwHI"}}]}' \
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
    --body '{"appId": "dFiDpWlw", "appSecret": "Uyro5nfL", "webhookVerifyToken": "woS4HT23"}' \
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
    --body '{"sku": "WB0UisS1"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'OULTXdw3' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'kroXvfK5' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "bKA1GD4c", "sku": "yypDI39t"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'GJCAE6BM' \
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
    --body '{"backOfficeServerClientId": "EGQXrv70", "backOfficeServerClientSecret": "te3eCQis", "enableStreamJob": true, "environment": "kYuQlAMI", "streamName": "Fhz7RGEp", "streamPartnerName": "9nEbgMKW"}' \
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
    --body '{"backOfficeServerClientId": "K49Am6a8", "backOfficeServerClientSecret": "82LRp700", "enableStreamJob": true, "environment": "x0r5evn4", "streamName": "7p50imPM", "streamPartnerName": "ZbxfAok4"}' \
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
    --body '{"appId": "8CWLBnNw", "env": "LIVE", "publisherAuthenticationKey": "sTYmTlWU", "syncMode": "TRANSACTION"}' \
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
    --body '{"clientId": "7evD3cW3", "clientSecret": "zJRdoH6A", "organizationId": "9jMkBw59"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "08Y8PB36", "entraAppClientSecret": "KLmcabuK", "entraTenantId": "WI2Jwz0u", "relyingPartyCert": "7wM4C67W"}' \
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
    --password 'u7Lzg7Nz' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cZDfHgw1' \
    --externalId 'ci4B2Jwr' \
    --limit '89' \
    --offset '48' \
    --source 'GOOGLE' \
    --startDate 'QeLUWAZf' \
    --status 'WARN' \
    --type '6M4N7y6u' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '52' \
    --orderId 'elONy1Ni' \
    --steamId 'b3rl3z6d' \
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
    --body '{"env": "LIVE", "lastTime": "1980-01-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'RLsRXik7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '96' \
    --orderId 'offL32M1' \
    --processStatus 'PROCESSED' \
    --steamId 'keClz9F6' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId '6DfIFvJ1' \
    --limit '81' \
    --offset '5' \
    --platform 'APPLE' \
    --productId 'tXCEcXxE' \
    --userId 'TkPWRjdV' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'jEq18TSZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Uk3NZZ7I' \
    --feature 'i1dMFyAX' \
    --itemId 'I91uNSNh' \
    --itemType 'OPTIONBOX' \
    --startTime 'irRQzjJx' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'nilVJYDB' \
    --feature 'cU5rUNqh' \
    --itemId 'crsQDrxq' \
    --itemType 'MEDIA' \
    --startTime 'Ut8bKred' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'udoMoTHB' \
    --body '{"categoryPath": "yhcqtBj8", "targetItemId": "lMpFN73p", "targetNamespace": "YOdM7PTF"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DKVwFrqC' \
    --body '{"appId": "NKPhq7uu", "appType": "GAME", "baseAppId": "0fT4esc2", "boothName": "I4E4JBaI", "categoryPath": "Tl9nDVQ3", "clazz": "ql8wZ3wE", "displayOrder": 49, "entitlementType": "DURABLE", "ext": {"t6Fj7pKO": {}, "qvzq3Kkz": {}, "x2wJQcNk": {}}, "features": ["Q46rS1Nb", "F5MVdcSL", "v7axDxxx"], "flexible": true, "images": [{"as": "n4tRYY8x", "caption": "IxcMfE4k", "height": 53, "imageUrl": "cZIYxNv8", "smallImageUrl": "Y36EPzrT", "width": 91}, {"as": "y0Pj5YS5", "caption": "kMeMyw4C", "height": 58, "imageUrl": "U78axTLl", "smallImageUrl": "wF2eICUw", "width": 32}, {"as": "HUZO2Tea", "caption": "lh0jaxcw", "height": 57, "imageUrl": "cW09SAaJ", "smallImageUrl": "0uwzO5CU", "width": 77}], "inventoryConfig": {"customAttributes": {"6rxldPIL": {}, "XI0n3UsT": {}, "7uKcfFNX": {}}, "serverCustomAttributes": {"h3ETCIE6": {}, "iMtmWjbL": {}, "Q6OMQzug": {}}, "slotUsed": 86}, "itemId": "rLZyzoJG", "itemIds": ["Cp7srGyz", "ANyAgndg", "JYYHuqXq"], "itemQty": {"c6V5iXUI": 49, "ocEDlmn9": 17, "K5TpZPOc": 50}, "itemType": "CODE", "listable": false, "localizations": {"HoE5AviJ": {"description": "Ai64mMAn", "localExt": {"einMoHe3": {}, "8qB4Goa9": {}, "dpEfir51": {}}, "longDescription": "fx2z8GVU", "title": "qoutjxz0"}, "v2kr1cwi": {"description": "MxOJcJUB", "localExt": {"BrapO61V": {}, "quoJXr9K": {}, "wsSmGb1d": {}}, "longDescription": "DTS4K4mG", "title": "qIZQ5M6x"}, "0aUAyW1N": {"description": "TUCthwpb", "localExt": {"knZlnZYi": {}, "IoJVUCcO": {}, "A1cytbBg": {}}, "longDescription": "DviL9Saz", "title": "1ErLedJg"}}, "lootBoxConfig": {"rewardCount": 32, "rewards": [{"lootBoxItems": [{"count": 33, "duration": 97, "endDate": "1988-10-31T00:00:00Z", "itemId": "DJOMARwx", "itemSku": "RQS8wIuc", "itemType": "q9cYkz9g"}, {"count": 75, "duration": 94, "endDate": "1999-04-20T00:00:00Z", "itemId": "DdnCEX2q", "itemSku": "wAcQfXG6", "itemType": "zoTahcB2"}, {"count": 60, "duration": 17, "endDate": "1987-02-03T00:00:00Z", "itemId": "VFXfe1qB", "itemSku": "jPIcclpz", "itemType": "slEKt8t2"}], "name": "ZqUgS3GP", "odds": 0.7561558715979414, "type": "PROBABILITY_GROUP", "weight": 43}, {"lootBoxItems": [{"count": 4, "duration": 72, "endDate": "1976-02-06T00:00:00Z", "itemId": "c40mhMhY", "itemSku": "yWNbpQpN", "itemType": "s5kDXXEO"}, {"count": 80, "duration": 30, "endDate": "1999-09-26T00:00:00Z", "itemId": "2RotJyMd", "itemSku": "hdyjRyDW", "itemType": "UpZQNN48"}, {"count": 71, "duration": 25, "endDate": "1980-01-12T00:00:00Z", "itemId": "Qia9PUeq", "itemSku": "X5SsCITm", "itemType": "iOAZDa0e"}], "name": "4IZ7UqGb", "odds": 0.6064365501681146, "type": "PROBABILITY_GROUP", "weight": 98}, {"lootBoxItems": [{"count": 60, "duration": 84, "endDate": "1991-06-30T00:00:00Z", "itemId": "PwwXe7IH", "itemSku": "FSbgCUZm", "itemType": "kY4yYxr9"}, {"count": 25, "duration": 61, "endDate": "1982-08-24T00:00:00Z", "itemId": "uHZQwldE", "itemSku": "GyZ0KMTx", "itemType": "SRA8YpQV"}, {"count": 8, "duration": 47, "endDate": "1985-05-08T00:00:00Z", "itemId": "P7aQAicJ", "itemSku": "BTnYDUje", "itemType": "rB1ikAn7"}], "name": "QsXrp9tn", "odds": 0.3954144437669571, "type": "REWARD", "weight": 75}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 95, "name": "wI5ZJn9z", "optionBoxConfig": {"boxItems": [{"count": 76, "duration": 28, "endDate": "1974-09-24T00:00:00Z", "itemId": "VTNgHC3d", "itemSku": "Eg2FudNQ", "itemType": "kg6daqwY"}, {"count": 52, "duration": 52, "endDate": "1977-01-05T00:00:00Z", "itemId": "jnAu6cxD", "itemSku": "rw9FUS1G", "itemType": "MPLfTtlz"}, {"count": 47, "duration": 44, "endDate": "1990-06-26T00:00:00Z", "itemId": "F4WRNJgj", "itemSku": "vdDVDS0a", "itemType": "5SYQrxWd"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 51, "fixedTrialCycles": 97, "graceDays": 67}, "regionData": {"XcOKWCn4": [{"currencyCode": "ze6EyT5N", "currencyNamespace": "4xzmy6Et", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1986-06-23T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1992-04-26T00:00:00Z", "expireAt": "1984-05-10T00:00:00Z", "price": 3, "purchaseAt": "1972-03-08T00:00:00Z", "trialPrice": 14}, {"currencyCode": "8PctcUAg", "currencyNamespace": "wqPelXfp", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1998-03-18T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1987-06-09T00:00:00Z", "expireAt": "1976-11-07T00:00:00Z", "price": 74, "purchaseAt": "1984-01-03T00:00:00Z", "trialPrice": 60}, {"currencyCode": "vVqD3y08", "currencyNamespace": "d6WGSWqj", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1990-05-10T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1992-11-15T00:00:00Z", "expireAt": "1987-05-27T00:00:00Z", "price": 19, "purchaseAt": "1982-08-19T00:00:00Z", "trialPrice": 68}], "22mXoGJn": [{"currencyCode": "yOsof93S", "currencyNamespace": "rYmqgKyY", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1975-11-14T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1999-03-18T00:00:00Z", "expireAt": "1998-03-11T00:00:00Z", "price": 61, "purchaseAt": "1976-05-19T00:00:00Z", "trialPrice": 80}, {"currencyCode": "U8WtMtkt", "currencyNamespace": "6DNbfBOa", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1990-11-12T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1988-05-27T00:00:00Z", "expireAt": "1977-11-09T00:00:00Z", "price": 87, "purchaseAt": "1987-11-02T00:00:00Z", "trialPrice": 89}, {"currencyCode": "xXi1ORFW", "currencyNamespace": "V2A8TA7M", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1995-06-18T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-04-24T00:00:00Z", "expireAt": "1992-02-25T00:00:00Z", "price": 2, "purchaseAt": "1982-01-20T00:00:00Z", "trialPrice": 86}], "P9ymhnQz": [{"currencyCode": "qEkfEXgr", "currencyNamespace": "nxHM6oay", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1997-01-19T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1988-08-14T00:00:00Z", "expireAt": "1983-06-28T00:00:00Z", "price": 83, "purchaseAt": "1971-05-29T00:00:00Z", "trialPrice": 44}, {"currencyCode": "u9TxV4Xl", "currencyNamespace": "kpNyczqx", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1980-09-26T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1975-11-04T00:00:00Z", "expireAt": "1992-08-24T00:00:00Z", "price": 51, "purchaseAt": "1997-01-08T00:00:00Z", "trialPrice": 21}, {"currencyCode": "39HdO5Qb", "currencyNamespace": "AIazffVH", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1985-10-24T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1993-02-02T00:00:00Z", "expireAt": "1982-09-11T00:00:00Z", "price": 60, "purchaseAt": "1990-04-01T00:00:00Z", "trialPrice": 86}]}, "saleConfig": {"currencyCode": "vqXE7CLW", "price": 1}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "Wbotmymk", "stackable": true, "status": "ACTIVE", "tags": ["uDaqZ341", "2dCauubt", "9XiDTo1o"], "targetCurrencyCode": "cYonEJaK", "targetNamespace": "ZpnQxIFA", "thumbnailUrl": "AGU5wkmi", "useCount": 14}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uF9fzDjt' \
    --appId 'wXMAlTd3' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'Aa8fAWmJ' \
    --baseAppId 'V1YnGnSE' \
    --categoryPath '8AW8ok5n' \
    --features 'BxZWdphZ' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '4' \
    --offset '62' \
    --region 'vlzjp7ek' \
    --sortBy 'updatedAt:desc,createdAt:asc,displayOrder:asc' \
    --storeId 'pPEeB0kQ' \
    --tags 'Jss6h5Qb' \
    --targetNamespace 'WNEIYRTP' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'jOPzOeH7,8LAqPcPc,5cz0Gr0l' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gVtMuJsw' \
    --itemIds 'U7uB9OQN' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SC086SjK' \
    --sku '2HPHwxc3' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '8YgWWw7N' \
    --populateBundle  \
    --region '3nECwYVk' \
    --storeId 'mPK5IDLi' \
    --sku '2XNS9UOe' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'mGdws3ww' \
    --region 'HEXesnKr' \
    --storeId 'XlmF9J69' \
    --itemIds 'VIOLJkwV' \
    --userId '0vqunUQe' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'G3my0lBH' \
    --sku 'jKVMvkaq' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'P3NlIjRr,kAGqkbip,POX2RcUM' \
    --storeId '4tGBhVdP' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'bLUFVMsX' \
    --region 'lCDfpoDI' \
    --storeId 'YFg6auTU' \
    --itemIds 'PsQSCttc' \
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
    --platform 'gytf4swf' \
    --userId 'C4YilLhu' \
    --body '{"itemIds": ["OAlA5GDI", "ZvqOWys0", "6PMcxNcz"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'amH7iE3K' \
    --body '{"changes": [{"itemIdentities": ["XSDZEHu6", "Yy9HxZvc", "hNzyHGaa"], "itemIdentityType": "ITEM_SKU", "regionData": {"Fi1aSbCH": [{"currencyCode": "Tgk4sreh", "currencyNamespace": "PgFt8KuF", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1997-02-23T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-12-29T00:00:00Z", "discountedPrice": 19, "expireAt": "1986-06-08T00:00:00Z", "price": 73, "purchaseAt": "1992-01-03T00:00:00Z", "trialPrice": 24}, {"currencyCode": "MBprofxw", "currencyNamespace": "oRR8y93f", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1993-02-20T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1999-11-28T00:00:00Z", "discountedPrice": 13, "expireAt": "1982-10-03T00:00:00Z", "price": 66, "purchaseAt": "1985-12-06T00:00:00Z", "trialPrice": 46}, {"currencyCode": "f0bXVEdb", "currencyNamespace": "DTvV2p1R", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1984-01-06T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1981-11-26T00:00:00Z", "discountedPrice": 33, "expireAt": "1979-03-16T00:00:00Z", "price": 76, "purchaseAt": "1979-05-09T00:00:00Z", "trialPrice": 18}], "nR6LDWPm": [{"currencyCode": "zCWka7wY", "currencyNamespace": "9kuVuWfo", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1980-09-10T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1991-01-05T00:00:00Z", "discountedPrice": 44, "expireAt": "1996-11-17T00:00:00Z", "price": 61, "purchaseAt": "1996-09-14T00:00:00Z", "trialPrice": 20}, {"currencyCode": "NnrZTSGb", "currencyNamespace": "Tw1Cgt2F", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1992-05-06T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1979-01-23T00:00:00Z", "discountedPrice": 74, "expireAt": "1985-02-01T00:00:00Z", "price": 23, "purchaseAt": "1988-06-18T00:00:00Z", "trialPrice": 38}, {"currencyCode": "EdVFbuFY", "currencyNamespace": "OuD5eAiH", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1991-02-26T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1982-10-29T00:00:00Z", "discountedPrice": 35, "expireAt": "1990-12-02T00:00:00Z", "price": 23, "purchaseAt": "1989-03-05T00:00:00Z", "trialPrice": 76}], "Q0F6QMWC": [{"currencyCode": "b6s3Cshx", "currencyNamespace": "J2BKdz0F", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1993-04-19T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1973-02-13T00:00:00Z", "discountedPrice": 16, "expireAt": "1981-01-09T00:00:00Z", "price": 71, "purchaseAt": "1985-03-03T00:00:00Z", "trialPrice": 25}, {"currencyCode": "Xp4T3jqE", "currencyNamespace": "4wMwqeoC", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1986-09-10T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1993-01-12T00:00:00Z", "discountedPrice": 49, "expireAt": "1988-01-15T00:00:00Z", "price": 26, "purchaseAt": "1971-09-26T00:00:00Z", "trialPrice": 59}, {"currencyCode": "lfvMEEpN", "currencyNamespace": "1VyHqVyD", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1984-03-02T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1982-09-06T00:00:00Z", "discountedPrice": 44, "expireAt": "1981-10-27T00:00:00Z", "price": 81, "purchaseAt": "1998-09-04T00:00:00Z", "trialPrice": 88}]}}, {"itemIdentities": ["e5IPTgb9", "JDYKQsaU", "U61t4wmL"], "itemIdentityType": "ITEM_ID", "regionData": {"iVzBI6Bo": [{"currencyCode": "r2FY9T1O", "currencyNamespace": "tzJgNQj7", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1992-08-01T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1992-03-23T00:00:00Z", "discountedPrice": 9, "expireAt": "1985-04-25T00:00:00Z", "price": 39, "purchaseAt": "1998-12-14T00:00:00Z", "trialPrice": 82}, {"currencyCode": "pnvkUHCy", "currencyNamespace": "gsd9fEc3", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1998-02-07T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1991-05-04T00:00:00Z", "discountedPrice": 37, "expireAt": "1980-02-18T00:00:00Z", "price": 12, "purchaseAt": "1997-09-22T00:00:00Z", "trialPrice": 53}, {"currencyCode": "2x7w3WYk", "currencyNamespace": "nIU6UHzy", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1991-09-14T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1978-03-31T00:00:00Z", "discountedPrice": 83, "expireAt": "1983-12-08T00:00:00Z", "price": 43, "purchaseAt": "1976-03-15T00:00:00Z", "trialPrice": 55}], "mY8EA94i": [{"currencyCode": "rRXEyNwT", "currencyNamespace": "Ui6lAXmo", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1979-07-21T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1994-02-08T00:00:00Z", "discountedPrice": 28, "expireAt": "1985-10-01T00:00:00Z", "price": 74, "purchaseAt": "1988-11-07T00:00:00Z", "trialPrice": 24}, {"currencyCode": "50JsSq8f", "currencyNamespace": "BiqntCpo", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1984-05-05T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1998-06-02T00:00:00Z", "discountedPrice": 25, "expireAt": "1972-03-04T00:00:00Z", "price": 3, "purchaseAt": "1994-08-29T00:00:00Z", "trialPrice": 23}, {"currencyCode": "KMrzBIGl", "currencyNamespace": "l1rcwUu2", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1996-01-07T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1994-09-02T00:00:00Z", "discountedPrice": 63, "expireAt": "1973-07-16T00:00:00Z", "price": 93, "purchaseAt": "1983-12-26T00:00:00Z", "trialPrice": 36}], "YcYmkLft": [{"currencyCode": "8lgYEBGh", "currencyNamespace": "SEGbIbHu", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1978-08-27T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1996-10-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1998-12-09T00:00:00Z", "price": 98, "purchaseAt": "1977-12-20T00:00:00Z", "trialPrice": 2}, {"currencyCode": "clA6hNF0", "currencyNamespace": "5Ly4kNV7", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1989-12-10T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1978-04-27T00:00:00Z", "discountedPrice": 15, "expireAt": "1973-06-06T00:00:00Z", "price": 46, "purchaseAt": "1994-03-26T00:00:00Z", "trialPrice": 19}, {"currencyCode": "qNqoYc2Y", "currencyNamespace": "2z57YtX3", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1971-08-26T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1985-06-18T00:00:00Z", "discountedPrice": 30, "expireAt": "1972-03-23T00:00:00Z", "price": 8, "purchaseAt": "1985-04-22T00:00:00Z", "trialPrice": 70}]}}, {"itemIdentities": ["F5d4fRoZ", "uYDDw2XW", "3BkOyjfI"], "itemIdentityType": "ITEM_SKU", "regionData": {"mzEGrfpR": [{"currencyCode": "1YykAbOm", "currencyNamespace": "5kcePplR", "currencyType": "VIRTUAL", "discountAmount": 68, "discountExpireAt": "1972-02-05T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1989-12-21T00:00:00Z", "discountedPrice": 90, "expireAt": "1981-05-15T00:00:00Z", "price": 61, "purchaseAt": "1993-01-24T00:00:00Z", "trialPrice": 58}, {"currencyCode": "8v7ZJ5IW", "currencyNamespace": "GjIgHYrr", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1996-08-25T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1984-11-13T00:00:00Z", "discountedPrice": 53, "expireAt": "1978-10-19T00:00:00Z", "price": 65, "purchaseAt": "1979-08-25T00:00:00Z", "trialPrice": 64}, {"currencyCode": "3RFgSrJu", "currencyNamespace": "mkgrtLkK", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1971-01-18T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1990-11-29T00:00:00Z", "discountedPrice": 96, "expireAt": "1979-04-09T00:00:00Z", "price": 26, "purchaseAt": "1982-10-04T00:00:00Z", "trialPrice": 69}], "G2Ubjjz5": [{"currencyCode": "DoWmFvhB", "currencyNamespace": "YKzT3Dn0", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1997-11-21T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-03-09T00:00:00Z", "discountedPrice": 35, "expireAt": "1985-07-02T00:00:00Z", "price": 84, "purchaseAt": "1977-06-08T00:00:00Z", "trialPrice": 97}, {"currencyCode": "G33ocXsj", "currencyNamespace": "Uxrrvmoo", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1992-08-16T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1986-03-30T00:00:00Z", "discountedPrice": 10, "expireAt": "1996-05-20T00:00:00Z", "price": 11, "purchaseAt": "1983-04-19T00:00:00Z", "trialPrice": 80}, {"currencyCode": "8yJvG7kF", "currencyNamespace": "DXM5RQlW", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1980-12-19T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1990-02-15T00:00:00Z", "discountedPrice": 19, "expireAt": "1985-04-06T00:00:00Z", "price": 18, "purchaseAt": "1971-07-26T00:00:00Z", "trialPrice": 42}], "BoJMHjzi": [{"currencyCode": "BRkRfj3L", "currencyNamespace": "3q1vCw91", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1985-04-19T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1997-06-07T00:00:00Z", "discountedPrice": 23, "expireAt": "1972-01-25T00:00:00Z", "price": 74, "purchaseAt": "1983-07-23T00:00:00Z", "trialPrice": 77}, {"currencyCode": "LZTKBvVp", "currencyNamespace": "wR40eNfH", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1981-04-11T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1996-03-09T00:00:00Z", "discountedPrice": 38, "expireAt": "1982-07-17T00:00:00Z", "price": 61, "purchaseAt": "1976-03-15T00:00:00Z", "trialPrice": 58}, {"currencyCode": "jCzvga5W", "currencyNamespace": "3ShXhQbz", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1990-04-25T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1992-10-13T00:00:00Z", "discountedPrice": 40, "expireAt": "1987-01-06T00:00:00Z", "price": 33, "purchaseAt": "1997-07-17T00:00:00Z", "trialPrice": 66}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '57' \
    --offset '98' \
    --sortBy 'iOkYt9mb' \
    --storeId 'Z6hijQzN' \
    --keyword '1oVyRqa5' \
    --language 'ANitUYB2' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '36' \
    --offset '88' \
    --sortBy 'displayOrder:asc,displayOrder:desc,createdAt' \
    --storeId 'e5btJZtL' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'TWMGL7mT' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bmj3xv21' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'rpd3sakz' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0HlDJq39' \
    --body '{"appId": "ndHVOY6X", "appType": "GAME", "baseAppId": "nHGXt7gz", "boothName": "udxCJXg3", "categoryPath": "aSfHMse9", "clazz": "KzxgaEqK", "displayOrder": 39, "entitlementType": "CONSUMABLE", "ext": {"UnVpY07F": {}, "k582E1yc": {}, "5If8ITO0": {}}, "features": ["JNKLOdOw", "korae7MT", "SyNqubiQ"], "flexible": false, "images": [{"as": "MLea0041", "caption": "J1eRqaR0", "height": 100, "imageUrl": "dxls48m4", "smallImageUrl": "yLCMnvhp", "width": 85}, {"as": "f3jatwMv", "caption": "0x6YccD1", "height": 95, "imageUrl": "1FkiMdNg", "smallImageUrl": "DxfmG1r4", "width": 89}, {"as": "az96cYxK", "caption": "457ZxnYX", "height": 61, "imageUrl": "Z6fbf6Zy", "smallImageUrl": "U3b2F4Tp", "width": 23}], "inventoryConfig": {"customAttributes": {"DwKqvNrg": {}, "iTy03eQg": {}, "5ZX4SYD2": {}}, "serverCustomAttributes": {"QIusndVO": {}, "CQVvF3zQ": {}, "IIU0VavO": {}}, "slotUsed": 74}, "itemIds": ["TCqSDqDT", "X2v34u8i", "INWt57HO"], "itemQty": {"9pCha5IG": 39, "BEEIManU": 89, "EzrnQw9e": 57}, "itemType": "LOOTBOX", "listable": false, "localizations": {"a052bz62": {"description": "4IIUekz3", "localExt": {"YJpI6Ikr": {}, "bJ1hwygp": {}, "j2TN6eFg": {}}, "longDescription": "iICHd047", "title": "Yt04Ajz7"}, "1RJGgQuh": {"description": "CiwUn7Mb", "localExt": {"mEPnPEHk": {}, "SSA0bHPW": {}, "C54B6dMB": {}}, "longDescription": "oEJvIUhZ", "title": "CQQFdmnZ"}, "rqBdEWPk": {"description": "aRpZpFSc", "localExt": {"zBHfVyZM": {}, "aCDDqcML": {}, "93Sjlnz8": {}}, "longDescription": "Xmyee2rg", "title": "EPfpRIF4"}}, "lootBoxConfig": {"rewardCount": 65, "rewards": [{"lootBoxItems": [{"count": 33, "duration": 65, "endDate": "1976-09-20T00:00:00Z", "itemId": "7AIKKb1B", "itemSku": "O5ekHeTq", "itemType": "nVOfvkgK"}, {"count": 18, "duration": 64, "endDate": "1983-03-05T00:00:00Z", "itemId": "aXs8mnge", "itemSku": "JM4WoZ4S", "itemType": "LTHOZaNb"}, {"count": 23, "duration": 59, "endDate": "1991-07-16T00:00:00Z", "itemId": "AUXITelW", "itemSku": "gBFYvtHV", "itemType": "ZE6JQl1k"}], "name": "QKvL2lFc", "odds": 0.28283045787813954, "type": "REWARD_GROUP", "weight": 27}, {"lootBoxItems": [{"count": 66, "duration": 86, "endDate": "1999-04-21T00:00:00Z", "itemId": "RcavdaPR", "itemSku": "4SQcun6x", "itemType": "INFDYGdm"}, {"count": 8, "duration": 89, "endDate": "1986-08-23T00:00:00Z", "itemId": "i4LAwFhx", "itemSku": "3syzV2Wf", "itemType": "f7XtaPeZ"}, {"count": 36, "duration": 30, "endDate": "1972-06-23T00:00:00Z", "itemId": "KdCwyryB", "itemSku": "RuSjDrnF", "itemType": "KgBW507J"}], "name": "YmvAS8oc", "odds": 0.3112110836135429, "type": "REWARD", "weight": 40}, {"lootBoxItems": [{"count": 21, "duration": 15, "endDate": "1976-10-16T00:00:00Z", "itemId": "D7NfDyjc", "itemSku": "rqPCFSBq", "itemType": "Wj6LYxLU"}, {"count": 96, "duration": 72, "endDate": "1974-01-12T00:00:00Z", "itemId": "rRhN2gMc", "itemSku": "S2yNt5KN", "itemType": "wIdLYnsf"}, {"count": 60, "duration": 72, "endDate": "1985-12-17T00:00:00Z", "itemId": "IJvtbNiv", "itemSku": "qhNEq5ox", "itemType": "UXVCRfv9"}], "name": "5ZwW6cUf", "odds": 0.7452216573462564, "type": "REWARD_GROUP", "weight": 48}], "rollFunction": "CUSTOM"}, "maxCount": 47, "maxCountPerUser": 11, "name": "vuHsfcUG", "optionBoxConfig": {"boxItems": [{"count": 81, "duration": 8, "endDate": "1975-08-24T00:00:00Z", "itemId": "lYGneI6O", "itemSku": "KmiZoA4h", "itemType": "vGmD0opM"}, {"count": 27, "duration": 13, "endDate": "1994-05-27T00:00:00Z", "itemId": "Z77CesAR", "itemSku": "fQ6IhRmg", "itemType": "Zt90Aeqs"}, {"count": 60, "duration": 9, "endDate": "1989-11-21T00:00:00Z", "itemId": "8Q3QEH7s", "itemSku": "shlLkGpg", "itemType": "3yhYiUvW"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 6, "fixedTrialCycles": 68, "graceDays": 60}, "regionData": {"GnNg0CJm": [{"currencyCode": "SWyQoOJH", "currencyNamespace": "XWaGdrdh", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1971-04-26T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1990-07-07T00:00:00Z", "expireAt": "1993-06-10T00:00:00Z", "price": 55, "purchaseAt": "1992-05-11T00:00:00Z", "trialPrice": 75}, {"currencyCode": "2LdTyOxS", "currencyNamespace": "nXPBGpTB", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1990-02-16T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1991-05-23T00:00:00Z", "expireAt": "1976-03-04T00:00:00Z", "price": 61, "purchaseAt": "1999-05-13T00:00:00Z", "trialPrice": 77}, {"currencyCode": "CyXanVqZ", "currencyNamespace": "ZNnM8Z8W", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1981-10-12T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1975-09-01T00:00:00Z", "expireAt": "1971-01-17T00:00:00Z", "price": 8, "purchaseAt": "1988-08-06T00:00:00Z", "trialPrice": 24}], "Zh2fs4h3": [{"currencyCode": "yCngG8yc", "currencyNamespace": "mT4yZuWH", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1973-06-01T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1999-02-17T00:00:00Z", "expireAt": "1979-04-03T00:00:00Z", "price": 30, "purchaseAt": "1986-11-24T00:00:00Z", "trialPrice": 16}, {"currencyCode": "sKsZ8vvG", "currencyNamespace": "ittqkdD3", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1972-07-20T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1982-05-24T00:00:00Z", "expireAt": "1999-05-26T00:00:00Z", "price": 63, "purchaseAt": "1974-12-14T00:00:00Z", "trialPrice": 8}, {"currencyCode": "5wt5w8g4", "currencyNamespace": "d7E6PveF", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1982-06-12T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1993-01-16T00:00:00Z", "expireAt": "1980-11-23T00:00:00Z", "price": 43, "purchaseAt": "1991-07-04T00:00:00Z", "trialPrice": 76}], "aqHModac": [{"currencyCode": "imtujoqg", "currencyNamespace": "tAndPYXW", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1992-08-03T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1999-02-19T00:00:00Z", "expireAt": "1971-12-20T00:00:00Z", "price": 21, "purchaseAt": "1994-10-17T00:00:00Z", "trialPrice": 3}, {"currencyCode": "Hfpi4f1x", "currencyNamespace": "bTWjh53C", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1982-02-01T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1982-07-01T00:00:00Z", "expireAt": "1975-10-19T00:00:00Z", "price": 46, "purchaseAt": "1979-12-24T00:00:00Z", "trialPrice": 82}, {"currencyCode": "uyeAFqjc", "currencyNamespace": "lz0U9Z5e", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1998-09-07T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1985-11-22T00:00:00Z", "expireAt": "1983-09-18T00:00:00Z", "price": 99, "purchaseAt": "1976-05-22T00:00:00Z", "trialPrice": 98}]}, "saleConfig": {"currencyCode": "dYvKFKs9", "price": 37}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "pnWTVXqk", "stackable": false, "status": "ACTIVE", "tags": ["CZooCIBH", "2yMvhwJ0", "CpqfLSHG"], "targetCurrencyCode": "MBKTI3sk", "targetNamespace": "50qiNmli", "thumbnailUrl": "CKw0WfLi", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 's4iHzrCF' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,REWARD,CATALOG' \
    --force  \
    --storeId 'ui1K8zrP' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'xSOJWaWC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 27, "orderNo": "xEfs3w8D"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '10Ga2NLl' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '3dCMpy8Y' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'nHBTh2M3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GHIyxcH1' \
    --body '{"carousel": [{"alt": "Kap8hT0p", "previewUrl": "vSdSdNLP", "thumbnailUrl": "MND89qrq", "type": "image", "url": "nzh68BFe", "videoSource": "youtube"}, {"alt": "iuTrx80r", "previewUrl": "WGao7YcN", "thumbnailUrl": "pjVDd2wQ", "type": "image", "url": "JMDKWB9u", "videoSource": "vimeo"}, {"alt": "7WJETy8r", "previewUrl": "y3zOwZpy", "thumbnailUrl": "JkPJaAFK", "type": "image", "url": "B6Ibg71S", "videoSource": "youtube"}], "developer": "GSQv0Tqm", "forumUrl": "dPSfWzhT", "genres": ["Adventure", "Adventure", "Indie"], "localizations": {"aloKdLq1": {"announcement": "ARlq4sh4", "slogan": "PsdWG18g"}, "jOVvl8jV": {"announcement": "2xhpqHfk", "slogan": "2t4218pS"}, "hP3zg0VF": {"announcement": "iwRZVPOJ", "slogan": "0FT1IVdG"}}, "platformRequirements": {"iDZcgo32": [{"additionals": "GqOEjoMd", "directXVersion": "p5Q0gTUp", "diskSpace": "FfGHf065", "graphics": "62Sjn5lw", "label": "somQJGiX", "osVersion": "RMUeF4aq", "processor": "lvx0EJCl", "ram": "VgHTy32D", "soundCard": "1t4wJ4bH"}, {"additionals": "QrMdj94k", "directXVersion": "s1X0eXa9", "diskSpace": "R4k9Z8su", "graphics": "a96vHwHR", "label": "oZwLHqPs", "osVersion": "bYW2n848", "processor": "cCUPR79c", "ram": "B9KxrggC", "soundCard": "A3Pg4WMK"}, {"additionals": "Td5U4wn8", "directXVersion": "H3CTw7t1", "diskSpace": "8jrPWEfD", "graphics": "PNcVEKwl", "label": "l1TUP9Dq", "osVersion": "PWIloMFO", "processor": "iWqx3c84", "ram": "NrNV2SyO", "soundCard": "q6VAXHPu"}], "8kYGKi0I": [{"additionals": "9ffAqBTf", "directXVersion": "9a4AitNe", "diskSpace": "lsDzjsEq", "graphics": "RlTzNVBH", "label": "iBYgZ6Pw", "osVersion": "xvoU9KQx", "processor": "mXauJ4RN", "ram": "LGbpayOX", "soundCard": "FyfVrccd"}, {"additionals": "KKQdBJFe", "directXVersion": "BwwMvl41", "diskSpace": "9c0cTVcp", "graphics": "UEUKzASW", "label": "zuJAPrtr", "osVersion": "CDXmkDPA", "processor": "QB8uScJ8", "ram": "2CLhYxE1", "soundCard": "T5XjU5PG"}, {"additionals": "xPpq1191", "directXVersion": "xeUTYANX", "diskSpace": "7uVyzYvM", "graphics": "JejD7sYW", "label": "TjwFblZ0", "osVersion": "GeLwwWes", "processor": "fp1g1YjK", "ram": "LnPuOt6G", "soundCard": "HzaFcMMo"}], "igr5vtnM": [{"additionals": "CAzTMSsC", "directXVersion": "zEvpl1Ss", "diskSpace": "YuTeeIXy", "graphics": "yG85O0JC", "label": "vAubgduH", "osVersion": "MKVwugbW", "processor": "xLhIbTdW", "ram": "KttYKtNF", "soundCard": "RwMrMNVa"}, {"additionals": "uWjaCqLF", "directXVersion": "QZuNoZXW", "diskSpace": "pGX6ZlWH", "graphics": "5cX6cahU", "label": "sE9n6ZKV", "osVersion": "cUsCqv7C", "processor": "Kusu7Sec", "ram": "D29apTXy", "soundCard": "9Y1WjNsR"}, {"additionals": "9Njfgudj", "directXVersion": "neTdd3uQ", "diskSpace": "vQ40vBrn", "graphics": "ZxixSWFt", "label": "DAuIpMAc", "osVersion": "eSrKSkaf", "processor": "Ra22E1r7", "ram": "ZALvKdsn", "soundCard": "Pji9TEzo"}]}, "platforms": ["IOS", "MacOS", "MacOS"], "players": ["MMO", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "Casual", "publisher": "XHV44lUZ", "releaseDate": "1987-09-26T00:00:00Z", "websiteUrl": "FSimx4bq"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'WOkxnT2W' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dxtvznxr' \
    --body '{"featuresToCheck": ["DLC", "IAP", "ENTITLEMENT"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'ex0jdvvr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'C0ED0wfg' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6gg1sIzn' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'jQAXebNZ' \
    --itemId 'EJTxNa73' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QZ3uj8kM' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'ZZT4PmJN' \
    --itemId '2f69t6Nj' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4bjqyiaK' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'ZLIFexTj' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'b85cr8Ud' \
    --populateBundle  \
    --region 'KHvXdzWE' \
    --storeId 'NWkgCwfC' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'U243AkjL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I8HKXSHP' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 17, "code": "sAvLQLeN", "comparison": "includes", "name": "VC5rsWoH", "predicateType": "StatisticCodePredicate", "value": "4jlSvF4J", "values": ["GgUUc15s", "PyHPknzt", "0kLM8sqp"]}, {"anyOf": 56, "code": "RS5gErdK", "comparison": "isGreaterThanOrEqual", "name": "c8yZSvbQ", "predicateType": "SeasonPassPredicate", "value": "J8NOQ510", "values": ["3bPZQvgM", "XtuEKfuP", "rstWpK4i"]}, {"anyOf": 96, "code": "4mMJ09QL", "comparison": "isLessThan", "name": "rkknit02", "predicateType": "EntitlementPredicate", "value": "4MNU3o8m", "values": ["TybbPsrk", "XnpAfro5", "C5Kxhhas"]}]}, {"operator": "or", "predicates": [{"anyOf": 46, "code": "FeuaO233", "comparison": "isLessThanOrEqual", "name": "G2VrZZmA", "predicateType": "SeasonTierPredicate", "value": "Up8qPzov", "values": ["XBU9Lwbp", "BwGD11zk", "j35cJXV1"]}, {"anyOf": 20, "code": "uvuvaM9b", "comparison": "isGreaterThanOrEqual", "name": "EcW1ewJm", "predicateType": "StatisticCodePredicate", "value": "NhwyUXgn", "values": ["BZ3Q83dh", "w9yAs3nx", "TfZNiFqv"]}, {"anyOf": 3, "code": "FQkMd8bI", "comparison": "isGreaterThan", "name": "FwnHL4j4", "predicateType": "EntitlementPredicate", "value": "orfpwJyF", "values": ["m1SS4umu", "JvfdiJhW", "fjzTyd5c"]}]}, {"operator": "and", "predicates": [{"anyOf": 14, "code": "cjzQGMdf", "comparison": "is", "name": "jUXEj119", "predicateType": "EntitlementPredicate", "value": "cCc13Nvb", "values": ["xLml9LNm", "zbI7pXiD", "bapuLNVf"]}, {"anyOf": 2, "code": "5VmJ08J0", "comparison": "isGreaterThan", "name": "SnTC2mXB", "predicateType": "SeasonTierPredicate", "value": "Gh5Hk2NV", "values": ["5GYgVRgw", "3iHLqOrk", "RXaJvok2"]}, {"anyOf": 69, "code": "uumSOoDI", "comparison": "isLessThan", "name": "AOTfdccR", "predicateType": "StatisticCodePredicate", "value": "Si3aorJr", "values": ["b2Ba2utV", "KEOhPu1q", "2cnMMg6Y"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'gUJ7RZJj' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'IAP,ENTITLEMENT,CATALOG' \
    --storeId 'NDpF5y70' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'ol1H9PDu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Fe6opcHz"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --name 'Ei2HLWMn' \
    --offset '98' \
    --tag 'jog3Oif9' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8sgc3stN", "name": "LqZ6GEYC", "status": "ACTIVE", "tags": ["Z8JklVV0", "kezhHOQf", "rAr9QNSb"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '4ImzBaVx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'JNfUxj1s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "KL8AJMpi", "name": "llv9RSC0", "status": "ACTIVE", "tags": ["Ijg9homJ", "34SrgTls", "evAsY5bJ"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '8IuM6Y4j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'GMwFvInf' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '31' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '1dgCyHCA' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ZsEUtOgh' \
    --limit '56' \
    --offset '38' \
    --orderNos 'bUu6sndy,gfaz7Vo5,W27xMv2Q' \
    --sortBy '8oTKdDYz' \
    --startTime 'WYdnSDup' \
    --status 'CLOSED' \
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
    --orderNo 'H3txx8YB' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8E5MYXc6' \
    --body '{"description": "3ktejVtw"}' \
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
    --body '{"domains": ["eq7SBGKN", "loFhgYGN", "WkPa1WKT"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'BJXwwGMl' \
    --externalId '21DwfKLL' \
    --limit '44' \
    --notificationSource 'PAYPAL' \
    --notificationType 'ToOFyYQO' \
    --offset '14' \
    --paymentOrderNo 'dYiS3fza' \
    --startDate 'xt9jHqBX' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'dbXJFfRK' \
    --limit '72' \
    --offset '47' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "OMdc2b0W", "currencyNamespace": "MJVuuo7F", "customParameters": {"KE7XB4rn": {}, "g4vZBYFf": {}, "Y6JN3uiE": {}}, "description": "8SZuJvop", "extOrderNo": "ULP85NV3", "extUserId": "nHNo1zjp", "itemType": "MEDIA", "language": "SFy", "metadata": {"VnZvDqmj": "DxUskKBR", "duA7uMuY": "bxQJCjNv", "NDChThxo": "WqMOSfZl"}, "notifyUrl": "13HuYUCn", "omitNotification": false, "platform": "spmYqdFr", "price": 69, "recurringPaymentOrderNo": "CeCHqDn4", "region": "MY9a6Ufo", "returnUrl": "CiD5itvU", "sandbox": false, "sku": "MAixnVnP", "subscriptionId": "Lt36LdHR", "targetNamespace": "EwqjvreS", "targetUserId": "6nwtFUe8", "title": "IhfZMad2"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'I78RrySC' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Oacbbpkb' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MF19yEjt' \
    --body '{"extTxId": "jLUIxCe7", "paymentMethod": "Bbutx2xL", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TFNdpQyf' \
    --body '{"description": "Rx3ko1FG"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nr0W7sQS' \
    --body '{"amount": 48, "currencyCode": "LRy8sReu", "notifyType": "REFUND", "paymentProvider": "XSOLLA", "salesTax": 72, "vat": 67}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'otJPa6vr' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'rSg6H9A0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "5JlfZYik", "serviceLabel": 64}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'ma21NwvE' \
    --body '{"delegationToken": "i6Dln6o5", "sandboxId": "YZs1WsRc"}' \
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
    --platform 'Epic' \
    --body '{"allowedPlatformOrigins": ["Epic", "Nintendo", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["Xbox", "Nintendo", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
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
    --endTime 'P533PXG4' \
    --limit '22' \
    --offset '81' \
    --source 'IAP' \
    --startTime 'ZT1F31Cg' \
    --status 'FAIL' \
    --transactionId 'Mh0JpFsA' \
    --userId 'tduNuWmM' \
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
    --body '{"appConfig": {"appName": "NbPWJo95"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "pBn1tUaA"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "kD6hJEkJ", "eventTopic": "1IzPm47w", "maxAwarded": 67, "maxAwardedPerUser": 90, "namespaceExpression": "QWIB1cVc", "rewardCode": "5pamEKRs", "rewardConditions": [{"condition": "xBKtY2NR", "conditionName": "BfKmgmtB", "eventName": "w9Xcy9oc", "rewardItems": [{"duration": 29, "endDate": "1980-02-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "hJr2fu3E", "quantity": 31, "sku": "aOzjrQ6a"}, {"duration": 21, "endDate": "1972-04-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "t3EVx102", "quantity": 52, "sku": "zdnbQmxU"}, {"duration": 52, "endDate": "1974-05-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "iqXLezVv", "quantity": 13, "sku": "uRfHS37w"}]}, {"condition": "nJQRKqux", "conditionName": "OnSljx01", "eventName": "nBiFv6rS", "rewardItems": [{"duration": 76, "endDate": "1982-07-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "G0603biU", "quantity": 66, "sku": "gboZEFWc"}, {"duration": 62, "endDate": "1984-03-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "lO7jFW8P", "quantity": 98, "sku": "1SwC5890"}, {"duration": 5, "endDate": "1977-10-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KeKfGU2a", "quantity": 0, "sku": "GEhlrYIB"}]}, {"condition": "Q1uKgAeR", "conditionName": "ImyMOrzA", "eventName": "H8qlM0Ky", "rewardItems": [{"duration": 25, "endDate": "1997-10-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Jmd7bfLe", "quantity": 77, "sku": "h5Ahx7SY"}, {"duration": 40, "endDate": "1984-09-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Sb3bAqY6", "quantity": 39, "sku": "XhKeow4p"}, {"duration": 92, "endDate": "1972-11-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "UqWbQiL7", "quantity": 21, "sku": "yuQV9FHi"}]}], "userIdExpression": "79ag7xHg"}' \
    > test.out 2>&1
eval_tap $? 197 'CreateReward' test.out

#- 198 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'q9AVe914' \
    --limit '11' \
    --offset '70' \
    --sortBy 'namespace:asc,rewardCode:asc,namespace:desc' \
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
    --rewardId 'lKQhsxmI' \
    > test.out 2>&1
eval_tap $? 201 'GetReward' test.out

#- 202 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'q14FdMiz' \
    --body '{"description": "9tlWYQYG", "eventTopic": "3ib6jtq3", "maxAwarded": 18, "maxAwardedPerUser": 42, "namespaceExpression": "J2y4Taz0", "rewardCode": "NvxarCZQ", "rewardConditions": [{"condition": "4vkhmrAD", "conditionName": "qqbcbL0A", "eventName": "kbdNkJHO", "rewardItems": [{"duration": 87, "endDate": "1987-06-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HPWepB4I", "quantity": 100, "sku": "bXakXQ8i"}, {"duration": 56, "endDate": "1978-03-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "wfBJ35Zz", "quantity": 9, "sku": "dt6Ravb7"}, {"duration": 13, "endDate": "1998-12-17T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CzB7j11j", "quantity": 17, "sku": "xOsXon8Y"}]}, {"condition": "cHLUpURx", "conditionName": "ciQqDjm6", "eventName": "vaAajGX4", "rewardItems": [{"duration": 60, "endDate": "1972-04-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ll3kfnH6", "quantity": 85, "sku": "eAuf2yST"}, {"duration": 83, "endDate": "1974-01-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1Nbh7qwc", "quantity": 16, "sku": "x2dbg9tx"}, {"duration": 35, "endDate": "1976-12-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "gFlB4LMu", "quantity": 89, "sku": "5GrfFR1p"}]}, {"condition": "OoiI37ok", "conditionName": "iYh1bO66", "eventName": "NWzLJMwi", "rewardItems": [{"duration": 77, "endDate": "1974-03-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7bHX1ciE", "quantity": 55, "sku": "oBs4F3W0"}, {"duration": 72, "endDate": "1987-01-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZeC8q8Xa", "quantity": 44, "sku": "GJvGtLF2"}, {"duration": 68, "endDate": "1994-03-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "VWItj6fc", "quantity": 98, "sku": "j33zKBlH"}]}], "userIdExpression": "1VsOAecw"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateReward' test.out

#- 203 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jJIKW9q5' \
    > test.out 2>&1
eval_tap $? 203 'DeleteReward' test.out

#- 204 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'KNFZD3dH' \
    --body '{"payload": {"Eo9CbcRm": {}, "8uB403VR": {}, "KGqvxS4P": {}}}' \
    > test.out 2>&1
eval_tap $? 204 'CheckEventCondition' test.out

#- 205 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ROxANzuC' \
    --body '{"conditionName": "DPAwj4nx", "userId": "l92vSpJE"}' \
    > test.out 2>&1
eval_tap $? 205 'DeleteRewardConditionRecord' test.out

#- 206 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'X8WdxHwm' \
    --limit '26' \
    --offset '64' \
    --start 'SGS451p1' \
    --storeId 'zfec4LZw' \
    --viewId 'YuODseQy' \
    > test.out 2>&1
eval_tap $? 206 'QuerySections' test.out

#- 207 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BsWdCzld' \
    --body '{"active": true, "displayOrder": 76, "endDate": "1982-07-11T00:00:00Z", "ext": {"1SWc7Z9P": {}, "qDjnLglF": {}, "L2lges4E": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 18, "itemCount": 5, "rule": "SEQUENCE"}, "items": [{"id": "0fSTPS68", "sku": "MgcIQawH"}, {"id": "JGDJGpQP", "sku": "mrj3Y9PR"}, {"id": "EHxS8CW7", "sku": "jEi5HEfr"}], "localizations": {"RsGqlnmH": {"description": "ZUIUgXST", "localExt": {"W3qQ0oJW": {}, "oKYgWrdR": {}, "F72UyBK5": {}}, "longDescription": "oUnVUyIo", "title": "uaYPEtlI"}, "dUclwJmU": {"description": "rYToQLLS", "localExt": {"uyUVcN5T": {}, "jDfNJ5n4": {}, "xqcSXJ8l": {}}, "longDescription": "SVCMa0hW", "title": "rUkZO6Jw"}, "MIMBoiOf": {"description": "XgguRsqH", "localExt": {"EFzHWc7Y": {}, "YAJRTxYt": {}, "veSIBX9a": {}}, "longDescription": "vtlXMN3c", "title": "7bvbAmai"}}, "name": "9sSjERYu", "rotationType": "CUSTOM", "startDate": "1984-08-01T00:00:00Z", "viewId": "K9LNjF0Y"}' \
    > test.out 2>&1
eval_tap $? 207 'CreateSection' test.out

#- 208 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TnwhvMT7' \
    > test.out 2>&1
eval_tap $? 208 'PurgeExpiredSection' test.out

#- 209 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'DcYUFl2K' \
    --storeId 'OCuuG2Od' \
    > test.out 2>&1
eval_tap $? 209 'GetSection' test.out

#- 210 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'kzmb3DnL' \
    --storeId 'BzPa20TL' \
    --body '{"active": true, "displayOrder": 50, "endDate": "1991-11-19T00:00:00Z", "ext": {"hzK7mgIY": {}, "dZOVqxhz": {}, "3Z2Kx262": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 56, "itemCount": 42, "rule": "SEQUENCE"}, "items": [{"id": "O65a4nrf", "sku": "PzZmLjnS"}, {"id": "5ylT1vdS", "sku": "0kgrd4EG"}, {"id": "cqghJ7tU", "sku": "HLn8CwFo"}], "localizations": {"qBh7v9Gl": {"description": "I7TwFEoB", "localExt": {"3AypfWxm": {}, "veFCumlo": {}, "NhZF8SkP": {}}, "longDescription": "QehotY2c", "title": "uRyxM4eD"}, "Ci2o0cBz": {"description": "5W3v8fQE", "localExt": {"vqHByX44": {}, "tJcsC6dA": {}, "MsiUTNpC": {}}, "longDescription": "i6M9GJkZ", "title": "XWk6DZa3"}, "DDWSWjQq": {"description": "YjPrCiYd", "localExt": {"dWkOQXtw": {}, "BzYwyYt0": {}, "8elFEXtp": {}}, "longDescription": "6nAeAJJT", "title": "5ZoAN6i0"}}, "name": "U1SeKmbi", "rotationType": "CUSTOM", "startDate": "1985-09-21T00:00:00Z", "viewId": "sg9txN0r"}' \
    > test.out 2>&1
eval_tap $? 210 'UpdateSection' test.out

#- 211 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'H5C8jn3t' \
    --storeId 'HMVlueqI' \
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
    --body '{"defaultLanguage": "6of0v0vS", "defaultRegion": "xhpqDelv", "description": "snue2gdn", "supportedLanguages": ["yGSYakon", "h6cJo4yd", "W7ofqq2j"], "supportedRegions": ["d9fCzAov", "l2ZaPRNI", "vyE8tWEh"], "title": "YZpjniPN"}' \
    > test.out 2>&1
eval_tap $? 213 'CreateStore' test.out

#- 214 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'VIEW' \
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
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["9OgW9UrJ", "4Iol2goc", "IPURevON"], "idsToBeExported": ["KaCaLunI", "o4K9RO6G", "o4OqpQyZ"], "storeId": "ZtqTtyfe"}' \
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
    --storeId 'SxQyC8QR' \
    > test.out 2>&1
eval_tap $? 222 'GetStore' test.out

#- 223 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '5lNnK7iE' \
    --body '{"defaultLanguage": "6HbfZB20", "defaultRegion": "on3L2Yaz", "description": "uA05GSWn", "supportedLanguages": ["IRLajMjB", "uROmFOP8", "qgA2f0mi"], "supportedRegions": ["xjC8M6ZG", "CsQ8sAgG", "dL5BXs2w"], "title": "dOJrc5HM"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateStore' test.out

#- 224 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '69Rt87ot' \
    > test.out 2>&1
eval_tap $? 224 'DeleteStore' test.out

#- 225 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uNo2wJMt' \
    --action 'CREATE' \
    --itemSku 'hnxVO8gl' \
    --itemType 'COINS' \
    --limit '59' \
    --offset '23' \
    --selected  \
    --sortBy 'updatedAt,createdAt:asc,createdAt' \
    --status 'PUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'LtkWMDpS' \
    --updatedAtStart 'PH2PnoyM' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 225 'QueryChanges' test.out

#- 226 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w2yOsT96' \
    > test.out 2>&1
eval_tap $? 226 'PublishAll' test.out

#- 227 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Af68DULV' \
    > test.out 2>&1
eval_tap $? 227 'PublishSelected' test.out

#- 228 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NcWz6b5y' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecords' test.out

#- 229 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '1CsumtgO' \
    --action 'UPDATE' \
    --itemSku 'zWBQH6aH' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd '4kpxwPYS' \
    --updatedAtStart 'qkVv1dUP' \
    > test.out 2>&1
eval_tap $? 229 'SelectAllRecordsByCriteria' test.out

#- 230 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KFxwUPfz' \
    --action 'CREATE' \
    --itemSku 'wLgSWhVa' \
    --itemType 'SUBSCRIPTION' \
    --type 'CATEGORY' \
    --updatedAtEnd 'rD0Dbt4K' \
    --updatedAtStart 'A7g2mXNQ' \
    > test.out 2>&1
eval_tap $? 230 'GetStatistic' test.out

#- 231 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Uyw78syB' \
    > test.out 2>&1
eval_tap $? 231 'UnselectAllRecords' test.out

#- 232 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '0WEHbt0Q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DpfFQgLx' \
    > test.out 2>&1
eval_tap $? 232 'SelectRecord' test.out

#- 233 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '48eQfKOn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CpeIuHHL' \
    > test.out 2>&1
eval_tap $? 233 'UnselectRecord' test.out

#- 234 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '2nTHz4k9' \
    --targetStoreId 'qhLPAfaj' \
    > test.out 2>&1
eval_tap $? 234 'CloneStore' test.out

#- 235 ExportStore
eval_tap 0 235 'ExportStore # SKIP deprecated' test.out

#- 236 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'k1G8Dn6o' \
    --end 'GZ0nGach' \
    --limit '86' \
    --offset '24' \
    --sortBy 'KAeQJlPY' \
    --start 'LmFoHCBU' \
    --success  \
    > test.out 2>&1
eval_tap $? 236 'QueryImportHistory' test.out

#- 237 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZdtOqKyN' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '5WSe0CvK' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 237 'ImportStoreByCSV' test.out

#- 238 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'AmIPGQ7K' \
    --limit '99' \
    --offset '32' \
    --sku 'g45vSk7u' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'RbYxVqGS' \
    > test.out 2>&1
eval_tap $? 238 'QuerySubscriptions' test.out

#- 239 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2ZHBYmdW' \
    > test.out 2>&1
eval_tap $? 239 'RecurringChargeSubscription' test.out

#- 240 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'ujtTFrTH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'GetTicketDynamic' test.out

#- 241 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '423ttucA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "TcjpTYHk"}' \
    > test.out 2>&1
eval_tap $? 241 'DecreaseTicketSale' test.out

#- 242 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'IE1Y19lq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'GetTicketBoothID' test.out

#- 243 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '7dfw8PiA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 79, "orderNo": "vZKVFy2G"}' \
    > test.out 2>&1
eval_tap $? 243 'IncreaseTicketSale' test.out

#- 244 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 1, "currencyCode": "Wrf7rWfk", "expireAt": "1981-10-18T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "WqdAaVzo", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "DygjHvb6", "entitlementOrigin": "Other", "itemIdentity": "p3Fpy1JA", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "XO7Ii6bs"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 61, "currencyCode": "WmPMh0jd", "expireAt": "1995-06-28T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "oeLvrX92", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 54, "entitlementCollectionId": "p9ZVRr7O", "entitlementOrigin": "System", "itemIdentity": "hwdKr5lg", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 72, "entitlementId": "4EOy1kKO"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "System", "count": 73, "currencyCode": "wLQzyG3s", "expireAt": "1992-05-15T00:00:00Z"}, "debitPayload": {"count": 75, "currencyCode": "c1xmyqKi", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 93, "entitlementCollectionId": "b0WclQPp", "entitlementOrigin": "Oculus", "itemIdentity": "BmTexB6a", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 63, "entitlementId": "aH2jTQdN"}, "type": "FULFILL_ITEM"}], "userId": "UbGtDfLv"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 56, "currencyCode": "xjFSukxf", "expireAt": "1989-10-18T00:00:00Z"}, "debitPayload": {"count": 57, "currencyCode": "l3WqbINJ", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "iqw5LQJK", "entitlementOrigin": "IOS", "itemIdentity": "hQ3w7SuA", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "RwRsDSBN"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 70, "currencyCode": "5zK95mFa", "expireAt": "1999-10-24T00:00:00Z"}, "debitPayload": {"count": 52, "currencyCode": "pKHg4DWj", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 58, "entitlementCollectionId": "M0CKgwrT", "entitlementOrigin": "Steam", "itemIdentity": "onMKWred", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "LnMI0FYE"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 12, "currencyCode": "2Om7uUiU", "expireAt": "1993-12-16T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "GrW3Z8pv", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 79, "entitlementCollectionId": "ou081jUU", "entitlementOrigin": "Other", "itemIdentity": "npgqyxHq", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "ka9su0bX"}, "type": "DEBIT_WALLET"}], "userId": "wBeX7hna"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 27, "currencyCode": "lJWwod4b", "expireAt": "1978-04-22T00:00:00Z"}, "debitPayload": {"count": 18, "currencyCode": "Cbx7ffe2", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 60, "entitlementCollectionId": "zOuKelX4", "entitlementOrigin": "Steam", "itemIdentity": "TvH8vZXx", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "1CBJ4hQ7"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 23, "currencyCode": "DOIWDMlt", "expireAt": "1987-03-28T00:00:00Z"}, "debitPayload": {"count": 25, "currencyCode": "bI8wAuyu", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 31, "entitlementCollectionId": "qs1GsaWe", "entitlementOrigin": "Xbox", "itemIdentity": "C1eVfhRD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 71, "entitlementId": "7ToTTbF4"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 50, "currencyCode": "5WxBAlSa", "expireAt": "1981-03-14T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "z86G2Zv4", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 95, "entitlementCollectionId": "ECjlFrJM", "entitlementOrigin": "IOS", "itemIdentity": "jIPUYSe1", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "AzqOtd3j"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "GXpzGzM3"}], "metadata": {"b0QCz1e6": {}, "yJQ7AQNp": {}, "ODZyDGlb": {}}, "needPreCheck": false, "transactionId": "mNlPkb8s", "type": "JthqspD8"}' \
    > test.out 2>&1
eval_tap $? 244 'Commit' test.out

#- 245 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '70' \
    --status 'INIT' \
    --type 'vfKlGmIH' \
    --userId 'cJcUR56O' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByCriteria' test.out

#- 246 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'AAMM2uCK' \
    > test.out 2>&1
eval_tap $? 246 'GetTradeHistoryByTransactionId' test.out

#- 247 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '2a9PWK9q' \
    --body '{"achievements": [{"id": "WGqyhdiP", "value": 77}, {"id": "h4fbhi3J", "value": 75}, {"id": "Z12sXelQ", "value": 31}], "steamUserId": "rXC1W4yW"}' \
    > test.out 2>&1
eval_tap $? 247 'UnlockSteamUserAchievement' test.out

#- 248 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BshOzVSG' \
    --xboxUserId 'g4A6Q5zK' \
    > test.out 2>&1
eval_tap $? 248 'GetXblUserAchievements' test.out

#- 249 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBNlVaYo' \
    --body '{"achievements": [{"id": "wgWzgZPg", "percentComplete": 91}, {"id": "2ceDbc78", "percentComplete": 42}, {"id": "bmbpYnxe", "percentComplete": 86}], "serviceConfigId": "M2cV0sSR", "titleId": "1pbWrEGg", "xboxUserId": "yrcwcmkG"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateXblUserAchievement' test.out

#- 250 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Smab7cVz' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeCampaign' test.out

#- 251 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gbeb7cvg' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeEntitlement' test.out

#- 252 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNZXumKS' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeFulfillment' test.out

#- 253 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'ftkrFdEn' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeIntegration' test.out

#- 254 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'nnqkYXVG' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizeOrder' test.out

#- 255 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'JDScHuTO' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizePayment' test.out

#- 256 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8pjqq9l' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeRevocation' test.out

#- 257 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHkZKbds' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeSubscription' test.out

#- 258 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFGHlcof' \
    > test.out 2>&1
eval_tap $? 258 'AnonymizeWallet' test.out

#- 259 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'wXf0Udmf' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLCByPlatform' test.out

#- 260 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2i7YeDc' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 260 'GetUserDLC' test.out

#- 261 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0iEZhrn' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'COnAe2DP' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '5fcHqx8O' \
    --features 'AAdq7bPF,Hu2JorNW,Timag72t' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'YJB5RZ24,0BkBQ8Vd,SSomWjbj' \
    --limit '24' \
    --offset '22' \
    --origin 'Playstation' \
    > test.out 2>&1
eval_tap $? 261 'QueryUserEntitlements' test.out

#- 262 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cXFVhexr' \
    --body '[{"collectionId": "5JLRyN3X", "endDate": "1972-03-04T00:00:00Z", "grantedCode": "pZomWuOI", "itemId": "WIGVgWlO", "itemNamespace": "aSGAjHkB", "language": "IK_OG", "metadata": {"J7FplkTw": {}, "1X3z6HtB": {}, "o5taaPx9": {}}, "origin": "Xbox", "quantity": 19, "region": "ONAUuaus", "source": "REWARD", "startDate": "1997-06-11T00:00:00Z", "storeId": "9lQwRzTW"}, {"collectionId": "GvNr07J9", "endDate": "1978-07-02T00:00:00Z", "grantedCode": "2HUKr2o5", "itemId": "QUBoiJpi", "itemNamespace": "mQ9bjZCB", "language": "ZTNG", "metadata": {"ep5UaOAa": {}, "kA3ri5D3": {}, "JrVRRzbW": {}}, "origin": "Other", "quantity": 41, "region": "SqgXTMe7", "source": "GIFT", "startDate": "1986-08-09T00:00:00Z", "storeId": "3L6u7AOL"}, {"collectionId": "VSiHltIS", "endDate": "1979-03-11T00:00:00Z", "grantedCode": "k9L3Kk2B", "itemId": "KjK2Kkgf", "itemNamespace": "EpT0tuXD", "language": "Yv-rBzI", "metadata": {"qdkZIxHD": {}, "RFJsD4Fd": {}, "pjcrOvlZ": {}}, "origin": "Nintendo", "quantity": 91, "region": "1FXhfhxU", "source": "REDEEM_CODE", "startDate": "1993-07-10T00:00:00Z", "storeId": "VaispYdj"}]' \
    > test.out 2>&1
eval_tap $? 262 'GrantUserEntitlement' test.out

#- 263 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '8jJKrgbA' \
    --activeOnly  \
    --appId '6KSVaFsu' \
    > test.out 2>&1
eval_tap $? 263 'GetUserAppEntitlementByAppId' test.out

#- 264 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSmuXcBG' \
    --activeOnly  \
    --limit '66' \
    --offset '84' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 264 'QueryUserEntitlementsByAppType' test.out

#- 265 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'arxqKg7U' \
    --ids 'KKM9MrCv,aWzbIGRo,oqLSKYjc' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementsByIds' test.out

#- 266 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKyiJiUr' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'zlzUmGgI' \
    --itemId 'rs5GLyUI' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementByItemId' test.out

#- 267 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'rWiV4hbN' \
    --ids 'vqTIPqEE,jzkGvUB8,pJUMJjtC' \
    --platform '0ecJ4KrD' \
    > test.out 2>&1
eval_tap $? 267 'GetUserActiveEntitlementsByItemIds' test.out

#- 268 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '7d0qbiaj' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'YrsssJZU' \
    --sku '6q43pXr2' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlementBySku' test.out

#- 269 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '56N1N24A' \
    --appIds 'WjNkh3Gd,RvQTFYhq,qsNFstr0' \
    --itemIds '4ZQUHOBk,ZQV88oUR,Ua8f9yba' \
    --platform '47j987MC' \
    --skus '1ki2O29O,mG2kBLXr,A6niLIQc' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlement' test.out

#- 270 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TWIo6Lmz' \
    --platform '2JgXVPFv' \
    --itemIds 'dVgkzNZk,XY2dQ0TD,j1YXqvVk' \
    > test.out 2>&1
eval_tap $? 270 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 271 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7eMSs3c' \
    --appId 'w6dTGwo0' \
    > test.out 2>&1
eval_tap $? 271 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 272 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3YVhvCNq' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'FwPOPxmm' \
    --itemId '6KOAWPRU' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemId' test.out

#- 273 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAag8wOk' \
    --ids 'Zzlyrfqr,m8WZW4Wg,mq8pKxbh' \
    --platform 'X7CvDqgT' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipByItemIds' test.out

#- 274 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTt2IZSi' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'WmO0D2Zs' \
    --sku '2pMI4Lct' \
    > test.out 2>&1
eval_tap $? 274 'GetUserEntitlementOwnershipBySku' test.out

#- 275 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'pA2JeN8d' \
    > test.out 2>&1
eval_tap $? 275 'RevokeAllEntitlements' test.out

#- 276 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OlwzfQ9t' \
    --entitlementIds 'qcFQsXrK' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlements' test.out

#- 277 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'oqdsB6os' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ho0SAR3X' \
    > test.out 2>&1
eval_tap $? 277 'GetUserEntitlement' test.out

#- 278 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'Aj5Vfrf4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J5C0V6fY' \
    --body '{"collectionId": "x6TpumFL", "endDate": "1980-04-10T00:00:00Z", "nullFieldList": ["xYaElqwj", "R9owSQMx", "2EUEhdt0"], "origin": "Xbox", "reason": "xaLJCG2w", "startDate": "1975-12-07T00:00:00Z", "status": "SOLD", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 278 'UpdateUserEntitlement' test.out

#- 279 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'ymZhARFw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SYzQWNJp' \
    --body '{"metadata": {"okkljWLW": {}, "FyZXFCEK": {}, "QOhXMaV7": {}}, "options": ["BXJpPclL", "uA1UtkQh", "S0XckgpC"], "platform": "WngHdt7q", "requestId": "v4hzIynU", "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 279 'ConsumeUserEntitlement' test.out

#- 280 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'UdNoEry6' \
    --namespace "$AB_NAMESPACE" \
    --userId '7PAL3Nbp' \
    > test.out 2>&1
eval_tap $? 280 'DisableUserEntitlement' test.out

#- 281 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'T0rPIodS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDbZ0RHC' \
    > test.out 2>&1
eval_tap $? 281 'EnableUserEntitlement' test.out

#- 282 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Z2VCxCqx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8dbNYQr' \
    > test.out 2>&1
eval_tap $? 282 'GetUserEntitlementHistories' test.out

#- 283 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'a5B3lNQ5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkPvmPjB' \
    --body '{"metadata": {"1I6toMSP": {}, "SGTRHdxg": {}, "PgVxD16B": {}}}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlement' test.out

#- 284 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'UGtQeL2h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y8RgNukK' \
    --body '{"reason": "pHeZBb6N", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 284 'RevokeUserEntitlementByUseCount' test.out

#- 285 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'wWFX7NXH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOcUPGgg' \
    --quantity '81' \
    > test.out 2>&1
eval_tap $? 285 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 286 RevokeUseCount
eval_tap 0 286 'RevokeUseCount # SKIP deprecated' test.out

#- 287 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'wjntinvQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UmI1tu2u' \
    --body '{"platform": "1mveBXyY", "requestId": "rZhVmMGw", "useCount": 68}' \
    > test.out 2>&1
eval_tap $? 287 'SellUserEntitlement' test.out

#- 288 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ImUTsFfw' \
    --body '{"duration": 96, "endDate": "1978-09-04T00:00:00Z", "entitlementCollectionId": "16pzlSG6", "entitlementOrigin": "Xbox", "itemId": "Xm6hTtt2", "itemSku": "HilF7dDR", "language": "NeKS8jlK", "metadata": {"7ChDpDfG": {}, "zbBu4xuM": {}, "jaml79HJ": {}}, "order": {"currency": {"currencyCode": "aoLWnaf9", "currencySymbol": "xVdslrNo", "currencyType": "REAL", "decimals": 37, "namespace": "h80tsXXM"}, "ext": {"S4kfCm7N": {}, "4qJWpNat": {}, "otZrCACh": {}}, "free": false}, "orderNo": "p44Xn98e", "origin": "Other", "overrideBundleItemQty": {"PmrZfs0Q": 19, "8lnaC5ZZ": 1, "HWySgWZA": 10}, "quantity": 45, "region": "ZpmewWBz", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1989-12-06T00:00:00Z", "storeId": "khxY0l69"}' \
    > test.out 2>&1
eval_tap $? 288 'FulfillItem' test.out

#- 289 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '9n12tKkI' \
    --body '{"code": "LbaEIr0Q", "language": "oRo", "region": "PMgFcBo0"}' \
    > test.out 2>&1
eval_tap $? 289 'RedeemCode' test.out

#- 290 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6ZIakBsP' \
    --body '{"itemId": "P0FBVsL0", "itemSku": "lPNIFcZZ", "quantity": 86}' \
    > test.out 2>&1
eval_tap $? 290 'PreCheckFulfillItem' test.out

#- 291 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lW9BweTu' \
    --body '{"entitlementCollectionId": "J8gTk8PO", "entitlementOrigin": "Oculus", "metadata": {"um9fST9X": {}, "rfK6Vv6v": {}, "mZyVthWX": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "CNzUzOTE", "namespace": "Cc1vq89N"}, "item": {"itemId": "iDY6j8hW", "itemName": "KigiPpe9", "itemSku": "Utav1wC6", "itemType": "57gHjPgJ"}, "quantity": 10, "type": "CURRENCY"}, {"currency": {"currencyCode": "DeGV7B2k", "namespace": "x4R7Vf6D"}, "item": {"itemId": "jVBjjYtS", "itemName": "ZDFco5zA", "itemSku": "fmrCMg8m", "itemType": "tqggJPuB"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"currencyCode": "dTyEBZ5P", "namespace": "PEy4mJV4"}, "item": {"itemId": "YNelwEl1", "itemName": "KjRiSnwG", "itemSku": "MYgK9gGB", "itemType": "wl9pooh2"}, "quantity": 43, "type": "CURRENCY"}], "source": "EXPIRATION", "transactionId": "MGM8sOfX"}' \
    > test.out 2>&1
eval_tap $? 291 'FulfillRewards' test.out

#- 292 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xbyjtQVX' \
    --endTime 'TQmPUqAB' \
    --limit '62' \
    --offset '54' \
    --productId 'Eq2KyZrp' \
    --startTime '30LCYxFl' \
    --status 'FULFILLED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserIAPOrders' test.out

#- 293 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mUiCdPv8' \
    > test.out 2>&1
eval_tap $? 293 'QueryAllUserIAPOrders' test.out

#- 294 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '32aDrnxD' \
    --endTime 'M5LqXVgJ' \
    --limit '35' \
    --offset '12' \
    --startTime 'u3mvyXMN' \
    --status 'PENDING' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 294 'QueryUserIAPConsumeHistory' test.out

#- 295 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6f6o3JjJ' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Oi_OnZo", "productId": "UH28Gy2Y", "region": "VEGzpR8D", "transactionId": "YdEBHEND", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 295 'MockFulfillIAPItem' test.out

#- 296 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7N8jwgF' \
    --body '{"skus": ["NJ1SlMg2", "PTH2ryAB", "LrURwzx5"]}' \
    > test.out 2>&1
eval_tap $? 296 'AdminSyncOculusSubscriptions' test.out

#- 297 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo '2yZrumr0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TrwoZbyE' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetIAPOrderLineItems' test.out

#- 298 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ae4qZiJV' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamAbnormalTransaction' test.out

#- 299 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'TSlfNa6J' \
    --body '{"orderId": "Fzn61urb"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminSyncSteamIAPByTransaction' test.out

#- 300 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2jizzMy' \
    --activeOnly  \
    --groupId 'mKOh7CfE' \
    --limit '29' \
    --offset '90' \
    --platform 'PLAYSTATION' \
    --productId 'ZCF6utS3' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserThirdPartySubscription' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'IuTx4IBQ' \
    --groupId 'Z7BGneot' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 302 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId '4z1fjqeJ' \
    --productId 'MYadKCZc' \
    > test.out 2>&1
eval_tap $? 302 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 303 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vBI4E5U7' \
    --activeOnly  \
    --groupId 'LvambOd6' \
    --limit '78' \
    --offset '61' \
    --platform 'TWITCH' \
    --productId 'ntwQUBIt' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 304 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'bh87g8fp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYb2NHNX' \
    > test.out 2>&1
eval_tap $? 304 'GetThirdPartySubscriptionDetails' test.out

#- 305 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'hMur2KsR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HlYj8DnE' \
    --limit '25' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 305 'GetSubscriptionHistory' test.out

#- 306 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'leol3ok2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KC5yBWCS' \
    > test.out 2>&1
eval_tap $? 306 'SyncSubscriptionTransaction' test.out

#- 307 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'dhULw3KW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ipzxkbik' \
    > test.out 2>&1
eval_tap $? 307 'GetThirdPartyUserSubscriptionDetails' test.out

#- 308 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'elnbFujn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZqwSfj7' \
    > test.out 2>&1
eval_tap $? 308 'SyncSubscription' test.out

#- 309 AdminSyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform adminSyncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sc5jWy6g' \
    --body '{"gameId": "hrdT5rF4", "language": "KVys-Mz", "region": "Y4BVHQzU"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminSyncTwitchDropsEntitlement' test.out

#- 310 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '2s40Pgpb' \
    --discounted  \
    --itemId 'XklgoRnE' \
    --limit '94' \
    --offset '52' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 310 'QueryUserOrders' test.out

#- 311 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'e9Z958AE' \
    --body '{"currencyCode": "DxP6IAv6", "currencyNamespace": "UjaHXNdf", "discountCodes": ["48wjIen4", "oZkv1OXV", "EIPa8JMa"], "discountedPrice": 94, "entitlementPlatform": "Xbox", "ext": {"GMMunzV6": {}, "MqUbnuFM": {}, "LB41lmX8": {}}, "itemId": "T85JddsR", "language": "Tott90Ra", "options": {"skipPriceValidation": false}, "platform": "Steam", "price": 58, "quantity": 61, "region": "UFwVJ9q7", "returnUrl": "k3WB2EMh", "sandbox": true, "sectionId": "DGy2nDXP"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminCreateUserOrder' test.out

#- 312 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UgO4Qy9S' \
    --itemId 'V7bX7K5m' \
    > test.out 2>&1
eval_tap $? 312 'CountOfPurchasedItem' test.out

#- 313 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WlNTCyr4' \
    --userId 'oNwWW5NK' \
    > test.out 2>&1
eval_tap $? 313 'GetUserOrder' test.out

#- 314 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ekpwF09a' \
    --userId 'lSwKjsdG' \
    --body '{"status": "CLOSED", "statusReason": "Y1mYppYd"}' \
    > test.out 2>&1
eval_tap $? 314 'UpdateUserOrderStatus' test.out

#- 315 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vnTe0d56' \
    --userId 'z7FuGwVu' \
    > test.out 2>&1
eval_tap $? 315 'FulfillUserOrder' test.out

#- 316 GetUserOrderGrant
eval_tap 0 316 'GetUserOrderGrant # SKIP deprecated' test.out

#- 317 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4RVmApjs' \
    --userId 'DKyURrJL' \
    > test.out 2>&1
eval_tap $? 317 'GetUserOrderHistories' test.out

#- 318 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0AU2TZYW' \
    --userId 'T8hymS7i' \
    --body '{"additionalData": {"cardSummary": "wqhXG8C1"}, "authorisedTime": "1975-06-15T00:00:00Z", "chargebackReversedTime": "1971-06-02T00:00:00Z", "chargebackTime": "1978-01-08T00:00:00Z", "chargedTime": "1991-11-05T00:00:00Z", "createdTime": "1976-07-03T00:00:00Z", "currency": {"currencyCode": "l15Ec7fJ", "currencySymbol": "bq4tkfjm", "currencyType": "VIRTUAL", "decimals": 73, "namespace": "po2AIHQx"}, "customParameters": {"4BwIBCoX": {}, "QPJyRJvJ": {}, "ULQuYtuo": {}}, "extOrderNo": "WoBaxIp8", "extTxId": "E8gkKGtW", "extUserId": "8VA9JnfQ", "issuedAt": "1997-05-04T00:00:00Z", "metadata": {"UJtcg4vM": "vMIzV30O", "hgSjhzLJ": "PcBeLnC9", "meGICUoK": "BTsg9cUn"}, "namespace": "YpiiS21Y", "nonceStr": "udkY7w7c", "paymentData": {"discountAmount": 61, "discountCode": "LpxmUp4Q", "subtotalPrice": 64, "tax": 55, "totalPrice": 94}, "paymentMethod": "XmiP8zhl", "paymentMethodFee": 12, "paymentOrderNo": "jK68WXKg", "paymentProvider": "XSOLLA", "paymentProviderFee": 29, "paymentStationUrl": "n7SOUhL0", "price": 32, "refundedTime": "1978-07-04T00:00:00Z", "salesTax": 42, "sandbox": true, "sku": "fMRXpvw3", "status": "AUTHORISE_FAILED", "statusReason": "WEH2opjV", "subscriptionId": "HP11lWOT", "subtotalPrice": 89, "targetNamespace": "5TNfT9de", "targetUserId": "44j2v9kB", "tax": 85, "totalPrice": 3, "totalTax": 38, "txEndTime": "1978-05-22T00:00:00Z", "type": "1srSkq88", "userId": "XFgvdvhu", "vat": 5}' \
    > test.out 2>&1
eval_tap $? 318 'ProcessUserOrderNotification' test.out

#- 319 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DIPza6do' \
    --userId 'Ayv6ZXzj' \
    > test.out 2>&1
eval_tap $? 319 'DownloadUserOrderReceipt' test.out

#- 320 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxB6GPaX' \
    --body '{"currencyCode": "8LRtxEJK", "currencyNamespace": "Xbwx86kW", "customParameters": {"IU4OPX14": {}, "iab8EZBI": {}, "dos82kHI": {}}, "description": "Q5cYqtru", "extOrderNo": "T8Rva20U", "extUserId": "Uuy2Ci9y", "itemType": "APP", "language": "nJ_ouIw_AM", "metadata": {"uaqhpRqH": "uAEUTf3q", "zKZPM0lM": "QnrGH6uE", "jdPKLokM": "1ScRnEvJ"}, "notifyUrl": "FQjCb6PG", "omitNotification": true, "platform": "pHaG5K6T", "price": 14, "recurringPaymentOrderNo": "aWtk51R0", "region": "KhDytMdn", "returnUrl": "lXHinSOG", "sandbox": false, "sku": "nJ7iwKQs", "subscriptionId": "VNAgWzCX", "title": "ZWUoWGzc"}' \
    > test.out 2>&1
eval_tap $? 320 'CreateUserPaymentOrder' test.out

#- 321 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1w55Gx9k' \
    --userId 'c9RCUDxR' \
    --body '{"description": "nn28KBmu"}' \
    > test.out 2>&1
eval_tap $? 321 'RefundUserPaymentOrder' test.out

#- 322 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwATKl2D' \
    > test.out 2>&1
eval_tap $? 322 'GetUserPlatformAccountClosureHistories' test.out

#- 323 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMLbuQSr' \
    --body '{"code": "IGNR7HMc", "orderNo": "VJUfioMz"}' \
    > test.out 2>&1
eval_tap $? 323 'ApplyUserRedemption' test.out

#- 324 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'rTGySwtY' \
    --body '{"meta": {"fZ8SvJ5A": {}, "yF61m8ip": {}, "ndmSCSqv": {}}, "reason": "Vm2K7Qfo", "requestId": "Jfcp2Ki8", "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "2rsTpJBz", "namespace": "Jmk6yPbz"}, "entitlement": {"entitlementId": "SQ6PGTBi"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "JoNqFMdH", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "Ei9Vr2Zg", "namespace": "HSWJ4Q9D"}, "entitlement": {"entitlementId": "e58NVVsl"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "DecaFMNz", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "OBln0Qtt", "namespace": "pKnfTBXo"}, "entitlement": {"entitlementId": "KLgm40av"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "TzznCl07", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 23, "type": "CURRENCY"}], "source": "ORDER", "transactionId": "SU5YCt6c"}' \
    > test.out 2>&1
eval_tap $? 324 'DoRevocation' test.out

#- 325 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'f1JGpFZz' \
    --body '{"gameSessionId": "CxhadC8h", "payload": {"q6vnIy67": {}, "sb1Ehcrz": {}, "7XwY1qcV": {}}, "scid": "sSCI9enW", "sessionTemplateName": "VyO9k4iU"}' \
    > test.out 2>&1
eval_tap $? 325 'RegisterXblSessions' test.out

#- 326 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'RUe506yX' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'X5a2qeKs' \
    --limit '68' \
    --offset '96' \
    --sku 'ttj15TG7' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserSubscriptions' test.out

#- 327 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '9nsSZL0J' \
    --excludeSystem  \
    --limit '75' \
    --offset '78' \
    --subscriptionId 'ERrrRIQN' \
    > test.out 2>&1
eval_tap $? 327 'GetUserSubscriptionActivities' test.out

#- 328 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qw4cyJUy' \
    --body '{"grantDays": 55, "itemId": "tGiBVdQy", "language": "9XMgREVO", "reason": "bAJ9Gklb", "region": "SDfoC2uj", "source": "4QqGze8k"}' \
    > test.out 2>&1
eval_tap $? 328 'PlatformSubscribeSubscription' test.out

#- 329 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2yVLpEEN' \
    --itemId '2UH0M8Ma' \
    > test.out 2>&1
eval_tap $? 329 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 330 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'X0ob0eMc' \
    --userId 'Ofn4DvCB' \
    > test.out 2>&1
eval_tap $? 330 'GetUserSubscription' test.out

#- 331 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UgSCIm0x' \
    --userId 'PLqTQz9B' \
    > test.out 2>&1
eval_tap $? 331 'DeleteUserSubscription' test.out

#- 332 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0eq6uEzC' \
    --userId 'Fsi96R87' \
    --force  \
    --body '{"immediate": true, "reason": "5WiW8OtZ"}' \
    > test.out 2>&1
eval_tap $? 332 'CancelSubscription' test.out

#- 333 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'D7mIyNPo' \
    --userId 'AJMQvhHG' \
    --body '{"grantDays": 82, "reason": "DM1vzZwX"}' \
    > test.out 2>&1
eval_tap $? 333 'GrantDaysToSubscription' test.out

#- 334 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cmNvPNRQ' \
    --userId 'ZGb4y5w2' \
    --excludeFree  \
    --limit '23' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 334 'GetUserSubscriptionBillingHistories' test.out

#- 335 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3x9Gn3kj' \
    --userId 'bybaeP9W' \
    --body '{"additionalData": {"cardSummary": "1KDE0PGu"}, "authorisedTime": "1993-02-10T00:00:00Z", "chargebackReversedTime": "1988-10-26T00:00:00Z", "chargebackTime": "1975-08-15T00:00:00Z", "chargedTime": "1979-02-19T00:00:00Z", "createdTime": "1972-05-16T00:00:00Z", "currency": {"currencyCode": "3oQA8fWZ", "currencySymbol": "1XAqpoOQ", "currencyType": "VIRTUAL", "decimals": 50, "namespace": "MT2rcWaX"}, "customParameters": {"ur0sY7bE": {}, "gmSBJQEg": {}, "ywdMSro9": {}}, "extOrderNo": "O8u3zVwq", "extTxId": "eX565pjO", "extUserId": "rssZyCE6", "issuedAt": "1972-10-29T00:00:00Z", "metadata": {"O3y5Dcte": "XEEm1maA", "ZwktYLr8": "uoyUGhEk", "bBvsKxe5": "v5cguzeF"}, "namespace": "xctV42m4", "nonceStr": "2D95KSwD", "paymentData": {"discountAmount": 92, "discountCode": "eImyrW16", "subtotalPrice": 64, "tax": 61, "totalPrice": 33}, "paymentMethod": "VfYBjdeD", "paymentMethodFee": 16, "paymentOrderNo": "9yuqaedE", "paymentProvider": "WALLET", "paymentProviderFee": 77, "paymentStationUrl": "fXxiaIEY", "price": 97, "refundedTime": "1979-12-21T00:00:00Z", "salesTax": 54, "sandbox": false, "sku": "3P5yWUBj", "status": "REFUNDING", "statusReason": "gHTajgCN", "subscriptionId": "Q201qLJU", "subtotalPrice": 75, "targetNamespace": "UfJzd4tg", "targetUserId": "YlFvuulf", "tax": 63, "totalPrice": 35, "totalTax": 24, "txEndTime": "1982-07-15T00:00:00Z", "type": "8RE8Uwnz", "userId": "j2dAIfHz", "vat": 59}' \
    > test.out 2>&1
eval_tap $? 335 'ProcessUserSubscriptionNotification' test.out

#- 336 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '4tjMQl4A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a08WWM6Z' \
    --body '{"count": 76, "orderNo": "iCuwXp6N"}' \
    > test.out 2>&1
eval_tap $? 336 'AcquireUserTicket' test.out

#- 337 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'BPd0EG42' \
    > test.out 2>&1
eval_tap $? 337 'QueryUserCurrencyWallets' test.out

#- 338 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'YiKunDaJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9ZumFGP' \
    --body '{"allowOverdraft": true, "amount": 20, "balanceOrigin": "GooglePlay", "balanceSource": "PAYMENT", "metadata": {"wiIf3Zov": {}, "J1hXPfqR": {}, "hpcKSYZ5": {}}, "reason": "z2Dy18AB"}' \
    > test.out 2>&1
eval_tap $? 338 'DebitUserWalletByCurrencyCode' test.out

#- 339 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'fQYmZb6m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lVRV9uCN' \
    --limit '10' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 339 'ListUserCurrencyTransactions' test.out

#- 340 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'NBaidOWr' \
    --namespace "$AB_NAMESPACE" \
    --userId '6NUq9Syo' \
    --request '{"amount": 63, "debitBalanceSource": "TRADE", "metadata": {"MR0nOgfb": {}, "VzsG2d7J": {}, "PjXtyXyf": {}}, "reason": "syPZLqSL", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 340 'CheckBalance' test.out

#- 341 CheckWallet
eval_tap 0 341 'CheckWallet # SKIP deprecated' test.out

#- 342 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'oJMyvgRX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mA6Wr5Pb' \
    --body '{"amount": 38, "expireAt": "1994-06-27T00:00:00Z", "metadata": {"8TwdmzJQ": {}, "aRjTIsba": {}, "b2Ra8pPx": {}}, "origin": "Other", "reason": "EFgvvHnq", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 342 'CreditUserWallet' test.out

#- 343 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'wjliG96a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgzyVTV4' \
    --request '{"amount": 24, "debitBalanceSource": "PAYMENT", "metadata": {"dQptTBNG": {}, "Zotwj1G4": {}, "zfn1EYXG": {}}, "reason": "15zEVA8V", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 343 'DebitByWalletPlatform' test.out

#- 344 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'LQlncuLW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j1xRiRdo' \
    --body '{"amount": 21, "metadata": {"dEDA24KK": {}, "SNimRXub": {}, "rWNCI0j5": {}}, "walletPlatform": "Epic"}' \
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
    --storeId 'MqOzNWIr' \
    > test.out 2>&1
eval_tap $? 350 'ListViews' test.out

#- 351 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tiXYhsE9' \
    --body '{"displayOrder": 78, "localizations": {"k5K9TTEu": {"description": "eaVrk6VO", "localExt": {"f71EcYZi": {}, "FRITfngS": {}, "e6FsVRjE": {}}, "longDescription": "4W2OGaBm", "title": "El4iTG3X"}, "4JvtOnCK": {"description": "ig3mhJvQ", "localExt": {"CsV8qshV": {}, "pfCGI72f": {}, "Io5tbV9N": {}}, "longDescription": "NiCyBrFk", "title": "QZraBkYy"}, "XYwTHamk": {"description": "SZkJ2esU", "localExt": {"nizALy7Z": {}, "WPQ6CXnn": {}, "Nb7p9DhY": {}}, "longDescription": "DcOGa3QD", "title": "ErrTZGzj"}}, "name": "DujSiHZ0"}' \
    > test.out 2>&1
eval_tap $? 351 'CreateView' test.out

#- 352 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Z6SzKsaV' \
    --storeId 'CAdWfkb7' \
    > test.out 2>&1
eval_tap $? 352 'GetView' test.out

#- 353 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'qWFboSJD' \
    --storeId 'rGso1sR8' \
    --body '{"displayOrder": 38, "localizations": {"p8S8dUEB": {"description": "QyEixyCM", "localExt": {"bJYqnduy": {}, "E0603OOI": {}, "xStQnHNf": {}}, "longDescription": "wSoANLNe", "title": "gFYGxH3e"}, "uuB9DNoC": {"description": "a1A8xVWK", "localExt": {"KUfaGxD0": {}, "SixwPntM": {}, "E2mI3VFn": {}}, "longDescription": "TCbyJBYR", "title": "zoGdnihL"}, "3UN94DSn": {"description": "IIjBFyDs", "localExt": {"FPUPcjIA": {}, "F3828BNy": {}, "JomCAWkE": {}}, "longDescription": "Q2yCuHh6", "title": "VESJ8TJ2"}}, "name": "a51K6D8f"}' \
    > test.out 2>&1
eval_tap $? 353 'UpdateView' test.out

#- 354 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'iFWU5y4j' \
    --storeId 'tWRR0dPG' \
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
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateWalletConfig' test.out

#- 357 QueryWallets
eval_tap 0 357 'QueryWallets # SKIP deprecated' test.out

#- 358 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 85, "expireAt": "1990-04-14T00:00:00Z", "metadata": {"z02m10sq": {}, "P1rNiWUU": {}, "2VGTOm3d": {}}, "origin": "Epic", "reason": "CCyyNrhI", "source": "GIFT"}, "currencyCode": "kxkXev4x", "userIds": ["LyTvaomh", "81s7moMO", "eQHEyy3w"]}, {"creditRequest": {"amount": 66, "expireAt": "1981-01-09T00:00:00Z", "metadata": {"97v8BMuv": {}, "zyLWsFnl": {}, "HcE8SgfJ": {}}, "origin": "GooglePlay", "reason": "YqvxRe2R", "source": "DLC"}, "currencyCode": "Ig7xJE2l", "userIds": ["2KOvwklX", "ah1oA2ln", "32bqQLRl"]}, {"creditRequest": {"amount": 87, "expireAt": "1983-09-21T00:00:00Z", "metadata": {"lbA8WgDx": {}, "rF63QkrS": {}, "iLpWvrFg": {}}, "origin": "Twitch", "reason": "g5JuJMEm", "source": "REWARD"}, "currencyCode": "CG9BcWv2", "userIds": ["xdWV2F8H", "m58HJcDs", "TNoLLxPt"]}]' \
    > test.out 2>&1
eval_tap $? 358 'BulkCredit' test.out

#- 359 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "K0qDX1Si", "request": {"allowOverdraft": true, "amount": 43, "balanceOrigin": "Playstation", "balanceSource": "ORDER_REVOCATION", "metadata": {"ngBCQxZn": {}, "SYPjGpp7": {}, "zt6Qrzh3": {}}, "reason": "BWtybeLA"}, "userIds": ["x6vfJIPK", "D5XWk3U5", "W795Rgog"]}, {"currencyCode": "FRCStgtb", "request": {"allowOverdraft": true, "amount": 95, "balanceOrigin": "Twitch", "balanceSource": "ORDER_REVOCATION", "metadata": {"9s5Riimb": {}, "tEc75xda": {}, "CZnTGLrn": {}}, "reason": "xv8eFQZ0"}, "userIds": ["TGgrDSn1", "CCHk19HG", "cGXDvrnT"]}, {"currencyCode": "0YSisxUN", "request": {"allowOverdraft": true, "amount": 9, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"m8HOgi3E": {}, "r70N9g90": {}, "hgEdNnlS": {}}, "reason": "iPdFefo4"}, "userIds": ["Ej99YUlG", "ZgKvqXlk", "yhbZtrKi"]}]' \
    > test.out 2>&1
eval_tap $? 359 'BulkDebit' test.out

#- 360 GetWallet
eval_tap 0 360 'GetWallet # SKIP deprecated' test.out

#- 361 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'Ft2l5oQy' \
    --end 'Q0LTqgMe' \
    --start '5ryetXZI' \
    > test.out 2>&1
eval_tap $? 361 'SyncOrders' test.out

#- 362 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["978cGYJM", "AjK6xu3l", "yzVCMXDn"], "apiKey": "OLAHHARq", "authoriseAsCapture": false, "blockedPaymentMethods": ["4gX6fVQp", "lJNHoUsy", "ZCa8KPdQ"], "clientKey": "LL8CFFIP", "dropInSettings": "eozAg9EN", "liveEndpointUrlPrefix": "ELY7l0ml", "merchantAccount": "mpClO422", "notificationHmacKey": "tKlXOHdz", "notificationPassword": "4anbu2Ev", "notificationUsername": "IzFUwvNQ", "returnUrl": "9gUAyOPY", "settings": "a2ULWObf"}' \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfig' test.out

#- 363 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "TfGx6yvn", "privateKey": "2QSNB1Fn", "publicKey": "dfBGykSN", "returnUrl": "GaohQYal"}' \
    > test.out 2>&1
eval_tap $? 363 'TestAliPayConfig' test.out

#- 364 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "5aJu9Z4P", "secretKey": "JtdVGwlT"}' \
    > test.out 2>&1
eval_tap $? 364 'TestCheckoutConfig' test.out

#- 365 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'p8vyZzhr' \
    > test.out 2>&1
eval_tap $? 365 'DebugMatchedPaymentMerchantConfig' test.out

#- 366 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "5hsjcBg3", "webhookSecretKey": "NK2FIlDO"}' \
    > test.out 2>&1
eval_tap $? 366 'TestNeonPayConfig' test.out

#- 367 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "f8rri0Rq", "clientSecret": "WlU3dHZi", "returnUrl": "F2HeNETS", "webHookId": "DLrRBFWP"}' \
    > test.out 2>&1
eval_tap $? 367 'TestPayPalConfig' test.out

#- 368 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["s8qtBOWm", "sPkxnIpn", "zkfS7oHh"], "publishableKey": "2LEJ5LPk", "secretKey": "eXiTtt17", "webhookSecret": "dnqJLsTv"}' \
    > test.out 2>&1
eval_tap $? 368 'TestStripeConfig' test.out

#- 369 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "ZeccoDEM", "key": "EI7xY7xI", "mchid": "fwqUvcN8", "returnUrl": "vVeihRGu"}' \
    > test.out 2>&1
eval_tap $? 369 'TestWxPayConfig' test.out

#- 370 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "hjxJA4KK", "flowCompletionUrl": "SaoGjPr2", "merchantId": 76, "projectId": 46, "projectSecretKey": "wPONoaHb"}' \
    > test.out 2>&1
eval_tap $? 370 'TestXsollaConfig' test.out

#- 371 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'LuXIJGf5' \
    > test.out 2>&1
eval_tap $? 371 'GetPaymentMerchantConfig1' test.out

#- 372 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'g7y2c3pb' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Dkxqjmqa", "Uh3eg8zE", "sxa5L5bi"], "apiKey": "8YYC7tsK", "authoriseAsCapture": true, "blockedPaymentMethods": ["6hb1QCUl", "AUeF4gCW", "pu0Pmyfm"], "clientKey": "ovjEcghH", "dropInSettings": "KvzXHsYP", "liveEndpointUrlPrefix": "duqJ0yHA", "merchantAccount": "hIHXntV4", "notificationHmacKey": "FtYsSqve", "notificationPassword": "rxLB2cNp", "notificationUsername": "SOaOk2lo", "returnUrl": "wN5j99BP", "settings": "MoBFDAiF"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAdyenConfig' test.out

#- 373 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'FeGTJTPw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAdyenConfigById' test.out

#- 374 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '0I3kUCsN' \
    --sandbox  \
    --validate  \
    --body '{"appId": "0LMvygbv", "privateKey": "Y9zeEYTs", "publicKey": "I9Mxvidr", "returnUrl": "ehiCVeYs"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateAliPayConfig' test.out

#- 375 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '6hH9T9eD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestAliPayConfigById' test.out

#- 376 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'pRlD86jP' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "NlHwff47", "secretKey": "YoA2ulpa"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateCheckoutConfig' test.out

#- 377 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'IaZEmUNl' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestCheckoutConfigById' test.out

#- 378 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id '8aQA2PKj' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "21wYMRAe", "webhookSecretKey": "h5M6c4x1"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateNeonPayConfig' test.out

#- 379 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'WSkzoa6w' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestNeonPayConfigById' test.out

#- 380 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'SE3ttXwJ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "N76Wv27w", "clientSecret": "C2hcbnlA", "returnUrl": "gI4DagCO", "webHookId": "NAOPo3n7"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdatePayPalConfig' test.out

#- 381 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'JWBEU6B3' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestPayPalConfigById' test.out

#- 382 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '3AdYMtRe' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["vGOgaJV5", "OrchVYMY", "8UkipEL3"], "publishableKey": "KEh71kvw", "secretKey": "XsCmeMMQ", "webhookSecret": "7axDtlYb"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateStripeConfig' test.out

#- 383 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'yDH6DdCZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 383 'TestStripeConfigById' test.out

#- 384 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '75ehmSrS' \
    --validate  \
    --body '{"appId": "yk8IyYxR", "key": "eQyA4Yw0", "mchid": "5MGsyfLb", "returnUrl": "Lpe9o23A"}' \
    > test.out 2>&1
eval_tap $? 384 'UpdateWxPayConfig' test.out

#- 385 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'cIJ2Zezw' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 385 'UpdateWxPayConfigCert' test.out

#- 386 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'T88l1Uq9' \
    > test.out 2>&1
eval_tap $? 386 'TestWxPayConfigById' test.out

#- 387 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'bqBBdEZB' \
    --validate  \
    --body '{"apiKey": "X49oPuNn", "flowCompletionUrl": "lb20NFli", "merchantId": 56, "projectId": 6, "projectSecretKey": "oMmD3SJX"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaConfig' test.out

#- 388 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '4nW8xHHW' \
    > test.out 2>&1
eval_tap $? 388 'TestXsollaConfigById' test.out

#- 389 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'BNIqUukt' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 389 'UpdateXsollaUIConfig' test.out

#- 390 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '26' \
    --namespace "$AB_NAMESPACE" \
    --offset '85' \
    --region '9uVvY7cG' \
    > test.out 2>&1
eval_tap $? 390 'QueryPaymentProviderConfig' test.out

#- 391 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "mpmaP0xt", "region": "0vcV8BjL", "sandboxTaxJarApiToken": "iYgk1YH7", "specials": ["ALIPAY", "CHECKOUT", "ADYEN"], "taxJarApiToken": "53ZoDk9H", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 391 'CreatePaymentProviderConfig' test.out

#- 392 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetAggregatePaymentProviders' test.out

#- 393 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'yaHc0G76' \
    > test.out 2>&1
eval_tap $? 393 'DebugMatchedPaymentProviderConfig' test.out

#- 394 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 394 'GetSpecialPaymentProviders' test.out

#- 395 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'JCr0LsXy' \
    --body '{"aggregate": "XSOLLA", "namespace": "Y3pcI0BJ", "region": "Bld6xsVd", "sandboxTaxJarApiToken": "jUEiFdmd", "specials": ["ADYEN", "WALLET", "WXPAY"], "taxJarApiToken": "T6vbmsvG", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 395 'UpdatePaymentProviderConfig' test.out

#- 396 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'N6S0zh2l' \
    > test.out 2>&1
eval_tap $? 396 'DeletePaymentProviderConfig' test.out

#- 397 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 397 'GetPaymentTaxConfig' test.out

#- 398 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "9KaBKufR", "taxJarApiToken": "o49thlGp", "taxJarEnabled": false, "taxJarProductCodesMapping": {"qxQodiBH": "QRvLlFRj", "tGHNDdUA": "XjE8uRPq", "Uui9FBU2": "aKbsmlWF"}}' \
    > test.out 2>&1
eval_tap $? 398 'UpdatePaymentTaxConfig' test.out

#- 399 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '3yyYkSWR' \
    --end 'Bmxikcxp' \
    --start '72YPdY4j' \
    > test.out 2>&1
eval_tap $? 399 'SyncPaymentOrders' test.out

#- 400 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'CqYXKyVx' \
    --storeId 'aW3ePIo4' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetRootCategories' test.out

#- 401 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'gyvziqp0' \
    --storeId 'Fr86AFt2' \
    > test.out 2>&1
eval_tap $? 401 'DownloadCategories' test.out

#- 402 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'Ab7DwO0O' \
    --namespace "$AB_NAMESPACE" \
    --language 'nHU00grr' \
    --storeId 'Qq04KKzf' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetCategory' test.out

#- 403 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'n2GEflnC' \
    --namespace "$AB_NAMESPACE" \
    --language 'C4bXlfhs' \
    --storeId 'ZCZx9id1' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetChildCategories' test.out

#- 404 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '3ZQpeOTL' \
    --namespace "$AB_NAMESPACE" \
    --language 'xcUczKGa' \
    --storeId 'DrwJURmv' \
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
    --dlcType 'OCULUS' \
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
    --language 'GOQxJNOf' \
    --region 'OReWGdNO' \
    --storeId 'VQQTUb1X' \
    --appId 'T1LhD1Nu' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemByAppId' test.out

#- 410 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'BdUPt0H2' \
    --categoryPath 'Clv64YVM' \
    --features 'cXInN3Gq' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --language 'dHrDQbYK' \
    --limit '9' \
    --offset '97' \
    --region 'jy2C77R6' \
    --sortBy 'name,updatedAt:asc,name:desc' \
    --storeId 'K6rcC4pL' \
    --tags 'npGQ1L8s' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryItems' test.out

#- 411 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Hrj3Y91E' \
    --region 'a0lPlv0i' \
    --storeId 'EPKL4rBZ' \
    --sku 'CNSleFw8' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetItemBySku' test.out

#- 412 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'nJ5Ody2C' \
    --storeId 'RsYPK1iF' \
    --itemIds 'CTY5mC7a' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetEstimatedPrice' test.out

#- 413 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'UDeoqjIg' \
    --region 'AtRU9O7i' \
    --storeId 'ZLtlJ0OS' \
    --itemIds '32Zx5bMD' \
    > test.out 2>&1
eval_tap $? 413 'PublicBulkGetItems' test.out

#- 414 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["0Pho37JC", "j9b2JVev", "BLOJyk06"]}' \
    > test.out 2>&1
eval_tap $? 414 'PublicValidateItemPurchaseCondition' test.out

#- 415 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '18' \
    --offset '93' \
    --region 'rWmWHM50' \
    --storeId 'qLICtM9O' \
    --keyword 'ZjG2Sn9V' \
    --language 'aFqLziKz' \
    > test.out 2>&1
eval_tap $? 415 'PublicSearchItems' test.out

#- 416 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'xSb3OPxB' \
    --namespace "$AB_NAMESPACE" \
    --language 'Uj0kCoLW' \
    --region 'kMY5Nk6P' \
    --storeId 'fXCHF7nZ' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetApp' test.out

#- 417 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '4Q3lpiY6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetItemDynamicData' test.out

#- 418 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'okSJGkqo' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'WaYaKOfl' \
    --populateBundle  \
    --region 'Yjcc4gZo' \
    --storeId 'Ff0ZJia8' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetItem' test.out

#- 419 GetPaymentCustomization
eval_tap 0 419 'GetPaymentCustomization # SKIP deprecated' test.out

#- 420 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "jrprNYUU", "successUrl": "dtjNNAyK"}, "paymentOrderNo": "vE8bdCwR", "paymentProvider": "WALLET", "returnUrl": "WHtGHUyZ", "ui": "5kUQ1tak", "zipCode": "bd9QQPYk"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentUrl' test.out

#- 421 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0Tej0JOl' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetPaymentMethods' test.out

#- 422 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rWLDBlYz' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUnpaidPaymentOrder' test.out

#- 423 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'r1VaGMIr' \
    --paymentProvider 'ADYEN' \
    --zipCode 'mOIcWPBx' \
    --body '{"token": "vAQ0CP7B"}' \
    > test.out 2>&1
eval_tap $? 423 'Pay' test.out

#- 424 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dwrWB2Pq' \
    > test.out 2>&1
eval_tap $? 424 'PublicCheckPaymentOrderPaidStatus' test.out

#- 425 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'Nr0vwMWf' \
    > test.out 2>&1
eval_tap $? 425 'GetPaymentPublicConfig' test.out

#- 426 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '4JeKpxwk' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetQRCode' test.out

#- 427 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '9oWc0o8F' \
    --foreinginvoice 'wJKoEDNy' \
    --invoiceId 'Z5bNKmlb' \
    --payload 'XZVciHS4' \
    --redirectResult 'GFOdVZdU' \
    --resultCode 'vtKaizkQ' \
    --sessionId 'KoBvYFiE' \
    --status 'b1dpmepO' \
    --token 'hK0BA3G4' \
    --type 'Y5v0W0c3' \
    --userId 'R2BcbtFk' \
    --orderNo '5UHHOJhF' \
    --paymentOrderNo 'ZtoGiGvx' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'IInwdWzQ' \
    > test.out 2>&1
eval_tap $? 427 'PublicNormalizePaymentReturnUrl' test.out

#- 428 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'saPuS6sG' \
    --paymentOrderNo 'ntP9Tbat' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 428 'GetPaymentTaxValue' test.out

#- 429 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'Vmp4FtYW' \
    > test.out 2>&1
eval_tap $? 429 'GetRewardByCode' test.out

#- 430 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Dke07Dvd' \
    --limit '49' \
    --offset '29' \
    --sortBy 'namespace:desc,namespace,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 430 'QueryRewards1' test.out

#- 431 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'rjPSkowk' \
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
    --appIds 'ffOl5w2x,TqRlGQpd,poOIVs00' \
    --itemIds 'VVNtn9mE,ryY6nYjz,CKHsATv7' \
    --skus 'tqZxYhh7,HGmFO2Ja,GHoyztYO' \
    > test.out 2>&1
eval_tap $? 433 'PublicExistsAnyMyActiveEntitlement' test.out

#- 434 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'C5Auk5ax' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 435 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'VaH7Q1dL' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 436 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '6Wk0g2ma' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 437 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'CgszLRrj,0L2Orwuv,CwFM03by' \
    --itemIds 'l3DxW13J,G5e6X5lw,GLs91ze1' \
    --skus 'IXXjv8yT,JZMkMqKa,6bPRPbwK' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetEntitlementOwnershipToken' test.out

#- 438 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Qoh1ULBg", "language": "Bgvo_ov", "region": "r3aN13I1"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncTwitchDropsEntitlement' test.out

#- 439 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'aPrTxVct' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 439 'PublicGetMyWallet' test.out

#- 440 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ekPmyQqG' \
    --body '{"epicGamesJwtToken": "enKYMwc6"}' \
    > test.out 2>&1
eval_tap $? 440 'SyncEpicGameDLC' test.out

#- 441 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'PxkcHSgd' \
    > test.out 2>&1
eval_tap $? 441 'SyncOculusDLC' test.out

#- 442 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'm445mN5W' \
    --body '{"serviceLabel": 42}' \
    > test.out 2>&1
eval_tap $? 442 'PublicSyncPsnDlcInventory' test.out

#- 443 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'zoXyhAZo' \
    --body '{"serviceLabels": [81, 50, 51]}' \
    > test.out 2>&1
eval_tap $? 443 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 444 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'o8PU3uk4' \
    --body '{"appId": "0mz4bA4g", "steamId": "ho2mHfap"}' \
    > test.out 2>&1
eval_tap $? 444 'SyncSteamDLC' test.out

#- 445 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'zYyfUBln' \
    --body '{"xstsToken": "4WsQlRkN"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncXboxDLC' test.out

#- 446 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6p3BMhI' \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName '5mCnSaCJ' \
    --features 'sPKPs77Q,heV7SmNP,pK6mFT08' \
    --itemId '8e4dOSvo,7SVCOGeE,LOlOYMnW' \
    --limit '81' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlements' test.out

#- 447 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IWDBeXwu' \
    --appId '2K0oZSYP' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserAppEntitlementByAppId' test.out

#- 448 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvopfM7H' \
    --limit '96' \
    --offset '18' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 448 'PublicQueryUserEntitlementsByAppType' test.out

#- 449 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4oH87q2H' \
    --availablePlatformOnly  \
    --ids 'aTguPPzO,YtYox8Ye,dgzd62Ah' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlementsByIds' test.out

#- 450 PublicGetUserEntitlementByItemId
eval_tap 0 450 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 451 PublicGetUserEntitlementBySku
eval_tap 0 451 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 452 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'utpRtO7x' \
    --endDate 'Vwo9gkSf' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '91' \
    --offset '66' \
    --startDate 'W4fAHYIj' \
    > test.out 2>&1
eval_tap $? 452 'PublicUserEntitlementHistory' test.out

#- 453 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvBM7gzY' \
    --appIds '1r9u7dq4,WqLw4OUM,2yrDteWn' \
    --itemIds 'RydfqFUo,Qgw2ORRu,vkVygwiC' \
    --skus 'QVeyqjio,eW6g0RDB,jzdW0ow0' \
    > test.out 2>&1
eval_tap $? 453 'PublicExistsAnyUserActiveEntitlement' test.out

#- 454 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rn094yk5' \
    --appId 't0HtxxNQ' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 455 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPWDRXzI' \
    --entitlementClazz 'APP' \
    --itemId 'ej8s1vSb' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 456 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ECol1OsR' \
    --ids 'ystHCMN7,OdjggJIN,rzEqoigN' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 457 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXQZBbA2' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'ouf4Typh' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 458 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'tNP6trnv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4Bt39P0' \
    > test.out 2>&1
eval_tap $? 458 'PublicGetUserEntitlement' test.out

#- 459 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'TM6mEzhI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RmV2cDWP' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["aSgSwYLL", "latBD2yN", "fsp0fr1h"], "requestId": "N8FJGCf9", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 459 'PublicConsumeUserEntitlement' test.out

#- 460 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'k80o7aQD' \
    --namespace "$AB_NAMESPACE" \
    --userId '8xg9p9Tx' \
    --body '{"requestId": "Oe2sMeIK", "useCount": 11}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSellUserEntitlement' test.out

#- 461 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'jteGW0Lz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'skc4eMcb' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 461 'PublicSplitUserEntitlement' test.out

#- 462 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'akPi92Bl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKmAjkAm' \
    --body '{"entitlementId": "Ha9pfxOF", "metadata": {"operationSource": "INVENTORY"}, "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 462 'PublicTransferUserEntitlement' test.out

#- 463 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qQf5ZWFs' \
    --body '{"code": "EFQVYuyy", "language": "cPT-475", "region": "eYvIWIjd"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicRedeemCode' test.out

#- 464 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gnir5oPj' \
    --body '{"excludeOldTransactions": false, "language": "bfv", "productId": "JNGpFm6d", "receiptData": "ANZqGCGy", "region": "jHz1nXsn", "transactionId": "iBsmUtt1"}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillAppleIAPItem' test.out

#- 465 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vIT2mCkl' \
    --body '{"epicGamesJwtToken": "IDmM4lsE"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncEpicGamesInventory' test.out

#- 466 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'pp92fouU' \
    --body '{"autoAck": false, "autoConsume": false, "language": "KGwI", "orderId": "UJ7aWzWQ", "packageName": "dhptaYkS", "productId": "zHWaFCsc", "purchaseTime": 6, "purchaseToken": "3nzcXsLV", "region": "3DVj9aj4", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 466 'PublicFulfillGoogleIAPItem' test.out

#- 467 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '2CHjr8k6' \
    --body '{"skus": ["GyUOFtiy", "QhQUQBPN", "NoiS3jaY"]}' \
    > test.out 2>&1
eval_tap $? 467 'SyncOculusSubscriptions' test.out

#- 468 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XaT5ytNl' \
    > test.out 2>&1
eval_tap $? 468 'SyncOculusConsumableEntitlements' test.out

#- 469 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOQ7oLZn' \
    --body '{"currencyCode": "OczVgMD4", "price": 0.3155913853051009, "productId": "dvNQiu6k", "serviceLabel": 49}' \
    > test.out 2>&1
eval_tap $? 469 'PublicReconcilePlayStationStore' test.out

#- 470 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'w6DGMYqN' \
    --body '{"currencyCode": "EeRoID5h", "price": 0.20448158227031776, "productId": "Lv7g6ElV", "serviceLabels": [66, 43, 12]}' \
    > test.out 2>&1
eval_tap $? 470 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 471 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lslbuCdW' \
    --body '{"appId": "TSQQPNl6", "currencyCode": "egs2qGdz", "language": "fJIl_HqxL", "price": 0.7120773692096997, "productId": "bEyi09ti", "region": "WExOSDRV", "steamId": "CEDsHE8N"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamInventory' test.out

#- 472 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJDvgwAO' \
    > test.out 2>&1
eval_tap $? 472 'SyncSteamAbnormalTransaction' test.out

#- 473 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '7sxVXoie' \
    --body '{"orderId": "P8lnQVxw"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncSteamIAPByTransaction' test.out

#- 474 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId 'uokNWiRp' \
    --activeOnly  \
    --groupId 'M7sTSiB9' \
    --limit '44' \
    --offset '9' \
    --productId 'DRJCIVC1' \
    > test.out 2>&1
eval_tap $? 474 'PublicQueryUserThirdPartySubscription' test.out

#- 475 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wn11wLKD' \
    --body '{"gameId": "q6PJj2Zh", "language": "yz", "region": "12Xzl6W5"}' \
    > test.out 2>&1
eval_tap $? 475 'SyncTwitchDropsEntitlement1' test.out

#- 476 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'J6vUjZc7' \
    --body '{"currencyCode": "TwEUXKOv", "price": 0.1930289397108541, "productId": "EBCDrHjJ", "xstsToken": "LqMeZv1W"}' \
    > test.out 2>&1
eval_tap $? 476 'SyncXboxInventory' test.out

#- 477 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HnRHX6o2' \
    --discounted  \
    --itemId '0MJGm0xT' \
    --limit '21' \
    --offset '32' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserOrders' test.out

#- 478 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'JxdGjt83' \
    --body '{"currencyCode": "TO3r5GwF", "discountCodes": ["aQMvvWLt", "Pdu1EhAo", "jI9ls5FV"], "discountedPrice": 64, "ext": {"uMu0gO3t": {}, "9qCd6Tc2": {}, "p8Dm7tO2": {}}, "itemId": "FVGNcyCT", "language": "BdFX-sHGi-045", "price": 23, "quantity": 20, "region": "c4cHG0j3", "returnUrl": "ZoIdZs6Q", "sectionId": "aQMefdeI"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicCreateUserOrder' test.out

#- 479 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'sEPDqlPN' \
    --body '{"currencyCode": "hNtL3ckB", "discountCodes": ["n2ewA0sp", "L5aUCxAH", "EJVdsRIc"], "discountedPrice": 18, "itemId": "WwDL9Nx6", "price": 6, "quantity": 63}' \
    > test.out 2>&1
eval_tap $? 479 'PublicPreviewOrderPrice' test.out

#- 480 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'js5fZLyT' \
    --userId 'BktuFi1i' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrder' test.out

#- 481 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Zc2G4tpB' \
    --userId '6OCEHdD8' \
    > test.out 2>&1
eval_tap $? 481 'PublicCancelUserOrder' test.out

#- 482 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bqJIpqGP' \
    --userId '6Ez6eEss' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetUserOrderHistories' test.out

#- 483 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SVysaQ0b' \
    --userId 'qdk37XGH' \
    > test.out 2>&1
eval_tap $? 483 'PublicDownloadUserOrderReceipt' test.out

#- 484 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'npcjUbzY' \
    > test.out 2>&1
eval_tap $? 484 'PublicGetPaymentAccounts' test.out

#- 485 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'zS6i8YGG' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'TBDYI3Bt' \
    > test.out 2>&1
eval_tap $? 485 'PublicDeletePaymentAccount' test.out

#- 486 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'xdagIHOA' \
    --autoCalcEstimatedPrice  \
    --language 'dcLB4OIV' \
    --region 'tTAONjyA' \
    --storeId 'zfLnlFhE' \
    --viewId 'qWwvV807' \
    > test.out 2>&1
eval_tap $? 486 'PublicListActiveSections' test.out

#- 487 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '7api8wsA' \
    --chargeStatus 'NEVER' \
    --itemId 'fPDmelIT' \
    --limit '0' \
    --offset '83' \
    --sku 'ZOjcl3IH' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 487 'PublicQueryUserSubscriptions' test.out

#- 488 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'dTlnspt1' \
    --body '{"currencyCode": "0kFWi476", "itemId": "45AFQY2z", "language": "QCWs_138", "region": "EbU86FV6", "returnUrl": "7M74nwJT", "source": "Rfb18gsK"}' \
    > test.out 2>&1
eval_tap $? 488 'PublicSubscribeSubscription' test.out

#- 489 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mo59g6qM' \
    --itemId 'Ekqd3gvY' \
    > test.out 2>&1
eval_tap $? 489 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 490 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZYt1AzEp' \
    --userId '4MUkS4DM' \
    > test.out 2>&1
eval_tap $? 490 'PublicGetUserSubscription' test.out

#- 491 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PlUMkc6J' \
    --userId 'uBdPmqOa' \
    > test.out 2>&1
eval_tap $? 491 'PublicChangeSubscriptionBillingAccount' test.out

#- 492 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'n6s8BmuI' \
    --userId 'qAWpOSCg' \
    --body '{"immediate": false, "reason": "HOkGpySR"}' \
    > test.out 2>&1
eval_tap $? 492 'PublicCancelSubscription' test.out

#- 493 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zyWD8HTK' \
    --userId 'KDbCT2vV' \
    --excludeFree  \
    --limit '89' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetUserSubscriptionBillingHistories' test.out

#- 494 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'IA494UBY' \
    --language 'BgTbrnOG' \
    --storeId 'syq0xX05' \
    > test.out 2>&1
eval_tap $? 494 'PublicListViews' test.out

#- 495 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'e1DMjm1J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TDXNmUhL' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetWallet' test.out

#- 496 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'zcaFCc6B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fQpVJLNO' \
    --limit '33' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 496 'PublicListUserWalletTransactions' test.out

#- 497 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 497 'PublicGetMyDLCContent' test.out

#- 498 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'fk4GAJS5' \
    --limit '65' \
    --offset '88' \
    --startTime 'nDu0JAVx' \
    --state 'FULFILLED' \
    --transactionId 'YdHvwrFD' \
    --userId 'WOxwa6xy' \
    > test.out 2>&1
eval_tap $? 498 'QueryFulfillments' test.out

#- 499 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'drIyUQqg' \
    --baseAppId 'HoOwr9VK' \
    --categoryPath '6di6d0kA' \
    --features 'tYrZgeiT' \
    --includeSubCategoryItem  \
    --itemName 'TmAJ9s3G' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS,INGAMEITEM,CODE' \
    --limit '8' \
    --offset '80' \
    --region 'CqGpHdeP' \
    --sectionExclusive  \
    --sortBy 'updatedAt:desc,createdAt:asc,displayOrder' \
    --storeId 'f5S9PWJE' \
    --tags 'YOnVL1hG' \
    --targetNamespace 'Eo6tYXE5' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 499 'QueryItemsV2' test.out

#- 500 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OZNgcsZe' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 500 'ImportStore1' test.out

#- 501 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '7WaBwvtW' \
    --body '{"itemIds": ["vqyW2QWj", "30DhWERQ", "EPus2fi6"]}' \
    > test.out 2>&1
eval_tap $? 501 'ExportStore1' test.out

#- 502 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPiKo0m1' \
    --body '{"entitlementCollectionId": "X4wiAFTA", "entitlementOrigin": "Playstation", "metadata": {"h6rMnmoc": {}, "VtcyaKFe": {}, "yB5mNSZj": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "MltORIAp", "namespace": "4JKV2vwo"}, "item": {"itemId": "59sih4ez", "itemName": "0xoQZ1be", "itemSku": "bkGsiYnP", "itemType": "KAdIKF5s"}, "quantity": 68, "type": "CURRENCY"}, {"currency": {"currencyCode": "tymWmxn7", "namespace": "VtZkLZI6"}, "item": {"itemId": "bJsVhlkF", "itemName": "ImM68v84", "itemSku": "qIeYOfOy", "itemType": "iOkb38kH"}, "quantity": 0, "type": "CURRENCY"}, {"currency": {"currencyCode": "2dfS3Meq", "namespace": "T2lsMzYj"}, "item": {"itemId": "75kwWs3Z", "itemName": "YNrDHY68", "itemSku": "nYobevvE", "itemType": "qVCvRXFS"}, "quantity": 79, "type": "ITEM"}], "source": "ACHIEVEMENT", "transactionId": "TalNlvJF"}' \
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
    --userId 'MJ4DZnVf' \
    --body '{"transactionId": "OOu8XP1e"}' \
    > test.out 2>&1
eval_tap $? 506 'V2PublicFulfillAppleIAPItem' test.out

#- 507 BulkFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform bulkFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfoZSqyd' \
    --body '[{"items": [{"duration": 82, "endDate": "1994-10-10T00:00:00Z", "entitlementCollectionId": "chDOTJ3a", "entitlementOrigin": "IOS", "itemId": "zJ6lCofa", "itemSku": "zRfC7WLa", "language": "XIMaxnPk", "metadata": {"9emlwEKw": {}, "U5eUpNaD": {}, "OIOotui0": {}}, "orderNo": "hd5XKmGx", "origin": "Twitch", "quantity": 47, "region": "WOQ7Iihx", "source": "IAP", "startDate": "1985-07-31T00:00:00Z", "storeId": "lS5c4CN9"}, {"duration": 73, "endDate": "1991-10-31T00:00:00Z", "entitlementCollectionId": "YzLaKnYu", "entitlementOrigin": "Epic", "itemId": "YETTJ2Ik", "itemSku": "XjkiNnU5", "language": "CrpjOFBu", "metadata": {"F90JEcxe": {}, "blDBpauO": {}, "HvSO0IUi": {}}, "orderNo": "y85ml9r0", "origin": "Other", "quantity": 50, "region": "G9SDDPxK", "source": "IAP", "startDate": "1987-06-05T00:00:00Z", "storeId": "g3eHoE33"}, {"duration": 84, "endDate": "1983-05-07T00:00:00Z", "entitlementCollectionId": "NkFBMuL1", "entitlementOrigin": "IOS", "itemId": "zVdCqCnx", "itemSku": "SZkvHwtQ", "language": "PjBaj6WG", "metadata": {"v0uSw8Z9": {}, "xTioFu1I": {}, "9gPKYAsD": {}}, "orderNo": "Yp2Ta9jb", "origin": "Playstation", "quantity": 58, "region": "Ejop3ssZ", "source": "EXPIRATION", "startDate": "1986-10-29T00:00:00Z", "storeId": "fk9oPPRr"}], "transactionId": "zq0Ri2yI"}, {"items": [{"duration": 11, "endDate": "1995-01-28T00:00:00Z", "entitlementCollectionId": "TZ0nYa3f", "entitlementOrigin": "Steam", "itemId": "K4y4qqYt", "itemSku": "koujmgEa", "language": "h7o0aZRh", "metadata": {"hlTZ9lhM": {}, "MTprWvM1": {}, "BWZlBew4": {}}, "orderNo": "X4q9Prl6", "origin": "GooglePlay", "quantity": 35, "region": "DDhku2Km", "source": "GIFT", "startDate": "1976-05-13T00:00:00Z", "storeId": "AlznSLdR"}, {"duration": 59, "endDate": "1974-12-14T00:00:00Z", "entitlementCollectionId": "DvFW81at", "entitlementOrigin": "IOS", "itemId": "QHT0EaGb", "itemSku": "zNWscqtS", "language": "5lueeOYx", "metadata": {"6fzd2oQi": {}, "d1PQcasd": {}, "57JU5KiV": {}}, "orderNo": "JYeV9Wp8", "origin": "Other", "quantity": 20, "region": "BFuwW9cg", "source": "PURCHASE", "startDate": "1980-04-10T00:00:00Z", "storeId": "OWIqJwZS"}, {"duration": 75, "endDate": "1972-12-05T00:00:00Z", "entitlementCollectionId": "Ly7k0Dsd", "entitlementOrigin": "System", "itemId": "QgSoSdcf", "itemSku": "B9WpC0JC", "language": "WayqNcF7", "metadata": {"6AXfixhn": {}, "rhj2wbgy": {}, "9AUXDSiM": {}}, "orderNo": "qEZJ4990", "origin": "System", "quantity": 73, "region": "NAh3LchK", "source": "REDEEM_CODE", "startDate": "1981-07-19T00:00:00Z", "storeId": "rV6GoyQN"}], "transactionId": "7tHfjADb"}, {"items": [{"duration": 49, "endDate": "1978-12-07T00:00:00Z", "entitlementCollectionId": "ArPSLx9D", "entitlementOrigin": "Oculus", "itemId": "WtuNgOH6", "itemSku": "gF96rggv", "language": "mOjZquTk", "metadata": {"gu0he53g": {}, "xBxj7mqY": {}, "IJmGijtJ": {}}, "orderNo": "qNAfRGco", "origin": "System", "quantity": 27, "region": "HJ3pEgEC", "source": "ACHIEVEMENT", "startDate": "1992-06-29T00:00:00Z", "storeId": "Ak9xx7q0"}, {"duration": 42, "endDate": "1994-04-24T00:00:00Z", "entitlementCollectionId": "DIx8c81r", "entitlementOrigin": "Oculus", "itemId": "ieEzcF4g", "itemSku": "VcCw9eZ5", "language": "h3ipsPKy", "metadata": {"f2gGms8s": {}, "KzLJVnOo": {}, "f3oaH9NP": {}}, "orderNo": "74iOCcsx", "origin": "Steam", "quantity": 91, "region": "hgj7hEyy", "source": "OTHER", "startDate": "1996-11-25T00:00:00Z", "storeId": "XWcxB59s"}, {"duration": 54, "endDate": "1988-04-21T00:00:00Z", "entitlementCollectionId": "AjKs0Ggu", "entitlementOrigin": "Epic", "itemId": "bOLYttk5", "itemSku": "Xvm53FUQ", "language": "ZHe82nvf", "metadata": {"xZ798M3r": {}, "bq3XLsHH": {}, "8PQPE13H": {}}, "orderNo": "5tIFYdix", "origin": "Epic", "quantity": 13, "region": "CBDhUGxL", "source": "GIFT", "startDate": "1994-12-03T00:00:00Z", "storeId": "sE5fZ2yo"}], "transactionId": "p1QZGs76"}]' \
    > test.out 2>&1
eval_tap $? 507 'BulkFulfillItemsV3' test.out

#- 508 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'pvLtlhYZ' \
    --userId 'A5Fmv0d2' \
    --body '{"items": [{"duration": 29, "endDate": "1996-05-21T00:00:00Z", "entitlementCollectionId": "muiUmD9F", "entitlementOrigin": "Twitch", "itemId": "qykwQAZF", "itemSku": "8Jpa01hO", "language": "Dnsr0o4n", "metadata": {"kPrmo8gv": {}, "Oitj52yy": {}, "OczbovQF": {}}, "orderNo": "ktCGMf0W", "origin": "Epic", "quantity": 51, "region": "TU66B2BX", "source": "ORDER_REVOCATION", "startDate": "1985-03-03T00:00:00Z", "storeId": "JbaUhltw"}, {"duration": 54, "endDate": "1986-05-14T00:00:00Z", "entitlementCollectionId": "PaATecpk", "entitlementOrigin": "Twitch", "itemId": "1rIzKgPa", "itemSku": "Yn2LP1RG", "language": "tkYlkDt6", "metadata": {"XkIG1I0V": {}, "QIZWaUmD": {}, "PGu2WS83": {}}, "orderNo": "pMnJn6Wc", "origin": "Playstation", "quantity": 13, "region": "xjgFabpc", "source": "CONSUME_ENTITLEMENT", "startDate": "1986-02-01T00:00:00Z", "storeId": "AE5KdbLC"}, {"duration": 2, "endDate": "1989-12-29T00:00:00Z", "entitlementCollectionId": "K0ZhZhog", "entitlementOrigin": "Nintendo", "itemId": "8JLagNbG", "itemSku": "AhMDurov", "language": "f6HWCFTT", "metadata": {"GAx1It70": {}, "s60vKD8J": {}, "5yzQ33ZU": {}}, "orderNo": "gq7PpEYQ", "origin": "Epic", "quantity": 67, "region": "cW4FiDOx", "source": "PROMOTION", "startDate": "1994-04-09T00:00:00Z", "storeId": "lfF4g0Bm"}]}' \
    > test.out 2>&1
eval_tap $? 508 'FulfillItemsV3' test.out

#- 509 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'xMhxODf8' \
    --userId 'sOMkuiHt' \
    > test.out 2>&1
eval_tap $? 509 'RetryFulfillItemsV3' test.out

#- 510 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'pg7P58BE' \
    --userId 'UYz0pCXm' \
    > test.out 2>&1
eval_tap $? 510 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
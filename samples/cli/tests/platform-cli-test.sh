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
echo "1..497"

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
    --id 'WUGXw9Jw' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'V6IYTMfB' \
    --body '{"grantDays": "elqloNfb"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'eMzAioqi' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'BdMc69wp' \
    --body '{"grantDays": "iQFdbhtB"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Dq81Q8O4", "dryRun": false, "fulfillmentUrl": "cs5qdftF", "itemType": "CODE", "purchaseConditionUrl": "kExLHiRD"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'zZ2ukR7q' \
    --itemType 'INGAMEITEM' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'DzbQZqZt' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'LuDemm9W' \
    --body '{"clazz": "e28mFN64", "dryRun": true, "fulfillmentUrl": "MTWBwm9d", "purchaseConditionUrl": "YykU28kW"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'U391riTg' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name '0T9Gereu' \
    --offset '81' \
    --tag 'pjZSodMn' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "l7YYiAV2", "discountConfig": {"categories": [{"categoryPath": "rGQgIFFc", "includeSubCategories": false}, {"categoryPath": "MLxbaQd8", "includeSubCategories": true}, {"categoryPath": "0jxgUxz9", "includeSubCategories": true}], "currencyCode": "fRvCRtGg", "currencyNamespace": "YJMmjcYN", "discountAmount": 75, "discountPercentage": 25, "discountType": "PERCENTAGE", "items": [{"itemId": "kjVeT017", "itemName": "6vZVvruE"}, {"itemId": "8UPI3Kds", "itemName": "KBzJ2a12"}, {"itemId": "xyaaZY7G", "itemName": "kOKbLS7Q"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 4, "itemId": "MOlDXTTN", "itemName": "K3dzbNiM", "quantity": 54}, {"extraSubscriptionDays": 81, "itemId": "5aQZTKp8", "itemName": "i3As5Q5y", "quantity": 86}, {"extraSubscriptionDays": 56, "itemId": "tbxjTwfq", "itemName": "Cy88O1sY", "quantity": 10}], "maxRedeemCountPerCampaignPerUser": 6, "maxRedeemCountPerCode": 77, "maxRedeemCountPerCodePerUser": 41, "maxSaleCount": 89, "name": "EmATcU9X", "redeemEnd": "1974-04-13T00:00:00Z", "redeemStart": "1988-08-01T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["WdmLYrBx", "wQSw3PC6", "UV1LYuSo"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'PXoflqeF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'MuShyBZm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wEyhU5HY", "discountConfig": {"categories": [{"categoryPath": "bm7m0NNN", "includeSubCategories": true}, {"categoryPath": "DBrkAWE2", "includeSubCategories": false}, {"categoryPath": "h8Au85jw", "includeSubCategories": false}], "currencyCode": "HhPQbchn", "currencyNamespace": "M2nhzWTY", "discountAmount": 49, "discountPercentage": 67, "discountType": "PERCENTAGE", "items": [{"itemId": "PXQZ22x5", "itemName": "97nHY0tf"}, {"itemId": "LxH1qKcA", "itemName": "Twge3lRB"}, {"itemId": "GoyNVomv", "itemName": "VFjjQeuW"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 60, "itemId": "sgABEOQq", "itemName": "LrPXwMj1", "quantity": 18}, {"extraSubscriptionDays": 23, "itemId": "9PC4wtnD", "itemName": "JJwiOU6K", "quantity": 51}, {"extraSubscriptionDays": 100, "itemId": "UUjlEhGo", "itemName": "LgXxws72", "quantity": 10}], "maxRedeemCountPerCampaignPerUser": 36, "maxRedeemCountPerCode": 71, "maxRedeemCountPerCodePerUser": 28, "maxSaleCount": 86, "name": "9vJs6qdZ", "redeemEnd": "1975-01-16T00:00:00Z", "redeemStart": "1981-03-29T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["jJiylmtk", "X4PJKoDq", "u91dUxoI"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'g4hDs2UV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "PfdsPnVD", "oldName": "DyIbXhis"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'oP5mo1kQ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'B4YIiT9L' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'LUzf5AkG' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "CAMPAIGN"]}' \
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
    --body '{"appConfig": {"appName": "rINCB30K"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "VcjYG07d"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "QmFOkQB4"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "fRP8V0oS"}, "extendType": "APP"}' \
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
    --storeId 'ylFNFHL0' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CkOtdPsF' \
    --body '{"categoryPath": "xvQeTrS8", "localizationDisplayNames": {"rFZ8QnDy": "DhNQfisK", "w5DxkUQs": "TiglR9Pp", "vYQjJMDb": "pF5jae8D"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w7bFMU47' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'KmApkXGM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v0MN29o3' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'QfxWIcWE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GVupCSY7' \
    --body '{"localizationDisplayNames": {"fNpcIpDn": "VoZPopHA", "MrPdc41p": "vAqcEf8V", "QhyJGLnX": "J9rP5ctq"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'WH0tfp99' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0Tf13WSv' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'jiCKRPfe' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KiaYjO0r' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '3yLtdSK5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C4KbNHKP' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'IAiIEpO8' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName '6RNXXNjv' \
    --batchNo '54,97,38' \
    --code 'ExegQmjf' \
    --limit '27' \
    --offset '72' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'lDOQhSid' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "RRLVHLex", "codeValue": "6ct6O7Bx", "quantity": 3}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '0UXyz1fx' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'u7RSmAS6' \
    --batchNo '92,67,5' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'FRo31xmx' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'TK1HT1vV' \
    --batchNo '67,92,99' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'dx6r7NKZ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'azb9gUyN' \
    --batchNo '55,19,81' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'hSAuQHbE' \
    --namespace "$AB_NAMESPACE" \
    --code 'AfM6nvFY' \
    --limit '70' \
    --offset '63' \
    --userId 'tlCUApee' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '0sWa02N1' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'YGR22QBo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'a3QeNIeA' \
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
    --body '{"currencyCode": "fUYXUran", "currencySymbol": "xhIHFuMg", "currencyType": "REAL", "decimals": 12, "localizationDescriptions": {"1unq9kpl": "lxVNf11A", "WPSo5EdI": "tqwg6Bh0", "m8qPBrdU": "iNzN1ota"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'rW4LJ3oV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"WZihpAzQ": "3z78WT1P", "FhbZTbpd": "QEDN6ClL", "7S05pHXs": "ZETIT2m7"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '6TfPm6Ec' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'zW5ch8Bv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'HT3jWxKO' \
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
    --body '{"data": [{"id": "V3mpU4yl", "rewards": [{"currency": {"currencyCode": "BRjv5iSq", "namespace": "FgG66lFe"}, "item": {"itemId": "IYoqAK8h", "itemName": "ctRgoTRx", "itemSku": "NvZroBBQ", "itemType": "MRbMOYVa"}, "quantity": 29, "type": "CURRENCY"}, {"currency": {"currencyCode": "BTYZQ2dP", "namespace": "ZXmhUDq4"}, "item": {"itemId": "CrgugQul", "itemName": "P94FPl2X", "itemSku": "j975CaNi", "itemType": "4Dy0KjCB"}, "quantity": 8, "type": "CURRENCY"}, {"currency": {"currencyCode": "4OfQGagI", "namespace": "5PjwoVOB"}, "item": {"itemId": "pu7MnCeS", "itemName": "8z3yspGm", "itemSku": "CgdkR0tx", "itemType": "Fage1TH8"}, "quantity": 9, "type": "ITEM"}]}, {"id": "UpaT4lMu", "rewards": [{"currency": {"currencyCode": "eYC9Qk8f", "namespace": "mGE1RgS1"}, "item": {"itemId": "qtylsB6Y", "itemName": "qgIAtPH6", "itemSku": "lZRlfdKQ", "itemType": "cJqOjQxl"}, "quantity": 17, "type": "CURRENCY"}, {"currency": {"currencyCode": "2HoOJKHr", "namespace": "b0bLtaDj"}, "item": {"itemId": "3kHV1mgZ", "itemName": "7gjwsTpo", "itemSku": "JuK5QaC2", "itemType": "9IGB2dP8"}, "quantity": 27, "type": "CURRENCY"}, {"currency": {"currencyCode": "qy1yUf1N", "namespace": "mzzx5M5p"}, "item": {"itemId": "UYNWJp40", "itemName": "REgy4P3v", "itemSku": "VZG6KKPp", "itemType": "51g2hHny"}, "quantity": 35, "type": "CURRENCY"}]}, {"id": "5yM5vAbk", "rewards": [{"currency": {"currencyCode": "hXuleyIg", "namespace": "wepnZsbp"}, "item": {"itemId": "6rtnpc9e", "itemName": "5pbU8RaD", "itemSku": "UXP98jHo", "itemType": "amT57lRA"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "Hzph2R1s", "namespace": "vq7SLWIt"}, "item": {"itemId": "fCK52Som", "itemName": "1pVzpnK2", "itemSku": "rhoiO7R2", "itemType": "MuLZTFCO"}, "quantity": 69, "type": "ITEM"}, {"currency": {"currencyCode": "qzolgtMX", "namespace": "Ajgvr1rI"}, "item": {"itemId": "uFxTLhZp", "itemName": "6BWgBAoq", "itemSku": "MtPR0u2y", "itemType": "GOLunphj"}, "quantity": 38, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"mYUMeLwl": "RyxazI2K", "kDsFGFrT": "QP9f10jN", "Be2iOWcV": "zEb2eQLw"}}, {"platform": "XBOX", "platformDlcIdMap": {"roYJvLSu": "QXNjFfg1", "vACq9Myw": "FhCdqWNb", "VyQfbkIP": "gZj64DAK"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"lE8UwG7W": "b6ONNEfe", "Ytl4rKLT": "QaOsFr5E", "VKgP8HPW": "2Xyk9iFV"}}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePlatformDLCConfig' test.out

#- 62 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeletePlatformDLCConfig' test.out

#- 63 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName '5aSrlVoU' \
    --itemId 'YHnNyjj6,Zqdoe1Ac,XiF5hZlQ' \
    --limit '51' \
    --offset '2' \
    --origin 'Playstation' \
    --userId 'gWUmQTQn' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'aCL9kNAY,QEfjuFuN,vWLvsQwa' \
    --limit '29' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 64 'QueryEntitlements' test.out

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
    --body '{"entitlementGrantList": [{"collectionId": "dy5kEBxd", "endDate": "1975-07-20T00:00:00Z", "grantedCode": "jc9H5xm9", "itemId": "5SMVovTR", "itemNamespace": "hYLh3Dhv", "language": "sBzX", "metadata": {"pKFeYZ57": {}, "PhZ7Lkhw": {}, "ERDNZOVx": {}}, "origin": "Nintendo", "quantity": 84, "region": "sNkUr6nq", "source": "REDEEM_CODE", "startDate": "1985-08-24T00:00:00Z", "storeId": "y8cXcluW"}, {"collectionId": "fyQXJjyV", "endDate": "1989-03-07T00:00:00Z", "grantedCode": "R3AJBXQ7", "itemId": "smsqmnlx", "itemNamespace": "1pOfWZv5", "language": "byA_ZpAZ", "metadata": {"Za8jgnXW": {}, "vhNCiWBR": {}, "nFZkLxgU": {}}, "origin": "Playstation", "quantity": 14, "region": "6ifSMYqX", "source": "OTHER", "startDate": "1996-11-29T00:00:00Z", "storeId": "ZuWqsuCk"}, {"collectionId": "EnyoxrZf", "endDate": "1992-02-20T00:00:00Z", "grantedCode": "iFPK40YS", "itemId": "YRWrJspm", "itemNamespace": "WqQpWEUI", "language": "mA_ZCqJ", "metadata": {"PMhivk43": {}, "Yu8nBrkE": {}, "EzcM0iqq": {}}, "origin": "Nintendo", "quantity": 18, "region": "Nd3kEbVg", "source": "ACHIEVEMENT", "startDate": "1978-08-02T00:00:00Z", "storeId": "yFJHCbDl"}], "userIds": ["LjV47D5a", "lkRWKveb", "qdRTgl45"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["fGb0MEvg", "UP7ABv7E", "tRnPP9Go"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'o4YGkCgW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '70' \
    --status 'FAIL' \
    --userId 'Q3z0sgXO' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'wsf3gZP7' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'Aw3UD3gO' \
    --limit '74' \
    --offset '1' \
    --startTime 'w1Hbsdz7' \
    --status 'FAIL' \
    --userId 'gApjcizJ' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "mkWjSHUw", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 50, "clientTransactionId": "J6dJ1yCC"}, {"amountConsumed": 98, "clientTransactionId": "KZqGV5ti"}, {"amountConsumed": 68, "clientTransactionId": "heY51Lxf"}], "entitlementId": "QGXkHYxP", "usageCount": 44}, {"clientTransaction": [{"amountConsumed": 74, "clientTransactionId": "JQkQHmgW"}, {"amountConsumed": 28, "clientTransactionId": "1TdTzGvh"}, {"amountConsumed": 31, "clientTransactionId": "E0YazLx0"}], "entitlementId": "APW0tkRy", "usageCount": 82}, {"clientTransaction": [{"amountConsumed": 43, "clientTransactionId": "pKJ9olgl"}, {"amountConsumed": 25, "clientTransactionId": "LZNE9gmW"}, {"amountConsumed": 15, "clientTransactionId": "8sqMRti1"}], "entitlementId": "zRtG3Z0n", "usageCount": 97}], "purpose": "nBqjFcf5"}, "originalTitleName": "15YfMQpJ", "paymentProductSKU": "5DnsSqv2", "purchaseDate": "m6jzbets", "sourceOrderItemId": "6edqbac4", "titleName": "lPt70mVx"}, "eventDomain": "ceLqBkEf", "eventSource": "FI9zQlCi", "eventType": "dTlRpIMg", "eventVersion": 39, "id": "qBiGaLXG", "timestamp": "ArVlRXvi"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "X6GlkSRr", "eventState": "gLedj2Gl", "lineItemId": "FvY3Vs5j", "orderId": "HdpYKbpD", "productId": "yZnJzpL4", "productType": "t4rxtGS6", "purchasedDate": "bJZJo1ui", "sandboxId": "xATNX2OX", "skuId": "8jy8GmtL", "subscriptionData": {"consumedDurationInDays": 51, "dateTime": "T5dqL50Z", "durationInDays": 14, "recurrenceId": "DMNbMWil"}}, "datacontenttype": "Crz6VQ30", "id": "1RSRFPCM", "source": "cqI4z8DD", "specVersion": "xZLV4kza", "subject": "36C8Hr5Z", "time": "n13XPf94", "traceparent": "dW19ziiJ", "type": "lGQCP2X1"}' \
    > test.out 2>&1
eval_tap $? 73 'MockXblClawbackEvent' test.out

#- 74 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetAppleIAPConfig' test.out

#- 75 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 60, "bundleId": "yS8BaY3G", "issuerId": "Fzd5h9Wd", "keyId": "ZES7mpGk", "password": "Yk4NrQOa", "version": "V1"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateAppleIAPConfig' test.out

#- 76 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteAppleIAPConfig' test.out

#- 77 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 77 'UpdateAppleP8File' test.out

#- 78 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetEpicGamesIAPConfig' test.out

#- 79 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "VCltvlA3"}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateEpicGamesIAPConfig' test.out

#- 80 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'DeleteEpicGamesIAPConfig' test.out

#- 81 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetGoogleIAPConfig' test.out

#- 82 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "GRbmtoR2", "notificationTokenAudience": "xAILuxWV", "notificationTokenEmail": "lggFisCP", "packageName": "s6iphznX", "serviceAccountId": "2FPd1nTD"}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateGoogleIAPConfig' test.out

#- 83 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteGoogleIAPConfig' test.out

#- 84 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 84 'UpdateGoogleP12File' test.out

#- 85 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetIAPItemConfig' test.out

#- 86 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "158ukkgi", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"7od2Q7S6": "NENs7LzV", "3M1a96GX": "YOZmlyWW", "TTyepV97": "e0dGTtqM"}}, {"itemIdentity": "v803R7S2", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"eM3gnPZH": "tuFgAbBm", "SG8ez8de": "yDj4TWJF", "Vd0qxsGW": "RzBgWxpJ"}}, {"itemIdentity": "JXCNacgo", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"989vR5Zb": "BYy9Gm6l", "YXQFCl8T": "D8hqIayR", "soi3lOmV": "Zsj6ifVh"}}]}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateIAPItemConfig' test.out

#- 87 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteIAPItemConfig' test.out

#- 88 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetOculusIAPConfig' test.out

#- 89 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "C8wxJ3Pj", "appSecret": "0qD37oTq"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateOculusIAPConfig' test.out

#- 90 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteOculusIAPConfig' test.out

#- 91 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetPlayStationIAPConfig' test.out

#- 92 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "UqifJOy9", "backOfficeServerClientSecret": "flbaU5MT", "enableStreamJob": false, "environment": "mnICXRkM", "streamName": "TTnBNoiz", "streamPartnerName": "nfxvVW7Y"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdatePlaystationIAPConfig' test.out

#- 93 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeletePlaystationIAPConfig' test.out

#- 94 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'ValidateExistedPlaystationIAPConfig' test.out

#- 95 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "jZTEfx8J", "backOfficeServerClientSecret": "HD8Ii9U1", "enableStreamJob": false, "environment": "JptCOX9J", "streamName": "r05vXgsW", "streamPartnerName": "QaIutlTy"}' \
    > test.out 2>&1
eval_tap $? 95 'ValidatePlaystationIAPConfig' test.out

#- 96 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetSteamIAPConfig' test.out

#- 97 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "Vu0iDFNF", "env": "LIVE", "publisherAuthenticationKey": "vs9VAjvK", "syncMode": "TRANSACTION"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateSteamIAPConfig' test.out

#- 98 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteSteamIAPConfig' test.out

#- 99 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'GetTwitchIAPConfig' test.out

#- 100 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "7OTgrRmi", "clientSecret": "qyf3IeYO", "organizationId": "gPNkHPwi"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateTwitchIAPConfig' test.out

#- 101 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'DeleteTwitchIAPConfig' test.out

#- 102 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'GetXblIAPConfig' test.out

#- 103 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": true, "entraAppClientId": "GjyRugZf", "entraAppClientSecret": "Aj4ZQ1eZ", "entraTenantId": "OeBb8NuB", "relyingPartyCert": "hxoE6Lt5"}' \
    > test.out 2>&1
eval_tap $? 103 'UpdateXblIAPConfig' test.out

#- 104 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'DeleteXblAPConfig' test.out

#- 105 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'Zskxo0D3' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'pdF97Mbh' \
    --externalId '1azOFg1E' \
    --limit '98' \
    --offset '76' \
    --source 'PLAYSTATION' \
    --startDate 'SXlco1wp' \
    --status 'PROCESSED' \
    --type 'ZgqFo83h' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '37' \
    --orderId 'RCOP5piN' \
    --steamId 'UaMa1062' \
    > test.out 2>&1
eval_tap $? 107 'QueryAbnormalTransactions' test.out

#- 108 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'AdminGetSteamJobInfo' test.out

#- 109 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "LIVE", "lastTime": "1976-08-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminResetSteamJobTime' test.out

#- 110 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'mtUWXhRn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminRefundIAPOrder' test.out

#- 111 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '96' \
    --orderId 'NyX2QlBj' \
    --processStatus 'IGNORED' \
    --steamId 'nb1Hug8X' \
    > test.out 2>&1
eval_tap $? 111 'QuerySteamReportHistories' test.out

#- 112 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'YeW5fkXS' \
    --limit '51' \
    --offset '43' \
    --platform 'APPLE' \
    --productId 'mM4NgMjA' \
    --userId 'HNFzdkC1' \
    > test.out 2>&1
eval_tap $? 112 'QueryThirdPartySubscription' test.out

#- 113 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo '5Z6jmCEc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetIAPOrderConsumeDetails' test.out

#- 114 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'qK5aswOC' \
    --feature 'tlR5YGDb' \
    --itemId 'ppNfrFRd' \
    --itemType 'BUNDLE' \
    --startTime 'ZMAdU0C4' \
    > test.out 2>&1
eval_tap $? 114 'DownloadInvoiceDetails' test.out

#- 115 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime '6ET2FHgj' \
    --feature '9TV95CLV' \
    --itemId 'lTH3MGVB' \
    --itemType 'CODE' \
    --startTime 'OVqjW5pu' \
    > test.out 2>&1
eval_tap $? 115 'GenerateInvoiceSummary' test.out

#- 116 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U4SJLVOe' \
    --body '{"categoryPath": "03qRu5a9", "targetItemId": "eFfldrzC", "targetNamespace": "IHOqVayF"}' \
    > test.out 2>&1
eval_tap $? 116 'SyncInGameItem' test.out

#- 117 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PY2u8v8x' \
    --body '{"appId": "j8cj0xhn", "appType": "DEMO", "baseAppId": "RU90k6LY", "boothName": "2PoO1aTP", "categoryPath": "E9n95uae", "clazz": "RLcvXBSK", "displayOrder": 19, "entitlementType": "CONSUMABLE", "ext": {"skJcySYy": {}, "JRbcQtJj": {}, "G6T7aNFs": {}}, "features": ["e2HRNEEm", "H5WQrNOi", "aBkRRGHA"], "flexible": true, "images": [{"as": "quHSB8pG", "caption": "Ws7xHzRR", "height": 20, "imageUrl": "ej81ZtdU", "smallImageUrl": "eXT3Nhpe", "width": 94}, {"as": "8ipN0K7W", "caption": "mA0UxMhV", "height": 99, "imageUrl": "9EV9bsh0", "smallImageUrl": "6vpzRUSu", "width": 48}, {"as": "NzAsU0PV", "caption": "adFxsYMc", "height": 59, "imageUrl": "Yr6pxV90", "smallImageUrl": "f9cgMuKU", "width": 85}], "inventoryConfig": {"customAttributes": {"KSrsIGdv": {}, "VxjAzyOm": {}, "wtzrMi5c": {}}, "serverCustomAttributes": {"bLg2bwKm": {}, "AvFhkBh1": {}, "uZoSRhe2": {}}, "slotUsed": 18}, "itemIds": ["a7beEOE0", "zqyGeh4G", "48LKMuTr"], "itemQty": {"YCfm3TxU": 53, "kcFkFFIQ": 9, "DEWGqpsp": 47}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"G5LCPdSY": {"description": "tMMDknOD", "localExt": {"33Gg4J9e": {}, "v8pig1T2": {}, "0w0jSnM1": {}}, "longDescription": "xtoNFUoc", "title": "L0sIB1yo"}, "RTp81GYw": {"description": "6723P9Lj", "localExt": {"rye4AK5I": {}, "ktR21eUP": {}, "RObCtqH6": {}}, "longDescription": "KbsG6pNn", "title": "cz4p2zNx"}, "SKklIhhg": {"description": "EXo37rTI", "localExt": {"mNdGluXW": {}, "7VN1L05b": {}, "iGXhgs1A": {}}, "longDescription": "SrlnIShm", "title": "3bwSTidn"}}, "lootBoxConfig": {"rewardCount": 29, "rewards": [{"lootBoxItems": [{"count": 40, "duration": 49, "endDate": "1993-04-02T00:00:00Z", "itemId": "IRBAIJoy", "itemSku": "S7DPhNx4", "itemType": "m3j0ibqz"}, {"count": 100, "duration": 27, "endDate": "1976-10-27T00:00:00Z", "itemId": "BJ59D8Ap", "itemSku": "xbV1q7qK", "itemType": "rVLQCAbN"}, {"count": 37, "duration": 91, "endDate": "1986-06-18T00:00:00Z", "itemId": "rRTw8R5B", "itemSku": "W5TGVtih", "itemType": "eeFMIO5Y"}], "name": "serwHIT6", "odds": 0.6586616836646204, "type": "REWARD", "weight": 17}, {"lootBoxItems": [{"count": 82, "duration": 13, "endDate": "1975-06-19T00:00:00Z", "itemId": "VlZsI7OS", "itemSku": "LswFV7yP", "itemType": "EH3KyuGC"}, {"count": 48, "duration": 74, "endDate": "1978-07-17T00:00:00Z", "itemId": "7FMeFBmE", "itemSku": "oh5PQHng", "itemType": "YnD9ClWG"}, {"count": 62, "duration": 10, "endDate": "1981-03-17T00:00:00Z", "itemId": "NuGwA5Pm", "itemSku": "T967eDf6", "itemType": "y7y2O3wG"}], "name": "yxIurgu0", "odds": 0.19446140360644226, "type": "PROBABILITY_GROUP", "weight": 38}, {"lootBoxItems": [{"count": 70, "duration": 89, "endDate": "1989-10-01T00:00:00Z", "itemId": "HYttYB0X", "itemSku": "P9fs0sLn", "itemType": "gweij7lL"}, {"count": 37, "duration": 95, "endDate": "1980-05-09T00:00:00Z", "itemId": "w5YmjGQ6", "itemSku": "kGktbjMK", "itemType": "qRWOxZk1"}, {"count": 65, "duration": 18, "endDate": "1975-12-13T00:00:00Z", "itemId": "oE1jPBOB", "itemSku": "S9x41ltX", "itemType": "MYqAJBSv"}], "name": "uOuMtwSw", "odds": 0.544671769826931, "type": "PROBABILITY_GROUP", "weight": 49}], "rollFunction": "CUSTOM"}, "maxCount": 93, "maxCountPerUser": 51, "name": "5qkqLAwW", "optionBoxConfig": {"boxItems": [{"count": 84, "duration": 92, "endDate": "1998-10-26T00:00:00Z", "itemId": "dG2KrUqC", "itemSku": "Yh0QlIVk", "itemType": "uqNzKfvr"}, {"count": 33, "duration": 19, "endDate": "1988-12-12T00:00:00Z", "itemId": "LS9j3CsS", "itemSku": "Xt91Rq5e", "itemType": "lAAoTnGr"}, {"count": 25, "duration": 78, "endDate": "1988-11-18T00:00:00Z", "itemId": "k2ew5hSn", "itemSku": "lLdp2HNM", "itemType": "KhbjEEEt"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 16, "fixedTrialCycles": 11, "graceDays": 32}, "regionData": {"0D3AOs6L": [{"currencyCode": "lygnoLHD", "currencyNamespace": "EdUbvNyY", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1990-06-27T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1986-04-16T00:00:00Z", "expireAt": "1976-12-25T00:00:00Z", "price": 56, "purchaseAt": "1980-01-29T00:00:00Z", "trialPrice": 92}, {"currencyCode": "0fthDG5w", "currencyNamespace": "7VrxXjNS", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1992-02-05T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1983-01-17T00:00:00Z", "expireAt": "1983-03-17T00:00:00Z", "price": 18, "purchaseAt": "1978-08-29T00:00:00Z", "trialPrice": 44}, {"currencyCode": "ZArZ86kZ", "currencyNamespace": "8jw2KM4u", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1979-09-14T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1985-06-23T00:00:00Z", "expireAt": "1986-03-24T00:00:00Z", "price": 18, "purchaseAt": "1979-05-15T00:00:00Z", "trialPrice": 25}], "EvDdDP54": [{"currencyCode": "WcQv2YTi", "currencyNamespace": "jGPxrN4A", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1984-09-04T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1989-08-01T00:00:00Z", "expireAt": "1977-04-17T00:00:00Z", "price": 78, "purchaseAt": "1973-01-15T00:00:00Z", "trialPrice": 24}, {"currencyCode": "zQ7oIYv9", "currencyNamespace": "wNfH4Yb7", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1991-06-30T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1986-04-17T00:00:00Z", "expireAt": "1989-11-23T00:00:00Z", "price": 99, "purchaseAt": "1999-01-12T00:00:00Z", "trialPrice": 3}, {"currencyCode": "71gBXR6W", "currencyNamespace": "jy5XN58v", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1977-11-27T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1979-08-21T00:00:00Z", "expireAt": "1984-11-03T00:00:00Z", "price": 89, "purchaseAt": "1974-07-31T00:00:00Z", "trialPrice": 49}], "pf27CYXV": [{"currencyCode": "ZwBdjayt", "currencyNamespace": "hEx7zBBo", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1983-07-12T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1972-01-06T00:00:00Z", "expireAt": "1992-07-18T00:00:00Z", "price": 76, "purchaseAt": "1998-08-02T00:00:00Z", "trialPrice": 71}, {"currencyCode": "6WHcpk5d", "currencyNamespace": "uwQxRGGU", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1982-05-16T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1999-11-15T00:00:00Z", "expireAt": "1993-09-21T00:00:00Z", "price": 14, "purchaseAt": "1996-09-05T00:00:00Z", "trialPrice": 100}, {"currencyCode": "tqcJ3Kvm", "currencyNamespace": "ULdxVV5D", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1988-11-11T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1989-05-29T00:00:00Z", "expireAt": "1981-03-28T00:00:00Z", "price": 78, "purchaseAt": "1983-09-07T00:00:00Z", "trialPrice": 74}]}, "saleConfig": {"currencyCode": "axm4Mq7j", "price": 2}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "z8xm0lED", "stackable": true, "status": "INACTIVE", "tags": ["d9BRpUes", "c2V4WDrJ", "smz8t9Sk"], "targetCurrencyCode": "hLCqMXVD", "targetNamespace": "2t9pqKaN", "thumbnailUrl": "KtL6QtOW", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 117 'CreateItem' test.out

#- 118 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aCb7r0tc' \
    --appId 'izHWjl9K' \
    > test.out 2>&1
eval_tap $? 118 'GetItemByAppId' test.out

#- 119 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'EkoTc1qz' \
    --baseAppId 'IYCsvOql' \
    --categoryPath 'BxJPzoQP' \
    --features 'ofMrjycD' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --limit '65' \
    --offset '45' \
    --region '28VByHB9' \
    --sortBy 'createdAt,displayOrder:asc,createdAt:desc' \
    --storeId 'A7vAKwOG' \
    --tags '4rkcEApD' \
    --targetNamespace 'LVvEu5Cf' \
    > test.out 2>&1
eval_tap $? 119 'QueryItems' test.out

#- 120 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'zabVaIXl,v6l67b7R,j7ZqEu5m' \
    > test.out 2>&1
eval_tap $? 120 'ListBasicItemsByFeatures' test.out

#- 121 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EpBKawXZ' \
    --itemIds 'yCGHIL5j' \
    > test.out 2>&1
eval_tap $? 121 'GetItems' test.out

#- 122 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'kkny0vhS' \
    --sku '9lbcVfqU' \
    > test.out 2>&1
eval_tap $? 122 'GetItemBySku' test.out

#- 123 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'w9Q7FmXC' \
    --populateBundle  \
    --region 'b4kM42qA' \
    --storeId '2yhrLQ46' \
    --sku '8HKPC0b9' \
    > test.out 2>&1
eval_tap $? 123 'GetLocaleItemBySku' test.out

#- 124 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '9D68gOxU' \
    --region 'MDTQCIFg' \
    --storeId 'e2erXTnl' \
    --itemIds '2GNADLgR' \
    --userId 'CvIowVno' \
    > test.out 2>&1
eval_tap $? 124 'GetEstimatedPrice' test.out

#- 125 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LbeJAcxK' \
    --sku 'InM3HXFE' \
    > test.out 2>&1
eval_tap $? 125 'GetItemIdBySku' test.out

#- 126 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'RFhSfHkF,epKapMyJ,wEqQcUus' \
    --storeId 'KFcZWWMk' \
    > test.out 2>&1
eval_tap $? 126 'GetBulkItemIdBySkus' test.out

#- 127 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '8LbpWnSV' \
    --region 'CQw8p8Rc' \
    --storeId '5grqga7G' \
    --itemIds 'iNOivJdy' \
    > test.out 2>&1
eval_tap $? 127 'BulkGetLocaleItems' test.out

#- 128 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetAvailablePredicateTypes' test.out

#- 129 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'oBqjmxpv' \
    --userId 'aEnBJP4H' \
    --body '{"itemIds": ["FxKr7esJ", "7cb606WM", "ss8r558U"]}' \
    > test.out 2>&1
eval_tap $? 129 'ValidateItemPurchaseCondition' test.out

#- 130 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'A1RHQ4l5' \
    --body '{"changes": [{"itemIdentities": ["ZEKbBwfz", "ZFV1WBqw", "5JUZM7yg"], "itemIdentityType": "ITEM_SKU", "regionData": {"aBvmoTAo": [{"currencyCode": "QcDrzPqQ", "currencyNamespace": "EGUIocBe", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1974-02-11T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1999-03-24T00:00:00Z", "discountedPrice": 17, "expireAt": "1994-01-30T00:00:00Z", "price": 89, "purchaseAt": "1990-02-28T00:00:00Z", "trialPrice": 13}, {"currencyCode": "VHqkbOx2", "currencyNamespace": "mTlwW0XL", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1986-07-26T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1977-01-22T00:00:00Z", "discountedPrice": 59, "expireAt": "1978-11-19T00:00:00Z", "price": 15, "purchaseAt": "1997-05-07T00:00:00Z", "trialPrice": 95}, {"currencyCode": "V03r3gx8", "currencyNamespace": "KYLMPm7q", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1982-08-05T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1973-04-06T00:00:00Z", "discountedPrice": 6, "expireAt": "1996-04-07T00:00:00Z", "price": 88, "purchaseAt": "1978-06-17T00:00:00Z", "trialPrice": 36}], "CZXH6yx5": [{"currencyCode": "Uq2MKrqy", "currencyNamespace": "F1gXnrEs", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1999-02-12T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1997-04-21T00:00:00Z", "discountedPrice": 25, "expireAt": "1975-01-22T00:00:00Z", "price": 87, "purchaseAt": "1992-03-05T00:00:00Z", "trialPrice": 43}, {"currencyCode": "eW8o8Xyb", "currencyNamespace": "5oZxnQo5", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1991-06-04T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1992-12-05T00:00:00Z", "discountedPrice": 36, "expireAt": "1998-07-28T00:00:00Z", "price": 36, "purchaseAt": "1993-01-02T00:00:00Z", "trialPrice": 3}, {"currencyCode": "xUSVK7hy", "currencyNamespace": "f11bjoZ0", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1977-08-15T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1975-10-30T00:00:00Z", "discountedPrice": 42, "expireAt": "1993-06-15T00:00:00Z", "price": 11, "purchaseAt": "1995-02-26T00:00:00Z", "trialPrice": 70}], "3YdyxVHt": [{"currencyCode": "9Cat2JqI", "currencyNamespace": "cRAQTNra", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1976-03-10T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1971-12-11T00:00:00Z", "discountedPrice": 96, "expireAt": "1989-03-30T00:00:00Z", "price": 41, "purchaseAt": "1994-08-31T00:00:00Z", "trialPrice": 5}, {"currencyCode": "B9okQxUI", "currencyNamespace": "C2a8xuH6", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1983-07-04T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1992-07-08T00:00:00Z", "discountedPrice": 96, "expireAt": "1987-08-17T00:00:00Z", "price": 85, "purchaseAt": "1972-03-16T00:00:00Z", "trialPrice": 35}, {"currencyCode": "dmJ7nNys", "currencyNamespace": "CFtjUo4r", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1975-11-15T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1991-03-26T00:00:00Z", "discountedPrice": 54, "expireAt": "1995-07-20T00:00:00Z", "price": 85, "purchaseAt": "1980-07-10T00:00:00Z", "trialPrice": 50}]}}, {"itemIdentities": ["NtORExc1", "iFzlnSc7", "g6eYzCti"], "itemIdentityType": "ITEM_SKU", "regionData": {"fodzqmxJ": [{"currencyCode": "egPXHuhG", "currencyNamespace": "phHn4UKe", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1986-11-03T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1973-04-30T00:00:00Z", "discountedPrice": 28, "expireAt": "1990-11-11T00:00:00Z", "price": 99, "purchaseAt": "1985-03-09T00:00:00Z", "trialPrice": 79}, {"currencyCode": "NflYKokQ", "currencyNamespace": "w3Lgxun1", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1988-10-21T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1990-07-12T00:00:00Z", "discountedPrice": 11, "expireAt": "1994-05-17T00:00:00Z", "price": 41, "purchaseAt": "1995-03-25T00:00:00Z", "trialPrice": 33}, {"currencyCode": "Cp8nSjip", "currencyNamespace": "GuA7ZtTR", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1976-05-30T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1979-03-15T00:00:00Z", "discountedPrice": 21, "expireAt": "1980-05-01T00:00:00Z", "price": 49, "purchaseAt": "1995-04-16T00:00:00Z", "trialPrice": 45}], "xhZPuHJs": [{"currencyCode": "PBebY3S0", "currencyNamespace": "LfHhrA1u", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1989-09-05T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1992-04-27T00:00:00Z", "discountedPrice": 84, "expireAt": "1996-02-25T00:00:00Z", "price": 91, "purchaseAt": "1997-12-22T00:00:00Z", "trialPrice": 42}, {"currencyCode": "PSEws0PH", "currencyNamespace": "Ox1xXxdl", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1988-03-21T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1982-07-24T00:00:00Z", "discountedPrice": 70, "expireAt": "1997-09-13T00:00:00Z", "price": 74, "purchaseAt": "1983-10-12T00:00:00Z", "trialPrice": 16}, {"currencyCode": "NDqyUUSz", "currencyNamespace": "Cgk8nThH", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1975-12-29T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1975-10-04T00:00:00Z", "discountedPrice": 66, "expireAt": "1982-11-28T00:00:00Z", "price": 87, "purchaseAt": "1976-06-03T00:00:00Z", "trialPrice": 13}], "tXDwN9BN": [{"currencyCode": "3MSMFoYT", "currencyNamespace": "cfEnFj3R", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1984-05-04T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1976-06-03T00:00:00Z", "discountedPrice": 38, "expireAt": "1975-07-06T00:00:00Z", "price": 6, "purchaseAt": "1999-04-23T00:00:00Z", "trialPrice": 9}, {"currencyCode": "LBCVAhhx", "currencyNamespace": "hcYP6pmb", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1989-07-29T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1998-07-09T00:00:00Z", "discountedPrice": 18, "expireAt": "1979-12-02T00:00:00Z", "price": 47, "purchaseAt": "1975-01-16T00:00:00Z", "trialPrice": 12}, {"currencyCode": "RGqRgTS1", "currencyNamespace": "PSca21Hx", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1993-12-10T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-06-15T00:00:00Z", "discountedPrice": 58, "expireAt": "1974-04-18T00:00:00Z", "price": 46, "purchaseAt": "1971-08-06T00:00:00Z", "trialPrice": 8}]}}, {"itemIdentities": ["9QYDF3s0", "h2dOgN7L", "SCXF5xmv"], "itemIdentityType": "ITEM_ID", "regionData": {"60IeZybr": [{"currencyCode": "cKF1Xr6f", "currencyNamespace": "L1L9TwzO", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1985-05-09T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1985-05-13T00:00:00Z", "discountedPrice": 28, "expireAt": "1982-07-30T00:00:00Z", "price": 99, "purchaseAt": "1989-05-30T00:00:00Z", "trialPrice": 69}, {"currencyCode": "W2FYvL7Q", "currencyNamespace": "Nkz83GT4", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1977-06-27T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1986-12-27T00:00:00Z", "discountedPrice": 45, "expireAt": "1997-05-24T00:00:00Z", "price": 9, "purchaseAt": "1978-03-08T00:00:00Z", "trialPrice": 47}, {"currencyCode": "7vXo9KNk", "currencyNamespace": "pR9e29nD", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1995-08-29T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1992-01-25T00:00:00Z", "discountedPrice": 25, "expireAt": "1985-02-08T00:00:00Z", "price": 69, "purchaseAt": "1983-07-18T00:00:00Z", "trialPrice": 72}], "J5wMQchw": [{"currencyCode": "CDr51SI3", "currencyNamespace": "l6L2iJFa", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1977-09-22T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1988-10-24T00:00:00Z", "discountedPrice": 45, "expireAt": "1976-05-05T00:00:00Z", "price": 31, "purchaseAt": "1980-02-13T00:00:00Z", "trialPrice": 73}, {"currencyCode": "SrsCYsZn", "currencyNamespace": "R99C9Ghy", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1971-05-17T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1972-05-14T00:00:00Z", "discountedPrice": 30, "expireAt": "1995-05-30T00:00:00Z", "price": 23, "purchaseAt": "1995-01-01T00:00:00Z", "trialPrice": 92}, {"currencyCode": "uZJ0CWcT", "currencyNamespace": "nk1BILQ6", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1976-12-27T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1982-11-17T00:00:00Z", "discountedPrice": 82, "expireAt": "1999-06-15T00:00:00Z", "price": 1, "purchaseAt": "1995-05-20T00:00:00Z", "trialPrice": 96}], "KmRtZabw": [{"currencyCode": "D5hv1Six", "currencyNamespace": "DERgmmwG", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1993-12-04T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1995-04-11T00:00:00Z", "discountedPrice": 19, "expireAt": "1991-03-05T00:00:00Z", "price": 48, "purchaseAt": "1985-09-21T00:00:00Z", "trialPrice": 73}, {"currencyCode": "9rBMendJ", "currencyNamespace": "LXruDb8H", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1978-02-25T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1982-04-25T00:00:00Z", "discountedPrice": 90, "expireAt": "1992-09-20T00:00:00Z", "price": 28, "purchaseAt": "1977-03-13T00:00:00Z", "trialPrice": 4}, {"currencyCode": "BGOKOhoP", "currencyNamespace": "xDNlYroy", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1985-11-30T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1985-01-07T00:00:00Z", "discountedPrice": 21, "expireAt": "1998-07-21T00:00:00Z", "price": 70, "purchaseAt": "1977-02-19T00:00:00Z", "trialPrice": 56}]}}]}' \
    > test.out 2>&1
eval_tap $? 130 'BulkUpdateRegionData' test.out

#- 131 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '60' \
    --offset '93' \
    --sortBy 'TNBLyfDA' \
    --storeId 'onijeTzF' \
    --keyword 'jDfgJjsx' \
    --language '4zdVNVX9' \
    > test.out 2>&1
eval_tap $? 131 'SearchItems' test.out

#- 132 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '50' \
    --offset '25' \
    --sortBy 'updatedAt,updatedAt:asc,name' \
    --storeId 'fCSEZ9p3' \
    > test.out 2>&1
eval_tap $? 132 'QueryUncategorizedItems' test.out

#- 133 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'r6UDhFyR' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'y7vDYpk5' \
    > test.out 2>&1
eval_tap $? 133 'GetItem' test.out

#- 134 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'yiW7SGgP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bdLMy5fu' \
    --body '{"appId": "ksHUspGD", "appType": "DEMO", "baseAppId": "0ulGpiIA", "boothName": "baXnU4eR", "categoryPath": "mcsQslAJ", "clazz": "ELsxTTsW", "displayOrder": 24, "entitlementType": "CONSUMABLE", "ext": {"f1YMj7pa": {}, "XXpUZBCZ": {}, "eSSMPsw6": {}}, "features": ["djGxNmW5", "HpTpa4Ec", "V2WLBzl2"], "flexible": true, "images": [{"as": "apkvY9jJ", "caption": "gHHFurUm", "height": 36, "imageUrl": "fiVUvYTh", "smallImageUrl": "0DDKzZrV", "width": 31}, {"as": "tJXsh6Qb", "caption": "J6FleXlC", "height": 71, "imageUrl": "U24jre2u", "smallImageUrl": "ylvi23KY", "width": 1}, {"as": "uWqbUW9Z", "caption": "CFEz8Lab", "height": 70, "imageUrl": "u7Tb5r4B", "smallImageUrl": "fUCOuvGe", "width": 97}], "inventoryConfig": {"customAttributes": {"UySZvbLO": {}, "9Ws1AGoa": {}, "M0EdmoA9": {}}, "serverCustomAttributes": {"33O7XFvR": {}, "AacGf3P2": {}, "J3NC5O8r": {}}, "slotUsed": 41}, "itemIds": ["m9gCrMrG", "j3dmDxMV", "ie4Msntr"], "itemQty": {"t8dl1QOO": 61, "BPhWq7YU": 24, "dMwwE9hX": 29}, "itemType": "MEDIA", "listable": false, "localizations": {"2XS3RLbL": {"description": "aUwfEHGw", "localExt": {"9zwHA2R8": {}, "UwLxHfAD": {}, "9pQqQUH8": {}}, "longDescription": "fNofmYTD", "title": "soonFtTg"}, "h91GVSIM": {"description": "UFPyg1mn", "localExt": {"S9URuGyJ": {}, "RHrb5YBu": {}, "XtoJApt5": {}}, "longDescription": "TMiSzkYk", "title": "ewRfQDGu"}, "KtJMIH9B": {"description": "BGPv4zd7", "localExt": {"9RLcMdEJ": {}, "IIA3S0Kr": {}, "fGIoDLdR": {}}, "longDescription": "5UEw1UeX", "title": "YQOb3W8w"}}, "lootBoxConfig": {"rewardCount": 99, "rewards": [{"lootBoxItems": [{"count": 32, "duration": 98, "endDate": "1995-11-18T00:00:00Z", "itemId": "oEOdGrkU", "itemSku": "CHziUERW", "itemType": "8wPhuKcl"}, {"count": 11, "duration": 41, "endDate": "1978-11-13T00:00:00Z", "itemId": "wxRVURbU", "itemSku": "ATYUkD9G", "itemType": "s6J3yc74"}, {"count": 62, "duration": 19, "endDate": "1993-10-17T00:00:00Z", "itemId": "nda4ZpbT", "itemSku": "UHCljdHy", "itemType": "GhLL0M9I"}], "name": "4Ixz2La2", "odds": 0.3638658767795636, "type": "REWARD_GROUP", "weight": 27}, {"lootBoxItems": [{"count": 87, "duration": 35, "endDate": "1992-08-25T00:00:00Z", "itemId": "SXhalhnA", "itemSku": "ZjlTmi1p", "itemType": "BDqhIaUY"}, {"count": 98, "duration": 40, "endDate": "1999-08-04T00:00:00Z", "itemId": "161KlH4m", "itemSku": "2JQBZz4Y", "itemType": "QxiuMwMU"}, {"count": 17, "duration": 69, "endDate": "1984-06-27T00:00:00Z", "itemId": "1If5NCnC", "itemSku": "xNL0vfYp", "itemType": "gY0WDSGe"}], "name": "4dHBBdG4", "odds": 0.11558792768216974, "type": "PROBABILITY_GROUP", "weight": 70}, {"lootBoxItems": [{"count": 31, "duration": 50, "endDate": "1980-02-18T00:00:00Z", "itemId": "gv58f1af", "itemSku": "IyJPAhl9", "itemType": "aoMKrTN0"}, {"count": 78, "duration": 94, "endDate": "1979-08-23T00:00:00Z", "itemId": "u3BW15IO", "itemSku": "lTqnatvc", "itemType": "esdHwxnn"}, {"count": 33, "duration": 82, "endDate": "1996-05-29T00:00:00Z", "itemId": "bKZeI9L9", "itemSku": "sLZz21vt", "itemType": "zompbbTN"}], "name": "mfFFpSbm", "odds": 0.12516766469999752, "type": "REWARD_GROUP", "weight": 58}], "rollFunction": "DEFAULT"}, "maxCount": 69, "maxCountPerUser": 36, "name": "1XHZvsp3", "optionBoxConfig": {"boxItems": [{"count": 77, "duration": 76, "endDate": "1980-05-23T00:00:00Z", "itemId": "xewxouSc", "itemSku": "q47jGsjs", "itemType": "yHmSDqP2"}, {"count": 86, "duration": 92, "endDate": "1978-11-18T00:00:00Z", "itemId": "9NkYJtOF", "itemSku": "2K4C0Ba8", "itemType": "fm1ecUwm"}, {"count": 21, "duration": 69, "endDate": "1979-09-08T00:00:00Z", "itemId": "B2jhhpEZ", "itemSku": "YlvU3eqW", "itemType": "Owlxxd9q"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 83, "fixedTrialCycles": 80, "graceDays": 66}, "regionData": {"ZFmBbHX3": [{"currencyCode": "RLBy54r0", "currencyNamespace": "9oywKkPT", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1988-01-02T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1997-07-11T00:00:00Z", "expireAt": "1977-07-13T00:00:00Z", "price": 63, "purchaseAt": "1997-03-15T00:00:00Z", "trialPrice": 84}, {"currencyCode": "rQvZhrCy", "currencyNamespace": "YXHTrVSa", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1982-08-31T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1996-01-17T00:00:00Z", "expireAt": "1981-09-12T00:00:00Z", "price": 70, "purchaseAt": "1989-09-26T00:00:00Z", "trialPrice": 27}, {"currencyCode": "2OBrsXIv", "currencyNamespace": "5L4OQdk8", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1997-04-04T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1977-01-14T00:00:00Z", "expireAt": "1971-02-27T00:00:00Z", "price": 40, "purchaseAt": "1987-10-12T00:00:00Z", "trialPrice": 52}], "ZAjTD9wD": [{"currencyCode": "U3241np5", "currencyNamespace": "dH4h8HRv", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1978-05-18T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1980-09-22T00:00:00Z", "expireAt": "1979-11-02T00:00:00Z", "price": 3, "purchaseAt": "1983-10-06T00:00:00Z", "trialPrice": 42}, {"currencyCode": "6yDoY6NL", "currencyNamespace": "X8wD8u03", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1971-02-24T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1996-10-13T00:00:00Z", "expireAt": "1989-08-16T00:00:00Z", "price": 7, "purchaseAt": "1976-02-17T00:00:00Z", "trialPrice": 74}, {"currencyCode": "ikaO1K8i", "currencyNamespace": "Iwg1VCjJ", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1997-04-07T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1981-07-16T00:00:00Z", "expireAt": "1977-12-20T00:00:00Z", "price": 16, "purchaseAt": "1977-04-24T00:00:00Z", "trialPrice": 69}], "kDFUhfoc": [{"currencyCode": "PkablYbw", "currencyNamespace": "OeABxjFf", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1990-05-31T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1981-06-09T00:00:00Z", "expireAt": "1997-10-12T00:00:00Z", "price": 60, "purchaseAt": "1977-02-05T00:00:00Z", "trialPrice": 77}, {"currencyCode": "mVBTVKpz", "currencyNamespace": "nOTXG5Bn", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1983-02-26T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1988-12-27T00:00:00Z", "expireAt": "1971-02-20T00:00:00Z", "price": 42, "purchaseAt": "1989-05-04T00:00:00Z", "trialPrice": 82}, {"currencyCode": "Uyrlx0SV", "currencyNamespace": "g7IU8Lp0", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1991-11-20T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1979-01-04T00:00:00Z", "expireAt": "1972-05-28T00:00:00Z", "price": 67, "purchaseAt": "1996-03-11T00:00:00Z", "trialPrice": 71}]}, "saleConfig": {"currencyCode": "fLP1ihAW", "price": 0}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "eEKN0oln", "stackable": false, "status": "ACTIVE", "tags": ["3gYaHErU", "TIg3EQyd", "5kVGSuCa"], "targetCurrencyCode": "gn4YUpx8", "targetNamespace": "lDosjh4J", "thumbnailUrl": "NKDhZc9U", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateItem' test.out

#- 135 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'quYKUdIa' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'IAP,REWARD,CAMPAIGN' \
    --force  \
    --storeId '7Tkfehsu' \
    > test.out 2>&1
eval_tap $? 135 'DeleteItem' test.out

#- 136 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'kCNfRV70' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83, "orderNo": "ZB6eDqCZ"}' \
    > test.out 2>&1
eval_tap $? 136 'AcquireItem' test.out

#- 137 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '3XQuhG5x' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Vvp6hoXn' \
    > test.out 2>&1
eval_tap $? 137 'GetApp' test.out

#- 138 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'rUeUYc0q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y2xXZWxU' \
    --body '{"carousel": [{"alt": "e0T0swJW", "previewUrl": "RveiL2cW", "thumbnailUrl": "nZsrKDQq", "type": "image", "url": "lOiTsubd", "videoSource": "vimeo"}, {"alt": "cL1PhfiU", "previewUrl": "vL8osIvi", "thumbnailUrl": "H24QgImI", "type": "video", "url": "cgfmOJVK", "videoSource": "vimeo"}, {"alt": "csfyDb9G", "previewUrl": "2h3Pn5Pf", "thumbnailUrl": "TSDaddcI", "type": "image", "url": "YN714zzo", "videoSource": "youtube"}], "developer": "ZOQdM2RE", "forumUrl": "CnQBha9c", "genres": ["FreeToPlay", "Indie", "Casual"], "localizations": {"tvtg1qPa": {"announcement": "CzxSy0tD", "slogan": "noVkse2y"}, "HNGdyiHB": {"announcement": "dMwnpPJP", "slogan": "QtEASwIH"}, "VgZ6muHa": {"announcement": "4DcxTp3C", "slogan": "fJrhiS2s"}}, "platformRequirements": {"TRwxnX7R": [{"additionals": "lva83T3i", "directXVersion": "vpoKIpVi", "diskSpace": "sq9LMLq5", "graphics": "LpeoVeGB", "label": "0KcJDpgd", "osVersion": "jj0cg4Z3", "processor": "oMkdipLD", "ram": "o3LZrAPK", "soundCard": "Ca4RjuC6"}, {"additionals": "tcx4EsQc", "directXVersion": "KDwq2FEq", "diskSpace": "1JLpjiiX", "graphics": "JZy1m7tx", "label": "RcUpDCDb", "osVersion": "wQqN3AX7", "processor": "CRLhykh1", "ram": "3MTszEV4", "soundCard": "6Pqh6eqH"}, {"additionals": "0nlITuLD", "directXVersion": "dFTKL0x2", "diskSpace": "MCmpfI8U", "graphics": "Za03VF6E", "label": "R6WZN0W7", "osVersion": "6AnMuANx", "processor": "OFz7poeD", "ram": "xf1CvjvW", "soundCard": "WkGFYqr2"}], "T86Ebkhu": [{"additionals": "Drrc69QC", "directXVersion": "aaOjk1wz", "diskSpace": "7RGHNsXA", "graphics": "wyLb4M82", "label": "S79gJDHP", "osVersion": "ebVP1H16", "processor": "LCoct9pm", "ram": "61sLqZUv", "soundCard": "eQvDukbe"}, {"additionals": "2ioSxju4", "directXVersion": "ajSgrSem", "diskSpace": "UYX0cW3l", "graphics": "WNRKfw2R", "label": "FALT0Koo", "osVersion": "rUrekQGA", "processor": "wuzLACii", "ram": "cX8xebcY", "soundCard": "ijUNcNcZ"}, {"additionals": "zIgdcMRj", "directXVersion": "u1fffvwy", "diskSpace": "34kwopcM", "graphics": "eCHS3KVO", "label": "0GrqYqgO", "osVersion": "5AJq4s2p", "processor": "zEfDaOTd", "ram": "2ePmYGEl", "soundCard": "c0uXQwCv"}], "dp6LbyRL": [{"additionals": "OwNSXCfz", "directXVersion": "569CcQdz", "diskSpace": "ikYw998u", "graphics": "QGFk2LXa", "label": "rkeKNYH9", "osVersion": "VL2SXtFL", "processor": "WRxw5p30", "ram": "Igth2fLu", "soundCard": "5iIpFA8z"}, {"additionals": "lofAdKBt", "directXVersion": "pLqN822v", "diskSpace": "uJnaEyIt", "graphics": "En8MtNle", "label": "pEPEqKF2", "osVersion": "Tyqw36Vn", "processor": "ekeYV8lz", "ram": "KynvtKs9", "soundCard": "HtG82EI8"}, {"additionals": "cba0aMJ0", "directXVersion": "c1S0tCsf", "diskSpace": "bxzJDHkE", "graphics": "KpinmK1p", "label": "DtqkvWyg", "osVersion": "t41qjAZ7", "processor": "ojD4zGKN", "ram": "hTJiBGHW", "soundCard": "l2gmcscx"}]}, "platforms": ["IOS", "MacOS", "Linux"], "players": ["LocalCoop", "MMO", "CrossPlatformMulti"], "primaryGenre": "RPG", "publisher": "46bwX37P", "releaseDate": "1997-09-02T00:00:00Z", "websiteUrl": "6Koxh734"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateApp' test.out

#- 139 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'vMFvgLok' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sWdQvkvC' \
    --body '{"featuresToCheck": ["IAP", "ENTITLEMENT", "REWARD"]}' \
    > test.out 2>&1
eval_tap $? 139 'DisableItem' test.out

#- 140 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'MnCqwi2O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetItemDynamicData' test.out

#- 141 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '457hrx95' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cu75UrHa' \
    > test.out 2>&1
eval_tap $? 141 'EnableItem' test.out

#- 142 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'y5OYHv7E' \
    --itemId 'H9HBzxy7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WVD4iec7' \
    > test.out 2>&1
eval_tap $? 142 'FeatureItem' test.out

#- 143 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'fja4hS1s' \
    --itemId 'KI15j7Ec' \
    --namespace "$AB_NAMESPACE" \
    --storeId '10smasdQ' \
    > test.out 2>&1
eval_tap $? 143 'DefeatureItem' test.out

#- 144 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '8nJ1jNVa' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'LHsRfT7k' \
    --populateBundle  \
    --region 'E8IlxVHJ' \
    --storeId '6mS5YdOP' \
    > test.out 2>&1
eval_tap $? 144 'GetLocaleItem' test.out

#- 145 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'RqwRsWU7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U6MGoGXo' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 100, "code": "6x9coiGZ", "comparison": "isNot", "name": "oqmiLG0Y", "predicateType": "SeasonTierPredicate", "value": "3i6EH4bL", "values": ["MWH6n9YR", "lbMygRW3", "xHSj0C2l"]}, {"anyOf": 15, "code": "0m16Gvr1", "comparison": "isNot", "name": "Yhozch52", "predicateType": "EntitlementPredicate", "value": "WaTAPX50", "values": ["h5IA6sRa", "ZrHrYWmS", "UV7EX7Th"]}, {"anyOf": 59, "code": "Bc8RZdEz", "comparison": "is", "name": "4atLJW0G", "predicateType": "SeasonPassPredicate", "value": "gcrRAMxu", "values": ["zURWdRzI", "sIUUx3O8", "8ZWmz8cn"]}]}, {"operator": "and", "predicates": [{"anyOf": 29, "code": "bnyAFrl5", "comparison": "isLessThan", "name": "awmop7s5", "predicateType": "SeasonPassPredicate", "value": "6VrwRlwV", "values": ["sduB8FLs", "rAqPbHMN", "VgzJ3SY0"]}, {"anyOf": 27, "code": "PRjKbPc3", "comparison": "includes", "name": "aqZRCAKE", "predicateType": "EntitlementPredicate", "value": "1zZW52lj", "values": ["8GBV2FcL", "t4HedYVL", "hFEazywE"]}, {"anyOf": 84, "code": "BA6Ic6qL", "comparison": "includes", "name": "FywGOiFo", "predicateType": "SeasonTierPredicate", "value": "WJONtXKE", "values": ["yfPJVtMW", "Vaq8JPtd", "AQd2CYVI"]}]}, {"operator": "and", "predicates": [{"anyOf": 36, "code": "sn1qI4V6", "comparison": "isLessThan", "name": "x9cxJoOR", "predicateType": "EntitlementPredicate", "value": "2KKSenwV", "values": ["gT9Ms25v", "hwVkeqfq", "yIpgeKUv"]}, {"anyOf": 43, "code": "NJeCK5jM", "comparison": "isLessThan", "name": "O6Q9BQsj", "predicateType": "SeasonPassPredicate", "value": "WoxtnU4d", "values": ["AXvA2avq", "PfbYx6jT", "Ro4jIbsI"]}, {"anyOf": 87, "code": "UfgnqaPS", "comparison": "isNot", "name": "tYSvlf8r", "predicateType": "EntitlementPredicate", "value": "A0AqXEnw", "values": ["lyj0fYhH", "p1g0we9w", "wKmMmFPa"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateItemPurchaseCondition' test.out

#- 146 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'JFAblZ4d' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,DLC,ENTITLEMENT' \
    --storeId 'LiIxuDvv' \
    > test.out 2>&1
eval_tap $? 146 'QueryItemReferences' test.out

#- 147 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'IuEOYQ3B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "LUIQOag6"}' \
    > test.out 2>&1
eval_tap $? 147 'ReturnItem' test.out

#- 148 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --name 'pJN0NZGp' \
    --offset '70' \
    --tag 'uSwfcJ3D' \
    > test.out 2>&1
eval_tap $? 148 'QueryKeyGroups' test.out

#- 149 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "iTwBagWn", "name": "WwRKVh8E", "status": "ACTIVE", "tags": ["rP7xkpxP", "SBx9mEcH", "YtjOVsaW"]}' \
    > test.out 2>&1
eval_tap $? 149 'CreateKeyGroup' test.out

#- 150 GetKeyGroupByBoothName
eval_tap 0 150 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 151 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'DWsx1oT8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetKeyGroup' test.out

#- 152 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'XS0ydTKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "gEV9tmVy", "name": "ncgD2afA", "status": "INACTIVE", "tags": ["3pkPVrbF", "xulvBfsD", "fSVxMHWC"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateKeyGroup' test.out

#- 153 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '0A03giMA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroupDynamic' test.out

#- 154 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '78vR4aQr' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '47' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 154 'ListKeys' test.out

#- 155 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'CizepjKN' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 155 'UploadKeys' test.out

#- 156 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oxFxVIKJ' \
    --limit '34' \
    --offset '29' \
    --orderNos 'FLP5oOJ8,6ZzM2RMp,CiMd1NMU' \
    --sortBy 'VxlTjnSF' \
    --startTime 'OS8M8CUA' \
    --status 'CHARGEBACK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 156 'QueryOrders' test.out

#- 157 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetOrderStatistics' test.out

#- 158 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FEl1AK1D' \
    > test.out 2>&1
eval_tap $? 158 'GetOrder' test.out

#- 159 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vc3EM0p6' \
    --body '{"description": "Zq6NSB3M"}' \
    > test.out 2>&1
eval_tap $? 159 'RefundOrder' test.out

#- 160 GetPaymentCallbackConfig
eval_tap 0 160 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 161 UpdatePaymentCallbackConfig
eval_tap 0 161 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 162 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentMerchantConfig' test.out

#- 163 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["QctEjSd7", "6Rtly5Uf", "3KwUjimD"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePaymentDomainWhitelistConfig' test.out

#- 164 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Rh4ZZsqW' \
    --externalId 'bWdaNB5i' \
    --limit '43' \
    --notificationSource 'STRIPE' \
    --notificationType 'R4xpXYft' \
    --offset '7' \
    --paymentOrderNo 'Sl6vmw4Y' \
    --startDate '1lOhPbtL' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 164 'QueryPaymentNotifications' test.out

#- 165 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Rx6rpfZy' \
    --limit '2' \
    --offset '44' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 165 'QueryPaymentOrders' test.out

#- 166 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "JiSjY7Fc", "currencyNamespace": "4Qe9qyWX", "customParameters": {"6BOOZTOC": {}, "30Ot0OZc": {}, "wiPUXZrY": {}}, "description": "pTbuHelp", "extOrderNo": "pnDqGnuI", "extUserId": "H1kLUTAx", "itemType": "APP", "language": "Lr-xpqN_Vk", "metadata": {"Am5iEuNU": "Ks6EIF5d", "MJBwrMe8": "e38yujaX", "XI8tmnbt": "wDKQ3MET"}, "notifyUrl": "QMgmJTuo", "omitNotification": true, "platform": "RMim9KR0", "price": 12, "recurringPaymentOrderNo": "efYQZiUP", "region": "clDo6ZFy", "returnUrl": "0n0xglFT", "sandbox": true, "sku": "GTMv9SrD", "subscriptionId": "xmQFMq4R", "targetNamespace": "blcfuTKf", "targetUserId": "iGBsAO4s", "title": "bvF6EO61"}' \
    > test.out 2>&1
eval_tap $? 166 'CreatePaymentOrderByDedicated' test.out

#- 167 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'Rr377qZq' \
    > test.out 2>&1
eval_tap $? 167 'ListExtOrderNoByExtTxId' test.out

#- 168 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sii25gOJ' \
    > test.out 2>&1
eval_tap $? 168 'GetPaymentOrder' test.out

#- 169 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AodcqLj1' \
    --body '{"extTxId": "zXx7LamV", "paymentMethod": "0YBc41hQ", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 169 'ChargePaymentOrder' test.out

#- 170 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vUw6Sheu' \
    --body '{"description": "YsxVvC3t"}' \
    > test.out 2>&1
eval_tap $? 170 'RefundPaymentOrderByDedicated' test.out

#- 171 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0cqOoeHn' \
    --body '{"amount": 73, "currencyCode": "m7bX4ogP", "notifyType": "CHARGE", "paymentProvider": "ADYEN", "salesTax": 54, "vat": 13}' \
    > test.out 2>&1
eval_tap $? 171 'SimulatePaymentOrderNotification' test.out

#- 172 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lsGFwS3o' \
    > test.out 2>&1
eval_tap $? 172 'GetPaymentOrderChargeStatus' test.out

#- 173 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'FvFU25Y9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "YArMHbJh", "serviceLabel": 55}' \
    > test.out 2>&1
eval_tap $? 173 'GetPsnEntitlementOwnership' test.out

#- 174 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'p2NaseeH' \
    --body '{"delegationToken": "BIri0GhJ", "sandboxId": "nJbf71lP"}' \
    > test.out 2>&1
eval_tap $? 174 'GetXboxEntitlementOwnership' test.out

#- 175 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 175 'GetPlatformEntitlementConfig' test.out

#- 176 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "Oculus", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 176 'UpdatePlatformEntitlementConfig' test.out

#- 177 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformWalletConfig' test.out

#- 178 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Steam", "Xbox", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformWalletConfig' test.out

#- 179 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 179 'ResetPlatformWalletConfig' test.out

#- 180 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'GetRevocationConfig' test.out

#- 181 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 181 'UpdateRevocationConfig' test.out

#- 182 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'DeleteRevocationConfig' test.out

#- 183 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MYfa8OhK' \
    --limit '74' \
    --offset '47' \
    --source 'DLC' \
    --startTime 'qqPitRnJ' \
    --status 'SUCCESS' \
    --transactionId '5zetLqX9' \
    --userId '2E5rZLU1' \
    > test.out 2>&1
eval_tap $? 183 'QueryRevocationHistories' test.out

#- 184 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'GetRevocationPluginConfig' test.out

#- 185 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "iXGOP0SZ"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "87CN9uQk"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 185 'UpdateRevocationPluginConfig' test.out

#- 186 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'DeleteRevocationPluginConfig' test.out

#- 187 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 187 'UploadRevocationPluginConfigCert' test.out

#- 188 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FhnY7e9o", "eventTopic": "SYItA0yk", "maxAwarded": 57, "maxAwardedPerUser": 54, "namespaceExpression": "v3utcTYq", "rewardCode": "K4FTvp8T", "rewardConditions": [{"condition": "LvgjrfrW", "conditionName": "W9Qrcmqa", "eventName": "PxP0e5tV", "rewardItems": [{"duration": 69, "endDate": "1998-06-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CsdVK1OY", "quantity": 8, "sku": "ehxyAJ6P"}, {"duration": 71, "endDate": "1973-02-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zkYJiFlh", "quantity": 65, "sku": "oQRfcXxB"}, {"duration": 76, "endDate": "1977-06-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "iZ152Zz8", "quantity": 35, "sku": "2RsMz1Ys"}]}, {"condition": "xV3JdAIG", "conditionName": "G6yXojk8", "eventName": "pfmr7Nu5", "rewardItems": [{"duration": 23, "endDate": "1989-09-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "gSM5cKQ0", "quantity": 80, "sku": "S7qD3zab"}, {"duration": 60, "endDate": "1988-04-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "svrRwemn", "quantity": 19, "sku": "mxBsKSrp"}, {"duration": 37, "endDate": "1992-09-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "FQUJ4h0q", "quantity": 35, "sku": "EPmfzrlk"}]}, {"condition": "AnqMYcs5", "conditionName": "ZPyb4BJn", "eventName": "mJH9egkv", "rewardItems": [{"duration": 12, "endDate": "1973-09-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "BMHoIL30", "quantity": 38, "sku": "fnXAYL0a"}, {"duration": 10, "endDate": "1981-05-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "LG93SKYM", "quantity": 100, "sku": "tBgpCuX4"}, {"duration": 26, "endDate": "1974-10-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qwDinefW", "quantity": 43, "sku": "GPqIDPQf"}]}], "userIdExpression": "ina6J609"}' \
    > test.out 2>&1
eval_tap $? 188 'CreateReward' test.out

#- 189 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '6iYlbyUI' \
    --limit '67' \
    --offset '71' \
    --sortBy 'rewardCode' \
    > test.out 2>&1
eval_tap $? 189 'QueryRewards' test.out

#- 190 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ExportRewards' test.out

#- 191 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 191 'ImportRewards' test.out

#- 192 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6zJk1CuQ' \
    > test.out 2>&1
eval_tap $? 192 'GetReward' test.out

#- 193 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RJD4fXR4' \
    --body '{"description": "obm8Fx0H", "eventTopic": "WbnoebpS", "maxAwarded": 91, "maxAwardedPerUser": 69, "namespaceExpression": "u67Wg68Y", "rewardCode": "2zpVJqI7", "rewardConditions": [{"condition": "89lnvoqk", "conditionName": "cyjGT4Nu", "eventName": "Qers2qeS", "rewardItems": [{"duration": 9, "endDate": "1978-08-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MVPPiQEI", "quantity": 87, "sku": "YKnSevEW"}, {"duration": 35, "endDate": "1997-06-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jsnMVmoK", "quantity": 14, "sku": "2h3EFlO7"}, {"duration": 70, "endDate": "1986-04-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "doQoqpH5", "quantity": 2, "sku": "LFUwdymW"}]}, {"condition": "CPbumsNN", "conditionName": "0Sree3Ck", "eventName": "Oo0j81gj", "rewardItems": [{"duration": 15, "endDate": "1983-11-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "WnUiPuAu", "quantity": 59, "sku": "y5BOyngx"}, {"duration": 100, "endDate": "1997-03-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "GOaNF7bh", "quantity": 53, "sku": "VsVv62ol"}, {"duration": 62, "endDate": "1987-01-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "NsnsmtdT", "quantity": 26, "sku": "JXJHrGnZ"}]}, {"condition": "jeU5rdlq", "conditionName": "WCdHzFJr", "eventName": "wrbBxv50", "rewardItems": [{"duration": 28, "endDate": "1979-03-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "rUoaPSGH", "quantity": 64, "sku": "mppjL2mx"}, {"duration": 46, "endDate": "1998-10-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "vYNwiDot", "quantity": 0, "sku": "9Qc35G92"}, {"duration": 77, "endDate": "1994-08-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "3Za0B6DU", "quantity": 17, "sku": "NaUNGFym"}]}], "userIdExpression": "SfcJ3b58"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateReward' test.out

#- 194 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aNGbSMPB' \
    > test.out 2>&1
eval_tap $? 194 'DeleteReward' test.out

#- 195 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ftMZHCSx' \
    --body '{"payload": {"FBmTSjVW": {}, "ONFynb1A": {}, "as80sk2k": {}}}' \
    > test.out 2>&1
eval_tap $? 195 'CheckEventCondition' test.out

#- 196 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '550c5mJR' \
    --body '{"conditionName": "EU0TZ4bY", "userId": "4Pgywn4b"}' \
    > test.out 2>&1
eval_tap $? 196 'DeleteRewardConditionRecord' test.out

#- 197 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'bVjO6oT1' \
    --limit '80' \
    --offset '27' \
    --start 'Hg3FYw2t' \
    --storeId '6lmrYCkh' \
    --viewId 'zJdfceoV' \
    > test.out 2>&1
eval_tap $? 197 'QuerySections' test.out

#- 198 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v4l7RYa0' \
    --body '{"active": false, "displayOrder": 43, "endDate": "1995-09-13T00:00:00Z", "ext": {"6dvKxu8E": {}, "iWUnjXQy": {}, "D3Evy9am": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 41, "itemCount": 17, "rule": "SEQUENCE"}, "items": [{"id": "jtSvA0oQ", "sku": "ARBVndUf"}, {"id": "VXZsf9r0", "sku": "55QUqFgf"}, {"id": "4T22kRpE", "sku": "n6OYoibB"}], "localizations": {"TEVTWvJP": {"description": "elePF1Bi", "localExt": {"VTeCH13n": {}, "qEQDhXdS": {}, "ZqprbS12": {}}, "longDescription": "tn0Pa5Ji", "title": "IYNlyr7b"}, "mpBDoyz6": {"description": "SrBGwbAM", "localExt": {"ZxqEjA37": {}, "njij78cK": {}, "t2yZfnrU": {}}, "longDescription": "28WfwjpO", "title": "80h4VIET"}, "xQJNuMRA": {"description": "kkqdjS41", "localExt": {"iLdP4emx": {}, "Ig6kOmuC": {}, "DqquNp4B": {}}, "longDescription": "SCLhmKhf", "title": "32dRKo1X"}}, "name": "6XkGNEvC", "rotationType": "FIXED_PERIOD", "startDate": "1995-03-14T00:00:00Z", "viewId": "oDbrpZ6I"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateSection' test.out

#- 199 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LzMslYtj' \
    > test.out 2>&1
eval_tap $? 199 'PurgeExpiredSection' test.out

#- 200 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '19jsSEpE' \
    --storeId 'A719Sy8o' \
    > test.out 2>&1
eval_tap $? 200 'GetSection' test.out

#- 201 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'VKNQI4Bn' \
    --storeId 'd6jC5tcJ' \
    --body '{"active": true, "displayOrder": 36, "endDate": "1981-12-09T00:00:00Z", "ext": {"bWUwAcNh": {}, "55K8VhSr": {}, "JJowux86": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 91, "itemCount": 41, "rule": "SEQUENCE"}, "items": [{"id": "Wy6LK1aZ", "sku": "GQopHWnZ"}, {"id": "T5LYxtG0", "sku": "ErGtIBza"}, {"id": "PfHi1A4G", "sku": "1KbA3kwq"}], "localizations": {"PFPh5uyt": {"description": "TZCKDZ0D", "localExt": {"QPzEf8Jr": {}, "6JDV4uST": {}, "syv6NAfa": {}}, "longDescription": "ePudEdDI", "title": "2v20epEZ"}, "CAcligVY": {"description": "bCcpvaGU", "localExt": {"2kcZt3D2": {}, "lV8FqyEU": {}, "2tf5cInp": {}}, "longDescription": "BvVXQk2Q", "title": "yDFSYeHs"}, "TayKyokq": {"description": "VcxLgW9E", "localExt": {"fhzcJBjZ": {}, "rhFZ9bWk": {}, "Y0ub9mQz": {}}, "longDescription": "UoYOTdVQ", "title": "6n4EAEFg"}}, "name": "wKN5rMWn", "rotationType": "NONE", "startDate": "1994-08-06T00:00:00Z", "viewId": "Lb4nMC7f"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateSection' test.out

#- 202 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '2ua79QKd' \
    --storeId '1bOx9LUa' \
    > test.out 2>&1
eval_tap $? 202 'DeleteSection' test.out

#- 203 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'ListStores' test.out

#- 204 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "JM6VgQIg", "defaultRegion": "S4zWTzL0", "description": "S02nMk62", "supportedLanguages": ["XFTmLV9F", "IdITKbud", "tbCfKe8y"], "supportedRegions": ["fPllh8EX", "cWDMTYHI", "ktHtOF08"], "title": "ufuFAeGS"}' \
    > test.out 2>&1
eval_tap $? 204 'CreateStore' test.out

#- 205 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
    > test.out 2>&1
eval_tap $? 205 'GetCatalogDefinition' test.out

#- 206 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 206 'DownloadCSVTemplates' test.out

#- 207 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["KjlOUVPd", "1IXp6NzH", "4fDeXIjD"], "idsToBeExported": ["IjpJIF2H", "wQyrVQg7", "XrqVMbcE"], "storeId": "1qFvSOqY"}' \
    > test.out 2>&1
eval_tap $? 207 'ExportStoreByCSV' test.out

#- 208 ImportStore
eval_tap 0 208 'ImportStore # SKIP deprecated' test.out

#- 209 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetPublishedStore' test.out

#- 210 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 210 'DeletePublishedStore' test.out

#- 211 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'GetPublishedStoreBackup' test.out

#- 212 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'RollbackPublishedStore' test.out

#- 213 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '8MTglexy' \
    > test.out 2>&1
eval_tap $? 213 'GetStore' test.out

#- 214 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J8rQUhXw' \
    --body '{"defaultLanguage": "de1ElyXs", "defaultRegion": "gsJDG4u7", "description": "3kLbrx09", "supportedLanguages": ["Ibpi7DvP", "uqg7VjSi", "Dve0HvDf"], "supportedRegions": ["LeSDhxhv", "D5nhtUlI", "hiGw2KGS"], "title": "M1jjqJDp"}' \
    > test.out 2>&1
eval_tap $? 214 'UpdateStore' test.out

#- 215 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nFaewmML' \
    > test.out 2>&1
eval_tap $? 215 'DeleteStore' test.out

#- 216 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g5bqPh2j' \
    --action 'UPDATE' \
    --itemSku 'ykQ0FzVt' \
    --itemType 'BUNDLE' \
    --limit '44' \
    --offset '100' \
    --selected  \
    --sortBy 'createdAt:desc,updatedAt:desc,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'BFtXStKL' \
    --updatedAtStart 'yVzStm2W' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 216 'QueryChanges' test.out

#- 217 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xZ7p4lIO' \
    > test.out 2>&1
eval_tap $? 217 'PublishAll' test.out

#- 218 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f0NkoWmo' \
    > test.out 2>&1
eval_tap $? 218 'PublishSelected' test.out

#- 219 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h0Ddfwo4' \
    > test.out 2>&1
eval_tap $? 219 'SelectAllRecords' test.out

#- 220 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wZZrLNCj' \
    --action 'CREATE' \
    --itemSku 'czl82CwF' \
    --itemType 'SUBSCRIPTION' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd '6KMJAvgb' \
    --updatedAtStart '0SW5C6J4' \
    > test.out 2>&1
eval_tap $? 220 'SelectAllRecordsByCriteria' test.out

#- 221 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '490GKm4Y' \
    --action 'DELETE' \
    --itemSku 'UO7Zgmz5' \
    --itemType 'LOOTBOX' \
    --type 'CATEGORY' \
    --updatedAtEnd 'Ce9F0UQt' \
    --updatedAtStart 'XoR7j14Q' \
    > test.out 2>&1
eval_tap $? 221 'GetStatistic' test.out

#- 222 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fCHkIKAr' \
    > test.out 2>&1
eval_tap $? 222 'UnselectAllRecords' test.out

#- 223 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '3f8g4psn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SINnBi1L' \
    > test.out 2>&1
eval_tap $? 223 'SelectRecord' test.out

#- 224 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'lmrZxd0j' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fsXkbVcl' \
    > test.out 2>&1
eval_tap $? 224 'UnselectRecord' test.out

#- 225 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '3l2RZF3C' \
    --targetStoreId 't2mnw59X' \
    > test.out 2>&1
eval_tap $? 225 'CloneStore' test.out

#- 226 ExportStore
eval_tap 0 226 'ExportStore # SKIP deprecated' test.out

#- 227 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O8AstqBH' \
    --end 'AXNI1Gkw' \
    --limit '50' \
    --offset '27' \
    --sortBy 'TKCfood3' \
    --start 'hLXSI4Z6' \
    --success  \
    > test.out 2>&1
eval_tap $? 227 'QueryImportHistory' test.out

#- 228 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SxOuavjz' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'tWVvG5ZC' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 228 'ImportStoreByCSV' test.out

#- 229 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '8uLHXdMH' \
    --limit '45' \
    --offset '71' \
    --sku '6SFgrQan' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'lK24hFlt' \
    > test.out 2>&1
eval_tap $? 229 'QuerySubscriptions' test.out

#- 230 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8s7d4P5B' \
    > test.out 2>&1
eval_tap $? 230 'RecurringChargeSubscription' test.out

#- 231 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'RtZa08PP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'GetTicketDynamic' test.out

#- 232 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'RK0lpAye' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ej0gNdQt"}' \
    > test.out 2>&1
eval_tap $? 232 'DecreaseTicketSale' test.out

#- 233 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'PL014FPr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketBoothID' test.out

#- 234 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'nBfRQqHr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 78, "orderNo": "PlIScWBt"}' \
    > test.out 2>&1
eval_tap $? 234 'IncreaseTicketSale' test.out

#- 235 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 9, "currencyCode": "BdXfUyCJ", "expireAt": "1991-12-02T00:00:00Z"}, "debitPayload": {"count": 76, "currencyCode": "PgmSIIp7", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "9gDS4kBu", "entitlementOrigin": "Xbox", "itemIdentity": "PG71IBfy", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "eKGelZri"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 62, "currencyCode": "LLCBQCJQ", "expireAt": "1999-08-30T00:00:00Z"}, "debitPayload": {"count": 76, "currencyCode": "k8TVEg0s", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 14, "entitlementCollectionId": "vyk8YJUU", "entitlementOrigin": "Playstation", "itemIdentity": "xr8Gi73t", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 78, "entitlementId": "EFFlBTgn"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 62, "currencyCode": "5x2buChI", "expireAt": "1993-02-24T00:00:00Z"}, "debitPayload": {"count": 39, "currencyCode": "9lL1klHk", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 40, "entitlementCollectionId": "enRlAhyN", "entitlementOrigin": "GooglePlay", "itemIdentity": "LjNsBjSt", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 43, "entitlementId": "bm90kJbz"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "u62RDdUp"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 89, "currencyCode": "vu9SfY9U", "expireAt": "1978-08-13T00:00:00Z"}, "debitPayload": {"count": 4, "currencyCode": "wQqpBuN4", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 96, "entitlementCollectionId": "jZZwNcF0", "entitlementOrigin": "Playstation", "itemIdentity": "1ASmb9zp", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 93, "entitlementId": "yDDDB1Eu"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 49, "currencyCode": "x9BWh1vo", "expireAt": "1985-08-03T00:00:00Z"}, "debitPayload": {"count": 92, "currencyCode": "51NQx7Ur", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "WEo2fBip", "entitlementOrigin": "Twitch", "itemIdentity": "5oTpOoRY", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 75, "entitlementId": "DY69iqXs"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 65, "currencyCode": "9sCmZIzL", "expireAt": "1993-07-15T00:00:00Z"}, "debitPayload": {"count": 61, "currencyCode": "7XPABUcp", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 26, "entitlementCollectionId": "VS6hw9Iw", "entitlementOrigin": "Nintendo", "itemIdentity": "J2aoRGNG", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 100, "entitlementId": "BgFMZzLE"}, "type": "FULFILL_ITEM"}], "userId": "4q7FtykO"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 12, "currencyCode": "PQt6DVoo", "expireAt": "1992-05-24T00:00:00Z"}, "debitPayload": {"count": 58, "currencyCode": "hbAe9yxb", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "bwBXtImT", "entitlementOrigin": "Xbox", "itemIdentity": "Pg2QJbqQ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 82, "entitlementId": "WQtr9IyB"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 57, "currencyCode": "CWBwNIUk", "expireAt": "1978-01-06T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "NjvrrOJp", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 18, "entitlementCollectionId": "ymX4Q44B", "entitlementOrigin": "Epic", "itemIdentity": "o9rjB61u", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "xIBSkg24"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 18, "currencyCode": "6sHTpZtM", "expireAt": "1994-08-11T00:00:00Z"}, "debitPayload": {"count": 4, "currencyCode": "CWznqtV7", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 98, "entitlementCollectionId": "8e2GXxs7", "entitlementOrigin": "Xbox", "itemIdentity": "MfCDWCZM", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 70, "entitlementId": "g5lMGdH4"}, "type": "FULFILL_ITEM"}], "userId": "1E9twNQs"}], "metadata": {"gFZcz3Xt": {}, "sNOdYtsE": {}, "zBFJR2Os": {}}, "needPreCheck": true, "transactionId": "OLN2ZYoj", "type": "9z0SUnYO"}' \
    > test.out 2>&1
eval_tap $? 235 'Commit' test.out

#- 236 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '21' \
    --status 'INIT' \
    --type 'OfHPoGyS' \
    --userId 'X2aKLIJm' \
    > test.out 2>&1
eval_tap $? 236 'GetTradeHistoryByCriteria' test.out

#- 237 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'pTdlJobO' \
    > test.out 2>&1
eval_tap $? 237 'GetTradeHistoryByTransactionId' test.out

#- 238 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CyYXdvWe' \
    --body '{"achievements": [{"id": "M2ZzjWGg", "value": 37}, {"id": "HCGnKsi3", "value": 83}, {"id": "5SwE6OJF", "value": 58}], "steamUserId": "52AqzI2b"}' \
    > test.out 2>&1
eval_tap $? 238 'UnlockSteamUserAchievement' test.out

#- 239 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfnGB1gz' \
    --xboxUserId '2IVRdVdO' \
    > test.out 2>&1
eval_tap $? 239 'GetXblUserAchievements' test.out

#- 240 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoZ22htm' \
    --body '{"achievements": [{"id": "AKz8Y7OL", "percentComplete": 9}, {"id": "999CRRXh", "percentComplete": 68}, {"id": "pZJrqvA9", "percentComplete": 34}], "serviceConfigId": "pzxwZv2Z", "titleId": "y08e1Udd", "xboxUserId": "48uGo4n0"}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateXblUserAchievement' test.out

#- 241 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGrKtr0U' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeCampaign' test.out

#- 242 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CvBRguMl' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeEntitlement' test.out

#- 243 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '1uN7H8OB' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeFulfillment' test.out

#- 244 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'f6f74qOD' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeIntegration' test.out

#- 245 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTnA3Qa8' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeOrder' test.out

#- 246 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'n03wvGjE' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizePayment' test.out

#- 247 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'OemwyzJo' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeRevocation' test.out

#- 248 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'G3WIimFy' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizeSubscription' test.out

#- 249 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZTxeDyT' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeWallet' test.out

#- 250 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'aH3CGi5P' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 250 'GetUserDLCByPlatform' test.out

#- 251 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'bLxtdV8f' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 251 'GetUserDLC' test.out

#- 252 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ucZSr4B1' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 'ry2yu9Kz' \
    --entitlementClazz 'APP' \
    --entitlementName 'cemXFP4P' \
    --features 'bSpnLNA5,Sf12nvhP,78caSy1i' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId '15ojRng8,uNRBDuwE,scrWcHH7' \
    --limit '29' \
    --offset '1' \
    --origin 'IOS' \
    > test.out 2>&1
eval_tap $? 252 'QueryUserEntitlements' test.out

#- 253 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'nb9BNifs' \
    --body '[{"collectionId": "TaH8HoMU", "endDate": "1973-11-05T00:00:00Z", "grantedCode": "YfUEby3T", "itemId": "Y8EApfcu", "itemNamespace": "bektTcRp", "language": "xSc-mKMo", "metadata": {"1kUsVBe5": {}, "i2SduYUC": {}, "yzoS2cyW": {}}, "origin": "Oculus", "quantity": 44, "region": "XeZqUjvL", "source": "REFERRAL_BONUS", "startDate": "1980-01-07T00:00:00Z", "storeId": "TlpRzdkk"}, {"collectionId": "q6Swq3is", "endDate": "1986-08-11T00:00:00Z", "grantedCode": "0A6ztSHm", "itemId": "XsCpYiue", "itemNamespace": "2YgFb6aG", "language": "ehtA_dt", "metadata": {"EBnJqWL2": {}, "tCs1vsZD": {}, "ZmBUOWHQ": {}}, "origin": "Nintendo", "quantity": 67, "region": "VMNaL5oZ", "source": "OTHER", "startDate": "1988-01-18T00:00:00Z", "storeId": "w0F7fKzg"}, {"collectionId": "obhM8PSo", "endDate": "1980-11-04T00:00:00Z", "grantedCode": "ipyFpiKd", "itemId": "4GIUXQTt", "itemNamespace": "S7vxPv1M", "language": "MYaz-VXbl", "metadata": {"Z89B6eyL": {}, "ntvtNqyM": {}, "hzDoMm5g": {}}, "origin": "Twitch", "quantity": 68, "region": "m491XfA0", "source": "REWARD", "startDate": "1980-08-10T00:00:00Z", "storeId": "qNAi1lCV"}]' \
    > test.out 2>&1
eval_tap $? 253 'GrantUserEntitlement' test.out

#- 254 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '5GvEPBTf' \
    --activeOnly  \
    --appId 'BdfrP8J6' \
    > test.out 2>&1
eval_tap $? 254 'GetUserAppEntitlementByAppId' test.out

#- 255 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '6prXbLtL' \
    --activeOnly  \
    --limit '71' \
    --offset '57' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 255 'QueryUserEntitlementsByAppType' test.out

#- 256 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ykFAs99b' \
    --ids 'ogLUpO5U,9jdXjs3x,KAXt0lKc' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementsByIds' test.out

#- 257 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YCB6ZhnT' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform '6UHSj9RU' \
    --itemId 'kTbwUMBu' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementByItemId' test.out

#- 258 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'cmFYMpNc' \
    --ids 'IOnVckh8,QZEqAo8j,nCwp6opb' \
    --platform 'ZHDYF63H' \
    > test.out 2>&1
eval_tap $? 258 'GetUserActiveEntitlementsByItemIds' test.out

#- 259 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '5z8mvAON' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'bcyv5Jrm' \
    --sku 'scBdrEo1' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementBySku' test.out

#- 260 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UQ4k8Lvn' \
    --appIds 'x9qSUKnx,kkDLW6I8,aTDFiMPM' \
    --itemIds 'rXvXRbvL,IKYjeCgK,TRv1IYoZ' \
    --platform 'qnEZgyVS' \
    --skus 'GMjrIb1H,OaQJY53n,Ui8mTJ2g' \
    > test.out 2>&1
eval_tap $? 260 'ExistsAnyUserActiveEntitlement' test.out

#- 261 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQJKdUEx' \
    --platform 'RldfWAZs' \
    --itemIds 'WuWPx6aT,UCoPNDft,8VUO10hK' \
    > test.out 2>&1
eval_tap $? 261 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 262 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9TE7DbEt' \
    --appId '8sWQ8c9R' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 263 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTkbrX8j' \
    --entitlementClazz 'MEDIA' \
    --platform 'IAYxoIxe' \
    --itemId 'lTzFhGdl' \
    > test.out 2>&1
eval_tap $? 263 'GetUserEntitlementOwnershipByItemId' test.out

#- 264 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'c7S1agbz' \
    --ids 'MR4K86HJ,xUpKlIYP,bwVXsUCW' \
    --platform 'ji8Ap5IZ' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementOwnershipByItemIds' test.out

#- 265 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uh2cMGSP' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'THucIIYe' \
    --sku 'x3T2Dm0F' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipBySku' test.out

#- 266 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Odd8W1GF' \
    > test.out 2>&1
eval_tap $? 266 'RevokeAllEntitlements' test.out

#- 267 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1nZrANj' \
    --entitlementIds 'KKtxjHNZ' \
    > test.out 2>&1
eval_tap $? 267 'RevokeUserEntitlements' test.out

#- 268 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'tsmSEh1x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7Imi2tW' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlement' test.out

#- 269 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'Zh9aAGyU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'st76pfok' \
    --body '{"collectionId": "FAhH56hO", "endDate": "1986-04-03T00:00:00Z", "nullFieldList": ["5XEAb9sH", "zZb4qHc2", "xcqwNUup"], "origin": "IOS", "reason": "ZZTvgutk", "startDate": "1980-05-26T00:00:00Z", "status": "INACTIVE", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserEntitlement' test.out

#- 270 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '9hgh79TU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvWVOEwZ' \
    --body '{"metadata": {"YtwLxt2r": {}, "FOtvX9MB": {}, "SgxRcJFE": {}}, "options": ["IBmkmlr5", "cYDqLcNQ", "RLPr4Qfx"], "platform": "p77DBdJn", "requestId": "Rm3wFpqs", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 270 'ConsumeUserEntitlement' test.out

#- 271 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'Nkm5tIVX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2aNBZZB' \
    > test.out 2>&1
eval_tap $? 271 'DisableUserEntitlement' test.out

#- 272 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Kqi8NXKW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ML0NnIrN' \
    > test.out 2>&1
eval_tap $? 272 'EnableUserEntitlement' test.out

#- 273 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '21yYtNAz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zt0bGHCy' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementHistories' test.out

#- 274 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'dAShM8tT' \
    --namespace "$AB_NAMESPACE" \
    --userId '97xr8QOd' \
    --body '{"metadata": {"ExgSjk5l": {}, "uFWfFW1k": {}, "FXEAkMA0": {}}}' \
    > test.out 2>&1
eval_tap $? 274 'RevokeUserEntitlement' test.out

#- 275 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'gCmXOjhH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPLWXhbG' \
    --body '{"reason": "liHqfmmc", "useCount": 11}' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlementByUseCount' test.out

#- 276 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'SZr06h7f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DR14fKYG' \
    --quantity '66' \
    > test.out 2>&1
eval_tap $? 276 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 277 RevokeUseCount
eval_tap 0 277 'RevokeUseCount # SKIP deprecated' test.out

#- 278 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'OOvzmQX7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1SMSVQJ' \
    --body '{"platform": "GDFa4usP", "requestId": "1sC93XZ5", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 278 'SellUserEntitlement' test.out

#- 279 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'I01J9o1o' \
    --body '{"duration": 12, "endDate": "1995-07-30T00:00:00Z", "entitlementCollectionId": "jsfkbM2U", "entitlementOrigin": "IOS", "itemId": "uuHitVIM", "itemSku": "vTGcq8G0", "language": "VNaHEYBh", "metadata": {"8Jmo15VU": {}, "HHQYfMQw": {}, "KWnNfHW2": {}}, "order": {"currency": {"currencyCode": "XbO69Sdg", "currencySymbol": "5BjV6XNU", "currencyType": "REAL", "decimals": 9, "namespace": "UE81EjXt"}, "ext": {"LBJMj0a7": {}, "afrvLwZ9": {}, "HKuBNDmY": {}}, "free": false}, "orderNo": "BpW3uD2y", "origin": "Epic", "overrideBundleItemQty": {"R8gWsEYj": 81, "VDGzd6HI": 24, "OxHJAXhB": 36}, "quantity": 29, "region": "Vnq4Br3d", "source": "REFERRAL_BONUS", "startDate": "1997-04-07T00:00:00Z", "storeId": "IBF3YfKp"}' \
    > test.out 2>&1
eval_tap $? 279 'FulfillItem' test.out

#- 280 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IN35YTfI' \
    --body '{"code": "JrFMNQhS", "language": "OtVR-JQri-oB", "region": "KAJzRBya"}' \
    > test.out 2>&1
eval_tap $? 280 'RedeemCode' test.out

#- 281 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vCrMkPjf' \
    --body '{"itemId": "o6KIdP3x", "itemSku": "JMJ9yO3j", "quantity": 59}' \
    > test.out 2>&1
eval_tap $? 281 'PreCheckFulfillItem' test.out

#- 282 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6q0VF9fq' \
    --body '{"entitlementCollectionId": "6MWix5dW", "entitlementOrigin": "System", "metadata": {"DZfsPuzg": {}, "sctQuuLS": {}, "AwwTP9dQ": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "Ff6i0a8D", "namespace": "g4vTgVAI"}, "item": {"itemId": "06PtupfG", "itemName": "Ocl4vk1B", "itemSku": "ZlfCNBRl", "itemType": "t1XeBOCB"}, "quantity": 50, "type": "ITEM"}, {"currency": {"currencyCode": "92w47srZ", "namespace": "1lgfLERl"}, "item": {"itemId": "NwWZh3eR", "itemName": "i6cCgPzX", "itemSku": "lEMHoLjY", "itemType": "NUHlLJzo"}, "quantity": 50, "type": "CURRENCY"}, {"currency": {"currencyCode": "JXwbkCLY", "namespace": "Y1KPY7NZ"}, "item": {"itemId": "Q8wqTwKB", "itemName": "VZ09Qd3n", "itemSku": "BvGI2tOO", "itemType": "vGHGz6NN"}, "quantity": 59, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "HdQQ2AKs"}' \
    > test.out 2>&1
eval_tap $? 282 'FulfillRewards' test.out

#- 283 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'pie5sa95' \
    --endTime 'tYJUIDLB' \
    --limit '12' \
    --offset '76' \
    --productId 'UqD1GL5O' \
    --startTime 'C1hUQxqs' \
    --status 'VERIFIED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 283 'QueryUserIAPOrders' test.out

#- 284 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'her3gSpG' \
    > test.out 2>&1
eval_tap $? 284 'QueryAllUserIAPOrders' test.out

#- 285 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'dcJcQONu' \
    --endTime 'GyNkri9c' \
    --limit '59' \
    --offset '10' \
    --startTime '1Q8QYXmV' \
    --status 'PENDING' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPConsumeHistory' test.out

#- 286 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dkU44xeH' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Gt_opMN", "productId": "iEVf9pdv", "region": "VH8Q7ImY", "transactionId": "MXuu7tGs", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 286 'MockFulfillIAPItem' test.out

#- 287 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'wrXnOxSB' \
    --namespace "$AB_NAMESPACE" \
    --userId '3c6AeTWs' \
    > test.out 2>&1
eval_tap $? 287 'AdminGetIAPOrderLineItems' test.out

#- 288 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Isg0wRYn' \
    > test.out 2>&1
eval_tap $? 288 'AdminSyncSteamAbnormalTransaction' test.out

#- 289 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'MKjW6R4k' \
    --body '{"orderId": "qMgB5JbI"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminSyncSteamIAPByTransaction' test.out

#- 290 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '0k3iJ4LU' \
    --activeOnly  \
    --groupId 'E93fBUrl' \
    --limit '8' \
    --offset '34' \
    --platform 'GOOGLE' \
    --productId 'zO34zgwU' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserThirdPartySubscription' test.out

#- 291 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId '9CZluo3h' \
    --groupId 'UH9GW2Xx' \
    > test.out 2>&1
eval_tap $? 291 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 292 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'oJiPChZU' \
    --productId 'afZ05jML' \
    > test.out 2>&1
eval_tap $? 292 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 293 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '9IbW98kC' \
    --activeOnly  \
    --groupId 'j8jPMDgn' \
    --limit '2' \
    --offset '74' \
    --platform 'GOOGLE' \
    --productId 'rdpmwsDI' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 294 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'zztBlOLg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIa4tdEU' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartySubscriptionDetails' test.out

#- 295 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'eVrAseSg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqgXSIbh' \
    --limit '54' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 295 'GetSubscriptionHistory' test.out

#- 296 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'gqZZI5ae' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQRExlzc' \
    > test.out 2>&1
eval_tap $? 296 'SyncSubscriptionTransaction' test.out

#- 297 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'Aw9zzHgn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fw8hY2vR' \
    > test.out 2>&1
eval_tap $? 297 'GetThirdPartyUserSubscriptionDetails' test.out

#- 298 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'weQfrU5m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzBIqxQp' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscription' test.out

#- 299 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoCRDVw0' \
    --discounted  \
    --itemId 'YMzTRrIo' \
    --limit '21' \
    --offset '23' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserOrders' test.out

#- 300 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPRCFzF5' \
    --body '{"currencyCode": "XFM29vLv", "currencyNamespace": "ayP0sRBR", "discountCodes": ["LOxwfcvX", "QvKwmttS", "XpBuJnAM"], "discountedPrice": 27, "entitlementPlatform": "IOS", "ext": {"rBPi9I7w": {}, "lqOMNErK": {}, "WLSJtgRv": {}}, "itemId": "vjYMTotK", "language": "bB4pVIPT", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 9, "quantity": 63, "region": "Rv39wwIN", "returnUrl": "OCTtDnsM", "sandbox": true, "sectionId": "mUY0mb9W"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminCreateUserOrder' test.out

#- 301 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ktykeZgq' \
    --itemId 'L0pu8B6D' \
    > test.out 2>&1
eval_tap $? 301 'CountOfPurchasedItem' test.out

#- 302 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QbDwcfiV' \
    --userId 'GEASqOSu' \
    > test.out 2>&1
eval_tap $? 302 'GetUserOrder' test.out

#- 303 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UsJ5OqbQ' \
    --userId '0EMxCWqe' \
    --body '{"status": "REFUNDING", "statusReason": "LduqpZZB"}' \
    > test.out 2>&1
eval_tap $? 303 'UpdateUserOrderStatus' test.out

#- 304 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'u20f73uE' \
    --userId '9wqU0T7t' \
    > test.out 2>&1
eval_tap $? 304 'FulfillUserOrder' test.out

#- 305 GetUserOrderGrant
eval_tap 0 305 'GetUserOrderGrant # SKIP deprecated' test.out

#- 306 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F8JxjNPK' \
    --userId 'lKo28BTP' \
    > test.out 2>&1
eval_tap $? 306 'GetUserOrderHistories' test.out

#- 307 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'x7vpjZMU' \
    --userId 'BQtl5ZQE' \
    --body '{"additionalData": {"cardSummary": "Ea4ARQYU"}, "authorisedTime": "1984-10-01T00:00:00Z", "chargebackReversedTime": "1990-04-10T00:00:00Z", "chargebackTime": "1991-08-19T00:00:00Z", "chargedTime": "1985-03-03T00:00:00Z", "createdTime": "1996-07-31T00:00:00Z", "currency": {"currencyCode": "wIfVsQw1", "currencySymbol": "IEE69wrT", "currencyType": "REAL", "decimals": 37, "namespace": "dHftgv0N"}, "customParameters": {"23zkbpPw": {}, "tGFfVGko": {}, "lLGzO8Mq": {}}, "extOrderNo": "DmnDl5Js", "extTxId": "LrhFvm9G", "extUserId": "xO0ReIJ3", "issuedAt": "1978-01-27T00:00:00Z", "metadata": {"XE0RzmC1": "qHvEiiev", "WBd6LAdJ": "cwhJEbyn", "enBi3Fia": "zA6MVyCb"}, "namespace": "rLuKNpta", "nonceStr": "ddqxTJTG", "paymentData": {"discountAmount": 6, "discountCode": "JSHQCg6S", "subtotalPrice": 28, "tax": 2, "totalPrice": 31}, "paymentMethod": "beHVpKjw", "paymentMethodFee": 34, "paymentOrderNo": "nV1H1yno", "paymentProvider": "STRIPE", "paymentProviderFee": 63, "paymentStationUrl": "j5qZXUNL", "price": 13, "refundedTime": "1997-10-20T00:00:00Z", "salesTax": 32, "sandbox": false, "sku": "iVhkv5WT", "status": "CHARGED", "statusReason": "e9aq4ReG", "subscriptionId": "pNAfEjAG", "subtotalPrice": 17, "targetNamespace": "lo0G4DG3", "targetUserId": "Orlpq4VA", "tax": 18, "totalPrice": 96, "totalTax": 37, "txEndTime": "1971-06-06T00:00:00Z", "type": "UbuYiFZD", "userId": "viUQkH0l", "vat": 85}' \
    > test.out 2>&1
eval_tap $? 307 'ProcessUserOrderNotification' test.out

#- 308 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SfUzeJHs' \
    --userId '3kiEzpel' \
    > test.out 2>&1
eval_tap $? 308 'DownloadUserOrderReceipt' test.out

#- 309 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'OhivjSiV' \
    --body '{"currencyCode": "Lw4n4G7G", "currencyNamespace": "euWDgpk6", "customParameters": {"yC9AlJRU": {}, "hqXKdwpL": {}, "MPZtXFn1": {}}, "description": "uscjWUoo", "extOrderNo": "5Cyi7VUv", "extUserId": "34BfNeTs", "itemType": "MEDIA", "language": "ZNPP-400", "metadata": {"jZ9u754b": "ZACZzDxi", "JqZBGdxw": "qKu1b8uY", "48Yk55m0": "nRdBhAKK"}, "notifyUrl": "tMpUeWKc", "omitNotification": false, "platform": "03LUEKX4", "price": 32, "recurringPaymentOrderNo": "0DzgMIMb", "region": "sFe8Htt2", "returnUrl": "zCrQSZ0D", "sandbox": true, "sku": "HOJzlM9F", "subscriptionId": "X7bPvXCC", "title": "R6zO4i05"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateUserPaymentOrder' test.out

#- 310 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '571fzz7w' \
    --userId 'lMozcWbL' \
    --body '{"description": "aTR3iWV3"}' \
    > test.out 2>&1
eval_tap $? 310 'RefundUserPaymentOrder' test.out

#- 311 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'n2dS5EeR' \
    > test.out 2>&1
eval_tap $? 311 'GetUserPlatformAccountClosureHistories' test.out

#- 312 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZHcaboL4' \
    --body '{"code": "jvjT5LHl", "orderNo": "y6dcSNV2"}' \
    > test.out 2>&1
eval_tap $? 312 'ApplyUserRedemption' test.out

#- 313 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKuk1z2k' \
    --body '{"meta": {"KwUreDsy": {}, "4NLadgBR": {}, "yTwg6Ndt": {}}, "reason": "mm92FygY", "requestId": "4DCTq5lu", "revokeEntries": [{"currency": {"balanceOrigin": "Nintendo", "currencyCode": "aQZmljuH", "namespace": "YNsey2NY"}, "entitlement": {"entitlementId": "WmiVFV3E"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "0rbYHRsR", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 100, "type": "ITEM"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "GME0BgWf", "namespace": "LoZNis8r"}, "entitlement": {"entitlementId": "meXszH0e"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "n0rDsUuV", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 25, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "dRwWOBcZ", "namespace": "9m0l0fED"}, "entitlement": {"entitlementId": "bzU58jkN"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "Z5dI3I0O", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 61, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "ewfVY9te"}' \
    > test.out 2>&1
eval_tap $? 313 'DoRevocation' test.out

#- 314 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMJYXSb6' \
    --body '{"gameSessionId": "xVBk8fOQ", "payload": {"3QnxHLLK": {}, "BEfWtQLu": {}, "GvOuKl4S": {}}, "scid": "H1epUodY", "sessionTemplateName": "F9GKO215"}' \
    > test.out 2>&1
eval_tap $? 314 'RegisterXblSessions' test.out

#- 315 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '6s9dZUYe' \
    --chargeStatus 'CHARGED' \
    --itemId '2TXzZMp9' \
    --limit '37' \
    --offset '17' \
    --sku 'Z0CFt8ue' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 315 'QueryUserSubscriptions' test.out

#- 316 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'jW7oF9dI' \
    --excludeSystem  \
    --limit '62' \
    --offset '98' \
    --subscriptionId 'xbwl2zVm' \
    > test.out 2>&1
eval_tap $? 316 'GetUserSubscriptionActivities' test.out

#- 317 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '86qYgZjr' \
    --body '{"grantDays": 76, "itemId": "t3fn0leX", "language": "W38gdhzN", "reason": "0MBqqLiS", "region": "lDzwu0O1", "source": "xAWB1JuF"}' \
    > test.out 2>&1
eval_tap $? 317 'PlatformSubscribeSubscription' test.out

#- 318 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xjty0T77' \
    --itemId 'kcFQh5HU' \
    > test.out 2>&1
eval_tap $? 318 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 319 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'q0L52Txa' \
    --userId 'T7XLzoku' \
    > test.out 2>&1
eval_tap $? 319 'GetUserSubscription' test.out

#- 320 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'i9Vcxde2' \
    --userId 'IhKSMwZj' \
    > test.out 2>&1
eval_tap $? 320 'DeleteUserSubscription' test.out

#- 321 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XcQ9ZG3B' \
    --userId 'djglJyyR' \
    --force  \
    --body '{"immediate": false, "reason": "nnwCyrrm"}' \
    > test.out 2>&1
eval_tap $? 321 'CancelSubscription' test.out

#- 322 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'o1aVnMGH' \
    --userId 'Wq9EklFV' \
    --body '{"grantDays": 47, "reason": "YecC96eo"}' \
    > test.out 2>&1
eval_tap $? 322 'GrantDaysToSubscription' test.out

#- 323 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QLcaiCT4' \
    --userId 'btIQ7Bsy' \
    --excludeFree  \
    --limit '31' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 323 'GetUserSubscriptionBillingHistories' test.out

#- 324 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uM2VyuwW' \
    --userId 'o7zamMwt' \
    --body '{"additionalData": {"cardSummary": "4Xfbk7PX"}, "authorisedTime": "1977-06-11T00:00:00Z", "chargebackReversedTime": "1976-07-21T00:00:00Z", "chargebackTime": "1974-06-27T00:00:00Z", "chargedTime": "1973-02-14T00:00:00Z", "createdTime": "1981-12-25T00:00:00Z", "currency": {"currencyCode": "6aWdBKfm", "currencySymbol": "6EpZDcoF", "currencyType": "REAL", "decimals": 65, "namespace": "ZB2txtSJ"}, "customParameters": {"ZhaDkgBj": {}, "ZZdubwgP": {}, "z53tUpnb": {}}, "extOrderNo": "0L5nvU7D", "extTxId": "a8lUyIgc", "extUserId": "HBrXeaKT", "issuedAt": "1997-09-23T00:00:00Z", "metadata": {"SotR9xaz": "hDjQOwsS", "HiREY4Vt": "DFn2lcMy", "h1C9MduC": "JWzQYhon"}, "namespace": "CBWEFD4U", "nonceStr": "VziAxs9c", "paymentData": {"discountAmount": 65, "discountCode": "36eDwp0Z", "subtotalPrice": 81, "tax": 66, "totalPrice": 34}, "paymentMethod": "5MbaLdp4", "paymentMethodFee": 58, "paymentOrderNo": "Zm4RzXvo", "paymentProvider": "XSOLLA", "paymentProviderFee": 96, "paymentStationUrl": "WOLEdujD", "price": 56, "refundedTime": "1975-08-23T00:00:00Z", "salesTax": 42, "sandbox": true, "sku": "BbDNfxN6", "status": "DELETED", "statusReason": "XOuMn1Dl", "subscriptionId": "H1Io6BmM", "subtotalPrice": 58, "targetNamespace": "3CvbovgG", "targetUserId": "ebmhRQl0", "tax": 73, "totalPrice": 56, "totalTax": 50, "txEndTime": "1997-09-03T00:00:00Z", "type": "Pe5ERYVu", "userId": "1OieYU11", "vat": 80}' \
    > test.out 2>&1
eval_tap $? 324 'ProcessUserSubscriptionNotification' test.out

#- 325 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'yQtOp6Xs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pxxJB4mq' \
    --body '{"count": 45, "orderNo": "FJnd6fIj"}' \
    > test.out 2>&1
eval_tap $? 325 'AcquireUserTicket' test.out

#- 326 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEbkphTb' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserCurrencyWallets' test.out

#- 327 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'Eeshck6D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kEfvXjDM' \
    --body '{"allowOverdraft": false, "amount": 4, "balanceOrigin": "Xbox", "balanceSource": "DLC_REVOCATION", "metadata": {"0vGIe7Ar": {}, "NMhdaCsw": {}, "egEzRe1B": {}}, "reason": "oUnZVys2"}' \
    > test.out 2>&1
eval_tap $? 327 'DebitUserWalletByCurrencyCode' test.out

#- 328 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'DwipdziQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H2AdN6pt' \
    --limit '30' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 328 'ListUserCurrencyTransactions' test.out

#- 329 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'dh6WvcSA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SnkYQq3l' \
    --request '{"amount": 66, "debitBalanceSource": "OTHER", "metadata": {"np0BVrE6": {}, "xqL8e2JN": {}, "0hsf4Me6": {}}, "reason": "5QSAq4TV", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 329 'CheckBalance' test.out

#- 330 CheckWallet
eval_tap 0 330 'CheckWallet # SKIP deprecated' test.out

#- 331 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '4erj7fsm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bnqYgQK0' \
    --body '{"amount": 11, "expireAt": "1993-10-28T00:00:00Z", "metadata": {"9AOOLPgE": {}, "OgVfTo0f": {}, "KxG2i29X": {}}, "origin": "GooglePlay", "reason": "8Urrp10f", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 331 'CreditUserWallet' test.out

#- 332 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'OaJpplkT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gq4gb2sq' \
    --request '{"amount": 2, "debitBalanceSource": "TRADE", "metadata": {"4KJhfHrq": {}, "1z1b1Ojg": {}, "gjIoIfbB": {}}, "reason": "eKKc2MeC", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 332 'DebitByWalletPlatform' test.out

#- 333 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'VsvJaSZX' \
    --namespace "$AB_NAMESPACE" \
    --userId '3w52iOo0' \
    --body '{"amount": 76, "metadata": {"CR53YhVp": {}, "EDtvTd1M": {}, "Xx9K2rfs": {}}, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 333 'PayWithUserWallet' test.out

#- 334 GetUserWallet
eval_tap 0 334 'GetUserWallet # SKIP deprecated' test.out

#- 335 DebitUserWallet
eval_tap 0 335 'DebitUserWallet # SKIP deprecated' test.out

#- 336 DisableUserWallet
eval_tap 0 336 'DisableUserWallet # SKIP deprecated' test.out

#- 337 EnableUserWallet
eval_tap 0 337 'EnableUserWallet # SKIP deprecated' test.out

#- 338 ListUserWalletTransactions
eval_tap 0 338 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 339 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yzLttTXD' \
    > test.out 2>&1
eval_tap $? 339 'ListViews' test.out

#- 340 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '8bt1WStY' \
    --body '{"displayOrder": 35, "localizations": {"G5zHY9YC": {"description": "VPA5bqAS", "localExt": {"CgVYZN58": {}, "aGDSfKSR": {}, "wNSYpHhh": {}}, "longDescription": "xGDVQsMq", "title": "SLpJJBsb"}, "mDUEbn73": {"description": "GkapF3eb", "localExt": {"PBasDTrF": {}, "uAcqMW65": {}, "Pwp3yMoJ": {}}, "longDescription": "iLIMvTYG", "title": "4TN5PjGF"}, "VVPQPTXb": {"description": "UDP3Ww5Y", "localExt": {"xAFbVleh": {}, "cMIidssl": {}, "us5uLa4J": {}}, "longDescription": "UfxSOnsa", "title": "9ifNkKuo"}}, "name": "bUqVeIoG"}' \
    > test.out 2>&1
eval_tap $? 340 'CreateView' test.out

#- 341 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'fIJexlI9' \
    --storeId 'l60qGXRq' \
    > test.out 2>&1
eval_tap $? 341 'GetView' test.out

#- 342 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Pe3tS4Cc' \
    --storeId 'Sc343nP8' \
    --body '{"displayOrder": 64, "localizations": {"nOt4LRia": {"description": "giVxSDUT", "localExt": {"PX0pYIiq": {}, "SAaJJWn6": {}, "giBNO43W": {}}, "longDescription": "fBeD2NMx", "title": "afbxcUZ0"}, "HQV8jQyS": {"description": "83XMfZup", "localExt": {"c3LRYlgl": {}, "F7mUiAnf": {}, "W2Cm6zea": {}}, "longDescription": "ik2FWEN9", "title": "6exO8veG"}, "ZZVnpE7l": {"description": "bMF8e4yZ", "localExt": {"liqlWtWY": {}, "JkMTZaFJ": {}, "7jAbugfy": {}}, "longDescription": "svWmM6gJ", "title": "kxZLhuFu"}}, "name": "NdO2D5xG"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateView' test.out

#- 343 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'o4FXnK2G' \
    --storeId '3uzyiz2F' \
    > test.out 2>&1
eval_tap $? 343 'DeleteView' test.out

#- 344 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'GetWalletConfig' test.out

#- 345 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWalletConfig' test.out

#- 346 QueryWallets
eval_tap 0 346 'QueryWallets # SKIP deprecated' test.out

#- 347 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 95, "expireAt": "1983-03-13T00:00:00Z", "metadata": {"lXMz5HS7": {}, "6Cob83AO": {}, "11hd1khG": {}}, "origin": "IOS", "reason": "2ZDH2RZ5", "source": "DLC"}, "currencyCode": "XbWSfgTs", "userIds": ["gUlFWo0T", "V8OmK4X4", "gaXVgjEQ"]}, {"creditRequest": {"amount": 12, "expireAt": "1989-01-21T00:00:00Z", "metadata": {"NLhzTT4I": {}, "EYyjpaZk": {}, "F4wjimkL": {}}, "origin": "Oculus", "reason": "VvOAffGx", "source": "ACHIEVEMENT"}, "currencyCode": "G1frTRYT", "userIds": ["kmJLbeiT", "VvoKWKwh", "A5LxZhXc"]}, {"creditRequest": {"amount": 32, "expireAt": "1973-02-22T00:00:00Z", "metadata": {"xcRZaSOd": {}, "4evgIEIp": {}, "IrqKfSfP": {}}, "origin": "GooglePlay", "reason": "sFTkdST2", "source": "SELL_BACK"}, "currencyCode": "vhncsIv6", "userIds": ["MWNjYDod", "uyk4BT3J", "nwXrq3sl"]}]' \
    > test.out 2>&1
eval_tap $? 347 'BulkCredit' test.out

#- 348 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "LNU7yl8Y", "request": {"allowOverdraft": false, "amount": 25, "balanceOrigin": "Playstation", "balanceSource": "EXPIRATION", "metadata": {"Td9zTovY": {}, "UQBt207a": {}, "BIJFvAKb": {}}, "reason": "IlWsNGiE"}, "userIds": ["eVZO9dbw", "XT1JMZXo", "CxJqNNsc"]}, {"currencyCode": "YH91sSlY", "request": {"allowOverdraft": false, "amount": 23, "balanceOrigin": "IOS", "balanceSource": "OTHER", "metadata": {"4wk7W0la": {}, "bC0hJW2Y": {}, "9pvgJoHD": {}}, "reason": "NYHff9eD"}, "userIds": ["YAXgr1Jb", "tdgTDbm1", "yCYYBmlZ"]}, {"currencyCode": "P2xP4qVA", "request": {"allowOverdraft": true, "amount": 65, "balanceOrigin": "Steam", "balanceSource": "ORDER_REVOCATION", "metadata": {"dSbBn7dZ": {}, "qQdVS9Iq": {}, "OweeqD9R": {}}, "reason": "Ky9tnycK"}, "userIds": ["R6UUimAv", "tQvZvu5R", "7dqM5yQH"]}]' \
    > test.out 2>&1
eval_tap $? 348 'BulkDebit' test.out

#- 349 GetWallet
eval_tap 0 349 'GetWallet # SKIP deprecated' test.out

#- 350 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'W2libE9T' \
    --end 'pkD2XSlI' \
    --start 'gc1W4SMp' \
    > test.out 2>&1
eval_tap $? 350 'SyncOrders' test.out

#- 351 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["VgmIIEl1", "YmGr3FO1", "RyRcUxln"], "apiKey": "47jVd0CW", "authoriseAsCapture": true, "blockedPaymentMethods": ["WVr2UG9p", "vPWA7nSi", "rPLs5t8v"], "clientKey": "7LAJB2iO", "dropInSettings": "hEh49OGE", "liveEndpointUrlPrefix": "lsYzDOOS", "merchantAccount": "In2X40lH", "notificationHmacKey": "rTc6RuZ6", "notificationPassword": "mIspsoxc", "notificationUsername": "HBVxuv2v", "returnUrl": "3zCroaMo", "settings": "jHS9bg8j"}' \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfig' test.out

#- 352 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "33nGUa2q", "privateKey": "hzLrH2Dh", "publicKey": "jWxoghWP", "returnUrl": "IB9fWzHe"}' \
    > test.out 2>&1
eval_tap $? 352 'TestAliPayConfig' test.out

#- 353 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "8CyJ3oCG", "secretKey": "57ujJ9FK"}' \
    > test.out 2>&1
eval_tap $? 353 'TestCheckoutConfig' test.out

#- 354 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '8dN1JvvE' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentMerchantConfig' test.out

#- 355 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "ZTo74B0w", "webhookSecretKey": "mX4lZwih"}' \
    > test.out 2>&1
eval_tap $? 355 'TestNeonPayConfig' test.out

#- 356 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "dDkXVADY", "clientSecret": "5M5LmIOA", "returnUrl": "AYyeE8MZ", "webHookId": "S0YgUq7S"}' \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfig' test.out

#- 357 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["NVkF5hL3", "g5PYZ4ab", "URUVec4a"], "publishableKey": "gj70ZiUU", "secretKey": "aapEpnDP", "webhookSecret": "0biuLDde"}' \
    > test.out 2>&1
eval_tap $? 357 'TestStripeConfig' test.out

#- 358 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "T1Dcxw5Q", "key": "hiHtbnr7", "mchid": "SzBhhqUr", "returnUrl": "4h9oAoPz"}' \
    > test.out 2>&1
eval_tap $? 358 'TestWxPayConfig' test.out

#- 359 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "jGqKNCer", "flowCompletionUrl": "AdhPQnxe", "merchantId": 48, "projectId": 11, "projectSecretKey": "Vy72SAye"}' \
    > test.out 2>&1
eval_tap $? 359 'TestXsollaConfig' test.out

#- 360 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'fNi9Lhb2' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentMerchantConfig1' test.out

#- 361 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'n2hn7f9X' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["WOpNZjTD", "h312LOFT", "6nerB5qf"], "apiKey": "211VQLFM", "authoriseAsCapture": true, "blockedPaymentMethods": ["ktnySOyC", "xgfE1d1x", "20C4hNkF"], "clientKey": "MmrCYBTo", "dropInSettings": "OTWbWS42", "liveEndpointUrlPrefix": "SgHmjjsM", "merchantAccount": "k1WVWVOG", "notificationHmacKey": "aE3lf2Zv", "notificationPassword": "3RI4671l", "notificationUsername": "DSB6WF8B", "returnUrl": "BE1ZdJKI", "settings": "OhiH1gjB"}' \
    > test.out 2>&1
eval_tap $? 361 'UpdateAdyenConfig' test.out

#- 362 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'bGE2A3mW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfigById' test.out

#- 363 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'C5NQR3tZ' \
    --sandbox  \
    --validate  \
    --body '{"appId": "J1xMOvio", "privateKey": "dGMyRvaK", "publicKey": "0vyp5EPG", "returnUrl": "7ZP68FBN"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAliPayConfig' test.out

#- 364 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'VC4qKz43' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAliPayConfigById' test.out

#- 365 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '9aVcFB6H' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "4lZiKZoT", "secretKey": "hfz6NLue"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateCheckoutConfig' test.out

#- 366 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'e4m5RBWh' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestCheckoutConfigById' test.out

#- 367 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'maSQSY7Q' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "r4h2VJaX", "webhookSecretKey": "DQcT8lWC"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateNeonPayConfig' test.out

#- 368 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'n9HYibMk' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestNeonPayConfigById' test.out

#- 369 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'hwrW3CMY' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "2VhtQN5F", "clientSecret": "u1wR2SGe", "returnUrl": "J7qD1TxA", "webHookId": "ta6ZQDZb"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdatePayPalConfig' test.out

#- 370 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'w3HQ61pI' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestPayPalConfigById' test.out

#- 371 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'Z672Z2P5' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["PHMacmFD", "isCGrXkA", "gKfPggZE"], "publishableKey": "5mD1HGE7", "secretKey": "f1jSKYoX", "webhookSecret": "cMSgDVB5"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdateStripeConfig' test.out

#- 372 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'LvxmjhTb' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestStripeConfigById' test.out

#- 373 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'C8uAtuqM' \
    --validate  \
    --body '{"appId": "04xNN37Y", "key": "sLcJBIKI", "mchid": "6nc8qcK7", "returnUrl": "EIm0WCIF"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateWxPayConfig' test.out

#- 374 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'tndVbg5l' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 374 'UpdateWxPayConfigCert' test.out

#- 375 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'l972RL5N' \
    > test.out 2>&1
eval_tap $? 375 'TestWxPayConfigById' test.out

#- 376 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '0YkgS0od' \
    --validate  \
    --body '{"apiKey": "nf2xKlvs", "flowCompletionUrl": "sxmYbMto", "merchantId": 81, "projectId": 9, "projectSecretKey": "lvK5N17o"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateXsollaConfig' test.out

#- 377 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'w6H2RXNI' \
    > test.out 2>&1
eval_tap $? 377 'TestXsollaConfigById' test.out

#- 378 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'UAPproVZ' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaUIConfig' test.out

#- 379 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '33' \
    --namespace "$AB_NAMESPACE" \
    --offset '27' \
    --region 'j95g27Dr' \
    > test.out 2>&1
eval_tap $? 379 'QueryPaymentProviderConfig' test.out

#- 380 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "9pDu0mIS", "region": "uN9KsXVC", "sandboxTaxJarApiToken": "uKOw4Mxn", "specials": ["CHECKOUT", "WALLET", "CHECKOUT"], "taxJarApiToken": "kywfRXck", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 380 'CreatePaymentProviderConfig' test.out

#- 381 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 381 'GetAggregatePaymentProviders' test.out

#- 382 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'e1pXwceN' \
    > test.out 2>&1
eval_tap $? 382 'DebugMatchedPaymentProviderConfig' test.out

#- 383 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetSpecialPaymentProviders' test.out

#- 384 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'u6xgmVjN' \
    --body '{"aggregate": "STRIPE", "namespace": "yB5H2CEI", "region": "qL94GOfe", "sandboxTaxJarApiToken": "1XrS6JQV", "specials": ["ADYEN", "NEONPAY", "PAYPAL"], "taxJarApiToken": "Sqrzx46f", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 384 'UpdatePaymentProviderConfig' test.out

#- 385 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'DqMv67pb' \
    > test.out 2>&1
eval_tap $? 385 'DeletePaymentProviderConfig' test.out

#- 386 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 386 'GetPaymentTaxConfig' test.out

#- 387 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "4tbEZeyE", "taxJarApiToken": "ojvvmypq", "taxJarEnabled": false, "taxJarProductCodesMapping": {"n0fdOh8K": "Zfxe0lcb", "NmRHaqhp": "GGuUYKaR", "oe8iwx3R": "bxyohdHh"}}' \
    > test.out 2>&1
eval_tap $? 387 'UpdatePaymentTaxConfig' test.out

#- 388 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'bY01fTge' \
    --end 'SOAg7rsH' \
    --start 'HGQgL9T6' \
    > test.out 2>&1
eval_tap $? 388 'SyncPaymentOrders' test.out

#- 389 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'KLma8Mh2' \
    --storeId 'mhnYBZWm' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetRootCategories' test.out

#- 390 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'nZJQ6AGz' \
    --storeId 'iGNHuqFU' \
    > test.out 2>&1
eval_tap $? 390 'DownloadCategories' test.out

#- 391 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'qBNrU3UW' \
    --namespace "$AB_NAMESPACE" \
    --language '7jnA410F' \
    --storeId 'RGsJsBEP' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetCategory' test.out

#- 392 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'XOJw3uiO' \
    --namespace "$AB_NAMESPACE" \
    --language 'zRa0zuji' \
    --storeId 'LgZPDI3X' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetChildCategories' test.out

#- 393 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'gdSnkv4C' \
    --namespace "$AB_NAMESPACE" \
    --language 'a4cuor7a' \
    --storeId 'BEd5qWNI' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetDescendantCategories' test.out

#- 394 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 394 'PublicListCurrencies' test.out

#- 395 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 395 'GeDLCDurableRewardShortMap' test.out

#- 396 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 396 'GetAppleConfigVersion' test.out

#- 397 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 397 'GetIAPItemMapping' test.out

#- 398 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'UyStQ2xo' \
    --region 'IaiO7EG5' \
    --storeId 'XeW8z5jR' \
    --appId '3CxiHdOv' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItemByAppId' test.out

#- 399 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'jU55jMn3' \
    --categoryPath '0ngSV4Fw' \
    --features 'FmDvNZgo' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'kErVjebc' \
    --limit '67' \
    --offset '31' \
    --region 'kTs2rzUz' \
    --sortBy 'updatedAt,updatedAt:asc' \
    --storeId 'i38NvU6C' \
    --tags 'JvkEYUfP' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryItems' test.out

#- 400 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'VFmwelX1' \
    --region '1iXyDBwc' \
    --storeId 'FjixFbhJ' \
    --sku 'bWNVZKso' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemBySku' test.out

#- 401 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '2DJjB2o7' \
    --storeId '87RawXQJ' \
    --itemIds 'F3aC23ra' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetEstimatedPrice' test.out

#- 402 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Ej5OHKhj' \
    --region 'vVazQooY' \
    --storeId 'ynUi44Vy' \
    --itemIds '0L7k6yNN' \
    > test.out 2>&1
eval_tap $? 402 'PublicBulkGetItems' test.out

#- 403 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["lYXfrMTg", "ogl6q2lY", "wR6IxCWC"]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicValidateItemPurchaseCondition' test.out

#- 404 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'MEDIA' \
    --limit '85' \
    --offset '0' \
    --region 'GEix0Yh9' \
    --storeId 'CQ1H3cDN' \
    --keyword 'OjVuLFKM' \
    --language 'RJQ6NTLT' \
    > test.out 2>&1
eval_tap $? 404 'PublicSearchItems' test.out

#- 405 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'IN3YdJNU' \
    --namespace "$AB_NAMESPACE" \
    --language 'VuiyQ20P' \
    --region 'ctZbqiw2' \
    --storeId 'gnX3hO5E' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetApp' test.out

#- 406 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'tLjsBHOd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetItemDynamicData' test.out

#- 407 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'EqlTVagn' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'iYcqJ2q9' \
    --populateBundle  \
    --region 'KdDG1YgA' \
    --storeId 'JEbFNld7' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItem' test.out

#- 408 GetPaymentCustomization
eval_tap 0 408 'GetPaymentCustomization # SKIP deprecated' test.out

#- 409 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "rjTKx0rk", "successUrl": "GG81MVfj"}, "paymentOrderNo": "ak8s9MKx", "paymentProvider": "ALIPAY", "returnUrl": "QgvrUmEQ", "ui": "8DeJin67", "zipCode": "SsbddYyo"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetPaymentUrl' test.out

#- 410 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ecELJz6m' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetPaymentMethods' test.out

#- 411 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'EaTQ0V8T' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUnpaidPaymentOrder' test.out

#- 412 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Tx4R75dq' \
    --paymentProvider 'STRIPE' \
    --zipCode 'mJWxGKGJ' \
    --body '{"token": "xW4FE6hR"}' \
    > test.out 2>&1
eval_tap $? 412 'Pay' test.out

#- 413 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lU7SmcX5' \
    > test.out 2>&1
eval_tap $? 413 'PublicCheckPaymentOrderPaidStatus' test.out

#- 414 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'XXD2t3jO' \
    > test.out 2>&1
eval_tap $? 414 'GetPaymentPublicConfig' test.out

#- 415 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'XWYzYtTf' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetQRCode' test.out

#- 416 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'himrpKxv' \
    --foreinginvoice 'xi0BDLhv' \
    --invoiceId 'dR2KNqWs' \
    --payload 'DjjKI6VX' \
    --redirectResult 'nmE4MiWh' \
    --resultCode 'JvHEf106' \
    --sessionId 'ltaQRRny' \
    --status 'ngktZhXt' \
    --token 'XXMIFixg' \
    --type 'bnWgbkL1' \
    --userId 'e1rIzxo5' \
    --orderNo '7vAAUT6K' \
    --paymentOrderNo 'gRRNACO4' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'NRtyhfzF' \
    > test.out 2>&1
eval_tap $? 416 'PublicNormalizePaymentReturnUrl' test.out

#- 417 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '9huSvN1r' \
    --paymentOrderNo '7TDWuA69' \
    --paymentProvider 'STRIPE' \
    > test.out 2>&1
eval_tap $? 417 'GetPaymentTaxValue' test.out

#- 418 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'qMGAc39F' \
    > test.out 2>&1
eval_tap $? 418 'GetRewardByCode' test.out

#- 419 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'IC3oW5Xn' \
    --limit '0' \
    --offset '89' \
    --sortBy 'rewardCode,rewardCode:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 419 'QueryRewards1' test.out

#- 420 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vQlxm0ys' \
    > test.out 2>&1
eval_tap $? 420 'GetReward1' test.out

#- 421 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 421 'PublicListStores' test.out

#- 422 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'DYNc3fZq,lM688o0t,ah4gascR' \
    --itemIds 'hdvoEOU2,2y9g5ILH,6amo5c7L' \
    --skus 'DtLfSBAs,jtGXNmpc,0ai5UJ1l' \
    > test.out 2>&1
eval_tap $? 422 'PublicExistsAnyMyActiveEntitlement' test.out

#- 423 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'FlzvXcJr' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 424 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'hvOlyn43' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 425 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'RpJcwpgz' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 426 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'IsPp5hH8,GCSa78EZ,MyJ47zjg' \
    --itemIds 'RWtMGF8R,7CxTF9iv,RSIcxroT' \
    --skus 'OWHVdA0g,Jm4oIeIp,hLqllohU' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetEntitlementOwnershipToken' test.out

#- 427 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "tSBta2X7", "language": "Mmze_373", "region": "1MGVNPXU"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncTwitchDropsEntitlement' test.out

#- 428 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'XAsutTix' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyWallet' test.out

#- 429 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdDxrpTg' \
    --body '{"epicGamesJwtToken": "h0lMaHbD"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncEpicGameDLC' test.out

#- 430 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlRfWPDP' \
    > test.out 2>&1
eval_tap $? 430 'SyncOculusDLC' test.out

#- 431 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3ceoPQW' \
    --body '{"serviceLabel": 38}' \
    > test.out 2>&1
eval_tap $? 431 'PublicSyncPsnDlcInventory' test.out

#- 432 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cpofhlXs' \
    --body '{"serviceLabels": [10, 68, 82]}' \
    > test.out 2>&1
eval_tap $? 432 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 433 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'SI7mmd6M' \
    --body '{"appId": "qnKpyZCk", "steamId": "2W3okBOg"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncSteamDLC' test.out

#- 434 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'atNDZo6r' \
    --body '{"xstsToken": "BJ3GX6uN"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxDLC' test.out

#- 435 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5b3uxtpe' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'mTQKYDqR' \
    --features 'WvDYY3v1,MuWsY5vp,64pBGLHw' \
    --itemId 'PZbinBiN,fclsKnes,lTbfF4jv' \
    --limit '58' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserEntitlements' test.out

#- 436 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QHTBLOPM' \
    --appId '1VXQaidk' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserAppEntitlementByAppId' test.out

#- 437 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkJbsG4s' \
    --limit '38' \
    --offset '10' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlementsByAppType' test.out

#- 438 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'zXuCwLsH' \
    --availablePlatformOnly  \
    --ids '1wHCM4Ed,nn8rE4QN,qNFwvbQ0' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlementsByIds' test.out

#- 439 PublicGetUserEntitlementByItemId
eval_tap 0 439 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 440 PublicGetUserEntitlementBySku
eval_tap 0 440 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 441 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIiY1C6I' \
    --endDate 'U7X2SVAd' \
    --entitlementClazz 'CODE' \
    --limit '80' \
    --offset '76' \
    --startDate 'ymQwpFsU' \
    > test.out 2>&1
eval_tap $? 441 'PublicUserEntitlementHistory' test.out

#- 442 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WO0zxwyr' \
    --appIds 'Ni1JJOgC,JRhVxEL4,iS26ouWb' \
    --itemIds 'ugGgQZG7,eBNTGZdh,zwFYROyC' \
    --skus '5XXCcjeG,c2sEoyKd,tcjlwWiL' \
    > test.out 2>&1
eval_tap $? 442 'PublicExistsAnyUserActiveEntitlement' test.out

#- 443 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '21ScYwpV' \
    --appId 'scZHSSv2' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 444 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QsDRhgRG' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'cFoAcKRg' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 445 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'fcBAoEqb' \
    --ids 'ltbbQGCn,ZRhXWlV5,DSmqeQYT' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 446 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ONHLjBUK' \
    --entitlementClazz 'LOOTBOX' \
    --sku '56ahzRYn' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 447 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'gddwQi13' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cka4CMp8' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlement' test.out

#- 448 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'LckmuJM8' \
    --namespace "$AB_NAMESPACE" \
    --userId 's17jUa2c' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["VymvwZXo", "07TA0MjI", "a151GgMi"], "requestId": "8VjQiQXM", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 448 'PublicConsumeUserEntitlement' test.out

#- 449 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'X4vzI6iZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFQ8sRZx' \
    --body '{"requestId": "AQFywb2t", "useCount": 20}' \
    > test.out 2>&1
eval_tap $? 449 'PublicSellUserEntitlement' test.out

#- 450 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'mEeehO9O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'unCHOEwv' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 450 'PublicSplitUserEntitlement' test.out

#- 451 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'UKkNK1WH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1b1IuDV' \
    --body '{"entitlementId": "wf8b5dDE", "metadata": {"operationSource": "INVENTORY"}, "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 451 'PublicTransferUserEntitlement' test.out

#- 452 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'PVq3PXqx' \
    --body '{"code": "b31kaqt1", "language": "la_GCrJ", "region": "djpnhngG"}' \
    > test.out 2>&1
eval_tap $? 452 'PublicRedeemCode' test.out

#- 453 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jbZRXn42' \
    --body '{"excludeOldTransactions": false, "language": "iis-229", "productId": "F0XSjrsx", "receiptData": "3aRlGVHE", "region": "NJ7CsBvg", "transactionId": "pvH48WO3"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicFulfillAppleIAPItem' test.out

#- 454 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'utElzqhc' \
    --body '{"epicGamesJwtToken": "BzVQGpyp"}' \
    > test.out 2>&1
eval_tap $? 454 'SyncEpicGamesInventory' test.out

#- 455 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhbqWc9a' \
    --body '{"autoAck": false, "autoConsume": false, "language": "iktq-bHCC-070", "orderId": "GxLVHh3E", "packageName": "tC2M3w4c", "productId": "yXRCNcj0", "purchaseTime": 18, "purchaseToken": "4gChA95t", "region": "pj3uZpRe", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillGoogleIAPItem' test.out

#- 456 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'NT19D8U3' \
    > test.out 2>&1
eval_tap $? 456 'SyncOculusConsumableEntitlements' test.out

#- 457 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '4f7XVlpb' \
    --body '{"currencyCode": "VO78DEid", "price": 0.8049374394449924, "productId": "XXg6Qsoc", "serviceLabel": 1}' \
    > test.out 2>&1
eval_tap $? 457 'PublicReconcilePlayStationStore' test.out

#- 458 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'kkCVByjw' \
    --body '{"currencyCode": "EEZb5OJz", "price": 0.3488886597860773, "productId": "cvkLnQJz", "serviceLabels": [35, 86, 14]}' \
    > test.out 2>&1
eval_tap $? 458 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 459 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8KXszfQ' \
    --body '{"appId": "B5HrKOL4", "currencyCode": "aw3yCoi6", "language": "Og_ZrVw", "price": 0.9730630128007937, "productId": "FUaTu182", "region": "gcRpYajO", "steamId": "bIDl8PVI"}' \
    > test.out 2>&1
eval_tap $? 459 'SyncSteamInventory' test.out

#- 460 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVCbsPZE' \
    > test.out 2>&1
eval_tap $? 460 'SyncSteamAbnormalTransaction' test.out

#- 461 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '54na3xnk' \
    --body '{"orderId": "a4SRyTeL"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamIAPByTransaction' test.out

#- 462 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId '8Xkf2DWC' \
    --activeOnly  \
    --groupId 'JtphVH5X' \
    --limit '31' \
    --offset '46' \
    --productId '4KV4bdXT' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserThirdPartySubscription' test.out

#- 463 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X7vEmC9O' \
    --body '{"gameId": "uE3eBQuq", "language": "dOKE-tz", "region": "HKrg617U"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncTwitchDropsEntitlement1' test.out

#- 464 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'yzwnAKR9' \
    --body '{"currencyCode": "w4KmEZjN", "price": 0.08490318192789392, "productId": "YpmJfPuA", "xstsToken": "YO3MaMyf"}' \
    > test.out 2>&1
eval_tap $? 464 'SyncXboxInventory' test.out

#- 465 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PgHgKbUC' \
    --discounted  \
    --itemId '4KlXD795' \
    --limit '95' \
    --offset '69' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 465 'PublicQueryUserOrders' test.out

#- 466 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'w2GERGr9' \
    --body '{"currencyCode": "JuIQyLUa", "discountCodes": ["pmNcsCli", "Y0GsbdGd", "VIz2nr9Y"], "discountedPrice": 53, "ext": {"TzFfE6Oh": {}, "YOz7TlJo": {}, "tRKyi2Gp": {}}, "itemId": "kNWDIuMb", "language": "iBB-472", "price": 1, "quantity": 54, "region": "M0K79CTL", "returnUrl": "zkpoRzVX", "sectionId": "dOaHlRQx"}' \
    > test.out 2>&1
eval_tap $? 466 'PublicCreateUserOrder' test.out

#- 467 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'SCrBgon9' \
    --body '{"currencyCode": "9wuhq8s0", "discountCodes": ["Da7lsaQ2", "SKCPHV7y", "adjn5P2B"], "discountedPrice": 4, "itemId": "8da0rXFS", "price": 0, "quantity": 61}' \
    > test.out 2>&1
eval_tap $? 467 'PublicPreviewOrderPrice' test.out

#- 468 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IufUTe5I' \
    --userId 'W3hX6PWK' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserOrder' test.out

#- 469 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L1e9fvXf' \
    --userId 'YyPb5Qin' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelUserOrder' test.out

#- 470 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZNIPwOuu' \
    --userId 'pG4pG1M2' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrderHistories' test.out

#- 471 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mJA4IiIg' \
    --userId 'oF7P431A' \
    > test.out 2>&1
eval_tap $? 471 'PublicDownloadUserOrderReceipt' test.out

#- 472 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '6qJTb82D' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetPaymentAccounts' test.out

#- 473 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'bOvPhmFW' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'L28HcE8e' \
    > test.out 2>&1
eval_tap $? 473 'PublicDeletePaymentAccount' test.out

#- 474 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDwfCebQ' \
    --autoCalcEstimatedPrice  \
    --language '1icJbnWC' \
    --region 'MyJc1iJQ' \
    --storeId 'cg2m9BhH' \
    --viewId 'bUkZpdIM' \
    > test.out 2>&1
eval_tap $? 474 'PublicListActiveSections' test.out

#- 475 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'APn7GqUW' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '9eixEQ1i' \
    --limit '99' \
    --offset '57' \
    --sku '0oOIbjHK' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserSubscriptions' test.out

#- 476 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkNzg92m' \
    --body '{"currencyCode": "cbJ2a75R", "itemId": "O5AeLx2D", "language": "AaK_HXUe-321", "region": "E5aWz9RX", "returnUrl": "sYtLd32a", "source": "Cm6WPEpP"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicSubscribeSubscription' test.out

#- 477 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLFTm4Hm' \
    --itemId 'XACLHEst' \
    > test.out 2>&1
eval_tap $? 477 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 478 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KdN7VHQY' \
    --userId 'dUxFbxgE' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserSubscription' test.out

#- 479 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9AEmdzkd' \
    --userId 'SCBuXDS6' \
    > test.out 2>&1
eval_tap $? 479 'PublicChangeSubscriptionBillingAccount' test.out

#- 480 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5EQ9DcE9' \
    --userId '5PiIcQXF' \
    --body '{"immediate": true, "reason": "Wxny6ANq"}' \
    > test.out 2>&1
eval_tap $? 480 'PublicCancelSubscription' test.out

#- 481 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cpuuAlvJ' \
    --userId 'pYwNEYBO' \
    --excludeFree  \
    --limit '48' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 481 'PublicGetUserSubscriptionBillingHistories' test.out

#- 482 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZblDHDBp' \
    --language 'uokWLdW4' \
    --storeId 'QAgLHn0E' \
    > test.out 2>&1
eval_tap $? 482 'PublicListViews' test.out

#- 483 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'iqiUpvK7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AWsOUXmZ' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetWallet' test.out

#- 484 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'UwZtPKB9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OIT2LneS' \
    --limit '86' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 484 'PublicListUserWalletTransactions' test.out

#- 485 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetMyDLCContent' test.out

#- 486 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KPLOfPkj' \
    --limit '74' \
    --offset '93' \
    --startTime 'MzRo0nk8' \
    --state 'FULFILL_FAILED' \
    --transactionId 'LK2XtOdS' \
    --userId 'XZxLJts1' \
    > test.out 2>&1
eval_tap $? 486 'QueryFulfillments' test.out

#- 487 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'Fg7JdopL' \
    --baseAppId 'CvyCM72v' \
    --categoryPath 'CHhbu0cK' \
    --features 'QFQWj7Yy' \
    --includeSubCategoryItem  \
    --itemName 'tb09T1bC' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP,LOOTBOX,SEASON' \
    --limit '21' \
    --offset '22' \
    --region 'p7nA3HA4' \
    --sectionExclusive  \
    --sortBy 'name:desc,displayOrder,updatedAt:desc' \
    --storeId 's1Htu87V' \
    --tags 'aWvgz9LP' \
    --targetNamespace '8ufqKWyK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 487 'QueryItemsV2' test.out

#- 488 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kdCL0Yz5' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 488 'ImportStore1' test.out

#- 489 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Rfby5bha' \
    --body '{"itemIds": ["mkAfvBO0", "DTOFIa4P", "ChbPXpA1"]}' \
    > test.out 2>&1
eval_tap $? 489 'ExportStore1' test.out

#- 490 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ztMhwJKq' \
    --body '{"entitlementCollectionId": "3Ebk6GQE", "entitlementOrigin": "Steam", "metadata": {"C2B7nzPk": {}, "IItr3B43": {}, "5b6fy6mY": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "LlPR2hep", "namespace": "AlmtkgNp"}, "item": {"itemId": "fHox3vHY", "itemName": "dnraF7d8", "itemSku": "scclruYP", "itemType": "wxTWVXJA"}, "quantity": 56, "type": "ITEM"}, {"currency": {"currencyCode": "k6NxxNE8", "namespace": "eXBdLENV"}, "item": {"itemId": "SP31MYQa", "itemName": "w795S1NR", "itemSku": "sQUoYxHR", "itemType": "J8uGmSRO"}, "quantity": 66, "type": "ITEM"}, {"currency": {"currencyCode": "R1nHICxT", "namespace": "yjfJGrTH"}, "item": {"itemId": "mlNa3Fz2", "itemName": "M1W32Rij", "itemSku": "TIN3xSOW", "itemType": "eRX4wjUp"}, "quantity": 95, "type": "ITEM"}], "source": "IAP_CHARGEBACK_REVERSED", "transactionId": "vnYnJfZg"}' \
    > test.out 2>&1
eval_tap $? 490 'FulfillRewardsV2' test.out

#- 491 FulfillItems
eval_tap 0 491 'FulfillItems # SKIP deprecated' test.out

#- 492 RetryFulfillItems
eval_tap 0 492 'RetryFulfillItems # SKIP deprecated' test.out

#- 493 RevokeItems
eval_tap 0 493 'RevokeItems # SKIP deprecated' test.out

#- 494 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3rCgiSvk' \
    --body '{"transactionId": "QivlMW9f"}' \
    > test.out 2>&1
eval_tap $? 494 'V2PublicFulfillAppleIAPItem' test.out

#- 495 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'RdCyDnAs' \
    --userId 'grm0Eat1' \
    --body '{"items": [{"duration": 1, "endDate": "1986-10-25T00:00:00Z", "entitlementCollectionId": "SjcCPOzX", "entitlementOrigin": "Xbox", "itemId": "cCx06fia", "itemSku": "YEy55J3L", "language": "elV5N49G", "metadata": {"Wrr2Tgvu": {}, "UcAdPGdi": {}, "l7c3Nb3F": {}}, "orderNo": "7ljY5YS2", "origin": "Twitch", "quantity": 79, "region": "dR3RVwWa", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1978-05-12T00:00:00Z", "storeId": "fvoMiJ1h"}, {"duration": 59, "endDate": "1977-09-16T00:00:00Z", "entitlementCollectionId": "DjtsENrW", "entitlementOrigin": "Xbox", "itemId": "P0NNDV2A", "itemSku": "lRnPQb27", "language": "0hJm3gRN", "metadata": {"0eqHyFWC": {}, "QsZcp4ed": {}, "2ms6ZSbp": {}}, "orderNo": "UcTW9oz0", "origin": "GooglePlay", "quantity": 27, "region": "XMd0ttNH", "source": "CONSUME_ENTITLEMENT", "startDate": "1972-12-05T00:00:00Z", "storeId": "2oR2c7Qw"}, {"duration": 30, "endDate": "1999-08-19T00:00:00Z", "entitlementCollectionId": "YUehA1Nk", "entitlementOrigin": "Epic", "itemId": "UiT7kO4i", "itemSku": "JjHvsnqq", "language": "cFrKclGB", "metadata": {"qMUzf9N3": {}, "JRZ9XwfY": {}, "YzVbKIGe": {}}, "orderNo": "Gfa7HNFt", "origin": "Playstation", "quantity": 97, "region": "JTcMBRHh", "source": "REDEEM_CODE", "startDate": "1981-09-10T00:00:00Z", "storeId": "slGKpT7w"}]}' \
    > test.out 2>&1
eval_tap $? 495 'FulfillItemsV3' test.out

#- 496 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'mUHDt8HM' \
    --userId '9dmg9TkK' \
    > test.out 2>&1
eval_tap $? 496 'RetryFulfillItemsV3' test.out

#- 497 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'QopA4Fc8' \
    --userId 'Zjzq5OQE' \
    > test.out 2>&1
eval_tap $? 497 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
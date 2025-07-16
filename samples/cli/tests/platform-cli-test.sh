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
    --id 'LQoKkc85' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'Exa83IBD' \
    --body '{"grantDays": "gxryDn1P"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'w7gCMVXF' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '3L1zYuLj' \
    --body '{"grantDays": "I1cdn0wR"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "IM7XgKZN", "dryRun": false, "fulfillmentUrl": "HTOoc66n", "itemType": "SEASON", "purchaseConditionUrl": "DYuCZIsl"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'eR0kmqTP' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'Qb24PMW2' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'wH36PCQM' \
    --body '{"clazz": "q640dZZA", "dryRun": true, "fulfillmentUrl": "RDPGKJLh", "purchaseConditionUrl": "2rudZnla"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'mftUEeB7' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --name '6tzXc4W3' \
    --offset '65' \
    --tag 'uqPidzmY' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "F1gFvOsS", "discountConfig": {"categories": [{"categoryPath": "3DqG4zA7", "includeSubCategories": false}, {"categoryPath": "Mpc0jxrv", "includeSubCategories": true}, {"categoryPath": "AxXy8Xay", "includeSubCategories": true}], "currencyCode": "nfe5z0bV", "currencyNamespace": "uEve3PMJ", "discountAmount": 36, "discountPercentage": 0, "discountType": "PERCENTAGE", "items": [{"itemId": "amMi3H0j", "itemName": "V5PxeeYm"}, {"itemId": "7Ghi0GYi", "itemName": "MO3yXYtk"}, {"itemId": "Kx8IpOv7", "itemName": "KECCLgfS"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 82, "itemId": "clwjk1jq", "itemName": "Row444T0", "quantity": 83}, {"extraSubscriptionDays": 38, "itemId": "kdowd8nx", "itemName": "FU3ENbp6", "quantity": 68}, {"extraSubscriptionDays": 4, "itemId": "FOcIA95K", "itemName": "3EFQsrfU", "quantity": 37}], "maxRedeemCountPerCampaignPerUser": 94, "maxRedeemCountPerCode": 53, "maxRedeemCountPerCodePerUser": 78, "maxSaleCount": 76, "name": "dkWJngDl", "redeemEnd": "1978-10-27T00:00:00Z", "redeemStart": "1995-02-08T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["fzeEK3Ob", "G3B14x25", "E6HsnIe3"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'rXW94mNp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '6cU9iyw2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HSDEDyBX", "discountConfig": {"categories": [{"categoryPath": "MmpKXVVf", "includeSubCategories": false}, {"categoryPath": "NtGtptb7", "includeSubCategories": true}, {"categoryPath": "75tOJd5B", "includeSubCategories": false}], "currencyCode": "uw9HeWPL", "currencyNamespace": "IcySyecz", "discountAmount": 1, "discountPercentage": 28, "discountType": "AMOUNT", "items": [{"itemId": "DPc1chEc", "itemName": "Zk5zJGUd"}, {"itemId": "Mjgb6SLE", "itemName": "8IAFjmCm"}, {"itemId": "gjzrpDJd", "itemName": "2efJTsqh"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 39, "itemId": "m2sghQw4", "itemName": "mLQAjUDI", "quantity": 5}, {"extraSubscriptionDays": 64, "itemId": "9gIHqUyP", "itemName": "9FSiKEbb", "quantity": 56}, {"extraSubscriptionDays": 82, "itemId": "bj1ULn7s", "itemName": "Bn2lk40S", "quantity": 66}], "maxRedeemCountPerCampaignPerUser": 89, "maxRedeemCountPerCode": 46, "maxRedeemCountPerCodePerUser": 69, "maxSaleCount": 6, "name": "oPagLCBO", "redeemEnd": "1983-06-08T00:00:00Z", "redeemStart": "1978-07-27T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["g9mrQnwG", "Mg7nBS8Z", "474IuLob"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'GNy7SEhn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "ZedU7dG2", "oldName": "EA9fYsSY"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'UBkmJBex' \
    --namespace "$AB_NAMESPACE" \
    --batchName '6Bcerr8z' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'DzyOKsVX' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "CATALOG"]}' \
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
    --body '{"appConfig": {"appName": "hzKS5O04"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "2lwb9T7C"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "LqH7utQk"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "owAjrsrQ"}, "extendType": "CUSTOM"}' \
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
    --storeId 'MMHiACOU' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p6bJBsjL' \
    --body '{"categoryPath": "E4ysyJUp", "localizationDisplayNames": {"EQIRDB6C": "7i3fmq60", "p2EVmd4I": "Lp4jgQJc", "V5MkHFW4": "n25v2svd"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '9tRkKIrh' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'FLJW0g3i' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Sh6Ay1Ae' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'rxE8OVzn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uj2CO1ol' \
    --body '{"localizationDisplayNames": {"VniFMsdZ": "c8jaDEpH", "UIAt7Cxg": "Zk3MI7gh", "zDt8Ukgz": "ps03Ah0h"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'Bt02SDnJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3qiI994F' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'aSXWVa5G' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tuv7xqLH' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'xxpOOqMi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CLFhZx7T' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'WCqqZc2c' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'tqkM5UNB' \
    --batchNo '39,59,89' \
    --code '13F1O0ph' \
    --limit '93' \
    --offset '33' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'EjCecvPv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "w5TTNPWL", "codeValue": "7lMNNb6F", "quantity": 54}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'qnTz0pyy' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'KebsVYap' \
    --batchNo '68,15,79' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '0zVVxx42' \
    --namespace "$AB_NAMESPACE" \
    --batchName '7uHLafRO' \
    --batchNo '22,22,98' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'N3mxM3MC' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'zgkVeVCX' \
    --batchNo '68,9,14' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '1H3J5kQX' \
    --namespace "$AB_NAMESPACE" \
    --code 'fZxGJv6z' \
    --limit '41' \
    --offset '75' \
    --userId 'WutuWKxd' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'DjFDfhiQ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'aET10UDc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'jrD9VcL4' \
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
    --body '{"currencyCode": "AK8tPAVO", "currencySymbol": "FlrNeeCF", "currencyType": "VIRTUAL", "decimals": 42, "localizationDescriptions": {"YxQJmH6E": "HpCuFrsC", "wU9ONNpH": "UreIUCsZ", "xp7bv1pG": "osEGgeJx"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'eW0aUpgU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"qSqXbW7F": "UNxGerRN", "sPcze0F0": "RfjIkc8D", "J32LQjQT": "JYWaGUSz"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'JdIJEl4Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'nTyKN4lM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'kFG6BRNa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId '16fxPTcX' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'bf5MUYSQ' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": false, "id": "k2H2YrTM", "rewards": [{"currency": {"currencyCode": "J15OdRlm", "namespace": "ujoqXZO9"}, "item": {"itemId": "0P6YxgrK", "itemName": "EzHCY9Gf", "itemSku": "KfLt8we0", "itemType": "rguqryeh"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "cZey6Qaw", "namespace": "K4BOqZqA"}, "item": {"itemId": "qDKI0yli", "itemName": "QLZPHCHl", "itemSku": "D7d38cLp", "itemType": "d8zQKSK9"}, "quantity": 97, "type": "CURRENCY"}, {"currency": {"currencyCode": "tkhO3DcG", "namespace": "i0bC5aAW"}, "item": {"itemId": "pdBn6MO1", "itemName": "v0bTkYva", "itemSku": "ASzTTGQi", "itemType": "eqa4TjI2"}, "quantity": 8, "type": "ITEM"}], "rvn": 58}, {"autoUpdate": true, "enableRevocation": false, "id": "ttF5EYc3", "rewards": [{"currency": {"currencyCode": "PxkQNIZl", "namespace": "XQ3toVhr"}, "item": {"itemId": "l9kqrgj6", "itemName": "C67mUsvm", "itemSku": "1VN528Gm", "itemType": "1ozXtdtq"}, "quantity": 7, "type": "ITEM"}, {"currency": {"currencyCode": "7f5ExGML", "namespace": "gdDbhNxe"}, "item": {"itemId": "YbfVPDbL", "itemName": "WszHmBe9", "itemSku": "yn0qdeAq", "itemType": "lINoAMmZ"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "8RqiWEZA", "namespace": "YjlDf3P8"}, "item": {"itemId": "f9ruawCS", "itemName": "BL3vWivV", "itemSku": "vj3dfVgk", "itemType": "QUzzcX4k"}, "quantity": 50, "type": "CURRENCY"}], "rvn": 69}, {"autoUpdate": true, "enableRevocation": false, "id": "LTPoOIqj", "rewards": [{"currency": {"currencyCode": "tVy3qrYX", "namespace": "5xHhuCqJ"}, "item": {"itemId": "qtcFknFk", "itemName": "KZwdUgdw", "itemSku": "ZF7kJaoS", "itemType": "16ongzmY"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "0PpTPFTr", "namespace": "0CVBr7gg"}, "item": {"itemId": "soLCmWP6", "itemName": "u4GrGwzj", "itemSku": "ZrEadxNk", "itemType": "01CYgnp2"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "Jxf5Gp2T", "namespace": "Rp8bNXeD"}, "item": {"itemId": "46g5RBjm", "itemName": "T6kvhwn7", "itemSku": "hP8YAq5W", "itemType": "yXZgtAxN"}, "quantity": 28, "type": "ITEM"}], "rvn": 50}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"BiqvNkAY": "K0cFy55c", "28C1knvO": "M6c9bRkz", "8mEbsOD0": "DSIl6WTG"}}, {"platform": "STEAM", "platformDlcIdMap": {"V305sgmw": "M2oRkYXq", "nvFdvnX2": "neTPJqBQ", "WnopVwoh": "b7uueQH7"}}, {"platform": "PSN", "platformDlcIdMap": {"szFxOkOi": "NSnhBLF6", "4y1LKJ4b": "ml9EkVgG", "AshpNc6E": "Rl0CwYT6"}}]}' \
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
    --entitlementName '2qnpLCoR' \
    --itemId '1wYiku74,4ksqYlP9,yfht3xho' \
    --limit '7' \
    --offset '12' \
    --origin 'Steam' \
    --userId 'c5nSwPUH' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements1' test.out

#- 66 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '5734NAQm,gZv8ReCy,7ZBNnOls' \
    --limit '98' \
    --offset '14' \
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
    --body '{"entitlementGrantList": [{"collectionId": "D7spj4VD", "endDate": "1975-08-10T00:00:00Z", "grantedCode": "JCP6hC9h", "itemId": "UPYu6HdD", "itemNamespace": "d5Gd7uXc", "language": "yIV_kPnD", "metadata": {"r6xs4Mkp": {}, "ST4gD7Tm": {}, "ef06hKLQ": {}}, "origin": "Steam", "quantity": 38, "region": "daG4q2XF", "source": "PURCHASE", "startDate": "1974-12-13T00:00:00Z", "storeId": "5OvPw4UY"}, {"collectionId": "ljIuaKeL", "endDate": "1987-07-08T00:00:00Z", "grantedCode": "pTID3xtv", "itemId": "Y75RX2yG", "itemNamespace": "hgIRzp0p", "language": "kz", "metadata": {"4JiiXBPJ": {}, "udHeaPzI": {}, "kMLBvc1q": {}}, "origin": "Oculus", "quantity": 41, "region": "y9mRI3xL", "source": "PURCHASE", "startDate": "1990-06-01T00:00:00Z", "storeId": "BrSwBS55"}, {"collectionId": "jFvPorcj", "endDate": "1973-09-03T00:00:00Z", "grantedCode": "tqw5M5Mf", "itemId": "XdUh4Su1", "itemNamespace": "miu9ppUB", "language": "nuB-960", "metadata": {"hlIOSNq2": {}, "lhd6iXyw": {}, "WvntpjMv": {}}, "origin": "Nintendo", "quantity": 100, "region": "N4Rr2f2Q", "source": "REDEEM_CODE", "startDate": "1972-04-28T00:00:00Z", "storeId": "PnJZ3mZj"}], "userIds": ["fcF3mBNg", "v0T0ft8W", "ILMPMkNx"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["DIfPwjHo", "pHFHl9aT", "eWObQ6sX"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'g6fswiDW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '85' \
    --status 'FAIL' \
    --userId 'lkW0fN5q' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '0vCiZ7XT' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'FFklJXHg' \
    --limit '63' \
    --offset '59' \
    --startTime 'VA2hHRwX' \
    --status 'IGNORED' \
    --userId 'FxOawAnY' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "peHhyCmr", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 82, "clientTransactionId": "j7ajWvIt"}, {"amountConsumed": 6, "clientTransactionId": "9GLe5tYB"}, {"amountConsumed": 42, "clientTransactionId": "q13pWrl7"}], "entitlementId": "KmtbZdyc", "usageCount": 55}, {"clientTransaction": [{"amountConsumed": 15, "clientTransactionId": "wWjGkcUS"}, {"amountConsumed": 38, "clientTransactionId": "W2ooJ6f1"}, {"amountConsumed": 33, "clientTransactionId": "nThZIrT2"}], "entitlementId": "MGohlYaq", "usageCount": 99}, {"clientTransaction": [{"amountConsumed": 1, "clientTransactionId": "iQqZCFZI"}, {"amountConsumed": 21, "clientTransactionId": "3UeKR2t9"}, {"amountConsumed": 79, "clientTransactionId": "sYJERfCs"}], "entitlementId": "NdzJJbhn", "usageCount": 30}], "purpose": "9xe5eWAY"}, "originalTitleName": "6JDCLBMU", "paymentProductSKU": "E2cXOPDI", "purchaseDate": "J9qjTyBu", "sourceOrderItemId": "kos82wXy", "titleName": "6zKfRWVC"}, "eventDomain": "W8vthQVb", "eventSource": "6Hpz0IDz", "eventType": "egP6a3Wg", "eventVersion": 40, "id": "4rmV8sqs", "timestamp": "NsSgeoMq"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "e5zRPI0N", "eventState": "RrrC4CRy", "lineItemId": "ba8hASZw", "orderId": "8IWdgoLx", "productId": "98wCS37B", "productType": "rezkzCH5", "purchasedDate": "UNEfiZT8", "sandboxId": "Vv106Wx1", "skuId": "Gl16exdL", "subscriptionData": {"consumedDurationInDays": 70, "dateTime": "Y2umpHvH", "durationInDays": 71, "recurrenceId": "EbIs2ZNl"}}, "datacontenttype": "eodEp8Ye", "id": "t6Nwx3io", "source": "MOmszbZV", "specVersion": "jlj41H21", "subject": "S8MPPqnh", "time": "IsJfXHUM", "traceparent": "gj8thG4E", "type": "jzJTkya2"}' \
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
    --body '{"appAppleId": 67, "bundleId": "A0KEIzKv", "issuerId": "qthNqG8U", "keyId": "r64DOMF7", "password": "sl2gRAta", "version": "V1"}' \
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
    --body '{"sandboxId": "9x8yvVVi"}' \
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
    --body '{"applicationName": "O0nGHMnr", "notificationTokenAudience": "KAhmBUDj", "notificationTokenEmail": "mQWJnXyM", "packageName": "D2HD9MAz", "serviceAccountId": "0gGPDEaC"}' \
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
    --body '{"data": [{"itemIdentity": "La99MTFb", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"GpBJbT3c": "Dy7MR6PR", "e0hkgctk": "y8msa6Sb", "VouYtDtu": "sGPhQYNL"}}, {"itemIdentity": "xXhS0cOc", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"0QumqSsn": "yc14Y2hD", "kJuDQRMu": "U1jFY8JS", "8oOZSnUe": "8bGcWKVC"}}, {"itemIdentity": "8gWS9JzX", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"u7mGTrGt": "0HqPxs5b", "aK8k3XM5": "gLxjc5ZO", "Q28WpS3Z": "2zXBGbin"}}]}' \
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
    --body '{"appId": "wJlvLdNA", "appSecret": "n60DgGIf"}' \
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
    --body '{"backOfficeServerClientId": "qs8Jg6Mz", "backOfficeServerClientSecret": "b66k9ift", "enableStreamJob": true, "environment": "hWuuYUo4", "streamName": "R4IewXDq", "streamPartnerName": "b5FAzh7m"}' \
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
    --body '{"backOfficeServerClientId": "3TLqoQOg", "backOfficeServerClientSecret": "wxM5yp1o", "enableStreamJob": true, "environment": "cT6WCq8b", "streamName": "owKf2Nks", "streamPartnerName": "g1rS1NmB"}' \
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
    --body '{"appId": "VCoG20FE", "env": "LIVE", "publisherAuthenticationKey": "k4NaxYbO", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "zVlHeOoK", "clientSecret": "n1kqYF5l", "organizationId": "3ks03yaz"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "t9PrzoX0", "entraAppClientSecret": "O7aSawdh", "entraTenantId": "j52yIXwi", "relyingPartyCert": "NuRxAM6D"}' \
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
    --password 'm5f1ecDB' \
    > test.out 2>&1
eval_tap $? 107 'UpdateXblBPCertFile' test.out

#- 108 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '4bjQDP27' \
    --externalId 'RqtisHTC' \
    --limit '57' \
    --offset '42' \
    --source 'OCULUS' \
    --startDate '3xMnbuso' \
    --status 'IGNORED' \
    --type '8Ykco5E5' \
    > test.out 2>&1
eval_tap $? 108 'QueryThirdPartyNotifications' test.out

#- 109 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '46' \
    --orderId 'O7buoqXe' \
    --steamId '77cBPa2W' \
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
    --body '{"env": "LIVE", "lastTime": "1981-11-29T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminResetSteamJobTime' test.out

#- 112 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'ZDc5QPWQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminRefundIAPOrder' test.out

#- 113 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '43' \
    --orderId 'q7WSVjYr' \
    --processStatus 'PROCESSED' \
    --steamId 'JiYcueYq' \
    > test.out 2>&1
eval_tap $? 113 'QuerySteamReportHistories' test.out

#- 114 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'mLH1Rgma' \
    --limit '20' \
    --offset '21' \
    --platform 'TWITCH' \
    --productId 'NpBpZlZw' \
    --userId 'bb9JbWfm' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartySubscription' test.out

#- 115 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'bT2x1WY5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetIAPOrderConsumeDetails' test.out

#- 116 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'EwaRqoml' \
    --feature 'Ccwan0BX' \
    --itemId 'RejeHxiM' \
    --itemType 'MEDIA' \
    --startTime '0t2rAH4c' \
    > test.out 2>&1
eval_tap $? 116 'DownloadInvoiceDetails' test.out

#- 117 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'wFSOWYzA' \
    --feature 'opCMjq91' \
    --itemId 'kW5Y5iPl' \
    --itemType 'SEASON' \
    --startTime 'MfrQJmfk' \
    > test.out 2>&1
eval_tap $? 117 'GenerateInvoiceSummary' test.out

#- 118 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wnqATzW3' \
    --body '{"categoryPath": "SW5UykP0", "targetItemId": "uiVHKs4E", "targetNamespace": "BjsR2EHO"}' \
    > test.out 2>&1
eval_tap $? 118 'SyncInGameItem' test.out

#- 119 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SAjlqnhO' \
    --body '{"appId": "70DKrG9h", "appType": "DLC", "baseAppId": "MYNuAHy6", "boothName": "PHc1llKu", "categoryPath": "adgnPD4G", "clazz": "NJxvXu9f", "displayOrder": 21, "entitlementType": "DURABLE", "ext": {"eRBcxCb1": {}, "ZLmphvRo": {}, "C4o1RSeW": {}}, "features": ["4D6fnTFk", "Lxai4UyP", "9sOb3a7H"], "flexible": true, "images": [{"as": "hwt9zApF", "caption": "a9CSv38K", "height": 31, "imageUrl": "EICM8buU", "smallImageUrl": "JkzVSZTj", "width": 98}, {"as": "M8p9aHQn", "caption": "ZTQcUYOv", "height": 84, "imageUrl": "gWGIMlMm", "smallImageUrl": "FGYDNTxh", "width": 55}, {"as": "abmeXqt8", "caption": "IoEmmiNi", "height": 21, "imageUrl": "heYhZ0gW", "smallImageUrl": "014IzJ5S", "width": 99}], "inventoryConfig": {"customAttributes": {"nh8e1JSP": {}, "g3O6ZLSx": {}, "VOXKVK5G": {}}, "serverCustomAttributes": {"asGAuPUU": {}, "lKArKlnR": {}, "C64Blecm": {}}, "slotUsed": 86}, "itemIds": ["ROhtGGrg", "ztrJJAv5", "su9w05h3"], "itemQty": {"7R5BeHan": 28, "eHgJmarM": 76, "cpZ0Ymzx": 89}, "itemType": "EXTENSION", "listable": true, "localizations": {"4hnnCjth": {"description": "FASCa2nR", "localExt": {"2eIhnrwb": {}, "bmaCb8eo": {}, "MSOHqnI9": {}}, "longDescription": "ZjXpt2pV", "title": "sKQxEDhG"}, "TNKoHSnK": {"description": "Xzco8Z8N", "localExt": {"w6KnntLG": {}, "Sk36EDDV": {}, "K11GxVvj": {}}, "longDescription": "pIfCb07W", "title": "Oq7PvXZb"}, "K0yzX0dH": {"description": "kyxHo672", "localExt": {"5T8slBzr": {}, "tKoZMukL": {}, "seXRxt5q": {}}, "longDescription": "PsU7ge3V", "title": "i0FE5zHY"}}, "lootBoxConfig": {"rewardCount": 60, "rewards": [{"lootBoxItems": [{"count": 46, "duration": 32, "endDate": "1977-08-13T00:00:00Z", "itemId": "Z0lZJcC5", "itemSku": "J2gnfSjn", "itemType": "uFoLUbIi"}, {"count": 45, "duration": 3, "endDate": "1972-02-26T00:00:00Z", "itemId": "iE8X3jKS", "itemSku": "Y8Bs4ScB", "itemType": "5iNEVjTZ"}, {"count": 55, "duration": 54, "endDate": "1992-11-06T00:00:00Z", "itemId": "toBlsplJ", "itemSku": "M3QlxghF", "itemType": "Jb8vXEMr"}], "name": "2b4eIG0Z", "odds": 0.046357290861942624, "type": "REWARD_GROUP", "weight": 14}, {"lootBoxItems": [{"count": 11, "duration": 89, "endDate": "1983-06-16T00:00:00Z", "itemId": "UgNk1WH3", "itemSku": "5eRu6wv6", "itemType": "olIZXDfs"}, {"count": 98, "duration": 28, "endDate": "1996-10-24T00:00:00Z", "itemId": "n74UAFeu", "itemSku": "as5lBoBm", "itemType": "jpu1D87R"}, {"count": 97, "duration": 9, "endDate": "1990-10-21T00:00:00Z", "itemId": "II32DmrV", "itemSku": "T2ju4j5k", "itemType": "TrNrNyNK"}], "name": "y9A3Uus9", "odds": 0.9632175657885977, "type": "REWARD", "weight": 95}, {"lootBoxItems": [{"count": 34, "duration": 78, "endDate": "1995-03-17T00:00:00Z", "itemId": "WCxph6NO", "itemSku": "N5J845x1", "itemType": "V7AxVWcJ"}, {"count": 50, "duration": 13, "endDate": "1994-08-16T00:00:00Z", "itemId": "2Z2HZUlH", "itemSku": "49KbCG6R", "itemType": "Zv1MsIWk"}, {"count": 95, "duration": 95, "endDate": "1990-10-13T00:00:00Z", "itemId": "lkiaMotL", "itemSku": "ZpQCHLcR", "itemType": "7QLps8Dg"}], "name": "HrO44wgn", "odds": 0.6659698449077854, "type": "REWARD_GROUP", "weight": 87}], "rollFunction": "CUSTOM"}, "maxCount": 36, "maxCountPerUser": 81, "name": "xcbOoQyN", "optionBoxConfig": {"boxItems": [{"count": 54, "duration": 94, "endDate": "1992-11-16T00:00:00Z", "itemId": "j2g6wJ18", "itemSku": "H1EHJ3BC", "itemType": "pdQqYfGQ"}, {"count": 1, "duration": 28, "endDate": "1999-05-13T00:00:00Z", "itemId": "41jP8WFV", "itemSku": "pXReTgzU", "itemType": "7FHiN9Qm"}, {"count": 93, "duration": 88, "endDate": "1992-02-03T00:00:00Z", "itemId": "XXalLbeI", "itemSku": "QoGjYMSG", "itemType": "3fyuK7h8"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 75, "fixedTrialCycles": 100, "graceDays": 53}, "regionData": {"1cUYqLsO": [{"currencyCode": "S3KbWydy", "currencyNamespace": "SmaBTz7r", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1981-08-09T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1981-10-28T00:00:00Z", "expireAt": "1980-07-07T00:00:00Z", "price": 42, "purchaseAt": "1978-02-02T00:00:00Z", "trialPrice": 20}, {"currencyCode": "OaUD7j5O", "currencyNamespace": "ZRV59SMa", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1997-05-31T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1996-12-29T00:00:00Z", "expireAt": "1992-12-13T00:00:00Z", "price": 37, "purchaseAt": "1978-04-10T00:00:00Z", "trialPrice": 0}, {"currencyCode": "Qp9t37ff", "currencyNamespace": "PwmjlT3F", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1982-05-13T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1995-07-30T00:00:00Z", "expireAt": "1992-02-13T00:00:00Z", "price": 32, "purchaseAt": "1973-02-01T00:00:00Z", "trialPrice": 18}], "qv25oUB3": [{"currencyCode": "Ir9zSO9m", "currencyNamespace": "wjtzZUfl", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1972-07-18T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1998-07-31T00:00:00Z", "expireAt": "1996-09-28T00:00:00Z", "price": 95, "purchaseAt": "1975-03-22T00:00:00Z", "trialPrice": 6}, {"currencyCode": "L2xdwmtZ", "currencyNamespace": "8UXg40tZ", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1993-01-11T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1983-04-06T00:00:00Z", "expireAt": "1995-10-29T00:00:00Z", "price": 62, "purchaseAt": "1994-01-23T00:00:00Z", "trialPrice": 78}, {"currencyCode": "akTxfxiK", "currencyNamespace": "EVvNJM89", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1980-09-18T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1993-04-30T00:00:00Z", "expireAt": "1971-07-21T00:00:00Z", "price": 68, "purchaseAt": "1971-03-24T00:00:00Z", "trialPrice": 66}], "3SiT2XzO": [{"currencyCode": "18kELPze", "currencyNamespace": "wzs6eoGn", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1994-03-29T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1983-04-21T00:00:00Z", "expireAt": "1993-12-12T00:00:00Z", "price": 97, "purchaseAt": "1986-10-15T00:00:00Z", "trialPrice": 83}, {"currencyCode": "adfljWsb", "currencyNamespace": "rCg4n4OI", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1980-04-11T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1989-10-17T00:00:00Z", "expireAt": "1984-09-27T00:00:00Z", "price": 80, "purchaseAt": "1985-07-23T00:00:00Z", "trialPrice": 82}, {"currencyCode": "nu2k61tM", "currencyNamespace": "HBDFB8sw", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1987-12-30T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1999-03-21T00:00:00Z", "expireAt": "1997-01-04T00:00:00Z", "price": 96, "purchaseAt": "1991-11-11T00:00:00Z", "trialPrice": 89}]}, "saleConfig": {"currencyCode": "sSBmThuz", "price": 70}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "YBVYzdeZ", "stackable": false, "status": "ACTIVE", "tags": ["WmxbvApX", "JfcMMoTz", "yD0MxkaJ"], "targetCurrencyCode": "xOjdJrke", "targetNamespace": "LsMoW99J", "thumbnailUrl": "SiseaCjM", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 119 'CreateItem' test.out

#- 120 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'vjfRTNDb' \
    --appId 'h9MrTKrj' \
    > test.out 2>&1
eval_tap $? 120 'GetItemByAppId' test.out

#- 121 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'ynHKQKzQ' \
    --baseAppId 'rX65hMKb' \
    --categoryPath 'GL8aRdW3' \
    --features 'Q9iyVWbp' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --limit '36' \
    --offset '29' \
    --region 'LFbJw6lW' \
    --sortBy 'displayOrder:desc,updatedAt,updatedAt:asc' \
    --storeId 'IHKfHIqX' \
    --tags '0k16DsEe' \
    --targetNamespace 'ay60PKNF' \
    > test.out 2>&1
eval_tap $? 121 'QueryItems' test.out

#- 122 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '8axG3J3t,FjjnKHux,fcRsmDO1' \
    > test.out 2>&1
eval_tap $? 122 'ListBasicItemsByFeatures' test.out

#- 123 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2em9ackd' \
    --itemIds 'ikGe6MeN' \
    > test.out 2>&1
eval_tap $? 123 'GetItems' test.out

#- 124 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'h0f3Z09E' \
    --sku 'jarocHyR' \
    > test.out 2>&1
eval_tap $? 124 'GetItemBySku' test.out

#- 125 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '70FzZrBe' \
    --populateBundle  \
    --region 'MUBluMjm' \
    --storeId 'd1EoflV5' \
    --sku '9uMsccQr' \
    > test.out 2>&1
eval_tap $? 125 'GetLocaleItemBySku' test.out

#- 126 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'qFkKY3cc' \
    --region '831zs1lN' \
    --storeId 'KS6dneEB' \
    --itemIds 'ngoZR9lG' \
    --userId '8o5de1nb' \
    > test.out 2>&1
eval_tap $? 126 'GetEstimatedPrice' test.out

#- 127 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'XqGZ7jmq' \
    --sku 'FcZFDKxA' \
    > test.out 2>&1
eval_tap $? 127 'GetItemIdBySku' test.out

#- 128 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'pEB4XDdm,alZt3mvM,VMZUNdJZ' \
    --storeId 'qqU6KIL3' \
    > test.out 2>&1
eval_tap $? 128 'GetBulkItemIdBySkus' test.out

#- 129 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'pqxS6qOO' \
    --region 'yKJNEWkp' \
    --storeId 'xU4cW65l' \
    --itemIds 'jc5dKpvx' \
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
    --platform '1kxaBjfe' \
    --userId 'MH9y6xfK' \
    --body '{"itemIds": ["3iYqYx8Y", "gHHqeCL2", "NAp6Go6G"]}' \
    > test.out 2>&1
eval_tap $? 131 'ValidateItemPurchaseCondition' test.out

#- 132 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'P0nQm4R4' \
    --body '{"changes": [{"itemIdentities": ["EoNoLZyC", "BHcrBhdq", "PiT17HVN"], "itemIdentityType": "ITEM_SKU", "regionData": {"W4fH1GEU": [{"currencyCode": "0MLVrnFO", "currencyNamespace": "OH9AXEIu", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1991-06-13T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1986-12-26T00:00:00Z", "discountedPrice": 22, "expireAt": "1984-08-15T00:00:00Z", "price": 55, "purchaseAt": "1993-06-17T00:00:00Z", "trialPrice": 45}, {"currencyCode": "fK2ywzYO", "currencyNamespace": "iyk3MdzS", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1991-03-31T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1989-05-14T00:00:00Z", "discountedPrice": 3, "expireAt": "1994-12-06T00:00:00Z", "price": 7, "purchaseAt": "1975-07-07T00:00:00Z", "trialPrice": 80}, {"currencyCode": "NsckzjqQ", "currencyNamespace": "3V755u5t", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1992-04-22T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1990-07-25T00:00:00Z", "discountedPrice": 27, "expireAt": "1983-01-29T00:00:00Z", "price": 20, "purchaseAt": "1999-06-17T00:00:00Z", "trialPrice": 99}], "6xYv5BVw": [{"currencyCode": "49ZldfXd", "currencyNamespace": "3XbtN2yq", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1994-07-05T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-10-27T00:00:00Z", "discountedPrice": 63, "expireAt": "1976-09-09T00:00:00Z", "price": 49, "purchaseAt": "1974-07-14T00:00:00Z", "trialPrice": 24}, {"currencyCode": "BlPf9pDU", "currencyNamespace": "BZ5DDcaY", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1982-10-14T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1972-07-22T00:00:00Z", "discountedPrice": 70, "expireAt": "1997-12-23T00:00:00Z", "price": 30, "purchaseAt": "1990-01-25T00:00:00Z", "trialPrice": 31}, {"currencyCode": "wHZIiqpv", "currencyNamespace": "zDd4iPTx", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1982-04-01T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1983-06-18T00:00:00Z", "discountedPrice": 66, "expireAt": "1987-08-10T00:00:00Z", "price": 70, "purchaseAt": "1979-12-01T00:00:00Z", "trialPrice": 90}], "Oaulih5R": [{"currencyCode": "S7L2JMHF", "currencyNamespace": "S1c3D13O", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1984-10-04T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1971-05-11T00:00:00Z", "discountedPrice": 14, "expireAt": "1984-12-13T00:00:00Z", "price": 60, "purchaseAt": "1999-07-08T00:00:00Z", "trialPrice": 15}, {"currencyCode": "G0IfOYDZ", "currencyNamespace": "f3pEu2K1", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1974-12-12T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1990-02-07T00:00:00Z", "discountedPrice": 40, "expireAt": "1998-12-02T00:00:00Z", "price": 85, "purchaseAt": "1993-10-29T00:00:00Z", "trialPrice": 8}, {"currencyCode": "UZC55VtR", "currencyNamespace": "KTcIkdKm", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1983-10-18T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1978-07-10T00:00:00Z", "discountedPrice": 98, "expireAt": "1992-06-20T00:00:00Z", "price": 0, "purchaseAt": "1995-12-09T00:00:00Z", "trialPrice": 70}]}}, {"itemIdentities": ["9kqP9nuv", "JPy4YVhP", "4UTgYIG0"], "itemIdentityType": "ITEM_ID", "regionData": {"Yxmoyf13": [{"currencyCode": "V7uU1E9q", "currencyNamespace": "CYKCUVxg", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1999-11-15T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1992-07-29T00:00:00Z", "discountedPrice": 13, "expireAt": "1983-07-01T00:00:00Z", "price": 0, "purchaseAt": "1997-01-31T00:00:00Z", "trialPrice": 85}, {"currencyCode": "PwaG2NCU", "currencyNamespace": "fIgrKKJg", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1974-06-07T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1995-06-21T00:00:00Z", "discountedPrice": 52, "expireAt": "1979-03-12T00:00:00Z", "price": 81, "purchaseAt": "1986-05-20T00:00:00Z", "trialPrice": 6}, {"currencyCode": "lNbHcCGf", "currencyNamespace": "bi48TxsR", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1995-04-18T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1985-04-11T00:00:00Z", "discountedPrice": 100, "expireAt": "1984-12-10T00:00:00Z", "price": 71, "purchaseAt": "1996-04-01T00:00:00Z", "trialPrice": 30}], "BKFqUw4V": [{"currencyCode": "yjBshcXo", "currencyNamespace": "uWOtYcIN", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1983-12-02T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1972-04-01T00:00:00Z", "discountedPrice": 90, "expireAt": "1986-06-01T00:00:00Z", "price": 67, "purchaseAt": "1971-05-03T00:00:00Z", "trialPrice": 66}, {"currencyCode": "tWvjFuLG", "currencyNamespace": "1uNrxW7L", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1997-09-28T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1980-01-03T00:00:00Z", "discountedPrice": 34, "expireAt": "1992-07-18T00:00:00Z", "price": 37, "purchaseAt": "1980-12-13T00:00:00Z", "trialPrice": 5}, {"currencyCode": "kpD6sZvw", "currencyNamespace": "tN5wMdWI", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1998-06-09T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1996-08-21T00:00:00Z", "discountedPrice": 85, "expireAt": "1973-12-31T00:00:00Z", "price": 48, "purchaseAt": "1973-11-09T00:00:00Z", "trialPrice": 5}], "16jCQ8FB": [{"currencyCode": "7D2C4gY8", "currencyNamespace": "qgHKnsJJ", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1995-01-21T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1992-02-10T00:00:00Z", "discountedPrice": 53, "expireAt": "1972-02-29T00:00:00Z", "price": 17, "purchaseAt": "1996-10-14T00:00:00Z", "trialPrice": 81}, {"currencyCode": "15UtHGRw", "currencyNamespace": "OojHalNn", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1977-10-16T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1996-12-24T00:00:00Z", "discountedPrice": 17, "expireAt": "1975-04-13T00:00:00Z", "price": 92, "purchaseAt": "1975-08-11T00:00:00Z", "trialPrice": 10}, {"currencyCode": "gNakiOWn", "currencyNamespace": "1ks4L2Zq", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1977-09-05T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1988-12-11T00:00:00Z", "discountedPrice": 62, "expireAt": "1987-06-24T00:00:00Z", "price": 55, "purchaseAt": "1978-06-08T00:00:00Z", "trialPrice": 37}]}}, {"itemIdentities": ["sf5tnrhz", "MSfqvc1O", "oxmAnl0y"], "itemIdentityType": "ITEM_SKU", "regionData": {"97x3PalE": [{"currencyCode": "uhIEqBcE", "currencyNamespace": "vvMdolRA", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1977-06-23T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1973-09-02T00:00:00Z", "discountedPrice": 30, "expireAt": "1972-02-16T00:00:00Z", "price": 23, "purchaseAt": "1984-07-18T00:00:00Z", "trialPrice": 0}, {"currencyCode": "1SfZngcM", "currencyNamespace": "EXEvPYR2", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1987-11-01T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1976-04-28T00:00:00Z", "discountedPrice": 10, "expireAt": "1977-05-26T00:00:00Z", "price": 13, "purchaseAt": "1998-04-30T00:00:00Z", "trialPrice": 53}, {"currencyCode": "ep0aP6hb", "currencyNamespace": "O9BEKI97", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1987-08-29T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1974-12-15T00:00:00Z", "discountedPrice": 99, "expireAt": "1983-11-26T00:00:00Z", "price": 55, "purchaseAt": "1984-02-20T00:00:00Z", "trialPrice": 28}], "n3uw6R9O": [{"currencyCode": "C6JmmqNK", "currencyNamespace": "i37JASxK", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1974-10-24T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1990-12-22T00:00:00Z", "discountedPrice": 24, "expireAt": "1977-01-18T00:00:00Z", "price": 32, "purchaseAt": "1982-09-08T00:00:00Z", "trialPrice": 3}, {"currencyCode": "0XYkb8h9", "currencyNamespace": "j0LOqESN", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1976-07-26T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1997-01-30T00:00:00Z", "discountedPrice": 86, "expireAt": "1986-09-11T00:00:00Z", "price": 66, "purchaseAt": "1997-11-30T00:00:00Z", "trialPrice": 74}, {"currencyCode": "2J1YJbsS", "currencyNamespace": "J6FifQLJ", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1989-02-21T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1977-12-03T00:00:00Z", "discountedPrice": 54, "expireAt": "1996-12-16T00:00:00Z", "price": 33, "purchaseAt": "1985-05-11T00:00:00Z", "trialPrice": 68}], "EELRs9GJ": [{"currencyCode": "8dSd9GAj", "currencyNamespace": "IIFFxftN", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1982-04-04T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-04-11T00:00:00Z", "discountedPrice": 4, "expireAt": "1979-12-18T00:00:00Z", "price": 34, "purchaseAt": "1988-08-26T00:00:00Z", "trialPrice": 80}, {"currencyCode": "zu4YbD7h", "currencyNamespace": "YlTqN3oU", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1983-10-31T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1988-10-16T00:00:00Z", "discountedPrice": 97, "expireAt": "1994-05-02T00:00:00Z", "price": 62, "purchaseAt": "1975-05-06T00:00:00Z", "trialPrice": 65}, {"currencyCode": "Q89jWvHC", "currencyNamespace": "koHeyQtU", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1981-09-13T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1974-09-29T00:00:00Z", "discountedPrice": 17, "expireAt": "1984-04-18T00:00:00Z", "price": 59, "purchaseAt": "1994-08-13T00:00:00Z", "trialPrice": 92}]}}]}' \
    > test.out 2>&1
eval_tap $? 132 'BulkUpdateRegionData' test.out

#- 133 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '12' \
    --offset '14' \
    --sortBy 'p6L0CSqK' \
    --storeId 'L8qQPikw' \
    --keyword '7exdE28H' \
    --language '2xEn2QJu' \
    > test.out 2>&1
eval_tap $? 133 'SearchItems' test.out

#- 134 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '55' \
    --offset '86' \
    --sortBy 'name:desc,displayOrder:desc,name:asc' \
    --storeId 'z9CqiUjC' \
    > test.out 2>&1
eval_tap $? 134 'QueryUncategorizedItems' test.out

#- 135 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'x27Zd7lF' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'vzqnGzIo' \
    > test.out 2>&1
eval_tap $? 135 'GetItem' test.out

#- 136 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'YLZpokeW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rWRydA9Z' \
    --body '{"appId": "wqdAMyez", "appType": "GAME", "baseAppId": "FI1yhMi5", "boothName": "PEMfCIS7", "categoryPath": "JuQbZxGW", "clazz": "ufn1uGOk", "displayOrder": 16, "entitlementType": "CONSUMABLE", "ext": {"kE3e4uHe": {}, "NuXEiFvI": {}, "9Il2egz4": {}}, "features": ["7jtneUDb", "KaNoP7O9", "MY3SQ5vZ"], "flexible": true, "images": [{"as": "BDjUHlPU", "caption": "PVde8nWX", "height": 7, "imageUrl": "VLJIgHiO", "smallImageUrl": "UN5Vm1zw", "width": 54}, {"as": "mUuBuSY2", "caption": "SqujvLjh", "height": 64, "imageUrl": "gqjPWSMo", "smallImageUrl": "ZP6HtS7W", "width": 24}, {"as": "OdLlIbqO", "caption": "NBH5mAMt", "height": 95, "imageUrl": "prTPl9de", "smallImageUrl": "kzv0crDG", "width": 80}], "inventoryConfig": {"customAttributes": {"zEB8mGxl": {}, "6OiyEYMv": {}, "q7IGj3AM": {}}, "serverCustomAttributes": {"EXkwKQ2c": {}, "AC8XjKFo": {}, "ZoDAJ2fA": {}}, "slotUsed": 61}, "itemIds": ["riah6Y1R", "80Ro4ZuL", "HTw861rP"], "itemQty": {"iF1dqw2u": 54, "6oQc5MHi": 80, "v3fJ1JFm": 73}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"TcPl8bWk": {"description": "6iPGurn8", "localExt": {"oDO7PJPm": {}, "aiYRvAb3": {}, "vHEr7FyT": {}}, "longDescription": "2u2ZAkhP", "title": "Xp6lXczO"}, "WCf1srOJ": {"description": "Lv2YXp8b", "localExt": {"K4a87HJ8": {}, "opvRTkbD": {}, "VbIGE7Em": {}}, "longDescription": "THO8h39A", "title": "Y36rXRpC"}, "mEqjlqLS": {"description": "ZcEtaqci", "localExt": {"xvGwlnYX": {}, "6eYRey0B": {}, "CxJ62HgE": {}}, "longDescription": "93APNAvF", "title": "vA89R3Lw"}}, "lootBoxConfig": {"rewardCount": 47, "rewards": [{"lootBoxItems": [{"count": 89, "duration": 1, "endDate": "1986-06-12T00:00:00Z", "itemId": "dOZbbTNK", "itemSku": "atmyPu5O", "itemType": "VQBM9ovp"}, {"count": 54, "duration": 86, "endDate": "1996-12-01T00:00:00Z", "itemId": "OkLVwFd3", "itemSku": "STo5Fkn3", "itemType": "IOUZET5m"}, {"count": 22, "duration": 13, "endDate": "1998-05-13T00:00:00Z", "itemId": "DSkW4t4m", "itemSku": "RTK976bo", "itemType": "YETwFLDz"}], "name": "qy703M3s", "odds": 0.7372341833937758, "type": "REWARD_GROUP", "weight": 98}, {"lootBoxItems": [{"count": 99, "duration": 28, "endDate": "1975-04-05T00:00:00Z", "itemId": "2AKZGv0R", "itemSku": "t4jxbVS8", "itemType": "Qdp0XgiM"}, {"count": 95, "duration": 88, "endDate": "1988-07-28T00:00:00Z", "itemId": "Xj67L54w", "itemSku": "jWfttw2P", "itemType": "Pju4EfHC"}, {"count": 80, "duration": 92, "endDate": "1999-09-04T00:00:00Z", "itemId": "AgHRQSsz", "itemSku": "JpTymxqt", "itemType": "IXSapohH"}], "name": "XRvDfv2x", "odds": 0.5290650576640874, "type": "REWARD_GROUP", "weight": 95}, {"lootBoxItems": [{"count": 50, "duration": 39, "endDate": "1978-05-20T00:00:00Z", "itemId": "8KO9RpTl", "itemSku": "J4A0DBVQ", "itemType": "X9KzTDqf"}, {"count": 81, "duration": 67, "endDate": "1985-04-24T00:00:00Z", "itemId": "MXkTEckd", "itemSku": "xScXjHmv", "itemType": "dT8sDYSP"}, {"count": 47, "duration": 30, "endDate": "1991-09-27T00:00:00Z", "itemId": "HDEPRD0T", "itemSku": "49rGETis", "itemType": "uJMsa69o"}], "name": "9tZWpa9D", "odds": 0.07968028506941538, "type": "REWARD", "weight": 1}], "rollFunction": "CUSTOM"}, "maxCount": 95, "maxCountPerUser": 54, "name": "JPF54rLc", "optionBoxConfig": {"boxItems": [{"count": 54, "duration": 85, "endDate": "1979-05-18T00:00:00Z", "itemId": "Zeh7BP3o", "itemSku": "EsCe75yM", "itemType": "MBiPTScA"}, {"count": 15, "duration": 17, "endDate": "1980-06-16T00:00:00Z", "itemId": "8rKmPmUY", "itemSku": "H4VV5b7X", "itemType": "QgE4ECRz"}, {"count": 75, "duration": 26, "endDate": "1986-01-03T00:00:00Z", "itemId": "tMz9hgC8", "itemSku": "1YLgqvUL", "itemType": "qVmF1eEw"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 93, "fixedTrialCycles": 90, "graceDays": 7}, "regionData": {"rIo5hfWH": [{"currencyCode": "mxhijvLl", "currencyNamespace": "qaWE0m5D", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1992-10-20T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1980-11-28T00:00:00Z", "expireAt": "1983-03-29T00:00:00Z", "price": 20, "purchaseAt": "1985-09-27T00:00:00Z", "trialPrice": 7}, {"currencyCode": "h1O4e3qN", "currencyNamespace": "18aIZmJS", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1977-01-09T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1990-11-29T00:00:00Z", "expireAt": "1995-09-15T00:00:00Z", "price": 13, "purchaseAt": "1976-07-02T00:00:00Z", "trialPrice": 47}, {"currencyCode": "jubCQ9He", "currencyNamespace": "0XwmZPK2", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1993-03-02T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1973-05-31T00:00:00Z", "expireAt": "1974-04-09T00:00:00Z", "price": 62, "purchaseAt": "1983-12-13T00:00:00Z", "trialPrice": 68}], "FAc96Skc": [{"currencyCode": "4GmdQszM", "currencyNamespace": "4kON1D8r", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1985-06-27T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1996-04-22T00:00:00Z", "expireAt": "1990-01-23T00:00:00Z", "price": 95, "purchaseAt": "1991-08-03T00:00:00Z", "trialPrice": 41}, {"currencyCode": "i3I1YfFi", "currencyNamespace": "43yPETS2", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1982-10-10T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1987-01-05T00:00:00Z", "expireAt": "1980-10-07T00:00:00Z", "price": 75, "purchaseAt": "1982-02-25T00:00:00Z", "trialPrice": 47}, {"currencyCode": "ppqtmzDW", "currencyNamespace": "gMZLrkee", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1975-03-04T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1997-12-19T00:00:00Z", "expireAt": "1999-03-29T00:00:00Z", "price": 37, "purchaseAt": "1985-09-12T00:00:00Z", "trialPrice": 17}], "TjRF3jpx": [{"currencyCode": "vXiSSMt2", "currencyNamespace": "oh0tVIx1", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1988-08-15T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1973-04-19T00:00:00Z", "expireAt": "1999-12-25T00:00:00Z", "price": 70, "purchaseAt": "1971-12-23T00:00:00Z", "trialPrice": 40}, {"currencyCode": "jFyTPJD0", "currencyNamespace": "Qk0SfW2j", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1987-01-17T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1989-03-20T00:00:00Z", "expireAt": "1996-08-19T00:00:00Z", "price": 31, "purchaseAt": "1994-08-25T00:00:00Z", "trialPrice": 90}, {"currencyCode": "BZuS0UdG", "currencyNamespace": "HZex4QC3", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1985-01-26T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1988-12-06T00:00:00Z", "expireAt": "1992-03-01T00:00:00Z", "price": 27, "purchaseAt": "1989-10-08T00:00:00Z", "trialPrice": 6}]}, "saleConfig": {"currencyCode": "FFGiFbGT", "price": 57}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "FZxP867z", "stackable": true, "status": "INACTIVE", "tags": ["OCbVtRYX", "9AIe81uQ", "zF0qIUCz"], "targetCurrencyCode": "U9Jiavfn", "targetNamespace": "bDvmthpa", "thumbnailUrl": "q4eOie8n", "useCount": 58}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateItem' test.out

#- 137 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'i7LKn4Y8' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,IAP,REWARD' \
    --force  \
    --storeId 'dCqkumXV' \
    > test.out 2>&1
eval_tap $? 137 'DeleteItem' test.out

#- 138 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '8Ej02zYU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 76, "orderNo": "ryIUAZGA"}' \
    > test.out 2>&1
eval_tap $? 138 'AcquireItem' test.out

#- 139 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'm2LILjvO' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LBCO0qbU' \
    > test.out 2>&1
eval_tap $? 139 'GetApp' test.out

#- 140 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'XNOr8VvC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DLM6dD7k' \
    --body '{"carousel": [{"alt": "QhL3nZJs", "previewUrl": "Y5XjvJvP", "thumbnailUrl": "iYq9fkVz", "type": "video", "url": "UrJzyMPT", "videoSource": "vimeo"}, {"alt": "D4pqIGts", "previewUrl": "ti2qJJZx", "thumbnailUrl": "JlF10GZA", "type": "image", "url": "WLz2croe", "videoSource": "youtube"}, {"alt": "Qz3eB38j", "previewUrl": "rqHQvyHA", "thumbnailUrl": "iM8GQNy6", "type": "image", "url": "8ECscFpk", "videoSource": "generic"}], "developer": "ktC6z2QO", "forumUrl": "YT9uQjPO", "genres": ["Action", "MassivelyMultiplayer", "RPG"], "localizations": {"0eJ5YINM": {"announcement": "ied64PIy", "slogan": "Sda84iqs"}, "CMAeCMo4": {"announcement": "fEIh6Wu8", "slogan": "APgv2c5T"}, "UANqBhjn": {"announcement": "pZAgFQbw", "slogan": "doDiUcr0"}}, "platformRequirements": {"bAqyaGRn": [{"additionals": "bBMGgcqn", "directXVersion": "bQY9kcWX", "diskSpace": "mI0dKbZr", "graphics": "JRBGak8y", "label": "z6bkMBww", "osVersion": "o9VG7JVG", "processor": "5Lo2prFr", "ram": "kJTMNFRW", "soundCard": "vyHNpMgC"}, {"additionals": "2oCgQuqw", "directXVersion": "fQejlPuJ", "diskSpace": "Ct5NrlgL", "graphics": "jOvBzEsp", "label": "OaVQq2np", "osVersion": "pcZf6Eqr", "processor": "ValmDSJ3", "ram": "U8C4dgXE", "soundCard": "ExOjNS0a"}, {"additionals": "1NeNO2BE", "directXVersion": "7xTAqY8W", "diskSpace": "nFHtZO1V", "graphics": "WhLwG7zb", "label": "UhpbsnKe", "osVersion": "xZ4HVxff", "processor": "oqHoYOhh", "ram": "DkFhshUZ", "soundCard": "8YheTXeM"}], "kAcESXop": [{"additionals": "W1Yjfu1n", "directXVersion": "IBdaANsl", "diskSpace": "fj8jA1sw", "graphics": "ZKl6mB3q", "label": "sN1x4ory", "osVersion": "Fml5aHQt", "processor": "e1B7AeLc", "ram": "trLXmYOk", "soundCard": "nE0qMASF"}, {"additionals": "VEcC2xVh", "directXVersion": "P61bdFcz", "diskSpace": "NAOelBKF", "graphics": "luzyCtRM", "label": "BHOm56Ti", "osVersion": "K9HTacAh", "processor": "mIiodkXN", "ram": "gL42nNIp", "soundCard": "8Wl6jpgB"}, {"additionals": "30Ttmvpa", "directXVersion": "RlPk0dzY", "diskSpace": "tH2CWk6r", "graphics": "QUK1M9iL", "label": "phphfvS2", "osVersion": "lpUVQ7Ae", "processor": "XKR7r6Ey", "ram": "Ylgeq8PB", "soundCard": "GZ9PJ3NA"}], "dPLj8k96": [{"additionals": "sggxRW3S", "directXVersion": "9Exf6gK2", "diskSpace": "BEmW9pxt", "graphics": "DnQWBmvs", "label": "pKrxtPJP", "osVersion": "IQ0xShj6", "processor": "SStjFxuz", "ram": "kh0b2ui0", "soundCard": "Tiw0P7ki"}, {"additionals": "W6qDTMdJ", "directXVersion": "RtnPB5dF", "diskSpace": "6GNRwknr", "graphics": "Ay3ivgcA", "label": "NaEFnYR0", "osVersion": "e5ax9Elj", "processor": "JzfyLaK6", "ram": "oEd1SBW2", "soundCard": "uViqVR08"}, {"additionals": "p94UbhOZ", "directXVersion": "3Z5efI2f", "diskSpace": "YJBTaxR4", "graphics": "hYfNczx3", "label": "79acASFN", "osVersion": "srIaQVz1", "processor": "1x9LT2L6", "ram": "2JGCTTeR", "soundCard": "uHny2ZKN"}]}, "platforms": ["Windows", "Android", "Linux"], "players": ["Coop", "Coop", "LocalCoop"], "primaryGenre": "FreeToPlay", "publisher": "1WlPqjpA", "releaseDate": "1989-10-18T00:00:00Z", "websiteUrl": "i5XBQ2ws"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateApp' test.out

#- 141 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'zvYVZKFB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'r6lddYyX' \
    --body '{"featuresToCheck": ["CAMPAIGN", "CATALOG", "REWARD"]}' \
    > test.out 2>&1
eval_tap $? 141 'DisableItem' test.out

#- 142 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '7e0n10rq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetItemDynamicData' test.out

#- 143 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'ej7rAMWz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ly5LQD7C' \
    > test.out 2>&1
eval_tap $? 143 'EnableItem' test.out

#- 144 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'GagdlZDJ' \
    --itemId 'LhlYke8h' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WS1CCDru' \
    > test.out 2>&1
eval_tap $? 144 'FeatureItem' test.out

#- 145 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '9XfcFfaM' \
    --itemId 'hZypUKVs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gPPOO6xr' \
    > test.out 2>&1
eval_tap $? 145 'DefeatureItem' test.out

#- 146 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '5rTNSoVW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '3yCVqgDM' \
    --populateBundle  \
    --region 'f5cyWLDr' \
    --storeId '5jtsTFuv' \
    > test.out 2>&1
eval_tap $? 146 'GetLocaleItem' test.out

#- 147 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'Gf5krlcb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KLdFloww' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 65, "code": "JNescHU4", "comparison": "is", "name": "Q2eH5t6x", "predicateType": "SeasonTierPredicate", "value": "eF9ISuur", "values": ["6DVd8TOv", "ohtSYTt0", "jlQ115zI"]}, {"anyOf": 16, "code": "pw0dw7Hh", "comparison": "isLessThanOrEqual", "name": "09t21TKm", "predicateType": "SeasonPassPredicate", "value": "WAdpe7V9", "values": ["8BGXmzVi", "K8TEQuHr", "99l6vIRH"]}, {"anyOf": 29, "code": "ne9idLfC", "comparison": "includes", "name": "vKZgldr1", "predicateType": "StatisticCodePredicate", "value": "9jCj4ysJ", "values": ["E83GyDGF", "GgMdo60S", "NKYlGYlq"]}]}, {"operator": "and", "predicates": [{"anyOf": 52, "code": "kRuRRFPA", "comparison": "isNot", "name": "6ehY2rxj", "predicateType": "EntitlementPredicate", "value": "usE1mjso", "values": ["PpPc4FQc", "qGTDNKOP", "MpQ6NjWU"]}, {"anyOf": 65, "code": "Fjp1n5QJ", "comparison": "isNot", "name": "r8OcGwmC", "predicateType": "SeasonPassPredicate", "value": "IW2SW8JC", "values": ["R7zfOBnq", "kwPdmtf8", "qqUJNAwd"]}, {"anyOf": 40, "code": "Ibb9DVwL", "comparison": "isGreaterThan", "name": "CH5jpevH", "predicateType": "StatisticCodePredicate", "value": "HFnEfoAL", "values": ["8xGIy1NK", "fsfWWPFR", "mx2FmkSE"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "code": "v4rQjaip", "comparison": "isNot", "name": "L59z4Aid", "predicateType": "SeasonPassPredicate", "value": "FHQckwRy", "values": ["CjwmFwZK", "PKrQQ8cU", "AbzNT52B"]}, {"anyOf": 33, "code": "di0qDKXi", "comparison": "isGreaterThanOrEqual", "name": "KBHpEdHX", "predicateType": "StatisticCodePredicate", "value": "l9vQycln", "values": ["gGkKnS6F", "zshTfVfs", "7ike6FSI"]}, {"anyOf": 56, "code": "9yJOqUdO", "comparison": "isGreaterThan", "name": "hTUYQOSf", "predicateType": "StatisticCodePredicate", "value": "KsF1bHeP", "values": ["KF0qZgGi", "7K6oxZ9w", "1AgIdp9o"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 147 'UpdateItemPurchaseCondition' test.out

#- 148 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'J4hAMPGR' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'REWARD,CATALOG,REWARD' \
    --storeId 'VSblDZAs' \
    > test.out 2>&1
eval_tap $? 148 'QueryItemReferences' test.out

#- 149 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'N9X6Q0Tx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "LuNKONnb"}' \
    > test.out 2>&1
eval_tap $? 149 'ReturnItem' test.out

#- 150 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --name 'RHFdFxgI' \
    --offset '97' \
    --tag 'YZyjxgZf' \
    > test.out 2>&1
eval_tap $? 150 'QueryKeyGroups' test.out

#- 151 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "5TrHksds", "name": "CoyvieDT", "status": "ACTIVE", "tags": ["qy7G8srs", "4yv81J8G", "HRuCNdBY"]}' \
    > test.out 2>&1
eval_tap $? 151 'CreateKeyGroup' test.out

#- 152 GetKeyGroupByBoothName
eval_tap 0 152 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 153 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'HVkZwioT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroup' test.out

#- 154 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'l08s0hEd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "48B1ZNYk", "name": "j0ip8zk9", "status": "INACTIVE", "tags": ["Ng7z6sse", "sq7S6h5C", "NF3TiuKa"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateKeyGroup' test.out

#- 155 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'Qt2uNii4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetKeyGroupDynamic' test.out

#- 156 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'PxzEwcg0' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '98' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 156 'ListKeys' test.out

#- 157 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'qZl4JALl' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 157 'UploadKeys' test.out

#- 158 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'zLOREvYJ' \
    --limit '2' \
    --offset '42' \
    --orderNos 'r13kSslU,uYUNJ5oO,TT7ATBF9' \
    --sortBy 'wiHs9dv5' \
    --startTime '2vOX3uJX' \
    --status 'INIT' \
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
    --orderNo '40nNrHmu' \
    > test.out 2>&1
eval_tap $? 160 'GetOrder' test.out

#- 161 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'khcZeEg9' \
    --body '{"description": "yjiNF48H"}' \
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
    --body '{"domains": ["rFrwh0b0", "n8ZbjrU1", "g7uRk4NZ"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePaymentDomainWhitelistConfig' test.out

#- 166 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'KL5gcBVa' \
    --externalId 'llkyEmpl' \
    --limit '96' \
    --notificationSource 'XSOLLA' \
    --notificationType 'fVm1BRwY' \
    --offset '63' \
    --paymentOrderNo 'ANEIONmp' \
    --startDate 'MmMANYkv' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 166 'QueryPaymentNotifications' test.out

#- 167 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '8CkGWpTm' \
    --limit '0' \
    --offset '70' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 167 'QueryPaymentOrders' test.out

#- 168 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "fiQHXK6s", "currencyNamespace": "qa1CUj9G", "customParameters": {"sqekPaW4": {}, "tBGSkuEg": {}, "7Cmg4OfA": {}}, "description": "xSEBiphd", "extOrderNo": "MHDPsRXu", "extUserId": "wBNEPTsN", "itemType": "CODE", "language": "OzJ", "metadata": {"phu1qjcT": "IfUfIXhL", "Oif1obM6": "3Qs3PCDK", "ATwgmA5r": "wW92qpRT"}, "notifyUrl": "7BBFwuTY", "omitNotification": false, "platform": "poefSUew", "price": 95, "recurringPaymentOrderNo": "WfYbbjId", "region": "EvpV4yhm", "returnUrl": "O4QSQxR1", "sandbox": false, "sku": "aWAbhEqA", "subscriptionId": "Rte4tlhF", "targetNamespace": "JjbNeETJ", "targetUserId": "inWJIq8x", "title": "E9wP2Ye3"}' \
    > test.out 2>&1
eval_tap $? 168 'CreatePaymentOrderByDedicated' test.out

#- 169 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'PCbpSUb8' \
    > test.out 2>&1
eval_tap $? 169 'ListExtOrderNoByExtTxId' test.out

#- 170 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vy5CPRie' \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentOrder' test.out

#- 171 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZmQ0vFKN' \
    --body '{"extTxId": "B6FlQYWH", "paymentMethod": "crjGTDOB", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 171 'ChargePaymentOrder' test.out

#- 172 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jV6w40Fg' \
    --body '{"description": "KRfGXq93"}' \
    > test.out 2>&1
eval_tap $? 172 'RefundPaymentOrderByDedicated' test.out

#- 173 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xtJ8Jd0t' \
    --body '{"amount": 16, "currencyCode": "ZGTL4QCh", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 98, "vat": 37}' \
    > test.out 2>&1
eval_tap $? 173 'SimulatePaymentOrderNotification' test.out

#- 174 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rq6sKlEl' \
    > test.out 2>&1
eval_tap $? 174 'GetPaymentOrderChargeStatus' test.out

#- 175 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'wiEJrKtM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "KJWgl6KH", "serviceLabel": 81}' \
    > test.out 2>&1
eval_tap $? 175 'GetPsnEntitlementOwnership' test.out

#- 176 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'vRHusiXM' \
    --body '{"delegationToken": "jXqlSBBu", "sandboxId": "bDFEbc53"}' \
    > test.out 2>&1
eval_tap $? 176 'GetXboxEntitlementOwnership' test.out

#- 177 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformEntitlementConfig' test.out

#- 178 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    --body '{"allowedPlatformOrigins": ["Oculus", "Steam", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformEntitlementConfig' test.out

#- 179 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 179 'GetPlatformWalletConfig' test.out

#- 180 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Epic", "GooglePlay", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 180 'UpdatePlatformWalletConfig' test.out

#- 181 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime '01P4gXVS' \
    --limit '75' \
    --offset '51' \
    --source 'DLC' \
    --startTime 'Z94DoXRA' \
    --status 'SUCCESS' \
    --transactionId 'iTDsiK0z' \
    --userId 'WVWWX50w' \
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
    --body '{"appConfig": {"appName": "utK9amay"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "vDqjAveU"}, "extendType": "APP"}' \
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
    --body '{"description": "FaQ77HlM", "eventTopic": "Bay1Rils", "maxAwarded": 55, "maxAwardedPerUser": 11, "namespaceExpression": "yT1q7DOy", "rewardCode": "ha3WJ1fc", "rewardConditions": [{"condition": "28PRmLpo", "conditionName": "1aWkD7SZ", "eventName": "u8jh6ZFY", "rewardItems": [{"duration": 22, "endDate": "1980-10-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "TKuHdFci", "quantity": 72, "sku": "p40ygFpr"}, {"duration": 55, "endDate": "1985-06-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "de3Rbfra", "quantity": 3, "sku": "HkN44Lt5"}, {"duration": 1, "endDate": "1989-07-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "BQq1CHuN", "quantity": 36, "sku": "9ThEw6qO"}]}, {"condition": "CpdE5OvP", "conditionName": "L9yqO2iL", "eventName": "vx3TSlwG", "rewardItems": [{"duration": 5, "endDate": "1984-02-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "SStcDlGC", "quantity": 100, "sku": "oJLRgTzH"}, {"duration": 74, "endDate": "1993-11-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pQSofGtx", "quantity": 40, "sku": "nOArgAb5"}, {"duration": 88, "endDate": "1996-05-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pc9x8P2I", "quantity": 94, "sku": "sBFiCq4I"}]}, {"condition": "GUAS4hih", "conditionName": "A0y2WARE", "eventName": "W4Em9dGU", "rewardItems": [{"duration": 49, "endDate": "1984-08-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "k0jJOBhP", "quantity": 51, "sku": "O8urMpGJ"}, {"duration": 32, "endDate": "1980-06-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vyBLHg7v", "quantity": 80, "sku": "iXjYbEys"}, {"duration": 86, "endDate": "1972-07-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "J5w0kIQj", "quantity": 6, "sku": "JVlTYra1"}]}], "userIdExpression": "yJpTr0MA"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateReward' test.out

#- 191 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'tNEBBM4G' \
    --limit '99' \
    --offset '88' \
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
    --rewardId 'jmxAPUCT' \
    > test.out 2>&1
eval_tap $? 194 'GetReward' test.out

#- 195 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'wTaxXqVI' \
    --body '{"description": "CvlT3yPM", "eventTopic": "hhVrjCNV", "maxAwarded": 15, "maxAwardedPerUser": 27, "namespaceExpression": "MN6NNdDn", "rewardCode": "nQJAQvry", "rewardConditions": [{"condition": "7gZrbhxG", "conditionName": "w3izVJDl", "eventName": "SEC03Jzt", "rewardItems": [{"duration": 76, "endDate": "1982-01-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nfkTjWKk", "quantity": 20, "sku": "cR6dJOp5"}, {"duration": 93, "endDate": "1984-08-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "EC98aRBY", "quantity": 84, "sku": "TTAdpOEu"}, {"duration": 35, "endDate": "1983-08-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "eIr9ls65", "quantity": 16, "sku": "PQLTURff"}]}, {"condition": "1JOsBXtK", "conditionName": "y04gR95R", "eventName": "2xyrXHYE", "rewardItems": [{"duration": 94, "endDate": "1972-07-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RddhmIVh", "quantity": 84, "sku": "Dm4Zzxib"}, {"duration": 77, "endDate": "1989-07-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "P8zpPbmR", "quantity": 34, "sku": "LcNnp79S"}, {"duration": 26, "endDate": "1976-12-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "V4EVsMzX", "quantity": 50, "sku": "omlNjaBR"}]}, {"condition": "81yxZNO8", "conditionName": "dbQIrDGT", "eventName": "WkNdqRrE", "rewardItems": [{"duration": 3, "endDate": "1974-05-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "sOsCeqNe", "quantity": 67, "sku": "9xAwBkH7"}, {"duration": 84, "endDate": "1985-08-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KRU8x3z6", "quantity": 81, "sku": "BaajJrGm"}, {"duration": 90, "endDate": "1992-12-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Tlusprda", "quantity": 38, "sku": "JnMR5E2q"}]}], "userIdExpression": "exYZIrSo"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateReward' test.out

#- 196 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vNhVoyfx' \
    > test.out 2>&1
eval_tap $? 196 'DeleteReward' test.out

#- 197 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'gr1irHW5' \
    --body '{"payload": {"r6mtplvo": {}, "ZYNSyFvl": {}, "o8au7Vdi": {}}}' \
    > test.out 2>&1
eval_tap $? 197 'CheckEventCondition' test.out

#- 198 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UeEQV41e' \
    --body '{"conditionName": "KhI6e3Hz", "userId": "UAWGIEu2"}' \
    > test.out 2>&1
eval_tap $? 198 'DeleteRewardConditionRecord' test.out

#- 199 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'oOBhronA' \
    --limit '97' \
    --offset '78' \
    --start '6NCpkmqw' \
    --storeId 'ykzKuVtf' \
    --viewId 'jPtWBla0' \
    > test.out 2>&1
eval_tap $? 199 'QuerySections' test.out

#- 200 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'afjgCfZW' \
    --body '{"active": true, "displayOrder": 67, "endDate": "1983-07-13T00:00:00Z", "ext": {"939eSjJX": {}, "Fxtfjhj2": {}, "5QtsdIvx": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 16, "itemCount": 95, "rule": "SEQUENCE"}, "items": [{"id": "FF9PwT26", "sku": "c6ubXMx5"}, {"id": "MWh8TAqP", "sku": "oA8OC7qF"}, {"id": "hOuGr85c", "sku": "aYZxpFvl"}], "localizations": {"UYGu96xk": {"description": "i2NICrgj", "localExt": {"IkAYHCY2": {}, "d83GUPsj": {}, "McGciqdb": {}}, "longDescription": "LXo7lRHs", "title": "atZ2KvLg"}, "FMLussQE": {"description": "FaYQQjIT", "localExt": {"z59GUiLe": {}, "bsVYCNXB": {}, "n336icbC": {}}, "longDescription": "M7N4PaiG", "title": "5yzde8Dh"}, "ZUCZwEJ1": {"description": "mQouqtLM", "localExt": {"JrjRU2Xn": {}, "KtkDIztg": {}, "HHHP3VcO": {}}, "longDescription": "TKejclEQ", "title": "E44LiTv3"}}, "name": "E2rTZDqa", "rotationType": "NONE", "startDate": "1995-06-12T00:00:00Z", "viewId": "slSBEdu7"}' \
    > test.out 2>&1
eval_tap $? 200 'CreateSection' test.out

#- 201 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qTagTIgT' \
    > test.out 2>&1
eval_tap $? 201 'PurgeExpiredSection' test.out

#- 202 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Z9IDqvbV' \
    --storeId 'WzCUxBE1' \
    > test.out 2>&1
eval_tap $? 202 'GetSection' test.out

#- 203 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'C8pMIHSz' \
    --storeId 'E98ECDCZ' \
    --body '{"active": true, "displayOrder": 47, "endDate": "1975-12-28T00:00:00Z", "ext": {"nxqYza1R": {}, "5ClLTuER": {}, "s6UQ73bP": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 5, "itemCount": 53, "rule": "SEQUENCE"}, "items": [{"id": "5LReSDC0", "sku": "TRk0ah9v"}, {"id": "i6hhow2f", "sku": "FyeRjVdH"}, {"id": "31j2yoy7", "sku": "VzRbBYrM"}], "localizations": {"2GBdqDGy": {"description": "jeVnS7jc", "localExt": {"yceozBmn": {}, "wqAsttUW": {}, "VbC6qtxL": {}}, "longDescription": "bav9XVkx", "title": "LHtFRk9N"}, "COSKa5tJ": {"description": "mLZ73GHs", "localExt": {"D9xU0Nxn": {}, "2Qh64FNt": {}, "i0JfbRwD": {}}, "longDescription": "HkrqRFkO", "title": "jzBXbW11"}, "E1DI9etG": {"description": "EB3AUb8j", "localExt": {"NT9RN3BW": {}, "sn1E0DYP": {}, "NffEwSPE": {}}, "longDescription": "MjWiN4Hk", "title": "j0sEJupR"}}, "name": "Hr4qMyLE", "rotationType": "CUSTOM", "startDate": "1981-09-22T00:00:00Z", "viewId": "JYWHQQ3F"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateSection' test.out

#- 204 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '58udwqEx' \
    --storeId 'mqLdLT8n' \
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
    --body '{"defaultLanguage": "karbER4K", "defaultRegion": "LLjvlGae", "description": "QDFWyBEQ", "supportedLanguages": ["dcWu7Vdo", "sKj4spgv", "DBE2M2KZ"], "supportedRegions": ["eN0c0WqQ", "wJtCxD5T", "ucnB0tUj"], "title": "Tg6NG7RF"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateStore' test.out

#- 207 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
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
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["ZdmM0NtQ", "Vr23HWoc", "XUyiwfyG"], "idsToBeExported": ["lKXZ0jK7", "48ynK38L", "N1FES7Qp"], "storeId": "tzEp49gU"}' \
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
    --storeId 'Oha6QTsZ' \
    > test.out 2>&1
eval_tap $? 215 'GetStore' test.out

#- 216 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '73Owg7xf' \
    --body '{"defaultLanguage": "qlsx3uUd", "defaultRegion": "pzIRHvXx", "description": "i8sv7yki", "supportedLanguages": ["ja7bIDfl", "GT3n2deI", "qndBS1ut"], "supportedRegions": ["c6fFgHVf", "bksKWKdf", "2QCvKtX4"], "title": "B30WY9Yu"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateStore' test.out

#- 217 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oqvEU5hs' \
    > test.out 2>&1
eval_tap $? 217 'DeleteStore' test.out

#- 218 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '87lUK4x2' \
    --action 'UPDATE' \
    --itemSku 'fPKvTZB6' \
    --itemType 'COINS' \
    --limit '27' \
    --offset '49' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'voXMWuhq' \
    --updatedAtStart 'cyUAAY1B' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 218 'QueryChanges' test.out

#- 219 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wqXqmv2s' \
    > test.out 2>&1
eval_tap $? 219 'PublishAll' test.out

#- 220 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K66sekez' \
    > test.out 2>&1
eval_tap $? 220 'PublishSelected' test.out

#- 221 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fHYTT3m6' \
    > test.out 2>&1
eval_tap $? 221 'SelectAllRecords' test.out

#- 222 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'keozkP9h' \
    --action 'UPDATE' \
    --itemSku '9ugf2ogZ' \
    --itemType 'INGAMEITEM' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd 'KvfTdkVI' \
    --updatedAtStart '0Flduu0t' \
    > test.out 2>&1
eval_tap $? 222 'SelectAllRecordsByCriteria' test.out

#- 223 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BXtgQUGe' \
    --action 'UPDATE' \
    --itemSku 'dJlhAfp8' \
    --itemType 'SUBSCRIPTION' \
    --type 'VIEW' \
    --updatedAtEnd 'rPPku82R' \
    --updatedAtStart 'FLCUZVe5' \
    > test.out 2>&1
eval_tap $? 223 'GetStatistic' test.out

#- 224 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KVQzrMhG' \
    > test.out 2>&1
eval_tap $? 224 'UnselectAllRecords' test.out

#- 225 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'by7WGLPM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kCxw5lhN' \
    > test.out 2>&1
eval_tap $? 225 'SelectRecord' test.out

#- 226 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'L2sRyfac' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GSdUeTgN' \
    > test.out 2>&1
eval_tap $? 226 'UnselectRecord' test.out

#- 227 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ICe68NqB' \
    --targetStoreId 'vFwufviL' \
    > test.out 2>&1
eval_tap $? 227 'CloneStore' test.out

#- 228 ExportStore
eval_tap 0 228 'ExportStore # SKIP deprecated' test.out

#- 229 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F4asaLYi' \
    --end 'iKcrxvkZ' \
    --limit '75' \
    --offset '4' \
    --sortBy 'IW4n08lg' \
    --start 'jq1glvW3' \
    --success  \
    > test.out 2>&1
eval_tap $? 229 'QueryImportHistory' test.out

#- 230 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Eu2pwJpD' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'FFdPXwNR' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 230 'ImportStoreByCSV' test.out

#- 231 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'VtbuTpMm' \
    --limit '66' \
    --offset '64' \
    --sku 'd4tuXoMg' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId 'r9Yp2UhJ' \
    > test.out 2>&1
eval_tap $? 231 'QuerySubscriptions' test.out

#- 232 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ebcmtmTy' \
    > test.out 2>&1
eval_tap $? 232 'RecurringChargeSubscription' test.out

#- 233 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'HcDvU3uq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketDynamic' test.out

#- 234 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'hkhwn9rr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "u6gnlPau"}' \
    > test.out 2>&1
eval_tap $? 234 'DecreaseTicketSale' test.out

#- 235 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'y2nYGNka' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetTicketBoothID' test.out

#- 236 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'yU3uKNLB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 89, "orderNo": "jWYiR6yp"}' \
    > test.out 2>&1
eval_tap $? 236 'IncreaseTicketSale' test.out

#- 237 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 3, "currencyCode": "UWlCe7zj", "expireAt": "1987-06-29T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "zDerUBY1", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 63, "entitlementCollectionId": "XnpnXyn7", "entitlementOrigin": "Xbox", "itemIdentity": "sulpS10R", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "KisheKnr"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 71, "currencyCode": "W9o3o4pY", "expireAt": "1990-12-04T00:00:00Z"}, "debitPayload": {"count": 83, "currencyCode": "jJvL5cHx", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "wem7lAQe", "entitlementOrigin": "IOS", "itemIdentity": "f6GpyhsZ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 97, "entitlementId": "0b15RbFu"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 29, "currencyCode": "UDnnZtiC", "expireAt": "1983-06-01T00:00:00Z"}, "debitPayload": {"count": 66, "currencyCode": "u68J2BBY", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 6, "entitlementCollectionId": "8n7XHKtR", "entitlementOrigin": "Playstation", "itemIdentity": "Hr9FBf7j", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 5, "entitlementId": "5meSp5Il"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "lUTEcROh"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 7, "currencyCode": "2RZxGRyz", "expireAt": "1983-10-05T00:00:00Z"}, "debitPayload": {"count": 30, "currencyCode": "28yJqPr4", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 76, "entitlementCollectionId": "VXpKvDPX", "entitlementOrigin": "System", "itemIdentity": "hXYf7OgS", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "yDk4zFd5"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 3, "currencyCode": "WbZoJhgb", "expireAt": "1986-05-03T00:00:00Z"}, "debitPayload": {"count": 30, "currencyCode": "UBfYGC0F", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 24, "entitlementCollectionId": "5wT72SQJ", "entitlementOrigin": "System", "itemIdentity": "2d6y9Bqv", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 16, "entitlementId": "TBolAWa7"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "System", "count": 96, "currencyCode": "M2bjclXc", "expireAt": "1982-07-25T00:00:00Z"}, "debitPayload": {"count": 57, "currencyCode": "HDEx1PCA", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 47, "entitlementCollectionId": "uJp0rmy5", "entitlementOrigin": "Twitch", "itemIdentity": "Er8rkjwm", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 24, "entitlementId": "axS6CjA7"}, "type": "CREDIT_WALLET"}], "userId": "o3EFpM8s"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 34, "currencyCode": "YeM4YYOF", "expireAt": "1989-01-11T00:00:00Z"}, "debitPayload": {"count": 11, "currencyCode": "z5y7vzs0", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 70, "entitlementCollectionId": "UZUfwaui", "entitlementOrigin": "Epic", "itemIdentity": "aZcah4tV", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "J5eZFuqt"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 81, "currencyCode": "Sw3WfR1P", "expireAt": "1978-07-01T00:00:00Z"}, "debitPayload": {"count": 56, "currencyCode": "sNEM3aNW", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 41, "entitlementCollectionId": "zJC2phih", "entitlementOrigin": "IOS", "itemIdentity": "THZBu247", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 7, "entitlementId": "98f67YnD"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Other", "count": 8, "currencyCode": "2c64gHZo", "expireAt": "1987-04-17T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "bNYyvvgJ", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 8, "entitlementCollectionId": "Hl9wPyo0", "entitlementOrigin": "IOS", "itemIdentity": "7ANzkCzO", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 92, "entitlementId": "gFRIsKhH"}, "type": "CREDIT_WALLET"}], "userId": "99xqwZoV"}], "metadata": {"sKsd2Mfq": {}, "1Ygudgue": {}, "YCo9viMU": {}}, "needPreCheck": false, "transactionId": "KNuam5kB", "type": "uipII1W8"}' \
    > test.out 2>&1
eval_tap $? 237 'Commit' test.out

#- 238 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '78' \
    --status 'SUCCESS' \
    --type '4X3inn7a' \
    --userId 'wc83Ye7N' \
    > test.out 2>&1
eval_tap $? 238 'GetTradeHistoryByCriteria' test.out

#- 239 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '4k9qnHsz' \
    > test.out 2>&1
eval_tap $? 239 'GetTradeHistoryByTransactionId' test.out

#- 240 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '8AzPIRUR' \
    --body '{"achievements": [{"id": "0JVZq47i", "value": 52}, {"id": "xbuKNqXn", "value": 5}, {"id": "g188kGhG", "value": 85}], "steamUserId": "ovQumDaB"}' \
    > test.out 2>&1
eval_tap $? 240 'UnlockSteamUserAchievement' test.out

#- 241 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CUma7fes' \
    --xboxUserId 'Tsa6gRuL' \
    > test.out 2>&1
eval_tap $? 241 'GetXblUserAchievements' test.out

#- 242 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'wglJWOjl' \
    --body '{"achievements": [{"id": "87fGremG", "percentComplete": 76}, {"id": "JFfUIw6H", "percentComplete": 95}, {"id": "32sEQwhM", "percentComplete": 20}], "serviceConfigId": "6Vvmq3wV", "titleId": "mhsj2EnS", "xboxUserId": "bzvQh4h1"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateXblUserAchievement' test.out

#- 243 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8M0uPGK' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeCampaign' test.out

#- 244 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '8eEhydO8' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeEntitlement' test.out

#- 245 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQkJ0eoO' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeFulfillment' test.out

#- 246 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxz03Rfu' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizeIntegration' test.out

#- 247 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5K7BNn2' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeOrder' test.out

#- 248 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'xhlnQeSb' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizePayment' test.out

#- 249 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjJEI3U9' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeRevocation' test.out

#- 250 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'snXKB1Ni' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeSubscription' test.out

#- 251 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '37XS6M7l' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeWallet' test.out

#- 252 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjAKOlj1' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 252 'GetUserDLCByPlatform' test.out

#- 253 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1bL7rED' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 253 'GetUserDLC' test.out

#- 254 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kdEaNAQv' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'ydwsBLCg' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'tapB8VSB' \
    --features 'uOVfpJx7,G1pHYB5d,Ryz3Q9z9' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'sRIHKlcq,Wn0vbz7k,ClToCQ3d' \
    --limit '40' \
    --offset '66' \
    --origin 'IOS' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserEntitlements' test.out

#- 255 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'zycvUlHN' \
    --body '[{"collectionId": "CEAwyTNe", "endDate": "1971-12-07T00:00:00Z", "grantedCode": "0yqjicvN", "itemId": "EswUWs7Q", "itemNamespace": "fGdnhfOP", "language": "gOuH", "metadata": {"xY2OhLM7": {}, "BzoL9N09": {}, "u46D46l8": {}}, "origin": "Xbox", "quantity": 62, "region": "9mZpalFu", "source": "REDEEM_CODE", "startDate": "1996-04-23T00:00:00Z", "storeId": "Fbmr1qdD"}, {"collectionId": "zNktY1c3", "endDate": "1981-09-10T00:00:00Z", "grantedCode": "6Po6hJYq", "itemId": "Em1J2g8H", "itemNamespace": "f4q51UhC", "language": "KY-ktCm-Sl", "metadata": {"TzPGZvhZ": {}, "5QBLxw8W": {}, "dK07Vssl": {}}, "origin": "Nintendo", "quantity": 91, "region": "jQNwKXNb", "source": "PROMOTION", "startDate": "1975-10-06T00:00:00Z", "storeId": "yD1213Rc"}, {"collectionId": "7ipmp5TB", "endDate": "1971-02-13T00:00:00Z", "grantedCode": "IXScA5kH", "itemId": "bY7jb5Dv", "itemNamespace": "0cQfXJBT", "language": "UJr-119", "metadata": {"sESyNeBl": {}, "yce82I6O": {}, "xMKa7NrR": {}}, "origin": "GooglePlay", "quantity": 34, "region": "WDTjtAis", "source": "IAP", "startDate": "1981-07-31T00:00:00Z", "storeId": "vDzwAPA0"}]' \
    > test.out 2>&1
eval_tap $? 255 'GrantUserEntitlement' test.out

#- 256 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJSKODxC' \
    --activeOnly  \
    --appId 'QAIPnLG3' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementByAppId' test.out

#- 257 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'LycXt1v8' \
    --activeOnly  \
    --limit '2' \
    --offset '63' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 257 'QueryUserEntitlementsByAppType' test.out

#- 258 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'm73oNDbr' \
    --ids 'sBH2e20L,ByBfeOyh,5W9jMNCk' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementsByIds' test.out

#- 259 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkT60fE7' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'fSvwt5vD' \
    --itemId '7QOkxFYj' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementByItemId' test.out

#- 260 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHkOVdwB' \
    --ids 'oaMaZCVs,LHVktN3k,pSybkLlW' \
    --platform '4G4ninYD' \
    > test.out 2>&1
eval_tap $? 260 'GetUserActiveEntitlementsByItemIds' test.out

#- 261 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'WTElIa7Y' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'DkkJLoP0' \
    --sku 'OUBGvXOx' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementBySku' test.out

#- 262 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'q5doFnpM' \
    --appIds 'rrVMAMjA,LZecuUg9,Xvyllokb' \
    --itemIds 'vcrF1ZRD,w6ClIaWy,IwjhjH96' \
    --platform '6r8EFOFH' \
    --skus 'PQvjWlaV,gKXpRHUB,Us1XeBgG' \
    > test.out 2>&1
eval_tap $? 262 'ExistsAnyUserActiveEntitlement' test.out

#- 263 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IOQ4kAbb' \
    --platform 'fg296ACD' \
    --itemIds 'JJH0AUOh,GGrOkibz,LQeHvvJL' \
    > test.out 2>&1
eval_tap $? 263 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 264 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ngDAOf4n' \
    --appId 'fhdV00ap' \
    > test.out 2>&1
eval_tap $? 264 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 265 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '8flxAKaF' \
    --entitlementClazz 'APP' \
    --platform 'li95FbKr' \
    --itemId 'BczBPsTc' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipByItemId' test.out

#- 266 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'iNL6Jw3B' \
    --ids '2T5GYSPj,AVfDRU6P,fLi1WpNh' \
    --platform 'iRLBw2zd' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementOwnershipByItemIds' test.out

#- 267 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '4gJpJ8NJ' \
    --entitlementClazz 'APP' \
    --platform 'QgeJZRUg' \
    --sku 'dMZlTyc2' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementOwnershipBySku' test.out

#- 268 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWIguJ1j' \
    > test.out 2>&1
eval_tap $? 268 'RevokeAllEntitlements' test.out

#- 269 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'KqrZiPot' \
    --entitlementIds 'TLOR7uIE' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlements' test.out

#- 270 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '6Em4Vnae' \
    --namespace "$AB_NAMESPACE" \
    --userId '9UIch8nM' \
    > test.out 2>&1
eval_tap $? 270 'GetUserEntitlement' test.out

#- 271 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '12UoNugz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eyQjLyp5' \
    --body '{"collectionId": "e6MueJrc", "endDate": "1990-08-23T00:00:00Z", "nullFieldList": ["jrgJgmap", "bHJt3Zfe", "SnHhimY9"], "origin": "Steam", "reason": "cI9J1zO5", "startDate": "1985-10-16T00:00:00Z", "status": "ACTIVE", "useCount": 72}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserEntitlement' test.out

#- 272 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'taGfeMpN' \
    --namespace "$AB_NAMESPACE" \
    --userId '6Eeuztgt' \
    --body '{"metadata": {"2jr5qJkh": {}, "vnL4IbEI": {}, "8SU5yaAg": {}}, "options": ["gnxpnhGB", "F01M2PsT", "IGK8K91j"], "platform": "yslICFEs", "requestId": "WXP6TCM6", "useCount": 72}' \
    > test.out 2>&1
eval_tap $? 272 'ConsumeUserEntitlement' test.out

#- 273 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'kWRXltBt' \
    --namespace "$AB_NAMESPACE" \
    --userId '1OsthgOQ' \
    > test.out 2>&1
eval_tap $? 273 'DisableUserEntitlement' test.out

#- 274 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'bL9LZJw9' \
    --namespace "$AB_NAMESPACE" \
    --userId '2GnhtIkV' \
    > test.out 2>&1
eval_tap $? 274 'EnableUserEntitlement' test.out

#- 275 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'GXESJ2Mh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gWSqJSEn' \
    > test.out 2>&1
eval_tap $? 275 'GetUserEntitlementHistories' test.out

#- 276 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'TxtGuRrA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D171T6O9' \
    --body '{"metadata": {"ylkuYesK": {}, "knWjBXHH": {}, "tR1oFmw4": {}}}' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlement' test.out

#- 277 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'Bg00I8sg' \
    --namespace "$AB_NAMESPACE" \
    --userId '3ge3aEEx' \
    --body '{"reason": "S3mNN3UO", "useCount": 91}' \
    > test.out 2>&1
eval_tap $? 277 'RevokeUserEntitlementByUseCount' test.out

#- 278 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'cKYGyVki' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lPaqc1N1' \
    --quantity '64' \
    > test.out 2>&1
eval_tap $? 278 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 279 RevokeUseCount
eval_tap 0 279 'RevokeUseCount # SKIP deprecated' test.out

#- 280 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'Gc05PhOT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VvZGLPlu' \
    --body '{"platform": "aLmPQbXW", "requestId": "QW5XqeNx", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 280 'SellUserEntitlement' test.out

#- 281 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fzTX2Z7p' \
    --body '{"duration": 65, "endDate": "1988-09-07T00:00:00Z", "entitlementCollectionId": "Mj9nDSfZ", "entitlementOrigin": "System", "itemId": "JaMingHf", "itemSku": "YDzdayZY", "language": "W05bmKna", "metadata": {"EZYkolIN": {}, "ipm07UZC": {}, "rDju8J16": {}}, "order": {"currency": {"currencyCode": "EUeOw5vo", "currencySymbol": "hGPcQqYZ", "currencyType": "VIRTUAL", "decimals": 32, "namespace": "vwnNxGN7"}, "ext": {"kanbn8RC": {}, "1MVKZWkt": {}, "UjZDSuzr": {}}, "free": true}, "orderNo": "qV9KdfV6", "origin": "IOS", "overrideBundleItemQty": {"3aiNcRQI": 90, "DOejCdhu": 33, "fXoGZXJu": 20}, "quantity": 92, "region": "jD3tEX86", "source": "CONSUME_ENTITLEMENT", "startDate": "1979-03-03T00:00:00Z", "storeId": "xymLf2bm"}' \
    > test.out 2>&1
eval_tap $? 281 'FulfillItem' test.out

#- 282 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzyUmNJw' \
    --body '{"code": "wJIpphM6", "language": "Rm-TCZC-WK", "region": "mSEvrxNv"}' \
    > test.out 2>&1
eval_tap $? 282 'RedeemCode' test.out

#- 283 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KpvPe7j4' \
    --body '{"itemId": "HYHvBEZS", "itemSku": "eTjPw6Gs", "quantity": 80}' \
    > test.out 2>&1
eval_tap $? 283 'PreCheckFulfillItem' test.out

#- 284 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0WI2Nnci' \
    --body '{"entitlementCollectionId": "cUozLslj", "entitlementOrigin": "Epic", "metadata": {"2N0cjfEc": {}, "cGUP4TiN": {}, "ML8TDqhW": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "51isW0eg", "namespace": "hd8udpR6"}, "item": {"itemId": "m8j0QIcI", "itemName": "MS7HOAT9", "itemSku": "xFtorHPJ", "itemType": "GEWfsfQK"}, "quantity": 15, "type": "ITEM"}, {"currency": {"currencyCode": "rZ3E6Qli", "namespace": "C6odJvan"}, "item": {"itemId": "ceY72zzT", "itemName": "rcQNAdQL", "itemSku": "m6gbVQKk", "itemType": "BPnzhvm1"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"currencyCode": "Wya0ygo8", "namespace": "D1rhaYNC"}, "item": {"itemId": "5OAoUFP1", "itemName": "C6FSxwuy", "itemSku": "94DpzJp7", "itemType": "hwQEcGtn"}, "quantity": 31, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "UMn7hlL2"}' \
    > test.out 2>&1
eval_tap $? 284 'FulfillRewards' test.out

#- 285 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAxdUbHE' \
    --endTime 'k7g55N5V' \
    --limit '46' \
    --offset '59' \
    --productId '1qji6XJK' \
    --startTime 'LNcF9ju5' \
    --status 'FULFILLED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPOrders' test.out

#- 286 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '4Y7Jyi6V' \
    > test.out 2>&1
eval_tap $? 286 'QueryAllUserIAPOrders' test.out

#- 287 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FbZZkTlU' \
    --endTime 's82ElAFY' \
    --limit '97' \
    --offset '62' \
    --startTime 'cc0RQBp0' \
    --status 'PENDING' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserIAPConsumeHistory' test.out

#- 288 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'p7tYybjr' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "fNGA_gGUB", "productId": "ns12aQsr", "region": "KiOtoxCs", "transactionId": "8xZU3fso", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 288 'MockFulfillIAPItem' test.out

#- 289 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'JnFIWtb0' \
    --namespace "$AB_NAMESPACE" \
    --userId '4bOU2YKB' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetIAPOrderLineItems' test.out

#- 290 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'C2Jn1xa6' \
    > test.out 2>&1
eval_tap $? 290 'AdminSyncSteamAbnormalTransaction' test.out

#- 291 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'T2y24TlQ' \
    --body '{"orderId": "UZIA2UzT"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminSyncSteamIAPByTransaction' test.out

#- 292 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'UZ7vuqiY' \
    --activeOnly  \
    --groupId 'mZ3A0hLo' \
    --limit '1' \
    --offset '82' \
    --platform 'STEAM' \
    --productId '4S99yblj' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserThirdPartySubscription' test.out

#- 293 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId '0G6JRqcK' \
    --groupId 'PsRyCdVX' \
    > test.out 2>&1
eval_tap $? 293 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 294 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'mffMJWCA' \
    --productId '72s91EIR' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 295 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '3JUXkvIR' \
    --activeOnly  \
    --groupId 'zOeeXWvD' \
    --limit '78' \
    --offset '93' \
    --platform 'APPLE' \
    --productId '6qQ2nM8o' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 296 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'ELYtXElR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1LP3NyJ' \
    > test.out 2>&1
eval_tap $? 296 'GetThirdPartySubscriptionDetails' test.out

#- 297 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'deCDnk19' \
    --namespace "$AB_NAMESPACE" \
    --userId '6pQG20jt' \
    --limit '48' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 297 'GetSubscriptionHistory' test.out

#- 298 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'klYuZcLv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ToMvO0nh' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscriptionTransaction' test.out

#- 299 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'DduMll85' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zdERcdQ2' \
    > test.out 2>&1
eval_tap $? 299 'GetThirdPartyUserSubscriptionDetails' test.out

#- 300 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '2Ba5OaxA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySTp1fIv' \
    > test.out 2>&1
eval_tap $? 300 'SyncSubscription' test.out

#- 301 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sN9RJ1pQ' \
    --discounted  \
    --itemId 'F1x0BshG' \
    --limit '90' \
    --offset '75' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 301 'QueryUserOrders' test.out

#- 302 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hazv3top' \
    --body '{"currencyCode": "hElQRpbI", "currencyNamespace": "T2woN90u", "discountCodes": ["QaMt26S5", "AiBYa2UA", "SGmUdvP7"], "discountedPrice": 86, "entitlementPlatform": "Nintendo", "ext": {"RQ5KE9Te": {}, "RpZm1GdS": {}, "wSes8NNo": {}}, "itemId": "F3NFj6oz", "language": "6RM856UJ", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 21, "quantity": 12, "region": "YBHBtWrf", "returnUrl": "Kwb84QZ4", "sandbox": false, "sectionId": "mkIQAYGO"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateUserOrder' test.out

#- 303 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4rRAFt1t' \
    --itemId 'algfweOa' \
    > test.out 2>&1
eval_tap $? 303 'CountOfPurchasedItem' test.out

#- 304 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'btX1QXrN' \
    --userId 'Cnxr95w4' \
    > test.out 2>&1
eval_tap $? 304 'GetUserOrder' test.out

#- 305 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Le7Mf7Fn' \
    --userId 'M8MuRnX5' \
    --body '{"status": "FULFILLED", "statusReason": "0i1yrzQp"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateUserOrderStatus' test.out

#- 306 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4HmsFKVd' \
    --userId 'LAglzwt8' \
    > test.out 2>&1
eval_tap $? 306 'FulfillUserOrder' test.out

#- 307 GetUserOrderGrant
eval_tap 0 307 'GetUserOrderGrant # SKIP deprecated' test.out

#- 308 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QEkugEXO' \
    --userId 'Q317jfuD' \
    > test.out 2>&1
eval_tap $? 308 'GetUserOrderHistories' test.out

#- 309 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'A5fahhjG' \
    --userId 'sj4mVTOd' \
    --body '{"additionalData": {"cardSummary": "D9tmtN0D"}, "authorisedTime": "1976-09-26T00:00:00Z", "chargebackReversedTime": "1991-08-03T00:00:00Z", "chargebackTime": "1992-09-07T00:00:00Z", "chargedTime": "1974-03-20T00:00:00Z", "createdTime": "1977-06-23T00:00:00Z", "currency": {"currencyCode": "phssXFrp", "currencySymbol": "gGhYC4ma", "currencyType": "VIRTUAL", "decimals": 46, "namespace": "oKDV3hos"}, "customParameters": {"sTDRiqRI": {}, "UrggK3WI": {}, "Gt4UDnTe": {}}, "extOrderNo": "nMdxKDpi", "extTxId": "h972CtQF", "extUserId": "yM2qmuZ7", "issuedAt": "1998-07-27T00:00:00Z", "metadata": {"iBx1mOss": "YiAgiUfF", "obVrlSdC": "e40SKVg1", "3ZvbWdOz": "wUPJusBm"}, "namespace": "8Q7Emtwm", "nonceStr": "IRYxBoew", "paymentData": {"discountAmount": 49, "discountCode": "VZ2OLL6Q", "subtotalPrice": 9, "tax": 70, "totalPrice": 78}, "paymentMethod": "Abn2eiNn", "paymentMethodFee": 35, "paymentOrderNo": "sdYU1G7D", "paymentProvider": "XSOLLA", "paymentProviderFee": 73, "paymentStationUrl": "PoV0uSxV", "price": 86, "refundedTime": "1987-03-22T00:00:00Z", "salesTax": 45, "sandbox": true, "sku": "a6rzyXCg", "status": "CHARGED", "statusReason": "VSnmGYoH", "subscriptionId": "jPRhCGBS", "subtotalPrice": 65, "targetNamespace": "Yp2hufdM", "targetUserId": "tRNwEkPA", "tax": 55, "totalPrice": 18, "totalTax": 100, "txEndTime": "1977-03-19T00:00:00Z", "type": "JFny6bgz", "userId": "y68LWtlF", "vat": 46}' \
    > test.out 2>&1
eval_tap $? 309 'ProcessUserOrderNotification' test.out

#- 310 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qds2tp3N' \
    --userId '0QNXWhS9' \
    > test.out 2>&1
eval_tap $? 310 'DownloadUserOrderReceipt' test.out

#- 311 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'm2XtHUTH' \
    --body '{"currencyCode": "gDMDlL3n", "currencyNamespace": "sKkDGtKW", "customParameters": {"ZAwMZTYE": {}, "q28JFmzt": {}, "Rl9vC9Xr": {}}, "description": "yXpPnLm7", "extOrderNo": "JGa48Ac6", "extUserId": "8Uu6W7Vc", "itemType": "EXTENSION", "language": "Pgt-Wt", "metadata": {"AvD26ycI": "T5pkfjC5", "iJJH9VvG": "oGHhxTTf", "GKsCryDu": "bRiEQSXS"}, "notifyUrl": "dVpk1Jze", "omitNotification": false, "platform": "TQleIMQk", "price": 99, "recurringPaymentOrderNo": "riryoiqL", "region": "dO702lrf", "returnUrl": "xf5KVpgH", "sandbox": true, "sku": "h38EDJ7X", "subscriptionId": "9AF1oXmi", "title": "vFYVmcFZ"}' \
    > test.out 2>&1
eval_tap $? 311 'CreateUserPaymentOrder' test.out

#- 312 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2wFXfwNz' \
    --userId 'RNT3pJD3' \
    --body '{"description": "HNPv0jxU"}' \
    > test.out 2>&1
eval_tap $? 312 'RefundUserPaymentOrder' test.out

#- 313 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'hyizxW2m' \
    > test.out 2>&1
eval_tap $? 313 'GetUserPlatformAccountClosureHistories' test.out

#- 314 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'VmSES9Mp' \
    --body '{"code": "LfRHpLoB", "orderNo": "0kHHHywM"}' \
    > test.out 2>&1
eval_tap $? 314 'ApplyUserRedemption' test.out

#- 315 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'o6B5JjSn' \
    --body '{"meta": {"zgMx5HMS": {}, "IEPwm4fM": {}, "cUsDe7Ha": {}}, "reason": "DNwpQNJO", "requestId": "tTgla6Qx", "revokeEntries": [{"currency": {"balanceOrigin": "Steam", "currencyCode": "wkMSqAqu", "namespace": "NfeX4VU4"}, "entitlement": {"entitlementId": "ABQ5GCVa"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "u4RB2Ek8", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 40, "type": "ITEM"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "TKi5aHol", "namespace": "AfZ9o6fU"}, "entitlement": {"entitlementId": "uxaKFAXG"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "ce6CEcqC", "itemIdentityType": "ITEM_ID", "origin": "Steam"}, "quantity": 84, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "OnwDKecx", "namespace": "kTBDG2Yl"}, "entitlement": {"entitlementId": "OP8Ejma7"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "eeV7xcQd", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 73, "type": "ITEM"}], "source": "DLC", "transactionId": "2Y6PNCtJ"}' \
    > test.out 2>&1
eval_tap $? 315 'DoRevocation' test.out

#- 316 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YKVGeruE' \
    --body '{"gameSessionId": "p2D22yAL", "payload": {"MMzhSeDZ": {}, "0UdONzZT": {}, "sol8K9jU": {}}, "scid": "P7IQgm9X", "sessionTemplateName": "MvCSoViJ"}' \
    > test.out 2>&1
eval_tap $? 316 'RegisterXblSessions' test.out

#- 317 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ObmMexzb' \
    --chargeStatus 'SETUP' \
    --itemId 'r0W8CZon' \
    --limit '39' \
    --offset '84' \
    --sku 'rW0qvH8a' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserSubscriptions' test.out

#- 318 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '7bnkXJEa' \
    --excludeSystem  \
    --limit '32' \
    --offset '12' \
    --subscriptionId 'eo4dNYdX' \
    > test.out 2>&1
eval_tap $? 318 'GetUserSubscriptionActivities' test.out

#- 319 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRCKF6OK' \
    --body '{"grantDays": 47, "itemId": "vB4MkW1K", "language": "NcHgraeZ", "reason": "YG4CHbRn", "region": "yWo48tGr", "source": "fsdd4xnm"}' \
    > test.out 2>&1
eval_tap $? 319 'PlatformSubscribeSubscription' test.out

#- 320 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAOodCiz' \
    --itemId 's4kbL2SZ' \
    > test.out 2>&1
eval_tap $? 320 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 321 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ERy6PUBo' \
    --userId 'SVs6YH0d' \
    > test.out 2>&1
eval_tap $? 321 'GetUserSubscription' test.out

#- 322 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ofIv5bwM' \
    --userId 'kAEuBWXK' \
    > test.out 2>&1
eval_tap $? 322 'DeleteUserSubscription' test.out

#- 323 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1iww18Ca' \
    --userId '5PRhpzDv' \
    --force  \
    --body '{"immediate": true, "reason": "GsK8ZkVp"}' \
    > test.out 2>&1
eval_tap $? 323 'CancelSubscription' test.out

#- 324 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RT1wfIQL' \
    --userId 'bKMWCcwD' \
    --body '{"grantDays": 68, "reason": "hiG6L9TQ"}' \
    > test.out 2>&1
eval_tap $? 324 'GrantDaysToSubscription' test.out

#- 325 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TnutD38g' \
    --userId 'FkV9haP6' \
    --excludeFree  \
    --limit '5' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionBillingHistories' test.out

#- 326 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'w83dVUgh' \
    --userId 'taLVZRa0' \
    --body '{"additionalData": {"cardSummary": "9vmhzu7b"}, "authorisedTime": "1973-09-25T00:00:00Z", "chargebackReversedTime": "1981-07-18T00:00:00Z", "chargebackTime": "1994-11-24T00:00:00Z", "chargedTime": "1989-11-15T00:00:00Z", "createdTime": "1978-10-25T00:00:00Z", "currency": {"currencyCode": "9g0Mrjr3", "currencySymbol": "54KMnM6Y", "currencyType": "REAL", "decimals": 60, "namespace": "WbcC8Y9P"}, "customParameters": {"DeQ0Fyuq": {}, "bjhZI0Kg": {}, "9ERJC30E": {}}, "extOrderNo": "0wLIJEfz", "extTxId": "xR7bOQ4G", "extUserId": "athwXZsJ", "issuedAt": "1972-04-24T00:00:00Z", "metadata": {"lNSVzo5N": "3srKL9wn", "m9Fog9cZ": "hN6Z8yrK", "MMFsHnzc": "weCnHJv8"}, "namespace": "5RmpdStV", "nonceStr": "PNjRaL92", "paymentData": {"discountAmount": 90, "discountCode": "7kIXj4Mb", "subtotalPrice": 19, "tax": 37, "totalPrice": 39}, "paymentMethod": "Q5VdSJX6", "paymentMethodFee": 19, "paymentOrderNo": "JbDvoh7A", "paymentProvider": "CHECKOUT", "paymentProviderFee": 1, "paymentStationUrl": "fKdDdAmN", "price": 32, "refundedTime": "1989-06-12T00:00:00Z", "salesTax": 26, "sandbox": false, "sku": "wegAkjuK", "status": "REFUNDED", "statusReason": "sGm7oB9S", "subscriptionId": "5y28Aa6N", "subtotalPrice": 70, "targetNamespace": "nqObcGDe", "targetUserId": "TZXKPWWH", "tax": 26, "totalPrice": 34, "totalTax": 86, "txEndTime": "1985-08-11T00:00:00Z", "type": "MktDneIw", "userId": "B9Im7P6s", "vat": 83}' \
    > test.out 2>&1
eval_tap $? 326 'ProcessUserSubscriptionNotification' test.out

#- 327 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '4g2FUw34' \
    --namespace "$AB_NAMESPACE" \
    --userId '9YjWGCuS' \
    --body '{"count": 17, "orderNo": "3PkfDuWi"}' \
    > test.out 2>&1
eval_tap $? 327 'AcquireUserTicket' test.out

#- 328 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdigKXCC' \
    > test.out 2>&1
eval_tap $? 328 'QueryUserCurrencyWallets' test.out

#- 329 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'QdTdVbVH' \
    --namespace "$AB_NAMESPACE" \
    --userId '1yqFk7nA' \
    --body '{"allowOverdraft": true, "amount": 23, "balanceOrigin": "IOS", "balanceSource": "PAYMENT", "metadata": {"D3O7Aqc4": {}, "VpVm5pzg": {}, "DeDQfynA": {}}, "reason": "HhoBpYZ9"}' \
    > test.out 2>&1
eval_tap $? 329 'DebitUserWalletByCurrencyCode' test.out

#- 330 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '22UZcvmA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQaunCvX' \
    --limit '64' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 330 'ListUserCurrencyTransactions' test.out

#- 331 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'P34ZRHT0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UmN4HeY8' \
    --request '{"amount": 23, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"RXLbmYw8": {}, "RHhYQlig": {}, "OHoz18TW": {}}, "reason": "c69un7nE", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 331 'CheckBalance' test.out

#- 332 CheckWallet
eval_tap 0 332 'CheckWallet # SKIP deprecated' test.out

#- 333 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'bOEP2wqr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GmiYXE5r' \
    --body '{"amount": 79, "expireAt": "1976-08-12T00:00:00Z", "metadata": {"x9X7yoaE": {}, "fXyk16WZ": {}, "2sAxkWFn": {}}, "origin": "Other", "reason": "BQ12jLRW", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 333 'CreditUserWallet' test.out

#- 334 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'zQ3vUJ1f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e5j9SM0Z' \
    --request '{"amount": 85, "debitBalanceSource": "OTHER", "metadata": {"SS5iUOYg": {}, "7ocUDCRK": {}, "HMHDXq7l": {}}, "reason": "Scnrb3P8", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 334 'DebitByWalletPlatform' test.out

#- 335 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Y7R30NKf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BU7ms92a' \
    --body '{"amount": 94, "metadata": {"Mid2FZtF": {}, "Dsk05fmG": {}, "z7eCgqcK": {}}, "walletPlatform": "Oculus"}' \
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
    --storeId 'BKCp2KWy' \
    > test.out 2>&1
eval_tap $? 341 'ListViews' test.out

#- 342 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '4UryMMVJ' \
    --body '{"displayOrder": 63, "localizations": {"J9BVtvN1": {"description": "Yv9uDotY", "localExt": {"8mFIPdmC": {}, "Bkyq4A2U": {}, "8r0v8iVU": {}}, "longDescription": "zA83I8pq", "title": "sFcHkOlG"}, "3oZR6aAk": {"description": "qsHKCUcK", "localExt": {"s50siJoQ": {}, "HY3gIqTv": {}, "BIGLARVW": {}}, "longDescription": "xwGNNmIE", "title": "ScDimVmi"}, "yllWyHjd": {"description": "p3Wt3NTo", "localExt": {"LcNmySCs": {}, "JWc7IrRz": {}, "weSXHr7F": {}}, "longDescription": "mGL4Xkc8", "title": "QId9ZkPl"}}, "name": "V2qiEJpk"}' \
    > test.out 2>&1
eval_tap $? 342 'CreateView' test.out

#- 343 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'zDgFaNfL' \
    --storeId '5qbllKXL' \
    > test.out 2>&1
eval_tap $? 343 'GetView' test.out

#- 344 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'o9NsVutb' \
    --storeId 'InfvY7LP' \
    --body '{"displayOrder": 30, "localizations": {"MphhZCuN": {"description": "zonvHSod", "localExt": {"NuYjk5bA": {}, "S9MV2VgA": {}, "RBxHg9iM": {}}, "longDescription": "ieLev7FD", "title": "qvFCNJhF"}, "Kkp5gONr": {"description": "vPMXerjd", "localExt": {"yAZYrQ17": {}, "T9CJwS3m": {}, "FoqqHrKy": {}}, "longDescription": "uBHrANIA", "title": "shEYbLr6"}, "XqWZjcGS": {"description": "DmKeDt3u", "localExt": {"P74d3OKB": {}, "sW3f9HL9": {}, "4NTKJbKG": {}}, "longDescription": "mCYdVD7y", "title": "zfO5SlVr"}}, "name": "nXtUcp4A"}' \
    > test.out 2>&1
eval_tap $? 344 'UpdateView' test.out

#- 345 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'QxFpNKYt' \
    --storeId 'iCPW16Y7' \
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
    --body '[{"creditRequest": {"amount": 74, "expireAt": "1991-06-04T00:00:00Z", "metadata": {"BoXBCqTA": {}, "3koYdzQt": {}, "kMvKXu0W": {}}, "origin": "Nintendo", "reason": "j5VRGoNA", "source": "SELL_BACK"}, "currencyCode": "vANJGDQZ", "userIds": ["p73RQWGT", "I4ZIV0cP", "Z91fuQIx"]}, {"creditRequest": {"amount": 80, "expireAt": "1992-05-01T00:00:00Z", "metadata": {"K99eEE7d": {}, "DNnnR3rS": {}, "vhLccPJ6": {}}, "origin": "Epic", "reason": "879CMsY9", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "Ye15bfDK", "userIds": ["MWR6lk2z", "hNqxsX3U", "UQzcuEYv"]}, {"creditRequest": {"amount": 99, "expireAt": "1973-03-13T00:00:00Z", "metadata": {"0mptgkl5": {}, "CsTdQOuf": {}, "Nr8VuvnT": {}}, "origin": "Playstation", "reason": "EttPqhRA", "source": "PURCHASE"}, "currencyCode": "4ECYhyZc", "userIds": ["1Lu69llK", "pLBym5qg", "qkldLJZ7"]}]' \
    > test.out 2>&1
eval_tap $? 349 'BulkCredit' test.out

#- 350 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "TKAOy5yw", "request": {"allowOverdraft": true, "amount": 32, "balanceOrigin": "Twitch", "balanceSource": "EXPIRATION", "metadata": {"2vRx8BX3": {}, "GuRy1rh4": {}, "qIqknBPW": {}}, "reason": "lZ3oGadZ"}, "userIds": ["LAL8k1UH", "IlZloO8k", "N6WuwS0E"]}, {"currencyCode": "Ruf2FOHf", "request": {"allowOverdraft": true, "amount": 70, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"C1Up5XeS": {}, "AAWjRHEx": {}, "2dKxfw9c": {}}, "reason": "FTFqipZO"}, "userIds": ["1pjbkeUn", "u2xhJ6NO", "k7gp418G"]}, {"currencyCode": "CUC95BAp", "request": {"allowOverdraft": true, "amount": 80, "balanceOrigin": "System", "balanceSource": "ORDER_REVOCATION", "metadata": {"z91ycAYI": {}, "ggK25a1G": {}, "dMZPxwBT": {}}, "reason": "BBpfzmxO"}, "userIds": ["MjtBbLOE", "IvrGPI7o", "X5QNxKHr"]}]' \
    > test.out 2>&1
eval_tap $? 350 'BulkDebit' test.out

#- 351 GetWallet
eval_tap 0 351 'GetWallet # SKIP deprecated' test.out

#- 352 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '7lueF8DH' \
    --end 'clDl3dnH' \
    --start '1oB6rMRA' \
    > test.out 2>&1
eval_tap $? 352 'SyncOrders' test.out

#- 353 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["kpbng30z", "kzwbgMSS", "0xL50HXV"], "apiKey": "rYzWsM6G", "authoriseAsCapture": true, "blockedPaymentMethods": ["s7hyb7vX", "JHj0P1kB", "468nSDv8"], "clientKey": "7IiCZiDn", "dropInSettings": "VFonlmpV", "liveEndpointUrlPrefix": "hDCnHu8D", "merchantAccount": "ch5V1fmA", "notificationHmacKey": "ci67DBUa", "notificationPassword": "bWAD5JyE", "notificationUsername": "uFmvDgwL", "returnUrl": "kyUE5HWJ", "settings": "fqnGqSM9"}' \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfig' test.out

#- 354 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "nvnKl5vB", "privateKey": "CQ42UVLL", "publicKey": "WlRernan", "returnUrl": "GnDweTZK"}' \
    > test.out 2>&1
eval_tap $? 354 'TestAliPayConfig' test.out

#- 355 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "S96pml56", "secretKey": "cBkDYwkD"}' \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfig' test.out

#- 356 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'WT8wsEwm' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentMerchantConfig' test.out

#- 357 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "OUwZTlwf", "webhookSecretKey": "GDPufC9O"}' \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfig' test.out

#- 358 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "hKOlegWc", "clientSecret": "z9GIlOa3", "returnUrl": "6Nyr6hBY", "webHookId": "awy0klNe"}' \
    > test.out 2>&1
eval_tap $? 358 'TestPayPalConfig' test.out

#- 359 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["5X46fjlI", "18e25Of6", "p6YAXWmV"], "publishableKey": "xbxrP25L", "secretKey": "ngRlmzYQ", "webhookSecret": "QmD89rV6"}' \
    > test.out 2>&1
eval_tap $? 359 'TestStripeConfig' test.out

#- 360 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "riZYZR2e", "key": "5oXqvIUf", "mchid": "4B7m11z6", "returnUrl": "bcwce9AG"}' \
    > test.out 2>&1
eval_tap $? 360 'TestWxPayConfig' test.out

#- 361 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "3URUaC1c", "flowCompletionUrl": "NMlUkLPn", "merchantId": 45, "projectId": 21, "projectSecretKey": "eeb2HoD3"}' \
    > test.out 2>&1
eval_tap $? 361 'TestXsollaConfig' test.out

#- 362 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'Kjq48fxQ' \
    > test.out 2>&1
eval_tap $? 362 'GetPaymentMerchantConfig1' test.out

#- 363 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'HginpjTo' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["ZrSbLt8n", "fmnzRBg8", "9vi6Rywz"], "apiKey": "ffL8NPYx", "authoriseAsCapture": true, "blockedPaymentMethods": ["1T1pZ3XQ", "3pNZ9TWn", "vsprRT0K"], "clientKey": "5fCohhPo", "dropInSettings": "3izyhFaX", "liveEndpointUrlPrefix": "mGajnoP1", "merchantAccount": "TkORNcH0", "notificationHmacKey": "cyxT5D4x", "notificationPassword": "Aak4vTPq", "notificationUsername": "3doGHsjp", "returnUrl": "BU5z8Iyz", "settings": "oAIeEyll"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAdyenConfig' test.out

#- 364 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'ei6Vv4Mi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAdyenConfigById' test.out

#- 365 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'sMmtRZ9w' \
    --sandbox  \
    --validate  \
    --body '{"appId": "7Op1sMQB", "privateKey": "GbicVvtE", "publicKey": "QxNSntcy", "returnUrl": "8tQiVq2N"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateAliPayConfig' test.out

#- 366 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'R2r5Q6Aw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestAliPayConfigById' test.out

#- 367 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'QDRYO6mX' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "UrXVH4NK", "secretKey": "KJ1atEb2"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateCheckoutConfig' test.out

#- 368 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'rZPoltvu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestCheckoutConfigById' test.out

#- 369 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'IKmFRD3i' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "StcnObOV", "webhookSecretKey": "LM6aEXGe"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateNeonPayConfig' test.out

#- 370 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'A6EBgoV3' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestNeonPayConfigById' test.out

#- 371 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'JLExnk68' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "f1GoRjop", "clientSecret": "tdJSZVzm", "returnUrl": "SpDD2MC0", "webHookId": "jvgKs5RJ"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdatePayPalConfig' test.out

#- 372 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '2LZG5U2n' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestPayPalConfigById' test.out

#- 373 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '52pG5Odv' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["gmg4jghv", "Y9A4ibzP", "AbnjEWT4"], "publishableKey": "fxiRXH27", "secretKey": "1O4jFlup", "webhookSecret": "igt6SDGu"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateStripeConfig' test.out

#- 374 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '5v9MOaiQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestStripeConfigById' test.out

#- 375 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'v1CLqa90' \
    --validate  \
    --body '{"appId": "EU1kPnSP", "key": "VMCEQRO9", "mchid": "ctkEEKBr", "returnUrl": "NaYx2KkA"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateWxPayConfig' test.out

#- 376 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'E8DRYoVa' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'UpdateWxPayConfigCert' test.out

#- 377 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'd4viF7Dz' \
    > test.out 2>&1
eval_tap $? 377 'TestWxPayConfigById' test.out

#- 378 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'kHu94u6Z' \
    --validate  \
    --body '{"apiKey": "7jsxsXqd", "flowCompletionUrl": "Jx1v8Xcr", "merchantId": 38, "projectId": 27, "projectSecretKey": "dV9L9f0t"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaConfig' test.out

#- 379 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'VAaMsQFX' \
    > test.out 2>&1
eval_tap $? 379 'TestXsollaConfigById' test.out

#- 380 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '68Evvodb' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateXsollaUIConfig' test.out

#- 381 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '50' \
    --namespace "$AB_NAMESPACE" \
    --offset '4' \
    --region '0L8TunXM' \
    > test.out 2>&1
eval_tap $? 381 'QueryPaymentProviderConfig' test.out

#- 382 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "9qeLVqP3", "region": "5DU3PAtH", "sandboxTaxJarApiToken": "UGAzlqWi", "specials": ["STRIPE", "ADYEN", "STRIPE"], "taxJarApiToken": "hRdIEbGM", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 382 'CreatePaymentProviderConfig' test.out

#- 383 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetAggregatePaymentProviders' test.out

#- 384 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'WrODoOjM' \
    > test.out 2>&1
eval_tap $? 384 'DebugMatchedPaymentProviderConfig' test.out

#- 385 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 385 'GetSpecialPaymentProviders' test.out

#- 386 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'wMoGUmmv' \
    --body '{"aggregate": "STRIPE", "namespace": "NwKWnHNK", "region": "0yJTYvei", "sandboxTaxJarApiToken": "jawdPZaJ", "specials": ["WXPAY", "ALIPAY", "XSOLLA"], "taxJarApiToken": "9oCECL6O", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 386 'UpdatePaymentProviderConfig' test.out

#- 387 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'zBS8onCu' \
    > test.out 2>&1
eval_tap $? 387 'DeletePaymentProviderConfig' test.out

#- 388 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxConfig' test.out

#- 389 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "135xEcph", "taxJarApiToken": "WNenlCI9", "taxJarEnabled": true, "taxJarProductCodesMapping": {"0my0cxBt": "dVlSAH8S", "37YbPyws": "Iz46h2Bp", "h4GmDLJS": "xgpigBGG"}}' \
    > test.out 2>&1
eval_tap $? 389 'UpdatePaymentTaxConfig' test.out

#- 390 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'D7c5hEl8' \
    --end 'KDuShkw9' \
    --start 'xZHqaGr6' \
    > test.out 2>&1
eval_tap $? 390 'SyncPaymentOrders' test.out

#- 391 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'jfWBc7xM' \
    --storeId 'Exp09dYj' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetRootCategories' test.out

#- 392 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '3gZMf3ms' \
    --storeId 'eEA5Pd6N' \
    > test.out 2>&1
eval_tap $? 392 'DownloadCategories' test.out

#- 393 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'BoYWj8N7' \
    --namespace "$AB_NAMESPACE" \
    --language '8sdxQkLs' \
    --storeId 'QbYpqqmN' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetCategory' test.out

#- 394 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'tP5JV7kM' \
    --namespace "$AB_NAMESPACE" \
    --language 'nMgQUnDA' \
    --storeId 'J345ptFu' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetChildCategories' test.out

#- 395 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'RFzB39dK' \
    --namespace "$AB_NAMESPACE" \
    --language 'hpMbP3Ra' \
    --storeId 'pNeEqU8b' \
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
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 399 'GetIAPItemMapping' test.out

#- 400 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '1xYrs3qR' \
    --region 'px8TfhyM' \
    --storeId 'SneC44p9' \
    --appId 'XL655ySy' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemByAppId' test.out

#- 401 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'ADYuH382' \
    --categoryPath 'mn7X1OSg' \
    --features 'qsEV2OvK' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --language 'AzA2SigK' \
    --limit '50' \
    --offset '67' \
    --region 'eLbPujm8' \
    --sortBy 'name:asc,name' \
    --storeId 'wzzRDcCI' \
    --tags 'aurq14sh' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryItems' test.out

#- 402 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'UvwKbOcj' \
    --region 'PpksHiju' \
    --storeId 'zyg5KFLP' \
    --sku 'qL5muYWr' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetItemBySku' test.out

#- 403 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'wHU553OR' \
    --storeId 'SBo9rnVB' \
    --itemIds 'k4fEIiR1' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetEstimatedPrice' test.out

#- 404 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '8zGPABYI' \
    --region 'RbjhQfBI' \
    --storeId 'FWKYJtq3' \
    --itemIds 'hA98m455' \
    > test.out 2>&1
eval_tap $? 404 'PublicBulkGetItems' test.out

#- 405 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["TKoGxtI5", "xAecPvGq", "eikgwoV8"]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicValidateItemPurchaseCondition' test.out

#- 406 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'OPTIONBOX' \
    --limit '16' \
    --offset '5' \
    --region 'OPdLSYDW' \
    --storeId 'YZY0GJqV' \
    --keyword 'AVLAGJum' \
    --language 'rz9rmpyn' \
    > test.out 2>&1
eval_tap $? 406 'PublicSearchItems' test.out

#- 407 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'o5dtkXDN' \
    --namespace "$AB_NAMESPACE" \
    --language 'Q3gzdTeY' \
    --region 'X1B0VLRA' \
    --storeId 'EEzb9sRc' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetApp' test.out

#- 408 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'LWJAyXup' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemDynamicData' test.out

#- 409 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'fz38SL2E' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'vqcuYmBW' \
    --populateBundle  \
    --region 'aTSJ4vs2' \
    --storeId 'fbzaoEvt' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItem' test.out

#- 410 GetPaymentCustomization
eval_tap 0 410 'GetPaymentCustomization # SKIP deprecated' test.out

#- 411 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "65uDNpWX", "successUrl": "IVlFEJ0j"}, "paymentOrderNo": "IZ1qgJ4W", "paymentProvider": "NEONPAY", "returnUrl": "4HWWO9MI", "ui": "dVWxD87H", "zipCode": "UIXeFMk3"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentUrl' test.out

#- 412 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gkq8RFtw' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetPaymentMethods' test.out

#- 413 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pY2AIdJi' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUnpaidPaymentOrder' test.out

#- 414 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'J1Wl0zR1' \
    --paymentProvider 'PAYPAL' \
    --zipCode 'f7no2KY2' \
    --body '{"token": "rHAaNDqE"}' \
    > test.out 2>&1
eval_tap $? 414 'Pay' test.out

#- 415 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1ucXhjV1' \
    > test.out 2>&1
eval_tap $? 415 'PublicCheckPaymentOrderPaidStatus' test.out

#- 416 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'dYU3hd7W' \
    > test.out 2>&1
eval_tap $? 416 'GetPaymentPublicConfig' test.out

#- 417 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'Jc6o1Aiw' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetQRCode' test.out

#- 418 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'cAlLQvLu' \
    --foreinginvoice 'sl9bdbsJ' \
    --invoiceId '4hYrDKv1' \
    --payload 'AtpT8Z9X' \
    --redirectResult 'mCVpH8mo' \
    --resultCode 'Ir6ZXa5l' \
    --sessionId 'gaPVYKva' \
    --status 'uckcpE9l' \
    --token 'qIiQJjAN' \
    --type 'NC3v5Szi' \
    --userId 'TvyoJKl9' \
    --orderNo 'FL6RySNL' \
    --paymentOrderNo '9wYeQz0k' \
    --paymentProvider 'WALLET' \
    --returnUrl 'ik7nyX7u' \
    > test.out 2>&1
eval_tap $? 418 'PublicNormalizePaymentReturnUrl' test.out

#- 419 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'S54mqxrK' \
    --paymentOrderNo 'cz7oWX7G' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 419 'GetPaymentTaxValue' test.out

#- 420 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'mY3gZBD3' \
    > test.out 2>&1
eval_tap $? 420 'GetRewardByCode' test.out

#- 421 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '3FsSYG5f' \
    --limit '91' \
    --offset '18' \
    --sortBy 'namespace,rewardCode:desc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 421 'QueryRewards1' test.out

#- 422 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'y4qeff59' \
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
    --appIds 'UiBtB7th,E6y2Dcy8,JV6p2jNQ' \
    --itemIds 'GaSFpkRa,ENTOc5WD,B3FkALKx' \
    --skus 'vAxa7I0j,0oc5lXFa,sruqOslI' \
    > test.out 2>&1
eval_tap $? 424 'PublicExistsAnyMyActiveEntitlement' test.out

#- 425 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '945BtnSd' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 426 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'L5gfO0Wf' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 427 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'wKfg3rjd' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 428 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'MQjFJfYl,3Jjs48RJ,3GgWoxRi' \
    --itemIds '2ZWQcO2l,GSMgInmA,ca3MwSWB' \
    --skus 'AbVn9RZj,0U6oTeDb,LZKRBoM2' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetEntitlementOwnershipToken' test.out

#- 429 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "HbvkMvyn", "language": "gXW-qKsI-820", "region": "PfP7USCF"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncTwitchDropsEntitlement' test.out

#- 430 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'TYXQuInh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicGetMyWallet' test.out

#- 431 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'PzUVK56A' \
    --body '{"epicGamesJwtToken": "7ffDtlwM"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncEpicGameDLC' test.out

#- 432 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 't0LMURtD' \
    > test.out 2>&1
eval_tap $? 432 'SyncOculusDLC' test.out

#- 433 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqDnzarI' \
    --body '{"serviceLabel": 10}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSyncPsnDlcInventory' test.out

#- 434 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVF9HJUG' \
    --body '{"serviceLabels": [8, 65, 27]}' \
    > test.out 2>&1
eval_tap $? 434 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 435 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'n2w6vCxi' \
    --body '{"appId": "OYVQ0APW", "steamId": "3fi2Ll38"}' \
    > test.out 2>&1
eval_tap $? 435 'SyncSteamDLC' test.out

#- 436 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 's9QmBXUr' \
    --body '{"xstsToken": "dJv2BrME"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncXboxDLC' test.out

#- 437 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'paX7veJv' \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '3X2YnvSq' \
    --features '21GVmbQs,o4phcU8F,Q5SdVbwp' \
    --itemId 'gGEXzNyd,lhtXEQYB,6wULBIoK' \
    --limit '45' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlements' test.out

#- 438 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSGr1YjB' \
    --appId 'N00tQ1Fj' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserAppEntitlementByAppId' test.out

#- 439 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '9ZHCG0Xh' \
    --limit '35' \
    --offset '65' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 439 'PublicQueryUserEntitlementsByAppType' test.out

#- 440 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7KaLSMJT' \
    --availablePlatformOnly  \
    --ids 'NGqS0dqA,A1lDdv2o,lvPy1RIK' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserEntitlementsByIds' test.out

#- 441 PublicGetUserEntitlementByItemId
eval_tap 0 441 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 442 PublicGetUserEntitlementBySku
eval_tap 0 442 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 443 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4zzIRgX' \
    --endDate 'yiDzVpvN' \
    --entitlementClazz 'MEDIA' \
    --limit '40' \
    --offset '4' \
    --startDate 'PbBkVOLL' \
    > test.out 2>&1
eval_tap $? 443 'PublicUserEntitlementHistory' test.out

#- 444 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'LvW55CDq' \
    --appIds 'Cf0LUYEB,EYWoLvfu,jQ10mfYM' \
    --itemIds 'NYNLDqx5,ScX4mWN3,uEe05Cot' \
    --skus 'zrHjl2q2,ZyZmKStD,bFFSfIG4' \
    > test.out 2>&1
eval_tap $? 444 'PublicExistsAnyUserActiveEntitlement' test.out

#- 445 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yo4OO6rR' \
    --appId 'vrIxtISt' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 446 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQKDYGPF' \
    --entitlementClazz 'CODE' \
    --itemId '4oMzvZln' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 447 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'bd9fgQi2' \
    --ids 'qrYV58WL,OfHKX3Xl,LXixBZMt' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 448 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXF5HjxZ' \
    --entitlementClazz 'CODE' \
    --sku 'eXetkNE9' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 449 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'har56o53' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TbkLBUDt' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlement' test.out

#- 450 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '4fFmoCl1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1FDP8Vm7' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["DhdmrEyE", "oiYPA7FP", "dCuEmwy5"], "requestId": "iwS5AAjR", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 450 'PublicConsumeUserEntitlement' test.out

#- 451 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'kfal2XPX' \
    --namespace "$AB_NAMESPACE" \
    --userId '5SlhyjIK' \
    --body '{"requestId": "CZ1uYYcd", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 451 'PublicSellUserEntitlement' test.out

#- 452 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'hWE4LZPW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThLoim4Y' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 452 'PublicSplitUserEntitlement' test.out

#- 453 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'h2MpMgZ8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cqJwSViB' \
    --body '{"entitlementId": "aWmPkbJE", "metadata": {"operationSource": "INVENTORY"}, "useCount": 5}' \
    > test.out 2>&1
eval_tap $? 453 'PublicTransferUserEntitlement' test.out

#- 454 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KYBobIHq' \
    --body '{"code": "yIoLW4Wt", "language": "Ui-CWyR", "region": "bVwMQByM"}' \
    > test.out 2>&1
eval_tap $? 454 'PublicRedeemCode' test.out

#- 455 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'swU4ycO2' \
    --body '{"excludeOldTransactions": false, "language": "Pwz", "productId": "HPkm3AeR", "receiptData": "t7UDHUYo", "region": "UAWcWuzB", "transactionId": "gqvk9W4R"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillAppleIAPItem' test.out

#- 456 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '47mEei0L' \
    --body '{"epicGamesJwtToken": "jt3lLz00"}' \
    > test.out 2>&1
eval_tap $? 456 'SyncEpicGamesInventory' test.out

#- 457 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yXBYzYIF' \
    --body '{"autoAck": true, "autoConsume": false, "language": "re_FjLp-722", "orderId": "V8TFZPQK", "packageName": "EU07put8", "productId": "HxUUKTXm", "purchaseTime": 68, "purchaseToken": "Rhh9RYrY", "region": "9gVAmIpb", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 457 'PublicFulfillGoogleIAPItem' test.out

#- 458 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ch17WqDC' \
    > test.out 2>&1
eval_tap $? 458 'SyncOculusConsumableEntitlements' test.out

#- 459 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'qoUIWPPu' \
    --body '{"currencyCode": "iUQ29yFw", "price": 0.9050678805290077, "productId": "dnQHnwR5", "serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 459 'PublicReconcilePlayStationStore' test.out

#- 460 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxBdil5x' \
    --body '{"currencyCode": "Ckro5oYf", "price": 0.24104208230538116, "productId": "rGflnsmC", "serviceLabels": [24, 18, 75]}' \
    > test.out 2>&1
eval_tap $? 460 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 461 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'AMtKSsbZ' \
    --body '{"appId": "QrOzr69R", "currencyCode": "49yxhLwa", "language": "cAPV-eSdE-Tn", "price": 0.13051261500564915, "productId": "lblMpCW6", "region": "U2giz9JO", "steamId": "nlIm3DwU"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamInventory' test.out

#- 462 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'tIG4MP4Q' \
    > test.out 2>&1
eval_tap $? 462 'SyncSteamAbnormalTransaction' test.out

#- 463 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'xbB6gJIk' \
    --body '{"orderId": "W7zlmZGf"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncSteamIAPByTransaction' test.out

#- 464 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'NIHgPmpZ' \
    --activeOnly  \
    --groupId 'Vpbd2gWT' \
    --limit '58' \
    --offset '5' \
    --productId 'OAVjF0PS' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserThirdPartySubscription' test.out

#- 465 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYy5wV9v' \
    --body '{"gameId": "F2xoqp4I", "language": "sXI-kCeQ_OC", "region": "kOeG5Afe"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncTwitchDropsEntitlement1' test.out

#- 466 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RI5MNMOX' \
    --body '{"currencyCode": "70jGQPdF", "price": 0.7245804279034737, "productId": "kZnKVQp1", "xstsToken": "zI4OwecH"}' \
    > test.out 2>&1
eval_tap $? 466 'SyncXboxInventory' test.out

#- 467 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jW3JVAN4' \
    --discounted  \
    --itemId 'DrGBsc2C' \
    --limit '68' \
    --offset '97' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 467 'PublicQueryUserOrders' test.out

#- 468 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVylpPyn' \
    --body '{"currencyCode": "LG9RsZne", "discountCodes": ["keLmYEtL", "mTiBwiVD", "zR4HJX04"], "discountedPrice": 66, "ext": {"hjNF1tDP": {}, "itdMdxxU": {}, "wyAHXEZL": {}}, "itemId": "mGa6bh5O", "language": "jVk", "price": 97, "quantity": 6, "region": "HGjZsEbR", "returnUrl": "muzh2rbU", "sectionId": "4fFbSPq7"}' \
    > test.out 2>&1
eval_tap $? 468 'PublicCreateUserOrder' test.out

#- 469 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnhlmr4C' \
    --body '{"currencyCode": "QSe68ZH7", "discountCodes": ["xjKVLmVO", "xNsIZrnn", "ZX3A5yFD"], "discountedPrice": 3, "itemId": "EJCaZWB2", "price": 75, "quantity": 86}' \
    > test.out 2>&1
eval_tap $? 469 'PublicPreviewOrderPrice' test.out

#- 470 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Fq0OTke7' \
    --userId 'dowlJXga' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrder' test.out

#- 471 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Qyb45IU2' \
    --userId 'WRalW5k3' \
    > test.out 2>&1
eval_tap $? 471 'PublicCancelUserOrder' test.out

#- 472 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'usSrRBa4' \
    --userId 'LVb7SgrD' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetUserOrderHistories' test.out

#- 473 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'udui5dnX' \
    --userId 'EbFYfeGK' \
    > test.out 2>&1
eval_tap $? 473 'PublicDownloadUserOrderReceipt' test.out

#- 474 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvBYSai2' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetPaymentAccounts' test.out

#- 475 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'R4mrj0hR' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId '5ZnI2wXf' \
    > test.out 2>&1
eval_tap $? 475 'PublicDeletePaymentAccount' test.out

#- 476 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'LeBHvwRn' \
    --autoCalcEstimatedPrice  \
    --language 'jbhEF74O' \
    --region 'Vs5CGvl2' \
    --storeId 'lPVRHCAS' \
    --viewId 'WQXDhNBM' \
    > test.out 2>&1
eval_tap $? 476 'PublicListActiveSections' test.out

#- 477 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '87JPbCCf' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'jPVFhSEM' \
    --limit '78' \
    --offset '97' \
    --sku 'jsX6YePr' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserSubscriptions' test.out

#- 478 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSIZ2S7i' \
    --body '{"currencyCode": "FQs2jmTA", "itemId": "0jHuw6U8", "language": "ks_rCDG", "region": "XCa5CRlZ", "returnUrl": "IxIviwaU", "source": "FGdyzjUh"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicSubscribeSubscription' test.out

#- 479 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3C1Opv4u' \
    --itemId 'sX186FQ4' \
    > test.out 2>&1
eval_tap $? 479 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 480 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Sh69G5BV' \
    --userId 'hhXIVZkH' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserSubscription' test.out

#- 481 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IA6mgiIO' \
    --userId 'cTZR7mAs' \
    > test.out 2>&1
eval_tap $? 481 'PublicChangeSubscriptionBillingAccount' test.out

#- 482 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HVSs9QAm' \
    --userId 'kjnKc4BG' \
    --body '{"immediate": true, "reason": "WC8dEL3X"}' \
    > test.out 2>&1
eval_tap $? 482 'PublicCancelSubscription' test.out

#- 483 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dm46uVVM' \
    --userId 'x2m0m5Wn' \
    --excludeFree  \
    --limit '32' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetUserSubscriptionBillingHistories' test.out

#- 484 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '8asWTzHo' \
    --language 'Lq4V58jP' \
    --storeId '1aWi2oJe' \
    > test.out 2>&1
eval_tap $? 484 'PublicListViews' test.out

#- 485 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'PB8f7otP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHACEUf6' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetWallet' test.out

#- 486 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ZWEth26R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vglgr0Cq' \
    --limit '71' \
    --offset '81' \
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
    --endTime 'MbQx88PK' \
    --limit '90' \
    --offset '82' \
    --startTime 'kDzFPjST' \
    --state 'REVOKE_FAILED' \
    --transactionId 'pjn81are' \
    --userId 'SYOwHdz5' \
    > test.out 2>&1
eval_tap $? 488 'QueryFulfillments' test.out

#- 489 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'NYd5F8aN' \
    --baseAppId 'VN7QDXQs' \
    --categoryPath '2sakHVjK' \
    --features 's0rxg9c1' \
    --includeSubCategoryItem  \
    --itemName '98Ekrj7i' \
    --itemStatus 'ACTIVE' \
    --itemType 'APP,INGAMEITEM,BUNDLE' \
    --limit '71' \
    --offset '62' \
    --region 'FXNtFsPp' \
    --sectionExclusive  \
    --sortBy 'name:desc,updatedAt:desc,createdAt:asc' \
    --storeId 'ZnQcfS0w' \
    --tags 'mHnoLnpm' \
    --targetNamespace 'Byl4XxE4' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 489 'QueryItemsV2' test.out

#- 490 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '2I7Xrd1G' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 490 'ImportStore1' test.out

#- 491 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cFc5jL6E' \
    --body '{"itemIds": ["TydKlwuj", "u3S6Nc4b", "OP2AX3vE"]}' \
    > test.out 2>&1
eval_tap $? 491 'ExportStore1' test.out

#- 492 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6TSl41Wg' \
    --body '{"entitlementCollectionId": "S6YOxvK5", "entitlementOrigin": "Xbox", "metadata": {"kdsRyS9E": {}, "aEj53kND": {}, "1fwJPzd8": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "1YSNffhf", "namespace": "iXl8y4YK"}, "item": {"itemId": "tectDlHF", "itemName": "UZRur4H9", "itemSku": "PXZAe5bK", "itemType": "Eg461FO8"}, "quantity": 52, "type": "ITEM"}, {"currency": {"currencyCode": "jza50dpj", "namespace": "iviZit41"}, "item": {"itemId": "pcIY39rE", "itemName": "dQPPMT8Q", "itemSku": "WRQpnl8t", "itemType": "66bultwc"}, "quantity": 11, "type": "CURRENCY"}, {"currency": {"currencyCode": "WG3Yybxp", "namespace": "THdbHeAR"}, "item": {"itemId": "eI5WX7zu", "itemName": "OmTK1gmr", "itemSku": "hLHrkUNv", "itemType": "XAZaM5Xq"}, "quantity": 65, "type": "CURRENCY"}], "source": "REWARD", "transactionId": "fLmPcU7n"}' \
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
    --userId 'ICkcSbeZ' \
    --body '{"transactionId": "Nxz1xQGZ"}' \
    > test.out 2>&1
eval_tap $? 496 'V2PublicFulfillAppleIAPItem' test.out

#- 497 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'EwGktbGg' \
    --userId 'ghSWfU7s' \
    --body '{"items": [{"duration": 85, "endDate": "1996-04-14T00:00:00Z", "entitlementCollectionId": "gehde5Rb", "entitlementOrigin": "IOS", "itemId": "1BIhC9VT", "itemSku": "z9COXuDN", "language": "qFlUgA0e", "metadata": {"foDWqFkP": {}, "YXqKCTBy": {}, "WfVeIx2T": {}}, "orderNo": "LSW4OEfe", "origin": "System", "quantity": 66, "region": "NETA5oJl", "source": "REWARD", "startDate": "1990-11-06T00:00:00Z", "storeId": "6sOuhjwD"}, {"duration": 81, "endDate": "1978-06-27T00:00:00Z", "entitlementCollectionId": "zuNoBCq4", "entitlementOrigin": "Nintendo", "itemId": "Uw2LJp7g", "itemSku": "rWlPE0tY", "language": "Ji7htpmd", "metadata": {"C3BcYA0Z": {}, "ir4BnNYj": {}, "LjRy5wR7": {}}, "orderNo": "pUafdPCb", "origin": "Other", "quantity": 25, "region": "cqBUCG7x", "source": "ACHIEVEMENT", "startDate": "1977-12-06T00:00:00Z", "storeId": "4RmuGlJm"}, {"duration": 51, "endDate": "1992-07-03T00:00:00Z", "entitlementCollectionId": "O5h2jwot", "entitlementOrigin": "GooglePlay", "itemId": "EG7D9Zqp", "itemSku": "elsF78il", "language": "VgrIXndJ", "metadata": {"CO3Arenr": {}, "l6xgvA3d": {}, "MzHhgvps": {}}, "orderNo": "MGuJBIAW", "origin": "Steam", "quantity": 14, "region": "VWca9XF2", "source": "DLC", "startDate": "1984-06-25T00:00:00Z", "storeId": "PL4k8Ctw"}]}' \
    > test.out 2>&1
eval_tap $? 497 'FulfillItemsV3' test.out

#- 498 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'soRdM1W5' \
    --userId 'NtGmmlr2' \
    > test.out 2>&1
eval_tap $? 498 'RetryFulfillItemsV3' test.out

#- 499 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'rsgSuvBr' \
    --userId 'JeFN867Q' \
    > test.out 2>&1
eval_tap $? 499 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
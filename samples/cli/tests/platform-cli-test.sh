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
echo "1..478"

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
    --id 'il3bU3uK' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'YjO9VQpi' \
    --body '{"grantDays": "nXA3nBhs"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '6ngWe2yO' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '5O0ndKiP' \
    --body '{"grantDays": "UP9lTRsP"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "ujsoyLnP", "dryRun": true, "fulfillmentUrl": "r0dAgOAy", "itemType": "EXTENSION", "purchaseConditionUrl": "cXGYtfvU"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'ovOLcADq' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'vcojv1m3' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'DPCnRpTm' \
    --body '{"clazz": "ezP2TRNt", "dryRun": false, "fulfillmentUrl": "WPOT7566", "purchaseConditionUrl": "hmVnDMlN"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'LspYlb3Q' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --name 'G4z7eDrr' \
    --offset '93' \
    --tag '6DlH9aHu' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Qn95FoRK", "discountConfig": {"categories": [{"categoryPath": "5KApNWoq", "includeSubCategories": false}, {"categoryPath": "mrL4YQMj", "includeSubCategories": true}, {"categoryPath": "6XQHkYld", "includeSubCategories": false}], "currencyCode": "e2XtwYB9", "currencyNamespace": "SWSPsGeu", "discountAmount": 54, "discountPercentage": 6, "discountType": "AMOUNT", "items": [{"itemId": "3a2MYWDc", "itemName": "tyXuSoED"}, {"itemId": "OFbAXymF", "itemName": "41bz33uE"}, {"itemId": "kUhvr7K2", "itemName": "HvsdYTpy"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 76, "itemId": "aD0lB9mn", "itemName": "Fmu5xfOL", "quantity": 59}, {"extraSubscriptionDays": 69, "itemId": "poCW6w6n", "itemName": "Xy774Riv", "quantity": 69}, {"extraSubscriptionDays": 79, "itemId": "jcLq4b5s", "itemName": "dIohSd15", "quantity": 97}], "maxRedeemCountPerCampaignPerUser": 88, "maxRedeemCountPerCode": 67, "maxRedeemCountPerCodePerUser": 51, "maxSaleCount": 50, "name": "s7jOe9vh", "redeemEnd": "1986-05-28T00:00:00Z", "redeemStart": "1990-02-09T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["h8HroJH0", "aYjIS8Ln", "7xsW8qcQ"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'yT2JZHkx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '1A9ftZJS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GmdcuZZI", "discountConfig": {"categories": [{"categoryPath": "AAZntLsn", "includeSubCategories": true}, {"categoryPath": "m2YW64TQ", "includeSubCategories": true}, {"categoryPath": "1kCWJvqV", "includeSubCategories": false}], "currencyCode": "SI0PJYGd", "currencyNamespace": "fcZ2PJrz", "discountAmount": 57, "discountPercentage": 41, "discountType": "AMOUNT", "items": [{"itemId": "XS0kuH9u", "itemName": "gjtbZ2gx"}, {"itemId": "PLt3ZVSy", "itemName": "FFMPyzj9"}, {"itemId": "XIU1ENQb", "itemName": "gUnGgaZq"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 26, "itemId": "1WOxEREY", "itemName": "UXbFHu9V", "quantity": 15}, {"extraSubscriptionDays": 100, "itemId": "o5RfQwAg", "itemName": "THK8jDLr", "quantity": 5}, {"extraSubscriptionDays": 6, "itemId": "IMiDLNOm", "itemName": "h9QA6BfT", "quantity": 26}], "maxRedeemCountPerCampaignPerUser": 1, "maxRedeemCountPerCode": 72, "maxRedeemCountPerCodePerUser": 63, "maxSaleCount": 4, "name": "7I5EOIl2", "redeemEnd": "1977-12-27T00:00:00Z", "redeemStart": "1983-12-15T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["6y1GHfT9", "yTQP9FyA", "N4szKe7c"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'vGu5dPm4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "2gQ3mSa6", "oldName": "TRmGCA59"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'qJC0ibUr' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'cysFplmg' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '3iLTTXqW' \
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
    --body '{"enableInventoryCheck": false}' \
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
    --body '{"appConfig": {"appName": "bwQjcw1w"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "f2cRm5D7"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "opRY7yjz"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "g567gf16"}, "extendType": "APP"}' \
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
    --storeId 'iPxUyc3Z' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BCfwbXLo' \
    --body '{"categoryPath": "33Xes82f", "localizationDisplayNames": {"qEZEcswO": "MyqRtzfP", "C0smfKq8": "s0QR8Yfs", "Qh5Ybpg4": "Rl2kPmbH"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f8UTGPmD' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'Mhji9Hit' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NkrZZ0Ua' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'iBhQWYmD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jxrg4uoW' \
    --body '{"localizationDisplayNames": {"WRJZf4Ty": "grXes9jX", "IlIqgUmR": "aK5vlO8F", "mbiqaJy3": "MkeMvgDs"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '9YVp8HR0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C3O4YYaa' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'fBVPgsK8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g5n8TAuH' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'HHWtJL2C' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BphxObVj' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'G09ynPKA' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'rINcCqtN' \
    --batchNo '19,40,15' \
    --code 'TiF8BH6L' \
    --limit '71' \
    --offset '15' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'l2cPqcvP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "pCN1dLJT", "codeValue": "XiXIXUvJ", "quantity": 64}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'rcqZk0Yb' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'hct2mEGf' \
    --batchNo '43,19,88' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'JxGUudZ6' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'M6Kyu1Gb' \
    --batchNo '20,33,3' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'sUjZxg41' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'VPYmMaRQ' \
    --batchNo '17,47,84' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'ZQJQucM5' \
    --namespace "$AB_NAMESPACE" \
    --code 'qLOVKc0m' \
    --limit '83' \
    --offset '79' \
    --userId 'c3e1k7Hj' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'hCYsMvrZ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'lOQQzAfY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'TxK8jkD9' \
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
    --body '{"currencyCode": "PZAReDtu", "currencySymbol": "gTYvuu2V", "currencyType": "REAL", "decimals": 50, "localizationDescriptions": {"kFGFPKqm": "jHGuAnaw", "dNAFFDi0": "zvGgH175", "MbnMosdg": "GWTMylrO"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'Q4Qm8IvV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"9yVYvQ51": "qx5tDtJB", "ZZebHxjn": "85lTAC2o", "X1iTODml": "rwIPdGng"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'YooXhCML' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '6TyZkZkE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'USmcEC5v' \
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
    --body '{"data": [{"id": "nwq9vbfZ", "rewards": [{"currency": {"currencyCode": "Km38B7A9", "namespace": "zKBVZgNc"}, "item": {"itemId": "3GF5Bkej", "itemName": "RFL9bzLB", "itemSku": "FSxPHh3N", "itemType": "AJauT1M8"}, "quantity": 10, "type": "CURRENCY"}, {"currency": {"currencyCode": "2kXvkIlW", "namespace": "HJUx7Lrg"}, "item": {"itemId": "RbLcSXiS", "itemName": "wUlys3mC", "itemSku": "9iGQCogs", "itemType": "Z5e7ZrtF"}, "quantity": 43, "type": "ITEM"}, {"currency": {"currencyCode": "VvCDPfaR", "namespace": "bqJkAmnw"}, "item": {"itemId": "lsVaoomZ", "itemName": "KOIQLkGy", "itemSku": "3d7YgJA7", "itemType": "aJUGXn9T"}, "quantity": 48, "type": "ITEM"}]}, {"id": "j3u1LFou", "rewards": [{"currency": {"currencyCode": "34JOqKjM", "namespace": "yV7tbaK5"}, "item": {"itemId": "GphpOdEW", "itemName": "6M78eL6q", "itemSku": "CN13qexU", "itemType": "rtTtsf26"}, "quantity": 17, "type": "CURRENCY"}, {"currency": {"currencyCode": "uroy1F28", "namespace": "B0UhfwLn"}, "item": {"itemId": "0w7bDeV8", "itemName": "UJKMEMtP", "itemSku": "xSLZc6P9", "itemType": "UXP6TTOH"}, "quantity": 11, "type": "CURRENCY"}, {"currency": {"currencyCode": "mJGfdy4f", "namespace": "O9cnVcbR"}, "item": {"itemId": "HWrNbXyv", "itemName": "KYF4AUs3", "itemSku": "WzLumibD", "itemType": "ZPWy4vi8"}, "quantity": 11, "type": "ITEM"}]}, {"id": "lg4hNUO9", "rewards": [{"currency": {"currencyCode": "HPhEfCkR", "namespace": "FdsajNeK"}, "item": {"itemId": "bvabbnH2", "itemName": "kzJMepIU", "itemSku": "vwO4XdD6", "itemType": "NLD2jPhe"}, "quantity": 9, "type": "ITEM"}, {"currency": {"currencyCode": "0HHrq5WO", "namespace": "TcaVY3wc"}, "item": {"itemId": "hplqbZ8u", "itemName": "qpCeFdw5", "itemSku": "aZNmXY4K", "itemType": "1zcsHfkj"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "Hzd6p2HS", "namespace": "E1hTLSPW"}, "item": {"itemId": "GUBGWAc7", "itemName": "BQ0HIVTl", "itemSku": "jTOBXex8", "itemType": "w97vL1Rr"}, "quantity": 49, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"JIkhplxU": "fimXVR4q", "2S5Zwkib": "VlJSF8eF", "qdQFWxQZ": "zBvsBQQt"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"X40VEMw5": "8idIPns2", "kDvShOOb": "zLhWChDt", "E6EaQwSt": "uwAfND1x"}}, {"platform": "XBOX", "platformDlcIdMap": {"Iw4pVsQ0": "1Xg5HyX3", "J0afXvrO": "b9uErrxW", "ei8KN8zR": "em7Grpnl"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'Mi25hWDQ' \
    --itemId 'zQv6zVVB,00xc4qTs,HFypiGLL' \
    --limit '47' \
    --offset '54' \
    --origin 'Epic' \
    --userId '7m4ESbIr' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'UEsmL7ln,M2YUGsNf,SCZe6yA6' \
    --limit '68' \
    --offset '86' \
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
    --body '{"entitlementGrantList": [{"collectionId": "IuIxgAOW", "endDate": "1984-08-05T00:00:00Z", "grantedCode": "0rRWDwC0", "itemId": "Dbn1ddcX", "itemNamespace": "57V5CUes", "language": "zAeC_suXi", "metadata": {"SCObHwqU": {}, "Ia9GyuqN": {}, "gCOt2pYs": {}}, "origin": "Playstation", "quantity": 47, "region": "UQp7hsWP", "source": "PURCHASE", "startDate": "1986-06-06T00:00:00Z", "storeId": "7DghqwsX"}, {"collectionId": "qbrGVnVD", "endDate": "1997-05-09T00:00:00Z", "grantedCode": "kbwxgqj9", "itemId": "AdBW4jY5", "itemNamespace": "zU5RS4SG", "language": "vD-WayJ", "metadata": {"uHfollbm": {}, "jxSylPfQ": {}, "677Iga7I": {}}, "origin": "Other", "quantity": 66, "region": "ChHdkp88", "source": "REWARD", "startDate": "1983-08-29T00:00:00Z", "storeId": "5GXmaPCv"}, {"collectionId": "4OP8A9xr", "endDate": "1976-03-25T00:00:00Z", "grantedCode": "qwS3kXdq", "itemId": "dFC2CHTi", "itemNamespace": "94FMzLqg", "language": "Fjm-013", "metadata": {"ZMhHIgj3": {}, "yQnMcRa1": {}, "DsxLMV7w": {}}, "origin": "Twitch", "quantity": 86, "region": "ukmBsO4m", "source": "OTHER", "startDate": "1987-10-09T00:00:00Z", "storeId": "yzUL7Z46"}], "userIds": ["zxgaR009", "7tlasOub", "Xclv1pAd"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["4v0iqqaX", "XmG82iy8", "MWpkBpIK"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'JUEmHjbV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '67' \
    --status 'FAIL' \
    --userId 'dMQcCnV5' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'PPtZztX6' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'Hqyp90Z8' \
    --limit '22' \
    --offset '79' \
    --startTime '1Q8FGFt6' \
    --status 'INIT' \
    --userId 'cnxMUKQb' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "HaDPOARm", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 77, "clientTransactionId": "XuEazbGp"}, {"amountConsumed": 100, "clientTransactionId": "HHbhwVxI"}, {"amountConsumed": 32, "clientTransactionId": "lx18cSOp"}], "entitlementId": "mGkXeVEp", "usageCount": 32}, {"clientTransaction": [{"amountConsumed": 0, "clientTransactionId": "HRiptzG7"}, {"amountConsumed": 72, "clientTransactionId": "2Awhf70r"}, {"amountConsumed": 89, "clientTransactionId": "KDv6J0q2"}], "entitlementId": "UykXje0Q", "usageCount": 94}, {"clientTransaction": [{"amountConsumed": 10, "clientTransactionId": "ltvxML6A"}, {"amountConsumed": 65, "clientTransactionId": "jddd4OHR"}, {"amountConsumed": 80, "clientTransactionId": "x5BuKXT2"}], "entitlementId": "m3jjA12Y", "usageCount": 25}], "purpose": "G975OcEN"}, "originalTitleName": "cIztvaNC", "paymentProductSKU": "KWR2YGJl", "purchaseDate": "GWKM2flO", "sourceOrderItemId": "QpuwGogY", "titleName": "HAkMNfNW"}, "eventDomain": "TOJM7Mfc", "eventSource": "8j7CEDw6", "eventType": "3Qz8rfUh", "eventVersion": 65, "id": "1GDF6U8Q", "timestamp": "2OXhkLha"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetAppleIAPConfig' test.out

#- 74 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 54, "bundleId": "Mw2JpVh6", "issuerId": "vCQRWeKt", "keyId": "gLv0OP7S", "password": "GcBx4dtN", "version": "V2"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateAppleIAPConfig' test.out

#- 75 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteAppleIAPConfig' test.out

#- 76 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 76 'UpdateAppleP8File' test.out

#- 77 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetEpicGamesIAPConfig' test.out

#- 78 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "nEJ7nob9"}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateEpicGamesIAPConfig' test.out

#- 79 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteEpicGamesIAPConfig' test.out

#- 80 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetGoogleIAPConfig' test.out

#- 81 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "SYjeLfoO", "notificationTokenAudience": "OnZYj56T", "notificationTokenEmail": "Od2E1q2h", "packageName": "AvmKqqvQ", "serviceAccountId": "OBqtRPqU"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateGoogleIAPConfig' test.out

#- 82 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteGoogleIAPConfig' test.out

#- 83 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 83 'UpdateGoogleP12File' test.out

#- 84 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetIAPItemConfig' test.out

#- 85 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "bwVJjUHK", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"pOPB8Gn7": "k45lDXre", "IOYuTCEL": "hGZYw15l", "abyEY6Tq": "ntOdc87o"}}, {"itemIdentity": "FM9GI1BA", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"vSQGfFmm": "ZlHrcevs", "Yo5lbZUl": "S7EE6TiK", "1dbwdzCe": "h5oM8FRM"}}, {"itemIdentity": "00SujiWh", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"PbxMdv3t": "LtZNSk7A", "0VBjX7LA": "kSL07bC5", "NjXc8HjH": "recV20Wq"}}]}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateIAPItemConfig' test.out

#- 86 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeleteIAPItemConfig' test.out

#- 87 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetOculusIAPConfig' test.out

#- 88 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "XKF8TM6q", "appSecret": "Zhzaec7Z"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateOculusIAPConfig' test.out

#- 89 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeleteOculusIAPConfig' test.out

#- 90 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetPlayStationIAPConfig' test.out

#- 91 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "C5nlQUyN", "backOfficeServerClientSecret": "YZ5vlwFL", "enableStreamJob": false, "environment": "AKGWt6Sk", "streamName": "4EG3SuYE", "streamPartnerName": "STrDugoV"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdatePlaystationIAPConfig' test.out

#- 92 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeletePlaystationIAPConfig' test.out

#- 93 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'ValidateExistedPlaystationIAPConfig' test.out

#- 94 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "G840qLqz", "backOfficeServerClientSecret": "3hQ3susE", "enableStreamJob": true, "environment": "IoYcMZLL", "streamName": "BhvXj63N", "streamPartnerName": "yyf70fM9"}' \
    > test.out 2>&1
eval_tap $? 94 'ValidatePlaystationIAPConfig' test.out

#- 95 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetSteamIAPConfig' test.out

#- 96 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "C9vfVDcV", "publisherAuthenticationKey": "z2DcqPqG"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSteamIAPConfig' test.out

#- 97 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteSteamIAPConfig' test.out

#- 98 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetTwitchIAPConfig' test.out

#- 99 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "6lt1Ynh4", "clientSecret": "wHNRLxUf", "organizationId": "TeNZaBke"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateTwitchIAPConfig' test.out

#- 100 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteTwitchIAPConfig' test.out

#- 101 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetXblIAPConfig' test.out

#- 102 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "kAQF59dm"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateXblIAPConfig' test.out

#- 103 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'DeleteXblAPConfig' test.out

#- 104 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'u3Z5gGWc' \
    > test.out 2>&1
eval_tap $? 104 'UpdateXblBPCertFile' test.out

#- 105 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '3NxNCRQq' \
    --externalId 'GUo0QfgB' \
    --limit '56' \
    --offset '61' \
    --source 'OCULUS' \
    --startDate 'LwPbClt2' \
    --status 'WARN' \
    --type '1GCRqDop' \
    > test.out 2>&1
eval_tap $? 105 'QueryThirdPartyNotifications' test.out

#- 106 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'WvHlMOVZ' \
    --limit '8' \
    --offset '22' \
    --platform 'OCULUS' \
    --productId 'Hun71sZJ' \
    --userId '8AB3pPgz' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartySubscription' test.out

#- 107 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ImHJhXjS' \
    --feature 'QvHrbg31' \
    --itemId '5bOH2dMf' \
    --itemType 'MEDIA' \
    --startTime 'VumjDSZz' \
    > test.out 2>&1
eval_tap $? 107 'DownloadInvoiceDetails' test.out

#- 108 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'LIxw3I5b' \
    --feature 'BIVgPUdL' \
    --itemId 'B4gk2GAj' \
    --itemType 'LOOTBOX' \
    --startTime 'iTcyKT9f' \
    > test.out 2>&1
eval_tap $? 108 'GenerateInvoiceSummary' test.out

#- 109 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qk28Gdck' \
    --body '{"categoryPath": "DkVumTIE", "targetItemId": "hXBr4KWn", "targetNamespace": "Dky9mx7J"}' \
    > test.out 2>&1
eval_tap $? 109 'SyncInGameItem' test.out

#- 110 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L4mKvpdv' \
    --body '{"appId": "qBuNDzd5", "appType": "SOFTWARE", "baseAppId": "wbSbWAr6", "boothName": "R3KTY4AS", "categoryPath": "lV2pDSiI", "clazz": "4Vix6ARw", "displayOrder": 23, "entitlementType": "DURABLE", "ext": {"4076xf9Q": {}, "TpLXe0g6": {}, "mTd8iSO1": {}}, "features": ["5md0Ybzi", "m3Aar8dj", "LAofA5LO"], "flexible": false, "images": [{"as": "X9zqMhHO", "caption": "JlysrhcD", "height": 52, "imageUrl": "jfhMiFKM", "smallImageUrl": "gL3cm7IM", "width": 88}, {"as": "kt22ORpr", "caption": "HRF2iAXu", "height": 62, "imageUrl": "35Vk3z7S", "smallImageUrl": "2rqVmO0c", "width": 90}, {"as": "LkST2s2V", "caption": "U5EUkKA3", "height": 33, "imageUrl": "u59WgDid", "smallImageUrl": "4m8UfiTO", "width": 82}], "inventoryConfig": {"customAttributes": {"UdKnKHkA": {}, "JUP9lE5e": {}, "83gU5zsQ": {}}, "serverCustomAttributes": {"nzU7FcKd": {}, "c17NSQa7": {}, "BW2RYD6N": {}}, "slotUsed": 31}, "itemIds": ["hGcny9XU", "ZYjI50yC", "meZxiZZE"], "itemQty": {"AWcrUIGS": 10, "hzwQioIq": 49, "ca7SCv5X": 7}, "itemType": "CODE", "listable": true, "localizations": {"CzfWPH03": {"description": "w20jAk8t", "localExt": {"3XnGy0vm": {}, "X7rJOhfC": {}, "ABbcETul": {}}, "longDescription": "dE9zZeqI", "title": "2qxXoswt"}, "yIaJ4ApS": {"description": "9tYkA2kO", "localExt": {"Wde7PRlJ": {}, "2rrvwYBX": {}, "0wx1k91V": {}}, "longDescription": "ysUs5SLX", "title": "E4WQ17dr"}, "2swTk62W": {"description": "s8v6liep", "localExt": {"Vx0BtQzq": {}, "UhdavjAq": {}, "Ko2FWKbb": {}}, "longDescription": "mgAjGQPu", "title": "vwqx9aXw"}}, "lootBoxConfig": {"rewardCount": 50, "rewards": [{"lootBoxItems": [{"count": 11, "duration": 26, "endDate": "1983-01-23T00:00:00Z", "itemId": "5LtUO27x", "itemSku": "JGPdH4lO", "itemType": "OboPnttm"}, {"count": 24, "duration": 96, "endDate": "1999-09-25T00:00:00Z", "itemId": "Zey1vPTi", "itemSku": "qAkLWwV7", "itemType": "4s3yI64J"}, {"count": 17, "duration": 37, "endDate": "1986-03-12T00:00:00Z", "itemId": "kF8LgDVT", "itemSku": "QMqQCogE", "itemType": "HHFlGUZc"}], "name": "Mr4jSH6t", "odds": 0.7303392612119008, "type": "REWARD", "weight": 42}, {"lootBoxItems": [{"count": 17, "duration": 69, "endDate": "1976-11-15T00:00:00Z", "itemId": "jAA3xySJ", "itemSku": "L8mjoDS1", "itemType": "LdfLEZ2K"}, {"count": 10, "duration": 33, "endDate": "1988-08-03T00:00:00Z", "itemId": "VWHi9v9r", "itemSku": "qTpLnOKY", "itemType": "iC6HhMp0"}, {"count": 61, "duration": 17, "endDate": "1982-06-05T00:00:00Z", "itemId": "LvvVMh8d", "itemSku": "yTeyaC1Z", "itemType": "6g9BpZvs"}], "name": "E77Wt2fn", "odds": 0.9861828843646187, "type": "PROBABILITY_GROUP", "weight": 34}, {"lootBoxItems": [{"count": 26, "duration": 85, "endDate": "1991-03-16T00:00:00Z", "itemId": "3hkiXllY", "itemSku": "jwoGzLCg", "itemType": "MuU4WKZy"}, {"count": 8, "duration": 68, "endDate": "1999-06-01T00:00:00Z", "itemId": "3t3lDwso", "itemSku": "GzFeN5Xd", "itemType": "Mv4Lz7BU"}, {"count": 12, "duration": 55, "endDate": "1980-08-31T00:00:00Z", "itemId": "01whg3d5", "itemSku": "5riJ6sjD", "itemType": "pLO5WmJZ"}], "name": "UxBfhlHu", "odds": 0.7510994623666388, "type": "REWARD", "weight": 58}], "rollFunction": "DEFAULT"}, "maxCount": 47, "maxCountPerUser": 7, "name": "luq1qaBF", "optionBoxConfig": {"boxItems": [{"count": 44, "duration": 2, "endDate": "1996-10-23T00:00:00Z", "itemId": "Dfm8tvW9", "itemSku": "GjtKwM8x", "itemType": "B1me9PXE"}, {"count": 35, "duration": 30, "endDate": "1999-07-01T00:00:00Z", "itemId": "rwziErI9", "itemSku": "zICpgsmW", "itemType": "CfUEDo6W"}, {"count": 75, "duration": 16, "endDate": "1980-12-24T00:00:00Z", "itemId": "Gd9ZBhru", "itemSku": "EeF7DcG5", "itemType": "OClAGQtM"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 77, "fixedTrialCycles": 38, "graceDays": 25}, "regionData": {"9ysg1g3L": [{"currencyCode": "JU1gD0or", "currencyNamespace": "J4Y8MbFm", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1986-01-13T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1971-04-11T00:00:00Z", "expireAt": "1998-05-21T00:00:00Z", "price": 39, "purchaseAt": "1989-11-12T00:00:00Z", "trialPrice": 87}, {"currencyCode": "q19GR1Hj", "currencyNamespace": "INe7vfcB", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1983-11-03T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1980-12-17T00:00:00Z", "expireAt": "1986-07-09T00:00:00Z", "price": 8, "purchaseAt": "1971-01-09T00:00:00Z", "trialPrice": 54}, {"currencyCode": "7gaFjhQm", "currencyNamespace": "NQHOgFwf", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1973-09-06T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1983-09-10T00:00:00Z", "expireAt": "1994-05-03T00:00:00Z", "price": 54, "purchaseAt": "1988-02-08T00:00:00Z", "trialPrice": 52}], "Gm5QUmFX": [{"currencyCode": "HAFXwb79", "currencyNamespace": "BnziAkKP", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1977-03-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1988-01-30T00:00:00Z", "expireAt": "1987-01-16T00:00:00Z", "price": 55, "purchaseAt": "1974-11-09T00:00:00Z", "trialPrice": 30}, {"currencyCode": "Ky4MbyI3", "currencyNamespace": "mWwdaquV", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1986-06-22T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1995-07-10T00:00:00Z", "expireAt": "1973-08-30T00:00:00Z", "price": 22, "purchaseAt": "1979-11-07T00:00:00Z", "trialPrice": 44}, {"currencyCode": "551qasjT", "currencyNamespace": "osvRIXP7", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1975-09-05T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1991-01-08T00:00:00Z", "expireAt": "1993-02-06T00:00:00Z", "price": 67, "purchaseAt": "1994-08-22T00:00:00Z", "trialPrice": 22}], "PqMlti0V": [{"currencyCode": "ZIDCv27e", "currencyNamespace": "txyDUmwl", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1986-09-03T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1978-05-24T00:00:00Z", "expireAt": "1984-11-16T00:00:00Z", "price": 22, "purchaseAt": "1992-12-10T00:00:00Z", "trialPrice": 19}, {"currencyCode": "aVFPSgNf", "currencyNamespace": "TAQ1YuDl", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1994-07-14T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1996-10-10T00:00:00Z", "expireAt": "1971-05-05T00:00:00Z", "price": 64, "purchaseAt": "1972-11-11T00:00:00Z", "trialPrice": 75}, {"currencyCode": "QNKqyZUx", "currencyNamespace": "xUfRNjHd", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1986-05-31T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1973-10-16T00:00:00Z", "expireAt": "1993-09-05T00:00:00Z", "price": 33, "purchaseAt": "1999-11-26T00:00:00Z", "trialPrice": 64}]}, "saleConfig": {"currencyCode": "zfejuO72", "price": 79}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "DlIpiRqv", "stackable": false, "status": "INACTIVE", "tags": ["n4JUBAoL", "yAG2BRtR", "vRCwDwb7"], "targetCurrencyCode": "mOWD3RWq", "targetNamespace": "LOWNKrnn", "thumbnailUrl": "nPQeUrw8", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 110 'CreateItem' test.out

#- 111 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7ER2JzUJ' \
    --appId 'CC9E0tOm' \
    > test.out 2>&1
eval_tap $? 111 'GetItemByAppId' test.out

#- 112 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'XJC7hqMP' \
    --baseAppId 'o81Wd3CI' \
    --categoryPath 'o8hPpkNe' \
    --features 'e6apqtfu' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --limit '67' \
    --offset '3' \
    --region 'Dhw8OIht' \
    --sortBy 'updatedAt:desc,displayOrder,createdAt:asc' \
    --storeId 'PyAOdNo3' \
    --tags 'hAVkRQyI' \
    --targetNamespace 'ENJYEiWd' \
    > test.out 2>&1
eval_tap $? 112 'QueryItems' test.out

#- 113 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'AfFIVszB,PMzLmUMl,CQQF8Khz' \
    > test.out 2>&1
eval_tap $? 113 'ListBasicItemsByFeatures' test.out

#- 114 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dFVxIMzf' \
    --itemIds '4YRzsKwx' \
    > test.out 2>&1
eval_tap $? 114 'GetItems' test.out

#- 115 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'R2VkB845' \
    --sku 'H9qlK49L' \
    > test.out 2>&1
eval_tap $? 115 'GetItemBySku' test.out

#- 116 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'bpY131dS' \
    --populateBundle  \
    --region 'uszLoCCI' \
    --storeId '5q0RjHgM' \
    --sku 'avEIee2P' \
    > test.out 2>&1
eval_tap $? 116 'GetLocaleItemBySku' test.out

#- 117 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '00SZ4l3b' \
    --region 'bDWppHRI' \
    --storeId '9x81QvHk' \
    --itemIds 'lW5KjBFN' \
    --userId 'ymlUDsCI' \
    > test.out 2>&1
eval_tap $? 117 'GetEstimatedPrice' test.out

#- 118 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'AvESmyLd' \
    --sku 'llLkozfS' \
    > test.out 2>&1
eval_tap $? 118 'GetItemIdBySku' test.out

#- 119 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '7FytciLx,q6f6BQeE,oXelFL4G' \
    --storeId 'BuxnC1Uu' \
    > test.out 2>&1
eval_tap $? 119 'GetBulkItemIdBySkus' test.out

#- 120 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'G8r3TIC2' \
    --region 'aHYcwVHA' \
    --storeId 'OFHxFM47' \
    --itemIds '3XinuLkD' \
    > test.out 2>&1
eval_tap $? 120 'BulkGetLocaleItems' test.out

#- 121 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetAvailablePredicateTypes' test.out

#- 122 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform '2no1tZsT' \
    --userId 'gz1EX53f' \
    --body '{"itemIds": ["k8EVLA8q", "9mhpVtra", "hAxnQhWa"]}' \
    > test.out 2>&1
eval_tap $? 122 'ValidateItemPurchaseCondition' test.out

#- 123 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DTtPesKy' \
    --body '{"changes": [{"itemIdentities": ["g24WZwss", "2lNA3DVI", "hWD3u40S"], "itemIdentityType": "ITEM_SKU", "regionData": {"Dr2NuG5Y": [{"currencyCode": "V4rg7vNH", "currencyNamespace": "K8wZajqV", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1974-10-19T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1997-08-05T00:00:00Z", "discountedPrice": 47, "expireAt": "1989-11-17T00:00:00Z", "price": 91, "purchaseAt": "1972-04-12T00:00:00Z", "trialPrice": 22}, {"currencyCode": "k1hOqdFz", "currencyNamespace": "dI4HRRqm", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1985-05-08T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1980-10-09T00:00:00Z", "discountedPrice": 55, "expireAt": "1971-03-13T00:00:00Z", "price": 93, "purchaseAt": "1992-06-18T00:00:00Z", "trialPrice": 75}, {"currencyCode": "Iy8QQIvm", "currencyNamespace": "IfLuGx0K", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1988-07-29T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1996-01-24T00:00:00Z", "discountedPrice": 18, "expireAt": "1976-05-31T00:00:00Z", "price": 100, "purchaseAt": "1977-01-14T00:00:00Z", "trialPrice": 59}], "rLkbbk5s": [{"currencyCode": "W3vSy1J5", "currencyNamespace": "EBLxgoFl", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1997-09-01T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1980-07-21T00:00:00Z", "discountedPrice": 91, "expireAt": "1989-11-30T00:00:00Z", "price": 82, "purchaseAt": "1985-08-11T00:00:00Z", "trialPrice": 44}, {"currencyCode": "RNJhNb0b", "currencyNamespace": "o0E5MUMz", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1986-08-01T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1971-07-07T00:00:00Z", "discountedPrice": 100, "expireAt": "1985-07-20T00:00:00Z", "price": 30, "purchaseAt": "1974-11-19T00:00:00Z", "trialPrice": 86}, {"currencyCode": "adI6LqRD", "currencyNamespace": "jVZVkALJ", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1999-06-28T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1994-07-10T00:00:00Z", "discountedPrice": 66, "expireAt": "1978-04-16T00:00:00Z", "price": 72, "purchaseAt": "1993-10-27T00:00:00Z", "trialPrice": 47}], "SRfbKegl": [{"currencyCode": "gwtmv6VN", "currencyNamespace": "HljEYRO1", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1994-08-19T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1988-02-28T00:00:00Z", "discountedPrice": 23, "expireAt": "1997-01-24T00:00:00Z", "price": 8, "purchaseAt": "1987-11-04T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Nz7qHHTA", "currencyNamespace": "hUpLa0Yy", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1986-07-09T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1986-08-09T00:00:00Z", "discountedPrice": 25, "expireAt": "1997-06-21T00:00:00Z", "price": 83, "purchaseAt": "1976-01-23T00:00:00Z", "trialPrice": 9}, {"currencyCode": "5z3lThnz", "currencyNamespace": "gQtwz6RR", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1988-08-27T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1993-07-21T00:00:00Z", "discountedPrice": 31, "expireAt": "1988-09-30T00:00:00Z", "price": 90, "purchaseAt": "1989-02-11T00:00:00Z", "trialPrice": 8}]}}, {"itemIdentities": ["25DNgeWp", "PHV1Fgbu", "JQrMFVUI"], "itemIdentityType": "ITEM_SKU", "regionData": {"WCX3yDBe": [{"currencyCode": "ESGEWjkL", "currencyNamespace": "DIeMdTMV", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1987-09-09T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1995-02-04T00:00:00Z", "discountedPrice": 12, "expireAt": "1989-05-15T00:00:00Z", "price": 74, "purchaseAt": "1973-04-14T00:00:00Z", "trialPrice": 69}, {"currencyCode": "NDUk7vYW", "currencyNamespace": "HhimT0Ru", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1992-09-08T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1996-10-23T00:00:00Z", "discountedPrice": 51, "expireAt": "1989-10-06T00:00:00Z", "price": 57, "purchaseAt": "1999-07-20T00:00:00Z", "trialPrice": 52}, {"currencyCode": "rqkeeDuz", "currencyNamespace": "44VTAMAZ", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1994-06-13T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1975-05-27T00:00:00Z", "discountedPrice": 77, "expireAt": "1976-11-03T00:00:00Z", "price": 2, "purchaseAt": "1977-11-21T00:00:00Z", "trialPrice": 67}], "liPT0ApJ": [{"currencyCode": "CDnCR9w0", "currencyNamespace": "UzngaeE9", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1999-12-15T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1995-02-20T00:00:00Z", "discountedPrice": 31, "expireAt": "1983-04-12T00:00:00Z", "price": 61, "purchaseAt": "1976-12-21T00:00:00Z", "trialPrice": 10}, {"currencyCode": "GMGTrfBQ", "currencyNamespace": "oYi3jbIu", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1971-08-10T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1986-08-05T00:00:00Z", "discountedPrice": 19, "expireAt": "1981-07-29T00:00:00Z", "price": 25, "purchaseAt": "1972-04-08T00:00:00Z", "trialPrice": 41}, {"currencyCode": "c6KQ2BNJ", "currencyNamespace": "xncW2PSW", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1989-08-04T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1998-07-27T00:00:00Z", "discountedPrice": 62, "expireAt": "1983-08-21T00:00:00Z", "price": 51, "purchaseAt": "1995-03-09T00:00:00Z", "trialPrice": 96}], "5AO9gqAm": [{"currencyCode": "XRsvy6kK", "currencyNamespace": "k7wbb0G1", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1986-05-26T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1997-02-22T00:00:00Z", "discountedPrice": 100, "expireAt": "1991-05-11T00:00:00Z", "price": 33, "purchaseAt": "1976-06-10T00:00:00Z", "trialPrice": 2}, {"currencyCode": "ntPELWON", "currencyNamespace": "d5vHQnxT", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1981-03-30T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1978-12-13T00:00:00Z", "discountedPrice": 34, "expireAt": "1973-11-13T00:00:00Z", "price": 47, "purchaseAt": "1978-04-09T00:00:00Z", "trialPrice": 40}, {"currencyCode": "QswtbsKS", "currencyNamespace": "ooUiEEAM", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1987-08-29T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1974-08-21T00:00:00Z", "discountedPrice": 6, "expireAt": "1997-06-09T00:00:00Z", "price": 65, "purchaseAt": "1981-03-24T00:00:00Z", "trialPrice": 53}]}}, {"itemIdentities": ["ZuoSkcjs", "XqD0n0Kb", "IfnX3cfy"], "itemIdentityType": "ITEM_ID", "regionData": {"7jRHouC2": [{"currencyCode": "6JZNVXgy", "currencyNamespace": "9SMah1Hs", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1990-12-25T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1982-01-03T00:00:00Z", "discountedPrice": 79, "expireAt": "1999-12-08T00:00:00Z", "price": 56, "purchaseAt": "1994-03-02T00:00:00Z", "trialPrice": 41}, {"currencyCode": "3cBstAEV", "currencyNamespace": "LDHSSfwJ", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1990-03-04T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1975-11-17T00:00:00Z", "discountedPrice": 35, "expireAt": "1972-09-26T00:00:00Z", "price": 18, "purchaseAt": "1995-12-08T00:00:00Z", "trialPrice": 3}, {"currencyCode": "XpCmuLdI", "currencyNamespace": "yytUKG3K", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1981-06-14T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1991-01-27T00:00:00Z", "discountedPrice": 91, "expireAt": "1972-06-16T00:00:00Z", "price": 52, "purchaseAt": "1988-04-01T00:00:00Z", "trialPrice": 42}], "ccjYrGQD": [{"currencyCode": "S9xv31CX", "currencyNamespace": "LHbaPbwn", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1992-10-06T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1973-11-25T00:00:00Z", "discountedPrice": 85, "expireAt": "1998-08-13T00:00:00Z", "price": 68, "purchaseAt": "1985-05-04T00:00:00Z", "trialPrice": 24}, {"currencyCode": "cUEwJdWU", "currencyNamespace": "74SBdFvd", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1982-11-21T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1999-04-11T00:00:00Z", "discountedPrice": 44, "expireAt": "1992-04-15T00:00:00Z", "price": 98, "purchaseAt": "1988-06-21T00:00:00Z", "trialPrice": 37}, {"currencyCode": "ZJkAdtzl", "currencyNamespace": "3fP9t0he", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1999-12-06T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1987-06-14T00:00:00Z", "discountedPrice": 83, "expireAt": "1998-05-05T00:00:00Z", "price": 78, "purchaseAt": "1999-11-28T00:00:00Z", "trialPrice": 50}], "i1tPVP61": [{"currencyCode": "SJsLaFMv", "currencyNamespace": "DZlZ2duq", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1977-09-13T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1978-09-17T00:00:00Z", "discountedPrice": 50, "expireAt": "1994-06-30T00:00:00Z", "price": 28, "purchaseAt": "1978-03-24T00:00:00Z", "trialPrice": 88}, {"currencyCode": "fDkio4x9", "currencyNamespace": "uHIxCOPh", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1982-11-21T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1982-06-04T00:00:00Z", "discountedPrice": 42, "expireAt": "1977-10-19T00:00:00Z", "price": 25, "purchaseAt": "1988-04-05T00:00:00Z", "trialPrice": 16}, {"currencyCode": "FNQhXdam", "currencyNamespace": "fr3VCTp5", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1974-02-11T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1990-05-09T00:00:00Z", "discountedPrice": 97, "expireAt": "1991-08-02T00:00:00Z", "price": 100, "purchaseAt": "1980-05-04T00:00:00Z", "trialPrice": 78}]}}]}' \
    > test.out 2>&1
eval_tap $? 123 'BulkUpdateRegionData' test.out

#- 124 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '35' \
    --offset '78' \
    --sortBy 'pR4yFdfG' \
    --storeId 'r2lUXC0L' \
    --keyword 'xFLpgaGA' \
    --language 'QaKhshnE' \
    > test.out 2>&1
eval_tap $? 124 'SearchItems' test.out

#- 125 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '32' \
    --offset '30' \
    --sortBy 'createdAt,name:asc,updatedAt:asc' \
    --storeId 'EnLbdtl5' \
    > test.out 2>&1
eval_tap $? 125 'QueryUncategorizedItems' test.out

#- 126 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'Z43bgsOv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'FJDlKTtA' \
    > test.out 2>&1
eval_tap $? 126 'GetItem' test.out

#- 127 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'iZxtnooc' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6Bk1D9Le' \
    --body '{"appId": "kwTLfyOk", "appType": "DLC", "baseAppId": "o4pjkuEn", "boothName": "Gmk2BKLa", "categoryPath": "Lw2h5sE4", "clazz": "qH9C36qg", "displayOrder": 19, "entitlementType": "CONSUMABLE", "ext": {"y9yoJNx9": {}, "PmBPhHFH": {}, "z6Gax3NJ": {}}, "features": ["cQwAxWmA", "iJTw26J4", "oyxCPUYe"], "flexible": true, "images": [{"as": "9rr4r8l1", "caption": "1JUKyNcw", "height": 37, "imageUrl": "8ZZgj5yu", "smallImageUrl": "oni0Yx3i", "width": 90}, {"as": "vTGxbiDd", "caption": "ZpEpNHvf", "height": 61, "imageUrl": "JQLc8Fw5", "smallImageUrl": "8uS7mJdJ", "width": 99}, {"as": "2yJ3MggX", "caption": "Rw3OJq4D", "height": 24, "imageUrl": "tWThGaj4", "smallImageUrl": "Uo1dASpM", "width": 49}], "inventoryConfig": {"customAttributes": {"iH7plpjG": {}, "xXTMrEf6": {}, "Pgt1ADzU": {}}, "serverCustomAttributes": {"TEij1arN": {}, "J6LDjF5S": {}, "Sv9GP2DP": {}}, "slotUsed": 19}, "itemIds": ["DANrIUoh", "xyW9eGDm", "ptvg9cUo"], "itemQty": {"8YReCZAe": 50, "EdkkHoWX": 82, "ypDobU9C": 18}, "itemType": "LOOTBOX", "listable": true, "localizations": {"2fo5LtaI": {"description": "cF9rMB55", "localExt": {"PSz9QnzW": {}, "G4bVlsDb": {}, "xFDPsxon": {}}, "longDescription": "0qpwaE76", "title": "gBHkezzJ"}, "JlYIQdiE": {"description": "fA53OzM4", "localExt": {"zGaaWOu8": {}, "14QCqLe5": {}, "Ha8qSWNb": {}}, "longDescription": "OPYcTOrU", "title": "rniAi2Zn"}, "NK9Rk8ES": {"description": "kp5s5GIJ", "localExt": {"sRAo298g": {}, "mDzGxebz": {}, "MGzILet0": {}}, "longDescription": "IwrQPL1Y", "title": "QysjuUjG"}}, "lootBoxConfig": {"rewardCount": 95, "rewards": [{"lootBoxItems": [{"count": 73, "duration": 2, "endDate": "1982-10-27T00:00:00Z", "itemId": "02prB2Aw", "itemSku": "wJU1TLLa", "itemType": "GptWjEbb"}, {"count": 22, "duration": 37, "endDate": "1994-03-28T00:00:00Z", "itemId": "4Wq868LS", "itemSku": "PazXyaih", "itemType": "OlK36cBQ"}, {"count": 33, "duration": 15, "endDate": "1980-07-23T00:00:00Z", "itemId": "TlCs9XfC", "itemSku": "sqi0GVXU", "itemType": "qhLqwWqu"}], "name": "yFN4RRWl", "odds": 0.9163389774480457, "type": "REWARD_GROUP", "weight": 90}, {"lootBoxItems": [{"count": 2, "duration": 28, "endDate": "1975-02-20T00:00:00Z", "itemId": "aolmxmd3", "itemSku": "yvc3mEuS", "itemType": "lJIiUPiD"}, {"count": 66, "duration": 58, "endDate": "1977-12-09T00:00:00Z", "itemId": "Zo6B359D", "itemSku": "pkb37UUc", "itemType": "rEqI4AiR"}, {"count": 1, "duration": 74, "endDate": "1978-01-13T00:00:00Z", "itemId": "SsqAQbqJ", "itemSku": "lnOyyjqM", "itemType": "U1FjmR1A"}], "name": "wvtMuE0J", "odds": 0.45415252125437766, "type": "REWARD_GROUP", "weight": 37}, {"lootBoxItems": [{"count": 85, "duration": 65, "endDate": "1982-12-07T00:00:00Z", "itemId": "IREn8dSr", "itemSku": "CLY3eXHx", "itemType": "3juhqmW5"}, {"count": 16, "duration": 35, "endDate": "1989-10-30T00:00:00Z", "itemId": "TEvLGowC", "itemSku": "Ox2TVJS5", "itemType": "0kfkwnJO"}, {"count": 13, "duration": 12, "endDate": "1981-06-30T00:00:00Z", "itemId": "cRVx50tf", "itemSku": "K2bHWk6p", "itemType": "om6xyUyh"}], "name": "fBUdrNBw", "odds": 0.18490280559466143, "type": "PROBABILITY_GROUP", "weight": 16}], "rollFunction": "CUSTOM"}, "maxCount": 96, "maxCountPerUser": 41, "name": "Gk9Fy5qh", "optionBoxConfig": {"boxItems": [{"count": 49, "duration": 23, "endDate": "1971-02-15T00:00:00Z", "itemId": "Q91kJeCo", "itemSku": "Qe7NIxNn", "itemType": "MlkYd4Xg"}, {"count": 36, "duration": 8, "endDate": "1972-03-14T00:00:00Z", "itemId": "7emIcrr1", "itemSku": "2OsIPlu8", "itemType": "XjcCd106"}, {"count": 41, "duration": 58, "endDate": "1984-06-12T00:00:00Z", "itemId": "qbWnPYon", "itemSku": "zEESrQnc", "itemType": "0lxE9SL2"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 100, "fixedTrialCycles": 58, "graceDays": 11}, "regionData": {"S3I6MhNx": [{"currencyCode": "FRY0NnM9", "currencyNamespace": "HfT8pjKm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1997-08-03T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1983-10-13T00:00:00Z", "expireAt": "1996-07-28T00:00:00Z", "price": 43, "purchaseAt": "1972-05-03T00:00:00Z", "trialPrice": 61}, {"currencyCode": "DuUBChJZ", "currencyNamespace": "6iNQ3Ad0", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1994-08-11T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1977-11-08T00:00:00Z", "expireAt": "1988-05-06T00:00:00Z", "price": 37, "purchaseAt": "1994-06-03T00:00:00Z", "trialPrice": 57}, {"currencyCode": "vc0lgy9e", "currencyNamespace": "6cvHBIMe", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1981-01-01T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1985-03-28T00:00:00Z", "expireAt": "1981-11-15T00:00:00Z", "price": 64, "purchaseAt": "1983-11-30T00:00:00Z", "trialPrice": 11}], "5htZ1Rm8": [{"currencyCode": "8137BtdM", "currencyNamespace": "QBNzrKlg", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1996-07-29T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1985-08-17T00:00:00Z", "expireAt": "1974-04-19T00:00:00Z", "price": 47, "purchaseAt": "1981-03-26T00:00:00Z", "trialPrice": 28}, {"currencyCode": "rcFUsx8W", "currencyNamespace": "PROq3Rx9", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1972-05-31T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1997-07-09T00:00:00Z", "expireAt": "1975-09-04T00:00:00Z", "price": 77, "purchaseAt": "1983-11-15T00:00:00Z", "trialPrice": 38}, {"currencyCode": "w9oAAFND", "currencyNamespace": "Waohte1x", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1987-04-12T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-03-01T00:00:00Z", "expireAt": "1985-03-06T00:00:00Z", "price": 21, "purchaseAt": "1977-01-04T00:00:00Z", "trialPrice": 97}], "SHunlV9g": [{"currencyCode": "1CqZMNmq", "currencyNamespace": "PN1mqi2A", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1983-02-24T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1975-03-05T00:00:00Z", "expireAt": "1997-08-09T00:00:00Z", "price": 89, "purchaseAt": "1971-05-27T00:00:00Z", "trialPrice": 44}, {"currencyCode": "grwegQOX", "currencyNamespace": "7AmwD4qx", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1999-03-31T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1971-04-16T00:00:00Z", "expireAt": "1990-04-09T00:00:00Z", "price": 84, "purchaseAt": "1975-03-01T00:00:00Z", "trialPrice": 56}, {"currencyCode": "SVHNQzzk", "currencyNamespace": "GJ2V6mXZ", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1986-08-14T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1974-12-20T00:00:00Z", "expireAt": "1977-05-12T00:00:00Z", "price": 21, "purchaseAt": "1972-01-28T00:00:00Z", "trialPrice": 7}]}, "saleConfig": {"currencyCode": "Wt1wqXku", "price": 84}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "jcXIMQm2", "stackable": true, "status": "INACTIVE", "tags": ["F9doyCxG", "tdEfqTSE", "dZGkksNZ"], "targetCurrencyCode": "zFVpHRko", "targetNamespace": "G1QRr34d", "thumbnailUrl": "QGgkaPxc", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 127 'UpdateItem' test.out

#- 128 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '24MvxdN6' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'XFWc3vYb' \
    > test.out 2>&1
eval_tap $? 128 'DeleteItem' test.out

#- 129 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'l8WEcBmy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 7, "orderNo": "zjOM7kte"}' \
    > test.out 2>&1
eval_tap $? 129 'AcquireItem' test.out

#- 130 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'e549OroU' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '1G0IwzrS' \
    > test.out 2>&1
eval_tap $? 130 'GetApp' test.out

#- 131 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Llpevf1A' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SbukKDYM' \
    --body '{"carousel": [{"alt": "mGhmMSof", "previewUrl": "XVL9Kav4", "thumbnailUrl": "j6wswuPr", "type": "video", "url": "Apugnxio", "videoSource": "youtube"}, {"alt": "phatSO7Z", "previewUrl": "7OGI1zZC", "thumbnailUrl": "LzpyRMu0", "type": "video", "url": "BaKPndbT", "videoSource": "youtube"}, {"alt": "OISsSJPo", "previewUrl": "zsCu22SA", "thumbnailUrl": "bWkzjN3u", "type": "image", "url": "hb92NjDf", "videoSource": "youtube"}], "developer": "R8ismMd0", "forumUrl": "dwSTKycE", "genres": ["Adventure", "Strategy", "Sports"], "localizations": {"0NGkjeAw": {"announcement": "168FDZP6", "slogan": "HFnK3IqV"}, "Qv1L8j51": {"announcement": "DLGqJz1f", "slogan": "XOutU1ST"}, "yVZcO2X9": {"announcement": "0U7HQB1k", "slogan": "bTjiXBSe"}}, "platformRequirements": {"nEjVQpjn": [{"additionals": "PF1tsob4", "directXVersion": "Obfq6WZa", "diskSpace": "HgkiMZSN", "graphics": "L0zhHJ1t", "label": "0ig9YTjt", "osVersion": "lhwMGWeN", "processor": "0BJTtEzT", "ram": "ILJ53BbV", "soundCard": "qBEDbtG7"}, {"additionals": "KxOU0ZbE", "directXVersion": "kCMvEQBp", "diskSpace": "0Tc6YFc9", "graphics": "IAHfhRqJ", "label": "HCdVQ1VA", "osVersion": "AImmTXix", "processor": "y32ID2RY", "ram": "al98VYoP", "soundCard": "Ng35ev7C"}, {"additionals": "1DC4cN53", "directXVersion": "pw09D5ER", "diskSpace": "XUEi3868", "graphics": "BmPfZL0J", "label": "Q1y9n7OW", "osVersion": "Wv6tYaSy", "processor": "DZ4TaHFu", "ram": "B00iAZgD", "soundCard": "QUsU40cZ"}], "HD5NC68e": [{"additionals": "sze9m2I1", "directXVersion": "Kmd012KE", "diskSpace": "uw9lwViy", "graphics": "8lOJt380", "label": "lQVnTJo5", "osVersion": "O7oENgEG", "processor": "XylyWEuH", "ram": "efLIj7CN", "soundCard": "OWmdOhzu"}, {"additionals": "aX5wPGjJ", "directXVersion": "iUITzSz5", "diskSpace": "ztKGPjgq", "graphics": "vM9WVgPp", "label": "UFXZRmfZ", "osVersion": "jBdRPW42", "processor": "t7VQYPMq", "ram": "rOmTxuUs", "soundCard": "IxrQBb0J"}, {"additionals": "rrJWdNFk", "directXVersion": "bENVBnQT", "diskSpace": "KqwMtt93", "graphics": "08lmds3U", "label": "wL6RsBCU", "osVersion": "5SgkvGXB", "processor": "j1aJ9A0h", "ram": "d3daXk53", "soundCard": "f6fYtx6y"}], "YlddHu8D": [{"additionals": "OCOXEEpW", "directXVersion": "duw1enBd", "diskSpace": "05rrOkgL", "graphics": "KaCQIa8W", "label": "0s3aoyJF", "osVersion": "fF9zreGd", "processor": "Ez5YSlku", "ram": "F2vtk00T", "soundCard": "uGfcNcuo"}, {"additionals": "4IOZzvo6", "directXVersion": "7mNCynCc", "diskSpace": "RWAw1C9W", "graphics": "EmmLW4zL", "label": "70MuoMXG", "osVersion": "LdnEJ4vW", "processor": "2YzzNBAy", "ram": "Jgiat4tM", "soundCard": "lHsXJmV0"}, {"additionals": "2TLIms7F", "directXVersion": "JRgucmIE", "diskSpace": "sPQvIzsP", "graphics": "t2v4FvF3", "label": "L18s2oi3", "osVersion": "jy2wvMTu", "processor": "6TjaZRh9", "ram": "LmaOYaSa", "soundCard": "xlBDeQW3"}]}, "platforms": ["IOS", "MacOS", "Windows"], "players": ["Multi", "Coop", "LocalCoop"], "primaryGenre": "RPG", "publisher": "BPkYCWRa", "releaseDate": "1988-08-29T00:00:00Z", "websiteUrl": "LnqVSssn"}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateApp' test.out

#- 132 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'HkwUIlnS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kq12FgDT' \
    > test.out 2>&1
eval_tap $? 132 'DisableItem' test.out

#- 133 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'aMQBwUCz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'GetItemDynamicData' test.out

#- 134 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'kkwzzrNo' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4FZkwQLd' \
    > test.out 2>&1
eval_tap $? 134 'EnableItem' test.out

#- 135 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'xFYSULsK' \
    --itemId '2vaJWc3B' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kn5jq252' \
    > test.out 2>&1
eval_tap $? 135 'FeatureItem' test.out

#- 136 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'K1I4I2ko' \
    --itemId 'Au3XAlnp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YQnof4GU' \
    > test.out 2>&1
eval_tap $? 136 'DefeatureItem' test.out

#- 137 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'Duwm36Dd' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '2EQebG3e' \
    --populateBundle  \
    --region '3LQ4oqWE' \
    --storeId 'eczRp0uK' \
    > test.out 2>&1
eval_tap $? 137 'GetLocaleItem' test.out

#- 138 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'ENFdbpbc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 's7POqStS' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 78, "code": "j464zydj", "comparison": "isLessThan", "name": "ygFuA36X", "predicateType": "SeasonPassPredicate", "value": "filLEEVC", "values": ["GHq1uhpT", "Kd6DbGow", "pfyglpmj"]}, {"anyOf": 20, "code": "eQXT3vqD", "comparison": "is", "name": "CQA9kOWj", "predicateType": "SeasonTierPredicate", "value": "YadgimaG", "values": ["wipse4cw", "RhQjr1ku", "QJNxOpEL"]}, {"anyOf": 6, "code": "DIXmaZGz", "comparison": "isNot", "name": "oYQlsEqk", "predicateType": "EntitlementPredicate", "value": "hrq4zXZT", "values": ["qLH1iWZV", "ahOdgDHE", "yxAJg7D2"]}]}, {"operator": "or", "predicates": [{"anyOf": 13, "code": "zSQKW46x", "comparison": "excludes", "name": "rRbxJ0Dh", "predicateType": "StatisticCodePredicate", "value": "jyGIrIUS", "values": ["mv5DiEGk", "PCtZjDLG", "K2GI8Sl7"]}, {"anyOf": 11, "code": "3g3JHpkT", "comparison": "isGreaterThanOrEqual", "name": "KRowyNQ0", "predicateType": "EntitlementPredicate", "value": "4yQik9mQ", "values": ["BjDWVIak", "HsEeqSsY", "JTScS6IR"]}, {"anyOf": 71, "code": "qbNnvlXr", "comparison": "is", "name": "RHZz67mh", "predicateType": "EntitlementPredicate", "value": "dSZWEmSG", "values": ["4SQBlp5D", "d4tRiieL", "WT3yabqC"]}]}, {"operator": "and", "predicates": [{"anyOf": 88, "code": "lZ7GWpiw", "comparison": "is", "name": "TLr8MGyC", "predicateType": "SeasonPassPredicate", "value": "pmlDGx3l", "values": ["JiagbafO", "96YSPYli", "YqhpUF7D"]}, {"anyOf": 3, "code": "mc4YuvN5", "comparison": "isLessThan", "name": "flzTskej", "predicateType": "SeasonTierPredicate", "value": "ngD6SGD9", "values": ["bCZZrdde", "1TfPv3EC", "fC4IobhZ"]}, {"anyOf": 96, "code": "MnlBBgfU", "comparison": "excludes", "name": "aOGOnWEp", "predicateType": "StatisticCodePredicate", "value": "moYL0Vg2", "values": ["f5m6TtUt", "FTkSV9fq", "njx6cnD1"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateItemPurchaseCondition' test.out

#- 139 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'VbykK19l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "9pYOAF9S"}' \
    > test.out 2>&1
eval_tap $? 139 'ReturnItem' test.out

#- 140 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --name 'weA2gfmj' \
    --offset '77' \
    --tag 'HjzhrlAd' \
    > test.out 2>&1
eval_tap $? 140 'QueryKeyGroups' test.out

#- 141 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "DJu6kn9Z", "name": "mvWJCkCd", "status": "INACTIVE", "tags": ["1D1mdGPR", "G9SQ5D7q", "VDhqBNSb"]}' \
    > test.out 2>&1
eval_tap $? 141 'CreateKeyGroup' test.out

#- 142 GetKeyGroupByBoothName
eval_tap 0 142 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 143 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'CTNi5Ig6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'GetKeyGroup' test.out

#- 144 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '8snbnKDj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "W5y51rVf", "name": "kN3HscIW", "status": "INACTIVE", "tags": ["fupDVT6Y", "nkuVD9rn", "ef2GjxSb"]}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateKeyGroup' test.out

#- 145 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'dC8RGEaN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroupDynamic' test.out

#- 146 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'hr2MMLbQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '20' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 146 'ListKeys' test.out

#- 147 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'L8RYKSP6' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 147 'UploadKeys' test.out

#- 148 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FDX6dpks' \
    --limit '24' \
    --offset '22' \
    --orderNos 'RrY00Dlv,IuSPGWIG,CeKGwtrP' \
    --sortBy '0yjQMHny' \
    --startTime 'QMqo01Nh' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 148 'QueryOrders' test.out

#- 149 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetOrderStatistics' test.out

#- 150 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FPaBatLb' \
    > test.out 2>&1
eval_tap $? 150 'GetOrder' test.out

#- 151 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'A4XEGExB' \
    --body '{"description": "5hXBnND2"}' \
    > test.out 2>&1
eval_tap $? 151 'RefundOrder' test.out

#- 152 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 152 'GetPaymentCallbackConfig' test.out

#- 153 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "JYmSRUVE", "privateKey": "fyGecPKN"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdatePaymentCallbackConfig' test.out

#- 154 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetPaymentMerchantConfig' test.out

#- 155 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["KjE6OlEc", "y8eKrUXA", "2j1IYy08"]}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePaymentDomainWhitelistConfig' test.out

#- 156 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'ldkUsWhG' \
    --externalId 'gRUJczuM' \
    --limit '21' \
    --notificationSource 'NEONPAY' \
    --notificationType '1LLGueeP' \
    --offset '4' \
    --paymentOrderNo 'WgL5Q6sl' \
    --startDate 'w1Yn1aBO' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 156 'QueryPaymentNotifications' test.out

#- 157 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'M2SHb3fj' \
    --limit '25' \
    --offset '65' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 157 'QueryPaymentOrders' test.out

#- 158 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "yUZkV90D", "currencyNamespace": "rORmRrwa", "customParameters": {"6j51duhA": {}, "rU9QfIv4": {}, "dBM2a3GQ": {}}, "description": "JsmnqTqN", "extOrderNo": "hAmbNvuw", "extUserId": "nikkccdM", "itemType": "LOOTBOX", "language": "Ohg", "metadata": {"xLsbZDkh": "lSNiX8Yn", "nHxfq13E": "kZt9NcnC", "MDfWSFre": "du1BFPQT"}, "notifyUrl": "G4iAAlG0", "omitNotification": false, "platform": "DTzR22jN", "price": 47, "recurringPaymentOrderNo": "ljwEuC05", "region": "d8IFadQr", "returnUrl": "axdkBYmF", "sandbox": true, "sku": "rNEjzPYn", "subscriptionId": "ZWtorWlw", "targetNamespace": "LkORTHvs", "targetUserId": "jiWqA7rs", "title": "euY8TRw0"}' \
    > test.out 2>&1
eval_tap $? 158 'CreatePaymentOrderByDedicated' test.out

#- 159 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '057T7XNJ' \
    > test.out 2>&1
eval_tap $? 159 'ListExtOrderNoByExtTxId' test.out

#- 160 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'X4GGCw1I' \
    > test.out 2>&1
eval_tap $? 160 'GetPaymentOrder' test.out

#- 161 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QsEZfrKN' \
    --body '{"extTxId": "JNIIkwnD", "paymentMethod": "QkWfcwdM", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 161 'ChargePaymentOrder' test.out

#- 162 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pu4qdtVL' \
    --body '{"description": "cCt4xVar"}' \
    > test.out 2>&1
eval_tap $? 162 'RefundPaymentOrderByDedicated' test.out

#- 163 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xOE5syXD' \
    --body '{"amount": 7, "currencyCode": "2XUBcT4G", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 70, "vat": 51}' \
    > test.out 2>&1
eval_tap $? 163 'SimulatePaymentOrderNotification' test.out

#- 164 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fln3kQdS' \
    > test.out 2>&1
eval_tap $? 164 'GetPaymentOrderChargeStatus' test.out

#- 165 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'DyndmogT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "GrnHl2Z0", "serviceLabel": 50}' \
    > test.out 2>&1
eval_tap $? 165 'GetPsnEntitlementOwnership' test.out

#- 166 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'CmAc2CZc' \
    --body '{"delegationToken": "YekmN0HR", "sandboxId": "z1pfio4P"}' \
    > test.out 2>&1
eval_tap $? 166 'GetXboxEntitlementOwnership' test.out

#- 167 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 167 'GetPlatformEntitlementConfig' test.out

#- 168 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["Epic", "Epic", "System"]}' \
    > test.out 2>&1
eval_tap $? 168 'UpdatePlatformEntitlementConfig' test.out

#- 169 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformWalletConfig' test.out

#- 170 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["Epic", "Steam", "Other"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformWalletConfig' test.out

#- 171 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 171 'ResetPlatformWalletConfig' test.out

#- 172 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 172 'GetRevocationConfig' test.out

#- 173 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateRevocationConfig' test.out

#- 174 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 174 'DeleteRevocationConfig' test.out

#- 175 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime '1OnhzGpA' \
    --limit '84' \
    --offset '24' \
    --source 'OTHER' \
    --startTime 'gxTUqGrU' \
    --status 'FAIL' \
    --transactionId 'MKvljuiy' \
    --userId 'dZaKGuKv' \
    > test.out 2>&1
eval_tap $? 175 'QueryRevocationHistories' test.out

#- 176 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetRevocationPluginConfig' test.out

#- 177 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "GRz1ciC9"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "ZsAumWT5"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 177 'UpdateRevocationPluginConfig' test.out

#- 178 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'DeleteRevocationPluginConfig' test.out

#- 179 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 179 'UploadRevocationPluginConfigCert' test.out

#- 180 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rAIjO31W", "eventTopic": "w4ZJJnus", "maxAwarded": 38, "maxAwardedPerUser": 75, "namespaceExpression": "cplKuFGh", "rewardCode": "FEDS500P", "rewardConditions": [{"condition": "k9dJfoFj", "conditionName": "QGECVcpB", "eventName": "Z5G46ftU", "rewardItems": [{"duration": 23, "endDate": "1985-08-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "4VzYSaT1", "quantity": 71, "sku": "uuYWezXN"}, {"duration": 85, "endDate": "1990-02-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "t3Hkd1pY", "quantity": 66, "sku": "eNTW0HvT"}, {"duration": 2, "endDate": "1980-11-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "EB8yRL3g", "quantity": 19, "sku": "POHPtkW9"}]}, {"condition": "RG6HTXcO", "conditionName": "jiniFLas", "eventName": "ASjLqNg8", "rewardItems": [{"duration": 39, "endDate": "1979-05-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "aDG3f5WF", "quantity": 5, "sku": "dB3IlGCH"}, {"duration": 99, "endDate": "1982-11-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "uTCDsfX0", "quantity": 10, "sku": "XDmqF494"}, {"duration": 39, "endDate": "1975-07-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "BQVlQBk6", "quantity": 47, "sku": "WAr6UI0X"}]}, {"condition": "aXBt97LY", "conditionName": "rCMFUalM", "eventName": "HG46kuKg", "rewardItems": [{"duration": 37, "endDate": "1972-07-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "JtIFzcxm", "quantity": 19, "sku": "lgDz49p2"}, {"duration": 93, "endDate": "1989-01-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "aTIy37m4", "quantity": 71, "sku": "t6NPBLxD"}, {"duration": 79, "endDate": "1981-09-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "14IX8FN0", "quantity": 87, "sku": "vvbHnssC"}]}], "userIdExpression": "keEv6SpX"}' \
    > test.out 2>&1
eval_tap $? 180 'CreateReward' test.out

#- 181 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ypbeeUN3' \
    --limit '69' \
    --offset '98' \
    --sortBy 'rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 181 'QueryRewards' test.out

#- 182 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'ExportRewards' test.out

#- 183 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 183 'ImportRewards' test.out

#- 184 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '28ILvBAv' \
    > test.out 2>&1
eval_tap $? 184 'GetReward' test.out

#- 185 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'hTwZ6T7t' \
    --body '{"description": "8aIAvXzr", "eventTopic": "23TUtXwy", "maxAwarded": 76, "maxAwardedPerUser": 76, "namespaceExpression": "jNS0VH34", "rewardCode": "F66MSZRL", "rewardConditions": [{"condition": "HYHOHnUx", "conditionName": "wnIDUgQp", "eventName": "nRJ22ton", "rewardItems": [{"duration": 94, "endDate": "1987-09-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qUkJNYMU", "quantity": 46, "sku": "8aXEU70E"}, {"duration": 86, "endDate": "1977-07-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "QcfMZoqS", "quantity": 74, "sku": "0T5EF5Bf"}, {"duration": 45, "endDate": "1988-06-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "72M6VpZl", "quantity": 76, "sku": "PnHI3F1d"}]}, {"condition": "NFodLizn", "conditionName": "q7uP2uwx", "eventName": "LuMe4h4t", "rewardItems": [{"duration": 21, "endDate": "1992-08-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "J1sq8U7n", "quantity": 73, "sku": "Ut6cXE1X"}, {"duration": 17, "endDate": "1976-06-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Y5Nrkp4g", "quantity": 33, "sku": "a8ycsqVD"}, {"duration": 68, "endDate": "1976-11-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lMFsJMMA", "quantity": 26, "sku": "SQE2RtYn"}]}, {"condition": "9gelBrN8", "conditionName": "eEUZOOFG", "eventName": "DhJJareZ", "rewardItems": [{"duration": 73, "endDate": "1972-07-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "H1BhKvMl", "quantity": 60, "sku": "Mx3XpmNg"}, {"duration": 74, "endDate": "1988-02-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "xnILdOc8", "quantity": 12, "sku": "vrDpIC13"}, {"duration": 47, "endDate": "1971-10-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "rgPxIDQm", "quantity": 15, "sku": "OJRHvaMY"}]}], "userIdExpression": "OdO88jqm"}' \
    > test.out 2>&1
eval_tap $? 185 'UpdateReward' test.out

#- 186 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zteM8g0Y' \
    > test.out 2>&1
eval_tap $? 186 'DeleteReward' test.out

#- 187 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'CnKhSjv0' \
    --body '{"payload": {"lA9o7EIU": {}, "HN9OlqnF": {}, "zqoEeQWB": {}}}' \
    > test.out 2>&1
eval_tap $? 187 'CheckEventCondition' test.out

#- 188 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WlpwxVzS' \
    --body '{"conditionName": "fD21TOzQ", "userId": "QwsaoJxG"}' \
    > test.out 2>&1
eval_tap $? 188 'DeleteRewardConditionRecord' test.out

#- 189 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'iLsnd2nS' \
    --limit '83' \
    --offset '58' \
    --start 'aZyRnW8k' \
    --storeId 'q4QddwYb' \
    --viewId 'jE6oOCgc' \
    > test.out 2>&1
eval_tap $? 189 'QuerySections' test.out

#- 190 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '5dQlXVPd' \
    --body '{"active": false, "displayOrder": 64, "endDate": "1985-03-03T00:00:00Z", "ext": {"daIu2f3o": {}, "be5xry6o": {}, "aN5sE2JH": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 16, "itemCount": 73, "rule": "SEQUENCE"}, "items": [{"id": "5eHBiLVd", "sku": "OWFMV1OQ"}, {"id": "X8qvcyLo", "sku": "GCw8BBkU"}, {"id": "dM0okFrO", "sku": "FFQjxVID"}], "localizations": {"8Cx2QCbL": {"description": "ak3Je91Q", "localExt": {"SPjew93S": {}, "dN32j0kM": {}, "14QyLQjX": {}}, "longDescription": "6CD8SToF", "title": "VKWnc0Tk"}, "xzm4ehov": {"description": "wHpQsZZi", "localExt": {"Y7fBQ6YI": {}, "xPyNVz1B": {}, "h4awkhJa": {}}, "longDescription": "qPZGxu7P", "title": "EAH5OkMR"}, "hxWMUdcn": {"description": "yFKhFISe", "localExt": {"E4ApQejh": {}, "mgpXTXo6": {}, "p5VJBYIc": {}}, "longDescription": "sOxoX10e", "title": "3eSz2sV3"}}, "name": "fByf90oO", "rotationType": "CUSTOM", "startDate": "1986-06-06T00:00:00Z", "viewId": "S745Cebh"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateSection' test.out

#- 191 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '6YMVHWrq' \
    > test.out 2>&1
eval_tap $? 191 'PurgeExpiredSection' test.out

#- 192 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'H9KIEUH4' \
    --storeId 'cFTwoSwW' \
    > test.out 2>&1
eval_tap $? 192 'GetSection' test.out

#- 193 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'gq7X6g5Y' \
    --storeId 'Nklj4ugt' \
    --body '{"active": false, "displayOrder": 23, "endDate": "1996-03-20T00:00:00Z", "ext": {"2FIntmgd": {}, "oWyN0ydc": {}, "j0OF82GE": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 78, "itemCount": 18, "rule": "SEQUENCE"}, "items": [{"id": "oE9tSECt", "sku": "oDKLjLZr"}, {"id": "0a949NU4", "sku": "W02fuNm8"}, {"id": "cxq8hEca", "sku": "Z77lUzEx"}], "localizations": {"PfrV7rEe": {"description": "hGfR46pu", "localExt": {"dbB3BovB": {}, "arsVZxLM": {}, "R7DycR4a": {}}, "longDescription": "56PQQlMF", "title": "c1DxUSCM"}, "i2S6NrX5": {"description": "shLHF3Fe", "localExt": {"RenGwKzg": {}, "sKnQdAOt": {}, "1dezFP57": {}}, "longDescription": "BAOHnZo6", "title": "o8QS9CyU"}, "qR1eWFFS": {"description": "ogCgvydY", "localExt": {"mmudOvof": {}, "QjFu0L1E": {}, "MvVospGY": {}}, "longDescription": "V6VFqMxh", "title": "JnTsa5HO"}}, "name": "FZVVyPAy", "rotationType": "NONE", "startDate": "1975-07-04T00:00:00Z", "viewId": "iG8yVc1z"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateSection' test.out

#- 194 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'P0bvJJdn' \
    --storeId 'sqcODaeW' \
    > test.out 2>&1
eval_tap $? 194 'DeleteSection' test.out

#- 195 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'ListStores' test.out

#- 196 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "0ZrANLi9", "defaultRegion": "XICkbqAJ", "description": "AlvxX7H2", "supportedLanguages": ["23cCBW47", "vEgHCHwD", "Du15YF2F"], "supportedRegions": ["BO8lOUEh", "tDLIIaAJ", "BzslR2Mg"], "title": "ydOpzd1h"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateStore' test.out

#- 197 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'SECTION' \
    > test.out 2>&1
eval_tap $? 197 'GetCatalogDefinition' test.out

#- 198 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'DownloadCSVTemplates' test.out

#- 199 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["Gkl5ymo9", "QAaHtmFM", "d8yVEPif"], "idsToBeExported": ["pF4bgOq8", "ka4IFbeH", "qxePTtYL"], "storeId": "B9fuZtEZ"}' \
    > test.out 2>&1
eval_tap $? 199 'ExportStoreByCSV' test.out

#- 200 ImportStore
eval_tap 0 200 'ImportStore # SKIP deprecated' test.out

#- 201 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 201 'GetPublishedStore' test.out

#- 202 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 202 'DeletePublishedStore' test.out

#- 203 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetPublishedStoreBackup' test.out

#- 204 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'RollbackPublishedStore' test.out

#- 205 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'py2lAxnw' \
    > test.out 2>&1
eval_tap $? 205 'GetStore' test.out

#- 206 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qeodMwSr' \
    --body '{"defaultLanguage": "UJHpSWxN", "defaultRegion": "joTLD6sB", "description": "nvYd3TA2", "supportedLanguages": ["bTo9wjhE", "4OM4VAMI", "racsYN5J"], "supportedRegions": ["aR0eJhs2", "G95K2hFF", "biugXT86"], "title": "js8VaJck"}' \
    > test.out 2>&1
eval_tap $? 206 'UpdateStore' test.out

#- 207 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6tR0gvJk' \
    > test.out 2>&1
eval_tap $? 207 'DeleteStore' test.out

#- 208 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GBISZbva' \
    --action 'UPDATE' \
    --itemSku 'NYHU5yNa' \
    --itemType 'SUBSCRIPTION' \
    --limit '70' \
    --offset '67' \
    --selected  \
    --sortBy 'createdAt' \
    --status 'UNPUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'dneRyTqh' \
    --updatedAtStart 'JVc8blp4' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 208 'QueryChanges' test.out

#- 209 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aYlIv0Cg' \
    > test.out 2>&1
eval_tap $? 209 'PublishAll' test.out

#- 210 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PAfsizt1' \
    > test.out 2>&1
eval_tap $? 210 'PublishSelected' test.out

#- 211 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'whRyFx3Q' \
    > test.out 2>&1
eval_tap $? 211 'SelectAllRecords' test.out

#- 212 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '2lsJ7RJF' \
    --action 'UPDATE' \
    --itemSku 'vefVo5BI' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd 'mi8DvGN7' \
    --updatedAtStart 'G0VtJPoO' \
    > test.out 2>&1
eval_tap $? 212 'SelectAllRecordsByCriteria' test.out

#- 213 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QVqclNUp' \
    --action 'UPDATE' \
    --itemSku 'Yfh8Q6XA' \
    --itemType 'APP' \
    --type 'CATEGORY' \
    --updatedAtEnd 'oHrMOf7U' \
    --updatedAtStart '4g1sYdAb' \
    > test.out 2>&1
eval_tap $? 213 'GetStatistic' test.out

#- 214 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'P3uIN0PW' \
    > test.out 2>&1
eval_tap $? 214 'UnselectAllRecords' test.out

#- 215 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Vmfx4PQz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aSJvXJ6f' \
    > test.out 2>&1
eval_tap $? 215 'SelectRecord' test.out

#- 216 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'ZPWl9biy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'APjS5m1h' \
    > test.out 2>&1
eval_tap $? 216 'UnselectRecord' test.out

#- 217 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZA2tGji9' \
    --targetStoreId 'GyxwUX8t' \
    > test.out 2>&1
eval_tap $? 217 'CloneStore' test.out

#- 218 ExportStore
eval_tap 0 218 'ExportStore # SKIP deprecated' test.out

#- 219 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wkr6Kw0y' \
    --end '6s93ZLaZ' \
    --limit '79' \
    --offset '63' \
    --sortBy 'SgvpKBDa' \
    --start 'sNDYWrNV' \
    --success  \
    > test.out 2>&1
eval_tap $? 219 'QueryImportHistory' test.out

#- 220 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lRfajHVe' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '0Sc99xk3' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 220 'ImportStoreByCSV' test.out

#- 221 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'zWL1nXOc' \
    --limit '18' \
    --offset '43' \
    --sku 'qc5bQMsz' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'XGledWEw' \
    > test.out 2>&1
eval_tap $? 221 'QuerySubscriptions' test.out

#- 222 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OtL6MNgQ' \
    > test.out 2>&1
eval_tap $? 222 'RecurringChargeSubscription' test.out

#- 223 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'QcbwkPUi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'GetTicketDynamic' test.out

#- 224 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'V2hLoiCj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "agm1sH1V"}' \
    > test.out 2>&1
eval_tap $? 224 'DecreaseTicketSale' test.out

#- 225 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'yUXvlVx7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketBoothID' test.out

#- 226 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'q7MNB136' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 92, "orderNo": "ztSlrnaK"}' \
    > test.out 2>&1
eval_tap $? 226 'IncreaseTicketSale' test.out

#- 227 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 50, "currencyCode": "3MZ9BY9c", "expireAt": "1999-12-17T00:00:00Z"}, "debitPayload": {"count": 81, "currencyCode": "fmkPKNPa", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 85, "entitlementCollectionId": "x7MAnHGz", "entitlementOrigin": "Steam", "itemIdentity": "ddVSN9fY", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 73, "entitlementId": "U8mLGoyN"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 83, "currencyCode": "JDdLjyOE", "expireAt": "1980-02-29T00:00:00Z"}, "debitPayload": {"count": 24, "currencyCode": "bQymEJib", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 92, "entitlementCollectionId": "zMgKRvlE", "entitlementOrigin": "Playstation", "itemIdentity": "B6xXc9X9", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 60, "entitlementId": "01A4iEV6"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 18, "currencyCode": "0LRDwCAv", "expireAt": "1988-07-15T00:00:00Z"}, "debitPayload": {"count": 59, "currencyCode": "6C6fYO08", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 21, "entitlementCollectionId": "ycudNSEC", "entitlementOrigin": "Playstation", "itemIdentity": "16dNw4lm", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 54, "entitlementId": "0UAgnRxf"}, "type": "DEBIT_WALLET"}], "userId": "lbMq5kLQ"}, {"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 86, "currencyCode": "lP6JJXIS", "expireAt": "1981-07-28T00:00:00Z"}, "debitPayload": {"count": 83, "currencyCode": "cZumbFTO", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 36, "entitlementCollectionId": "4m0LfPtB", "entitlementOrigin": "Twitch", "itemIdentity": "NRYNmD6J", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 39, "entitlementId": "MVuR9PCS"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 95, "currencyCode": "8mcVCQb6", "expireAt": "1985-01-29T00:00:00Z"}, "debitPayload": {"count": 70, "currencyCode": "rUwprzSz", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "hbxksF8u", "entitlementOrigin": "Other", "itemIdentity": "kKO5Tv9s", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 11, "entitlementId": "BOgzvVrl"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 39, "currencyCode": "tcY4RXBs", "expireAt": "1997-11-06T00:00:00Z"}, "debitPayload": {"count": 66, "currencyCode": "glUSkXuK", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "BTbGRLyA", "entitlementOrigin": "Playstation", "itemIdentity": "2kRfYSqY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 93, "entitlementId": "h19h3l1h"}, "type": "DEBIT_WALLET"}], "userId": "zry8oIv4"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 99, "currencyCode": "LORqiH1I", "expireAt": "1996-05-15T00:00:00Z"}, "debitPayload": {"count": 17, "currencyCode": "Pd70knEI", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 6, "entitlementCollectionId": "7T6QMGuA", "entitlementOrigin": "IOS", "itemIdentity": "yVak7RxL", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 95, "entitlementId": "lWa7TmuA"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 75, "currencyCode": "nkEZlZGb", "expireAt": "1979-06-26T00:00:00Z"}, "debitPayload": {"count": 85, "currencyCode": "NMWvhmt1", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 53, "entitlementCollectionId": "vzErhOtv", "entitlementOrigin": "System", "itemIdentity": "uybMt4p6", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 75, "entitlementId": "V1k0YUfn"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 86, "currencyCode": "qG5O1iRt", "expireAt": "1979-11-03T00:00:00Z"}, "debitPayload": {"count": 25, "currencyCode": "SsC0WAnE", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 12, "entitlementCollectionId": "4jR5ZyRG", "entitlementOrigin": "Oculus", "itemIdentity": "n4aK7vm5", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "KI7MNCzq"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "XwQP1ity"}], "metadata": {"PxFcCi7B": {}, "iWYcwTHg": {}, "2vNLrsbx": {}}, "needPreCheck": false, "transactionId": "05EVrUbu", "type": "FVkfLf3J"}' \
    > test.out 2>&1
eval_tap $? 227 'Commit' test.out

#- 228 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '19' \
    --status 'SUCCESS' \
    --type 'zFkFRCXe' \
    --userId 'a6SSCdzy' \
    > test.out 2>&1
eval_tap $? 228 'GetTradeHistoryByCriteria' test.out

#- 229 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'y1zw8Geb' \
    > test.out 2>&1
eval_tap $? 229 'GetTradeHistoryByTransactionId' test.out

#- 230 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhJJD0Zj' \
    --body '{"achievements": [{"id": "oDzicS1C", "value": 34}, {"id": "QdGKBnMF", "value": 53}, {"id": "GcH9oIwg", "value": 58}], "steamUserId": "eQJCNNH6"}' \
    > test.out 2>&1
eval_tap $? 230 'UnlockSteamUserAchievement' test.out

#- 231 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPd2yF3A' \
    --xboxUserId 'KMPEk5pT' \
    > test.out 2>&1
eval_tap $? 231 'GetXblUserAchievements' test.out

#- 232 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WCTLrHcI' \
    --body '{"achievements": [{"id": "8szyDm6b", "percentComplete": 64}, {"id": "eeOoayBi", "percentComplete": 49}, {"id": "S6RiwTfV", "percentComplete": 70}], "serviceConfigId": "GaCd2p40", "titleId": "TxYpZ1rD", "xboxUserId": "DnqNAQkh"}' \
    > test.out 2>&1
eval_tap $? 232 'UpdateXblUserAchievement' test.out

#- 233 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '5NyUiwEb' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizeCampaign' test.out

#- 234 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sg9Dm7I9' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeEntitlement' test.out

#- 235 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYQVFKNK' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeFulfillment' test.out

#- 236 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEBzMQi5' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeIntegration' test.out

#- 237 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPRuzoPy' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeOrder' test.out

#- 238 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXAmb88R' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizePayment' test.out

#- 239 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'hyZw5LB5' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeRevocation' test.out

#- 240 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGfjwSHO' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizeSubscription' test.out

#- 241 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZANNiraz' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeWallet' test.out

#- 242 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'M5Qsg7E8' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 242 'GetUserDLCByPlatform' test.out

#- 243 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '3nELXS7v' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 243 'GetUserDLC' test.out

#- 244 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9pHoPge' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId '6VxE2Bs9' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'uiQCnmsC' \
    --features 'QKEQxBmg,mBgjC31c,NBId1M4d' \
    --fuzzyMatchName  \
    --itemId 'PFRIwb5i,Ey1Du7Wa,LEchn6av' \
    --limit '81' \
    --offset '5' \
    --origin 'Other' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserEntitlements' test.out

#- 245 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'x270szcB' \
    --body '[{"collectionId": "FVT7FRYT", "endDate": "1982-11-20T00:00:00Z", "grantedCode": "68Z0r8go", "itemId": "QeHiCHQR", "itemNamespace": "FyHzjtpX", "language": "rog_BwcM", "metadata": {"NmJV0qAB": {}, "ZPBcKfqP": {}, "ksy5tgTP": {}}, "origin": "Nintendo", "quantity": 28, "region": "fQy1zwPj", "source": "OTHER", "startDate": "1978-01-26T00:00:00Z", "storeId": "5CWSSPxt"}, {"collectionId": "kUm33NQe", "endDate": "1974-09-09T00:00:00Z", "grantedCode": "53ha3Uml", "itemId": "Ojz9tvHH", "itemNamespace": "EQL4Qa2V", "language": "dFTu_Gbdh_Tq", "metadata": {"8fOuGeFs": {}, "jEJtN6Ee": {}, "kT1Vzbo3": {}}, "origin": "Other", "quantity": 83, "region": "J69Oxqrc", "source": "REWARD", "startDate": "1977-02-21T00:00:00Z", "storeId": "0FIzrGVP"}, {"collectionId": "M1TrCiO5", "endDate": "1980-02-02T00:00:00Z", "grantedCode": "ClKLPjVm", "itemId": "57VINOJx", "itemNamespace": "dUneGBRD", "language": "Azpt_sfwJ", "metadata": {"R8IyLDco": {}, "VPNlHix2": {}, "ERxlyRlG": {}}, "origin": "Epic", "quantity": 40, "region": "bCy8ROe2", "source": "PROMOTION", "startDate": "1972-08-30T00:00:00Z", "storeId": "lx8YV3Mf"}]' \
    > test.out 2>&1
eval_tap $? 245 'GrantUserEntitlement' test.out

#- 246 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ey3gxG0j' \
    --activeOnly  \
    --appId 'bFbRTGEL' \
    > test.out 2>&1
eval_tap $? 246 'GetUserAppEntitlementByAppId' test.out

#- 247 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'vgU8gJJ9' \
    --activeOnly  \
    --limit '100' \
    --offset '40' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserEntitlementsByAppType' test.out

#- 248 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xxgc6jzl' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'L4zQAUq5' \
    --itemId '37Kknsb8' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementByItemId' test.out

#- 249 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '55EQ2i8U' \
    --ids 'sp5kPCBd,NYa4BHGe,PuzTvSaF' \
    --platform 'fMZ7JmCf' \
    > test.out 2>&1
eval_tap $? 249 'GetUserActiveEntitlementsByItemIds' test.out

#- 250 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RKmZPFng' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform '022D70D7' \
    --sku 'XndOONUB' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementBySku' test.out

#- 251 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'X00rVD6u' \
    --appIds 'D2aXIE6m,UYBQHIsH,BPfYUf9S' \
    --itemIds 'LnV4hZ9l,YtMqxCMH,pCuXuWqc' \
    --platform 'xE0i6uSC' \
    --skus 'XllF3mUS,8QV5jrzh,Gt9UmKhS' \
    > test.out 2>&1
eval_tap $? 251 'ExistsAnyUserActiveEntitlement' test.out

#- 252 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'MfNpwbxV' \
    --platform 'Bp0NXD4n' \
    --itemIds 'UHi14siI,cqJ4Xwq3,SSMjK2eT' \
    > test.out 2>&1
eval_tap $? 252 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 253 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '7EEBkScN' \
    --appId 'DHgDer6z' \
    > test.out 2>&1
eval_tap $? 253 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 254 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'omNHlwEy' \
    --entitlementClazz 'CODE' \
    --platform 'p9qtfqfF' \
    --itemId '13p5Z5b4' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlementOwnershipByItemId' test.out

#- 255 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFoEWSwL' \
    --ids 'Z2cmAT3K,yIALbA9H,vRgh2XPv' \
    --platform '50pKi4D3' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementOwnershipByItemIds' test.out

#- 256 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJZxjUe8' \
    --entitlementClazz 'CODE' \
    --platform 'rlX09ocF' \
    --sku 'CbCTUcHS' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementOwnershipBySku' test.out

#- 257 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'N4ZGgSfo' \
    > test.out 2>&1
eval_tap $? 257 'RevokeAllEntitlements' test.out

#- 258 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'iNsotnDc' \
    --entitlementIds 'UcHqY8Cx' \
    > test.out 2>&1
eval_tap $? 258 'RevokeUserEntitlements' test.out

#- 259 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Wabt9IsW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iWlGeQ9a' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlement' test.out

#- 260 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'nEn1ntKw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hn0sPqcN' \
    --body '{"collectionId": "Id88Muaj", "endDate": "1972-07-20T00:00:00Z", "nullFieldList": ["2MD1To1U", "vc2MdQTO", "BNvJFF6T"], "origin": "IOS", "reason": "1Iq4Tgqt", "startDate": "1989-08-21T00:00:00Z", "status": "REVOKED", "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 260 'UpdateUserEntitlement' test.out

#- 261 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'rwac8igK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAu3UNpk' \
    --body '{"metadata": {"e6QKLoKz": {}, "JsVszdk3": {}, "oNDaBbFy": {}}, "options": ["6T3Lbx9m", "WIAULWSK", "xMgNcmSS"], "platform": "7S35tPDH", "requestId": "Q8r12vhq", "useCount": 22}' \
    > test.out 2>&1
eval_tap $? 261 'ConsumeUserEntitlement' test.out

#- 262 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'CBkdr6lE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyYVbppk' \
    > test.out 2>&1
eval_tap $? 262 'DisableUserEntitlement' test.out

#- 263 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Lho0oP2S' \
    --namespace "$AB_NAMESPACE" \
    --userId '7GKHhK3c' \
    > test.out 2>&1
eval_tap $? 263 'EnableUserEntitlement' test.out

#- 264 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'uhVOuzc9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3FcZdVB' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementHistories' test.out

#- 265 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'DGjlAykN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QCSNGkcU' \
    --body '{"metadata": {"w2ZkQnoV": {}, "X8fHkIkF": {}, "di7q4z4H": {}}}' \
    > test.out 2>&1
eval_tap $? 265 'RevokeUserEntitlement' test.out

#- 266 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '2SeqM2AI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LaERKcO3' \
    --body '{"reason": "27BXvz7s", "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 266 'RevokeUserEntitlementByUseCount' test.out

#- 267 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'gLZkYk9K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzvUWZqp' \
    --quantity '64' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 268 RevokeUseCount
eval_tap 0 268 'RevokeUseCount # SKIP deprecated' test.out

#- 269 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'hVmGXqKh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cxvc1wfD' \
    --body '{"platform": "SMQ8ZZhM", "requestId": "sVfdBYin", "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 269 'SellUserEntitlement' test.out

#- 270 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLZLrMQJ' \
    --body '{"duration": 45, "endDate": "1977-08-13T00:00:00Z", "entitlementCollectionId": "DlTNCNlB", "entitlementOrigin": "System", "itemId": "DWBF2XA4", "itemSku": "Qv1c1wT8", "language": "1A5yxeNN", "metadata": {"4WQM6o1x": {}, "o3EfLKWA": {}, "EUGw1qAk": {}}, "order": {"currency": {"currencyCode": "4bsHF75v", "currencySymbol": "O9QemNVK", "currencyType": "REAL", "decimals": 38, "namespace": "BeujWEMD"}, "ext": {"5dzaqeWO": {}, "23RtTI5Z": {}, "OhqCZP4y": {}}, "free": true}, "orderNo": "gEZfAdoB", "origin": "GooglePlay", "overrideBundleItemQty": {"tMNQFJoU": 97, "vpbAGKiv": 35, "RyJJyZzV": 73}, "quantity": 39, "region": "F7Z87H3I", "source": "REWARD", "startDate": "1979-12-28T00:00:00Z", "storeId": "JOIx6q9b"}' \
    > test.out 2>&1
eval_tap $? 270 'FulfillItem' test.out

#- 271 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7Ui0mpC' \
    --body '{"code": "m2qV1wlX", "language": "Yc-UocB-590", "region": "ehLbWsxW"}' \
    > test.out 2>&1
eval_tap $? 271 'RedeemCode' test.out

#- 272 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TXWb74JD' \
    --body '{"itemId": "5yH38iSq", "itemSku": "vdkexTTP", "quantity": 49}' \
    > test.out 2>&1
eval_tap $? 272 'PreCheckFulfillItem' test.out

#- 273 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'zM8XAAEh' \
    --body '{"entitlementCollectionId": "47KR63b0", "entitlementOrigin": "Steam", "metadata": {"Y2HjA5VA": {}, "QfbpqGAV": {}, "M6tBuNnW": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "hWPMImrP", "namespace": "duOa3Muy"}, "item": {"itemId": "r8wcLa6W", "itemName": "XQkm4PZa", "itemSku": "WJN1Q6iD", "itemType": "5iDq08EE"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"currencyCode": "T145Ah6t", "namespace": "XK8g0BCX"}, "item": {"itemId": "Rol2PmAx", "itemName": "62Ur4Vfp", "itemSku": "rqXSImel", "itemType": "4T1j6Zav"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "qrLuYAND", "namespace": "eIzQOaYW"}, "item": {"itemId": "b7Boef9T", "itemName": "S9WMeMZg", "itemSku": "0jCMWiu1", "itemType": "RxaeG61F"}, "quantity": 26, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "F2Ncfcaj"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillRewards' test.out

#- 274 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ty2sUM1n' \
    --endTime 'KjD3D1Ph' \
    --limit '21' \
    --offset '6' \
    --productId 'XA6pGQ2E' \
    --startTime 'frRBzmRG' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 274 'QueryUserIAPOrders' test.out

#- 275 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'T656nGZO' \
    > test.out 2>&1
eval_tap $? 275 'QueryAllUserIAPOrders' test.out

#- 276 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '3qqatTNX' \
    --endTime 'C38zpcMc' \
    --limit '50' \
    --offset '27' \
    --startTime 'XFbPK3Ku' \
    --status 'FAIL' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 276 'QueryUserIAPConsumeHistory' test.out

#- 277 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjsXjg8a' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "lDUN-pl", "productId": "CQd7vuuL", "region": "qtCxJi70", "transactionId": "Zf5gJgDU", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 277 'MockFulfillIAPItem' test.out

#- 278 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'PyNFKSWb' \
    --activeOnly  \
    --groupId 'FFoYk9Wn' \
    --limit '51' \
    --offset '73' \
    --platform 'STEAM' \
    --productId 'q8Nsp1P8' \
    > test.out 2>&1
eval_tap $? 278 'QueryUserThirdPartySubscription' test.out

#- 279 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    --userId 'fOEbM7A9' \
    --groupId 'fUl2G8iX' \
    > test.out 2>&1
eval_tap $? 279 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 280 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    --userId '9rVwlKlB' \
    --productId 'H5aNKoQz' \
    > test.out 2>&1
eval_tap $? 280 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 281 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfGsr4qF' \
    --activeOnly  \
    --groupId 'JORZJW9S' \
    --limit '59' \
    --offset '0' \
    --platform 'TWITCH' \
    --productId 'Xzsrhpl1' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 282 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '9FIK6G1b' \
    --namespace "$AB_NAMESPACE" \
    --userId '0PbRgq94' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartySubscriptionDetails' test.out

#- 283 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'ozPmpFhL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pl9QnHDs' \
    --limit '62' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 283 'GetSubscriptionHistory' test.out

#- 284 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'zIyz5dJU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6GQulv8' \
    > test.out 2>&1
eval_tap $? 284 'SyncSubscriptionTransaction' test.out

#- 285 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 's5ZegS6z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fjb0DKGi' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartyUserSubscriptionDetails' test.out

#- 286 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '2yaFGy0b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ygKnwUIG' \
    > test.out 2>&1
eval_tap $? 286 'SyncSubscription' test.out

#- 287 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8lq5378' \
    --discounted  \
    --itemId 'OHzFJPSJ' \
    --limit '29' \
    --offset '94' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserOrders' test.out

#- 288 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'K1APQZpJ' \
    --body '{"currencyCode": "af7SWsOd", "currencyNamespace": "c3ky5g6Q", "discountCodes": ["ZhDD4Ltx", "k0U4tnaG", "E0ZGKMPK"], "discountedPrice": 31, "entitlementPlatform": "Nintendo", "ext": {"OaEORdYc": {}, "js6jRr1U": {}, "UuMWnIhA": {}}, "itemId": "xymtA454", "language": "wih6r4P6", "options": {"skipPriceValidation": false}, "platform": "IOS", "price": 97, "quantity": 54, "region": "gS6F9oNN", "returnUrl": "kLEVpWlg", "sandbox": true, "sectionId": "V7nUEp6M"}' \
    > test.out 2>&1
eval_tap $? 288 'AdminCreateUserOrder' test.out

#- 289 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MhCHnsVf' \
    --itemId 'Iunk5RuA' \
    > test.out 2>&1
eval_tap $? 289 'CountOfPurchasedItem' test.out

#- 290 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mCaQy8f5' \
    --userId 'Jcfs49I3' \
    > test.out 2>&1
eval_tap $? 290 'GetUserOrder' test.out

#- 291 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Jw8rNRL5' \
    --userId 'FrIDtt4Q' \
    --body '{"status": "REFUND_FAILED", "statusReason": "ztGVmWlw"}' \
    > test.out 2>&1
eval_tap $? 291 'UpdateUserOrderStatus' test.out

#- 292 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZslbWmmG' \
    --userId 'w8rchD6E' \
    > test.out 2>&1
eval_tap $? 292 'FulfillUserOrder' test.out

#- 293 GetUserOrderGrant
eval_tap 0 293 'GetUserOrderGrant # SKIP deprecated' test.out

#- 294 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hWQsXqQk' \
    --userId 'L1cUMDA0' \
    > test.out 2>&1
eval_tap $? 294 'GetUserOrderHistories' test.out

#- 295 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fNFtSqWc' \
    --userId '8x9y0epn' \
    --body '{"additionalData": {"cardSummary": "Lp2aAbW1"}, "authorisedTime": "1997-07-20T00:00:00Z", "chargebackReversedTime": "1991-10-26T00:00:00Z", "chargebackTime": "1974-03-23T00:00:00Z", "chargedTime": "1977-07-10T00:00:00Z", "createdTime": "1997-11-24T00:00:00Z", "currency": {"currencyCode": "YwStK4sW", "currencySymbol": "KIikIYZh", "currencyType": "VIRTUAL", "decimals": 51, "namespace": "3TmRUAPv"}, "customParameters": {"Y2u2hOTf": {}, "39l6bZmn": {}, "SAn1e024": {}}, "extOrderNo": "tsw4UJnh", "extTxId": "lHkPLga3", "extUserId": "tU4gYRAI", "issuedAt": "1977-03-06T00:00:00Z", "metadata": {"mhhKbAHQ": "F0BtvQmf", "NqYhwpTq": "cDcUMfyX", "Fy1JeqFg": "Llj8QVon"}, "namespace": "HHO8QfyI", "nonceStr": "z7bK8wSJ", "paymentData": {"discountAmount": 35, "discountCode": "hkZQ8Phx", "subtotalPrice": 1, "tax": 59, "totalPrice": 32}, "paymentMethod": "cbbQ4ebK", "paymentMethodFee": 47, "paymentOrderNo": "hz2rRfmX", "paymentProvider": "CHECKOUT", "paymentProviderFee": 12, "paymentStationUrl": "JF8ukLox", "price": 25, "refundedTime": "1982-08-01T00:00:00Z", "salesTax": 31, "sandbox": false, "sku": "jYZe1Fkx", "status": "CHARGEBACK", "statusReason": "nVH8qbM3", "subscriptionId": "kYYiWqbR", "subtotalPrice": 22, "targetNamespace": "qFzj6Ovx", "targetUserId": "zaOIS4cr", "tax": 80, "totalPrice": 31, "totalTax": 28, "txEndTime": "1989-07-07T00:00:00Z", "type": "FDidcXc4", "userId": "3sTxkBJE", "vat": 17}' \
    > test.out 2>&1
eval_tap $? 295 'ProcessUserOrderNotification' test.out

#- 296 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4ki7sZMc' \
    --userId 'mM510UzH' \
    > test.out 2>&1
eval_tap $? 296 'DownloadUserOrderReceipt' test.out

#- 297 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0kNsYMg' \
    --body '{"currencyCode": "DNlAtXIW", "currencyNamespace": "qWkzWo5G", "customParameters": {"XaJQcAtc": {}, "YGZVtBqK": {}, "kL4kXFOp": {}}, "description": "84EHKQZi", "extOrderNo": "tsvJb9dG", "extUserId": "YVnsny6Z", "itemType": "OPTIONBOX", "language": "jedQ-AREr", "metadata": {"hO6VAEwB": "qd9vhOM8", "cpATdZDO": "kgKvcPdI", "T6pYM9a2": "mwk5oW8e"}, "notifyUrl": "LbIgz4j2", "omitNotification": false, "platform": "VyyjrUJj", "price": 44, "recurringPaymentOrderNo": "QDBMeUjf", "region": "XdGKfzu3", "returnUrl": "JvF2zUQL", "sandbox": false, "sku": "MdjmSpQf", "subscriptionId": "A2a5uqH1", "title": "tU79jz9t"}' \
    > test.out 2>&1
eval_tap $? 297 'CreateUserPaymentOrder' test.out

#- 298 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mAGN5sJQ' \
    --userId 'oaE6UIco' \
    --body '{"description": "SOL3qtnL"}' \
    > test.out 2>&1
eval_tap $? 298 'RefundUserPaymentOrder' test.out

#- 299 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'wZR8dXtV' \
    > test.out 2>&1
eval_tap $? 299 'GetUserPlatformAccountClosureHistories' test.out

#- 300 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'w6KcqnvP' \
    --body '{"code": "oUcqricb", "orderNo": "lFLVqT3S"}' \
    > test.out 2>&1
eval_tap $? 300 'ApplyUserRedemption' test.out

#- 301 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'm51DuGxS' \
    --body '{"meta": {"uwt8ah80": {}, "maqooJiB": {}, "jfxZv4Gu": {}}, "reason": "gdPMJ4jV", "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "ZRp6Odei", "namespace": "Xg8WTYMF"}, "entitlement": {"entitlementId": "R6Kd24HS"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "MBYyan3i", "itemIdentityType": "ITEM_ID", "origin": "Steam"}, "quantity": 71, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "mRme9Cbc", "namespace": "md9wyPRg"}, "entitlement": {"entitlementId": "c3HbslZ3"}, "item": {"entitlementOrigin": "Epic", "itemIdentity": "jumJNDzQ", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 59, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "10y10j47", "namespace": "DQd5F2qE"}, "entitlement": {"entitlementId": "HRg29xZL"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "yRTj02R6", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 15, "type": "CURRENCY"}], "source": "IAP", "transactionId": "HFADJ89k"}' \
    > test.out 2>&1
eval_tap $? 301 'DoRevocation' test.out

#- 302 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsRqFIpH' \
    --body '{"gameSessionId": "kL8DTe88", "payload": {"WkW3mizq": {}, "EYr6tXF3": {}, "yrhoap3z": {}}, "scid": "jVrJS5l1", "sessionTemplateName": "YP6pXrrk"}' \
    > test.out 2>&1
eval_tap $? 302 'RegisterXblSessions' test.out

#- 303 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fw3t9wHm' \
    --chargeStatus 'CHARGED' \
    --itemId 'UxrVegob' \
    --limit '76' \
    --offset '63' \
    --sku 'oN4Khw5N' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserSubscriptions' test.out

#- 304 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'sati0lPR' \
    --excludeSystem  \
    --limit '39' \
    --offset '68' \
    --subscriptionId 'KTWhDbdg' \
    > test.out 2>&1
eval_tap $? 304 'GetUserSubscriptionActivities' test.out

#- 305 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'IVmHAp7g' \
    --body '{"grantDays": 34, "itemId": "azvVRIhb", "language": "u0WaItDL", "reason": "gPH9wy6K", "region": "KC0MqpMM", "source": "XBtD46mm"}' \
    > test.out 2>&1
eval_tap $? 305 'PlatformSubscribeSubscription' test.out

#- 306 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8oPIkUw' \
    --itemId 'BMMZ8sni' \
    > test.out 2>&1
eval_tap $? 306 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 307 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hg7QotJT' \
    --userId 'l1Euyl2H' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscription' test.out

#- 308 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'I5yIRS7e' \
    --userId '31aUUm8Y' \
    > test.out 2>&1
eval_tap $? 308 'DeleteUserSubscription' test.out

#- 309 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DfoOek84' \
    --userId 'JNenqEd8' \
    --force  \
    --body '{"immediate": false, "reason": "gdPKFDZR"}' \
    > test.out 2>&1
eval_tap $? 309 'CancelSubscription' test.out

#- 310 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eAMs6Tkm' \
    --userId '9wYJNKpg' \
    --body '{"grantDays": 91, "reason": "yzMWhahq"}' \
    > test.out 2>&1
eval_tap $? 310 'GrantDaysToSubscription' test.out

#- 311 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8tcR2C6B' \
    --userId 'hZCuGx80' \
    --excludeFree  \
    --limit '41' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 311 'GetUserSubscriptionBillingHistories' test.out

#- 312 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ANwQz01B' \
    --userId 'Mxzcf9gQ' \
    --body '{"additionalData": {"cardSummary": "Hr9JhjAj"}, "authorisedTime": "1975-12-03T00:00:00Z", "chargebackReversedTime": "1990-07-09T00:00:00Z", "chargebackTime": "1978-07-01T00:00:00Z", "chargedTime": "1989-06-13T00:00:00Z", "createdTime": "1994-07-19T00:00:00Z", "currency": {"currencyCode": "ptfxLFQd", "currencySymbol": "wfmNDDLq", "currencyType": "VIRTUAL", "decimals": 5, "namespace": "TpL5cXK9"}, "customParameters": {"4c1Fgu86": {}, "Xf1YQMWI": {}, "WcDZAReH": {}}, "extOrderNo": "0HOfz24y", "extTxId": "Yh4jqYjF", "extUserId": "lN8NQp4Q", "issuedAt": "1974-08-31T00:00:00Z", "metadata": {"BMp0YSRA": "Kdnlehzr", "8D2lZrPS": "5OJZ8fRk", "qhgWIU2T": "zofvvCtv"}, "namespace": "4UiwPOMH", "nonceStr": "vA3f0bOC", "paymentData": {"discountAmount": 16, "discountCode": "3c5CYAG2", "subtotalPrice": 32, "tax": 18, "totalPrice": 82}, "paymentMethod": "oL7FOBLR", "paymentMethodFee": 45, "paymentOrderNo": "2xIypaie", "paymentProvider": "PAYPAL", "paymentProviderFee": 54, "paymentStationUrl": "DaanSJxi", "price": 52, "refundedTime": "1979-06-17T00:00:00Z", "salesTax": 2, "sandbox": true, "sku": "lQ6WMyoK", "status": "CHARGEBACK_REVERSED", "statusReason": "nqgLmoNX", "subscriptionId": "SiFA9AET", "subtotalPrice": 0, "targetNamespace": "rwMll3T1", "targetUserId": "kbDjaCOH", "tax": 74, "totalPrice": 54, "totalTax": 80, "txEndTime": "1982-01-17T00:00:00Z", "type": "SJebcY7A", "userId": "lNfrtbSI", "vat": 1}' \
    > test.out 2>&1
eval_tap $? 312 'ProcessUserSubscriptionNotification' test.out

#- 313 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '5rswGrZi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xajnfs2E' \
    --body '{"count": 79, "orderNo": "tNcImjKs"}' \
    > test.out 2>&1
eval_tap $? 313 'AcquireUserTicket' test.out

#- 314 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'VNGgbJbt' \
    > test.out 2>&1
eval_tap $? 314 'QueryUserCurrencyWallets' test.out

#- 315 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'op8t4ETo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ziS0uphR' \
    --body '{"allowOverdraft": true, "amount": 56, "balanceOrigin": "Oculus", "balanceSource": "PAYMENT", "metadata": {"RxiSBD4J": {}, "LJalZBfH": {}, "ZLWf5vPJ": {}}, "reason": "sOzPsyFG"}' \
    > test.out 2>&1
eval_tap $? 315 'DebitUserWalletByCurrencyCode' test.out

#- 316 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'SmZPYm9M' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Zm5yBE1' \
    --limit '44' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 316 'ListUserCurrencyTransactions' test.out

#- 317 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'p9JvBazk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XE5Jockq' \
    --request '{"amount": 48, "debitBalanceSource": "TRADE", "metadata": {"X1lJa1lb": {}, "IpmQNgwW": {}, "UCTSgU0A": {}}, "reason": "a68WCiQf", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 317 'CheckBalance' test.out

#- 318 CheckWallet
eval_tap 0 318 'CheckWallet # SKIP deprecated' test.out

#- 319 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'iztKfLOz' \
    --namespace "$AB_NAMESPACE" \
    --userId '36Ag3L0Y' \
    --body '{"amount": 55, "expireAt": "1997-09-16T00:00:00Z", "metadata": {"zYLFyxkc": {}, "Br54Hoaw": {}, "nwcxzZpH": {}}, "origin": "Oculus", "reason": "TmJeSeEj", "source": "SELL_BACK"}' \
    > test.out 2>&1
eval_tap $? 319 'CreditUserWallet' test.out

#- 320 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'PrmNmwmB' \
    --namespace "$AB_NAMESPACE" \
    --userId '2TeFCwxe' \
    --request '{"amount": 14, "debitBalanceSource": "EXPIRATION", "metadata": {"PK1pJZ7P": {}, "Q0vJNIWk": {}, "dpZNasjC": {}}, "reason": "Xnz1GuCI", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 320 'DebitByWalletPlatform' test.out

#- 321 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '1ca9LWm5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHWQZPWV' \
    --body '{"amount": 96, "metadata": {"Te4HwAnP": {}, "BfhDugr4": {}, "h9WGpwte": {}}, "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 321 'PayWithUserWallet' test.out

#- 322 GetUserWallet
eval_tap 0 322 'GetUserWallet # SKIP deprecated' test.out

#- 323 DebitUserWallet
eval_tap 0 323 'DebitUserWallet # SKIP deprecated' test.out

#- 324 DisableUserWallet
eval_tap 0 324 'DisableUserWallet # SKIP deprecated' test.out

#- 325 EnableUserWallet
eval_tap 0 325 'EnableUserWallet # SKIP deprecated' test.out

#- 326 ListUserWalletTransactions
eval_tap 0 326 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 327 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l0dOFC85' \
    > test.out 2>&1
eval_tap $? 327 'ListViews' test.out

#- 328 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cUrVgtRG' \
    --body '{"displayOrder": 70, "localizations": {"Suy6iIWG": {"description": "LW5Vp14M", "localExt": {"hEjszlPW": {}, "11T7iurw": {}, "BxbqwNsd": {}}, "longDescription": "g7U6llOg", "title": "KKAMS86c"}, "9LdfwcP5": {"description": "6SDErwMU", "localExt": {"kULHurjg": {}, "z6Xbzi5O": {}, "bbxhrkLm": {}}, "longDescription": "6cfFGpRT", "title": "FCuE2I1X"}, "dFKUNgjq": {"description": "yROnxfeS", "localExt": {"1VemZhG6": {}, "rua3hHiH": {}, "dibXIQrm": {}}, "longDescription": "6xZRo63E", "title": "ocMfY4ob"}}, "name": "avWGIhtO"}' \
    > test.out 2>&1
eval_tap $? 328 'CreateView' test.out

#- 329 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'USHejCi4' \
    --storeId '2T8rmMeV' \
    > test.out 2>&1
eval_tap $? 329 'GetView' test.out

#- 330 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'v9kQfBTR' \
    --storeId 'zH1zBBAg' \
    --body '{"displayOrder": 68, "localizations": {"Bb18TP7d": {"description": "0unJ1cWy", "localExt": {"U9R9YOHu": {}, "VHOqIOnm": {}, "HrOau5ka": {}}, "longDescription": "a6YBA7ax", "title": "u1GsKD8h"}, "o8A6TiLk": {"description": "0OZEOsEE", "localExt": {"FIbit13u": {}, "oi6RcNCk": {}, "Xd9DHahK": {}}, "longDescription": "wEUh1ZUr", "title": "TQHl0lbZ"}, "vVDaWXgG": {"description": "y7DLFEoA", "localExt": {"2wiBOKgr": {}, "mRFzDpLP": {}, "pCTnyQ7X": {}}, "longDescription": "8rp1JZLN", "title": "lAT1w3aX"}}, "name": "d1niE0i0"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateView' test.out

#- 331 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'VVBydw4v' \
    --storeId 'pxRPpc5v' \
    > test.out 2>&1
eval_tap $? 331 'DeleteView' test.out

#- 332 QueryWallets
eval_tap 0 332 'QueryWallets # SKIP deprecated' test.out

#- 333 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 18, "expireAt": "1977-02-05T00:00:00Z", "metadata": {"T3MvfnQ4": {}, "yxfGEm1X": {}, "o8rvx5G5": {}}, "origin": "IOS", "reason": "qIAW1yGo", "source": "REFERRAL_BONUS"}, "currencyCode": "IT1v2rcz", "userIds": ["MfNrIuCu", "H1788nkt", "ORcFv0fu"]}, {"creditRequest": {"amount": 53, "expireAt": "1995-04-11T00:00:00Z", "metadata": {"SA3mtshg": {}, "dGAW0oel": {}, "VPgWXpTZ": {}}, "origin": "Other", "reason": "quuyMTLX", "source": "OTHER"}, "currencyCode": "ydkUVPSq", "userIds": ["AIg9yzig", "P7D1Q1Z3", "xZ8OhieR"]}, {"creditRequest": {"amount": 81, "expireAt": "1980-01-17T00:00:00Z", "metadata": {"95utwQca": {}, "mNrQx8vT": {}, "8xFWU4iA": {}}, "origin": "Nintendo", "reason": "u87VBnqi", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "az7m4Woe", "userIds": ["Gwg9SYIW", "JFNtJSg7", "T5benY9W"]}]' \
    > test.out 2>&1
eval_tap $? 333 'BulkCredit' test.out

#- 334 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "VQT9XjVM", "request": {"allowOverdraft": false, "amount": 18, "balanceOrigin": "Steam", "balanceSource": "IAP_REVOCATION", "metadata": {"nNVQjswn": {}, "mM7bo5Ud": {}, "uCWQOVYt": {}}, "reason": "FcMtBhTu"}, "userIds": ["AWBK9LTc", "FbOTcAXU", "Ua9lBedg"]}, {"currencyCode": "knbIMNF3", "request": {"allowOverdraft": false, "amount": 92, "balanceOrigin": "Steam", "balanceSource": "OTHER", "metadata": {"UbvOGBWA": {}, "h12XlRB5": {}, "JYFhA4gg": {}}, "reason": "PGr6MCyz"}, "userIds": ["3q8nTpSI", "FjbnE5Rr", "kQ4EYZKl"]}, {"currencyCode": "xXjklXJc", "request": {"allowOverdraft": false, "amount": 62, "balanceOrigin": "Oculus", "balanceSource": "PAYMENT", "metadata": {"SL9lIWa3": {}, "rmHOFsse": {}, "aS6MotAp": {}}, "reason": "lyxhYj64"}, "userIds": ["9BU9ciz0", "kp2SeMTn", "jeZ5ro82"]}]' \
    > test.out 2>&1
eval_tap $? 334 'BulkDebit' test.out

#- 335 GetWallet
eval_tap 0 335 'GetWallet # SKIP deprecated' test.out

#- 336 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'gP5IsxGV' \
    --end 'kVG4aKoN' \
    --start 'AQkHwEt4' \
    > test.out 2>&1
eval_tap $? 336 'SyncOrders' test.out

#- 337 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["aIYFSBLT", "1FlmiWs5", "WaL1FLv9"], "apiKey": "fHDgIhSI", "authoriseAsCapture": true, "blockedPaymentMethods": ["7XTvlR7o", "tUL2DPPy", "3oVXHi9y"], "clientKey": "ToAKT80w", "dropInSettings": "pJkumGmD", "liveEndpointUrlPrefix": "k8gSlIC9", "merchantAccount": "T28jEjbt", "notificationHmacKey": "BmxYBoGa", "notificationPassword": "TBlEyZlM", "notificationUsername": "iuhBsScc", "returnUrl": "blBmCz2w", "settings": "FqixYppO"}' \
    > test.out 2>&1
eval_tap $? 337 'TestAdyenConfig' test.out

#- 338 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Q7Nlha1g", "privateKey": "IL9w7hFM", "publicKey": "TvBfFfiF", "returnUrl": "YZ6CBS75"}' \
    > test.out 2>&1
eval_tap $? 338 'TestAliPayConfig' test.out

#- 339 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "9NKhKTr5", "secretKey": "ZU3bp83I"}' \
    > test.out 2>&1
eval_tap $? 339 'TestCheckoutConfig' test.out

#- 340 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'keNgNH2n' \
    > test.out 2>&1
eval_tap $? 340 'DebugMatchedPaymentMerchantConfig' test.out

#- 341 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "LalYB5db", "webhookSecretKey": "sqe1cdyg"}' \
    > test.out 2>&1
eval_tap $? 341 'TestNeonPayConfig' test.out

#- 342 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "R5NFI20J", "clientSecret": "5xP5DVmg", "returnUrl": "jkdpU8Lx", "webHookId": "x0rmRMXV"}' \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfig' test.out

#- 343 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["0naXNTJd", "dVoO4BhU", "YoojXQ5k"], "publishableKey": "EM7Xedbo", "secretKey": "VTdnJwyv", "webhookSecret": "mMmnq9ja"}' \
    > test.out 2>&1
eval_tap $? 343 'TestStripeConfig' test.out

#- 344 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "bCFdovsk", "key": "OmyOktYV", "mchid": "nZkyVN29", "returnUrl": "4osnBnqm"}' \
    > test.out 2>&1
eval_tap $? 344 'TestWxPayConfig' test.out

#- 345 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "xW0KGZK8", "flowCompletionUrl": "rV4srVhK", "merchantId": 7, "projectId": 35, "projectSecretKey": "Evx5UAXn"}' \
    > test.out 2>&1
eval_tap $? 345 'TestXsollaConfig' test.out

#- 346 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id '7m4SitBT' \
    > test.out 2>&1
eval_tap $? 346 'GetPaymentMerchantConfig1' test.out

#- 347 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'bguROgiu' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["40QXeYYc", "YjbNxOoV", "dDUpZ1Ar"], "apiKey": "UjaEvJSn", "authoriseAsCapture": false, "blockedPaymentMethods": ["QOOGktUC", "ydlC5ogp", "gDtGKjjZ"], "clientKey": "ho2rGIPW", "dropInSettings": "1Zn2ZYGg", "liveEndpointUrlPrefix": "Q30rV3Ox", "merchantAccount": "k1tP9Ltp", "notificationHmacKey": "T22OWdlF", "notificationPassword": "htB7HnjS", "notificationUsername": "LqMvpXxX", "returnUrl": "rKEB4alh", "settings": "N4C3OoFq"}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateAdyenConfig' test.out

#- 348 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'ksXhuVHs' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 348 'TestAdyenConfigById' test.out

#- 349 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'd4TvesYE' \
    --sandbox  \
    --validate  \
    --body '{"appId": "x9hf21Gv", "privateKey": "FfW5FZJJ", "publicKey": "KBEhReu4", "returnUrl": "yTuruzw3"}' \
    > test.out 2>&1
eval_tap $? 349 'UpdateAliPayConfig' test.out

#- 350 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Z08Xw2Hr' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 350 'TestAliPayConfigById' test.out

#- 351 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'I9Fthr5q' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "QJJsQHej", "secretKey": "LZzOUhnk"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateCheckoutConfig' test.out

#- 352 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'aECSGTCX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 352 'TestCheckoutConfigById' test.out

#- 353 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'Apc4dwya' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "HObmIi0s", "webhookSecretKey": "5U6sgKKC"}' \
    > test.out 2>&1
eval_tap $? 353 'UpdateNeonPayConfig' test.out

#- 354 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'TogqBgVW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 354 'TestNeonPayConfigById' test.out

#- 355 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'sV6ClHcU' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "4d9L6iiK", "clientSecret": "MrGRYFFF", "returnUrl": "ZSJgwFW5", "webHookId": "mICZhpyJ"}' \
    > test.out 2>&1
eval_tap $? 355 'UpdatePayPalConfig' test.out

#- 356 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'f62ks5Z7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfigById' test.out

#- 357 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'uua8CJHG' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Bf3EKrcD", "QM7XT1wq", "eMK2gTEO"], "publishableKey": "Vfsq10Sg", "secretKey": "S0U5m0m4", "webhookSecret": "ydT8EMBQ"}' \
    > test.out 2>&1
eval_tap $? 357 'UpdateStripeConfig' test.out

#- 358 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'UwxTBuG5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 358 'TestStripeConfigById' test.out

#- 359 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'UnkYIif9' \
    --validate  \
    --body '{"appId": "4H2QxhMi", "key": "1lBrDWjA", "mchid": "dhDECHO1", "returnUrl": "hbXMVmUD"}' \
    > test.out 2>&1
eval_tap $? 359 'UpdateWxPayConfig' test.out

#- 360 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '5aF5ol25' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 360 'UpdateWxPayConfigCert' test.out

#- 361 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'lSSDEVdr' \
    > test.out 2>&1
eval_tap $? 361 'TestWxPayConfigById' test.out

#- 362 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '2CDKMXLX' \
    --validate  \
    --body '{"apiKey": "R0Dh67iN", "flowCompletionUrl": "mUYfxaYJ", "merchantId": 74, "projectId": 21, "projectSecretKey": "UmVYgbcW"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateXsollaConfig' test.out

#- 363 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '7nd7YWMf' \
    > test.out 2>&1
eval_tap $? 363 'TestXsollaConfigById' test.out

#- 364 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'IsvahNK4' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 364 'UpdateXsollaUIConfig' test.out

#- 365 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '82' \
    --namespace "$AB_NAMESPACE" \
    --offset '83' \
    --region 'Ga1g2r7j' \
    > test.out 2>&1
eval_tap $? 365 'QueryPaymentProviderConfig' test.out

#- 366 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "QSoEkyRp", "region": "QQIv4xh9", "sandboxTaxJarApiToken": "TRCywXRG", "specials": ["PAYPAL", "STRIPE", "ALIPAY"], "taxJarApiToken": "C91vAhqa", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 366 'CreatePaymentProviderConfig' test.out

#- 367 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 367 'GetAggregatePaymentProviders' test.out

#- 368 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'p4RhjJCd' \
    > test.out 2>&1
eval_tap $? 368 'DebugMatchedPaymentProviderConfig' test.out

#- 369 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 369 'GetSpecialPaymentProviders' test.out

#- 370 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'szuegllL' \
    --body '{"aggregate": "ADYEN", "namespace": "Cmr9E01M", "region": "lZz1Q4C7", "sandboxTaxJarApiToken": "xNInSS7J", "specials": ["ALIPAY", "XSOLLA", "ADYEN"], "taxJarApiToken": "1KTdVAtc", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 370 'UpdatePaymentProviderConfig' test.out

#- 371 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'DNnuF6hl' \
    > test.out 2>&1
eval_tap $? 371 'DeletePaymentProviderConfig' test.out

#- 372 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 372 'GetPaymentTaxConfig' test.out

#- 373 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "wzBUeCkI", "taxJarApiToken": "V1YDjmDO", "taxJarEnabled": true, "taxJarProductCodesMapping": {"Od5wO9ay": "KY2Bt0Bg", "zllcz0r5": "43Lx9sML", "Aef1NXWT": "nNLsg5SZ"}}' \
    > test.out 2>&1
eval_tap $? 373 'UpdatePaymentTaxConfig' test.out

#- 374 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'IKQnX4o8' \
    --end 'FXZT9DoZ' \
    --start 'bQsgMULP' \
    > test.out 2>&1
eval_tap $? 374 'SyncPaymentOrders' test.out

#- 375 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'mN72AvlN' \
    --storeId 'EKHKU6hJ' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetRootCategories' test.out

#- 376 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'GbkMvBDJ' \
    --storeId 'dLZZZljP' \
    > test.out 2>&1
eval_tap $? 376 'DownloadCategories' test.out

#- 377 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'lu4Rjs70' \
    --namespace "$AB_NAMESPACE" \
    --language 'uug0eKZz' \
    --storeId 'lU1AxuNf' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetCategory' test.out

#- 378 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Ah60YrPe' \
    --namespace "$AB_NAMESPACE" \
    --language 'DLb0wwzS' \
    --storeId 'aYwkLWdJ' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetChildCategories' test.out

#- 379 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'HjCDhNmS' \
    --namespace "$AB_NAMESPACE" \
    --language 'cC5wev9g' \
    --storeId '8aORH4Wu' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetDescendantCategories' test.out

#- 380 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 380 'PublicListCurrencies' test.out

#- 381 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 381 'GeDLCDurableRewardShortMap' test.out

#- 382 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'GetAppleConfigVersion' test.out

#- 383 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 383 'GetIAPItemMapping' test.out

#- 384 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'bupsWIXp' \
    --region '1vp1DLoT' \
    --storeId 'pJOkLdD0' \
    --appId 'zsZtFj7x' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetItemByAppId' test.out

#- 385 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'XEJYB18L' \
    --categoryPath 'A5Nwro8w' \
    --features 'HpW1V1YX' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'BfiwmRLc' \
    --limit '62' \
    --offset '30' \
    --region 'gXNSWClL' \
    --sortBy 'createdAt,createdAt:asc,updatedAt' \
    --storeId 'Tc4cSHm4' \
    --tags '2NkVxp6W' \
    > test.out 2>&1
eval_tap $? 385 'PublicQueryItems' test.out

#- 386 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '9JSa5gfk' \
    --region 'GcIUTztJ' \
    --storeId 'TJkXMYNo' \
    --sku 'xr6cXgIU' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetItemBySku' test.out

#- 387 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'tPhbwg9t' \
    --storeId 'v7GHn289' \
    --itemIds 'Vw3wTIlQ' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetEstimatedPrice' test.out

#- 388 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'yWqwMK2r' \
    --region 'ElPsw92r' \
    --storeId 'E7L0hssm' \
    --itemIds 'I2mQxv2y' \
    > test.out 2>&1
eval_tap $? 388 'PublicBulkGetItems' test.out

#- 389 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["jzFsM37c", "uIECCJjl", "dKgQ4QeV"]}' \
    > test.out 2>&1
eval_tap $? 389 'PublicValidateItemPurchaseCondition' test.out

#- 390 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'APP' \
    --limit '83' \
    --offset '93' \
    --region 'JOZhFagj' \
    --storeId 'AagMv40D' \
    --keyword 'FVFfUKuh' \
    --language 'c3Yv05aG' \
    > test.out 2>&1
eval_tap $? 390 'PublicSearchItems' test.out

#- 391 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'MKvpi3IY' \
    --namespace "$AB_NAMESPACE" \
    --language 'Q4MjYYqe' \
    --region 'l0sSVPxe' \
    --storeId '13UUSZfi' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetApp' test.out

#- 392 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'bjJsREsh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetItemDynamicData' test.out

#- 393 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '40bG01p0' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'GykZQ2c7' \
    --populateBundle  \
    --region 'UfJK4poR' \
    --storeId 'WK7flbUa' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetItem' test.out

#- 394 GetPaymentCustomization
eval_tap 0 394 'GetPaymentCustomization # SKIP deprecated' test.out

#- 395 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "xlYJQAw8", "successUrl": "yK4QPYOD"}, "paymentOrderNo": "FxdbwGUi", "paymentProvider": "PAYPAL", "returnUrl": "cgLpMCMP", "ui": "RW3c0sA4", "zipCode": "D8tZFp5H"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetPaymentUrl' test.out

#- 396 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'FbaYBymq' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetPaymentMethods' test.out

#- 397 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3JzeAqLq' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUnpaidPaymentOrder' test.out

#- 398 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '816p44NF' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'gGYTvT8u' \
    --body '{"token": "XNeWmLUO"}' \
    > test.out 2>&1
eval_tap $? 398 'Pay' test.out

#- 399 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sN81iZEj' \
    > test.out 2>&1
eval_tap $? 399 'PublicCheckPaymentOrderPaidStatus' test.out

#- 400 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 's56dSxZP' \
    > test.out 2>&1
eval_tap $? 400 'GetPaymentPublicConfig' test.out

#- 401 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'vJfIhTaA' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetQRCode' test.out

#- 402 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'PaBh8icW' \
    --foreinginvoice '7XraZT98' \
    --invoiceId 'eNG8I5Xf' \
    --payload 'ASPff83Y' \
    --redirectResult 'DgGpnDjR' \
    --resultCode 'aH2yoFlZ' \
    --sessionId 'Dphrx7FE' \
    --status 'FUhpaA3h' \
    --token 'jcXD5b6C' \
    --type 'pM9kZ99o' \
    --userId 'cCQxyIlD' \
    --orderNo 'h6vrnUnc' \
    --paymentOrderNo 'yfLKj4eY' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl 'NZNfqquG' \
    > test.out 2>&1
eval_tap $? 402 'PublicNormalizePaymentReturnUrl' test.out

#- 403 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'SijdysAn' \
    --paymentOrderNo 'YgjFuJgp' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 403 'GetPaymentTaxValue' test.out

#- 404 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '5msf6Dxl' \
    > test.out 2>&1
eval_tap $? 404 'GetRewardByCode' test.out

#- 405 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '3oZJzeR4' \
    --limit '75' \
    --offset '12' \
    --sortBy 'namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 405 'QueryRewards1' test.out

#- 406 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Jki74UHX' \
    > test.out 2>&1
eval_tap $? 406 'GetReward1' test.out

#- 407 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 407 'PublicListStores' test.out

#- 408 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'jGD4Dgaa,Q2ujIQPK,tzvOm7NI' \
    --itemIds 'Tyny9Wxk,UZNdoeNL,jmHVjRP6' \
    --skus 't1WZ40gi,jhynfmHY,kpy1IrjW' \
    > test.out 2>&1
eval_tap $? 408 'PublicExistsAnyMyActiveEntitlement' test.out

#- 409 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'e1R8UIIg' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 410 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Bei8wYNN' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 411 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'Kp68e5Tc' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 412 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'JLGY8z7Q,ShBKvKaN,BR0yCu3s' \
    --itemIds 'Azs6hlkK,aToLAWQK,TSfkJDrE' \
    --skus 'bG7QgkRQ,2KEexSCh,eMCJKUUm' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetEntitlementOwnershipToken' test.out

#- 413 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "t9e7Ajnp", "language": "YBL-jiJB", "region": "TVBQrSVr"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncTwitchDropsEntitlement' test.out

#- 414 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '3zXIJeic' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyWallet' test.out

#- 415 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '11p2Soi7' \
    --body '{"epicGamesJwtToken": "lIwwidwD"}' \
    > test.out 2>&1
eval_tap $? 415 'SyncEpicGameDLC' test.out

#- 416 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYLral4y' \
    > test.out 2>&1
eval_tap $? 416 'SyncOculusDLC' test.out

#- 417 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0GwYhsN' \
    --body '{"serviceLabel": 6}' \
    > test.out 2>&1
eval_tap $? 417 'PublicSyncPsnDlcInventory' test.out

#- 418 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'FnPrYF0l' \
    --body '{"serviceLabels": [31, 54, 95]}' \
    > test.out 2>&1
eval_tap $? 418 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 419 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'CaSmpDN1' \
    --body '{"appId": "QIa8LvqE", "steamId": "2qlXabhV"}' \
    > test.out 2>&1
eval_tap $? 419 'SyncSteamDLC' test.out

#- 420 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'iTSb4xMK' \
    --body '{"xstsToken": "LDJcfaH7"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncXboxDLC' test.out

#- 421 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWaYHjEX' \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'dlzDPwFC' \
    --features 'j8ss6uES,EUJJAfTi,BXagr7X7' \
    --itemId 'Qn8SVgr5,owQjuKi9,G3LXb7Yp' \
    --limit '48' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 421 'PublicQueryUserEntitlements' test.out

#- 422 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'y89QyqJ3' \
    --appId '6ffaIBaV' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUserAppEntitlementByAppId' test.out

#- 423 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'mEe6lrwD' \
    --limit '98' \
    --offset '93' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserEntitlementsByAppType' test.out

#- 424 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'f59YTb6U' \
    --availablePlatformOnly  \
    --ids 'uSYvbW4G,F0LuIkor,Hny7kxoU' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetUserEntitlementsByIds' test.out

#- 425 PublicGetUserEntitlementByItemId
eval_tap 0 425 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 426 PublicGetUserEntitlementBySku
eval_tap 0 426 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 427 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eYNSH9QL' \
    --endDate 'ka2DLHHa' \
    --entitlementClazz 'APP' \
    --limit '23' \
    --offset '99' \
    --startDate 'd3NY5wQF' \
    > test.out 2>&1
eval_tap $? 427 'PublicUserEntitlementHistory' test.out

#- 428 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3iUgyZt' \
    --appIds 'Rag4AAAD,Mb9hDrA5,JteLHAhx' \
    --itemIds 'TDWs17it,b9R1JyIH,utLU4Y7s' \
    --skus 'MydnN7yn,9fG2aWuq,UF7DYdxB' \
    > test.out 2>&1
eval_tap $? 428 'PublicExistsAnyUserActiveEntitlement' test.out

#- 429 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '0FEgE3ky' \
    --appId 'Pgop9Mcw' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 430 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiZ4YMJC' \
    --entitlementClazz 'MEDIA' \
    --itemId 'EFx02f4K' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 431 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'orFMABEm' \
    --ids '1KHEev1v,9BhnbqD0,nJg7Ttog' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 432 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'P6gkMo6V' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'WwgsOUBI' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 433 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'q60KhvHu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fzavq0D8' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserEntitlement' test.out

#- 434 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'jWubXzf3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJAg1QbY' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["KNS7TW6L", "TH7xWd0F", "WX2P5jsw"], "requestId": "T0pJmaQC", "useCount": 89}' \
    > test.out 2>&1
eval_tap $? 434 'PublicConsumeUserEntitlement' test.out

#- 435 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 't0509wVj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HgHF7Lxd' \
    --body '{"requestId": "QsCpO1KC", "useCount": 81}' \
    > test.out 2>&1
eval_tap $? 435 'PublicSellUserEntitlement' test.out

#- 436 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'Ju2KmI8K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yp9A3h2W' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 436 'PublicSplitUserEntitlement' test.out

#- 437 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'FwAKajVW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bl4f6buk' \
    --body '{"entitlementId": "XOu8bKDA", "metadata": {"operationSource": "INVENTORY"}, "useCount": 29}' \
    > test.out 2>&1
eval_tap $? 437 'PublicTransferUserEntitlement' test.out

#- 438 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dO8kna6t' \
    --body '{"code": "ER9uneBv", "language": "OT-767", "region": "MnJv3FjI"}' \
    > test.out 2>&1
eval_tap $? 438 'PublicRedeemCode' test.out

#- 439 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5GLPB1Fh' \
    --body '{"excludeOldTransactions": true, "language": "EPu", "productId": "hzgbAUeE", "receiptData": "1KaSE6gc", "region": "88ohyFgf", "transactionId": "HSY94aBA"}' \
    > test.out 2>&1
eval_tap $? 439 'PublicFulfillAppleIAPItem' test.out

#- 440 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hz9BxOji' \
    --body '{"epicGamesJwtToken": "Nk8vKdql"}' \
    > test.out 2>&1
eval_tap $? 440 'SyncEpicGamesInventory' test.out

#- 441 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ziX6LFhI' \
    --body '{"autoAck": false, "autoConsume": false, "language": "YNf_UdWw", "orderId": "NhA7OzvR", "packageName": "yrE2y4hV", "productId": "cHgQZHUN", "purchaseTime": 42, "purchaseToken": "37G2Ho5P", "region": "GcIIs86f", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 441 'PublicFulfillGoogleIAPItem' test.out

#- 442 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '8Tzs6Nmf' \
    > test.out 2>&1
eval_tap $? 442 'SyncOculusConsumableEntitlements' test.out

#- 443 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '3YkNYgcH' \
    --body '{"currencyCode": "JbNpoWLu", "price": 0.3323856336106902, "productId": "jwp3RDa3", "serviceLabel": 94}' \
    > test.out 2>&1
eval_tap $? 443 'PublicReconcilePlayStationStore' test.out

#- 444 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5GlaEwt' \
    --body '{"currencyCode": "WTRbdM82", "price": 0.488127305512703, "productId": "YawxTtau", "serviceLabels": [49, 91, 12]}' \
    > test.out 2>&1
eval_tap $? 444 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 445 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6EUnj274' \
    --body '{"appId": "p5Pak5Ys", "currencyCode": "S5h69MAW", "language": "mZ-087", "price": 0.9031137845846979, "productId": "ALh4kLNR", "region": "DwinkDEF", "steamId": "mC7Kw35X"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncSteamInventory' test.out

#- 446 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'zGYRLW1Z' \
    --activeOnly  \
    --groupId 'FwwPXD9m' \
    --limit '11' \
    --offset '37' \
    --productId '9nUQ8Lap' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserThirdPartySubscription' test.out

#- 447 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8oVBcZ7' \
    --body '{"gameId": "MG52otdi", "language": "mQOz-Ofcg_aD", "region": "mAh165u5"}' \
    > test.out 2>&1
eval_tap $? 447 'SyncTwitchDropsEntitlement1' test.out

#- 448 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1Nf7kUo9' \
    --body '{"currencyCode": "Zetur7RU", "price": 0.05996244314949106, "productId": "hHD8r7U5", "xstsToken": "0COLpgCl"}' \
    > test.out 2>&1
eval_tap $? 448 'SyncXboxInventory' test.out

#- 449 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'e61hrACO' \
    --discounted  \
    --itemId 'JnhyTDYt' \
    --limit '92' \
    --offset '61' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 449 'PublicQueryUserOrders' test.out

#- 450 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2ZGUVIUv' \
    --body '{"currencyCode": "8YVnhUUN", "discountCodes": ["HXUohOWp", "bh0cscKL", "STKWb9kb"], "discountedPrice": 15, "ext": {"eeC3GzHw": {}, "hgXuIGSX": {}, "UH3EnkjJ": {}}, "itemId": "Bvizudel", "language": "Vcek_YwuC", "price": 51, "quantity": 71, "region": "1IWTCB7c", "returnUrl": "f64urBnb", "sectionId": "GwogYoWz"}' \
    > test.out 2>&1
eval_tap $? 450 'PublicCreateUserOrder' test.out

#- 451 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9EXxwXd' \
    --body '{"currencyCode": "DPqVMfzo", "discountCodes": ["YBhNgR56", "VDG2q1Zz", "vSL2jSRG"], "discountedPrice": 100, "itemId": "z9JV9ReF", "price": 57, "quantity": 50}' \
    > test.out 2>&1
eval_tap $? 451 'PublicPreviewOrderPrice' test.out

#- 452 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fyhcjb70' \
    --userId '0ahO7u54' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserOrder' test.out

#- 453 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'h4fZuVQb' \
    --userId 'wkfmBMiO' \
    > test.out 2>&1
eval_tap $? 453 'PublicCancelUserOrder' test.out

#- 454 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hh6bttdg' \
    --userId 'BpWusQqe' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserOrderHistories' test.out

#- 455 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PC9cDsaf' \
    --userId '3u6Euoz8' \
    > test.out 2>&1
eval_tap $? 455 'PublicDownloadUserOrderReceipt' test.out

#- 456 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '2IGPBXc2' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetPaymentAccounts' test.out

#- 457 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'rcsQamjG' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'dql3Pq76' \
    > test.out 2>&1
eval_tap $? 457 'PublicDeletePaymentAccount' test.out

#- 458 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'oU1UMfMp' \
    --autoCalcEstimatedPrice  \
    --language 'Jz5HcJK6' \
    --region 'KmMTyYxr' \
    --storeId 'mByAGNLx' \
    --viewId 'XcqyTXKc' \
    > test.out 2>&1
eval_tap $? 458 'PublicListActiveSections' test.out

#- 459 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNApaEmu' \
    --chargeStatus 'SETUP' \
    --itemId 'bXc7gIGr' \
    --limit '57' \
    --offset '38' \
    --sku 'O08quNR9' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 459 'PublicQueryUserSubscriptions' test.out

#- 460 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTVB483f' \
    --body '{"currencyCode": "4ccup7j9", "itemId": "KnxrQ9Lw", "language": "vYXL_dCnh", "region": "4BDe90uO", "returnUrl": "xLhVKImq", "source": "lSNyDfip"}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSubscribeSubscription' test.out

#- 461 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9YHaQjuz' \
    --itemId 'X0X0pSed' \
    > test.out 2>&1
eval_tap $? 461 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 462 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ymtu8u2h' \
    --userId '7zIztOe0' \
    > test.out 2>&1
eval_tap $? 462 'PublicGetUserSubscription' test.out

#- 463 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YtYTtDFW' \
    --userId 'dqidoXzv' \
    > test.out 2>&1
eval_tap $? 463 'PublicChangeSubscriptionBillingAccount' test.out

#- 464 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mkqkdN6O' \
    --userId 'LvAiBV7B' \
    --body '{"immediate": false, "reason": "J2iv5sg1"}' \
    > test.out 2>&1
eval_tap $? 464 'PublicCancelSubscription' test.out

#- 465 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wK6y1ctD' \
    --userId 'sST4kdQ9' \
    --excludeFree  \
    --limit '28' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 465 'PublicGetUserSubscriptionBillingHistories' test.out

#- 466 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'lneRozIo' \
    --language 'tAdvu7ms' \
    --storeId 'aRh7p1Jr' \
    > test.out 2>&1
eval_tap $? 466 'PublicListViews' test.out

#- 467 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'taemTPlS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E2kgEO8D' \
    > test.out 2>&1
eval_tap $? 467 'PublicGetWallet' test.out

#- 468 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'tJplEGnx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XSw6ODYs' \
    --limit '80' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 468 'PublicListUserWalletTransactions' test.out

#- 469 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 469 'PublicGetMyDLCContent' test.out

#- 470 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Zo0llIMN' \
    --limit '0' \
    --offset '31' \
    --startTime '98hk54tx' \
    --state 'FULFILL_FAILED' \
    --transactionId '8s6mdr5R' \
    --userId 'LiKC6ZHH' \
    > test.out 2>&1
eval_tap $? 470 'QueryFulfillments' test.out

#- 471 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'QrjLeU22' \
    --baseAppId 'U11YMyin' \
    --categoryPath 'U43IdNyf' \
    --features 'KhAwfYYo' \
    --includeSubCategoryItem  \
    --itemName 'fksMl0C0' \
    --itemStatus 'INACTIVE' \
    --itemType 'EXTENSION,EXTENSION,BUNDLE' \
    --limit '5' \
    --offset '87' \
    --region 'n0WsEsRW' \
    --sectionExclusive  \
    --sortBy 'createdAt:asc,createdAt:desc' \
    --storeId 'k2TAxrKh' \
    --tags 'h9D8XZlN' \
    --targetNamespace 'gjnkpb6f' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 471 'QueryItemsV2' test.out

#- 472 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '5Be4hYaG' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 472 'ImportStore1' test.out

#- 473 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IBle3j2Y' \
    --body '{"itemIds": ["RHt5zuUn", "k8yE7tgR", "bVLZlboR"]}' \
    > test.out 2>&1
eval_tap $? 473 'ExportStore1' test.out

#- 474 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZ36JDDM' \
    --body '{"entitlementCollectionId": "6Kq40md0", "entitlementOrigin": "Epic", "metadata": {"G1lxFuJs": {}, "00FN0FoU": {}, "tRG3sFGf": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "fVLsGK4M", "namespace": "OMIsW2dS"}, "item": {"itemId": "SGXyRrx9", "itemName": "edaLGbuL", "itemSku": "ECYOH1cR", "itemType": "ICx4xWGn"}, "quantity": 77, "type": "ITEM"}, {"currency": {"currencyCode": "uVVopWEi", "namespace": "FyvKjwgO"}, "item": {"itemId": "3CEzmd8D", "itemName": "uNsxoUOV", "itemSku": "6LZU3PTD", "itemType": "SJd3nbvy"}, "quantity": 4, "type": "CURRENCY"}, {"currency": {"currencyCode": "LPNswEYi", "namespace": "2DeJ8uqP"}, "item": {"itemId": "eTuDlQ4l", "itemName": "tNKaINDI", "itemSku": "J4V9tlaA", "itemType": "7QmfYEqG"}, "quantity": 82, "type": "ITEM"}], "source": "IAP", "transactionId": "w7dwqLii"}' \
    > test.out 2>&1
eval_tap $? 474 'FulfillRewardsV2' test.out

#- 475 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'lwKiZENd' \
    --userId 'YoxjXcTv' \
    --body '{"items": [{"duration": 77, "endDate": "1978-05-20T00:00:00Z", "entitlementCollectionId": "NHIjc1jR", "entitlementOrigin": "IOS", "itemId": "shhqv28T", "itemSku": "NLfUP40S", "language": "rs5ZPpEB", "metadata": {"PvGH8B5u": {}, "hL7wDDUX": {}, "IPlMou0d": {}}, "orderNo": "2Th0ZTlo", "origin": "IOS", "quantity": 7, "region": "fHaTJqmv", "source": "SELL_BACK", "startDate": "1993-07-11T00:00:00Z", "storeId": "KFk8b34d"}, {"duration": 0, "endDate": "1999-07-02T00:00:00Z", "entitlementCollectionId": "UJNIZbpG", "entitlementOrigin": "Playstation", "itemId": "dHw61o0T", "itemSku": "HBXjmXz4", "language": "nUedPFrD", "metadata": {"7Av3zxJV": {}, "9IbDgX7d": {}, "7JbCOP2B": {}}, "orderNo": "MFnIQCbY", "origin": "Playstation", "quantity": 76, "region": "xJS3qZiy", "source": "ORDER_REVOCATION", "startDate": "1986-12-01T00:00:00Z", "storeId": "gSa1eRRD"}, {"duration": 90, "endDate": "1984-06-02T00:00:00Z", "entitlementCollectionId": "mqATgAdo", "entitlementOrigin": "GooglePlay", "itemId": "ygZ6qjmk", "itemSku": "Oqkn30Om", "language": "4aGolaLu", "metadata": {"d43M8BsJ": {}, "hpHdqtIO": {}, "TGAbW8Mv": {}}, "orderNo": "Lj4hJAn9", "origin": "Oculus", "quantity": 5, "region": "koiOaZtX", "source": "PURCHASE", "startDate": "1994-01-23T00:00:00Z", "storeId": "sSzgs0x7"}]}' \
    > test.out 2>&1
eval_tap $? 475 'FulfillItems' test.out

#- 476 RetryFulfillItems
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'PsoT7n9R' \
    --userId 'P2G2LgFm' \
    > test.out 2>&1
eval_tap $? 476 'RetryFulfillItems' test.out

#- 477 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'KCtA7eoi' \
    --userId 'JMObALEW' \
    > test.out 2>&1
eval_tap $? 477 'RevokeItems' test.out

#- 478 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '41BcpLNe' \
    --body '{"transactionId": "tfNo3GsD"}' \
    > test.out 2>&1
eval_tap $? 478 'V2PublicFulfillAppleIAPItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
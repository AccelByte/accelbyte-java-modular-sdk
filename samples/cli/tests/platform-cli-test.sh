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
    --id 'fzmVhUO2' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '7G9mRkXR' \
    --body '{"grantDays": "6KFP2eFJ"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'ing5YC3A' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'kjjM4IyR' \
    --body '{"grantDays": "mk06FMom"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "fFXAu3Vo", "dryRun": false, "fulfillmentUrl": "zfuN7qvk", "itemType": "INGAMEITEM", "purchaseConditionUrl": "JFhbuInY"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'dFdMb7fO' \
    --itemType 'CODE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'oMz1Cr0Z' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'PSVvIxx2' \
    --body '{"clazz": "kCCxfWuI", "dryRun": true, "fulfillmentUrl": "O3j2CgLL", "purchaseConditionUrl": "0OEe4cfy"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '6AtPaBKG' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --name 'SIP7tF6K' \
    --offset '13' \
    --tag 'GNYUSuKX' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9nkX66G2", "discountConfig": {"categories": [{"categoryPath": "Z19mafWP", "includeSubCategories": false}, {"categoryPath": "jpHcICnk", "includeSubCategories": false}, {"categoryPath": "noPnBxgn", "includeSubCategories": true}], "currencyCode": "OPD06qmQ", "currencyNamespace": "anQTfYXt", "discountAmount": 16, "discountPercentage": 29, "discountType": "PERCENTAGE", "items": [{"itemId": "yCcQXcpp", "itemName": "IUNK7pFt"}, {"itemId": "QM4yRAbJ", "itemName": "j7SvbnD7"}, {"itemId": "ilM05xsZ", "itemName": "7lDSiJJM"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 62, "itemId": "SEXp5G1r", "itemName": "1eMSn8j0", "quantity": 40}, {"extraSubscriptionDays": 18, "itemId": "vETc2O4h", "itemName": "t8a4GVc0", "quantity": 24}, {"extraSubscriptionDays": 85, "itemId": "oE0EawfA", "itemName": "YpMZeK5j", "quantity": 0}], "maxRedeemCountPerCampaignPerUser": 41, "maxRedeemCountPerCode": 30, "maxRedeemCountPerCodePerUser": 85, "maxSaleCount": 67, "name": "aZW6wcIe", "redeemEnd": "1971-12-08T00:00:00Z", "redeemStart": "1999-12-16T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["PFSRWorG", "VUqNGwCb", "mNM7csFV"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '75QPj0d6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'R69HJfHp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "OXsOW3YK", "discountConfig": {"categories": [{"categoryPath": "sJTm6LR2", "includeSubCategories": true}, {"categoryPath": "Lo0IlJB1", "includeSubCategories": true}, {"categoryPath": "2SzaQ8pJ", "includeSubCategories": true}], "currencyCode": "vP3bshmP", "currencyNamespace": "cOpHS081", "discountAmount": 98, "discountPercentage": 18, "discountType": "PERCENTAGE", "items": [{"itemId": "QjkWOb6w", "itemName": "9IM4gW45"}, {"itemId": "ipNw3sFe", "itemName": "kPWJpFUV"}, {"itemId": "pJc7MwIf", "itemName": "50JvYPnD"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 58, "itemId": "6265TWdo", "itemName": "tQTf9XGP", "quantity": 82}, {"extraSubscriptionDays": 79, "itemId": "5AXDijIF", "itemName": "F1sapY5w", "quantity": 10}, {"extraSubscriptionDays": 51, "itemId": "o25A54rY", "itemName": "pR3NR3VK", "quantity": 40}], "maxRedeemCountPerCampaignPerUser": 53, "maxRedeemCountPerCode": 77, "maxRedeemCountPerCodePerUser": 34, "maxSaleCount": 28, "name": "5YoGznxQ", "redeemEnd": "1980-08-27T00:00:00Z", "redeemStart": "1984-07-18T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["Xt2p5LwI", "dHfveZNJ", "1MYwcbx0"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId '2wyypNAd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "9iovbIkJ", "oldName": "J2qc6Iiv"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'sw68ZTsW' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'QDgzom81' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'rk33Phpp' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["ENTITLEMENT", "IAP", "REWARD"]}' \
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
    --body '{"appConfig": {"appName": "mMTbvkoG"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "TKQ1rkMv"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "OQ3jCGdz"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "sCjWY6ug"}, "extendType": "CUSTOM"}' \
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
    --storeId 'PhBJq5FE' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '3XUudJNT' \
    --body '{"categoryPath": "gdhsZVHU", "localizationDisplayNames": {"ao1BZa41": "3DpayoiS", "uTdrWNWc": "1ajyZbFh", "1ns8rTxp": "c3AMzA59"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '6gK2kdtb' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'k6Oyy0uV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wmNvBQLZ' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '8f6EJuYb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xoc7FYJt' \
    --body '{"localizationDisplayNames": {"hmmzKQaI": "t3k8vZI3", "eXbnuSsS": "rkAq7mHr", "X4xfzTnF": "zHRGUXa8"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'Lz6mDVEg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D8ffG3gM' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'AVMA1YEg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w1mEKlX4' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'RYlyi3vM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oQo5qDpl' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'FWuSQMyx' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'F9iyetyX' \
    --batchNo '29,9,39' \
    --code 'urf3hDhw' \
    --limit '49' \
    --offset '98' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'vAtMGuyf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "bCGh2Yhk", "codeValue": "VsAgbA2w", "quantity": 94}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'ct0Nt7to' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'o01uEptf' \
    --batchNo '53,45,47' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'WPGIN4QT' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'BXoU4DWr' \
    --batchNo '100,32,8' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'EpFSwFfi' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'loSvTgsg' \
    --batchNo '50,73,0' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'kqqngN86' \
    --namespace "$AB_NAMESPACE" \
    --code 'Vr9PZaVb' \
    --limit '14' \
    --offset '91' \
    --userId 'egh8h7sE' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'LH7iri7h' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'VfxvH4FE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'XYq059LD' \
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
    --body '{"currencyCode": "4uxxNQLM", "currencySymbol": "d7KrDmcS", "currencyType": "REAL", "decimals": 59, "localizationDescriptions": {"SslN0W5j": "kziXvRjS", "6cQ1DLiM": "WPqEgyyz", "KzezbZ9w": "mkW4S6ub"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'HR3sM21t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"Chhum22X": "H7Cbr6oE", "IjVqaOb0": "sd3rDrol", "xv2eafNL": "FUd9oRM1"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'MbYayaSV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'JZGoSnTn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'F6nYGros' \
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
    --body '{"data": [{"id": "uIcba8ZT", "rewards": [{"currency": {"currencyCode": "tZVeKrMb", "namespace": "osc5XIrC"}, "item": {"itemId": "njMGGy1G", "itemName": "m0jmqDyo", "itemSku": "0KGfTlyp", "itemType": "V2ncJVPB"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "AZHeBV38", "namespace": "YYOC2vCX"}, "item": {"itemId": "HiYjGdPb", "itemName": "GGGlG9Kq", "itemSku": "FOVrsjXh", "itemType": "aSqH3UOQ"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "0gs4iDNA", "namespace": "FMvMlXyU"}, "item": {"itemId": "REw4ikUu", "itemName": "cVg9itAG", "itemSku": "rsUiZbgg", "itemType": "xsmTDIhn"}, "quantity": 3, "type": "ITEM"}]}, {"id": "so8VvsWl", "rewards": [{"currency": {"currencyCode": "ay9SYoWk", "namespace": "CeFRicWh"}, "item": {"itemId": "p9eVdReL", "itemName": "EnTK0CiI", "itemSku": "R5KQsrqn", "itemType": "CrYaNI3s"}, "quantity": 72, "type": "CURRENCY"}, {"currency": {"currencyCode": "XSyXgoi2", "namespace": "3MBHppj3"}, "item": {"itemId": "GH6ul023", "itemName": "a355T9RT", "itemSku": "9b7hpZ7O", "itemType": "Qj493Uin"}, "quantity": 49, "type": "CURRENCY"}, {"currency": {"currencyCode": "A9Pd3arV", "namespace": "05h6NeZg"}, "item": {"itemId": "bEOl0aDo", "itemName": "MHaOobC9", "itemSku": "ViM2H0sk", "itemType": "I6YSEEBI"}, "quantity": 30, "type": "CURRENCY"}]}, {"id": "qIUDxBbY", "rewards": [{"currency": {"currencyCode": "R1xjUrwv", "namespace": "FE3M6Ath"}, "item": {"itemId": "7NagIL1U", "itemName": "BipUXRxS", "itemSku": "w0r1PafT", "itemType": "79SROQ4p"}, "quantity": 30, "type": "CURRENCY"}, {"currency": {"currencyCode": "gIkfHnfY", "namespace": "rr1esKEt"}, "item": {"itemId": "OSGfDbZJ", "itemName": "wEaDPpVD", "itemSku": "goi3uF36", "itemType": "G6wp7ABE"}, "quantity": 31, "type": "CURRENCY"}, {"currency": {"currencyCode": "g2RHDZdZ", "namespace": "PJNjYSTP"}, "item": {"itemId": "mxQssx9w", "itemName": "YO93IYS3", "itemSku": "R7glB1Ge", "itemType": "h3SP9fgI"}, "quantity": 36, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"dVgSviyz": "VVxCZOIx", "Hzyctnwn": "mkqqQKoD", "rynuMhC2": "fvtEvx6N"}}, {"platform": "PSN", "platformDlcIdMap": {"Y0rgn5LP": "cyQn5yhd", "hNaoBVW9": "0lj8EnhZ", "1iI0v9Md": "9I1BsciC"}}, {"platform": "OCULUS", "platformDlcIdMap": {"qTSeIZcv": "98IVwr55", "v0Isrc3G": "ulUPHXH8", "hYHsv3UX": "z36yE0Bs"}}]}' \
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
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '2TAHQSsu' \
    --itemId 'DuJzy93O,bLAWxtvY,GWOtBSSI' \
    --limit '83' \
    --offset '14' \
    --origin 'Nintendo' \
    --userId 'vnDi20zm' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'c9h3Il5J,HB3mrpEN,miNcNtSX' \
    --limit '59' \
    --offset '42' \
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
    --body '{"entitlementGrantList": [{"collectionId": "T2rAAP0E", "endDate": "1991-01-19T00:00:00Z", "grantedCode": "TRVTdP7P", "itemId": "paLpBoQt", "itemNamespace": "CnijD20A", "language": "pgbY_xlWM", "metadata": {"VLh30ISP": {}, "1OiY6YM3": {}, "pBbCxrcb": {}}, "origin": "IOS", "quantity": 64, "region": "upUDxed4", "source": "REFERRAL_BONUS", "startDate": "1972-12-05T00:00:00Z", "storeId": "FjzG4wtB"}, {"collectionId": "yQI5Pedo", "endDate": "1973-08-27T00:00:00Z", "grantedCode": "yW4igBuK", "itemId": "xW2ZBtcV", "itemNamespace": "uxtiOtYn", "language": "XOE_IDfh_Jk", "metadata": {"1cXLvss9": {}, "eG3MV7U4": {}, "ZUdx4pSK": {}}, "origin": "Nintendo", "quantity": 98, "region": "Xm7YGLhe", "source": "PROMOTION", "startDate": "1979-09-18T00:00:00Z", "storeId": "AbJHzghO"}, {"collectionId": "JMfxcruC", "endDate": "1992-10-05T00:00:00Z", "grantedCode": "YUgOH5qP", "itemId": "iRXS9Tq9", "itemNamespace": "eYzy2Jwx", "language": "KrP", "metadata": {"JjAKh2FT": {}, "X550sX5d": {}, "QssCxBgd": {}}, "origin": "GooglePlay", "quantity": 40, "region": "rkM7LVWS", "source": "OTHER", "startDate": "1983-04-24T00:00:00Z", "storeId": "7dss47G7"}], "userIds": ["u3JE2BLD", "wzHKbjwW", "99BF94vN"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["HHvkHD2M", "wNUzmytj", "icWPSj6b"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'ShJpPogs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '12' \
    --status 'SUCCESS' \
    --userId 'FO9T9wSv' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'R08a64ND' \
    --eventType 'OTHER' \
    --externalOrderId 'aKwS5o01' \
    --limit '17' \
    --offset '32' \
    --startTime 'BKoKXzP1' \
    --status 'FAIL' \
    --userId '4XvE77Gn' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "mfcKDZSL", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 81, "clientTransactionId": "WEoyRm3d"}, {"amountConsumed": 78, "clientTransactionId": "qDMRQWJl"}, {"amountConsumed": 44, "clientTransactionId": "gZ12NDGf"}], "entitlementId": "ZvQdXFEC", "usageCount": 26}, {"clientTransaction": [{"amountConsumed": 54, "clientTransactionId": "iV7wwmKb"}, {"amountConsumed": 10, "clientTransactionId": "5BuICdHR"}, {"amountConsumed": 74, "clientTransactionId": "jga7KpSv"}], "entitlementId": "VJSdCJeZ", "usageCount": 42}, {"clientTransaction": [{"amountConsumed": 38, "clientTransactionId": "8a4igQG3"}, {"amountConsumed": 35, "clientTransactionId": "8AdxP30n"}, {"amountConsumed": 94, "clientTransactionId": "24Y0K7NG"}], "entitlementId": "mVoHaFmP", "usageCount": 83}], "purpose": "1SxYUKcP"}, "originalTitleName": "ROLUnpDH", "paymentProductSKU": "OyeIqcY5", "purchaseDate": "obN5LBLb", "sourceOrderItemId": "5Lwb4Vjw", "titleName": "TD4i8iju"}, "eventDomain": "b5eltDbt", "eventSource": "2ITtzFXz", "eventType": "gbSvSVmf", "eventVersion": 70, "id": "Fkdc9fQx", "timestamp": "4emUbcvq"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "bd6o7icq", "eventState": "mIBxFUn3", "lineItemId": "omLliDgR", "orderId": "8z7d5Wb8", "productId": "EwNnQQ0B", "productType": "Ij7AyWJT", "purchasedDate": "KCMlih7Q", "sandboxId": "J0O25mnw", "skuId": "lOddXj2S", "subscriptionData": {"consumedDurationInDays": 3, "dateTime": "qzLZwuVb", "durationInDays": 86, "recurrenceId": "fnLcK8G4"}}, "datacontenttype": "XaVdWIel", "id": "TUQblNHu", "source": "T69dQeX2", "specVersion": "kbZHnb47", "subject": "7aewGZ5l", "time": "eRM1fVx6", "traceparent": "bqgStNnI", "type": "H0uPPjYv"}' \
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
    --body '{"appAppleId": 40, "bundleId": "S4s3au8J", "issuerId": "HYmmmg7d", "keyId": "3nsr4RTo", "password": "YwCLnprO", "version": "V2"}' \
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
    --body '{"sandboxId": "z48oIoB3"}' \
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
    --body '{"applicationName": "KAWWmXdv", "notificationTokenAudience": "K2vWmMgJ", "notificationTokenEmail": "rBLN0ujU", "packageName": "cF26xfJI", "serviceAccountId": "HUYlcQAE"}' \
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
    --body '{"data": [{"itemIdentity": "xNLrPgFO", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"QcUTRBna": "zmxvLw1C", "WzpPoecc": "84x2lB3v", "U6HtHw3N": "Kqn5ojBX"}}, {"itemIdentity": "oni0118i", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"dzVh1piq": "9hFN5n9i", "WEz8yzma": "pDPbaVnL", "1snXHBrO": "JaYnLC8B"}}, {"itemIdentity": "EW1iL97A", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"RKza9J3C": "hU0p2wAr", "l4FgAqtT": "eSvq4f0a", "sB97iGPH": "ho8EeyQL"}}]}' \
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
    --body '{"appId": "Ntaw2iUA", "appSecret": "q6YVQksp"}' \
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
    --body '{"backOfficeServerClientId": "UiqNjIoH", "backOfficeServerClientSecret": "R56JPXWb", "enableStreamJob": false, "environment": "m474pZC2", "streamName": "7MF3zaSy", "streamPartnerName": "E6Kw6y55"}' \
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
    --body '{"backOfficeServerClientId": "vn1ECyQh", "backOfficeServerClientSecret": "wZyKMS2o", "enableStreamJob": false, "environment": "qrCRGpjV", "streamName": "wWaa1g9E", "streamPartnerName": "wY3cXwtt"}' \
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
    --body '{"appId": "iTq2P83O", "env": "SANDBOX", "publisherAuthenticationKey": "OOsYuQGb", "syncMode": "TRANSACTION"}' \
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
    --body '{"clientId": "StoTZiaW", "clientSecret": "wNdpOUir", "organizationId": "uu1xNkZm"}' \
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
    --body '{"enableClawback": true, "entraAppClientId": "F4mQ5BRg", "entraAppClientSecret": "H2dHmHln", "entraTenantId": "Z8a0zuaS", "relyingPartyCert": "pRqM56v7"}' \
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
    --password 'N8BIaYpZ' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cU3qKTDb' \
    --externalId 'KvLcwpRY' \
    --limit '31' \
    --offset '14' \
    --source 'OCULUS' \
    --startDate 'IhOe7ZDZ' \
    --status 'ERROR' \
    --type 'njnpf2Bx' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '92' \
    --orderId 'KwRHFqQC' \
    --steamId 'm38GM2Vn' \
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
    --body '{"env": "LIVE", "lastTime": "1974-11-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminResetSteamJobTime' test.out

#- 110 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'nte5OHLh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminRefundIAPOrder' test.out

#- 111 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '43' \
    --orderId 'LV9HFUeI' \
    --processStatus 'IGNORED' \
    --steamId 'Hz9jtCh2' \
    > test.out 2>&1
eval_tap $? 111 'QuerySteamReportHistories' test.out

#- 112 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'i8nbnPxj' \
    --limit '35' \
    --offset '66' \
    --platform 'PLAYSTATION' \
    --productId 'OpFViJz6' \
    --userId 'nwVaLvBm' \
    > test.out 2>&1
eval_tap $? 112 'QueryThirdPartySubscription' test.out

#- 113 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'wHVvdTEz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetIAPOrderConsumeDetails' test.out

#- 114 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'IOcpzbfd' \
    --feature 'tMV0cQCb' \
    --itemId 'kubcaYFO' \
    --itemType 'COINS' \
    --startTime 'avdbr8b1' \
    > test.out 2>&1
eval_tap $? 114 'DownloadInvoiceDetails' test.out

#- 115 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'nsLxoO0Z' \
    --feature 'xwzke84E' \
    --itemId 'zaqyjF2N' \
    --itemType 'EXTENSION' \
    --startTime 'ugkW6hBd' \
    > test.out 2>&1
eval_tap $? 115 'GenerateInvoiceSummary' test.out

#- 116 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CUGfJijW' \
    --body '{"categoryPath": "7ldoYyoC", "targetItemId": "ioFmpyWx", "targetNamespace": "bKWhY6lo"}' \
    > test.out 2>&1
eval_tap $? 116 'SyncInGameItem' test.out

#- 117 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PFzBWFb3' \
    --body '{"appId": "LHjqLpOS", "appType": "DLC", "baseAppId": "7DR8sqCL", "boothName": "iCMrEbET", "categoryPath": "m4nF4EXo", "clazz": "hDmHIQhc", "displayOrder": 58, "entitlementType": "CONSUMABLE", "ext": {"2z6wJfum": {}, "8XnCJ3IS": {}, "StnkAAOq": {}}, "features": ["6gKEgSTe", "muXR1faa", "OKuBR9gA"], "flexible": false, "images": [{"as": "2kkI3ISu", "caption": "Y3utPCmf", "height": 67, "imageUrl": "RiKb5cNf", "smallImageUrl": "Tf5YKHay", "width": 52}, {"as": "6tH0VixM", "caption": "eEF0PQQI", "height": 63, "imageUrl": "CBVsrkas", "smallImageUrl": "sOjEMbhA", "width": 19}, {"as": "okx1XbdP", "caption": "MyTVLJqs", "height": 7, "imageUrl": "IoClmbpQ", "smallImageUrl": "CJ9KwQBZ", "width": 29}], "inventoryConfig": {"customAttributes": {"e8XmL4sd": {}, "Iv7QutM9": {}, "qgrxlxln": {}}, "serverCustomAttributes": {"i2aZZ7fa": {}, "12v9yDYV": {}, "yrrQTqsp": {}}, "slotUsed": 66}, "itemIds": ["F27shKCc", "zj3vzkeK", "iKo71hPI"], "itemQty": {"VjCTWLaj": 14, "zelIuAyU": 74, "D1CKItKP": 91}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"0tzZdFI2": {"description": "iQ9kcAG4", "localExt": {"srPIOgkm": {}, "Tyn5TSgL": {}, "R8zYK3lp": {}}, "longDescription": "O39sPgtg", "title": "av4nMHgE"}, "N4fS0OI1": {"description": "EIJ8IjR3", "localExt": {"nNgk7GbB": {}, "pPdQMnrk": {}, "TmTYZVFU": {}}, "longDescription": "DItIEAqc", "title": "uTBDjh8A"}, "3gZoZtgc": {"description": "AhFpZGEr", "localExt": {"vP2EWb4p": {}, "oc6F2F89": {}, "tPKUnC2u": {}}, "longDescription": "AU8JEGZD", "title": "DJZ2yKwA"}}, "lootBoxConfig": {"rewardCount": 43, "rewards": [{"lootBoxItems": [{"count": 62, "duration": 41, "endDate": "1971-05-11T00:00:00Z", "itemId": "F0GVm0lS", "itemSku": "zZQ1KZ3G", "itemType": "bf8opPNa"}, {"count": 4, "duration": 31, "endDate": "1979-09-30T00:00:00Z", "itemId": "75EVXEFm", "itemSku": "aZIZovJ7", "itemType": "tFmP3c14"}, {"count": 67, "duration": 1, "endDate": "1971-09-16T00:00:00Z", "itemId": "jJMorHvR", "itemSku": "FQqC5Blh", "itemType": "F3GyUPoA"}], "name": "W8oaI9vO", "odds": 0.14447241006844758, "type": "PROBABILITY_GROUP", "weight": 54}, {"lootBoxItems": [{"count": 44, "duration": 27, "endDate": "1975-02-04T00:00:00Z", "itemId": "wkXkxQ8m", "itemSku": "38LoxWgn", "itemType": "lEnHMSwK"}, {"count": 45, "duration": 76, "endDate": "1995-05-13T00:00:00Z", "itemId": "HUSV95Br", "itemSku": "zMUT3zg8", "itemType": "MT3GgGJy"}, {"count": 11, "duration": 48, "endDate": "1978-04-07T00:00:00Z", "itemId": "QIwaMzap", "itemSku": "b3mMds9Q", "itemType": "xJP9h4kE"}], "name": "QbfIK04m", "odds": 0.17552914350663007, "type": "PROBABILITY_GROUP", "weight": 75}, {"lootBoxItems": [{"count": 28, "duration": 76, "endDate": "1983-07-17T00:00:00Z", "itemId": "LyxXykBg", "itemSku": "Bg9HhY0h", "itemType": "E0Jrl1GP"}, {"count": 49, "duration": 77, "endDate": "1979-05-01T00:00:00Z", "itemId": "XemxUd8k", "itemSku": "liBlAGI6", "itemType": "G13mlCuQ"}, {"count": 8, "duration": 61, "endDate": "1973-08-08T00:00:00Z", "itemId": "ZgHtmPz5", "itemSku": "lE5p66Op", "itemType": "ihN1jAxR"}], "name": "eQJOmRwj", "odds": 0.40363342026546234, "type": "REWARD", "weight": 14}], "rollFunction": "DEFAULT"}, "maxCount": 71, "maxCountPerUser": 65, "name": "ESY8jdxA", "optionBoxConfig": {"boxItems": [{"count": 10, "duration": 67, "endDate": "1972-12-27T00:00:00Z", "itemId": "JOl2PggU", "itemSku": "OgVZCuJ1", "itemType": "96mumUsR"}, {"count": 76, "duration": 14, "endDate": "1986-08-19T00:00:00Z", "itemId": "om4yIgOX", "itemSku": "mQLa9sJ6", "itemType": "cuPJyEri"}, {"count": 4, "duration": 67, "endDate": "1980-05-05T00:00:00Z", "itemId": "UDOMHfQX", "itemSku": "VO5ZzaiS", "itemType": "7r2TRZqF"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 89, "fixedTrialCycles": 98, "graceDays": 32}, "regionData": {"0Ov8DSua": [{"currencyCode": "bTVqkQB2", "currencyNamespace": "fAqKQ30y", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1991-07-18T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1985-06-05T00:00:00Z", "expireAt": "1974-09-13T00:00:00Z", "price": 96, "purchaseAt": "1989-03-06T00:00:00Z", "trialPrice": 15}, {"currencyCode": "Xr5ng3kB", "currencyNamespace": "HRasSZuZ", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1989-11-09T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1975-10-16T00:00:00Z", "expireAt": "1977-03-28T00:00:00Z", "price": 64, "purchaseAt": "1985-12-29T00:00:00Z", "trialPrice": 6}, {"currencyCode": "NsZ6X9sZ", "currencyNamespace": "DIgqWnk3", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1987-11-26T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1980-01-22T00:00:00Z", "expireAt": "1984-01-12T00:00:00Z", "price": 3, "purchaseAt": "1990-08-17T00:00:00Z", "trialPrice": 81}], "OTnXcV8r": [{"currencyCode": "aEThrnwv", "currencyNamespace": "9JSwHaLJ", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-27T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1971-01-10T00:00:00Z", "expireAt": "1976-03-21T00:00:00Z", "price": 13, "purchaseAt": "1975-10-18T00:00:00Z", "trialPrice": 14}, {"currencyCode": "ZhjE6Oci", "currencyNamespace": "7a7bQDws", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1979-08-01T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1985-10-12T00:00:00Z", "expireAt": "1974-02-05T00:00:00Z", "price": 1, "purchaseAt": "1984-09-16T00:00:00Z", "trialPrice": 58}, {"currencyCode": "qDo8P3WH", "currencyNamespace": "5TUHmAQe", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1995-06-07T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1979-05-27T00:00:00Z", "expireAt": "1983-11-16T00:00:00Z", "price": 67, "purchaseAt": "1999-01-29T00:00:00Z", "trialPrice": 57}], "ojzBJlya": [{"currencyCode": "FQVuHKC6", "currencyNamespace": "eFBIfBUE", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1983-08-28T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1989-12-06T00:00:00Z", "expireAt": "1991-02-24T00:00:00Z", "price": 82, "purchaseAt": "1980-04-27T00:00:00Z", "trialPrice": 38}, {"currencyCode": "ahKykaoP", "currencyNamespace": "SCGhmknw", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1974-06-25T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1992-06-25T00:00:00Z", "expireAt": "1985-10-12T00:00:00Z", "price": 64, "purchaseAt": "1976-05-27T00:00:00Z", "trialPrice": 23}, {"currencyCode": "ojAWIAtV", "currencyNamespace": "IGA7wuY2", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1991-08-20T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1998-12-08T00:00:00Z", "expireAt": "1983-08-01T00:00:00Z", "price": 85, "purchaseAt": "1978-04-27T00:00:00Z", "trialPrice": 3}]}, "saleConfig": {"currencyCode": "2LCxL3cF", "price": 35}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "PT4iwOhc", "stackable": false, "status": "INACTIVE", "tags": ["mE1kUm7n", "ZhgmvbuQ", "pHErlBl2"], "targetCurrencyCode": "Gr8gLJEW", "targetNamespace": "2fUnzM1U", "thumbnailUrl": "OoxDhKLF", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 117 'CreateItem' test.out

#- 118 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hlBpkoG9' \
    --appId 'DST5ldmv' \
    > test.out 2>&1
eval_tap $? 118 'GetItemByAppId' test.out

#- 119 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'TuNmJIEQ' \
    --baseAppId 'OFC0Tl4h' \
    --categoryPath 'YHB7Dt7g' \
    --features 'BJw5p0Of' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --limit '11' \
    --offset '41' \
    --region '7VAXsj6w' \
    --sortBy 'displayOrder:asc,createdAt,displayOrder:desc' \
    --storeId 'AnTNjYWK' \
    --tags 'rcDLrwEk' \
    --targetNamespace 'sbRljqSw' \
    > test.out 2>&1
eval_tap $? 119 'QueryItems' test.out

#- 120 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'srvqe47G,23mvnaZV,t7zl6jFF' \
    > test.out 2>&1
eval_tap $? 120 'ListBasicItemsByFeatures' test.out

#- 121 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2SHN4a2q' \
    --itemIds 'sYvd04qx' \
    > test.out 2>&1
eval_tap $? 121 'GetItems' test.out

#- 122 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '997P41Nm' \
    --sku 'UNkS0hEn' \
    > test.out 2>&1
eval_tap $? 122 'GetItemBySku' test.out

#- 123 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'UA1xWbvv' \
    --populateBundle  \
    --region 'cK2WGRjf' \
    --storeId 'utfLESsv' \
    --sku 'O6ZlQKNj' \
    > test.out 2>&1
eval_tap $? 123 'GetLocaleItemBySku' test.out

#- 124 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '7zYvh5qW' \
    --region 'jRk0j6AU' \
    --storeId '7ZhVotMV' \
    --itemIds 'JyXAn3RI' \
    --userId 'F3yqhFkG' \
    > test.out 2>&1
eval_tap $? 124 'GetEstimatedPrice' test.out

#- 125 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'CQyRtseB' \
    --sku 'YPqb77Xe' \
    > test.out 2>&1
eval_tap $? 125 'GetItemIdBySku' test.out

#- 126 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'J3mxkL1g,yzluwlHK,rIj3wyhC' \
    --storeId 'kk7RDIQU' \
    > test.out 2>&1
eval_tap $? 126 'GetBulkItemIdBySkus' test.out

#- 127 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ur2vyvMi' \
    --region 'ou2JVTYr' \
    --storeId 'lWHTbVJc' \
    --itemIds 'HBLcANnr' \
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
    --platform 'Mdtwl4eS' \
    --userId 'RcXTuuor' \
    --body '{"itemIds": ["3F0Zcdqv", "d3t92H7c", "KuPFkq8u"]}' \
    > test.out 2>&1
eval_tap $? 129 'ValidateItemPurchaseCondition' test.out

#- 130 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LA2d3k1g' \
    --body '{"changes": [{"itemIdentities": ["FEIewfIv", "cP5e3dgQ", "VwdXpk3z"], "itemIdentityType": "ITEM_SKU", "regionData": {"iF7WTefW": [{"currencyCode": "SlKSnP9D", "currencyNamespace": "vKNekUsQ", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1975-12-23T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1974-01-05T00:00:00Z", "discountedPrice": 19, "expireAt": "1999-04-14T00:00:00Z", "price": 85, "purchaseAt": "1997-11-24T00:00:00Z", "trialPrice": 24}, {"currencyCode": "mNZfDAVu", "currencyNamespace": "p0kge5wf", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1996-04-03T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-08-06T00:00:00Z", "discountedPrice": 71, "expireAt": "1984-11-24T00:00:00Z", "price": 38, "purchaseAt": "1993-01-29T00:00:00Z", "trialPrice": 39}, {"currencyCode": "iw2SZgQW", "currencyNamespace": "UsCsmqF1", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1973-11-10T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1988-03-26T00:00:00Z", "discountedPrice": 26, "expireAt": "1974-11-06T00:00:00Z", "price": 60, "purchaseAt": "1982-01-25T00:00:00Z", "trialPrice": 37}], "ceLhSG8m": [{"currencyCode": "lHdNsNZ1", "currencyNamespace": "ZgDl5jBa", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1973-01-06T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1975-03-08T00:00:00Z", "discountedPrice": 8, "expireAt": "1989-06-14T00:00:00Z", "price": 4, "purchaseAt": "1996-02-07T00:00:00Z", "trialPrice": 65}, {"currencyCode": "MLI1ma1M", "currencyNamespace": "0645Z71H", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1999-01-22T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1979-09-07T00:00:00Z", "discountedPrice": 11, "expireAt": "1982-12-16T00:00:00Z", "price": 100, "purchaseAt": "1999-10-23T00:00:00Z", "trialPrice": 2}, {"currencyCode": "owKPRaNc", "currencyNamespace": "ZIgWsSe1", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1998-04-20T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1999-12-19T00:00:00Z", "discountedPrice": 93, "expireAt": "1983-05-18T00:00:00Z", "price": 49, "purchaseAt": "1992-06-28T00:00:00Z", "trialPrice": 83}], "CGztWiYK": [{"currencyCode": "gNfRV4Dr", "currencyNamespace": "GPfgoI2E", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1979-12-30T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1992-07-19T00:00:00Z", "discountedPrice": 50, "expireAt": "1993-08-04T00:00:00Z", "price": 78, "purchaseAt": "1978-02-01T00:00:00Z", "trialPrice": 91}, {"currencyCode": "eoLQlIv0", "currencyNamespace": "tt7hMlFa", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1986-01-26T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1985-06-29T00:00:00Z", "discountedPrice": 49, "expireAt": "1997-08-25T00:00:00Z", "price": 3, "purchaseAt": "1990-03-09T00:00:00Z", "trialPrice": 60}, {"currencyCode": "EPiTBQdp", "currencyNamespace": "qIVBx8RA", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1994-09-06T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1989-01-28T00:00:00Z", "discountedPrice": 77, "expireAt": "1996-01-27T00:00:00Z", "price": 63, "purchaseAt": "1975-03-30T00:00:00Z", "trialPrice": 63}]}}, {"itemIdentities": ["lYAVayGC", "geA6g1TN", "V99vvmuy"], "itemIdentityType": "ITEM_ID", "regionData": {"EoKay1Z7": [{"currencyCode": "ERiBqhT2", "currencyNamespace": "19tNx44d", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1987-11-17T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1986-07-27T00:00:00Z", "discountedPrice": 81, "expireAt": "1982-06-10T00:00:00Z", "price": 43, "purchaseAt": "1989-06-01T00:00:00Z", "trialPrice": 50}, {"currencyCode": "Kc3nKcNv", "currencyNamespace": "e1hawRME", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1976-03-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1997-06-22T00:00:00Z", "discountedPrice": 95, "expireAt": "1971-06-05T00:00:00Z", "price": 28, "purchaseAt": "1975-10-28T00:00:00Z", "trialPrice": 38}, {"currencyCode": "U07qy7yt", "currencyNamespace": "l9Tcg270", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1971-08-22T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1999-03-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1999-05-26T00:00:00Z", "price": 24, "purchaseAt": "1984-07-13T00:00:00Z", "trialPrice": 30}], "6XMaGBFT": [{"currencyCode": "T6KAmGRY", "currencyNamespace": "rAjhGwBa", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1981-05-18T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1975-07-24T00:00:00Z", "discountedPrice": 49, "expireAt": "1972-05-09T00:00:00Z", "price": 35, "purchaseAt": "1993-05-29T00:00:00Z", "trialPrice": 94}, {"currencyCode": "CJNgj4ED", "currencyNamespace": "lDjHNBPT", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1993-11-21T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1986-11-29T00:00:00Z", "discountedPrice": 84, "expireAt": "1973-04-05T00:00:00Z", "price": 25, "purchaseAt": "1977-05-25T00:00:00Z", "trialPrice": 86}, {"currencyCode": "28GIHl91", "currencyNamespace": "qdXDkwYA", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1999-07-16T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1986-08-15T00:00:00Z", "discountedPrice": 34, "expireAt": "1971-06-20T00:00:00Z", "price": 33, "purchaseAt": "1974-01-02T00:00:00Z", "trialPrice": 97}], "xBztoyw9": [{"currencyCode": "dn7J40dz", "currencyNamespace": "3A3CmOA2", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1999-09-26T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1981-11-02T00:00:00Z", "discountedPrice": 18, "expireAt": "1988-11-26T00:00:00Z", "price": 39, "purchaseAt": "1998-10-03T00:00:00Z", "trialPrice": 43}, {"currencyCode": "EvAYn7gN", "currencyNamespace": "xO09h3C7", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1973-03-30T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1979-05-24T00:00:00Z", "discountedPrice": 12, "expireAt": "1978-04-17T00:00:00Z", "price": 10, "purchaseAt": "1980-05-16T00:00:00Z", "trialPrice": 32}, {"currencyCode": "ejDbR3ch", "currencyNamespace": "h8TQCcfB", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1986-12-18T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1996-05-23T00:00:00Z", "discountedPrice": 90, "expireAt": "1998-03-29T00:00:00Z", "price": 16, "purchaseAt": "1974-07-02T00:00:00Z", "trialPrice": 46}]}}, {"itemIdentities": ["fHdmIIqt", "0mxCrple", "6gEfW228"], "itemIdentityType": "ITEM_SKU", "regionData": {"OxkyeJW3": [{"currencyCode": "Tze3Siop", "currencyNamespace": "3kM6q9VJ", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1986-02-28T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1984-04-04T00:00:00Z", "discountedPrice": 57, "expireAt": "1996-09-10T00:00:00Z", "price": 83, "purchaseAt": "1991-04-08T00:00:00Z", "trialPrice": 58}, {"currencyCode": "PIShKc0y", "currencyNamespace": "syTekuQx", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1996-01-31T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1980-03-05T00:00:00Z", "discountedPrice": 33, "expireAt": "1992-06-30T00:00:00Z", "price": 68, "purchaseAt": "1990-08-28T00:00:00Z", "trialPrice": 19}, {"currencyCode": "SRbHve6G", "currencyNamespace": "LXaUn1Oy", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1976-07-21T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1977-06-05T00:00:00Z", "discountedPrice": 15, "expireAt": "1975-08-25T00:00:00Z", "price": 45, "purchaseAt": "1994-12-14T00:00:00Z", "trialPrice": 63}], "cwtUITCx": [{"currencyCode": "pS5M18HR", "currencyNamespace": "6aWqmax8", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1978-09-23T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1982-02-28T00:00:00Z", "discountedPrice": 29, "expireAt": "1987-05-05T00:00:00Z", "price": 76, "purchaseAt": "1974-08-09T00:00:00Z", "trialPrice": 72}, {"currencyCode": "gFGK8xKt", "currencyNamespace": "gNhFr0Gi", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1975-11-04T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1996-07-15T00:00:00Z", "discountedPrice": 70, "expireAt": "1992-06-17T00:00:00Z", "price": 77, "purchaseAt": "1998-10-17T00:00:00Z", "trialPrice": 40}, {"currencyCode": "AUDesDls", "currencyNamespace": "yMp1lDiv", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1991-10-28T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1981-12-29T00:00:00Z", "discountedPrice": 95, "expireAt": "1990-10-23T00:00:00Z", "price": 67, "purchaseAt": "1974-06-11T00:00:00Z", "trialPrice": 56}], "ftwTSL44": [{"currencyCode": "iRhgamaI", "currencyNamespace": "6Ggprt6v", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1987-10-11T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1992-05-07T00:00:00Z", "discountedPrice": 100, "expireAt": "1986-03-17T00:00:00Z", "price": 87, "purchaseAt": "1975-01-22T00:00:00Z", "trialPrice": 92}, {"currencyCode": "KgP4j5ES", "currencyNamespace": "xyGBwo4z", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1996-08-16T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1997-04-13T00:00:00Z", "discountedPrice": 45, "expireAt": "1980-11-11T00:00:00Z", "price": 96, "purchaseAt": "1990-08-19T00:00:00Z", "trialPrice": 11}, {"currencyCode": "eKNv910k", "currencyNamespace": "R1LDy3dB", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1987-06-17T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1981-12-23T00:00:00Z", "discountedPrice": 84, "expireAt": "1980-10-08T00:00:00Z", "price": 39, "purchaseAt": "1998-07-05T00:00:00Z", "trialPrice": 94}]}}]}' \
    > test.out 2>&1
eval_tap $? 130 'BulkUpdateRegionData' test.out

#- 131 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '98' \
    --offset '23' \
    --sortBy 'eraEqx66' \
    --storeId 'pTFkt3T4' \
    --keyword 'oGqcV3jF' \
    --language 'GPwtGXxG' \
    > test.out 2>&1
eval_tap $? 131 'SearchItems' test.out

#- 132 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '81' \
    --offset '100' \
    --sortBy 'name:desc,updatedAt,displayOrder' \
    --storeId 'FjCiaO6P' \
    > test.out 2>&1
eval_tap $? 132 'QueryUncategorizedItems' test.out

#- 133 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'SHprt0C1' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Zj7Dxgju' \
    > test.out 2>&1
eval_tap $? 133 'GetItem' test.out

#- 134 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'n8IlF1Js' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OdPG3ajm' \
    --body '{"appId": "GdoXrDcJ", "appType": "DLC", "baseAppId": "kILU64Zi", "boothName": "kqjFLV9R", "categoryPath": "rNtzrYYp", "clazz": "diJsO3pq", "displayOrder": 0, "entitlementType": "CONSUMABLE", "ext": {"tkADA95e": {}, "6Z9qW1K9": {}, "ZA93XboY": {}}, "features": ["wjevc8n7", "zxNw9pnP", "QMOa9nu3"], "flexible": false, "images": [{"as": "FI50OoaZ", "caption": "wFubjLJd", "height": 85, "imageUrl": "M8QwDWRT", "smallImageUrl": "oDHarHSo", "width": 95}, {"as": "PTxC3bj8", "caption": "bQvWljyZ", "height": 99, "imageUrl": "EeXBstZ3", "smallImageUrl": "e61hebbf", "width": 40}, {"as": "Jsd30y3P", "caption": "TYI69Hzm", "height": 57, "imageUrl": "ruVBSk4c", "smallImageUrl": "Eh3J4ZMg", "width": 87}], "inventoryConfig": {"customAttributes": {"ddR7XBJG": {}, "hTgh8G2O": {}, "97YDGIie": {}}, "serverCustomAttributes": {"82qtcEZe": {}, "rXKiT1FG": {}, "2kOyJ0Mj": {}}, "slotUsed": 88}, "itemIds": ["PSfSJ2ZU", "t9KMjUdc", "dYxUvPcF"], "itemQty": {"I3YJ9L2l": 28, "rAOPEw7Y": 87, "hnYt9ZaO": 5}, "itemType": "MEDIA", "listable": true, "localizations": {"4taHOYnv": {"description": "iXjPCYAV", "localExt": {"uP0ex7iL": {}, "FpSWCi5C": {}, "YjAz4uS7": {}}, "longDescription": "Vc6Hj1LI", "title": "qGCCWVYX"}, "dMgAw4Yh": {"description": "W9gXaF5K", "localExt": {"nPBy7rnx": {}, "MXhQ9EEh": {}, "tdT1WHlE": {}}, "longDescription": "TsUYhVu1", "title": "pL5SeAJJ"}, "VFf6ur7X": {"description": "oD7Bqc7n", "localExt": {"uIYSVuM0": {}, "wKv9wKBh": {}, "Miw29OCZ": {}}, "longDescription": "iSUzRm3s", "title": "NYgRGhd4"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 84, "duration": 5, "endDate": "1975-12-09T00:00:00Z", "itemId": "RA1t2u8m", "itemSku": "4FnXAYdP", "itemType": "VCprgyXn"}, {"count": 22, "duration": 51, "endDate": "1972-02-26T00:00:00Z", "itemId": "PFwfWJMA", "itemSku": "AmF116i9", "itemType": "3E2VLiPx"}, {"count": 67, "duration": 61, "endDate": "1987-03-06T00:00:00Z", "itemId": "1nYlQ9YN", "itemSku": "ynLuxo8U", "itemType": "p5buHJec"}], "name": "BBEi4hPZ", "odds": 0.38677521465950937, "type": "REWARD", "weight": 56}, {"lootBoxItems": [{"count": 36, "duration": 88, "endDate": "1991-06-01T00:00:00Z", "itemId": "FP5JXo7Q", "itemSku": "S1vFCfhs", "itemType": "oIu1Fcgj"}, {"count": 52, "duration": 48, "endDate": "1994-06-25T00:00:00Z", "itemId": "DhcAGDun", "itemSku": "AWcEBwP2", "itemType": "8IkLg5xt"}, {"count": 39, "duration": 78, "endDate": "1979-11-01T00:00:00Z", "itemId": "1n3YT5u2", "itemSku": "sakM8rgS", "itemType": "7l0EQJm1"}], "name": "V3sQBPpv", "odds": 0.23932554182182786, "type": "PROBABILITY_GROUP", "weight": 68}, {"lootBoxItems": [{"count": 70, "duration": 97, "endDate": "1974-05-15T00:00:00Z", "itemId": "Ykjok0hh", "itemSku": "oG2LBjHm", "itemType": "TYyoFSbY"}, {"count": 96, "duration": 87, "endDate": "1981-10-08T00:00:00Z", "itemId": "nhUmHH8c", "itemSku": "d7ySoAEN", "itemType": "PQlLWxpL"}, {"count": 78, "duration": 52, "endDate": "1993-09-03T00:00:00Z", "itemId": "Yey2ernE", "itemSku": "z3a86HH2", "itemType": "lUCcXQY7"}], "name": "ztMbJU8H", "odds": 0.9217035607539654, "type": "REWARD_GROUP", "weight": 53}], "rollFunction": "DEFAULT"}, "maxCount": 28, "maxCountPerUser": 89, "name": "vMYUvsBm", "optionBoxConfig": {"boxItems": [{"count": 62, "duration": 46, "endDate": "1971-08-31T00:00:00Z", "itemId": "G5wJQMc7", "itemSku": "G8zMOY01", "itemType": "UWEtaQUo"}, {"count": 81, "duration": 14, "endDate": "1989-08-10T00:00:00Z", "itemId": "A76iXOi1", "itemSku": "bZMkogyI", "itemType": "WaHVjZUj"}, {"count": 1, "duration": 4, "endDate": "1998-05-15T00:00:00Z", "itemId": "7GiwdZVO", "itemSku": "hD88rVDr", "itemType": "HbNcnisa"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 4, "fixedTrialCycles": 97, "graceDays": 31}, "regionData": {"homoW3K5": [{"currencyCode": "GcYqmbSa", "currencyNamespace": "idbskCTR", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1991-07-29T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1997-06-21T00:00:00Z", "expireAt": "1987-05-12T00:00:00Z", "price": 29, "purchaseAt": "1990-04-10T00:00:00Z", "trialPrice": 75}, {"currencyCode": "vNlmgK0I", "currencyNamespace": "pIsm4Cga", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1979-12-16T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1998-01-03T00:00:00Z", "expireAt": "1974-06-13T00:00:00Z", "price": 65, "purchaseAt": "1979-01-14T00:00:00Z", "trialPrice": 99}, {"currencyCode": "8Cvhc4uF", "currencyNamespace": "YCCMr5Ud", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1987-03-28T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-11-09T00:00:00Z", "expireAt": "1991-10-03T00:00:00Z", "price": 67, "purchaseAt": "1973-02-07T00:00:00Z", "trialPrice": 54}], "q1DmFxGP": [{"currencyCode": "xu71fYbx", "currencyNamespace": "qR93Ebyr", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1990-03-22T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1977-01-20T00:00:00Z", "expireAt": "1976-04-15T00:00:00Z", "price": 54, "purchaseAt": "1990-10-13T00:00:00Z", "trialPrice": 59}, {"currencyCode": "JSUuSASw", "currencyNamespace": "mnyfyyAw", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1986-03-09T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1999-03-05T00:00:00Z", "expireAt": "1980-01-22T00:00:00Z", "price": 71, "purchaseAt": "1979-04-02T00:00:00Z", "trialPrice": 57}, {"currencyCode": "1eGdyqGi", "currencyNamespace": "oCGgjgBV", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1988-07-21T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1990-07-07T00:00:00Z", "expireAt": "1973-10-23T00:00:00Z", "price": 43, "purchaseAt": "1980-04-01T00:00:00Z", "trialPrice": 76}], "QkwaJrPb": [{"currencyCode": "sIjKf2w0", "currencyNamespace": "MEr4DB89", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1971-04-19T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1976-05-17T00:00:00Z", "expireAt": "1995-01-29T00:00:00Z", "price": 68, "purchaseAt": "1973-10-30T00:00:00Z", "trialPrice": 100}, {"currencyCode": "pgTfeIbF", "currencyNamespace": "w74wIow4", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1994-10-10T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1982-09-02T00:00:00Z", "expireAt": "1983-11-12T00:00:00Z", "price": 88, "purchaseAt": "1984-08-14T00:00:00Z", "trialPrice": 94}, {"currencyCode": "mKYgC1nB", "currencyNamespace": "8s2n8GPL", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1985-08-16T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1985-08-01T00:00:00Z", "expireAt": "1978-09-30T00:00:00Z", "price": 55, "purchaseAt": "1973-11-23T00:00:00Z", "trialPrice": 12}]}, "saleConfig": {"currencyCode": "GRnWzM1H", "price": 29}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "2hFyu1M9", "stackable": true, "status": "ACTIVE", "tags": ["douz6Vbk", "KMyLrxZQ", "RgHNcVB2"], "targetCurrencyCode": "gej0MTVc", "targetNamespace": "noSAH08v", "thumbnailUrl": "x52o0azY", "useCount": 72}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateItem' test.out

#- 135 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'JSWSD39k' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,DLC,DLC' \
    --force  \
    --storeId 'mI6RdKU1' \
    > test.out 2>&1
eval_tap $? 135 'DeleteItem' test.out

#- 136 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Rcb27DCm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 22, "orderNo": "nvV0zFMt"}' \
    > test.out 2>&1
eval_tap $? 136 'AcquireItem' test.out

#- 137 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'QSRHK9Pl' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'PJXmZuuy' \
    > test.out 2>&1
eval_tap $? 137 'GetApp' test.out

#- 138 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Xl7RIAah' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ssyXGpE1' \
    --body '{"carousel": [{"alt": "nKEnN8MO", "previewUrl": "qC0CtnWx", "thumbnailUrl": "hg4vF0UL", "type": "video", "url": "M3cswwLU", "videoSource": "youtube"}, {"alt": "ebMhTqQu", "previewUrl": "UC3DMHmg", "thumbnailUrl": "StTvO4GW", "type": "video", "url": "A97clz7N", "videoSource": "youtube"}, {"alt": "sB1NCLRe", "previewUrl": "HWh3VO1h", "thumbnailUrl": "oY80NcKm", "type": "image", "url": "IXXJ131h", "videoSource": "generic"}], "developer": "sbegugi9", "forumUrl": "9O1oBgj1", "genres": ["FreeToPlay", "Simulation", "FreeToPlay"], "localizations": {"R03baKdP": {"announcement": "d30ouyy6", "slogan": "q8lO7C3Y"}, "9xqryiG3": {"announcement": "sw50ScUl", "slogan": "BwYOUKmw"}, "83ANHpei": {"announcement": "233R35rt", "slogan": "O9DJ2BBz"}}, "platformRequirements": {"WpOhzLG7": [{"additionals": "wPbHlyuc", "directXVersion": "bzmyMrBu", "diskSpace": "seyO9Vk5", "graphics": "rBvPGZpj", "label": "52TFEwoq", "osVersion": "dRfO1nHN", "processor": "8Zd8wJ22", "ram": "o1CyirB4", "soundCard": "YkmDQq0j"}, {"additionals": "BKeeaVB7", "directXVersion": "AF7xYHMh", "diskSpace": "a3HuyBBc", "graphics": "ELj6wNjW", "label": "3HY10V4m", "osVersion": "OIVCwdCc", "processor": "YkBH35fk", "ram": "MAQkNd11", "soundCard": "IXxinBCO"}, {"additionals": "btb3zRhE", "directXVersion": "cZEKrjia", "diskSpace": "EyYvJZ0W", "graphics": "iUvuePn7", "label": "oc2vq9Qy", "osVersion": "FAnQgS9u", "processor": "EfxQUOaX", "ram": "wRkzmLAX", "soundCard": "KwV5PIKM"}], "FnpMZJRN": [{"additionals": "zcrNlvtR", "directXVersion": "jpf77jua", "diskSpace": "VbnOmNYP", "graphics": "2VcjvPfi", "label": "gkdSYURy", "osVersion": "Vxd3nRuh", "processor": "py2Uhsxc", "ram": "mhtu5n3z", "soundCard": "SYOOm0ym"}, {"additionals": "FmfYpJvh", "directXVersion": "5gAzMRJH", "diskSpace": "zyIshSeL", "graphics": "FwzEWarP", "label": "Z1sbNEn1", "osVersion": "uIoIY9MK", "processor": "kftGsmqE", "ram": "9An2CMMh", "soundCard": "OAjnPGdw"}, {"additionals": "8a4yI5I8", "directXVersion": "gR0uKSAC", "diskSpace": "2lkenoXX", "graphics": "Y0F0TC8C", "label": "P8jgZJlW", "osVersion": "Q4Ez46nw", "processor": "AqqXqd7g", "ram": "HqxicsrS", "soundCard": "keFzsxr5"}], "s9ZHo1oj": [{"additionals": "cKymYhXM", "directXVersion": "Ir50NL6R", "diskSpace": "9z7kCC3z", "graphics": "BJiaxLmd", "label": "ObHVrUqj", "osVersion": "gYtDCBCd", "processor": "k8Hg0oCr", "ram": "hUe0Wb3b", "soundCard": "r6bVUNHm"}, {"additionals": "aIStQwby", "directXVersion": "u63dgf9P", "diskSpace": "G0L2GSxv", "graphics": "dsCEoLBm", "label": "3wz81A9h", "osVersion": "0icfGqu1", "processor": "AHqlXEFw", "ram": "phtoZ0vr", "soundCard": "FQZOc9OR"}, {"additionals": "MaY6NLHi", "directXVersion": "s4FHAacK", "diskSpace": "C9SffoP3", "graphics": "eFrcNDdh", "label": "loIE0XJ2", "osVersion": "TeHvSAFA", "processor": "HPwzTP4g", "ram": "XNP4QVUz", "soundCard": "fYtGbTzw"}]}, "platforms": ["IOS", "Linux", "MacOS"], "players": ["Coop", "Multi", "Single"], "primaryGenre": "Adventure", "publisher": "BlGXMXK2", "releaseDate": "1993-10-12T00:00:00Z", "websiteUrl": "Y1tJZ1Ns"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateApp' test.out

#- 139 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '9LGBXU7s' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pQpqKzon' \
    --body '{"featuresToCheck": ["CAMPAIGN", "ENTITLEMENT", "DLC"]}' \
    > test.out 2>&1
eval_tap $? 139 'DisableItem' test.out

#- 140 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'xSScttmF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetItemDynamicData' test.out

#- 141 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'uLFgcruv' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2ZZ5BnSu' \
    > test.out 2>&1
eval_tap $? 141 'EnableItem' test.out

#- 142 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'rIOtSpPR' \
    --itemId '1FG1Oa4F' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zF3FGoHZ' \
    > test.out 2>&1
eval_tap $? 142 'FeatureItem' test.out

#- 143 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '9lkhVQUW' \
    --itemId 'lblmop54' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uwmKVr2B' \
    > test.out 2>&1
eval_tap $? 143 'DefeatureItem' test.out

#- 144 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'cbSSVi8g' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '8OQGGuts' \
    --populateBundle  \
    --region 'GtXPCZu9' \
    --storeId 'o3UNFk6T' \
    > test.out 2>&1
eval_tap $? 144 'GetLocaleItem' test.out

#- 145 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'MroBPeJp' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2gZ4YmwN' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 47, "code": "afg4Jr6s", "comparison": "excludes", "name": "ChWeQFDI", "predicateType": "EntitlementPredicate", "value": "48N4SYMv", "values": ["a9ee8nj2", "zutLiCMM", "gXEuXotf"]}, {"anyOf": 64, "code": "XFsnkxSO", "comparison": "isLessThan", "name": "fgKlcmT0", "predicateType": "SeasonPassPredicate", "value": "zChOlTEz", "values": ["g9ETLAGo", "ES6s1tMp", "egWsiYbs"]}, {"anyOf": 19, "code": "JToDD0vT", "comparison": "isLessThanOrEqual", "name": "WXv2Vy5f", "predicateType": "SeasonTierPredicate", "value": "p45B9EaY", "values": ["iLlKNorK", "yfRIS6Bz", "a7xyR5jJ"]}]}, {"operator": "and", "predicates": [{"anyOf": 95, "code": "4RCmn8pw", "comparison": "isLessThanOrEqual", "name": "y4cxiCug", "predicateType": "StatisticCodePredicate", "value": "As25Zejr", "values": ["GOxNxYQj", "dKRPEyEE", "HQSHSfgE"]}, {"anyOf": 15, "code": "HCa6O63B", "comparison": "isNot", "name": "ZnIxgFpy", "predicateType": "StatisticCodePredicate", "value": "ZHvLgRnl", "values": ["sA1t2iGE", "uXgij41E", "m8Itz6j6"]}, {"anyOf": 65, "code": "zTVLU5Hx", "comparison": "isNot", "name": "YqfBqfYR", "predicateType": "EntitlementPredicate", "value": "8Pdy151R", "values": ["UwBThunX", "QnEdSjvW", "dmu9tNlt"]}]}, {"operator": "and", "predicates": [{"anyOf": 51, "code": "RyWIiMV7", "comparison": "isNot", "name": "bEyg4tY0", "predicateType": "SeasonPassPredicate", "value": "FuKYVaX1", "values": ["0oWxL25L", "CV9Is7c0", "xHzCgm8X"]}, {"anyOf": 57, "code": "Idieh2Rz", "comparison": "isGreaterThan", "name": "U0tPgpip", "predicateType": "EntitlementPredicate", "value": "dsPbx5oI", "values": ["BMXjeAjx", "P6LST8qp", "77bkYrhX"]}, {"anyOf": 26, "code": "KsHwduo6", "comparison": "excludes", "name": "DUMZrfeC", "predicateType": "SeasonPassPredicate", "value": "cQcGHsAX", "values": ["NExL52Ua", "WxYcjjeN", "p7txYjHu"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateItemPurchaseCondition' test.out

#- 146 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'Cuvl8fIN' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,CATALOG,ENTITLEMENT' \
    --storeId 'wYqw2gKY' \
    > test.out 2>&1
eval_tap $? 146 'QueryItemReferences' test.out

#- 147 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'T8di2Ms3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "7ifweBWI"}' \
    > test.out 2>&1
eval_tap $? 147 'ReturnItem' test.out

#- 148 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --name 'tF79u0R7' \
    --offset '34' \
    --tag 'N34dR2gj' \
    > test.out 2>&1
eval_tap $? 148 'QueryKeyGroups' test.out

#- 149 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3WcsQcZc", "name": "FuzEqtnr", "status": "ACTIVE", "tags": ["I5AWDMxd", "ucC6sNTY", "hpLEtxUD"]}' \
    > test.out 2>&1
eval_tap $? 149 'CreateKeyGroup' test.out

#- 150 GetKeyGroupByBoothName
eval_tap 0 150 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 151 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '2TWxVTZu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetKeyGroup' test.out

#- 152 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '3EedoSKL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HI64CZTN", "name": "97gubZIW", "status": "ACTIVE", "tags": ["EN25xJEm", "zElCrHNZ", "Comtq6h3"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateKeyGroup' test.out

#- 153 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'nVEWhj92' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroupDynamic' test.out

#- 154 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'W7MUsZRc' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '55' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 154 'ListKeys' test.out

#- 155 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '3FenfRNJ' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 155 'UploadKeys' test.out

#- 156 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KIkHghXo' \
    --limit '69' \
    --offset '61' \
    --orderNos 'GxswDSuX,bINGO4mu,VlzWFcjF' \
    --sortBy 'rkfTf5je' \
    --startTime 'YkGA3MFg' \
    --status 'INIT' \
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
    --orderNo 'x7NjdOlr' \
    > test.out 2>&1
eval_tap $? 158 'GetOrder' test.out

#- 159 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MjzGsN7i' \
    --body '{"description": "A8n0hl8Q"}' \
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
    --body '{"domains": ["uQbwTLNg", "eRfuMbQI", "2ySpPHlx"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePaymentDomainWhitelistConfig' test.out

#- 164 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'T6ztdx7A' \
    --externalId 'ulyWEHAU' \
    --limit '7' \
    --notificationSource 'NEONPAY' \
    --notificationType 'O1hovkLK' \
    --offset '35' \
    --paymentOrderNo 'iSjFpBJq' \
    --startDate 'MNDI4xzW' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 164 'QueryPaymentNotifications' test.out

#- 165 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'ljanIDCj' \
    --limit '18' \
    --offset '99' \
    --status 'CHARGE_FAILED' \
    > test.out 2>&1
eval_tap $? 165 'QueryPaymentOrders' test.out

#- 166 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "A3yBQRuJ", "currencyNamespace": "4rtvTCWv", "customParameters": {"S8z9kZv5": {}, "MWiePGFa": {}, "ykSkLqLw": {}}, "description": "uSC3knHo", "extOrderNo": "iOqQlaGT", "extUserId": "vzA5pCvt", "itemType": "INGAMEITEM", "language": "urGD-039", "metadata": {"yYjW1rPB": "LHGkxNYq", "MhXzrad4": "vqE40hMm", "9DBaSNz1": "SH6KAWuu"}, "notifyUrl": "zbcE4Thm", "omitNotification": false, "platform": "gkm6TYuG", "price": 78, "recurringPaymentOrderNo": "vlKXEDze", "region": "qBCntjDy", "returnUrl": "OfUiwjAJ", "sandbox": false, "sku": "52HirxnN", "subscriptionId": "cuK8WBxN", "targetNamespace": "OK2i6Pb8", "targetUserId": "pCuQK7pT", "title": "acUo4MXd"}' \
    > test.out 2>&1
eval_tap $? 166 'CreatePaymentOrderByDedicated' test.out

#- 167 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'lA3ASNXB' \
    > test.out 2>&1
eval_tap $? 167 'ListExtOrderNoByExtTxId' test.out

#- 168 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9eHZ81qy' \
    > test.out 2>&1
eval_tap $? 168 'GetPaymentOrder' test.out

#- 169 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0weVC6UT' \
    --body '{"extTxId": "liIr9IAk", "paymentMethod": "ODTRhFi6", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 169 'ChargePaymentOrder' test.out

#- 170 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2hndz1QQ' \
    --body '{"description": "Y6zeDDJu"}' \
    > test.out 2>&1
eval_tap $? 170 'RefundPaymentOrderByDedicated' test.out

#- 171 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8jRNyZH3' \
    --body '{"amount": 96, "currencyCode": "K7v0mqva", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 91, "vat": 30}' \
    > test.out 2>&1
eval_tap $? 171 'SimulatePaymentOrderNotification' test.out

#- 172 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'eR01rDZl' \
    > test.out 2>&1
eval_tap $? 172 'GetPaymentOrderChargeStatus' test.out

#- 173 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'ZDHwt9Cv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "O1JLvyWQ", "serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 173 'GetPsnEntitlementOwnership' test.out

#- 174 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'FjhEE5Oz' \
    --body '{"delegationToken": "lZVOzOhJ", "sandboxId": "U1goOvAD"}' \
    > test.out 2>&1
eval_tap $? 174 'GetXboxEntitlementOwnership' test.out

#- 175 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 175 'GetPlatformEntitlementConfig' test.out

#- 176 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["GooglePlay", "Other", "Other"]}' \
    > test.out 2>&1
eval_tap $? 176 'UpdatePlatformEntitlementConfig' test.out

#- 177 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformWalletConfig' test.out

#- 178 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["Xbox", "Xbox", "System"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformWalletConfig' test.out

#- 179 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime '6MOpBLLi' \
    --limit '68' \
    --offset '14' \
    --source 'IAP' \
    --startTime 'r83dehlF' \
    --status 'FAIL' \
    --transactionId '5Ly8dfS3' \
    --userId 'xUfmBwGP' \
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
    --body '{"appConfig": {"appName": "s7LlEDpn"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "xtIn2aAM"}, "extendType": "APP"}' \
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
    --body '{"description": "Pi1rTl2k", "eventTopic": "wLmJBidx", "maxAwarded": 41, "maxAwardedPerUser": 51, "namespaceExpression": "Xjl57jgm", "rewardCode": "pfxRj7rk", "rewardConditions": [{"condition": "03YUBTBI", "conditionName": "CI6JKKuv", "eventName": "2twIvyll", "rewardItems": [{"duration": 94, "endDate": "1982-02-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "xUOGrGg3", "quantity": 13, "sku": "brVesDCn"}, {"duration": 7, "endDate": "1989-10-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "OjyCfCU9", "quantity": 52, "sku": "GGYH24fo"}, {"duration": 29, "endDate": "1998-01-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "e7DnnyHY", "quantity": 69, "sku": "JINI3BMA"}]}, {"condition": "Hgpqt0Wq", "conditionName": "4hLrARJ2", "eventName": "ZAXcKCaT", "rewardItems": [{"duration": 13, "endDate": "1977-02-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "9CyGW2bx", "quantity": 5, "sku": "UgK2R1LD"}, {"duration": 43, "endDate": "1987-12-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "KZ75gqRO", "quantity": 51, "sku": "k09icTU7"}, {"duration": 18, "endDate": "1984-08-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "CeHxIRhh", "quantity": 4, "sku": "cuJiWXut"}]}, {"condition": "mWltwiTf", "conditionName": "I7PHZTPE", "eventName": "Mf4RvHOg", "rewardItems": [{"duration": 33, "endDate": "1971-10-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6ojYuvoQ", "quantity": 64, "sku": "kZieZObA"}, {"duration": 82, "endDate": "1972-07-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5x9mGZWm", "quantity": 86, "sku": "0wP6HRzW"}, {"duration": 17, "endDate": "1997-09-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "429XFwOZ", "quantity": 5, "sku": "j4AJyRiM"}]}], "userIdExpression": "wtY46w5H"}' \
    > test.out 2>&1
eval_tap $? 188 'CreateReward' test.out

#- 189 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'XQu98wlX' \
    --limit '74' \
    --offset '3' \
    --sortBy 'namespace,namespace:asc,rewardCode:asc' \
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
    --rewardId '8EFPn0cj' \
    > test.out 2>&1
eval_tap $? 192 'GetReward' test.out

#- 193 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AJKgUB19' \
    --body '{"description": "eBjcsIQH", "eventTopic": "gfOmpJAS", "maxAwarded": 15, "maxAwardedPerUser": 57, "namespaceExpression": "KEiBjwS4", "rewardCode": "R4YmNnHV", "rewardConditions": [{"condition": "V9CNKJT1", "conditionName": "e0wmT3TK", "eventName": "TJKPBanP", "rewardItems": [{"duration": 67, "endDate": "1979-08-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "YSefYK5S", "quantity": 74, "sku": "yG1cnkHR"}, {"duration": 44, "endDate": "1979-08-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "09a99Apr", "quantity": 30, "sku": "Z71bLMPU"}, {"duration": 47, "endDate": "1975-05-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "n4VjmT2D", "quantity": 4, "sku": "lTDJvJzr"}]}, {"condition": "dnRFcrgb", "conditionName": "avSdaF5L", "eventName": "Z0NbuM5k", "rewardItems": [{"duration": 2, "endDate": "1971-05-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "QXr48gur", "quantity": 82, "sku": "5MG9dFv8"}, {"duration": 10, "endDate": "1972-08-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "J47p0WjF", "quantity": 57, "sku": "TRzQ7VCg"}, {"duration": 14, "endDate": "1982-05-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "5qgZZ5le", "quantity": 1, "sku": "MmPcZ44T"}]}, {"condition": "TSGd7RPQ", "conditionName": "JIjzveVJ", "eventName": "snDNNqbS", "rewardItems": [{"duration": 40, "endDate": "1983-08-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "2XPLOBZv", "quantity": 9, "sku": "gjT61M2O"}, {"duration": 93, "endDate": "1981-06-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "06jI20wj", "quantity": 66, "sku": "rIOJ41Qu"}, {"duration": 3, "endDate": "1999-12-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "2eHsYz8R", "quantity": 66, "sku": "UA4v1Mv4"}]}], "userIdExpression": "VzXUR6JG"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateReward' test.out

#- 194 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '8rYLlB5Y' \
    > test.out 2>&1
eval_tap $? 194 'DeleteReward' test.out

#- 195 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YOAhu33o' \
    --body '{"payload": {"32KoxK1G": {}, "L8Dmclml": {}, "pQP35LUp": {}}}' \
    > test.out 2>&1
eval_tap $? 195 'CheckEventCondition' test.out

#- 196 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'uek0Bre5' \
    --body '{"conditionName": "LpbyA99I", "userId": "ErOjOsDc"}' \
    > test.out 2>&1
eval_tap $? 196 'DeleteRewardConditionRecord' test.out

#- 197 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '8NQFfUYh' \
    --limit '33' \
    --offset '79' \
    --start 'amvDqKj8' \
    --storeId 'eWiR84CW' \
    --viewId 'Sv3Xg5qB' \
    > test.out 2>&1
eval_tap $? 197 'QuerySections' test.out

#- 198 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '6o0kekzc' \
    --body '{"active": true, "displayOrder": 49, "endDate": "1976-12-28T00:00:00Z", "ext": {"eHbuUUs9": {}, "wxlmnmbn": {}, "tI1cZigo": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 37, "itemCount": 67, "rule": "SEQUENCE"}, "items": [{"id": "JnghZtWW", "sku": "NkmndQhO"}, {"id": "uWYP1cLu", "sku": "O1T1UZIN"}, {"id": "RJRM8VAB", "sku": "tbLSrlWo"}], "localizations": {"w7UgbQWr": {"description": "MyG3CgIw", "localExt": {"sB9DfoR1": {}, "rcNGtU6Y": {}, "DEGgu0hd": {}}, "longDescription": "TviEt2jA", "title": "Eo4RnZAp"}, "IlFrPW6q": {"description": "r3BgnmaV", "localExt": {"j48oXIZO": {}, "7bCgHP28": {}, "zFxomPvV": {}}, "longDescription": "SLjzKnlb", "title": "iwV3nqrM"}, "mhQR1c63": {"description": "Mga5zbC9", "localExt": {"B8UNFJot": {}, "Uf9hZfli": {}, "PLowVcvQ": {}}, "longDescription": "RqHsQxB0", "title": "bxbSKZMA"}}, "name": "3P1iwt6i", "rotationType": "CUSTOM", "startDate": "1998-12-04T00:00:00Z", "viewId": "p9duCVVe"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateSection' test.out

#- 199 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q8T7onxu' \
    > test.out 2>&1
eval_tap $? 199 'PurgeExpiredSection' test.out

#- 200 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'bybWAC8x' \
    --storeId 'DFBn9TeC' \
    > test.out 2>&1
eval_tap $? 200 'GetSection' test.out

#- 201 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'JZ1Houga' \
    --storeId 'C0IijKl9' \
    --body '{"active": true, "displayOrder": 41, "endDate": "1991-07-16T00:00:00Z", "ext": {"tyNGQcRw": {}, "fm1s2wpZ": {}, "UDoPvV1U": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 46, "itemCount": 80, "rule": "SEQUENCE"}, "items": [{"id": "1BDKGCnh", "sku": "5k7w9cVk"}, {"id": "kkS4TOvr", "sku": "39gFpDIy"}, {"id": "S7jLMrV3", "sku": "rvZwLHNL"}], "localizations": {"TEyJKFhy": {"description": "pcfU9AhK", "localExt": {"7PXECOKO": {}, "bbtrLdgq": {}, "SFRcgDMw": {}}, "longDescription": "dYApDWR6", "title": "NV9zeKCe"}, "hoZuFbbT": {"description": "gA5X72QE", "localExt": {"xHXgwqaw": {}, "u3QnIGfe": {}, "2ux0BCip": {}}, "longDescription": "IyOi2dX2", "title": "RXEgxjkI"}, "g5WQEZlh": {"description": "tmvBoNSs", "localExt": {"kFImG5Vp": {}, "WBkMqmWt": {}, "DvCGEFf7": {}}, "longDescription": "9LRkG9OY", "title": "KPVHSbHd"}}, "name": "0eIkC9f9", "rotationType": "NONE", "startDate": "1974-02-04T00:00:00Z", "viewId": "r0693Bxa"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateSection' test.out

#- 202 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'tULmH9XO' \
    --storeId 'V734ryNV' \
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
    --body '{"defaultLanguage": "b8XIzKAZ", "defaultRegion": "wZeSKNA5", "description": "FUEz8YF2", "supportedLanguages": ["vBewpLDK", "sZRo5K6A", "FIxCoN71"], "supportedRegions": ["azx315BY", "Qx6l669C", "sNUbaHh2"], "title": "Ri2ubpyw"}' \
    > test.out 2>&1
eval_tap $? 204 'CreateStore' test.out

#- 205 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
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
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["6uXDCVqn", "RjPRAWFU", "HmrpwGzJ"], "idsToBeExported": ["apQqebkY", "mOob9JOu", "jMDhspkV"], "storeId": "lU2rtL9z"}' \
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
    --storeId 'y98GHMof' \
    > test.out 2>&1
eval_tap $? 213 'GetStore' test.out

#- 214 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SYoV3Nkn' \
    --body '{"defaultLanguage": "2vJD63hL", "defaultRegion": "dVopnzuI", "description": "0NFs8LKp", "supportedLanguages": ["xYK462vr", "w6QOVziA", "SqI5eG7Z"], "supportedRegions": ["cq4Lx4RJ", "ykwS1pXQ", "ARX2fHMb"], "title": "NkeszOW8"}' \
    > test.out 2>&1
eval_tap $? 214 'UpdateStore' test.out

#- 215 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UFjYBim5' \
    > test.out 2>&1
eval_tap $? 215 'DeleteStore' test.out

#- 216 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ya1wPywk' \
    --action 'DELETE' \
    --itemSku 'NM82Fc2P' \
    --itemType 'EXTENSION' \
    --limit '99' \
    --offset '17' \
    --selected  \
    --sortBy 'updatedAt,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'GvUZ60Eu' \
    --updatedAtStart 'aun5Fffd' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 216 'QueryChanges' test.out

#- 217 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '7UAH0TCO' \
    > test.out 2>&1
eval_tap $? 217 'PublishAll' test.out

#- 218 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QaAVYS0e' \
    > test.out 2>&1
eval_tap $? 218 'PublishSelected' test.out

#- 219 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GgWmioR6' \
    > test.out 2>&1
eval_tap $? 219 'SelectAllRecords' test.out

#- 220 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wICoyMZV' \
    --action 'CREATE' \
    --itemSku 'gz5GPCoQ' \
    --itemType 'SEASON' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd 'G0RAtY9Q' \
    --updatedAtStart 'kb4AT1sN' \
    > test.out 2>&1
eval_tap $? 220 'SelectAllRecordsByCriteria' test.out

#- 221 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '3OmujOAU' \
    --action 'CREATE' \
    --itemSku 'yJlgGRe7' \
    --itemType 'LOOTBOX' \
    --type 'SECTION' \
    --updatedAtEnd '1kgZ4R55' \
    --updatedAtStart '3uTM9Dyr' \
    > test.out 2>&1
eval_tap $? 221 'GetStatistic' test.out

#- 222 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jkOMaqQA' \
    > test.out 2>&1
eval_tap $? 222 'UnselectAllRecords' test.out

#- 223 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'zwsvzlCm' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8srCxaw1' \
    > test.out 2>&1
eval_tap $? 223 'SelectRecord' test.out

#- 224 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'KwgzTA63' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J7Y3Dbpd' \
    > test.out 2>&1
eval_tap $? 224 'UnselectRecord' test.out

#- 225 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U8XKNYi7' \
    --targetStoreId 'PAh5KYQC' \
    > test.out 2>&1
eval_tap $? 225 'CloneStore' test.out

#- 226 ExportStore
eval_tap 0 226 'ExportStore # SKIP deprecated' test.out

#- 227 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '4QyatvL1' \
    --end 'JTPEjnX0' \
    --limit '55' \
    --offset '79' \
    --sortBy 'HoSVNqWK' \
    --start 'ufe0iQHY' \
    --success  \
    > test.out 2>&1
eval_tap $? 227 'QueryImportHistory' test.out

#- 228 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TPxHvxsR' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'oMFZHSd3' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 228 'ImportStoreByCSV' test.out

#- 229 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'mWRc5GnE' \
    --limit '30' \
    --offset '96' \
    --sku 'bC2mBTyp' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'bD1UZVbZ' \
    > test.out 2>&1
eval_tap $? 229 'QuerySubscriptions' test.out

#- 230 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'f8ZQF5NM' \
    > test.out 2>&1
eval_tap $? 230 'RecurringChargeSubscription' test.out

#- 231 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'BY61UETN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'GetTicketDynamic' test.out

#- 232 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Qlc9r6qh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "pJVU09hE"}' \
    > test.out 2>&1
eval_tap $? 232 'DecreaseTicketSale' test.out

#- 233 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'M344VBIY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketBoothID' test.out

#- 234 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'fFcdBJrh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 34, "orderNo": "sqGczXfZ"}' \
    > test.out 2>&1
eval_tap $? 234 'IncreaseTicketSale' test.out

#- 235 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 64, "currencyCode": "6zUCqe6r", "expireAt": "1979-02-09T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "VqF4Yhow", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "MJ7plUT5", "entitlementOrigin": "GooglePlay", "itemIdentity": "iNVzpVxZ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "EkFMGM5u"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 32, "currencyCode": "Kcw1w9wN", "expireAt": "1980-06-18T00:00:00Z"}, "debitPayload": {"count": 61, "currencyCode": "7UufHxdX", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 64, "entitlementCollectionId": "fcxZPqPb", "entitlementOrigin": "Nintendo", "itemIdentity": "3gEfr7lZ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "bfYQCDaM"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 65, "currencyCode": "CdkFIu6e", "expireAt": "1975-01-25T00:00:00Z"}, "debitPayload": {"count": 3, "currencyCode": "cxhogIZq", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 28, "entitlementCollectionId": "k9Sy88tp", "entitlementOrigin": "Xbox", "itemIdentity": "EMh3DFWP", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 5, "entitlementId": "8JptDQJF"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "1scUxXHD"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 26, "currencyCode": "nBTrxdYg", "expireAt": "1983-02-09T00:00:00Z"}, "debitPayload": {"count": 95, "currencyCode": "zxgxWtHv", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 34, "entitlementCollectionId": "sn5Rafuc", "entitlementOrigin": "Twitch", "itemIdentity": "gzs9FIV1", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "o3Fg2LzM"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 43, "currencyCode": "UjLaahSK", "expireAt": "1980-09-11T00:00:00Z"}, "debitPayload": {"count": 24, "currencyCode": "WG1Dq0C0", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 50, "entitlementCollectionId": "CPs624U3", "entitlementOrigin": "Playstation", "itemIdentity": "YMNcHufo", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 45, "entitlementId": "H5g7wd4f"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 81, "currencyCode": "lg5BoYQq", "expireAt": "1978-08-18T00:00:00Z"}, "debitPayload": {"count": 7, "currencyCode": "OnAgkDu4", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 48, "entitlementCollectionId": "Kja0tdDD", "entitlementOrigin": "Nintendo", "itemIdentity": "8bEf6BG0", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "5gIMWONL"}, "type": "CREDIT_WALLET"}], "userId": "ATN5kk54"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 20, "currencyCode": "9bhzYNW8", "expireAt": "1983-08-03T00:00:00Z"}, "debitPayload": {"count": 77, "currencyCode": "4iSDJpAS", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 71, "entitlementCollectionId": "QWtDZOMv", "entitlementOrigin": "Steam", "itemIdentity": "kgyfsvow", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "G6CEDcOF"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "System", "count": 59, "currencyCode": "VYycFMBU", "expireAt": "1989-07-05T00:00:00Z"}, "debitPayload": {"count": 10, "currencyCode": "iNXeUSDD", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 16, "entitlementCollectionId": "irgumZjS", "entitlementOrigin": "GooglePlay", "itemIdentity": "rGzFpEQI", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "ZpvATowo"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 73, "currencyCode": "qWAd5HyV", "expireAt": "1987-08-15T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "7tMJkhkS", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 83, "entitlementCollectionId": "Vs8JfUIt", "entitlementOrigin": "System", "itemIdentity": "eYv4jkeK", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "c8NL42fP"}, "type": "CREDIT_WALLET"}], "userId": "6fiBIQFi"}], "metadata": {"Wqu56cOE": {}, "8RGobpmq": {}, "spetlXV9": {}}, "needPreCheck": true, "transactionId": "6dIxfJA6", "type": "RZiDA2dJ"}' \
    > test.out 2>&1
eval_tap $? 235 'Commit' test.out

#- 236 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '19' \
    --status 'FAILED' \
    --type '9x6QSVm1' \
    --userId '64NdmbXd' \
    > test.out 2>&1
eval_tap $? 236 'GetTradeHistoryByCriteria' test.out

#- 237 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '8zEBxvY3' \
    > test.out 2>&1
eval_tap $? 237 'GetTradeHistoryByTransactionId' test.out

#- 238 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '2lD03oWm' \
    --body '{"achievements": [{"id": "pMelOFu3", "value": 63}, {"id": "xyF6suWq", "value": 84}, {"id": "hqkAz5Al", "value": 85}], "steamUserId": "E4prvzqp"}' \
    > test.out 2>&1
eval_tap $? 238 'UnlockSteamUserAchievement' test.out

#- 239 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jLzdsin1' \
    --xboxUserId 'eYNu9U9Y' \
    > test.out 2>&1
eval_tap $? 239 'GetXblUserAchievements' test.out

#- 240 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwzoiF2F' \
    --body '{"achievements": [{"id": "1du1SLHo", "percentComplete": 78}, {"id": "Yz6BvyR5", "percentComplete": 89}, {"id": "KgkCYshy", "percentComplete": 30}], "serviceConfigId": "xN39tN88", "titleId": "ndvlInCM", "xboxUserId": "WtwUqvET"}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateXblUserAchievement' test.out

#- 241 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vj871m8e' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeCampaign' test.out

#- 242 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HeiKwgji' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeEntitlement' test.out

#- 243 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'jy9NkjX9' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeFulfillment' test.out

#- 244 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'GwsfMKem' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeIntegration' test.out

#- 245 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sq4cCNfl' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeOrder' test.out

#- 246 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ok5F3p5Y' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizePayment' test.out

#- 247 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'A94cUZjG' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeRevocation' test.out

#- 248 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7sEGK8z' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizeSubscription' test.out

#- 249 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'RlySUTMl' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeWallet' test.out

#- 250 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'hy4OoIbk' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 250 'GetUserDLCByPlatform' test.out

#- 251 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1LPcGAv' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 251 'GetUserDLC' test.out

#- 252 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vKsIpJw4' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'SCa3DHTm' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'qXiT7TO5' \
    --features 'PhLIqNhD,WSTO9Sml,N7UZJ9fy' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId '56oSUUoS,M8GZ0rWN,EPqgIw43' \
    --limit '15' \
    --offset '90' \
    --origin 'IOS' \
    > test.out 2>&1
eval_tap $? 252 'QueryUserEntitlements' test.out

#- 253 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZccKYrUd' \
    --body '[{"collectionId": "dNx35X4o", "endDate": "1988-11-19T00:00:00Z", "grantedCode": "BNQAuISt", "itemId": "NDxeVGqh", "itemNamespace": "jlN0ifLs", "language": "xnKu", "metadata": {"5en1ZTYZ": {}, "Vi6YZqk4": {}, "lt4ozgut": {}}, "origin": "Epic", "quantity": 30, "region": "5YlzsmKg", "source": "REWARD", "startDate": "1974-10-26T00:00:00Z", "storeId": "irvxGfxQ"}, {"collectionId": "FFDhbUkL", "endDate": "1989-10-11T00:00:00Z", "grantedCode": "a0z1nvFo", "itemId": "1ui5AKE1", "itemNamespace": "eVWmLk8G", "language": "eMh", "metadata": {"ceiagys3": {}, "EbUVRXpq": {}, "IBzjq0qT": {}}, "origin": "IOS", "quantity": 52, "region": "sZQVzRnE", "source": "ACHIEVEMENT", "startDate": "1996-04-21T00:00:00Z", "storeId": "z5y7rH6Y"}, {"collectionId": "JCd08qPy", "endDate": "1980-03-05T00:00:00Z", "grantedCode": "am92lTk8", "itemId": "GKlDuDTW", "itemNamespace": "XnWKiZac", "language": "obDg-jsyK_lL", "metadata": {"dofbk1YH": {}, "oHFiS8jV": {}, "mfOB6B1P": {}}, "origin": "Steam", "quantity": 18, "region": "tKXsqhpg", "source": "PROMOTION", "startDate": "1972-06-29T00:00:00Z", "storeId": "PH1Fb6Ky"}]' \
    > test.out 2>&1
eval_tap $? 253 'GrantUserEntitlement' test.out

#- 254 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '07b5grBb' \
    --activeOnly  \
    --appId 'SxIUvGF3' \
    > test.out 2>&1
eval_tap $? 254 'GetUserAppEntitlementByAppId' test.out

#- 255 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '4mALF2AU' \
    --activeOnly  \
    --limit '87' \
    --offset '96' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 255 'QueryUserEntitlementsByAppType' test.out

#- 256 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'b5HwkeAe' \
    --ids 'jA0JSVLQ,rH5MIt0P,qFze8ZfI' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementsByIds' test.out

#- 257 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kyevDkqZ' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform '1cOBFe8Q' \
    --itemId 'RlDREZQm' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementByItemId' test.out

#- 258 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqYjcomk' \
    --ids 'uTmhuKHp,vab7DIjI,7tpVE2jC' \
    --platform 'PfnHPMsd' \
    > test.out 2>&1
eval_tap $? 258 'GetUserActiveEntitlementsByItemIds' test.out

#- 259 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'BB8mNiX8' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'yXtYiP0j' \
    --sku 'N2teD6xe' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementBySku' test.out

#- 260 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GnOjeef2' \
    --appIds 'KrFAZgSa,VMjdZ9mV,e5xO9o22' \
    --itemIds 'SlbykfQE,Wzsx7A3f,yW7Ha3CE' \
    --platform 'rhsiSw3L' \
    --skus 'aJtysHLF,CcrgOtFI,Dz1lbQUO' \
    > test.out 2>&1
eval_tap $? 260 'ExistsAnyUserActiveEntitlement' test.out

#- 261 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ES9x7Xyy' \
    --platform 'yPYIhfIa' \
    --itemIds '0gtAfm6O,SmWAejXh,WwpKGxop' \
    > test.out 2>&1
eval_tap $? 261 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 262 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'z1PNeOVe' \
    --appId 'Djznxucu' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 263 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iSwdUuUx' \
    --entitlementClazz 'APP' \
    --platform 'Rx8fAk00' \
    --itemId 'TuGkA9ak' \
    > test.out 2>&1
eval_tap $? 263 'GetUserEntitlementOwnershipByItemId' test.out

#- 264 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZG4eTo8' \
    --ids 'ZvrTZCbw,DgzlBsGm,S1ZhrjuR' \
    --platform 'syBOLjEz' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementOwnershipByItemIds' test.out

#- 265 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'orP2zdAC' \
    --entitlementClazz 'APP' \
    --platform '8jmMgoSA' \
    --sku 'NbaJXM5t' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipBySku' test.out

#- 266 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1Z1xf9An' \
    > test.out 2>&1
eval_tap $? 266 'RevokeAllEntitlements' test.out

#- 267 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPUTZdlG' \
    --entitlementIds 'nfUai1X8' \
    > test.out 2>&1
eval_tap $? 267 'RevokeUserEntitlements' test.out

#- 268 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'qcf2cBm7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFVPdjo9' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlement' test.out

#- 269 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'FjtBvrbW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XQ6Wu0Sa' \
    --body '{"collectionId": "WmHII0Lj", "endDate": "1978-08-01T00:00:00Z", "nullFieldList": ["RN0Yo0vF", "udSyoSo9", "UFjYWHs2"], "origin": "Playstation", "reason": "hQUMmM4p", "startDate": "1978-12-17T00:00:00Z", "status": "INACTIVE", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserEntitlement' test.out

#- 270 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '2JgFkNFm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujukHk33' \
    --body '{"metadata": {"fKq6faRC": {}, "JvsaST1I": {}, "BJsvXYI7": {}}, "options": ["eoJyW8MS", "HnigSTzo", "G0apFhK1"], "platform": "qMuKpRVc", "requestId": "SerMfiAH", "useCount": 16}' \
    > test.out 2>&1
eval_tap $? 270 'ConsumeUserEntitlement' test.out

#- 271 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'pDRL0uYv' \
    --namespace "$AB_NAMESPACE" \
    --userId '2I6gq7i7' \
    > test.out 2>&1
eval_tap $? 271 'DisableUserEntitlement' test.out

#- 272 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'rZcAoAvx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ixMQkN2R' \
    > test.out 2>&1
eval_tap $? 272 'EnableUserEntitlement' test.out

#- 273 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'lbI4RB6S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4K2r5hj' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementHistories' test.out

#- 274 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'CbM0dijS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MWhI73Rh' \
    --body '{"metadata": {"nAbuRqTK": {}, "ZpKs9m0R": {}, "bj86iawB": {}}}' \
    > test.out 2>&1
eval_tap $? 274 'RevokeUserEntitlement' test.out

#- 275 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'ngz3JwSy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j03f06tv' \
    --body '{"reason": "7PopWvxB", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlementByUseCount' test.out

#- 276 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'GIUunky5' \
    --namespace "$AB_NAMESPACE" \
    --userId '5md2StKi' \
    --quantity '88' \
    > test.out 2>&1
eval_tap $? 276 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 277 RevokeUseCount
eval_tap 0 277 'RevokeUseCount # SKIP deprecated' test.out

#- 278 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'aARn7YDT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IpGrwqJa' \
    --body '{"platform": "zLbYIOCy", "requestId": "wzcvnaPq", "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 278 'SellUserEntitlement' test.out

#- 279 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'taebAoyK' \
    --body '{"duration": 43, "endDate": "1976-09-27T00:00:00Z", "entitlementCollectionId": "vZTO2qhl", "entitlementOrigin": "Oculus", "itemId": "mkcjeM3B", "itemSku": "pOs3zQEX", "language": "4zwkxxfK", "metadata": {"3nYuruaB": {}, "nmurigwP": {}, "L6K7J35K": {}}, "order": {"currency": {"currencyCode": "D1YOMohi", "currencySymbol": "7DjtsYg7", "currencyType": "VIRTUAL", "decimals": 9, "namespace": "BcsG6yoy"}, "ext": {"nJNMZ9Lr": {}, "2h27cZa1": {}, "fLGevauj": {}}, "free": true}, "orderNo": "U3LPEbgt", "origin": "System", "overrideBundleItemQty": {"NwCXtmUP": 36, "9faD7fKQ": 97, "Yn3cplFo": 38}, "quantity": 98, "region": "lt9c4YEX", "source": "PAYMENT", "startDate": "1999-03-11T00:00:00Z", "storeId": "y1VrfCzE"}' \
    > test.out 2>&1
eval_tap $? 279 'FulfillItem' test.out

#- 280 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1cQvkRi' \
    --body '{"code": "jsnAlvpA", "language": "nxN", "region": "wmJcPQcZ"}' \
    > test.out 2>&1
eval_tap $? 280 'RedeemCode' test.out

#- 281 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3Mc1B91' \
    --body '{"itemId": "x0OP6SfI", "itemSku": "WuUSFn4h", "quantity": 76}' \
    > test.out 2>&1
eval_tap $? 281 'PreCheckFulfillItem' test.out

#- 282 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'F3ZIlC0R' \
    --body '{"entitlementCollectionId": "IQ9OBoCx", "entitlementOrigin": "System", "metadata": {"TItB90wE": {}, "Nz7uffX0": {}, "58NQvWw1": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "TerXAMEk", "namespace": "oIvQFElM"}, "item": {"itemId": "Q8Ein2k4", "itemName": "NMX5sIIT", "itemSku": "1chD7YGc", "itemType": "9v590fE3"}, "quantity": 46, "type": "CURRENCY"}, {"currency": {"currencyCode": "D5Iw8UFd", "namespace": "kkHNp9J6"}, "item": {"itemId": "1d92Q9DR", "itemName": "IcKUF3Iu", "itemSku": "XFoPIyYo", "itemType": "Uu7yHLVe"}, "quantity": 59, "type": "CURRENCY"}, {"currency": {"currencyCode": "ArUXtvdT", "namespace": "mECn0rSN"}, "item": {"itemId": "h72ucl53", "itemName": "kDlOz4sV", "itemSku": "j9xWfcAn", "itemType": "qXS5PDa5"}, "quantity": 22, "type": "CURRENCY"}], "source": "ACHIEVEMENT", "transactionId": "gzw86RmM"}' \
    > test.out 2>&1
eval_tap $? 282 'FulfillRewards' test.out

#- 283 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'S086WsAt' \
    --endTime 'peirMbMi' \
    --limit '59' \
    --offset '57' \
    --productId 'cfWBLMI8' \
    --startTime '2e2cNKHq' \
    --status 'FULFILLED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 283 'QueryUserIAPOrders' test.out

#- 284 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'AuMd43xV' \
    > test.out 2>&1
eval_tap $? 284 'QueryAllUserIAPOrders' test.out

#- 285 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BXj5sz1E' \
    --endTime 'jnQvCv3J' \
    --limit '34' \
    --offset '29' \
    --startTime 'v6keVqkv' \
    --status 'SUCCESS' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPConsumeHistory' test.out

#- 286 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2ghJi4F' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "bW_Yjgv-507", "productId": "Rwi50ei8", "region": "tiNFKcUh", "transactionId": "MSKsmElE", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 286 'MockFulfillIAPItem' test.out

#- 287 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'uHzpL9KB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YJeS6E0K' \
    > test.out 2>&1
eval_tap $? 287 'AdminGetIAPOrderLineItems' test.out

#- 288 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6za3Nzu' \
    > test.out 2>&1
eval_tap $? 288 'AdminSyncSteamAbnormalTransaction' test.out

#- 289 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4gw1jvR' \
    --body '{"orderId": "FI1Oyk6X"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminSyncSteamIAPByTransaction' test.out

#- 290 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'vzE2vRyc' \
    --activeOnly  \
    --groupId 'E2wwF5qo' \
    --limit '53' \
    --offset '25' \
    --platform 'APPLE' \
    --productId 'nzLcBUTi' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserThirdPartySubscription' test.out

#- 291 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'nXuYpzpa' \
    --groupId 'faLCbxMT' \
    > test.out 2>&1
eval_tap $? 291 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 292 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'rlMT8TWO' \
    --productId 'MwoU4m2r' \
    > test.out 2>&1
eval_tap $? 292 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 293 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYLNKPpG' \
    --activeOnly  \
    --groupId '47E31auS' \
    --limit '85' \
    --offset '62' \
    --platform 'STADIA' \
    --productId '0eFYsZ1D' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 294 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'kGJf4fCX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uXMhwDnV' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartySubscriptionDetails' test.out

#- 295 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 't9r7h22f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c4iYQR9s' \
    --limit '26' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 295 'GetSubscriptionHistory' test.out

#- 296 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'Clk4CJIa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFeZRJd7' \
    > test.out 2>&1
eval_tap $? 296 'SyncSubscriptionTransaction' test.out

#- 297 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'mbbuqoLG' \
    --namespace "$AB_NAMESPACE" \
    --userId '4CPiv93P' \
    > test.out 2>&1
eval_tap $? 297 'GetThirdPartyUserSubscriptionDetails' test.out

#- 298 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '1MZpAaUe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wJic3Kkp' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscription' test.out

#- 299 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '4bf2w9Bk' \
    --discounted  \
    --itemId 'VI3gVmjw' \
    --limit '63' \
    --offset '13' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserOrders' test.out

#- 300 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCLWxBBU' \
    --body '{"currencyCode": "YCjLcQGV", "currencyNamespace": "221uGNv8", "discountCodes": ["rJHwghYO", "xsOqXKW6", "FpNUuWRO"], "discountedPrice": 94, "entitlementPlatform": "Nintendo", "ext": {"KXfWhrNg": {}, "AcbSBwRV": {}, "pCUWt1H4": {}}, "itemId": "ItTT2GZ8", "language": "VkrWVYps", "options": {"skipPriceValidation": false}, "platform": "GooglePlay", "price": 57, "quantity": 58, "region": "YTaHBaxj", "returnUrl": "gSu0GF8T", "sandbox": false, "sectionId": "htc0FYvq"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminCreateUserOrder' test.out

#- 301 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KA0vNwqc' \
    --itemId 'RIwxZHOP' \
    > test.out 2>&1
eval_tap $? 301 'CountOfPurchasedItem' test.out

#- 302 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WOc4unFo' \
    --userId 'ZcUkoHWA' \
    > test.out 2>&1
eval_tap $? 302 'GetUserOrder' test.out

#- 303 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aCFJrfHP' \
    --userId 'LPjxaDYX' \
    --body '{"status": "INIT", "statusReason": "qn5KSaSD"}' \
    > test.out 2>&1
eval_tap $? 303 'UpdateUserOrderStatus' test.out

#- 304 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ieh1YTRs' \
    --userId 'GBFrkBIS' \
    > test.out 2>&1
eval_tap $? 304 'FulfillUserOrder' test.out

#- 305 GetUserOrderGrant
eval_tap 0 305 'GetUserOrderGrant # SKIP deprecated' test.out

#- 306 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FIGDGloX' \
    --userId 'BzmtZzTY' \
    > test.out 2>&1
eval_tap $? 306 'GetUserOrderHistories' test.out

#- 307 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KHUFJBoB' \
    --userId 'j8C23a5W' \
    --body '{"additionalData": {"cardSummary": "xjjDpBup"}, "authorisedTime": "1972-01-21T00:00:00Z", "chargebackReversedTime": "1984-01-01T00:00:00Z", "chargebackTime": "1989-04-22T00:00:00Z", "chargedTime": "1982-07-08T00:00:00Z", "createdTime": "1996-04-30T00:00:00Z", "currency": {"currencyCode": "srSKaCG2", "currencySymbol": "nrjsszi7", "currencyType": "VIRTUAL", "decimals": 3, "namespace": "L4CsB4Zn"}, "customParameters": {"wIlArVon": {}, "ifkXTsiU": {}, "81m4j99j": {}}, "extOrderNo": "1ZwpT0oX", "extTxId": "HjuTW0GS", "extUserId": "8EhwhNHj", "issuedAt": "1987-10-08T00:00:00Z", "metadata": {"DqO1E1zk": "fHEahcwh", "uEi1bhPp": "brpyjjMt", "zciAgQVL": "dWFBb0qF"}, "namespace": "MMUwsQ5h", "nonceStr": "0TRtwUyi", "paymentData": {"discountAmount": 31, "discountCode": "DOGQJoPN", "subtotalPrice": 18, "tax": 68, "totalPrice": 70}, "paymentMethod": "HhGcYAQK", "paymentMethodFee": 68, "paymentOrderNo": "X3fXixyh", "paymentProvider": "WXPAY", "paymentProviderFee": 83, "paymentStationUrl": "jl49Ca0u", "price": 55, "refundedTime": "1985-10-08T00:00:00Z", "salesTax": 33, "sandbox": true, "sku": "UiU6PFJA", "status": "CHARGED", "statusReason": "J2BSRN2x", "subscriptionId": "bUisQt9G", "subtotalPrice": 58, "targetNamespace": "dqSlKiIy", "targetUserId": "O4tvfhA5", "tax": 0, "totalPrice": 53, "totalTax": 92, "txEndTime": "1976-10-10T00:00:00Z", "type": "CExib1e2", "userId": "QgYNZR1F", "vat": 43}' \
    > test.out 2>&1
eval_tap $? 307 'ProcessUserOrderNotification' test.out

#- 308 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '94fEOkIr' \
    --userId '2JMJSyTz' \
    > test.out 2>&1
eval_tap $? 308 'DownloadUserOrderReceipt' test.out

#- 309 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgAUdLlS' \
    --body '{"currencyCode": "Do9sH7Hu", "currencyNamespace": "OKFGepFv", "customParameters": {"DNPediZl": {}, "EdoOCWsf": {}, "HakYLWzy": {}}, "description": "EAO1KpvO", "extOrderNo": "1lGotdzp", "extUserId": "dE194PLV", "itemType": "OPTIONBOX", "language": "xC-JPgi", "metadata": {"NNqYseRl": "7IT09MCg", "SDc7ZLMx": "mfsOgOq8", "zaOePJKg": "XFjE5PKV"}, "notifyUrl": "Ub6VTNi7", "omitNotification": false, "platform": "Pm4W30qt", "price": 35, "recurringPaymentOrderNo": "ppKvJgis", "region": "c7cJKHnR", "returnUrl": "SBTeYons", "sandbox": true, "sku": "fT8NjQGP", "subscriptionId": "Z3p62kas", "title": "Ot7TGC9x"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateUserPaymentOrder' test.out

#- 310 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aVSD2aok' \
    --userId '0uh7zoRa' \
    --body '{"description": "pZ6Akr1T"}' \
    > test.out 2>&1
eval_tap $? 310 'RefundUserPaymentOrder' test.out

#- 311 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId '0WMOCEZz' \
    > test.out 2>&1
eval_tap $? 311 'GetUserPlatformAccountClosureHistories' test.out

#- 312 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '957aqyNF' \
    --body '{"code": "QV1cHW6a", "orderNo": "IUXTpAT3"}' \
    > test.out 2>&1
eval_tap $? 312 'ApplyUserRedemption' test.out

#- 313 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'v4iMk2XW' \
    --body '{"meta": {"JD0hCsXw": {}, "JdNZzue1": {}, "4SlxgFbX": {}}, "reason": "25EvoAqj", "requestId": "FssCRlin", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "jqP2birK", "namespace": "k3Jrl3DL"}, "entitlement": {"entitlementId": "1U3kzuAI"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "KNddWOzJ", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 58, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "Ugn3jhYB", "namespace": "rXF8n5tu"}, "entitlement": {"entitlementId": "X4M6c9AA"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "Jek9iltx", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 25, "type": "ITEM"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "lZ70Ylrv", "namespace": "QFODowBs"}, "entitlement": {"entitlementId": "xZN3ZvUK"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "Ka6oIxva", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 44, "type": "CURRENCY"}], "source": "DLC", "transactionId": "NJIMGh7r"}' \
    > test.out 2>&1
eval_tap $? 313 'DoRevocation' test.out

#- 314 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVQ1C6YN' \
    --body '{"gameSessionId": "hQbL2W3t", "payload": {"a7bQXG7M": {}, "J5Du8bSo": {}, "z6RCaGvu": {}}, "scid": "A18jf4PZ", "sessionTemplateName": "j4egZRsv"}' \
    > test.out 2>&1
eval_tap $? 314 'RegisterXblSessions' test.out

#- 315 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'JaYHi0Zt' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'zWALlGdO' \
    --limit '3' \
    --offset '85' \
    --sku 'XWLMb0Dd' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 315 'QueryUserSubscriptions' test.out

#- 316 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'AVS7RJL9' \
    --excludeSystem  \
    --limit '45' \
    --offset '93' \
    --subscriptionId 'obgYUl5G' \
    > test.out 2>&1
eval_tap $? 316 'GetUserSubscriptionActivities' test.out

#- 317 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'tORvLXrD' \
    --body '{"grantDays": 68, "itemId": "SeuU641W", "language": "RpLwhlfc", "reason": "0VZbrNjV", "region": "NCvk1JCH", "source": "XyC5zS9i"}' \
    > test.out 2>&1
eval_tap $? 317 'PlatformSubscribeSubscription' test.out

#- 318 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7tq4vekr' \
    --itemId 'jdIyAAUn' \
    > test.out 2>&1
eval_tap $? 318 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 319 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'H8SpkZer' \
    --userId '4tinAcCX' \
    > test.out 2>&1
eval_tap $? 319 'GetUserSubscription' test.out

#- 320 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jUblE3sO' \
    --userId 'vnnbd3Iz' \
    > test.out 2>&1
eval_tap $? 320 'DeleteUserSubscription' test.out

#- 321 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '13WJL992' \
    --userId '0vsw4QOk' \
    --force  \
    --body '{"immediate": false, "reason": "R4nedoBl"}' \
    > test.out 2>&1
eval_tap $? 321 'CancelSubscription' test.out

#- 322 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RxjUp41X' \
    --userId 'YulgfWmD' \
    --body '{"grantDays": 39, "reason": "9hXigRcq"}' \
    > test.out 2>&1
eval_tap $? 322 'GrantDaysToSubscription' test.out

#- 323 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Cb72kxbH' \
    --userId 'dB6ctFLU' \
    --excludeFree  \
    --limit '44' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 323 'GetUserSubscriptionBillingHistories' test.out

#- 324 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fsFKlVRv' \
    --userId 'pKedlrJm' \
    --body '{"additionalData": {"cardSummary": "7Z1rA01j"}, "authorisedTime": "1997-11-29T00:00:00Z", "chargebackReversedTime": "1989-12-01T00:00:00Z", "chargebackTime": "1997-02-05T00:00:00Z", "chargedTime": "1997-11-21T00:00:00Z", "createdTime": "1996-06-16T00:00:00Z", "currency": {"currencyCode": "KuotXwKs", "currencySymbol": "1ju4ugKE", "currencyType": "VIRTUAL", "decimals": 15, "namespace": "kdG7rM6Y"}, "customParameters": {"JhMevxfs": {}, "y8HLPPZU": {}, "XrqKGBtc": {}}, "extOrderNo": "GKExhAjw", "extTxId": "rgkdpXk3", "extUserId": "p3McuC3G", "issuedAt": "1998-05-30T00:00:00Z", "metadata": {"Ha5Cb1Po": "qL6MTG07", "5RvZeRvp": "yKZH4I88", "AyqfOivR": "6GOMjZZV"}, "namespace": "toDuOTli", "nonceStr": "71ovYK2v", "paymentData": {"discountAmount": 40, "discountCode": "jOPFuNZi", "subtotalPrice": 98, "tax": 7, "totalPrice": 11}, "paymentMethod": "WlT17HRd", "paymentMethodFee": 49, "paymentOrderNo": "rvlX3GlN", "paymentProvider": "XSOLLA", "paymentProviderFee": 54, "paymentStationUrl": "zszKmxms", "price": 53, "refundedTime": "1979-03-11T00:00:00Z", "salesTax": 93, "sandbox": true, "sku": "aAff4c2X", "status": "REFUNDING", "statusReason": "EZcakbKE", "subscriptionId": "3zgNzudc", "subtotalPrice": 90, "targetNamespace": "01ElxGQF", "targetUserId": "TPK5DbAL", "tax": 55, "totalPrice": 76, "totalTax": 67, "txEndTime": "1995-01-05T00:00:00Z", "type": "nG5iP6qi", "userId": "U13SxINa", "vat": 63}' \
    > test.out 2>&1
eval_tap $? 324 'ProcessUserSubscriptionNotification' test.out

#- 325 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'ZcmmJp6P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DV9CGjEv' \
    --body '{"count": 30, "orderNo": "SdkAdqxg"}' \
    > test.out 2>&1
eval_tap $? 325 'AcquireUserTicket' test.out

#- 326 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'YxPkg1EM' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserCurrencyWallets' test.out

#- 327 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'T9kN7mZd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2DzvYdq' \
    --body '{"allowOverdraft": false, "amount": 36, "balanceOrigin": "IOS", "balanceSource": "DLC_REVOCATION", "metadata": {"TxqtmIWW": {}, "WaVf8EDV": {}, "fNRnniSc": {}}, "reason": "L8fvEs03"}' \
    > test.out 2>&1
eval_tap $? 327 'DebitUserWalletByCurrencyCode' test.out

#- 328 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 's9GoYoHN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CAZw1o12' \
    --limit '8' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 328 'ListUserCurrencyTransactions' test.out

#- 329 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'CkXebQRb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xq69KWAx' \
    --request '{"amount": 41, "debitBalanceSource": "TRADE", "metadata": {"RAzrzLVm": {}, "RkB0nJNu": {}, "aPjNtMdI": {}}, "reason": "BCpYMg2I", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 329 'CheckBalance' test.out

#- 330 CheckWallet
eval_tap 0 330 'CheckWallet # SKIP deprecated' test.out

#- 331 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'St2e4ltc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CTVNoLAI' \
    --body '{"amount": 46, "expireAt": "1987-12-02T00:00:00Z", "metadata": {"HzYY87u7": {}, "6flIS80w": {}, "sRV1PnrR": {}}, "origin": "GooglePlay", "reason": "fWJQDI4V", "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 331 'CreditUserWallet' test.out

#- 332 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'qTpcLxDX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ee9VV3lq' \
    --request '{"amount": 77, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"tyB2S7DL": {}, "9EvPq5ZE": {}, "7IUEiCVM": {}}, "reason": "SNHqB397", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 332 'DebitByWalletPlatform' test.out

#- 333 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'TgQ9k4af' \
    --namespace "$AB_NAMESPACE" \
    --userId '58jOHVaP' \
    --body '{"amount": 90, "metadata": {"s03ls5uj": {}, "M1ukijey": {}, "g64smqE6": {}}, "walletPlatform": "GooglePlay"}' \
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
    --storeId 'NNgdprHY' \
    > test.out 2>&1
eval_tap $? 339 'ListViews' test.out

#- 340 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '3x11EcFt' \
    --body '{"displayOrder": 31, "localizations": {"BhSaGMpH": {"description": "aHCJyEFQ", "localExt": {"HGzMhF4T": {}, "qCjaNGDo": {}, "jOa7IMnx": {}}, "longDescription": "e6fROO96", "title": "lKfwvqEe"}, "suyzbRdU": {"description": "2Uks9uH0", "localExt": {"GMigm9hj": {}, "ZR4ZMBCB": {}, "MReXNyjM": {}}, "longDescription": "cWjX0OHh", "title": "2es7L0Ud"}, "ij09tsI0": {"description": "A861VkXI", "localExt": {"zFWYVpjI": {}, "IY6hlTF8": {}, "6RNPb6Wg": {}}, "longDescription": "JVDVSI7E", "title": "MVUKyLxv"}}, "name": "VmGhvPcR"}' \
    > test.out 2>&1
eval_tap $? 340 'CreateView' test.out

#- 341 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'qRNMwN1a' \
    --storeId 'NP9MTFLU' \
    > test.out 2>&1
eval_tap $? 341 'GetView' test.out

#- 342 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'kIfP0mvk' \
    --storeId 'fQOC33Hh' \
    --body '{"displayOrder": 11, "localizations": {"PhWKBuun": {"description": "0NUXN1hv", "localExt": {"nEOPNrrV": {}, "brbfxGCP": {}, "zCZgoQoh": {}}, "longDescription": "5w5K2qS5", "title": "ZCLXcpDm"}, "RIkC7Q24": {"description": "UQxUNYfy", "localExt": {"km6pWWwh": {}, "Mr4wECgl": {}, "3OacLL8l": {}}, "longDescription": "qXqVqrqI", "title": "rBe7RNgk"}, "sqjRS66t": {"description": "LEeT84gR", "localExt": {"7F6jNUDr": {}, "uszk3EiZ": {}, "qa7HumVe": {}}, "longDescription": "BNiuwpxc", "title": "do6rLvDK"}}, "name": "YmzhNGxD"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateView' test.out

#- 343 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'DIeWTPUz' \
    --storeId 'DPyqKgTN' \
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
    --body '[{"creditRequest": {"amount": 27, "expireAt": "1993-06-26T00:00:00Z", "metadata": {"79MBNrNd": {}, "rM3OxMZC": {}, "V5DbBNPK": {}}, "origin": "GooglePlay", "reason": "1cCvuKH8", "source": "PROMOTION"}, "currencyCode": "uNBxhDKD", "userIds": ["sD2tkGHJ", "xch0SVI6", "ocsWyIqa"]}, {"creditRequest": {"amount": 63, "expireAt": "1993-01-31T00:00:00Z", "metadata": {"Sp94hdM9": {}, "4bimB1k3": {}, "RpWIEfLz": {}}, "origin": "System", "reason": "AmNMmBx9", "source": "SELL_BACK"}, "currencyCode": "h3vSNM27", "userIds": ["8pTbf1BA", "e775J9iH", "lqe98sun"]}, {"creditRequest": {"amount": 44, "expireAt": "1980-10-20T00:00:00Z", "metadata": {"UrOjD4fB": {}, "Wvwdnf97": {}, "8POsHhFp": {}}, "origin": "System", "reason": "u55UwnK9", "source": "PROMOTION"}, "currencyCode": "dySjEriH", "userIds": ["b2CmLV3Y", "KGkudDXM", "VDUU3Suz"]}]' \
    > test.out 2>&1
eval_tap $? 347 'BulkCredit' test.out

#- 348 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "BysYXXgF", "request": {"allowOverdraft": true, "amount": 1, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"D9zc9Elp": {}, "EXrfy1Y6": {}, "Vp75yTAh": {}}, "reason": "0vUKdqPM"}, "userIds": ["9xtsqYk1", "2ecAlVXg", "2CRwxheI"]}, {"currencyCode": "TpPu462X", "request": {"allowOverdraft": true, "amount": 28, "balanceOrigin": "Oculus", "balanceSource": "PAYMENT", "metadata": {"5VLNPRJK": {}, "B4LnggeN": {}, "jPWDzPFu": {}}, "reason": "nmzNokZx"}, "userIds": ["ROXZG2Gq", "IfCWIvOR", "HDzOvOkr"]}, {"currencyCode": "8BraRTj4", "request": {"allowOverdraft": false, "amount": 19, "balanceOrigin": "Twitch", "balanceSource": "EXPIRATION", "metadata": {"OrAiEiND": {}, "hIjzG1bg": {}, "okOblRpm": {}}, "reason": "asTDahrg"}, "userIds": ["WFooLvGT", "cVFk0C8K", "SOmtnbvM"]}]' \
    > test.out 2>&1
eval_tap $? 348 'BulkDebit' test.out

#- 349 GetWallet
eval_tap 0 349 'GetWallet # SKIP deprecated' test.out

#- 350 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'YViYNHwF' \
    --end 'SydJYjjh' \
    --start 'MPlLrvC1' \
    > test.out 2>&1
eval_tap $? 350 'SyncOrders' test.out

#- 351 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["A06ey54a", "d367aMcb", "0BVt9Tai"], "apiKey": "mEM5UjDQ", "authoriseAsCapture": true, "blockedPaymentMethods": ["tcp3Rlmq", "fhgdYVAN", "McYiw6HG"], "clientKey": "mg6E0CiG", "dropInSettings": "IZBbadf2", "liveEndpointUrlPrefix": "ftFHDyYn", "merchantAccount": "HN9GDaKo", "notificationHmacKey": "Ln8cI8uF", "notificationPassword": "1mC0Vm8G", "notificationUsername": "iKKDddik", "returnUrl": "tQqkdi9x", "settings": "AWrajUHh"}' \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfig' test.out

#- 352 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "vn8PyqH9", "privateKey": "7bni39XW", "publicKey": "kaLASr4W", "returnUrl": "FalZE5FV"}' \
    > test.out 2>&1
eval_tap $? 352 'TestAliPayConfig' test.out

#- 353 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "OzGy345p", "secretKey": "GT4bGScu"}' \
    > test.out 2>&1
eval_tap $? 353 'TestCheckoutConfig' test.out

#- 354 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Kca076Rd' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentMerchantConfig' test.out

#- 355 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "7sZDEI3A", "webhookSecretKey": "dRKdH5vX"}' \
    > test.out 2>&1
eval_tap $? 355 'TestNeonPayConfig' test.out

#- 356 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "CNAW7XNa", "clientSecret": "MUJQwngj", "returnUrl": "cG7oJYD1", "webHookId": "u3wOpWvE"}' \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfig' test.out

#- 357 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["63thcZw2", "7TaNK3DC", "YsylPRoM"], "publishableKey": "2CwashIq", "secretKey": "OY5DiV9J", "webhookSecret": "siGcUveE"}' \
    > test.out 2>&1
eval_tap $? 357 'TestStripeConfig' test.out

#- 358 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "KtSw43tx", "key": "LgKAyudL", "mchid": "FxMIon2a", "returnUrl": "0W2u0jir"}' \
    > test.out 2>&1
eval_tap $? 358 'TestWxPayConfig' test.out

#- 359 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Aw4m7xwY", "flowCompletionUrl": "jMji06Yb", "merchantId": 14, "projectId": 70, "projectSecretKey": "UtdtP0oP"}' \
    > test.out 2>&1
eval_tap $? 359 'TestXsollaConfig' test.out

#- 360 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'hLgn6Se7' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentMerchantConfig1' test.out

#- 361 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'DRJhvZqm' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["e3QFcrjO", "gqHefuyo", "63eclx7e"], "apiKey": "4P5h0E1t", "authoriseAsCapture": true, "blockedPaymentMethods": ["Qlaaxbmp", "yW0QhnKi", "l9De8HVQ"], "clientKey": "Sic0uTPc", "dropInSettings": "sGO6XfJT", "liveEndpointUrlPrefix": "c5UpexLO", "merchantAccount": "rZbPimLs", "notificationHmacKey": "rU4j352z", "notificationPassword": "fcIRTRch", "notificationUsername": "LJVkG5Gt", "returnUrl": "foMPk2IM", "settings": "W8H4bV7Z"}' \
    > test.out 2>&1
eval_tap $? 361 'UpdateAdyenConfig' test.out

#- 362 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'IuP37Ygj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfigById' test.out

#- 363 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '2IjHXsu4' \
    --sandbox  \
    --validate  \
    --body '{"appId": "ZWZRmWbq", "privateKey": "qEKHKBMw", "publicKey": "bonqYmim", "returnUrl": "3WyPepWm"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAliPayConfig' test.out

#- 364 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'NmLuOl42' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAliPayConfigById' test.out

#- 365 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'PLcnL0Rt' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "dWcR1c8F", "secretKey": "FZKkCpta"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateCheckoutConfig' test.out

#- 366 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'PHwEQ25v' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestCheckoutConfigById' test.out

#- 367 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'Lum1Gxym' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "RIEmubjQ", "webhookSecretKey": "1dWG8x64"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateNeonPayConfig' test.out

#- 368 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id '5F2cBnU8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestNeonPayConfigById' test.out

#- 369 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ObmovNC6' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "yIs3CrCv", "clientSecret": "D6A80lee", "returnUrl": "I5GcUVW1", "webHookId": "TehnvHvE"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdatePayPalConfig' test.out

#- 370 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'eeh2jWoF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestPayPalConfigById' test.out

#- 371 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'WNmqD70j' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["AcBD4WFA", "KuNiFo2a", "8Sw03H0o"], "publishableKey": "8ETkUiB5", "secretKey": "2PTzMqS7", "webhookSecret": "OIyO1waW"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdateStripeConfig' test.out

#- 372 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'kmvPFWim' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestStripeConfigById' test.out

#- 373 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'XqumMaRu' \
    --validate  \
    --body '{"appId": "FagreOkC", "key": "wvfRchL4", "mchid": "fSnUot64", "returnUrl": "ecuOMyQk"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateWxPayConfig' test.out

#- 374 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'VMAeAAKn' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 374 'UpdateWxPayConfigCert' test.out

#- 375 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'VopXjeut' \
    > test.out 2>&1
eval_tap $? 375 'TestWxPayConfigById' test.out

#- 376 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'laDv6TBN' \
    --validate  \
    --body '{"apiKey": "gYcooRjp", "flowCompletionUrl": "skpDf6hK", "merchantId": 75, "projectId": 45, "projectSecretKey": "ycrRt2o0"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateXsollaConfig' test.out

#- 377 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'zfEyyh2Q' \
    > test.out 2>&1
eval_tap $? 377 'TestXsollaConfigById' test.out

#- 378 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'jkgzNtJn' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaUIConfig' test.out

#- 379 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '22' \
    --namespace "$AB_NAMESPACE" \
    --offset '20' \
    --region 'dvqlGyIs' \
    > test.out 2>&1
eval_tap $? 379 'QueryPaymentProviderConfig' test.out

#- 380 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "IHT2rtYh", "region": "dW8rb6tl", "sandboxTaxJarApiToken": "HZyZb6mM", "specials": ["XSOLLA", "ADYEN", "WXPAY"], "taxJarApiToken": "s0jIF7kX", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 380 'CreatePaymentProviderConfig' test.out

#- 381 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 381 'GetAggregatePaymentProviders' test.out

#- 382 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'pw7Tvsct' \
    > test.out 2>&1
eval_tap $? 382 'DebugMatchedPaymentProviderConfig' test.out

#- 383 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetSpecialPaymentProviders' test.out

#- 384 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'kf391ZMS' \
    --body '{"aggregate": "ADYEN", "namespace": "ou8XNvfE", "region": "FF6rvV1b", "sandboxTaxJarApiToken": "CWPvrPeB", "specials": ["PAYPAL", "PAYPAL", "ALIPAY"], "taxJarApiToken": "2hIpWtCN", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 384 'UpdatePaymentProviderConfig' test.out

#- 385 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'LUgm1G48' \
    > test.out 2>&1
eval_tap $? 385 'DeletePaymentProviderConfig' test.out

#- 386 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 386 'GetPaymentTaxConfig' test.out

#- 387 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Q17XzjZ1", "taxJarApiToken": "MMLnLsZK", "taxJarEnabled": false, "taxJarProductCodesMapping": {"faAUavTg": "9YQHkzVj", "8qtqVo5o": "w5vooysF", "ROnb1ZgQ": "AA3oIAEY"}}' \
    > test.out 2>&1
eval_tap $? 387 'UpdatePaymentTaxConfig' test.out

#- 388 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'gO9oHLK6' \
    --end 'SQbtwYhG' \
    --start 'd9QjcS6i' \
    > test.out 2>&1
eval_tap $? 388 'SyncPaymentOrders' test.out

#- 389 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'G3gA9qLQ' \
    --storeId 'FkITPIEz' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetRootCategories' test.out

#- 390 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'iNQ6ThCS' \
    --storeId 'yyTWOXwu' \
    > test.out 2>&1
eval_tap $? 390 'DownloadCategories' test.out

#- 391 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'AISFpYkP' \
    --namespace "$AB_NAMESPACE" \
    --language 'CWTj7uyE' \
    --storeId 'rq516efY' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetCategory' test.out

#- 392 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'ryy861sD' \
    --namespace "$AB_NAMESPACE" \
    --language 'CcqxbpmP' \
    --storeId 'Ce2x85DE' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetChildCategories' test.out

#- 393 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'g7yF0XjM' \
    --namespace "$AB_NAMESPACE" \
    --language 'SVkVozlb' \
    --storeId 'kUfmtONt' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetDescendantCategories' test.out

#- 394 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 394 'PublicListCurrencies' test.out

#- 395 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
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
    --platform 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 397 'GetIAPItemMapping' test.out

#- 398 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'pp6ciK3B' \
    --region '7d7AZNGq' \
    --storeId 'yr7rM39o' \
    --appId 'bMHS7n97' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItemByAppId' test.out

#- 399 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId '7Y53Upp0' \
    --categoryPath 'wOLDxAI9' \
    --features 'GmZqVQgq' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'hRcT1dN0' \
    --limit '30' \
    --offset '48' \
    --region '0Dgs4FUt' \
    --sortBy 'createdAt:asc,updatedAt,name:desc' \
    --storeId 'StGjmWqC' \
    --tags 'y5JRjQYT' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryItems' test.out

#- 400 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'e8suaBNf' \
    --region 'h5KbmjI6' \
    --storeId '5pVOm9r0' \
    --sku 'hdDi523f' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemBySku' test.out

#- 401 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'QNwDSHMr' \
    --storeId 'CvhT05qv' \
    --itemIds 'PGejyjen' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetEstimatedPrice' test.out

#- 402 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'tqnivia2' \
    --region 'F3pnhD00' \
    --storeId 'QslT42Qc' \
    --itemIds 'HUlwgAX5' \
    > test.out 2>&1
eval_tap $? 402 'PublicBulkGetItems' test.out

#- 403 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["RWQsKxRD", "pYQz0lw5", "m63KRkrV"]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicValidateItemPurchaseCondition' test.out

#- 404 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'BUNDLE' \
    --limit '3' \
    --offset '77' \
    --region 'Ja82kelA' \
    --storeId 'W8HGXq32' \
    --keyword 'Q8OhfALT' \
    --language 'svF3AOJc' \
    > test.out 2>&1
eval_tap $? 404 'PublicSearchItems' test.out

#- 405 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'GVn8EDok' \
    --namespace "$AB_NAMESPACE" \
    --language 'ThIdVcEd' \
    --region 'RnjDL2SY' \
    --storeId 'qJBEZYe4' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetApp' test.out

#- 406 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '4V9myMsj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetItemDynamicData' test.out

#- 407 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'gyPX6Jon' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'k7iPx06e' \
    --populateBundle  \
    --region 'hU0qNqPD' \
    --storeId 'oc9bLatK' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItem' test.out

#- 408 GetPaymentCustomization
eval_tap 0 408 'GetPaymentCustomization # SKIP deprecated' test.out

#- 409 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "UY4Fzg9Y", "successUrl": "1ywUKeQa"}, "paymentOrderNo": "fERA6OxU", "paymentProvider": "ADYEN", "returnUrl": "QDu6TfSs", "ui": "jx4BudD9", "zipCode": "tECoxQYa"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetPaymentUrl' test.out

#- 410 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6ua5PPdm' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetPaymentMethods' test.out

#- 411 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BXE23g53' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUnpaidPaymentOrder' test.out

#- 412 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '90fST1po' \
    --paymentProvider 'NEONPAY' \
    --zipCode 'eZ1gH3VJ' \
    --body '{"token": "7zyFNoHn"}' \
    > test.out 2>&1
eval_tap $? 412 'Pay' test.out

#- 413 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'FXQt9RYI' \
    > test.out 2>&1
eval_tap $? 413 'PublicCheckPaymentOrderPaidStatus' test.out

#- 414 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'YFmtibs0' \
    > test.out 2>&1
eval_tap $? 414 'GetPaymentPublicConfig' test.out

#- 415 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'h12GNR1U' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetQRCode' test.out

#- 416 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'wonG6968' \
    --foreinginvoice 'CjsNl5Yv' \
    --invoiceId 'ymomD98K' \
    --payload 'sDOjhKqc' \
    --redirectResult '87dEqco2' \
    --resultCode 'XpkVT0uE' \
    --sessionId 'bvBZIDjd' \
    --status 'RYuvoaEs' \
    --token 'D4eKxqSq' \
    --type 'tAtuzR3P' \
    --userId 'mCRFvVJH' \
    --orderNo 'COsNwjYe' \
    --paymentOrderNo 'HebJwnEW' \
    --paymentProvider 'XSOLLA' \
    --returnUrl '0a80VEgb' \
    > test.out 2>&1
eval_tap $? 416 'PublicNormalizePaymentReturnUrl' test.out

#- 417 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'gtTdp5XZ' \
    --paymentOrderNo 'Oq073i4O' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 417 'GetPaymentTaxValue' test.out

#- 418 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'W9WWoGq0' \
    > test.out 2>&1
eval_tap $? 418 'GetRewardByCode' test.out

#- 419 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ApAjPIPe' \
    --limit '77' \
    --offset '86' \
    --sortBy 'namespace:asc,rewardCode:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 419 'QueryRewards1' test.out

#- 420 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vqViw3lM' \
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
    --appIds 'OZVmlcjD,E3T7J7wG,pOzueph3' \
    --itemIds 'hx6azJRT,4e3VTuWd,yCS66Clv' \
    --skus 'EHg0Dr1r,4QvN2tvm,WDjGiQSl' \
    > test.out 2>&1
eval_tap $? 422 'PublicExistsAnyMyActiveEntitlement' test.out

#- 423 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'SLET9dTw' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 424 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'uiFYO0eW' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 425 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'RlETQ1jr' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 426 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'tJ0D1u9R,m6poDSaV,UB7iPu0p' \
    --itemIds 'ta9jJeGg,UgnYThbM,y7aGONRD' \
    --skus 'ydfoHuy3,qeIedQRG,ORCpB663' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetEntitlementOwnershipToken' test.out

#- 427 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "5eO2k8nx", "language": "DG-437", "region": "jNNnolzq"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncTwitchDropsEntitlement' test.out

#- 428 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '5lFWGe1d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyWallet' test.out

#- 429 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukEfCZzE' \
    --body '{"epicGamesJwtToken": "WvPyyB3M"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncEpicGameDLC' test.out

#- 430 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'pYBNBnnl' \
    > test.out 2>&1
eval_tap $? 430 'SyncOculusDLC' test.out

#- 431 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MTNO6DK8' \
    --body '{"serviceLabel": 74}' \
    > test.out 2>&1
eval_tap $? 431 'PublicSyncPsnDlcInventory' test.out

#- 432 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qei8eLfp' \
    --body '{"serviceLabels": [74, 53, 46]}' \
    > test.out 2>&1
eval_tap $? 432 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 433 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofc2NlH5' \
    --body '{"appId": "xN36QWN6", "steamId": "aVJbxLSy"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncSteamDLC' test.out

#- 434 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VRduYJdP' \
    --body '{"xstsToken": "3pJwV5IE"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxDLC' test.out

#- 435 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '81NlXklI' \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '5sJ3SRYy' \
    --features 'DQMv6N54,2cCMU86F,7120yJDy' \
    --itemId '7Ijh9AoX,CXkGHYas,s4NREoLh' \
    --limit '74' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserEntitlements' test.out

#- 436 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '18r7pkR4' \
    --appId '0hkNYZ1E' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserAppEntitlementByAppId' test.out

#- 437 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'B536xHVI' \
    --limit '9' \
    --offset '71' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlementsByAppType' test.out

#- 438 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQQM1Q4j' \
    --availablePlatformOnly  \
    --ids 'iGiPVdl6,RMO1x8s9,QloEYVZo' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlementsByIds' test.out

#- 439 PublicGetUserEntitlementByItemId
eval_tap 0 439 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 440 PublicGetUserEntitlementBySku
eval_tap 0 440 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 441 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4uP3xhp' \
    --endDate 'l71gSN6y' \
    --entitlementClazz 'APP' \
    --limit '38' \
    --offset '35' \
    --startDate 'qdEIUV4r' \
    > test.out 2>&1
eval_tap $? 441 'PublicUserEntitlementHistory' test.out

#- 442 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDh0pRvD' \
    --appIds 'HlfiHYh3,ECmJjpGn,qoXhhnw6' \
    --itemIds 'A6M9vTqw,Q79L82Ua,gcdip0dN' \
    --skus 'mry8sGdS,RbO8s6cW,iLydzViT' \
    > test.out 2>&1
eval_tap $? 442 'PublicExistsAnyUserActiveEntitlement' test.out

#- 443 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NpwFzvgg' \
    --appId 'YIobtBSH' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 444 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OzURI5XW' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'yjzgmv4i' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 445 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'J6M12WwG' \
    --ids 'bWZVTNZs,nwgT8Ip9,Os9ZGyIn' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 446 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlVsJdL7' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'IaKCOHEd' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 447 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'z9k9aiey' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeduxV6O' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlement' test.out

#- 448 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '0hPrBBOY' \
    --namespace "$AB_NAMESPACE" \
    --userId '0yfokmMO' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["H0UbhEWJ", "xWAyVNFp", "mluPiL10"], "requestId": "CXwwLRnZ", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 448 'PublicConsumeUserEntitlement' test.out

#- 449 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'LmtRBG9B' \
    --namespace "$AB_NAMESPACE" \
    --userId '8Dk3dHgz' \
    --body '{"requestId": "I2kNZJtx", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 449 'PublicSellUserEntitlement' test.out

#- 450 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'sfJOdfLU' \
    --namespace "$AB_NAMESPACE" \
    --userId '6FrjhsHg' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 450 'PublicSplitUserEntitlement' test.out

#- 451 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'xS3ZIRcr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTHj5qw9' \
    --body '{"entitlementId": "ZbiKKeIg", "metadata": {"operationSource": "INVENTORY"}, "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 451 'PublicTransferUserEntitlement' test.out

#- 452 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqurpuHz' \
    --body '{"code": "HFzDzmFi", "language": "IHmd-RmAW", "region": "dhZQfnZj"}' \
    > test.out 2>&1
eval_tap $? 452 'PublicRedeemCode' test.out

#- 453 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWA7W7A7' \
    --body '{"excludeOldTransactions": true, "language": "cZTI-JjvU_GO", "productId": "hDTf9aul", "receiptData": "NzPp4y0j", "region": "AU9PXyk8", "transactionId": "BR9hpEBP"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicFulfillAppleIAPItem' test.out

#- 454 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QfsUe3qL' \
    --body '{"epicGamesJwtToken": "A8Vyufvr"}' \
    > test.out 2>&1
eval_tap $? 454 'SyncEpicGamesInventory' test.out

#- 455 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfQT9Eak' \
    --body '{"autoAck": true, "autoConsume": false, "language": "tkC", "orderId": "nGRt1zEb", "packageName": "XyhlFdeJ", "productId": "qwFaU1rl", "purchaseTime": 64, "purchaseToken": "LTKUbW6I", "region": "nKjvehEi", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillGoogleIAPItem' test.out

#- 456 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ehKaAg3l' \
    > test.out 2>&1
eval_tap $? 456 'SyncOculusConsumableEntitlements' test.out

#- 457 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'uH7TuHJs' \
    --body '{"currencyCode": "1vM1dmWF", "price": 0.6893694219068417, "productId": "pxtSkz50", "serviceLabel": 39}' \
    > test.out 2>&1
eval_tap $? 457 'PublicReconcilePlayStationStore' test.out

#- 458 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'N3ylUqcr' \
    --body '{"currencyCode": "M89yJKb1", "price": 0.7187708541559426, "productId": "m4ETUGce", "serviceLabels": [33, 61, 95]}' \
    > test.out 2>&1
eval_tap $? 458 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 459 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zj1gBHyK' \
    --body '{"appId": "XSr2VX0p", "currencyCode": "ACYJcebz", "language": "SO_DVsk", "price": 0.10031417362049122, "productId": "jrCrOPgb", "region": "6xy5qloq", "steamId": "zrLWjw4m"}' \
    > test.out 2>&1
eval_tap $? 459 'SyncSteamInventory' test.out

#- 460 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'FtijF2sX' \
    > test.out 2>&1
eval_tap $? 460 'SyncSteamAbnormalTransaction' test.out

#- 461 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rtu7Vkpf' \
    --body '{"orderId": "MlG4afJ8"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamIAPByTransaction' test.out

#- 462 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'fqqIcbQQ' \
    --activeOnly  \
    --groupId 'QCJLh5K1' \
    --limit '50' \
    --offset '67' \
    --productId '4TGy6XhW' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserThirdPartySubscription' test.out

#- 463 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mGlJCmKD' \
    --body '{"gameId": "D8yTrKQr", "language": "aEh_rcZe_pa", "region": "pUPc4Beh"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncTwitchDropsEntitlement1' test.out

#- 464 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xjo9KUiE' \
    --body '{"currencyCode": "EREv6aM9", "price": 0.0958560116154693, "productId": "WBWubb2v", "xstsToken": "NqzIKcIf"}' \
    > test.out 2>&1
eval_tap $? 464 'SyncXboxInventory' test.out

#- 465 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDtrJQZX' \
    --discounted  \
    --itemId 'vPziEEAY' \
    --limit '54' \
    --offset '17' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 465 'PublicQueryUserOrders' test.out

#- 466 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSbVUMDA' \
    --body '{"currencyCode": "xwoCEHrQ", "discountCodes": ["4WZ74pQC", "QoLzkv7x", "iFTsboEo"], "discountedPrice": 8, "ext": {"OnEwGnF9": {}, "ieQ6twsW": {}, "nt1Ur6NT": {}}, "itemId": "TY9Dv2la", "language": "Lh", "price": 26, "quantity": 80, "region": "b0hhTxNQ", "returnUrl": "yBP5Yhle", "sectionId": "AQrYF4Lf"}' \
    > test.out 2>&1
eval_tap $? 466 'PublicCreateUserOrder' test.out

#- 467 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId '3amXJtPI' \
    --body '{"currencyCode": "fJ4THD0J", "discountCodes": ["Ehk558T6", "VfgNGu0E", "xFeLi8s8"], "discountedPrice": 4, "itemId": "s3o463bh", "price": 70, "quantity": 77}' \
    > test.out 2>&1
eval_tap $? 467 'PublicPreviewOrderPrice' test.out

#- 468 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '26vlVBWH' \
    --userId 'gLd0qlsh' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserOrder' test.out

#- 469 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ba8SRRyf' \
    --userId 'U9OO2bYc' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelUserOrder' test.out

#- 470 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'skAY7UnC' \
    --userId 'U7Tg4wOO' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrderHistories' test.out

#- 471 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ljR2GspE' \
    --userId 'TZNTi20m' \
    > test.out 2>&1
eval_tap $? 471 'PublicDownloadUserOrderReceipt' test.out

#- 472 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrukW2zp' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetPaymentAccounts' test.out

#- 473 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'byJ3kGJd' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'ujpjWYen' \
    > test.out 2>&1
eval_tap $? 473 'PublicDeletePaymentAccount' test.out

#- 474 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '4y1qOSqd' \
    --autoCalcEstimatedPrice  \
    --language 'QHL2QFtM' \
    --region 'ZvvmZ1Hw' \
    --storeId 'fdsF0ofF' \
    --viewId 'nByAs97y' \
    > test.out 2>&1
eval_tap $? 474 'PublicListActiveSections' test.out

#- 475 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VE2phe9z' \
    --chargeStatus 'CHARGED' \
    --itemId 'hryQYPNB' \
    --limit '5' \
    --offset '18' \
    --sku 'BRWN7r27' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserSubscriptions' test.out

#- 476 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgspgGq1' \
    --body '{"currencyCode": "7iU0kzcC", "itemId": "p7Yluu4f", "language": "uCu-JRyN", "region": "YSwLtqBk", "returnUrl": "4zHG9D6o", "source": "8F45Zsy0"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicSubscribeSubscription' test.out

#- 477 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SA4Yy6FP' \
    --itemId 'cppOjwig' \
    > test.out 2>&1
eval_tap $? 477 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 478 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GsEJMpT1' \
    --userId 'mFodMaV6' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserSubscription' test.out

#- 479 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lvGbT1Sn' \
    --userId '7W6tLJVV' \
    > test.out 2>&1
eval_tap $? 479 'PublicChangeSubscriptionBillingAccount' test.out

#- 480 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4xBUOH38' \
    --userId 'L007NMWZ' \
    --body '{"immediate": true, "reason": "K1xdrq17"}' \
    > test.out 2>&1
eval_tap $? 480 'PublicCancelSubscription' test.out

#- 481 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OiTWUL9x' \
    --userId 'Xwt49vcl' \
    --excludeFree  \
    --limit '28' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 481 'PublicGetUserSubscriptionBillingHistories' test.out

#- 482 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '9rumEJTm' \
    --language 'bUy57PMk' \
    --storeId 'oMfcM6Z8' \
    > test.out 2>&1
eval_tap $? 482 'PublicListViews' test.out

#- 483 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'l0SZdCWW' \
    --namespace "$AB_NAMESPACE" \
    --userId '3rTtx9mX' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetWallet' test.out

#- 484 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'RtJzMXdy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EflNl5Se' \
    --limit '42' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 484 'PublicListUserWalletTransactions' test.out

#- 485 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetMyDLCContent' test.out

#- 486 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'LvrvOFCM' \
    --limit '79' \
    --offset '27' \
    --startTime 'gDweTMs8' \
    --state 'REVOKE_FAILED' \
    --transactionId '3Ne21MgT' \
    --userId 'afcrrWxb' \
    > test.out 2>&1
eval_tap $? 486 'QueryFulfillments' test.out

#- 487 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'rak64wZZ' \
    --baseAppId 'Leu8xmUR' \
    --categoryPath 'frpc2D3Z' \
    --features 'yKUrWjMv' \
    --includeSubCategoryItem  \
    --itemName 'nYjN0JfX' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP,MEDIA,LOOTBOX' \
    --limit '64' \
    --offset '45' \
    --region 'cYeQPZzY' \
    --sectionExclusive  \
    --sortBy 'createdAt:asc,name:desc,name:asc' \
    --storeId 'ivoZb3mG' \
    --tags 'g2Sge4sJ' \
    --targetNamespace 'qUt9DJab' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 487 'QueryItemsV2' test.out

#- 488 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MZLpnGZT' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 488 'ImportStore1' test.out

#- 489 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a3hav7kL' \
    --body '{"itemIds": ["6cCeUY4k", "9jY3tcQO", "0f4FsSrc"]}' \
    > test.out 2>&1
eval_tap $? 489 'ExportStore1' test.out

#- 490 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K1tXmxYq' \
    --body '{"entitlementCollectionId": "M7vt5rPY", "entitlementOrigin": "Other", "metadata": {"kBdO38j2": {}, "mLogNXh2": {}, "gxhDijjj": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "VT1T5Sly", "namespace": "gmQwOFNO"}, "item": {"itemId": "4eywiY4O", "itemName": "kjJg9tBA", "itemSku": "PVscoXDf", "itemType": "O5U5VqsA"}, "quantity": 56, "type": "ITEM"}, {"currency": {"currencyCode": "duyNbD9R", "namespace": "OtwQBucK"}, "item": {"itemId": "5zBJ6K2D", "itemName": "Nfu1Vb3Z", "itemSku": "SdNSk5v1", "itemType": "hdN7fXGq"}, "quantity": 77, "type": "CURRENCY"}, {"currency": {"currencyCode": "iXrszdI7", "namespace": "LOVp8llJ"}, "item": {"itemId": "5zUZOt7t", "itemName": "iJVyawXF", "itemSku": "tk02I7c0", "itemType": "ZzGZaSFS"}, "quantity": 51, "type": "CURRENCY"}], "source": "ACHIEVEMENT", "transactionId": "R8BKewgy"}' \
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
    --userId 'N2hGTU9T' \
    --body '{"transactionId": "14wWtDay"}' \
    > test.out 2>&1
eval_tap $? 494 'V2PublicFulfillAppleIAPItem' test.out

#- 495 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'BYzup0ka' \
    --userId 'SijnF7uR' \
    --body '{"items": [{"duration": 8, "endDate": "1976-08-31T00:00:00Z", "entitlementCollectionId": "YoAOnJ8L", "entitlementOrigin": "Nintendo", "itemId": "Q2BUWgfy", "itemSku": "Iygvbh4I", "language": "4ouHvxT5", "metadata": {"aM2mH4Ne": {}, "zxZT4LbF": {}, "PRANCml4": {}}, "orderNo": "TmM26oBk", "origin": "Twitch", "quantity": 15, "region": "nGPKE8qC", "source": "OTHER", "startDate": "1993-02-16T00:00:00Z", "storeId": "mDLw7aCu"}, {"duration": 80, "endDate": "1983-03-28T00:00:00Z", "entitlementCollectionId": "Ms7K7sju", "entitlementOrigin": "Epic", "itemId": "5q26IBpp", "itemSku": "QCbS2JYK", "language": "pe1sCzUR", "metadata": {"U89qB8FU": {}, "z4NaIqZ3": {}, "3GAfdki2": {}}, "orderNo": "L67wA5KR", "origin": "System", "quantity": 40, "region": "8vljolN5", "source": "PROMOTION", "startDate": "1981-07-25T00:00:00Z", "storeId": "CFn634V9"}, {"duration": 0, "endDate": "1994-10-30T00:00:00Z", "entitlementCollectionId": "4XksLDn7", "entitlementOrigin": "Playstation", "itemId": "986biakY", "itemSku": "iVLwbvZl", "language": "B3UC5Tbx", "metadata": {"Fofa8rYv": {}, "J255MTwU": {}, "gJ9wQkqr": {}}, "orderNo": "YVbqCBca", "origin": "Epic", "quantity": 23, "region": "k8cgGkUu", "source": "PURCHASE", "startDate": "1980-05-02T00:00:00Z", "storeId": "vSNMMJtz"}]}' \
    > test.out 2>&1
eval_tap $? 495 'FulfillItemsV3' test.out

#- 496 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'HP8oRrCx' \
    --userId 'seJXiiqf' \
    > test.out 2>&1
eval_tap $? 496 'RetryFulfillItemsV3' test.out

#- 497 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'k37n6Hvb' \
    --userId '75WHxRPS' \
    > test.out 2>&1
eval_tap $? 497 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
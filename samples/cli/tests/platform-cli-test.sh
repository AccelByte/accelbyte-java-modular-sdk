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
echo "1..449"

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
    --id 'OJQM0rzX' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'HwrnFfJr' \
    --body '{"grantDays": "XQ8lljXn"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'CSjHCAym' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '0FggB7re' \
    --body '{"grantDays": "wdozSaDb"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "s8ae6h9G", "dryRun": false, "fulfillmentUrl": "BJD95uhS", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "J7oUSoQO"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'mLbrXDAl' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '5p1UO98x' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'xsuvZerL' \
    --body '{"clazz": "V4qddCtr", "dryRun": true, "fulfillmentUrl": "RyBHvZut", "purchaseConditionUrl": "EwHqG3U9"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'IEzAbCJd' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --name '0rYkqw4J' \
    --offset '79' \
    --tag 'eBJYRNTx' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "sFyd8hjW", "discountConfig": {"categories": [{"categoryPath": "2dXsuiyf", "includeSubCategories": false}, {"categoryPath": "l73KaS29", "includeSubCategories": false}, {"categoryPath": "rF6aTAo0", "includeSubCategories": false}], "currencyCode": "nOUePt3C", "currencyNamespace": "krOOUjSk", "discountAmount": 44, "discountPercentage": 36, "discountType": "PERCENTAGE", "items": [{"itemId": "Pf3Tewl7", "itemName": "S81Lhvi4"}, {"itemId": "xk67V8Ra", "itemName": "APbTAn5s"}, {"itemId": "Wh1FTrKp", "itemName": "gV5DjAxq"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 68, "itemId": "FqH72zn6", "itemName": "CZ9JGYum", "quantity": 68}, {"extraSubscriptionDays": 55, "itemId": "OP5SQBlx", "itemName": "qXgrdi2X", "quantity": 36}, {"extraSubscriptionDays": 90, "itemId": "3CnSMecU", "itemName": "woWs8hCx", "quantity": 16}], "maxRedeemCountPerCampaignPerUser": 12, "maxRedeemCountPerCode": 66, "maxRedeemCountPerCodePerUser": 7, "maxSaleCount": 51, "name": "BmZhRP5D", "redeemEnd": "1999-07-18T00:00:00Z", "redeemStart": "1975-06-02T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["i81WpLtr", "qH3KrXYE", "WlafV51U"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'ICf6XEqF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'gZAOIysR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lEYOxCNm", "discountConfig": {"categories": [{"categoryPath": "1eD7eyK7", "includeSubCategories": true}, {"categoryPath": "o8CekuNN", "includeSubCategories": true}, {"categoryPath": "IKLh6tXB", "includeSubCategories": true}], "currencyCode": "RhZuLwOe", "currencyNamespace": "bvRo152Q", "discountAmount": 22, "discountPercentage": 30, "discountType": "PERCENTAGE", "items": [{"itemId": "D9ydlawZ", "itemName": "8JTX0lKQ"}, {"itemId": "gbyywiGh", "itemName": "kd4rAmmz"}, {"itemId": "Iw4Q7inr", "itemName": "rPvtiDfg"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": false}, "items": [{"extraSubscriptionDays": 49, "itemId": "QaxX3JYX", "itemName": "MFCvt6sV", "quantity": 73}, {"extraSubscriptionDays": 53, "itemId": "xUSRpBjA", "itemName": "ekwzbIH6", "quantity": 75}, {"extraSubscriptionDays": 64, "itemId": "gzX4z5WL", "itemName": "U2YztVX8", "quantity": 65}], "maxRedeemCountPerCampaignPerUser": 35, "maxRedeemCountPerCode": 69, "maxRedeemCountPerCodePerUser": 19, "maxSaleCount": 10, "name": "JFIqUL2Q", "redeemEnd": "1995-12-08T00:00:00Z", "redeemStart": "1999-11-24T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["KbuHhcBj", "vaTDWMpm", "xyP8qHN2"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'siJBgofB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform getCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCatalogConfig' test.out

#- 19 UpdateCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform updateCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableInventoryCheck": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateCatalogConfig' test.out

#- 20 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetLootBoxPluginConfig' test.out

#- 21 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "wOIGJZ1I"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "8DxaH4UD"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateLootBoxPluginConfig' test.out

#- 22 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteLootBoxPluginConfig' test.out

#- 23 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'UplodLootBoxPluginConfigCert' test.out

#- 24 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 24 'GetLootBoxGrpcInfo' test.out

#- 25 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetSectionPluginConfig' test.out

#- 26 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "NaHsXv7T"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "SVcsITF5"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateSectionPluginConfig' test.out

#- 27 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteSectionPluginConfig' test.out

#- 28 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 28 'UploadSectionPluginConfigCert' test.out

#- 29 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '8ptEb8qN' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XdFMbaDk' \
    --body '{"categoryPath": "FICl6C8h", "localizationDisplayNames": {"rlpHhmS7": "xJR20omJ", "qrwuw76H": "oM0Ydyuj", "YQIbvm2N": "rlEkceIv"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gWK4LXXe' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'qRKrdpd7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oidPzXuX' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'z2rXGBD5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nkjsfCGK' \
    --body '{"localizationDisplayNames": {"qePSjGiV": "weXsr51S", "zFpd2f83": "1ZxIa2WT", "2P68qYjV": "YVQ8gGYA"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'rhD2eMlg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AEVBXPu5' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '8IN4fhbb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bByC5xB6' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'sNrcBI7E' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IShoKjpr' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Y9gd3ViX' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '27' \
    --code 'u5RU7Oq5' \
    --limit '36' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'ghEfr65k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "G9D86o6A", "quantity": 62}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'DPcNFPbY' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '39' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '9EB3sDRs' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '8' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'jDJG138F' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '95' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'aHBkd2vk' \
    --namespace "$AB_NAMESPACE" \
    --code 'X2zvwWb2' \
    --limit '25' \
    --offset '58' \
    --userId 'op9Q9Oqx' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'orIT4ZiD' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'STWT6nQm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'uwJ2nSnG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'EnableCode' test.out

#- 46 GetServicePluginConfig
eval_tap 0 46 'GetServicePluginConfig # SKIP deprecated' test.out

#- 47 UpdateServicePluginConfig
eval_tap 0 47 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 48 DeleteServicePluginConfig
eval_tap 0 48 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 49 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 49 'ListCurrencies' test.out

#- 50 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "5IGktSre", "currencySymbol": "RrOxInv3", "currencyType": "REAL", "decimals": 42, "localizationDescriptions": {"mzHyjxOr": "4HWfK9Y8", "RHL4pun9": "eHWYwirR", "s9zrkOzZ": "4PFNzsWk"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '7X2UyTpr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"yWKvrxZk": "95aGGEaG", "8KSYlbAF": "e9OXoHXd", "R1C9FZ1D": "ubNwn9lq"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'H9HqmdCY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'BB2if9Kl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'pT0RWINQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetCurrencySummary' test.out

#- 55 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetDLCItemConfig' test.out

#- 56 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "cRM3s3iz", "rewards": [{"currency": {"currencyCode": "asDFspdU", "namespace": "s0MJAOcC"}, "item": {"itemId": "9yW9AyBa", "itemSku": "hbHOjI0n", "itemType": "EkGYeupm"}, "quantity": 84, "type": "CURRENCY"}, {"currency": {"currencyCode": "mwO5WCaJ", "namespace": "0YiRIm6q"}, "item": {"itemId": "dCtpG8MA", "itemSku": "BCFDEqT6", "itemType": "p4oxpOgd"}, "quantity": 30, "type": "CURRENCY"}, {"currency": {"currencyCode": "KN7HiU5o", "namespace": "rzbIy8LX"}, "item": {"itemId": "GNl3H9DL", "itemSku": "DLeUXILH", "itemType": "T6DpyZ4D"}, "quantity": 51, "type": "CURRENCY"}]}, {"id": "T5WudC53", "rewards": [{"currency": {"currencyCode": "SiHNpdOE", "namespace": "rWCwwXW5"}, "item": {"itemId": "GmtWFKZq", "itemSku": "vUPUPU2P", "itemType": "mm3vDmqQ"}, "quantity": 16, "type": "ITEM"}, {"currency": {"currencyCode": "M3tTUTZj", "namespace": "vlh5k3F8"}, "item": {"itemId": "NOIw5SAB", "itemSku": "UhDNlj1I", "itemType": "6diojXwW"}, "quantity": 7, "type": "ITEM"}, {"currency": {"currencyCode": "6hoRhiO9", "namespace": "TA5h4xmL"}, "item": {"itemId": "iqeqCooA", "itemSku": "HHDpxlO0", "itemType": "Tt73w5tL"}, "quantity": 42, "type": "ITEM"}]}, {"id": "X0YnS1kA", "rewards": [{"currency": {"currencyCode": "sBpcxqDE", "namespace": "56k5WIAd"}, "item": {"itemId": "FsAw0GOh", "itemSku": "8Vm9CQwW", "itemType": "dRDewbwR"}, "quantity": 96, "type": "CURRENCY"}, {"currency": {"currencyCode": "eJYkrWiq", "namespace": "oX2P3w65"}, "item": {"itemId": "EOaw6I00", "itemSku": "NYlJ4Kki", "itemType": "dXaiJjAj"}, "quantity": 37, "type": "CURRENCY"}, {"currency": {"currencyCode": "CkdjJtHq", "namespace": "j3ClvFin"}, "item": {"itemId": "1JtBVzkm", "itemSku": "eYTwBvf2", "itemType": "BAzrM4ZW"}, "quantity": 6, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateDLCItemConfig' test.out

#- 57 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteDLCItemConfig' test.out

#- 58 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlatformDLCConfig' test.out

#- 59 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"YyehcElV": "2G70RWLO", "xinWvkFA": "dX7wVcVg", "g7bD8t7y": "gkA6o2ca"}}, {"platform": "STEAM", "platformDlcIdMap": {"vzz3F74X": "7CG14fqt", "qS5REHCg": "YNTW6PKz", "t9iUCTSv": "z0lA6GLy"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"yVgvtMw2": "STIDrNT5", "i0v3k6DQ": "N8wp8vZd", "kt0QW0MN": "kN34391M"}}]}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlatformDLCConfig' test.out

#- 60 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlatformDLCConfig' test.out

#- 61 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'aeg0f3HF' \
    --itemId '7JDZiKHU,HyI4H3UP,hwYAZwU5' \
    --limit '9' \
    --offset '74' \
    --origin 'Steam' \
    --userId 'k02XjTFb' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'kBc0Pm4G,g3jAxtge,a1w6bs6E' \
    --limit '78' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 62 'QueryEntitlements1' test.out

#- 63 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'EnableEntitlementOriginFeature' test.out

#- 64 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 64 'GetEntitlementConfigInfo' test.out

#- 65 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "CjPKYODr", "endDate": "1975-11-21T00:00:00Z", "grantedCode": "dwfzosPQ", "itemId": "LkbBCEm1", "itemNamespace": "p9iFibd0", "language": "zm_sY", "origin": "Playstation", "quantity": 74, "region": "AC3WhklE", "source": "ACHIEVEMENT", "startDate": "1974-10-25T00:00:00Z", "storeId": "VE1BGUFu"}, {"collectionId": "adj4hUzb", "endDate": "1974-06-19T00:00:00Z", "grantedCode": "15T6WowV", "itemId": "lJAuLSuJ", "itemNamespace": "4fJpA01d", "language": "Mn", "origin": "Steam", "quantity": 30, "region": "RwdKkc6u", "source": "PURCHASE", "startDate": "1983-08-05T00:00:00Z", "storeId": "mXT5dri3"}, {"collectionId": "HFQHERvk", "endDate": "1994-01-19T00:00:00Z", "grantedCode": "GqaPw3fS", "itemId": "6jVPfCPc", "itemNamespace": "7huwodXF", "language": "Qfl_kC", "origin": "Epic", "quantity": 87, "region": "ZVSuqM9F", "source": "ACHIEVEMENT", "startDate": "1976-04-06T00:00:00Z", "storeId": "77oYqWFu"}], "userIds": ["mr6frUx2", "LwYPsB6P", "eTrVJAVq"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["Fy68V9wh", "mk7GbPuc", "p3vwqwzQ"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'RegTSKHZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '68' \
    --status 'SUCCESS' \
    --userId 'GFatMPBW' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '6f0zEIYe' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'QiBQbkJg' \
    --limit '34' \
    --offset '78' \
    --startTime 'UOh0X5ve' \
    --status 'SUCCESS' \
    --userId 'ts0jw3az' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "OF9ZcqEJ", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 67, "clientTransactionId": "x0nFKP6U"}, {"amountConsumed": 93, "clientTransactionId": "OKYYa98d"}, {"amountConsumed": 23, "clientTransactionId": "YaqfMhF2"}], "entitlementId": "xY2kO1W5", "usageCount": 66}, {"clientTransaction": [{"amountConsumed": 88, "clientTransactionId": "Evuspbt9"}, {"amountConsumed": 12, "clientTransactionId": "PdNUW829"}, {"amountConsumed": 21, "clientTransactionId": "EaTXpOLo"}], "entitlementId": "bkuyWj0E", "usageCount": 19}, {"clientTransaction": [{"amountConsumed": 69, "clientTransactionId": "lchPdM2N"}, {"amountConsumed": 86, "clientTransactionId": "zcJKewyp"}, {"amountConsumed": 85, "clientTransactionId": "DcfkIoEI"}], "entitlementId": "yUHPmrKN", "usageCount": 84}], "purpose": "P7aZLMqQ"}, "originalTitleName": "mnYkENaw", "paymentProductSKU": "SE1U6c0A", "purchaseDate": "7SXV2QZC", "sourceOrderItemId": "kR1BNezJ", "titleName": "KUvmH5Mu"}, "eventDomain": "h6wMvrQI", "eventSource": "UIQQCO3S", "eventType": "kXidydKJ", "eventVersion": 9, "id": "o7bFy69M", "timestamp": "N5J1GnUi"}' \
    > test.out 2>&1
eval_tap $? 70 'MockPlayStationStreamEvent' test.out

#- 71 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetAppleIAPConfig' test.out

#- 72 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "BaZ2cNFu", "password": "ugZvlJvq"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateAppleIAPConfig' test.out

#- 73 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteAppleIAPConfig' test.out

#- 74 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetEpicGamesIAPConfig' test.out

#- 75 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "4lsA3L5v"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateEpicGamesIAPConfig' test.out

#- 76 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteEpicGamesIAPConfig' test.out

#- 77 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetGoogleIAPConfig' test.out

#- 78 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "veTv5L7N", "serviceAccountId": "IWVcQR8y"}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleIAPConfig' test.out

#- 79 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteGoogleIAPConfig' test.out

#- 80 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 80 'UpdateGoogleP12File' test.out

#- 81 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetIAPItemConfig' test.out

#- 82 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "J27QW48D", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"KbkJgJhw": "fFRrDNyU", "J5p6b4bi": "n4kGW5wC", "fj7kckkc": "LTElcy7u"}}, {"itemIdentity": "4AqPDFoS", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"FSO1sbEK": "OYvUW0TS", "2McHvgZk": "KHbLJ5In", "i8dTlm68": "DH67MH6e"}}, {"itemIdentity": "24kW6pMg", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"jq5Hw1PQ": "g3Zkmzfx", "XTUjYVMS": "oGZRznOt", "WlKiN6QB": "iyrajo3o"}}]}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateIAPItemConfig' test.out

#- 83 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteIAPItemConfig' test.out

#- 84 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetOculusIAPConfig' test.out

#- 85 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "bV8SyNVb", "appSecret": "85NA2t4D"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateOculusIAPConfig' test.out

#- 86 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeleteOculusIAPConfig' test.out

#- 87 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetPlayStationIAPConfig' test.out

#- 88 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "9e1iFOP8", "backOfficeServerClientSecret": "FcZfjgBv", "enableStreamJob": true, "environment": "GrLXicwA", "streamName": "HNuq9Xsf", "streamPartnerName": "E90t9GqO"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdatePlaystationIAPConfig' test.out

#- 89 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeletePlaystationIAPConfig' test.out

#- 90 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'ValidateExistedPlaystationIAPConfig' test.out

#- 91 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "7qedIfmi", "backOfficeServerClientSecret": "u2jFOLpz", "enableStreamJob": true, "environment": "d88t0UiF", "streamName": "MNoLUDte", "streamPartnerName": "rbSj6vst"}' \
    > test.out 2>&1
eval_tap $? 91 'ValidatePlaystationIAPConfig' test.out

#- 92 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetSteamIAPConfig' test.out

#- 93 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "WU341euS", "publisherAuthenticationKey": "hLSbcYrZ"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateSteamIAPConfig' test.out

#- 94 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'DeleteSteamIAPConfig' test.out

#- 95 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetTwitchIAPConfig' test.out

#- 96 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "22azZcHw", "clientSecret": "Q85xVRTW", "organizationId": "ywhQvuPY"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateTwitchIAPConfig' test.out

#- 97 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteTwitchIAPConfig' test.out

#- 98 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetXblIAPConfig' test.out

#- 99 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "sPayVmz0"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblIAPConfig' test.out

#- 100 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteXblAPConfig' test.out

#- 101 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'EISeQuqg' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'xHwBLUSK' \
    --itemId 'PTd6nT3U' \
    --itemType 'CODE' \
    --endTime 'bZO4LqJk' \
    --startTime 'lpzmP1JX' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'b0vqhbBm' \
    --itemId 'dFqRus9F' \
    --itemType 'SEASON' \
    --endTime '5PlFTgxg' \
    --startTime 'JNAXUmYs' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LIDIDLfk' \
    --body '{"categoryPath": "IpRAhx3k", "targetItemId": "xRXUiUjb", "targetNamespace": "SgbdHTV5"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IypHD92Z' \
    --body '{"appId": "UYVeQSZL", "appType": "DLC", "baseAppId": "S7zdf52c", "boothName": "ulLsHLZg", "categoryPath": "C6i0fauN", "clazz": "fjBpBPrt", "displayOrder": 65, "entitlementType": "DURABLE", "ext": {"AurW1dAg": {}, "PrPALxu9": {}, "whILYbHU": {}}, "features": ["GyhdrRhb", "pCvlAdYx", "Mac0k8Za"], "flexible": true, "images": [{"as": "O2OvHVLS", "caption": "napxbDvV", "height": 90, "imageUrl": "9KI7NFUy", "smallImageUrl": "8lmNMr57", "width": 71}, {"as": "f77NaBuO", "caption": "9cBEOP8A", "height": 20, "imageUrl": "J0lbEgs1", "smallImageUrl": "VPo8kbaL", "width": 50}, {"as": "blpl4tzo", "caption": "YqTKNyAS", "height": 61, "imageUrl": "hzTP9x9n", "smallImageUrl": "iCIfBxYq", "width": 83}], "inventoryConfig": {"customAttributes": {"5esYEEU4": {}, "MwzuxWiH": {}, "JAhTWSGp": {}}, "serverCustomAttributes": {"JyV3OvnY": {}, "rQkeqZ81": {}, "zWW96gIi": {}}, "slotUsed": 62}, "itemIds": ["VOZZg37V", "IhWNMv2H", "83RxkwiQ"], "itemQty": {"4xkFXfJM": 22, "3OtKvfqn": 12, "T40emzOO": 36}, "itemType": "CODE", "listable": false, "localizations": {"eZx8LHcH": {"description": "4Olsf9nW", "localExt": {"BO5jWudC": {}, "38aPzyiS": {}, "j70Ln3Pa": {}}, "longDescription": "82J4hqc3", "title": "Jmqk2CVC"}, "kWBaHjaZ": {"description": "GTld6XXJ", "localExt": {"sIREM9ej": {}, "3Sa9ZPvB": {}, "7MIkrxi5": {}}, "longDescription": "b9iZCLSp", "title": "6zsPOp9a"}, "39gemI0d": {"description": "WJyoZMW2", "localExt": {"okavlnTo": {}, "vRvqdnsz": {}, "gzn8lh1I": {}}, "longDescription": "TMNtDuKo", "title": "QaIAL0XK"}}, "lootBoxConfig": {"rewardCount": 42, "rewards": [{"lootBoxItems": [{"count": 72, "duration": 20, "endDate": "1989-03-29T00:00:00Z", "itemId": "J6dFRSsW", "itemSku": "6TLFeiRD", "itemType": "AM2tVxAa"}, {"count": 46, "duration": 42, "endDate": "1973-02-24T00:00:00Z", "itemId": "5wVmnGDf", "itemSku": "UxLHxOt1", "itemType": "2gSGJEmx"}, {"count": 58, "duration": 26, "endDate": "1982-09-23T00:00:00Z", "itemId": "FtFkdSvW", "itemSku": "GpUYj7mo", "itemType": "qZ6pg3kv"}], "name": "zDnEZk1z", "odds": 0.08054525543002344, "type": "REWARD_GROUP", "weight": 86}, {"lootBoxItems": [{"count": 45, "duration": 23, "endDate": "1972-11-18T00:00:00Z", "itemId": "e197Hq8Z", "itemSku": "Id1UkSfM", "itemType": "KzqqZe3d"}, {"count": 95, "duration": 94, "endDate": "1982-10-22T00:00:00Z", "itemId": "Ms8PwrOQ", "itemSku": "L6y6q3fB", "itemType": "q989Keao"}, {"count": 96, "duration": 100, "endDate": "1985-03-30T00:00:00Z", "itemId": "D09PurFj", "itemSku": "9d99WuCE", "itemType": "sEifHcSH"}], "name": "csuUlVRr", "odds": 0.6717130423182868, "type": "REWARD_GROUP", "weight": 20}, {"lootBoxItems": [{"count": 81, "duration": 66, "endDate": "1991-05-25T00:00:00Z", "itemId": "lp7TZNmp", "itemSku": "uLNIzIj9", "itemType": "VhKKX0yB"}, {"count": 98, "duration": 13, "endDate": "1988-10-10T00:00:00Z", "itemId": "d9JeCVFJ", "itemSku": "kCOlijJR", "itemType": "bdcpKQLk"}, {"count": 19, "duration": 55, "endDate": "1981-09-14T00:00:00Z", "itemId": "TZldsUEQ", "itemSku": "4gj0pMlg", "itemType": "k0bsHVP8"}], "name": "2g1BguEL", "odds": 0.3924007554413437, "type": "PROBABILITY_GROUP", "weight": 33}], "rollFunction": "CUSTOM"}, "maxCount": 5, "maxCountPerUser": 34, "name": "4jo9KlD6", "optionBoxConfig": {"boxItems": [{"count": 71, "duration": 14, "endDate": "1979-05-14T00:00:00Z", "itemId": "iGq8C2o3", "itemSku": "3M5Gc47l", "itemType": "0ErJvUQF"}, {"count": 96, "duration": 2, "endDate": "1997-10-26T00:00:00Z", "itemId": "Sovx4SlI", "itemSku": "GbNvj3no", "itemType": "Mzq5S71E"}, {"count": 55, "duration": 59, "endDate": "1997-12-06T00:00:00Z", "itemId": "YGmKWMBX", "itemSku": "Tf3OL0NZ", "itemType": "FwH6lPpu"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 66, "fixedTrialCycles": 81, "graceDays": 88}, "regionData": {"J6bUNQjQ": [{"currencyCode": "ZZVhEWkA", "currencyNamespace": "r3tgVejH", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1996-11-08T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1996-12-06T00:00:00Z", "expireAt": "1972-09-05T00:00:00Z", "price": 22, "purchaseAt": "1998-09-22T00:00:00Z", "trialPrice": 58}, {"currencyCode": "pSFHRTpt", "currencyNamespace": "HLNLpFeP", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1978-04-13T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1972-09-05T00:00:00Z", "expireAt": "1986-06-09T00:00:00Z", "price": 36, "purchaseAt": "1972-07-09T00:00:00Z", "trialPrice": 71}, {"currencyCode": "nVu2lUmW", "currencyNamespace": "sqPkrxHU", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1994-06-20T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1991-05-02T00:00:00Z", "expireAt": "1980-06-05T00:00:00Z", "price": 15, "purchaseAt": "1995-10-23T00:00:00Z", "trialPrice": 28}], "j2vPi7ei": [{"currencyCode": "eg1B7kfW", "currencyNamespace": "a4KZ1saP", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1979-11-23T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1980-07-15T00:00:00Z", "expireAt": "1976-05-22T00:00:00Z", "price": 30, "purchaseAt": "1992-05-29T00:00:00Z", "trialPrice": 78}, {"currencyCode": "FYFaesz2", "currencyNamespace": "m5u1sQMd", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1973-02-17T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1973-06-01T00:00:00Z", "expireAt": "1989-03-11T00:00:00Z", "price": 100, "purchaseAt": "1980-06-13T00:00:00Z", "trialPrice": 43}, {"currencyCode": "AAFIhgdT", "currencyNamespace": "QNWaBlak", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1989-07-06T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1982-02-24T00:00:00Z", "expireAt": "1987-12-13T00:00:00Z", "price": 21, "purchaseAt": "1993-05-13T00:00:00Z", "trialPrice": 45}], "4vz1aEsx": [{"currencyCode": "8feRb8iu", "currencyNamespace": "RC9pyehu", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1975-07-26T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1985-04-01T00:00:00Z", "expireAt": "1990-06-24T00:00:00Z", "price": 83, "purchaseAt": "1974-03-10T00:00:00Z", "trialPrice": 2}, {"currencyCode": "G8Ol8hHa", "currencyNamespace": "X4KR388W", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1972-01-03T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1980-09-03T00:00:00Z", "expireAt": "1976-06-06T00:00:00Z", "price": 89, "purchaseAt": "1991-02-12T00:00:00Z", "trialPrice": 10}, {"currencyCode": "qjcgjIxH", "currencyNamespace": "9PBSeJnb", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1976-06-01T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1999-05-21T00:00:00Z", "expireAt": "1984-01-11T00:00:00Z", "price": 27, "purchaseAt": "1973-10-19T00:00:00Z", "trialPrice": 88}]}, "saleConfig": {"currencyCode": "d3ql46sE", "price": 75}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "wO8pl6L5", "stackable": false, "status": "ACTIVE", "tags": ["0RGYFki0", "CVFEJSuv", "jZpNTNq4"], "targetCurrencyCode": "n753AsqQ", "targetNamespace": "DtWm62As", "thumbnailUrl": "zzhusjI0", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sHkx8bEp' \
    --appId 'n40BWIrX' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'a8MP9VaP' \
    --baseAppId 'p07xzIeT' \
    --categoryPath 'wWg2Lt97' \
    --features 'v2HxJ9nt' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '12' \
    --offset '47' \
    --region '0pSMZXwi' \
    --sortBy 'displayOrder,createdAt,createdAt:asc' \
    --storeId 'aOZoAZFf' \
    --tags 'cimVs3aQ' \
    --targetNamespace '2PtjnTRv' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '3tw6hEtN,XExKQK81,FfK4Hm7f' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'z6FYeSGh' \
    --itemIds 'oBJ5an5F' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Ytx3sdXE' \
    --sku 'JUPTuIwk' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zqCU6Kae' \
    --populateBundle  \
    --region 'KqNpaPqE' \
    --storeId 'LgXbXR6c' \
    --sku 'mvd55zOv' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '06EXjMAS' \
    --region 'bfdN6V3Z' \
    --storeId 'smW3ifK8' \
    --itemIds 'BRy1vESI' \
    --userId 'OeRLcSMf' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rGG9Ehcq' \
    --sku 'YqZhYLTA' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'ymG1BEKQ,hUiK2Z7w,ZNa1SghZ' \
    --storeId 'w8ABWHIX' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'FjTeLr45' \
    --region 'a2y1v0YO' \
    --storeId 'XaAaLemh' \
    --itemIds 'YJbJtBzg' \
    > test.out 2>&1
eval_tap $? 115 'BulkGetLocaleItems' test.out

#- 116 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetAvailablePredicateTypes' test.out

#- 117 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'BAnMBXl1' \
    --userId '2ZPys0JZ' \
    --body '{"itemIds": ["AmeScBtR", "PcnnRmNJ", "ChEquYED"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nKkVTCSn' \
    --body '{"changes": [{"itemIdentities": ["lYSqzpOq", "oGI4IpdH", "icFgbW8b"], "itemIdentityType": "ITEM_SKU", "regionData": {"FriMnhb7": [{"currencyCode": "6Njigbfb", "currencyNamespace": "4tQymFbN", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1979-04-08T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1975-07-09T00:00:00Z", "discountedPrice": 57, "expireAt": "1979-02-14T00:00:00Z", "price": 85, "purchaseAt": "1982-03-16T00:00:00Z", "trialPrice": 40}, {"currencyCode": "LrNe4USo", "currencyNamespace": "OwpjuX82", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1994-10-11T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1991-08-15T00:00:00Z", "discountedPrice": 91, "expireAt": "1991-07-19T00:00:00Z", "price": 13, "purchaseAt": "1982-11-29T00:00:00Z", "trialPrice": 23}, {"currencyCode": "BKyJM5ZI", "currencyNamespace": "MOsumq8v", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1985-09-09T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1973-03-02T00:00:00Z", "discountedPrice": 44, "expireAt": "1975-07-16T00:00:00Z", "price": 14, "purchaseAt": "1974-03-24T00:00:00Z", "trialPrice": 40}], "fu43y4Pc": [{"currencyCode": "6EX3oHUj", "currencyNamespace": "T9mZXZQA", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1987-10-29T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1997-06-10T00:00:00Z", "discountedPrice": 3, "expireAt": "1998-12-04T00:00:00Z", "price": 42, "purchaseAt": "1984-12-03T00:00:00Z", "trialPrice": 54}, {"currencyCode": "fdDcdPlU", "currencyNamespace": "NiuRsadO", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1989-02-08T00:00:00Z", "discountedPrice": 98, "expireAt": "1990-01-11T00:00:00Z", "price": 32, "purchaseAt": "1994-04-26T00:00:00Z", "trialPrice": 42}, {"currencyCode": "Rv9Co3RI", "currencyNamespace": "L1r1uUz9", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1974-07-28T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1996-07-24T00:00:00Z", "discountedPrice": 71, "expireAt": "1982-08-30T00:00:00Z", "price": 25, "purchaseAt": "1991-05-21T00:00:00Z", "trialPrice": 54}], "AKBqg7ex": [{"currencyCode": "x54ljn6x", "currencyNamespace": "fMoLlCsw", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1979-06-20T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1988-08-22T00:00:00Z", "discountedPrice": 18, "expireAt": "1975-08-04T00:00:00Z", "price": 72, "purchaseAt": "1973-09-11T00:00:00Z", "trialPrice": 11}, {"currencyCode": "bJPKfEIp", "currencyNamespace": "VUTorcuq", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1993-03-30T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1988-06-22T00:00:00Z", "discountedPrice": 71, "expireAt": "1974-09-13T00:00:00Z", "price": 6, "purchaseAt": "1995-07-22T00:00:00Z", "trialPrice": 85}, {"currencyCode": "y88DINn7", "currencyNamespace": "X8MIzulu", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1995-02-13T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-04-10T00:00:00Z", "discountedPrice": 86, "expireAt": "1998-09-12T00:00:00Z", "price": 25, "purchaseAt": "1982-03-06T00:00:00Z", "trialPrice": 10}]}}, {"itemIdentities": ["pKudLZBL", "TBMPnMxj", "teb124MT"], "itemIdentityType": "ITEM_SKU", "regionData": {"tL69rWTR": [{"currencyCode": "RT1O0nFH", "currencyNamespace": "I9EqCp7b", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1975-09-02T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1992-01-04T00:00:00Z", "discountedPrice": 25, "expireAt": "1982-05-14T00:00:00Z", "price": 7, "purchaseAt": "1972-09-11T00:00:00Z", "trialPrice": 53}, {"currencyCode": "TmZTeAsu", "currencyNamespace": "yhyLc2Z9", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1974-11-02T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1993-05-26T00:00:00Z", "discountedPrice": 30, "expireAt": "1986-06-27T00:00:00Z", "price": 85, "purchaseAt": "1984-01-07T00:00:00Z", "trialPrice": 21}, {"currencyCode": "TkKNhkYo", "currencyNamespace": "WN462ubY", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1973-12-14T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1976-04-14T00:00:00Z", "discountedPrice": 24, "expireAt": "1988-07-26T00:00:00Z", "price": 48, "purchaseAt": "1986-04-01T00:00:00Z", "trialPrice": 90}], "XI5OaHbI": [{"currencyCode": "wX0wLZrI", "currencyNamespace": "QmTf2jpz", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1972-04-01T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1989-03-30T00:00:00Z", "discountedPrice": 61, "expireAt": "1975-03-21T00:00:00Z", "price": 82, "purchaseAt": "1991-01-15T00:00:00Z", "trialPrice": 34}, {"currencyCode": "2onuZkM9", "currencyNamespace": "7bwzlE3y", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1971-02-14T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1982-09-28T00:00:00Z", "discountedPrice": 48, "expireAt": "1993-11-18T00:00:00Z", "price": 83, "purchaseAt": "1982-06-05T00:00:00Z", "trialPrice": 46}, {"currencyCode": "htzG39Ug", "currencyNamespace": "f6SpBoB4", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1997-07-31T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1983-08-27T00:00:00Z", "discountedPrice": 64, "expireAt": "1977-05-30T00:00:00Z", "price": 43, "purchaseAt": "1996-11-03T00:00:00Z", "trialPrice": 33}], "ka8N1wY5": [{"currencyCode": "uWQ95EaB", "currencyNamespace": "xxyZqFKN", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1983-12-04T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1985-12-06T00:00:00Z", "discountedPrice": 65, "expireAt": "1992-03-19T00:00:00Z", "price": 86, "purchaseAt": "1996-02-05T00:00:00Z", "trialPrice": 87}, {"currencyCode": "D6WzKoHV", "currencyNamespace": "2i5M9LGe", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1977-07-14T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1994-12-25T00:00:00Z", "discountedPrice": 40, "expireAt": "1984-06-29T00:00:00Z", "price": 52, "purchaseAt": "1972-01-25T00:00:00Z", "trialPrice": 30}, {"currencyCode": "HB9HKZtv", "currencyNamespace": "V6wdfUFQ", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1986-10-10T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1991-08-01T00:00:00Z", "discountedPrice": 32, "expireAt": "1984-07-11T00:00:00Z", "price": 42, "purchaseAt": "1982-06-22T00:00:00Z", "trialPrice": 77}]}}, {"itemIdentities": ["g4rL2OE4", "4U6axM24", "LficT4Lo"], "itemIdentityType": "ITEM_SKU", "regionData": {"JeslxMRg": [{"currencyCode": "6qAQK51W", "currencyNamespace": "8tPjPV0X", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1983-08-02T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1986-11-07T00:00:00Z", "discountedPrice": 39, "expireAt": "1989-07-20T00:00:00Z", "price": 23, "purchaseAt": "1992-07-12T00:00:00Z", "trialPrice": 34}, {"currencyCode": "YKsHlQfs", "currencyNamespace": "wotMlspT", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1993-12-01T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1991-04-24T00:00:00Z", "discountedPrice": 61, "expireAt": "1986-02-05T00:00:00Z", "price": 2, "purchaseAt": "1981-08-02T00:00:00Z", "trialPrice": 36}, {"currencyCode": "ZWz5Ym4u", "currencyNamespace": "MvZqwD2N", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1984-05-23T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1999-09-08T00:00:00Z", "discountedPrice": 29, "expireAt": "1978-02-26T00:00:00Z", "price": 45, "purchaseAt": "1975-10-28T00:00:00Z", "trialPrice": 17}], "qJlIlGE4": [{"currencyCode": "iXrGdsU2", "currencyNamespace": "cRWVElsd", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1999-04-11T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1977-11-05T00:00:00Z", "discountedPrice": 22, "expireAt": "1990-09-03T00:00:00Z", "price": 9, "purchaseAt": "1986-04-01T00:00:00Z", "trialPrice": 34}, {"currencyCode": "kp70HLlI", "currencyNamespace": "BFTmpXc7", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1987-10-28T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1991-02-24T00:00:00Z", "discountedPrice": 77, "expireAt": "1984-01-14T00:00:00Z", "price": 92, "purchaseAt": "1989-06-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "hCbDPH0a", "currencyNamespace": "5p6jHwBk", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1973-12-24T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1994-02-28T00:00:00Z", "discountedPrice": 97, "expireAt": "1985-08-15T00:00:00Z", "price": 42, "purchaseAt": "1980-02-04T00:00:00Z", "trialPrice": 63}], "UjanfIR0": [{"currencyCode": "SXD2ei4r", "currencyNamespace": "EdFzn8Uz", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1979-10-29T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1982-09-03T00:00:00Z", "discountedPrice": 18, "expireAt": "1988-04-17T00:00:00Z", "price": 61, "purchaseAt": "1982-09-04T00:00:00Z", "trialPrice": 23}, {"currencyCode": "mPayd9Qx", "currencyNamespace": "K2PVr69U", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1990-08-24T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1993-03-19T00:00:00Z", "discountedPrice": 68, "expireAt": "1978-11-26T00:00:00Z", "price": 70, "purchaseAt": "1976-08-07T00:00:00Z", "trialPrice": 34}, {"currencyCode": "uUxDpvO3", "currencyNamespace": "LZq161vy", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1978-10-23T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1971-09-15T00:00:00Z", "discountedPrice": 25, "expireAt": "1978-03-16T00:00:00Z", "price": 37, "purchaseAt": "1990-04-28T00:00:00Z", "trialPrice": 7}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '72' \
    --offset '18' \
    --sortBy 'wkXnMrh8' \
    --storeId '1jqBTVLn' \
    --keyword 'lBh9l48w' \
    --language 'kMnUaaZN' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '51' \
    --offset '86' \
    --sortBy 'updatedAt,updatedAt:desc,name' \
    --storeId 'bQhij0WM' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'MUqb4e1G' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bCelto5Q' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Cuj2j3dM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Bl99phY9' \
    --body '{"appId": "2kqY8j2e", "appType": "SOFTWARE", "baseAppId": "nkQARF8V", "boothName": "gbwgsdjq", "categoryPath": "ULAgrGYT", "clazz": "AiExJZ0U", "displayOrder": 41, "entitlementType": "DURABLE", "ext": {"HwI31ZMH": {}, "J398tiff": {}, "g3Pj7qzI": {}}, "features": ["CGTy3JVW", "fwRcZwtT", "XAmtWG9f"], "flexible": false, "images": [{"as": "Alk2TmrQ", "caption": "ucNrAxAn", "height": 65, "imageUrl": "RDpMo9j9", "smallImageUrl": "0oEnQHfn", "width": 73}, {"as": "jQZXZh0K", "caption": "XjINXc3p", "height": 21, "imageUrl": "s3H0djWW", "smallImageUrl": "sHMHCbw6", "width": 27}, {"as": "PcNMq6Au", "caption": "FBAJrZdr", "height": 24, "imageUrl": "p7FqBUt4", "smallImageUrl": "ArnN9LDY", "width": 3}], "inventoryConfig": {"customAttributes": {"iTci5qCF": {}, "nC2EJWu6": {}, "LPXWg2dg": {}}, "serverCustomAttributes": {"JEqdWCYt": {}, "b7j6DNvT": {}, "Np3OYzYo": {}}, "slotUsed": 85}, "itemIds": ["SxAn6Biy", "dvnN1EdW", "AQJaTjN9"], "itemQty": {"piAAdntj": 57, "DRCfgHvV": 72, "KgY5n6TO": 22}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"W0aE5B4P": {"description": "RyBnWoYe", "localExt": {"b18YhcIh": {}, "QMiiEBX0": {}, "7t7aCABv": {}}, "longDescription": "Uc7iZO40", "title": "L5r7hrtm"}, "897uGiQs": {"description": "TPnpZxq2", "localExt": {"Q69EX9CI": {}, "g1Ancild": {}, "MgolPh0g": {}}, "longDescription": "wnMEZvzJ", "title": "laA9hRTp"}, "PxcRrMQf": {"description": "OKKWrKKT", "localExt": {"KBalrxve": {}, "37uXYHGO": {}, "uQrcFsYO": {}}, "longDescription": "BWKQotYx", "title": "n7oiRmeA"}}, "lootBoxConfig": {"rewardCount": 34, "rewards": [{"lootBoxItems": [{"count": 69, "duration": 46, "endDate": "1987-11-03T00:00:00Z", "itemId": "7XHEdHIl", "itemSku": "TP6jDNPW", "itemType": "hpV8PLJG"}, {"count": 40, "duration": 92, "endDate": "1998-10-15T00:00:00Z", "itemId": "WPq7Mrjk", "itemSku": "wUSxyhMi", "itemType": "sZGpAkFu"}, {"count": 11, "duration": 65, "endDate": "1994-02-06T00:00:00Z", "itemId": "mAjcCNQk", "itemSku": "hXgObNgk", "itemType": "p5RJgSE8"}], "name": "jV5nuNbg", "odds": 0.7215746214180323, "type": "REWARD_GROUP", "weight": 12}, {"lootBoxItems": [{"count": 57, "duration": 53, "endDate": "1986-02-15T00:00:00Z", "itemId": "3G7JXe2I", "itemSku": "12tepJf3", "itemType": "GERXc9Ay"}, {"count": 87, "duration": 9, "endDate": "1987-11-05T00:00:00Z", "itemId": "LD27y3JX", "itemSku": "6WiMwrlv", "itemType": "VdehRrcM"}, {"count": 70, "duration": 49, "endDate": "1997-10-04T00:00:00Z", "itemId": "H8m6xce6", "itemSku": "Blm15VOI", "itemType": "PYHoMW2F"}], "name": "3TYM4QAC", "odds": 0.6781299284022401, "type": "REWARD", "weight": 13}, {"lootBoxItems": [{"count": 61, "duration": 88, "endDate": "1991-01-02T00:00:00Z", "itemId": "oLJN1Wcx", "itemSku": "MQkC4ewB", "itemType": "oMDc4mrp"}, {"count": 27, "duration": 68, "endDate": "1984-01-26T00:00:00Z", "itemId": "6TPjSGqw", "itemSku": "Sc0IiNfU", "itemType": "6sIbUb3w"}, {"count": 27, "duration": 94, "endDate": "1985-10-12T00:00:00Z", "itemId": "DWMYg8dC", "itemSku": "iHrFBMrW", "itemType": "5nlgMsEM"}], "name": "LRH6X6Kx", "odds": 0.13465734149744524, "type": "REWARD", "weight": 23}], "rollFunction": "DEFAULT"}, "maxCount": 38, "maxCountPerUser": 22, "name": "ILBqdwJO", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 48, "endDate": "1994-06-11T00:00:00Z", "itemId": "KxrAEVKq", "itemSku": "QHjEYrR5", "itemType": "bGoOQWm9"}, {"count": 54, "duration": 50, "endDate": "1975-01-09T00:00:00Z", "itemId": "bWLrfSoH", "itemSku": "5tMuitoX", "itemType": "Dg8xLe4U"}, {"count": 89, "duration": 68, "endDate": "1977-06-22T00:00:00Z", "itemId": "NixRfXqo", "itemSku": "SJL4w8HX", "itemType": "iCxgVsne"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 4, "fixedTrialCycles": 92, "graceDays": 70}, "regionData": {"rriqjkhR": [{"currencyCode": "603yYjwa", "currencyNamespace": "4ykY2CzA", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1994-03-27T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1997-01-01T00:00:00Z", "expireAt": "1985-06-19T00:00:00Z", "price": 11, "purchaseAt": "1995-03-04T00:00:00Z", "trialPrice": 92}, {"currencyCode": "hESopSRi", "currencyNamespace": "PbTm8uPD", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1995-07-19T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1980-05-19T00:00:00Z", "expireAt": "1990-01-27T00:00:00Z", "price": 62, "purchaseAt": "1984-01-06T00:00:00Z", "trialPrice": 27}, {"currencyCode": "KSFt4Vwi", "currencyNamespace": "l7acOS7Y", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1979-02-14T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1981-07-03T00:00:00Z", "expireAt": "1987-01-19T00:00:00Z", "price": 14, "purchaseAt": "1984-05-24T00:00:00Z", "trialPrice": 18}], "96Ag7qKG": [{"currencyCode": "sLNDRPwW", "currencyNamespace": "QgH9UN99", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1983-12-26T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-08-23T00:00:00Z", "expireAt": "1977-06-23T00:00:00Z", "price": 46, "purchaseAt": "1977-04-27T00:00:00Z", "trialPrice": 44}, {"currencyCode": "l8RU6NuA", "currencyNamespace": "RU9Stcy8", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1997-06-02T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1995-06-30T00:00:00Z", "expireAt": "1995-04-05T00:00:00Z", "price": 29, "purchaseAt": "1981-04-16T00:00:00Z", "trialPrice": 41}, {"currencyCode": "SNM8mRit", "currencyNamespace": "nH0McxM5", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1995-08-11T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1983-10-23T00:00:00Z", "expireAt": "1979-06-12T00:00:00Z", "price": 30, "purchaseAt": "1994-08-08T00:00:00Z", "trialPrice": 73}], "yiuRu43D": [{"currencyCode": "510kSxKP", "currencyNamespace": "vCVZOpmn", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1974-07-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1991-08-20T00:00:00Z", "expireAt": "1973-12-07T00:00:00Z", "price": 50, "purchaseAt": "1997-09-01T00:00:00Z", "trialPrice": 16}, {"currencyCode": "krv8uo9v", "currencyNamespace": "axGaUJkR", "currencyType": "REAL", "discountAmount": 12, "discountExpireAt": "1993-12-08T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1992-04-15T00:00:00Z", "expireAt": "1986-07-16T00:00:00Z", "price": 18, "purchaseAt": "1971-06-29T00:00:00Z", "trialPrice": 18}, {"currencyCode": "vM7ovH4b", "currencyNamespace": "kuwz9j0E", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1986-05-22T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1982-01-07T00:00:00Z", "expireAt": "1982-08-09T00:00:00Z", "price": 89, "purchaseAt": "1984-12-21T00:00:00Z", "trialPrice": 49}]}, "saleConfig": {"currencyCode": "gCUxe9G1", "price": 44}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "iPSGU4lh", "stackable": false, "status": "ACTIVE", "tags": ["5DdzjS2a", "f7VGfo1J", "D7vKR5Ic"], "targetCurrencyCode": "QHEEVQ81", "targetNamespace": "RPWoRGcV", "thumbnailUrl": "JVGm10Mx", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'jzIoW0fU' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '5aFsmWvY' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '4gqIK7CJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 73, "orderNo": "qZMuacOK"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'egVLnGsq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '27BcAjYq' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'tXG9aseR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GVonCuBB' \
    --body '{"carousel": [{"alt": "iRwhVfMY", "previewUrl": "u9XthauF", "thumbnailUrl": "eH3cpRcR", "type": "video", "url": "fabwxU9H", "videoSource": "generic"}, {"alt": "WguCU8G2", "previewUrl": "NCZV2rkk", "thumbnailUrl": "XQanWrF5", "type": "video", "url": "fFhGIN6e", "videoSource": "vimeo"}, {"alt": "2auFFPVD", "previewUrl": "kaPA5Vrh", "thumbnailUrl": "HgWyXUau", "type": "video", "url": "jDTz1uL3", "videoSource": "generic"}], "developer": "mVC6bOBX", "forumUrl": "2mVwfeYz", "genres": ["Casual", "Indie", "Strategy"], "localizations": {"KonJwWaX": {"announcement": "32nbr0hY", "slogan": "NP6udiwM"}, "CWFiCqjX": {"announcement": "oP6G0fMM", "slogan": "Mx1z8vDD"}, "rED54UAC": {"announcement": "gBgfnOdg", "slogan": "hbT1zN4t"}}, "platformRequirements": {"Ap3n61CF": [{"additionals": "GFLEU0Mb", "directXVersion": "J2glH3yJ", "diskSpace": "7g5mgGGl", "graphics": "GuRTZOTq", "label": "vaQhcPFO", "osVersion": "kIc0m9a8", "processor": "BtYOCDIh", "ram": "zYAzLfK0", "soundCard": "nrC6Ke5W"}, {"additionals": "FmzHqVSF", "directXVersion": "84VteLeI", "diskSpace": "aMqEJ296", "graphics": "Joo1Ghue", "label": "1VMV15Nm", "osVersion": "fNTvvsvn", "processor": "5G4ClsLY", "ram": "wQ1yT9P5", "soundCard": "XbMzB31N"}, {"additionals": "3ynvmV8r", "directXVersion": "hXwFVnAF", "diskSpace": "BEZ8Bw9X", "graphics": "nYVNkSdR", "label": "9xH5WcGU", "osVersion": "e1xwfDVb", "processor": "EU6M88Ow", "ram": "6blO5NsZ", "soundCard": "GerPEb0U"}], "otIoFo0D": [{"additionals": "90fcasXG", "directXVersion": "S4s110JC", "diskSpace": "8hxB3wxb", "graphics": "rLSLD3Cv", "label": "nCyST5a3", "osVersion": "zFZXnGUx", "processor": "4Xq5CHcT", "ram": "IFOYHAXY", "soundCard": "hnkgLu13"}, {"additionals": "urvVTXzq", "directXVersion": "p3nLfB9R", "diskSpace": "AGJhUteU", "graphics": "awuClytX", "label": "gNzfgB2s", "osVersion": "fuVCk0Ui", "processor": "rZMbrNr1", "ram": "j2CTlkPd", "soundCard": "oaL8EGtN"}, {"additionals": "Wk2C8xFl", "directXVersion": "lctKBg1F", "diskSpace": "8xBStLSZ", "graphics": "m08ScI3y", "label": "aeDKW6bh", "osVersion": "v5V3qgus", "processor": "A9e0a0yX", "ram": "6suSHUVL", "soundCard": "lml8MfVS"}], "8Qoox7yj": [{"additionals": "XqcskbgK", "directXVersion": "ijs8L8GL", "diskSpace": "iaqpHsBj", "graphics": "DvnImSOs", "label": "FyH9OpgO", "osVersion": "WRUtriCB", "processor": "t1oBPryG", "ram": "lzpf8TYQ", "soundCard": "iSSIGIia"}, {"additionals": "Oeqm8Ue3", "directXVersion": "6YsXhMar", "diskSpace": "J9fmMgk1", "graphics": "MonV2p1M", "label": "jRJQiN8d", "osVersion": "AMPpJ3Je", "processor": "rriJU7ST", "ram": "R1S4gAmj", "soundCard": "YyJjza9a"}, {"additionals": "5nbwam3H", "directXVersion": "OgKaxsVG", "diskSpace": "3Rat8XGM", "graphics": "tlvEzD0y", "label": "c8tUh6P9", "osVersion": "RexWoYWW", "processor": "aO0Y6Fma", "ram": "jZb3KqKT", "soundCard": "u3dQCZaz"}]}, "platforms": ["IOS", "Windows", "Android"], "players": ["CrossPlatformMulti", "Coop", "Coop"], "primaryGenre": "Indie", "publisher": "zZkYs24X", "releaseDate": "1999-08-26T00:00:00Z", "websiteUrl": "rR7fcDg0"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'vFKUgpaZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cY33hzft' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'IG282KNR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'cm57eSxx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mTqJYqA3' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'LQzmfMFx' \
    --itemId 'QWGGfPys' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VdAhpBGo' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'zbUQTjtA' \
    --itemId 'SfV5m9G5' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5jXBT8fq' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'uB2AnWp6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Lw1BsbaU' \
    --populateBundle  \
    --region '5PgyB7mY' \
    --storeId 'NJKKV2au' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '6oa3crps' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3mjoZipQ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 86, "comparison": "isGreaterThanOrEqual", "name": "ni6H3Lia", "predicateType": "SeasonTierPredicate", "value": "zAWCpVc4", "values": ["GQsG12UO", "qz40pfGn", "jpw7G5rn"]}, {"anyOf": 48, "comparison": "is", "name": "M0YM0QHH", "predicateType": "SeasonTierPredicate", "value": "03DC4kVU", "values": ["QYdKfG5Z", "RZYkhE7x", "JSxV6Vkc"]}, {"anyOf": 45, "comparison": "includes", "name": "uc3IXLxi", "predicateType": "SeasonPassPredicate", "value": "ML7OnAqY", "values": ["OFJ6Yc1x", "qddIlAZP", "o3Fwy7S6"]}]}, {"operator": "or", "predicates": [{"anyOf": 20, "comparison": "is", "name": "NQrhtbpZ", "predicateType": "EntitlementPredicate", "value": "ZWhtRyKc", "values": ["xgPtZCDo", "exoGXns3", "di1a87Ed"]}, {"anyOf": 60, "comparison": "isGreaterThanOrEqual", "name": "4IRgpUKn", "predicateType": "SeasonPassPredicate", "value": "HBEYwWQz", "values": ["8uW0Iy63", "yJ6lK5vw", "9wXOQrTj"]}, {"anyOf": 39, "comparison": "isGreaterThanOrEqual", "name": "TMoZhHFG", "predicateType": "EntitlementPredicate", "value": "jJpwkV5g", "values": ["tF4vQBEj", "TemdMgmL", "8LFxjn8o"]}]}, {"operator": "and", "predicates": [{"anyOf": 28, "comparison": "isGreaterThan", "name": "heKYGdcv", "predicateType": "SeasonPassPredicate", "value": "8Tuz86Ho", "values": ["rstnoes1", "oWm0WILl", "AefqJDf5"]}, {"anyOf": 70, "comparison": "excludes", "name": "PW5Qvj9I", "predicateType": "SeasonPassPredicate", "value": "1K8DlCAU", "values": ["LUIDJhVX", "BNOoUStN", "uTzQZbge"]}, {"anyOf": 81, "comparison": "isLessThanOrEqual", "name": "oGP8TTg9", "predicateType": "EntitlementPredicate", "value": "nvHTOAZm", "values": ["ngyhDZHK", "owUif5SO", "n8LpxpAK"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'KOZFt0WJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "CCJMxZtM"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name '8R7HvmXS' \
    --offset '6' \
    --tag 'tvvvL0lA' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "6EJUEW7k", "name": "ParWTuqI", "status": "ACTIVE", "tags": ["TTSLuNKD", "slTzMRVN", "wOXfp0OK"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'XKGs5n9D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'fyOoRWUB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "XxB4Yxg4", "name": "gWfIZMQj", "status": "INACTIVE", "tags": ["QTO52DNN", "KMNTD5Sb", "ZZbF5KV3"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'WBd4BgZg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '4PzPG619' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '14' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'zS6lSJAG' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'bMtFNlKI' \
    --limit '77' \
    --offset '97' \
    --orderNos '85vzbttV,fn9uGYRD,ePTk2uJB' \
    --sortBy 'c0yoiBnI' \
    --startTime '9PDV3Tnh' \
    --status 'CLOSED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 143 'QueryOrders' test.out

#- 144 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'GetOrderStatistics' test.out

#- 145 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rHvG4pKu' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ueWMorLM' \
    --body '{"description": "y68NGDrZ"}' \
    > test.out 2>&1
eval_tap $? 146 'RefundOrder' test.out

#- 147 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPaymentCallbackConfig' test.out

#- 148 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "tHfyWJMz", "privateKey": "82T4e4Cb"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Zo09meKy' \
    --externalId '9IaomBCq' \
    --limit '12' \
    --notificationSource 'ALIPAY' \
    --notificationType '5bb6cOE5' \
    --offset '69' \
    --paymentOrderNo 'tvoDS9Xf' \
    --startDate 'p5rDOwtl' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 149 'QueryPaymentNotifications' test.out

#- 150 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Eh6IaJ9Q' \
    --limit '43' \
    --offset '39' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 150 'QueryPaymentOrders' test.out

#- 151 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "INBUde6y", "currencyNamespace": "3QemJMWj", "customParameters": {"xOByFkSu": {}, "7UmbY4gT": {}, "3UcT4tVG": {}}, "description": "RQlrU6Md", "extOrderNo": "WsRQNqIQ", "extUserId": "ZJxMjdD4", "itemType": "SUBSCRIPTION", "language": "KTiS_kJgW-yI", "metadata": {"4vpsEAdk": "y2HbjEJ0", "1RNoL4Su": "tgXfXcAT", "k3dubJM6": "FF8lNbzn"}, "notifyUrl": "5aQ7GOtv", "omitNotification": true, "platform": "scfYuiie", "price": 90, "recurringPaymentOrderNo": "7oC1hnLW", "region": "V5MyGiiz", "returnUrl": "jzYyGPw1", "sandbox": true, "sku": "6MW6bXND", "subscriptionId": "JCf8WIln", "targetNamespace": "xtoA6mhi", "targetUserId": "t0uMdPGD", "title": "hLdAGpx4"}' \
    > test.out 2>&1
eval_tap $? 151 'CreatePaymentOrderByDedicated' test.out

#- 152 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'BCbe6wSu' \
    > test.out 2>&1
eval_tap $? 152 'ListExtOrderNoByExtTxId' test.out

#- 153 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'VYjFJVjm' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrder' test.out

#- 154 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9sLMpp1f' \
    --body '{"extTxId": "hYWmmDmw", "paymentMethod": "DgdTXHKJ", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 154 'ChargePaymentOrder' test.out

#- 155 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'D6Q4Wk3p' \
    --body '{"description": "tGZYXnjE"}' \
    > test.out 2>&1
eval_tap $? 155 'RefundPaymentOrderByDedicated' test.out

#- 156 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'c0iDs0YG' \
    --body '{"amount": 86, "currencyCode": "jD3sA2No", "notifyType": "CHARGE", "paymentProvider": "STRIPE", "salesTax": 56, "vat": 99}' \
    > test.out 2>&1
eval_tap $? 156 'SimulatePaymentOrderNotification' test.out

#- 157 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tSi23Hbo' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrderChargeStatus' test.out

#- 158 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformEntitlementConfig' test.out

#- 159 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedPlatformOrigins": ["GooglePlay", "Epic", "Other"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformEntitlementConfig' test.out

#- 160 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 160 'GetPlatformWalletConfig' test.out

#- 161 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Epic", "System"]}' \
    > test.out 2>&1
eval_tap $? 161 'UpdatePlatformWalletConfig' test.out

#- 162 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 162 'ResetPlatformWalletConfig' test.out

#- 163 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'GetRevocationConfig' test.out

#- 164 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateRevocationConfig' test.out

#- 165 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'DeleteRevocationConfig' test.out

#- 166 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MJSc0znP' \
    --limit '63' \
    --offset '65' \
    --source 'OTHER' \
    --startTime 'OT9V3LUj' \
    --status 'SUCCESS' \
    --transactionId '4O4NwmJq' \
    --userId 'or95Qqgo' \
    > test.out 2>&1
eval_tap $? 166 'QueryRevocationHistories' test.out

#- 167 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationPluginConfig' test.out

#- 168 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "9LqzBEUo"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "PUHuFwJ7"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationPluginConfig' test.out

#- 169 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationPluginConfig' test.out

#- 170 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 170 'UploadRevocationPluginConfigCert' test.out

#- 171 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tqyZQ7aP", "eventTopic": "RZkysXEo", "maxAwarded": 15, "maxAwardedPerUser": 61, "namespaceExpression": "bri2vVRA", "rewardCode": "ALuExDwz", "rewardConditions": [{"condition": "PBb4bI8x", "conditionName": "q6aMFTic", "eventName": "tqL4FdE0", "rewardItems": [{"duration": 80, "endDate": "1991-10-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cmiNSP7s", "quantity": 66, "sku": "KNcv1vRi"}, {"duration": 7, "endDate": "1974-06-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "28D7nnDP", "quantity": 24, "sku": "A4tW4UZr"}, {"duration": 96, "endDate": "1996-06-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "eTTwL5Zv", "quantity": 100, "sku": "XUhS6L21"}]}, {"condition": "aTWk1hXa", "conditionName": "F7zE9nKe", "eventName": "HQToDyDB", "rewardItems": [{"duration": 21, "endDate": "1989-06-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jYtaoO1t", "quantity": 88, "sku": "avDlr9HI"}, {"duration": 24, "endDate": "1987-11-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TJk6Crrk", "quantity": 88, "sku": "5UG0e4Ve"}, {"duration": 1, "endDate": "1980-12-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NlDX1O4a", "quantity": 63, "sku": "gv4GkRhP"}]}, {"condition": "OZay8TJY", "conditionName": "jb5kOtLD", "eventName": "gtAawKT5", "rewardItems": [{"duration": 93, "endDate": "1974-12-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "cxHHMhL1", "quantity": 82, "sku": "Z2fppjvx"}, {"duration": 26, "endDate": "1999-04-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "z4CFgBY2", "quantity": 95, "sku": "ZORQ4zsP"}, {"duration": 37, "endDate": "1979-04-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "GW5WIInb", "quantity": 4, "sku": "euG3uXjw"}]}], "userIdExpression": "EueEiELS"}' \
    > test.out 2>&1
eval_tap $? 171 'CreateReward' test.out

#- 172 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'NY7PmB31' \
    --limit '67' \
    --offset '21' \
    --sortBy 'namespace,rewardCode' \
    > test.out 2>&1
eval_tap $? 172 'QueryRewards' test.out

#- 173 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'ExportRewards' test.out

#- 174 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'ImportRewards' test.out

#- 175 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'o7muezNE' \
    > test.out 2>&1
eval_tap $? 175 'GetReward' test.out

#- 176 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7rXUNdGn' \
    --body '{"description": "G8s8ZBas", "eventTopic": "IAdfZApO", "maxAwarded": 18, "maxAwardedPerUser": 75, "namespaceExpression": "OQ3iRhG8", "rewardCode": "hroaX1Us", "rewardConditions": [{"condition": "ARswpaD3", "conditionName": "IsfDBzRM", "eventName": "YiKRtVtu", "rewardItems": [{"duration": 55, "endDate": "1995-09-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "iESo0VyU", "quantity": 76, "sku": "Xjrr8Pt5"}, {"duration": 19, "endDate": "1986-02-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "tGO7K2TE", "quantity": 89, "sku": "OiLJzty2"}, {"duration": 54, "endDate": "1991-05-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "4vnEbq07", "quantity": 62, "sku": "5js4Vv4q"}]}, {"condition": "4huhuxe3", "conditionName": "RuIpY7lW", "eventName": "3Pk3CGpW", "rewardItems": [{"duration": 46, "endDate": "1978-08-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mXvqKtJF", "quantity": 36, "sku": "RACAPOrk"}, {"duration": 43, "endDate": "1996-05-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Cv2EBOhZ", "quantity": 73, "sku": "mVnVwN1q"}, {"duration": 44, "endDate": "1985-02-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lSjECfn9", "quantity": 45, "sku": "szakpylY"}]}, {"condition": "L0sGAfmn", "conditionName": "SQOqucda", "eventName": "3ww02AmA", "rewardItems": [{"duration": 95, "endDate": "1985-02-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mTS7pkhL", "quantity": 32, "sku": "dNY88T2U"}, {"duration": 0, "endDate": "1990-02-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "DOcpIsRm", "quantity": 97, "sku": "nVRkwTRq"}, {"duration": 63, "endDate": "1974-08-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "dlKrM5QD", "quantity": 8, "sku": "RYZWpVXQ"}]}], "userIdExpression": "a6gfwgrk"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateReward' test.out

#- 177 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jADAPw0u' \
    > test.out 2>&1
eval_tap $? 177 'DeleteReward' test.out

#- 178 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4YygTn2n' \
    --body '{"payload": {"kJHXBlG3": {}, "GUau94OH": {}, "0OXdDVrv": {}}}' \
    > test.out 2>&1
eval_tap $? 178 'CheckEventCondition' test.out

#- 179 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZKcVb2UI' \
    --body '{"conditionName": "Y8zRMl2T", "userId": "6qdXNnYm"}' \
    > test.out 2>&1
eval_tap $? 179 'DeleteRewardConditionRecord' test.out

#- 180 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'Wq93E4cP' \
    --limit '63' \
    --offset '94' \
    --start 'ypJlMicj' \
    --storeId 'UeaM7o1h' \
    --viewId '0RfbyjCJ' \
    > test.out 2>&1
eval_tap $? 180 'QuerySections' test.out

#- 181 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eflumZjm' \
    --body '{"active": true, "displayOrder": 14, "endDate": "1991-11-24T00:00:00Z", "ext": {"2GRtxHzS": {}, "xPVvix0j": {}, "PJZ8XwBI": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 78, "itemCount": 26, "rule": "SEQUENCE"}, "items": [{"id": "MNE1CSF7", "sku": "0Pda1qRH"}, {"id": "M9VFXkia", "sku": "x5FU5OXg"}, {"id": "X5Bf4A2Y", "sku": "WCDxOWxr"}], "localizations": {"zshSbN3Z": {"description": "euANZzS5", "localExt": {"OlpZygpp": {}, "PKjapAAG": {}, "a9XkAZv8": {}}, "longDescription": "gJt0rOrl", "title": "hNWPYvQq"}, "iIlLDNZx": {"description": "2TM4Oh8I", "localExt": {"Ob5UvepC": {}, "Z0FY35SK": {}, "c5l7pK1i": {}}, "longDescription": "evBtxffu", "title": "DN78TkH2"}, "JcJY2H6r": {"description": "BWfVQGfv", "localExt": {"uBM0Suvo": {}, "kSzc8QRj": {}, "jZSkFU4Y": {}}, "longDescription": "e5sCYWil", "title": "D4X5Ld2t"}}, "name": "oimEPyEg", "rotationType": "FIXED_PERIOD", "startDate": "1989-03-11T00:00:00Z", "viewId": "6VGnxMEg"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateSection' test.out

#- 182 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pJO6Gk25' \
    > test.out 2>&1
eval_tap $? 182 'PurgeExpiredSection' test.out

#- 183 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'q1mNxNLh' \
    --storeId 'KpYgKAFn' \
    > test.out 2>&1
eval_tap $? 183 'GetSection' test.out

#- 184 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '2XRoyl2M' \
    --storeId 'MOMQvKPC' \
    --body '{"active": false, "displayOrder": 95, "endDate": "1973-04-13T00:00:00Z", "ext": {"YAY2HgRC": {}, "lwvlEO0U": {}, "UEMDVZT9": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 70, "itemCount": 56, "rule": "SEQUENCE"}, "items": [{"id": "BRCHtLmZ", "sku": "yi2Qo2Uq"}, {"id": "o6YZSO3e", "sku": "E8tpCvUH"}, {"id": "AAfzXS2Y", "sku": "0UTn9sZF"}], "localizations": {"JnbFg4RJ": {"description": "X17zJMfk", "localExt": {"XO6MAGom": {}, "VGTtGsh9": {}, "5Vy5XpPd": {}}, "longDescription": "4NRtquTH", "title": "cB9TBkN1"}, "vwc8b56s": {"description": "RVTFkk7q", "localExt": {"3EoLBr44": {}, "sTQsJ8XD": {}, "qg14cVNQ": {}}, "longDescription": "X699Khs4", "title": "vcUHhaBV"}, "nJbhKfyV": {"description": "lOEerrmU", "localExt": {"54pKoP3k": {}, "Hq3lbIrQ": {}, "MzsfW9ri": {}}, "longDescription": "FkfQ2j3t", "title": "ZVErApAx"}}, "name": "OPuhgiB7", "rotationType": "CUSTOM", "startDate": "1995-10-07T00:00:00Z", "viewId": "0fuj9Qbb"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateSection' test.out

#- 185 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Zsv6WWik' \
    --storeId 'GXQWnNsZ' \
    > test.out 2>&1
eval_tap $? 185 'DeleteSection' test.out

#- 186 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'ListStores' test.out

#- 187 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "BBtrsLxb", "defaultRegion": "brO7Fvg4", "description": "kJ0oN73C", "supportedLanguages": ["FeanrxCr", "E2p6VTC4", "xA9lyywG"], "supportedRegions": ["6QyGe9Gx", "k5qSy8oB", "H8nx7CJU"], "title": "BHdKfbam"}' \
    > test.out 2>&1
eval_tap $? 187 'CreateStore' test.out

#- 188 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'VIEW' \
    > test.out 2>&1
eval_tap $? 188 'GetCatalogDefinition' test.out

#- 189 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'DownloadCSVTemplates' test.out

#- 190 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "ITEM", "fieldsToBeIncluded": ["xFVlEOfL", "aIhIkchF", "Hrd4sQAe"], "idsToBeExported": ["LjMbjGg3", "pCn5DqAw", "zPRXxj61"], "storeId": "oLWQ2u6B"}' \
    > test.out 2>&1
eval_tap $? 190 'ExportStoreByCSV' test.out

#- 191 ImportStore
eval_tap 0 191 'ImportStore # SKIP deprecated' test.out

#- 192 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetPublishedStore' test.out

#- 193 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DeletePublishedStore' test.out

#- 194 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'GetPublishedStoreBackup' test.out

#- 195 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'RollbackPublishedStore' test.out

#- 196 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VIq9PVJl' \
    > test.out 2>&1
eval_tap $? 196 'GetStore' test.out

#- 197 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '8fXTFyps' \
    --body '{"defaultLanguage": "UZSxBo0J", "defaultRegion": "F11vh8jI", "description": "T0CgYmDe", "supportedLanguages": ["uPG12fZB", "7zVlz9DM", "JFmVT6MZ"], "supportedRegions": ["kNCgFx8Y", "bVSQvvGG", "oa6GnhhE"], "title": "8w9WxFty"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateStore' test.out

#- 198 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PjkbMiZ7' \
    > test.out 2>&1
eval_tap $? 198 'DeleteStore' test.out

#- 199 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '5gcgNOiy' \
    --action 'CREATE' \
    --itemSku '0HE2UoGN' \
    --itemType 'LOOTBOX' \
    --limit '86' \
    --offset '56' \
    --selected  \
    --sortBy 'createdAt,updatedAt,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd '67doGfpN' \
    --updatedAtStart 'gGazYYuz' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 199 'QueryChanges' test.out

#- 200 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'k5IVGJCg' \
    > test.out 2>&1
eval_tap $? 200 'PublishAll' test.out

#- 201 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hOlqDfIw' \
    > test.out 2>&1
eval_tap $? 201 'PublishSelected' test.out

#- 202 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F28LNreK' \
    > test.out 2>&1
eval_tap $? 202 'SelectAllRecords' test.out

#- 203 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UY1Ix7yi' \
    --action 'DELETE' \
    --itemSku 'oQcAIyX7' \
    --itemType 'SUBSCRIPTION' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd 'a9r33D1h' \
    --updatedAtStart 'ZjAOuroF' \
    > test.out 2>&1
eval_tap $? 203 'SelectAllRecordsByCriteria' test.out

#- 204 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DNKPufnR' \
    --action 'DELETE' \
    --itemSku '6Bkm5inr' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd 'c4q9C82h' \
    --updatedAtStart 'G8yAmQEg' \
    > test.out 2>&1
eval_tap $? 204 'GetStatistic' test.out

#- 205 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ec14XdRy' \
    > test.out 2>&1
eval_tap $? 205 'UnselectAllRecords' test.out

#- 206 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'GCJN7YCO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lj4UBXXe' \
    > test.out 2>&1
eval_tap $? 206 'SelectRecord' test.out

#- 207 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'IG5mDfRF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nPBRcWAE' \
    > test.out 2>&1
eval_tap $? 207 'UnselectRecord' test.out

#- 208 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FdTX4J9k' \
    --targetStoreId 'NnjH3N05' \
    > test.out 2>&1
eval_tap $? 208 'CloneStore' test.out

#- 209 ExportStore
eval_tap 0 209 'ExportStore # SKIP deprecated' test.out

#- 210 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '3WIAWCAk' \
    --end 'NCIEUpRE' \
    --limit '96' \
    --offset '76' \
    --sortBy 'TylzxxhO' \
    --start 'bj2ouWz7' \
    --success  \
    > test.out 2>&1
eval_tap $? 210 'QueryImportHistory' test.out

#- 211 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '9hl3Rcg5' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'xk2ZZvxr' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 211 'ImportStoreByCSV' test.out

#- 212 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'mo9hB7Lj' \
    --limit '59' \
    --offset '66' \
    --sku 'BE7l4rp7' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'ovsrJLUw' \
    > test.out 2>&1
eval_tap $? 212 'QuerySubscriptions' test.out

#- 213 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7MXdzaQ9' \
    > test.out 2>&1
eval_tap $? 213 'RecurringChargeSubscription' test.out

#- 214 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'kktlHQi5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketDynamic' test.out

#- 215 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'fY2zWx9e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "P1yJR6vm"}' \
    > test.out 2>&1
eval_tap $? 215 'DecreaseTicketSale' test.out

#- 216 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'reoRre0V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'GetTicketBoothID' test.out

#- 217 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '7TsJNFQs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 32, "orderNo": "Pi55k9m9"}' \
    > test.out 2>&1
eval_tap $? 217 'IncreaseTicketSale' test.out

#- 218 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 91, "currencyCode": "wugN3y42", "expireAt": "1979-02-19T00:00:00Z"}, "debitPayload": {"count": 81, "currencyCode": "wghhnrwB", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "Xx4cUYWh", "entitlementOrigin": "System", "itemIdentity": "KMAsrdam", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "6y5kPsZt"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 63, "currencyCode": "OqghxOPz", "expireAt": "1999-09-14T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "iLjWJRXv", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 7, "entitlementCollectionId": "rCDtDMpe", "entitlementOrigin": "Xbox", "itemIdentity": "IWYEh2sZ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "bnG2B2l4"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 66, "currencyCode": "uYp329OG", "expireAt": "1989-12-25T00:00:00Z"}, "debitPayload": {"count": 26, "currencyCode": "aDuhHDDS", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 8, "entitlementCollectionId": "UVxBW0ZL", "entitlementOrigin": "Playstation", "itemIdentity": "4WF9GVEJ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 73, "entitlementId": "lQydtWWN"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "sZIEZNQ8"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 34, "currencyCode": "GRtot5kK", "expireAt": "1983-07-01T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "OiCeR8oT", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 32, "entitlementCollectionId": "4XRavjIp", "entitlementOrigin": "Nintendo", "itemIdentity": "wH0enURv", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 84, "entitlementId": "9GmnyA4G"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 27, "currencyCode": "1a2BUR1g", "expireAt": "1983-11-17T00:00:00Z"}, "debitPayload": {"count": 61, "currencyCode": "gEl3CULd", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "J3kwkzLa", "entitlementOrigin": "Playstation", "itemIdentity": "Mj8Epsu8", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "2h9X68Ag"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 3, "currencyCode": "Lz9XMyQB", "expireAt": "1981-05-16T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "GpvavyZD", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 1, "entitlementCollectionId": "AhZy3DmJ", "entitlementOrigin": "Steam", "itemIdentity": "d0SwSeEv", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "vRheOkFX"}, "type": "CREDIT_WALLET"}], "userId": "XYSPQ6if"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 78, "currencyCode": "rlOzFKx7", "expireAt": "1981-05-26T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "jphbX1GU", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 49, "entitlementCollectionId": "ieR5vHTw", "entitlementOrigin": "GooglePlay", "itemIdentity": "2EwbMRWr", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "Ol0ILzrV"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 1, "currencyCode": "Jl2d9ITJ", "expireAt": "1981-05-23T00:00:00Z"}, "debitPayload": {"count": 37, "currencyCode": "HZCKAMFd", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 3, "entitlementCollectionId": "AZg3IJYl", "entitlementOrigin": "Xbox", "itemIdentity": "bLMuxerE", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "TcZp5N2o"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 38, "currencyCode": "Rg2xThue", "expireAt": "1987-05-30T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "HeVeZ5xO", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 100, "entitlementCollectionId": "9YIDoAfi", "entitlementOrigin": "Playstation", "itemIdentity": "MZ50eLoP", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 48, "entitlementId": "drvAXXGK"}, "type": "DEBIT_WALLET"}], "userId": "s0V5mbx9"}], "metadata": {"JXh1lcBE": {}, "dLbyoDnO": {}, "b3M6wc8A": {}}, "needPreCheck": true, "transactionId": "rCCbuuCs", "type": "OagAHG9a"}' \
    > test.out 2>&1
eval_tap $? 218 'Commit' test.out

#- 219 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '15' \
    --status 'FAILED' \
    --type 'zN5rMgsL' \
    --userId 'wOWfzgqW' \
    > test.out 2>&1
eval_tap $? 219 'GetTradeHistoryByCriteria' test.out

#- 220 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'bHPk2ecS' \
    > test.out 2>&1
eval_tap $? 220 'GetTradeHistoryByTransactionId' test.out

#- 221 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xL0DrEKY' \
    --body '{"achievements": [{"id": "9lcWNhh7", "value": 95}, {"id": "jdwcSiXa", "value": 21}, {"id": "AsewHnNT", "value": 81}], "steamUserId": "7mxelSJ1"}' \
    > test.out 2>&1
eval_tap $? 221 'UnlockSteamUserAchievement' test.out

#- 222 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '1a5VeK3G' \
    --xboxUserId '2ZX2KRfI' \
    > test.out 2>&1
eval_tap $? 222 'GetXblUserAchievements' test.out

#- 223 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xl0JiGE2' \
    --body '{"achievements": [{"id": "LoUu4GZ4", "percentComplete": 95}, {"id": "4VQnmmWL", "percentComplete": 1}, {"id": "3AA764DM", "percentComplete": 22}], "serviceConfigId": "2OliNo1R", "titleId": "36XsK8du", "xboxUserId": "XGtdk8fu"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateXblUserAchievement' test.out

#- 224 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ec7EgwDm' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeCampaign' test.out

#- 225 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Or0F9uYK' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeEntitlement' test.out

#- 226 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '1vwKwVZS' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeFulfillment' test.out

#- 227 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJdSSnyL' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizeIntegration' test.out

#- 228 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8ZK9vdP' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeOrder' test.out

#- 229 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '9Wgk15JL' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizePayment' test.out

#- 230 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'AYuGWQqU' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeRevocation' test.out

#- 231 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'msZyRyVS' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeSubscription' test.out

#- 232 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLS5jvvV' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeWallet' test.out

#- 233 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '6Z9YPXz6' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 233 'GetUserDLCByPlatform' test.out

#- 234 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'f4lZMoFb' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 234 'GetUserDLC' test.out

#- 235 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pg1Yk7Yp' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId '3JlMhATI' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'TTmhuc7p' \
    --features 'regwKIco,t9NblIaT,e8Yp6k1H' \
    --fuzzyMatchName  \
    --itemId 'cJDmoV2b,wTwUs3Tv,jHVsiwzm' \
    --limit '96' \
    --offset '6' \
    --origin 'System' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserEntitlements' test.out

#- 236 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'oUcV0PI9' \
    --body '[{"collectionId": "kEtnim6W", "endDate": "1996-02-16T00:00:00Z", "grantedCode": "isQZ05jO", "itemId": "lfnvC1N8", "itemNamespace": "8005l4so", "language": "pb", "origin": "Xbox", "quantity": 48, "region": "OgVBMcAr", "source": "OTHER", "startDate": "1984-07-11T00:00:00Z", "storeId": "blyrLOIp"}, {"collectionId": "xhY4z6m8", "endDate": "1973-05-12T00:00:00Z", "grantedCode": "FZdg2ZL3", "itemId": "7IO0tRoz", "itemNamespace": "M7F2qT4x", "language": "HzK-zs", "origin": "GooglePlay", "quantity": 6, "region": "evNaqY1q", "source": "REWARD", "startDate": "1998-06-29T00:00:00Z", "storeId": "7Iur0aiI"}, {"collectionId": "YeBqDFN4", "endDate": "1983-10-31T00:00:00Z", "grantedCode": "1KzzUb87", "itemId": "7zJpYrgh", "itemNamespace": "RxcYStWy", "language": "InB-gwhb-hz", "origin": "Oculus", "quantity": 69, "region": "F2OWuvhI", "source": "OTHER", "startDate": "1973-08-15T00:00:00Z", "storeId": "x0lwiHc8"}]' \
    > test.out 2>&1
eval_tap $? 236 'GrantUserEntitlement' test.out

#- 237 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KOEVYm9Y' \
    --activeOnly  \
    --appId '2gzDY4GH' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementByAppId' test.out

#- 238 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'djCizWz7' \
    --activeOnly  \
    --limit '2' \
    --offset '100' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserEntitlementsByAppType' test.out

#- 239 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wjF8JpEA' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'yeZqYgkT' \
    --itemId 'zR35IoCS' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementByItemId' test.out

#- 240 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IWBYqBaF' \
    --ids 'anD8KWyJ,oughmy50,LSeRh5ky' \
    --platform 'AEkQ9tNm' \
    > test.out 2>&1
eval_tap $? 240 'GetUserActiveEntitlementsByItemIds' test.out

#- 241 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'EDm8szcu' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'JIZUfhir' \
    --sku 'av0fSuB4' \
    > test.out 2>&1
eval_tap $? 241 'GetUserEntitlementBySku' test.out

#- 242 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifA67vfm' \
    --appIds 'lihKSra2,5hKTKrXD,NwkCu9a5' \
    --itemIds 'Yy7WA36j,DJWJet2j,qiXsCVDj' \
    --platform 'NqdAxTt7' \
    --skus 'Zw9b6o6b,u1tCIYfL,sx1P5dAH' \
    > test.out 2>&1
eval_tap $? 242 'ExistsAnyUserActiveEntitlement' test.out

#- 243 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsX3ZL8f' \
    --platform 'I3yjLjue' \
    --itemIds 'GDs5QdZn,HucQMlZl,uMEK6406' \
    > test.out 2>&1
eval_tap $? 243 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 244 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpFFjlzz' \
    --appId 'VKx2sk3u' \
    > test.out 2>&1
eval_tap $? 244 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 245 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tWbbuGg0' \
    --entitlementClazz 'CODE' \
    --platform 'gsffSFpH' \
    --itemId 'qEV2g5Uk' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipByItemId' test.out

#- 246 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '2cNs23nO' \
    --ids 'OInzinTx,5YG6A1TR,01fudQZy' \
    --platform 'SqXGDY8q' \
    > test.out 2>&1
eval_tap $? 246 'GetUserEntitlementOwnershipByItemIds' test.out

#- 247 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'aAYXkrrz' \
    --entitlementClazz 'CODE' \
    --platform 'VvuhnMTu' \
    --sku 'qpG6oXCu' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementOwnershipBySku' test.out

#- 248 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'WoekEti7' \
    > test.out 2>&1
eval_tap $? 248 'RevokeAllEntitlements' test.out

#- 249 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vquyn7vn' \
    --entitlementIds 'zEL9mKWq' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlements' test.out

#- 250 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'xLPhS4Iy' \
    --namespace "$AB_NAMESPACE" \
    --userId '2EUTuUTC' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlement' test.out

#- 251 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'l2L5iKrB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdCicMTV' \
    --body '{"collectionId": "IpVhlNb9", "endDate": "1983-05-03T00:00:00Z", "nullFieldList": ["yCVRc3TU", "T6rfUSEn", "HskptH9D"], "origin": "GooglePlay", "reason": "52ofYfZy", "startDate": "1983-08-06T00:00:00Z", "status": "INACTIVE", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateUserEntitlement' test.out

#- 252 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'KgMuQQQm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tTvVOw6B' \
    --body '{"options": ["njRtRjbw", "wFbGYlVl", "alw3VC47"], "platform": "uyHDEyGS", "requestId": "CQmYRrRM", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 252 'ConsumeUserEntitlement' test.out

#- 253 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'gx7xmgSI' \
    --namespace "$AB_NAMESPACE" \
    --userId '60607FQ3' \
    > test.out 2>&1
eval_tap $? 253 'DisableUserEntitlement' test.out

#- 254 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '5DFCCxEA' \
    --namespace "$AB_NAMESPACE" \
    --userId '0XqAvrhp' \
    > test.out 2>&1
eval_tap $? 254 'EnableUserEntitlement' test.out

#- 255 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'zKjUOEg2' \
    --namespace "$AB_NAMESPACE" \
    --userId '7PBtJB55' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementHistories' test.out

#- 256 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'QQNEYLeG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wEj877Of' \
    > test.out 2>&1
eval_tap $? 256 'RevokeUserEntitlement' test.out

#- 257 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'LLUOhtKt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PpUzh1Sc' \
    --body '{"reason": "dsqm8LuE", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 257 'RevokeUserEntitlementByUseCount' test.out

#- 258 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '1QvTRoNl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTBFG2r1' \
    --quantity '54' \
    > test.out 2>&1
eval_tap $? 258 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 259 RevokeUseCount
eval_tap 0 259 'RevokeUseCount # SKIP deprecated' test.out

#- 260 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'TY43PXgS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WpiiKYpi' \
    --body '{"platform": "ccQ32RTw", "requestId": "eTbamroH", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 260 'SellUserEntitlement' test.out

#- 261 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4OwjIKRC' \
    --body '{"duration": 89, "endDate": "1994-03-03T00:00:00Z", "entitlementCollectionId": "gVL2bAjx", "entitlementOrigin": "IOS", "itemId": "fjw8GXXP", "itemSku": "VJJ6LL5J", "language": "lb4UcatX", "metadata": {"S2G9BnFY": {}, "9hfxQeYA": {}, "2HLA2bEZ": {}}, "order": {"currency": {"currencyCode": "YIloa8hX", "currencySymbol": "YZt1620A", "currencyType": "REAL", "decimals": 26, "namespace": "GoTUcord"}, "ext": {"LQjndX6e": {}, "Mpk3em9Q": {}, "zqAHznG0": {}}, "free": true}, "orderNo": "mofWQo53", "origin": "GooglePlay", "overrideBundleItemQty": {"QIkQortZ": 57, "ilWVNgyx": 38, "DsR11fYl": 64}, "quantity": 77, "region": "BuE4wn49", "source": "GIFT", "startDate": "1975-08-11T00:00:00Z", "storeId": "no3Nkb0L"}' \
    > test.out 2>&1
eval_tap $? 261 'FulfillItem' test.out

#- 262 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHLdanrd' \
    --body '{"code": "uhWHpLcY", "language": "AZZ_Vb", "region": "K2Pn40hW"}' \
    > test.out 2>&1
eval_tap $? 262 'RedeemCode' test.out

#- 263 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlAbeHwO' \
    --body '{"itemId": "C8cV1a2D", "itemSku": "jotUKBLg", "quantity": 5}' \
    > test.out 2>&1
eval_tap $? 263 'PreCheckFulfillItem' test.out

#- 264 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIzSwQQu' \
    --body '{"entitlementCollectionId": "EZ3d0V08", "entitlementOrigin": "IOS", "metadata": {"j87pLx7d": {}, "RnzQ2DnB": {}, "dIRjzR6F": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "XEG1nzF9", "namespace": "AZYvrLgD"}, "item": {"itemId": "5olGNKWw", "itemSku": "iQnyUi3y", "itemType": "sgL9WmCl"}, "quantity": 61, "type": "ITEM"}, {"currency": {"currencyCode": "YPOInnSr", "namespace": "m5Zk7jij"}, "item": {"itemId": "gBe70sIf", "itemSku": "jL4Rstz0", "itemType": "G4L6C1np"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "qkSCNfDB", "namespace": "A5C6wJbQ"}, "item": {"itemId": "muAglxT9", "itemSku": "1qF1rS06", "itemType": "dOtSF9g4"}, "quantity": 6, "type": "CURRENCY"}], "source": "GIFT", "transactionId": "1HKQMtfk"}' \
    > test.out 2>&1
eval_tap $? 264 'FulfillRewards' test.out

#- 265 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVhTUtmm' \
    --endTime 'HbBtuiOg' \
    --limit '95' \
    --offset '78' \
    --productId 'EFnah5Vj' \
    --startTime 'vP7wX5nD' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPOrders' test.out

#- 266 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'm9X0ffoy' \
    > test.out 2>&1
eval_tap $? 266 'QueryAllUserIAPOrders' test.out

#- 267 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FyuhZdtU' \
    --endTime 'xYhuECA7' \
    --limit '55' \
    --offset '76' \
    --startTime 'iWSdNqmI' \
    --status 'FAIL' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserIAPConsumeHistory' test.out

#- 268 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xY4SGDRG' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "WFmZ_kYMj", "productId": "VidonwDu", "region": "6QHpbgeQ", "transactionId": "LFmhz88M", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 268 'MockFulfillIAPItem' test.out

#- 269 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dc8CzuwV' \
    --discounted  \
    --itemId 'VteIBtv1' \
    --limit '17' \
    --offset '98' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserOrders' test.out

#- 270 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4baNHnc' \
    --body '{"currencyCode": "W0c0nSYr", "currencyNamespace": "XYzgXJ6c", "discountCodes": ["QBNyjCMX", "uIEoRTsT", "2qrK0pSC"], "discountedPrice": 77, "entitlementPlatform": "Steam", "ext": {"4UDUR9Rt": {}, "iT2u0qgw": {}, "vA7UUs9e": {}}, "itemId": "8zg7UqnZ", "language": "mvv2hK9F", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 96, "quantity": 7, "region": "vcaFqZqH", "returnUrl": "QqKIgwHg", "sandbox": false, "sectionId": "eVwGGugf"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateUserOrder' test.out

#- 271 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'J6hEL4v2' \
    --itemId 'X5raw7IC' \
    > test.out 2>&1
eval_tap $? 271 'CountOfPurchasedItem' test.out

#- 272 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WISmO9lR' \
    --userId '1WNvstUl' \
    > test.out 2>&1
eval_tap $? 272 'GetUserOrder' test.out

#- 273 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NqD0fjPd' \
    --userId 'OGPmLm3E' \
    --body '{"status": "DELETED", "statusReason": "8Pb4fC3T"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateUserOrderStatus' test.out

#- 274 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Of6IVu11' \
    --userId 'KyEHEpOu' \
    > test.out 2>&1
eval_tap $? 274 'FulfillUserOrder' test.out

#- 275 GetUserOrderGrant
eval_tap 0 275 'GetUserOrderGrant # SKIP deprecated' test.out

#- 276 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zmfA2d8X' \
    --userId 'unSM519s' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrderHistories' test.out

#- 277 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'R2j9fLYM' \
    --userId 'IgsvHZ7R' \
    --body '{"additionalData": {"cardSummary": "XFlvyGVB"}, "authorisedTime": "1987-01-24T00:00:00Z", "chargebackReversedTime": "1976-12-15T00:00:00Z", "chargebackTime": "1992-04-12T00:00:00Z", "chargedTime": "1978-11-27T00:00:00Z", "createdTime": "1999-11-08T00:00:00Z", "currency": {"currencyCode": "UaOji1g5", "currencySymbol": "gyXWeBzM", "currencyType": "REAL", "decimals": 30, "namespace": "wzpHc1lC"}, "customParameters": {"yCOEwPCV": {}, "uVrl1EDi": {}, "joXG5HW1": {}}, "extOrderNo": "CKHlSmUe", "extTxId": "aa8nMBoI", "extUserId": "SCv7K23K", "issuedAt": "1975-12-09T00:00:00Z", "metadata": {"uVuRuOYV": "QcpgjW4k", "xDTFnPSA": "07zQG9ow", "90WDI551": "LMhd77aQ"}, "namespace": "HDgOSFkB", "nonceStr": "FlDJlimY", "paymentMethod": "Q9Jd2Ig7", "paymentMethodFee": 60, "paymentOrderNo": "tCl9HeBj", "paymentProvider": "XSOLLA", "paymentProviderFee": 64, "paymentStationUrl": "sfFazLCK", "price": 47, "refundedTime": "1973-12-08T00:00:00Z", "salesTax": 62, "sandbox": false, "sku": "eE3bquYk", "status": "AUTHORISE_FAILED", "statusReason": "2XMQ25dW", "subscriptionId": "oyYDdIbo", "subtotalPrice": 49, "targetNamespace": "tDnYY64l", "targetUserId": "qpo3T7zX", "tax": 38, "totalPrice": 52, "totalTax": 22, "txEndTime": "1983-01-14T00:00:00Z", "type": "3s8kW3b6", "userId": "ryaKT8yD", "vat": 91}' \
    > test.out 2>&1
eval_tap $? 277 'ProcessUserOrderNotification' test.out

#- 278 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MgBoQnXA' \
    --userId '23Hsg47E' \
    > test.out 2>&1
eval_tap $? 278 'DownloadUserOrderReceipt' test.out

#- 279 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'iP9RxP1q' \
    --body '{"currencyCode": "dR2kuU7L", "currencyNamespace": "lfNKrcC4", "customParameters": {"GYZDDkQE": {}, "zsrqNRfA": {}, "oxriK0F3": {}}, "description": "lSTBs0QE", "extOrderNo": "942fURmb", "extUserId": "TIrguEUs", "itemType": "INGAMEITEM", "language": "SZ", "metadata": {"v6S1YiMT": "1peIpqTa", "FDPWMjm3": "KX2L1hbe", "apsNMD83": "0vs90aMV"}, "notifyUrl": "hDoluTIn", "omitNotification": false, "platform": "Qg22GJc0", "price": 88, "recurringPaymentOrderNo": "VnWNkUr4", "region": "TrU90CsE", "returnUrl": "vnJLN2Js", "sandbox": true, "sku": "hPCTL9Tp", "subscriptionId": "h4ASAtAG", "title": "4456Fp6l"}' \
    > test.out 2>&1
eval_tap $? 279 'CreateUserPaymentOrder' test.out

#- 280 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QGQ1qn5x' \
    --userId 'simiwQOF' \
    --body '{"description": "atk41mVn"}' \
    > test.out 2>&1
eval_tap $? 280 'RefundUserPaymentOrder' test.out

#- 281 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId '0Mg4z0yH' \
    > test.out 2>&1
eval_tap $? 281 'GetUserPlatformAccountClosureHistories' test.out

#- 282 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1yB5Cbd' \
    --body '{"code": "Kvzi8wFb", "orderNo": "DzXHDqwq"}' \
    > test.out 2>&1
eval_tap $? 282 'ApplyUserRedemption' test.out

#- 283 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'S3HPIXGp' \
    --body '{"meta": {"OOCOkbIF": {}, "k7TyU78g": {}, "6PrLgmnv": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "aV6uCidh", "namespace": "8ENQUJsG"}, "entitlement": {"entitlementId": "NAFHqEGW"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "bcSNVLmb", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 78, "type": "ITEM"}, {"currency": {"balanceOrigin": "System", "currencyCode": "BVpYKsOq", "namespace": "RuSoQ75k"}, "entitlement": {"entitlementId": "4cQSs4BI"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "Dwrk5E4d", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 96, "type": "ITEM"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "j28OdZIn", "namespace": "XIGeA8Kd"}, "entitlement": {"entitlementId": "cmqYK0sN"}, "item": {"entitlementOrigin": "System", "itemIdentity": "Zu0uG0TS", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 41, "type": "ITEM"}], "source": "DLC", "transactionId": "OtHb1LoH"}' \
    > test.out 2>&1
eval_tap $? 283 'DoRevocation' test.out

#- 284 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ga5nktg3' \
    --body '{"gameSessionId": "df5V3W72", "payload": {"lYKlyPkR": {}, "rNtA8TYo": {}, "YSiDvYsa": {}}, "scid": "Hq1cryF9", "sessionTemplateName": "Ggl7kIMZ"}' \
    > test.out 2>&1
eval_tap $? 284 'RegisterXblSessions' test.out

#- 285 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YkuRJzig' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'aOwdyAPy' \
    --limit '76' \
    --offset '95' \
    --sku '2cETUvqb' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserSubscriptions' test.out

#- 286 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'iI3UdbOx' \
    --excludeSystem  \
    --limit '53' \
    --offset '62' \
    --subscriptionId 'ztBM2Xps' \
    > test.out 2>&1
eval_tap $? 286 'GetUserSubscriptionActivities' test.out

#- 287 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'x87shKbx' \
    --body '{"grantDays": 91, "itemId": "P4aaemHS", "language": "Skpjivy1", "reason": "4g03J176", "region": "sFtJa1LR", "source": "5EopHKAM"}' \
    > test.out 2>&1
eval_tap $? 287 'PlatformSubscribeSubscription' test.out

#- 288 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhlxhsH7' \
    --itemId 'QXybxHGe' \
    > test.out 2>&1
eval_tap $? 288 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 289 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MmDovlYR' \
    --userId 'zJNZUI2H' \
    > test.out 2>&1
eval_tap $? 289 'GetUserSubscription' test.out

#- 290 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FOrSJXPq' \
    --userId 'EHSNourw' \
    > test.out 2>&1
eval_tap $? 290 'DeleteUserSubscription' test.out

#- 291 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lBif1Ee3' \
    --userId '1D4K6d9i' \
    --force  \
    --body '{"immediate": false, "reason": "RXQu1bUi"}' \
    > test.out 2>&1
eval_tap $? 291 'CancelSubscription' test.out

#- 292 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Nju1yF2V' \
    --userId 'ePwwucYY' \
    --body '{"grantDays": 81, "reason": "8U4XH41J"}' \
    > test.out 2>&1
eval_tap $? 292 'GrantDaysToSubscription' test.out

#- 293 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vSfCRxNj' \
    --userId 'wTZqsaua' \
    --excludeFree  \
    --limit '21' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscriptionBillingHistories' test.out

#- 294 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VUVBLLR8' \
    --userId 'giLYZe7z' \
    --body '{"additionalData": {"cardSummary": "1829iyba"}, "authorisedTime": "1997-04-07T00:00:00Z", "chargebackReversedTime": "1999-09-20T00:00:00Z", "chargebackTime": "1971-05-25T00:00:00Z", "chargedTime": "1979-02-17T00:00:00Z", "createdTime": "1984-01-16T00:00:00Z", "currency": {"currencyCode": "QGDs60bB", "currencySymbol": "PLl4CB1I", "currencyType": "VIRTUAL", "decimals": 5, "namespace": "p7UXgoYd"}, "customParameters": {"VL1IAHT1": {}, "f7E6wbEg": {}, "QKeEJhvw": {}}, "extOrderNo": "18TpiY5B", "extTxId": "kutEpWRZ", "extUserId": "PAx9BHhr", "issuedAt": "1986-12-02T00:00:00Z", "metadata": {"f5uDN3g1": "N79bmGtV", "wL3GpcBd": "QQOkKC48", "tT9wzvtB": "BFqRYoAq"}, "namespace": "xjeVaoSS", "nonceStr": "Dw1jwXGy", "paymentMethod": "YhVahUUI", "paymentMethodFee": 92, "paymentOrderNo": "EDVa8njq", "paymentProvider": "STRIPE", "paymentProviderFee": 87, "paymentStationUrl": "J4UX5ed6", "price": 71, "refundedTime": "1980-03-07T00:00:00Z", "salesTax": 46, "sandbox": true, "sku": "Irhb7ugi", "status": "REFUND_FAILED", "statusReason": "IFxkAtMD", "subscriptionId": "hSjsUorp", "subtotalPrice": 83, "targetNamespace": "PPpCIAOR", "targetUserId": "q5xzcLA5", "tax": 24, "totalPrice": 90, "totalTax": 74, "txEndTime": "1975-02-05T00:00:00Z", "type": "3elIgvhi", "userId": "fLRkbGCu", "vat": 55}' \
    > test.out 2>&1
eval_tap $? 294 'ProcessUserSubscriptionNotification' test.out

#- 295 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'hCBGba1F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVzm528B' \
    --body '{"count": 82, "orderNo": "O6ulSz0M"}' \
    > test.out 2>&1
eval_tap $? 295 'AcquireUserTicket' test.out

#- 296 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'viaQIPuo' \
    > test.out 2>&1
eval_tap $? 296 'QueryUserCurrencyWallets' test.out

#- 297 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'NkswbGZh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jC9IK4wX' \
    --body '{"allowOverdraft": false, "amount": 73, "balanceOrigin": "Epic", "balanceSource": "IAP_REVOCATION", "metadata": {"j6nCTtcR": {}, "hIKvaLiV": {}, "E0eN9blq": {}}, "reason": "PhdgJQJM"}' \
    > test.out 2>&1
eval_tap $? 297 'DebitUserWalletByCurrencyCode' test.out

#- 298 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'uHYf17O5' \
    --namespace "$AB_NAMESPACE" \
    --userId '7iS4Gr59' \
    --limit '97' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 298 'ListUserCurrencyTransactions' test.out

#- 299 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'qGkTiSED' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jo3CSgGT' \
    --request '{"amount": 94, "debitBalanceSource": "TRADE", "metadata": {"lYxQ3wdg": {}, "DGaLIKOm": {}, "ERbBdHru": {}}, "reason": "MNwsT797", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 299 'CheckBalance' test.out

#- 300 CheckWallet
eval_tap 0 300 'CheckWallet # SKIP deprecated' test.out

#- 301 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'GlxkAttP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rv6Ujcbz' \
    --body '{"amount": 4, "expireAt": "1987-12-19T00:00:00Z", "metadata": {"L5FYB14o": {}, "yf0TDTDx": {}, "ncNbPOtF": {}}, "origin": "Xbox", "reason": "QzYrwCTP", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 301 'CreditUserWallet' test.out

#- 302 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'It4D26Ft' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvJawpyP' \
    --request '{"amount": 7, "debitBalanceSource": "EXPIRATION", "metadata": {"0p41nvOy": {}, "8pTfoSja": {}, "0C1jpVab": {}}, "reason": "ytul4J5r", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 302 'DebitByWalletPlatform' test.out

#- 303 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'QhRtNrBl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VPNF0NOw' \
    --body '{"amount": 18, "metadata": {"W2PuKLWd": {}, "MlCtUdLK": {}, "k5xxJxiv": {}}, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 303 'PayWithUserWallet' test.out

#- 304 GetUserWallet
eval_tap 0 304 'GetUserWallet # SKIP deprecated' test.out

#- 305 DebitUserWallet
eval_tap 0 305 'DebitUserWallet # SKIP deprecated' test.out

#- 306 DisableUserWallet
eval_tap 0 306 'DisableUserWallet # SKIP deprecated' test.out

#- 307 EnableUserWallet
eval_tap 0 307 'EnableUserWallet # SKIP deprecated' test.out

#- 308 ListUserWalletTransactions
eval_tap 0 308 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 309 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '7eEleOnP' \
    > test.out 2>&1
eval_tap $? 309 'ListViews' test.out

#- 310 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '3BJ9HBFU' \
    --body '{"displayOrder": 74, "localizations": {"PEij2wvJ": {"description": "aPJcRBHH", "localExt": {"ysS0lHlk": {}, "7fh7Z68Y": {}, "Uovytrgm": {}}, "longDescription": "ZrvHxnru", "title": "RpIZWlgJ"}, "0iU378SD": {"description": "RMED2ITP", "localExt": {"HutbkN73": {}, "Qk2pgjEN": {}, "vw15YIKj": {}}, "longDescription": "fckMreYu", "title": "KkwiKIoU"}, "hYkvSJhd": {"description": "NbOvUM6R", "localExt": {"fCA5W2hX": {}, "Oez2LO3Z": {}, "GL3f0j5z": {}}, "longDescription": "q5bRUqyw", "title": "XjMcvVmg"}}, "name": "Dx6bI3UJ"}' \
    > test.out 2>&1
eval_tap $? 310 'CreateView' test.out

#- 311 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'l3vL5eaH' \
    --storeId '9Oq2L1iq' \
    > test.out 2>&1
eval_tap $? 311 'GetView' test.out

#- 312 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '8RCAWGcx' \
    --storeId 'bq4N3qiv' \
    --body '{"displayOrder": 32, "localizations": {"bd5ZSVwk": {"description": "fCG4Pcl8", "localExt": {"kDqnSZSS": {}, "f2LZwqp1": {}, "Ju9wC0Qa": {}}, "longDescription": "dIqyJskY", "title": "70j0FeT6"}, "7vbgf6y1": {"description": "KWMZnFPp", "localExt": {"JfKAbEQQ": {}, "xwDDniQM": {}, "zacI8a7m": {}}, "longDescription": "GRH2WHkU", "title": "rKmnbMbD"}, "U0sPaPi4": {"description": "QhkTsAA4", "localExt": {"CWnulmr3": {}, "sPlaRpeA": {}, "lHjNMkGv": {}}, "longDescription": "JbDZShuA", "title": "cyX3PdSs"}}, "name": "NKVaGz7R"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateView' test.out

#- 313 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'p2PBkPdA' \
    --storeId 'CQHUNsQC' \
    > test.out 2>&1
eval_tap $? 313 'DeleteView' test.out

#- 314 QueryWallets
eval_tap 0 314 'QueryWallets # SKIP deprecated' test.out

#- 315 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 15, "expireAt": "1991-06-06T00:00:00Z", "metadata": {"ZgNw3GJS": {}, "JcXRtZOT": {}, "SWeDpRMV": {}}, "origin": "Twitch", "reason": "RinGBsmY", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "f1VDEa7P", "userIds": ["SywsjXF6", "hnJMz9xu", "DC2JcTMx"]}, {"creditRequest": {"amount": 31, "expireAt": "1990-12-02T00:00:00Z", "metadata": {"KO9f2Rme": {}, "jzwYlmeG": {}, "Z4yryM3b": {}}, "origin": "Xbox", "reason": "QtU6WI8H", "source": "REFERRAL_BONUS"}, "currencyCode": "LsgGM7xA", "userIds": ["pX0KXgg9", "9hszm1U0", "ggiPx7zU"]}, {"creditRequest": {"amount": 20, "expireAt": "1977-10-21T00:00:00Z", "metadata": {"UxnUha6p": {}, "7ulGaPHm": {}, "4Tte24Qv": {}}, "origin": "System", "reason": "2CdjIspO", "source": "REDEEM_CODE"}, "currencyCode": "wz5NASVF", "userIds": ["N4bGheoE", "hvIMWDBz", "0ToS3toi"]}]' \
    > test.out 2>&1
eval_tap $? 315 'BulkCredit' test.out

#- 316 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "2nH8ga14", "request": {"allowOverdraft": false, "amount": 57, "balanceOrigin": "Playstation", "balanceSource": "DLC_REVOCATION", "metadata": {"IL2LCtxB": {}, "0ARpkJvd": {}, "cnKgtzqc": {}}, "reason": "rljEorIU"}, "userIds": ["4HwktuUb", "HWaKai7y", "pBKKyxCk"]}, {"currencyCode": "X6uo3IC1", "request": {"allowOverdraft": true, "amount": 32, "balanceOrigin": "Nintendo", "balanceSource": "OTHER", "metadata": {"znsUOn04": {}, "wvalaiqC": {}, "EyS46C1M": {}}, "reason": "IfSfrCxL"}, "userIds": ["t15d1xyQ", "beaT2Y2w", "DmWcSznK"]}, {"currencyCode": "3G9M34gz", "request": {"allowOverdraft": true, "amount": 46, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"4ZSov4hd": {}, "Z52BhfOH": {}, "35qEknl7": {}}, "reason": "oxMt1SDI"}, "userIds": ["xRl4GRcj", "DDZjPcwD", "HN5Bbg1U"]}]' \
    > test.out 2>&1
eval_tap $? 316 'BulkDebit' test.out

#- 317 GetWallet
eval_tap 0 317 'GetWallet # SKIP deprecated' test.out

#- 318 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'xVsyCP2q' \
    --end 'IEkJyXm0' \
    --start 'cxDQPISC' \
    > test.out 2>&1
eval_tap $? 318 'SyncOrders' test.out

#- 319 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["QzrZSpc2", "4CAoSKYd", "nGyL4a2s"], "apiKey": "QT6BQCI6", "authoriseAsCapture": true, "blockedPaymentMethods": ["3Tf16CHe", "ut3qS4BR", "3ffkQKOP"], "clientKey": "UL8jAvW7", "dropInSettings": "DRdiGVFI", "liveEndpointUrlPrefix": "TmPNVhh0", "merchantAccount": "wW8YyDKk", "notificationHmacKey": "GITNd6td", "notificationPassword": "Gi2CIsk3", "notificationUsername": "40aDIzPk", "returnUrl": "iqd373uY", "settings": "dccgyCS3"}' \
    > test.out 2>&1
eval_tap $? 319 'TestAdyenConfig' test.out

#- 320 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "HJoeckv6", "privateKey": "EuVor8HT", "publicKey": "g9QTo2FV", "returnUrl": "R9qSI07h"}' \
    > test.out 2>&1
eval_tap $? 320 'TestAliPayConfig' test.out

#- 321 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "zDLQi0x8", "secretKey": "pCGUpZiL"}' \
    > test.out 2>&1
eval_tap $? 321 'TestCheckoutConfig' test.out

#- 322 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'xCbd9hKD' \
    > test.out 2>&1
eval_tap $? 322 'DebugMatchedPaymentMerchantConfig' test.out

#- 323 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "XGNcLs0I", "clientSecret": "JuYkpU0D", "returnUrl": "dxJZ1JkV", "webHookId": "HoDZ3XAm"}' \
    > test.out 2>&1
eval_tap $? 323 'TestPayPalConfig' test.out

#- 324 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["oI2pU0RO", "k9aesqTJ", "qDzE8QUv"], "publishableKey": "QTL5xC4v", "secretKey": "nCi2WLtD", "webhookSecret": "vpxvzFRB"}' \
    > test.out 2>&1
eval_tap $? 324 'TestStripeConfig' test.out

#- 325 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "cMldd1jA", "key": "doDDKzlw", "mchid": "ABteyeeR", "returnUrl": "P3FrEEmc"}' \
    > test.out 2>&1
eval_tap $? 325 'TestWxPayConfig' test.out

#- 326 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "4zDBubhn", "flowCompletionUrl": "wXbEhBUu", "merchantId": 10, "projectId": 34, "projectSecretKey": "CgkNXpJq"}' \
    > test.out 2>&1
eval_tap $? 326 'TestXsollaConfig' test.out

#- 327 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '8VTnulJ1' \
    > test.out 2>&1
eval_tap $? 327 'GetPaymentMerchantConfig' test.out

#- 328 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'wPRAJLuk' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["TaFLibpm", "0yJEc3aP", "VX7yUWyk"], "apiKey": "RuVTm6rf", "authoriseAsCapture": true, "blockedPaymentMethods": ["GWqqA1hY", "EGiOw6gs", "ZhDYPNgR"], "clientKey": "i4rWJ4Mz", "dropInSettings": "r4SXvaAc", "liveEndpointUrlPrefix": "uONbXT0h", "merchantAccount": "Fh3yTUWL", "notificationHmacKey": "vOWnzRGf", "notificationPassword": "rXqn9bBK", "notificationUsername": "NMxt8JyN", "returnUrl": "eZVzBkJC", "settings": "NoWBw7ns"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateAdyenConfig' test.out

#- 329 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '5r0ilojt' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestAdyenConfigById' test.out

#- 330 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'mS2iZWlU' \
    --sandbox  \
    --validate  \
    --body '{"appId": "iDQ0bTlG", "privateKey": "rf5GJhaz", "publicKey": "UCmabY6m", "returnUrl": "99ahQhT3"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateAliPayConfig' test.out

#- 331 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'V2BeQx34' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 331 'TestAliPayConfigById' test.out

#- 332 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'yqZCILMf' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "likW13lI", "secretKey": "G9tkzbmD"}' \
    > test.out 2>&1
eval_tap $? 332 'UpdateCheckoutConfig' test.out

#- 333 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'HCOiDgRL' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 333 'TestCheckoutConfigById' test.out

#- 334 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'V9OKaHXS' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "A8NQSDgM", "clientSecret": "O01fqJ85", "returnUrl": "tiisTmnS", "webHookId": "F5f6P6t8"}' \
    > test.out 2>&1
eval_tap $? 334 'UpdatePayPalConfig' test.out

#- 335 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'dG2VYcEG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 335 'TestPayPalConfigById' test.out

#- 336 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'zq1xywLt' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["DVP2R9Dm", "i8JO75Yr", "qaHdtOxY"], "publishableKey": "wjcN2tVP", "secretKey": "5R9XwILN", "webhookSecret": "pEqvEqXX"}' \
    > test.out 2>&1
eval_tap $? 336 'UpdateStripeConfig' test.out

#- 337 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'YrrlqK1J' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 337 'TestStripeConfigById' test.out

#- 338 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'wrPrckbF' \
    --validate  \
    --body '{"appId": "YeNIpNrh", "key": "y18tOP1N", "mchid": "GHixjDqi", "returnUrl": "67CX81gi"}' \
    > test.out 2>&1
eval_tap $? 338 'UpdateWxPayConfig' test.out

#- 339 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'JyGPVqF4' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 339 'UpdateWxPayConfigCert' test.out

#- 340 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'PhgsuoB8' \
    > test.out 2>&1
eval_tap $? 340 'TestWxPayConfigById' test.out

#- 341 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'zBa5brZT' \
    --validate  \
    --body '{"apiKey": "RjQMhl6I", "flowCompletionUrl": "IGxTPXGG", "merchantId": 34, "projectId": 56, "projectSecretKey": "9SmUeTEw"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdateXsollaConfig' test.out

#- 342 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'dILdskWA' \
    > test.out 2>&1
eval_tap $? 342 'TestXsollaConfigById' test.out

#- 343 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'rKkX4J8i' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateXsollaUIConfig' test.out

#- 344 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '89' \
    --namespace "$AB_NAMESPACE" \
    --offset '29' \
    --region '7s9eS2VV' \
    > test.out 2>&1
eval_tap $? 344 'QueryPaymentProviderConfig' test.out

#- 345 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "ThoKFiJf", "region": "N5H8UAcG", "sandboxTaxJarApiToken": "wI9jkbtw", "specials": ["PAYPAL", "STRIPE", "XSOLLA"], "taxJarApiToken": "YhqXMB0Q", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 345 'CreatePaymentProviderConfig' test.out

#- 346 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 346 'GetAggregatePaymentProviders' test.out

#- 347 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'cKgDYJPY' \
    > test.out 2>&1
eval_tap $? 347 'DebugMatchedPaymentProviderConfig' test.out

#- 348 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 348 'GetSpecialPaymentProviders' test.out

#- 349 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'BiUNCiqp' \
    --body '{"aggregate": "ADYEN", "namespace": "HP6Nj2ok", "region": "MzxHRC3Q", "sandboxTaxJarApiToken": "FgCBe745", "specials": ["PAYPAL", "ALIPAY", "ADYEN"], "taxJarApiToken": "TJaPXU6y", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 349 'UpdatePaymentProviderConfig' test.out

#- 350 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'ihlNctTt' \
    > test.out 2>&1
eval_tap $? 350 'DeletePaymentProviderConfig' test.out

#- 351 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 351 'GetPaymentTaxConfig' test.out

#- 352 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "ssTNhVEt", "taxJarApiToken": "AMJoA5LG", "taxJarEnabled": false, "taxJarProductCodesMapping": {"ydPhap8L": "BlFMGeVT", "RuEw7VK3": "5NbBnbgQ", "5Re05QXi": "0Zy2rBWG"}}' \
    > test.out 2>&1
eval_tap $? 352 'UpdatePaymentTaxConfig' test.out

#- 353 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'f6JDVCjW' \
    --end 'c00Vbsjy' \
    --start 'weisyNTY' \
    > test.out 2>&1
eval_tap $? 353 'SyncPaymentOrders' test.out

#- 354 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'rOHZ6Ee8' \
    --storeId '3mcKC0ab' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetRootCategories' test.out

#- 355 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Mn5Nfvrb' \
    --storeId 'Ny483ZcS' \
    > test.out 2>&1
eval_tap $? 355 'DownloadCategories' test.out

#- 356 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'Pu3WCzJt' \
    --namespace "$AB_NAMESPACE" \
    --language 'kCZMKZWF' \
    --storeId 'DRBM1gFP' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetCategory' test.out

#- 357 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'C7ghUecp' \
    --namespace "$AB_NAMESPACE" \
    --language 'yP9dI5eg' \
    --storeId 'jNaAPZ4s' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetChildCategories' test.out

#- 358 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'AehrpU3Y' \
    --namespace "$AB_NAMESPACE" \
    --language 'D3xF2HVL' \
    --storeId 'nmyXxEfV' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetDescendantCategories' test.out

#- 359 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 359 'PublicListCurrencies' test.out

#- 360 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 360 'GeDLCDurableRewardShortMap' test.out

#- 361 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    > test.out 2>&1
eval_tap $? 361 'GetIAPItemMapping' test.out

#- 362 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '8hmQW2Gv' \
    --region '24XDTRVX' \
    --storeId 'KaeaQIjV' \
    --appId 'VZ7E2jzQ' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemByAppId' test.out

#- 363 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'kFNeAdAY' \
    --categoryPath 'MKsNMlWN' \
    --features 'Y6J6xHZO' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language '3kg6pSmF' \
    --limit '73' \
    --offset '7' \
    --region 'MKOM87Ra' \
    --sortBy 'name:desc,updatedAt:asc,createdAt:desc' \
    --storeId 'AcX2Cov9' \
    --tags '0MUN3Cbn' \
    > test.out 2>&1
eval_tap $? 363 'PublicQueryItems' test.out

#- 364 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '34c3h8iy' \
    --region 'YXOhMl6A' \
    --storeId 'QiCh4AkI' \
    --sku '6tbAivGn' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetItemBySku' test.out

#- 365 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'Z9mDMrd0' \
    --storeId 'OniCovGr' \
    --itemIds 'evIfNJgt' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetEstimatedPrice' test.out

#- 366 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'oftwk2i2' \
    --region 'dCa91HZp' \
    --storeId 'ziMEWo5w' \
    --itemIds '3zDZDaFr' \
    > test.out 2>&1
eval_tap $? 366 'PublicBulkGetItems' test.out

#- 367 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["6gUSnPkx", "Z5j2n86Z", "1pSiFJJU"]}' \
    > test.out 2>&1
eval_tap $? 367 'PublicValidateItemPurchaseCondition' test.out

#- 368 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'APP' \
    --limit '60' \
    --offset '5' \
    --region 'kFOv1QCd' \
    --storeId 'NgX07yOx' \
    --keyword 'qAhd2Iah' \
    --language 'hG27Gux8' \
    > test.out 2>&1
eval_tap $? 368 'PublicSearchItems' test.out

#- 369 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'xHt8oIoI' \
    --namespace "$AB_NAMESPACE" \
    --language '3qhI3Kln' \
    --region 'J6kbZLsR' \
    --storeId 'fuCaF5kJ' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetApp' test.out

#- 370 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '72ViNewW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 370 'PublicGetItemDynamicData' test.out

#- 371 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'KT7Q6UWa' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '5f1TsYsV' \
    --populateBundle  \
    --region 'RpUroZKx' \
    --storeId 'uO7HRobj' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItem' test.out

#- 372 GetPaymentCustomization
eval_tap 0 372 'GetPaymentCustomization # SKIP deprecated' test.out

#- 373 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "rMTN0iea", "paymentProvider": "WXPAY", "returnUrl": "sBWU6TEV", "ui": "mAi29y4U", "zipCode": "8KDyni3L"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentUrl' test.out

#- 374 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ASi0G17R' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetPaymentMethods' test.out

#- 375 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'VVf21WQC' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUnpaidPaymentOrder' test.out

#- 376 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OQRQ2YlX' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'tYshzgq2' \
    --body '{"token": "4oZKvTcV"}' \
    > test.out 2>&1
eval_tap $? 376 'Pay' test.out

#- 377 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0ihF48pU' \
    > test.out 2>&1
eval_tap $? 377 'PublicCheckPaymentOrderPaidStatus' test.out

#- 378 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region '6WRlphEC' \
    > test.out 2>&1
eval_tap $? 378 'GetPaymentPublicConfig' test.out

#- 379 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '86nQuOCC' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetQRCode' test.out

#- 380 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'mg06XfWp' \
    --foreinginvoice 'hRVOrcGB' \
    --invoiceId 'WAocdrxD' \
    --payload 'ajZZq3gv' \
    --redirectResult 'HvlTWh69' \
    --resultCode 'YPKo1hUw' \
    --sessionId 'tIPTzzac' \
    --status 'Z1XZvUdM' \
    --token 'wgj9wlM8' \
    --type 'm81miW1R' \
    --userId 'pBxSP7xd' \
    --orderNo '0LFBHSPL' \
    --paymentOrderNo 'YI8djd4x' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl 'L82Wc0Mw' \
    > test.out 2>&1
eval_tap $? 380 'PublicNormalizePaymentReturnUrl' test.out

#- 381 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'X4RRzO7I' \
    --paymentOrderNo 'zifrSU10' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 381 'GetPaymentTaxValue' test.out

#- 382 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'J25CBaxK' \
    > test.out 2>&1
eval_tap $? 382 'GetRewardByCode' test.out

#- 383 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'odUHYnFa' \
    --limit '37' \
    --offset '3' \
    --sortBy 'namespace:asc,namespace,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 383 'QueryRewards1' test.out

#- 384 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'f4KDE7xT' \
    > test.out 2>&1
eval_tap $? 384 'GetReward1' test.out

#- 385 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicListStores' test.out

#- 386 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'pPeAW76w,Wyt2jsuv,IcDNPgwS' \
    --itemIds 'XkzYlqa8,xGqjHoaa,MWyczb67' \
    --skus '1cXmXnkE,xbCwqjog,3cpGuIsU' \
    > test.out 2>&1
eval_tap $? 386 'PublicExistsAnyMyActiveEntitlement' test.out

#- 387 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'b0Ql0Ajf' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 388 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'nksCiLvi' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 389 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'lpnzdTj0' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 390 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '6KB3I5VB,dWd0B9vB,I3owGamO' \
    --itemIds 'n5zjMeWR,GH3xNJYN,sFjX14Z4' \
    --skus 'Uvlhw8l8,xwxwhBoc,F0jv5qRK' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetEntitlementOwnershipToken' test.out

#- 391 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Vt7vSTQG", "language": "Iqq", "region": "t50O0U8m"}' \
    > test.out 2>&1
eval_tap $? 391 'SyncTwitchDropsEntitlement' test.out

#- 392 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'oQduw9mZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetMyWallet' test.out

#- 393 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFAURPjI' \
    --body '{"epicGamesJwtToken": "VQHo341p"}' \
    > test.out 2>&1
eval_tap $? 393 'SyncEpicGameDLC' test.out

#- 394 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGCRz8fp' \
    > test.out 2>&1
eval_tap $? 394 'SyncOculusDLC' test.out

#- 395 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '9uc1B687' \
    --body '{"serviceLabel": 41}' \
    > test.out 2>&1
eval_tap $? 395 'PublicSyncPsnDlcInventory' test.out

#- 396 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBXwIRZh' \
    --body '{"serviceLabels": [42, 29]}' \
    > test.out 2>&1
eval_tap $? 396 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 397 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiGeCYyK' \
    --body '{"appId": "FSsntUxg", "steamId": "6GabC4CB"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncSteamDLC' test.out

#- 398 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'OmM60YH8' \
    --body '{"xstsToken": "jYLN1wFy"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncXboxDLC' test.out

#- 399 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '8rwxsff5' \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'wVVCpbEV' \
    --features 'C4mfQHZD,84TWF8BH,MDhFqmmQ' \
    --itemId 'Bg59SB6S,1pr1P4sL,GvJ5MTc5' \
    --limit '52' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryUserEntitlements' test.out

#- 400 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'K4G8zu7y' \
    --appId 'Suiz72wq' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserAppEntitlementByAppId' test.out

#- 401 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOrRzUeA' \
    --limit '25' \
    --offset '78' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryUserEntitlementsByAppType' test.out

#- 402 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '0pif2TuG' \
    --availablePlatformOnly  \
    --ids 'lCKUcyLw,GINRSEbR,woVc5bjN' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUserEntitlementsByIds' test.out

#- 403 PublicGetUserEntitlementByItemId
eval_tap 0 403 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 404 PublicGetUserEntitlementBySku
eval_tap 0 404 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 405 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwxNQLiY' \
    --endDate 'wvwR8KHu' \
    --entitlementClazz 'CODE' \
    --limit '37' \
    --offset '30' \
    --startDate 'Goy5fBsN' \
    > test.out 2>&1
eval_tap $? 405 'PublicUserEntitlementHistory' test.out

#- 406 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'IIPtTkbY' \
    --appIds 'WEr8krGX,CMWWlp1v,lTjozHes' \
    --itemIds 'JMbK4Rak,tsjqA28x,GUdPTgWD' \
    --skus 'j6U0e2S6,zTQYOMtU,KGRfVPgT' \
    > test.out 2>&1
eval_tap $? 406 'PublicExistsAnyUserActiveEntitlement' test.out

#- 407 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCILbL82' \
    --appId '0B2lVFid' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 408 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BrMaQZmT' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'o2um0v9P' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 409 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8diEMh2' \
    --ids 'QEMR3zvr,4tM3fJYY,xt43uySu' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 410 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2y5CKm0' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'NkKQpxns' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 411 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'ZHdo4Apn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8yo1ZyI' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUserEntitlement' test.out

#- 412 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Q5YrTbMj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwJZ7LS2' \
    --body '{"options": ["gONAVG4U", "CWlmlCaD", "1FiXgp2l"], "requestId": "vEufYLXG", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 412 'PublicConsumeUserEntitlement' test.out

#- 413 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'ui4GM7br' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQVGGt62' \
    --body '{"requestId": "FP9yeBEW", "useCount": 65}' \
    > test.out 2>&1
eval_tap $? 413 'PublicSellUserEntitlement' test.out

#- 414 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId '9Bsczw6J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nnt2tJX1' \
    --body '{"useCount": 18}' \
    > test.out 2>&1
eval_tap $? 414 'PublicSplitUserEntitlement' test.out

#- 415 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'Ykk5VTUs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XPfFbfFw' \
    --body '{"entitlementId": "gR5MI6aS", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 415 'PublicTransferUserEntitlement' test.out

#- 416 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Evh0SpCz' \
    --body '{"code": "tdvrqLoI", "language": "UJRn_CAfY", "region": "SYq65YQO"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicRedeemCode' test.out

#- 417 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'zrovfBe1' \
    --body '{"excludeOldTransactions": false, "language": "cr", "productId": "FlRaopJb", "receiptData": "aYosv36K", "region": "setdrIz5", "transactionId": "3Tpxf39x"}' \
    > test.out 2>&1
eval_tap $? 417 'PublicFulfillAppleIAPItem' test.out

#- 418 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzNW9xcP' \
    --body '{"epicGamesJwtToken": "SoEaYXJN"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncEpicGamesInventory' test.out

#- 419 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'z2C7rcDX' \
    --body '{"autoAck": true, "language": "yeK-LRrA_rd", "orderId": "aqtxPudL", "packageName": "n2luW37A", "productId": "uKlYLLde", "purchaseTime": 29, "purchaseToken": "07bTIeMF", "region": "Qn39Z5HG"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicFulfillGoogleIAPItem' test.out

#- 420 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTuJix1t' \
    > test.out 2>&1
eval_tap $? 420 'SyncOculusConsumableEntitlements' test.out

#- 421 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '2d21umq2' \
    --body '{"currencyCode": "djrQLhLq", "price": 0.5357716680420073, "productId": "saRNRTwS", "serviceLabel": 6}' \
    > test.out 2>&1
eval_tap $? 421 'PublicReconcilePlayStationStore' test.out

#- 422 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'medCqLot' \
    --body '{"currencyCode": "ElOF0GnC", "price": 0.7400751041129149, "productId": "RAEIJ5ze", "serviceLabels": [97, 60, 13]}' \
    > test.out 2>&1
eval_tap $? 422 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 423 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '8xcRuBtB' \
    --body '{"appId": "1f2t3GyB", "currencyCode": "jNGl8GhU", "language": "ZSj_575", "price": 0.49136584708273223, "productId": "Srm5B64u", "region": "ab2AB8Dl", "steamId": "UOosokOO"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncSteamInventory' test.out

#- 424 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hc3Ik1CC' \
    --body '{"gameId": "UEO0Ydxy", "language": "Llas_WfVO", "region": "ddmDzJcH"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncTwitchDropsEntitlement1' test.out

#- 425 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'q91XEJyx' \
    --body '{"currencyCode": "Haj4oB3p", "price": 0.17012283227928615, "productId": "jZhpEM8O", "xstsToken": "02iAU2CJ"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncXboxInventory' test.out

#- 426 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'v4pzOaSX' \
    --discounted  \
    --itemId 'MKPjyWH7' \
    --limit '72' \
    --offset '31' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserOrders' test.out

#- 427 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1NkRvRG' \
    --body '{"currencyCode": "ovAqmbFm", "discountCodes": ["6YOod4i2", "WijZyIQr", "EGEYHZy8"], "discountedPrice": 3, "ext": {"ol2tDU1l": {}, "e2AVwtuv": {}, "9M5oNUHt": {}}, "itemId": "7Ik7iSpm", "language": "dn", "price": 85, "quantity": 91, "region": "laXVbBmq", "returnUrl": "xJ2K2teM", "sectionId": "kJwWC46q"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicCreateUserOrder' test.out

#- 428 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'F5mpSZpV' \
    --body '{"currencyCode": "Zvsifz0Q", "discountCodes": ["itCFC2r4", "vUG5PPja", "131xP368"], "discountedPrice": 1, "itemId": "klGi3YVA", "price": 77, "quantity": 73}' \
    > test.out 2>&1
eval_tap $? 428 'PublicPreviewOrderPrice' test.out

#- 429 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tCyPdXiu' \
    --userId 'kWhyAdjT' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserOrder' test.out

#- 430 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QZHXALzG' \
    --userId 'HcB3jXks' \
    > test.out 2>&1
eval_tap $? 430 'PublicCancelUserOrder' test.out

#- 431 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AC1BZn24' \
    --userId '6fGC6M7p' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetUserOrderHistories' test.out

#- 432 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jQhyIaQG' \
    --userId 'CGGEolRu' \
    > test.out 2>&1
eval_tap $? 432 'PublicDownloadUserOrderReceipt' test.out

#- 433 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'auG5Pf7f' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetPaymentAccounts' test.out

#- 434 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'zAgdva88' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'sCt2EsKt' \
    > test.out 2>&1
eval_tap $? 434 'PublicDeletePaymentAccount' test.out

#- 435 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'sEtdl79Z' \
    --autoCalcEstimatedPrice  \
    --language '6IjTdxbN' \
    --region 'XZc5QTdH' \
    --storeId 'GAmNL8ei' \
    --viewId 'TrCkW88c' \
    > test.out 2>&1
eval_tap $? 435 'PublicListActiveSections' test.out

#- 436 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bjp8r8bb' \
    --chargeStatus 'SETUP' \
    --itemId '59GirIS7' \
    --limit '33' \
    --offset '28' \
    --sku '7gtrVQ2T' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 436 'PublicQueryUserSubscriptions' test.out

#- 437 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'VunjadbE' \
    --body '{"currencyCode": "ZM5Em0XY", "itemId": "BIhTGKG9", "language": "FACo", "region": "V0z8tYmT", "returnUrl": "PVAAlw1Z", "source": "392MiUaA"}' \
    > test.out 2>&1
eval_tap $? 437 'PublicSubscribeSubscription' test.out

#- 438 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHWCJR9s' \
    --itemId 'ywQiXqkZ' \
    > test.out 2>&1
eval_tap $? 438 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 439 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cn3320EP' \
    --userId 'xfHmMNkc' \
    > test.out 2>&1
eval_tap $? 439 'PublicGetUserSubscription' test.out

#- 440 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'exRQIzbN' \
    --userId 'dH8kPWjr' \
    > test.out 2>&1
eval_tap $? 440 'PublicChangeSubscriptionBillingAccount' test.out

#- 441 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7wMhBnh7' \
    --userId 'z80LFjT8' \
    --body '{"immediate": true, "reason": "oZ07OARq"}' \
    > test.out 2>&1
eval_tap $? 441 'PublicCancelSubscription' test.out

#- 442 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XquqwArM' \
    --userId 'jPFqqXoq' \
    --excludeFree  \
    --limit '9' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 442 'PublicGetUserSubscriptionBillingHistories' test.out

#- 443 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFqeCroB' \
    --language 'mtCoK6NI' \
    --storeId 'EOUCa8O0' \
    > test.out 2>&1
eval_tap $? 443 'PublicListViews' test.out

#- 444 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '9BrdZGan' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AiGlieDx' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetWallet' test.out

#- 445 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'Nb4WaS4E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LodGuMuN' \
    --limit '60' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 445 'PublicListUserWalletTransactions' test.out

#- 446 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'T2ItjCEg' \
    --baseAppId '32CeKm2H' \
    --categoryPath 'w5cf3ssv' \
    --features '3yQMSK9l' \
    --includeSubCategoryItem  \
    --itemName 'VmXGIy7f' \
    --itemStatus 'ACTIVE' \
    --itemType 'APP' \
    --limit '33' \
    --offset '56' \
    --region '8Knypqx8' \
    --sectionExclusive  \
    --sortBy 'displayOrder,updatedAt:asc,displayOrder:desc' \
    --storeId 'mVUwyV4f' \
    --tags 'Lvob6V9D' \
    --targetNamespace 'JSf6478Y' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 446 'QueryItems1' test.out

#- 447 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'epwgNiSo' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 447 'ImportStore1' test.out

#- 448 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '7fguUTtD' \
    --body '{"itemIds": ["uuYKDzJ1", "2eL1ZbBy", "syrdX0Lu"]}' \
    > test.out 2>&1
eval_tap $? 448 'ExportStore1' test.out

#- 449 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w7PAQySk' \
    --body '{"entitlementCollectionId": "LPlVPIrt", "entitlementOrigin": "Twitch", "metadata": {"CmIkcvPH": {}, "EQxFDKi0": {}, "ZfGcZlGu": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "q69hAaSA", "namespace": "wT10YLx9"}, "item": {"itemId": "F90RVav6", "itemSku": "9R4k3e1k", "itemType": "HqDZ6P6m"}, "quantity": 93, "type": "ITEM"}, {"currency": {"currencyCode": "PgJ2vgjZ", "namespace": "EMkI6lAP"}, "item": {"itemId": "Sfmkf9xz", "itemSku": "bnqD9oOW", "itemType": "gVIkeUaO"}, "quantity": 63, "type": "ITEM"}, {"currency": {"currencyCode": "9eRlxdiS", "namespace": "VS0vDATl"}, "item": {"itemId": "JpceNNle", "itemSku": "oD5iPUQK", "itemType": "Mh6lzsI9"}, "quantity": 63, "type": "CURRENCY"}], "source": "IAP_CHARGEBACK_REVERSED", "transactionId": "TiJunzV4"}' \
    > test.out 2>&1
eval_tap $? 449 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
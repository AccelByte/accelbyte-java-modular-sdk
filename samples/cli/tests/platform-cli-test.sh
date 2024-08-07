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
echo "1..460"

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
    --id 'ELUQIprp' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'AMOkQXwK' \
    --body '{"grantDays": "6O35R2x9"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'mpclY6Ds' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'I2JBPT02' \
    --body '{"grantDays": "5qZukBMq"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "jWp8Yu0S", "dryRun": false, "fulfillmentUrl": "2rzL9R9Z", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "frXMMfqG"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'uLGyBOjo' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'Waiypnc3' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '6nFg0dmA' \
    --body '{"clazz": "w4MLEAos", "dryRun": false, "fulfillmentUrl": "bqKfY1JM", "purchaseConditionUrl": "V5fVGvKf"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'cfoGmiQt' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name 'otn5wHvS' \
    --offset '90' \
    --tag 'yIWsafbV' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "BY2BdRis", "discountConfig": {"categories": [{"categoryPath": "ODENbISJ", "includeSubCategories": false}, {"categoryPath": "YiJPhLN9", "includeSubCategories": false}, {"categoryPath": "Dnn4xPnv", "includeSubCategories": false}], "currencyCode": "d2raGauH", "currencyNamespace": "AYRFRTJH", "discountAmount": 90, "discountPercentage": 69, "discountType": "PERCENTAGE", "items": [{"itemId": "2TyKP5uV", "itemName": "UvZAuEkq"}, {"itemId": "J9W9z0rv", "itemName": "ighGaEyE"}, {"itemId": "bqV3X0QQ", "itemName": "qvMXAdMZ"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 49, "itemId": "BzslNcv3", "itemName": "lJJdbonJ", "quantity": 77}, {"extraSubscriptionDays": 10, "itemId": "4xffMS0J", "itemName": "IB7UDYNI", "quantity": 63}, {"extraSubscriptionDays": 94, "itemId": "q9U8JWtC", "itemName": "iBmsMx2n", "quantity": 31}], "maxRedeemCountPerCampaignPerUser": 90, "maxRedeemCountPerCode": 5, "maxRedeemCountPerCodePerUser": 61, "maxSaleCount": 75, "name": "QZuHzUqX", "redeemEnd": "1999-05-08T00:00:00Z", "redeemStart": "1983-04-23T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["f6Tmihkt", "SEFm8KIT", "8aBPvEzt"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'VQc6iqZr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'CwnmoWYk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "4tcY5lVD", "discountConfig": {"categories": [{"categoryPath": "H4gNo4ML", "includeSubCategories": true}, {"categoryPath": "gKKYJEJw", "includeSubCategories": true}, {"categoryPath": "xRnUrPo4", "includeSubCategories": false}], "currencyCode": "10HCmMqj", "currencyNamespace": "zV6Zzrfa", "discountAmount": 91, "discountPercentage": 59, "discountType": "PERCENTAGE", "items": [{"itemId": "hfhyzwD7", "itemName": "OilIYywH"}, {"itemId": "rJwle3V6", "itemName": "bIkSS2hc"}, {"itemId": "fpQyzZDb", "itemName": "95d3NdbD"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 51, "itemId": "QnbB58G2", "itemName": "RU6BLoac", "quantity": 80}, {"extraSubscriptionDays": 0, "itemId": "v1ZyOgOh", "itemName": "8Q3TfUkY", "quantity": 8}, {"extraSubscriptionDays": 41, "itemId": "NCzrVMmc", "itemName": "hIRGxXc2", "quantity": 39}], "maxRedeemCountPerCampaignPerUser": 17, "maxRedeemCountPerCode": 87, "maxRedeemCountPerCodePerUser": 22, "maxSaleCount": 39, "name": "XqkgG2Yy", "redeemEnd": "1974-11-16T00:00:00Z", "redeemStart": "1976-08-08T00:00:00Z", "redeemType": "DISCOUNT", "status": "ACTIVE", "tags": ["9RPi2ROf", "3PkktZjQ", "bgTF0hPa"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'Q39ZtmC4' \
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
    --body '{"appConfig": {"appName": "cOif3k4D"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "u4ide1vU"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "cfDiV6Nb"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "0DB7Ugur"}, "extendType": "APP"}' \
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
    --storeId 'x0UXjnPX' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J9jB5oWR' \
    --body '{"categoryPath": "Vlt8Dos1", "localizationDisplayNames": {"SmezVy6Q": "daK8x6Dk", "mgcc0IBz": "3u2kYhm4", "jem2BRFy": "fxyBKbNi"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '16WjEdu3' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'LNeEIlL0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EWuq4bIg' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '4Hk0GSsK' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6vs7l29k' \
    --body '{"localizationDisplayNames": {"uo2KaZ6Q": "UAsX5xwj", "jimQgCAF": "7Pj9l5CM", "tqERGpUp": "TznEpiY3"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'abNqyFBR' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6CkjhVpI' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'cvyR6bLS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lyHowSeU' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'vVsh6cYm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SJ3RvcOD' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'XB1IYCBU' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '59' \
    --code '1QR3Vqc1' \
    --limit '42' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'ablhMYnL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "CAhM3grQ", "quantity": 82}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '8ZUzy4wB' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '16' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'ube2F7X0' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '22' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'TZmOWkvs' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '43' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'OaKrua9x' \
    --namespace "$AB_NAMESPACE" \
    --code '7l69CGCb' \
    --limit '28' \
    --offset '89' \
    --userId 'zcvkidug' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'qT8UVFnB' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'M7KvjINt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'v3PrE8YQ' \
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
    --body '{"currencyCode": "ZRfUrE0J", "currencySymbol": "Rn5vfiF4", "currencyType": "VIRTUAL", "decimals": 99, "localizationDescriptions": {"KtZAkE89": "BOL5tZn6", "M5YNWN5I": "icdsFUdB", "TwT5pcGi": "bej8eSn1"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '7kRGXXVL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"l1OZDno5": "tYIfti3s", "BSDKjJlq": "liVUcH9o", "1MIEFt0e": "UC5np5J9"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'bg2OFDT7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'PeNCWkl0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'ca4SmPNH' \
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
    --body '{"data": [{"id": "Jr5PQo7c", "rewards": [{"currency": {"currencyCode": "F0xOP8dl", "namespace": "BBIfX9Dk"}, "item": {"itemId": "SJacuhqH", "itemName": "YlFVVxw5", "itemSku": "KQrY7ujN", "itemType": "NJfumzXP"}, "quantity": 36, "type": "ITEM"}, {"currency": {"currencyCode": "jT6W3wx1", "namespace": "S1pUmqsi"}, "item": {"itemId": "XkNfOOxy", "itemName": "bQfrSBjw", "itemSku": "vg16GDxZ", "itemType": "rBSfMDzn"}, "quantity": 100, "type": "CURRENCY"}, {"currency": {"currencyCode": "GxkrvhhG", "namespace": "mN2o9uzW"}, "item": {"itemId": "9V63oghL", "itemName": "fCD4gEmP", "itemSku": "j1zLmMij", "itemType": "YuholFZb"}, "quantity": 11, "type": "CURRENCY"}]}, {"id": "pDpxCF31", "rewards": [{"currency": {"currencyCode": "AfOpzp1F", "namespace": "rkfx6tAS"}, "item": {"itemId": "wKK6CqQB", "itemName": "MBtdq0aC", "itemSku": "cP1COTYu", "itemType": "5j9W56Na"}, "quantity": 42, "type": "ITEM"}, {"currency": {"currencyCode": "MUIMIjzh", "namespace": "1wD2XPSa"}, "item": {"itemId": "nkNXgq7S", "itemName": "pNVQ1hyy", "itemSku": "TuvXmtH5", "itemType": "LLMQVAFT"}, "quantity": 64, "type": "CURRENCY"}, {"currency": {"currencyCode": "rWurODj2", "namespace": "PWzqzILx"}, "item": {"itemId": "IppX2Qa5", "itemName": "mQe7yniR", "itemSku": "kguORP4h", "itemType": "JZLvxF7k"}, "quantity": 65, "type": "CURRENCY"}]}, {"id": "st7Wobh5", "rewards": [{"currency": {"currencyCode": "0Fg0337Y", "namespace": "csLBDsSZ"}, "item": {"itemId": "RBGUfqmf", "itemName": "15XWmZdA", "itemSku": "J0po1kAo", "itemType": "TZEbTo30"}, "quantity": 97, "type": "CURRENCY"}, {"currency": {"currencyCode": "P8DkgPDt", "namespace": "SDZOXSQW"}, "item": {"itemId": "fvuLK8JR", "itemName": "zp8hEeV1", "itemSku": "954HTIPa", "itemType": "3vO6XmP0"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "JkhVDMxZ", "namespace": "HJkJaeC0"}, "item": {"itemId": "nU89Aayq", "itemName": "PiG5ZccC", "itemSku": "3tRjK9LL", "itemType": "PO8drwE8"}, "quantity": 3, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"CahahyP6": "oek158mz", "atbD8XLX": "HUGeXIPe", "9w34tLDt": "quTE3WDj"}}, {"platform": "OCULUS", "platformDlcIdMap": {"cKwUCClW": "UtmBt5HR", "V1gKoWQQ": "PE7j0DeU", "aJncCT9P": "Vb2g826B"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"ME99FcZ2": "vc4s5KML", "qmNbFv5g": "TMR4QoRH", "CpAAHsvO": "Glb527ar"}}]}' \
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
    --entitlementName 'ybQYod9Q' \
    --itemId 'WLDnP9jg,3lGQtd6W,JOop6Wnf' \
    --limit '97' \
    --offset '100' \
    --origin 'Other' \
    --userId 'EKpSAAVj' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'PffdMp62,wMD2wmVW,ZFLIGc6Z' \
    --limit '100' \
    --offset '89' \
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
    --body '{"entitlementGrantList": [{"collectionId": "my7USpeV", "endDate": "1998-05-29T00:00:00Z", "grantedCode": "O1mXNK2L", "itemId": "Z4D6TsXS", "itemNamespace": "KyGelHZc", "language": "wxk-ivMk", "origin": "Oculus", "quantity": 23, "region": "mqvpKHt5", "source": "OTHER", "startDate": "1988-06-28T00:00:00Z", "storeId": "LeotD2Dt"}, {"collectionId": "9PlxF6sN", "endDate": "1989-03-10T00:00:00Z", "grantedCode": "6uLUt87W", "itemId": "8mDvUsa8", "itemNamespace": "ohtYW0Mo", "language": "fQQl-zI", "origin": "IOS", "quantity": 38, "region": "Dt1Q1HAI", "source": "PURCHASE", "startDate": "1988-04-12T00:00:00Z", "storeId": "7JKzbzFd"}, {"collectionId": "CHfnb6Gr", "endDate": "1986-02-28T00:00:00Z", "grantedCode": "tsrbvckA", "itemId": "wacB8TuH", "itemNamespace": "6dU42kKl", "language": "Kld", "origin": "IOS", "quantity": 53, "region": "LqS6dQTp", "source": "IAP", "startDate": "1991-07-23T00:00:00Z", "storeId": "6pRff2uS"}], "userIds": ["TJVaIbyz", "jQmF07cD", "Tfijodb2"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["1axMYbXt", "GjkfdUDG", "zoNV3C4j"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'vrkbpvXc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '77' \
    --status 'FAIL' \
    --userId 'M5H4V4Uc' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'V2zgaLiX' \
    --eventType 'OTHER' \
    --externalOrderId 'SakW48Xf' \
    --limit '56' \
    --offset '75' \
    --startTime 'B9Ml7155' \
    --status 'IGNORED' \
    --userId 'uZHIX1Xf' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "wQd005Bi", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 10, "clientTransactionId": "tgt2tEJB"}, {"amountConsumed": 100, "clientTransactionId": "XruOy0I7"}, {"amountConsumed": 55, "clientTransactionId": "7K0cQrks"}], "entitlementId": "3BcDkFeJ", "usageCount": 64}, {"clientTransaction": [{"amountConsumed": 54, "clientTransactionId": "Q41kkc8K"}, {"amountConsumed": 46, "clientTransactionId": "PBzsXofA"}, {"amountConsumed": 46, "clientTransactionId": "I5x2ee0V"}], "entitlementId": "vwhN2jjS", "usageCount": 17}, {"clientTransaction": [{"amountConsumed": 0, "clientTransactionId": "0oX4Rwqs"}, {"amountConsumed": 24, "clientTransactionId": "lKJilfqM"}, {"amountConsumed": 99, "clientTransactionId": "SY29eMic"}], "entitlementId": "lV5SIA8m", "usageCount": 57}], "purpose": "OueWG41n"}, "originalTitleName": "Jv5OqaCb", "paymentProductSKU": "zJ5V7pyC", "purchaseDate": "lU2begcu", "sourceOrderItemId": "Sgzt9y1J", "titleName": "KM8yB1yN"}, "eventDomain": "lH4jKFya", "eventSource": "yxL5QKxP", "eventType": "RUfmjrc4", "eventVersion": 8, "id": "cQ07iqWI", "timestamp": "Vo8duRSU"}' \
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
    --body '{"bundleId": "hraKpLdp", "password": "jhVOdnD9"}' \
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
    --body '{"sandboxId": "Hqk1cg8W"}' \
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
    --body '{"applicationName": "pjv3LOth", "serviceAccountId": "rObCOYMm"}' \
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
    --body '{"data": [{"itemIdentity": "RrU8y7fF", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"0yqeuRX0": "84IWz2kc", "Gy4Nh6wM": "7wi17lF7", "IE1b1oAU": "859YzYGz"}}, {"itemIdentity": "VGWCeqiO", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"3Iq32bRP": "RpMzIlxt", "17NgIV2Q": "jYFCIWa0", "2ktsAooQ": "9gkxri3J"}}, {"itemIdentity": "NaJPSIQu", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"nuBDbZa2": "p8522Gac", "kydn0JUj": "rWv0bIVI", "6rxnvSQi": "ub8N3CTV"}}]}' \
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
    --body '{"appId": "x5tII453", "appSecret": "H2jM9FSO"}' \
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
    --body '{"backOfficeServerClientId": "jmnMIGRt", "backOfficeServerClientSecret": "FRsaFrrQ", "enableStreamJob": true, "environment": "9GPGPJpM", "streamName": "89qpdB0h", "streamPartnerName": "bNSRkyQl"}' \
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
    --body '{"backOfficeServerClientId": "h3vkd3MX", "backOfficeServerClientSecret": "JVs0Y4G7", "enableStreamJob": false, "environment": "mXOt1YGY", "streamName": "Nquxt0H3", "streamPartnerName": "saii1KAS"}' \
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
    --body '{"appId": "kplZ9EtJ", "publisherAuthenticationKey": "MAbG58Xw"}' \
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
    --body '{"clientId": "c983rcw4", "clientSecret": "s54nHEOs", "organizationId": "4Rb08KbX"}' \
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
    --body '{"relyingPartyCert": "RkGOEpJq"}' \
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
    --password 'fbI7JaDi' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'Sp3hjm4y' \
    --itemId 'VXeBHDZV' \
    --itemType 'CODE' \
    --endTime '028e2n80' \
    --startTime 'DT2z3nve' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'deNgRQht' \
    --itemId 'dG9Z9P3A' \
    --itemType 'OPTIONBOX' \
    --endTime '0ivdMzaH' \
    --startTime 'GBPjyn3b' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '3VgphvXX' \
    --body '{"categoryPath": "hyos28Qx", "targetItemId": "1HUXhNxx", "targetNamespace": "PDfgkmeI"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wLMmXZmB' \
    --body '{"appId": "HPGaofoD", "appType": "DEMO", "baseAppId": "cdbuTGQg", "boothName": "lFThnhSa", "categoryPath": "312Ye8e5", "clazz": "ihSvEk7Y", "displayOrder": 35, "entitlementType": "CONSUMABLE", "ext": {"aEHmlSDC": {}, "nvPgTk2u": {}, "jCNELkzq": {}}, "features": ["mwmAcGtu", "MdRKU7kk", "OcjwWOJL"], "flexible": false, "images": [{"as": "TZkHqGAN", "caption": "CMSQMX9j", "height": 18, "imageUrl": "QveVZRpE", "smallImageUrl": "3LxZh4E4", "width": 0}, {"as": "BRFe08iv", "caption": "8ojdt7g7", "height": 36, "imageUrl": "CueS8kse", "smallImageUrl": "gCntg55F", "width": 95}, {"as": "BrHj4A0m", "caption": "WCHvNjTg", "height": 66, "imageUrl": "UEbazIMx", "smallImageUrl": "vs3lyDVN", "width": 5}], "inventoryConfig": {"customAttributes": {"WIEpIE1l": {}, "yCTLxFZt": {}, "Xl8lpiYj": {}}, "serverCustomAttributes": {"GPdkn5Ot": {}, "E7TkaFkJ": {}, "az1PFPqV": {}}, "slotUsed": 40}, "itemIds": ["COH8ICIb", "fNLnunyR", "6sEuGI32"], "itemQty": {"DqFsM0Wt": 67, "C9lzhGW7": 0, "EDdWSFEt": 54}, "itemType": "BUNDLE", "listable": true, "localizations": {"yZ5igxXk": {"description": "cYxCIogy", "localExt": {"2MfgvVJN": {}, "lFZYFmob": {}, "K1zpdYEY": {}}, "longDescription": "1BJuGuH4", "title": "bWZ5aO1j"}, "KuWq0rob": {"description": "WZIOyIPk", "localExt": {"Bos8ozih": {}, "tCA0HTdQ": {}, "1ZC8HU9o": {}}, "longDescription": "Vj0OQH8C", "title": "oAu5tZZd"}, "j2xBNqNn": {"description": "aCcHRjcf", "localExt": {"LypJtCNd": {}, "s6xlPwHe": {}, "fG413okd": {}}, "longDescription": "Pa8fYJcd", "title": "LNJQGscg"}}, "lootBoxConfig": {"rewardCount": 76, "rewards": [{"lootBoxItems": [{"count": 2, "duration": 3, "endDate": "1990-02-04T00:00:00Z", "itemId": "BCcSLpkH", "itemSku": "PDIAfpzL", "itemType": "lskzOQqK"}, {"count": 22, "duration": 77, "endDate": "1994-05-30T00:00:00Z", "itemId": "ZPlaXSwU", "itemSku": "m3QBKPBZ", "itemType": "zZ2U77PE"}, {"count": 46, "duration": 11, "endDate": "1996-02-10T00:00:00Z", "itemId": "JxwOBsQn", "itemSku": "Fu5vDAd3", "itemType": "naPavaBS"}], "name": "7QRRiyow", "odds": 0.19060177260504918, "type": "PROBABILITY_GROUP", "weight": 50}, {"lootBoxItems": [{"count": 100, "duration": 70, "endDate": "1982-02-04T00:00:00Z", "itemId": "Mw6ApZR4", "itemSku": "9cBFJCmz", "itemType": "UsLL0odz"}, {"count": 39, "duration": 47, "endDate": "1984-08-02T00:00:00Z", "itemId": "HKWVxAk8", "itemSku": "PFpGPd5g", "itemType": "pF6QEpaC"}, {"count": 32, "duration": 11, "endDate": "1982-05-19T00:00:00Z", "itemId": "pRkhiJvS", "itemSku": "FqNTW8Yb", "itemType": "QGNwpYKa"}], "name": "dGjODxTe", "odds": 0.6188843621243323, "type": "REWARD_GROUP", "weight": 8}, {"lootBoxItems": [{"count": 65, "duration": 56, "endDate": "1983-09-07T00:00:00Z", "itemId": "t4EuMrds", "itemSku": "ft2fMPYm", "itemType": "n56Og287"}, {"count": 61, "duration": 34, "endDate": "1991-12-13T00:00:00Z", "itemId": "a3yXrhCI", "itemSku": "lnzjJ74w", "itemType": "R594TEnY"}, {"count": 39, "duration": 43, "endDate": "1974-12-16T00:00:00Z", "itemId": "Us4c6KZ4", "itemSku": "Oeepdwum", "itemType": "6F5JBXrk"}], "name": "O9MSU3KJ", "odds": 0.3829024504224431, "type": "PROBABILITY_GROUP", "weight": 15}], "rollFunction": "CUSTOM"}, "maxCount": 12, "maxCountPerUser": 86, "name": "U54TFff7", "optionBoxConfig": {"boxItems": [{"count": 66, "duration": 13, "endDate": "1976-07-24T00:00:00Z", "itemId": "1flQyXmb", "itemSku": "6Zulr9hq", "itemType": "umkySpY6"}, {"count": 17, "duration": 2, "endDate": "1989-08-17T00:00:00Z", "itemId": "RwcEBDob", "itemSku": "d163zmp2", "itemType": "y4kV7NlA"}, {"count": 54, "duration": 8, "endDate": "1971-02-25T00:00:00Z", "itemId": "F4XjGePI", "itemSku": "MZ6zZsWF", "itemType": "BonuOpVj"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 13, "fixedTrialCycles": 36, "graceDays": 11}, "regionData": {"uvwzX8tp": [{"currencyCode": "5JGBnX45", "currencyNamespace": "qISe7wPb", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1997-01-04T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1981-02-16T00:00:00Z", "expireAt": "1974-03-15T00:00:00Z", "price": 13, "purchaseAt": "1991-02-20T00:00:00Z", "trialPrice": 90}, {"currencyCode": "Zd5f3OOI", "currencyNamespace": "7LvuypvV", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1991-01-04T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1981-08-28T00:00:00Z", "expireAt": "1986-06-21T00:00:00Z", "price": 4, "purchaseAt": "1984-05-10T00:00:00Z", "trialPrice": 61}, {"currencyCode": "qm7p072c", "currencyNamespace": "nDBNkpNB", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1999-11-15T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1991-06-15T00:00:00Z", "expireAt": "1996-01-16T00:00:00Z", "price": 0, "purchaseAt": "1978-08-12T00:00:00Z", "trialPrice": 4}], "cqTnvJUz": [{"currencyCode": "bmvxgXQu", "currencyNamespace": "Er2CffNx", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1990-10-11T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1973-08-24T00:00:00Z", "expireAt": "1978-12-06T00:00:00Z", "price": 100, "purchaseAt": "1978-07-08T00:00:00Z", "trialPrice": 56}, {"currencyCode": "bZxiJDD3", "currencyNamespace": "t9BYYqwa", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1985-02-02T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1978-02-27T00:00:00Z", "expireAt": "1975-10-30T00:00:00Z", "price": 1, "purchaseAt": "1987-06-16T00:00:00Z", "trialPrice": 0}, {"currencyCode": "zXNCzA9s", "currencyNamespace": "4af4VeIg", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1979-09-22T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1993-08-06T00:00:00Z", "expireAt": "1981-03-03T00:00:00Z", "price": 86, "purchaseAt": "1974-01-19T00:00:00Z", "trialPrice": 26}], "l1TT7RQJ": [{"currencyCode": "MfVGBliG", "currencyNamespace": "IfyE4YBu", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1992-04-27T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1990-06-06T00:00:00Z", "expireAt": "1998-12-11T00:00:00Z", "price": 16, "purchaseAt": "1971-05-06T00:00:00Z", "trialPrice": 2}, {"currencyCode": "Ltku0Cjc", "currencyNamespace": "GzGAAwrN", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1977-08-22T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1973-02-17T00:00:00Z", "expireAt": "1992-03-16T00:00:00Z", "price": 41, "purchaseAt": "1987-05-07T00:00:00Z", "trialPrice": 49}, {"currencyCode": "0cVfxKLk", "currencyNamespace": "zn8xdjgQ", "currencyType": "VIRTUAL", "discountAmount": 65, "discountExpireAt": "1973-03-21T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1984-07-03T00:00:00Z", "expireAt": "1993-01-04T00:00:00Z", "price": 53, "purchaseAt": "1980-12-17T00:00:00Z", "trialPrice": 20}]}, "saleConfig": {"currencyCode": "EWoFo4Vr", "price": 55}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "jJmuVHcu", "stackable": true, "status": "INACTIVE", "tags": ["WOXrIV0J", "2aFCmeus", "EZZM6iQO"], "targetCurrencyCode": "FkXYEDG8", "targetNamespace": "zjZmFbMa", "thumbnailUrl": "SVS7ebis", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '1C5BZEhS' \
    --appId 'gvKj3eVZ' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'PdVzVRDK' \
    --baseAppId 'L2kBUU1q' \
    --categoryPath 'v5nzo7je' \
    --features '6jvsAOCt' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '8' \
    --offset '68' \
    --region '8jxLnGv0' \
    --sortBy 'updatedAt,updatedAt:asc,createdAt:desc' \
    --storeId 'zPGbFTif' \
    --tags '8ns5pNOi' \
    --targetNamespace '2i668kqk' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'PtZYzEzD,99nJcRqx,GKLWZ8MC' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SWwx9ogr' \
    --itemIds 'R2ewwpcD' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Mu6xokHK' \
    --sku 'F4ZjLsOr' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'RfJUUJdv' \
    --populateBundle  \
    --region 'pj4z9cZ7' \
    --storeId 'JcqizL7F' \
    --sku 'ibChCTy2' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'wAr89lHV' \
    --region 'aePDfwPV' \
    --storeId 'JhFQEoWg' \
    --itemIds 'Nnq0Zi7d' \
    --userId 'w2EYnAIR' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'NqZv4koK' \
    --sku '5sksVgu5' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'nQffEWF8,BSpSnY1O,TalqMK3g' \
    --storeId 'cUrHvBmO' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zAw9csSz' \
    --region 'DNlVtYot' \
    --storeId 'uTVw89G1' \
    --itemIds 'zgqXUngk' \
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
    --platform 'BIeCY4Cv' \
    --userId 'J8cevkUQ' \
    --body '{"itemIds": ["XYXl95cW", "dUYdMAKi", "FEhrSwBp"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId '2T2CNdRK' \
    --body '{"changes": [{"itemIdentities": ["yzwszXrA", "9mLkNTTr", "pVjo7jUe"], "itemIdentityType": "ITEM_SKU", "regionData": {"9Mk9QhRH": [{"currencyCode": "smKJEUNP", "currencyNamespace": "DnjmMfQv", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1999-01-21T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1981-01-22T00:00:00Z", "discountedPrice": 41, "expireAt": "1993-07-17T00:00:00Z", "price": 78, "purchaseAt": "1979-04-13T00:00:00Z", "trialPrice": 23}, {"currencyCode": "jlufjYl4", "currencyNamespace": "Tov2CxE9", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1986-04-30T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1993-03-20T00:00:00Z", "discountedPrice": 40, "expireAt": "1971-05-14T00:00:00Z", "price": 16, "purchaseAt": "1980-07-26T00:00:00Z", "trialPrice": 25}, {"currencyCode": "DCWj5Fn0", "currencyNamespace": "EU2kxB8W", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1972-11-24T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1995-06-10T00:00:00Z", "discountedPrice": 12, "expireAt": "1977-06-30T00:00:00Z", "price": 52, "purchaseAt": "1988-12-11T00:00:00Z", "trialPrice": 45}], "r9yvUkwN": [{"currencyCode": "fStoO0IC", "currencyNamespace": "lULrTgOY", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1990-12-11T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1986-01-22T00:00:00Z", "discountedPrice": 90, "expireAt": "1983-04-23T00:00:00Z", "price": 54, "purchaseAt": "1999-08-26T00:00:00Z", "trialPrice": 58}, {"currencyCode": "RzQU1ctX", "currencyNamespace": "gG8z6kja", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1997-04-18T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1996-05-20T00:00:00Z", "discountedPrice": 25, "expireAt": "1990-09-02T00:00:00Z", "price": 23, "purchaseAt": "1986-03-04T00:00:00Z", "trialPrice": 60}, {"currencyCode": "R6YVD9IH", "currencyNamespace": "8Vxo9Uao", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1991-02-14T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1971-08-15T00:00:00Z", "discountedPrice": 43, "expireAt": "1989-04-19T00:00:00Z", "price": 2, "purchaseAt": "1971-10-01T00:00:00Z", "trialPrice": 82}], "4A3rKbhQ": [{"currencyCode": "u05OJvso", "currencyNamespace": "ukg4kGFd", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1986-07-26T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1975-09-11T00:00:00Z", "discountedPrice": 43, "expireAt": "1976-01-24T00:00:00Z", "price": 22, "purchaseAt": "1974-11-29T00:00:00Z", "trialPrice": 20}, {"currencyCode": "3RgZnqlA", "currencyNamespace": "fgnUfU6i", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1976-05-13T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1974-03-06T00:00:00Z", "discountedPrice": 30, "expireAt": "1979-05-13T00:00:00Z", "price": 71, "purchaseAt": "1997-09-18T00:00:00Z", "trialPrice": 46}, {"currencyCode": "qBnLKJRN", "currencyNamespace": "yL8v5bec", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1995-12-03T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1988-10-06T00:00:00Z", "discountedPrice": 18, "expireAt": "1986-12-13T00:00:00Z", "price": 97, "purchaseAt": "1971-10-16T00:00:00Z", "trialPrice": 6}]}}, {"itemIdentities": ["RQOcZHCW", "9r9CvPH8", "cFF1yoxr"], "itemIdentityType": "ITEM_ID", "regionData": {"0bd4FE4l": [{"currencyCode": "widcypqn", "currencyNamespace": "gKOGHxAg", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1985-07-03T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1989-11-11T00:00:00Z", "discountedPrice": 85, "expireAt": "1980-06-15T00:00:00Z", "price": 53, "purchaseAt": "1975-06-12T00:00:00Z", "trialPrice": 10}, {"currencyCode": "vTszzkHa", "currencyNamespace": "PdPUtK8l", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1983-07-10T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1991-11-08T00:00:00Z", "discountedPrice": 34, "expireAt": "1980-01-12T00:00:00Z", "price": 75, "purchaseAt": "1979-05-20T00:00:00Z", "trialPrice": 67}, {"currencyCode": "BcQIyDhR", "currencyNamespace": "syRI5I27", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1974-05-06T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1991-06-27T00:00:00Z", "discountedPrice": 87, "expireAt": "1996-05-08T00:00:00Z", "price": 100, "purchaseAt": "1977-11-02T00:00:00Z", "trialPrice": 79}], "KUoRTKJR": [{"currencyCode": "6nDaqp4s", "currencyNamespace": "bFhR3wcH", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1987-05-14T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1991-06-03T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-02-29T00:00:00Z", "price": 53, "purchaseAt": "1979-03-01T00:00:00Z", "trialPrice": 33}, {"currencyCode": "bjQOKub3", "currencyNamespace": "j6hdxmkI", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1992-12-15T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1983-08-31T00:00:00Z", "discountedPrice": 15, "expireAt": "1977-09-09T00:00:00Z", "price": 83, "purchaseAt": "1986-08-21T00:00:00Z", "trialPrice": 70}, {"currencyCode": "5Bu0d2Yx", "currencyNamespace": "HzK1bIJ4", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1975-01-07T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1978-03-21T00:00:00Z", "discountedPrice": 79, "expireAt": "1979-08-20T00:00:00Z", "price": 77, "purchaseAt": "1978-04-21T00:00:00Z", "trialPrice": 25}], "WRmo1gze": [{"currencyCode": "HWtL3cU5", "currencyNamespace": "m4jsLBhJ", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1997-07-28T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1999-08-03T00:00:00Z", "discountedPrice": 94, "expireAt": "1979-07-22T00:00:00Z", "price": 17, "purchaseAt": "1986-04-13T00:00:00Z", "trialPrice": 44}, {"currencyCode": "dGgMGN4m", "currencyNamespace": "6uhu4txm", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1980-04-05T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1975-01-15T00:00:00Z", "discountedPrice": 12, "expireAt": "1987-08-23T00:00:00Z", "price": 77, "purchaseAt": "1988-07-12T00:00:00Z", "trialPrice": 9}, {"currencyCode": "O27C4pTc", "currencyNamespace": "ZZo1IYgh", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1978-02-06T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1993-09-16T00:00:00Z", "discountedPrice": 41, "expireAt": "1979-05-06T00:00:00Z", "price": 64, "purchaseAt": "1999-08-08T00:00:00Z", "trialPrice": 15}]}}, {"itemIdentities": ["HYLwvHLf", "ucuRZzYK", "6lAEAU4u"], "itemIdentityType": "ITEM_SKU", "regionData": {"sLaRm0lI": [{"currencyCode": "bZpwfWBc", "currencyNamespace": "lX6pFKv5", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1995-01-04T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1992-08-03T00:00:00Z", "discountedPrice": 23, "expireAt": "1996-09-17T00:00:00Z", "price": 88, "purchaseAt": "1976-08-21T00:00:00Z", "trialPrice": 72}, {"currencyCode": "iQZV9TDK", "currencyNamespace": "EjrgrsjE", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1989-11-17T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1982-05-29T00:00:00Z", "discountedPrice": 49, "expireAt": "1996-05-06T00:00:00Z", "price": 33, "purchaseAt": "1975-03-18T00:00:00Z", "trialPrice": 7}, {"currencyCode": "IonYnnKV", "currencyNamespace": "CTnAMoV5", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1999-03-01T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1985-04-10T00:00:00Z", "discountedPrice": 25, "expireAt": "1999-02-17T00:00:00Z", "price": 33, "purchaseAt": "1994-12-04T00:00:00Z", "trialPrice": 17}], "3Zjuke0m": [{"currencyCode": "SqtBjOqH", "currencyNamespace": "t7BEBkEO", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1994-07-14T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1989-08-29T00:00:00Z", "discountedPrice": 84, "expireAt": "1978-03-08T00:00:00Z", "price": 40, "purchaseAt": "1982-12-13T00:00:00Z", "trialPrice": 98}, {"currencyCode": "n17TLKLt", "currencyNamespace": "BK190UsW", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1984-11-01T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1999-12-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1979-02-11T00:00:00Z", "price": 1, "purchaseAt": "1982-03-01T00:00:00Z", "trialPrice": 63}, {"currencyCode": "FKOgzSkD", "currencyNamespace": "drQQLDgl", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1997-05-12T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1983-11-15T00:00:00Z", "discountedPrice": 45, "expireAt": "1997-01-22T00:00:00Z", "price": 25, "purchaseAt": "1991-09-07T00:00:00Z", "trialPrice": 40}], "W6AmCDkx": [{"currencyCode": "EatQXnpI", "currencyNamespace": "GkiyxCWx", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1977-03-25T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1993-02-10T00:00:00Z", "discountedPrice": 90, "expireAt": "1978-05-19T00:00:00Z", "price": 39, "purchaseAt": "1973-08-13T00:00:00Z", "trialPrice": 19}, {"currencyCode": "HYcYYWm0", "currencyNamespace": "xyfM5oMj", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1973-04-17T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1984-03-06T00:00:00Z", "discountedPrice": 66, "expireAt": "1983-04-15T00:00:00Z", "price": 92, "purchaseAt": "1998-11-26T00:00:00Z", "trialPrice": 29}, {"currencyCode": "dNSEiHEc", "currencyNamespace": "dsQeTW11", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1985-02-26T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1981-10-02T00:00:00Z", "discountedPrice": 62, "expireAt": "1994-06-22T00:00:00Z", "price": 73, "purchaseAt": "1996-04-19T00:00:00Z", "trialPrice": 7}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '9' \
    --offset '70' \
    --sortBy 'VpPCSvUd' \
    --storeId 'TkOzWAuq' \
    --keyword 'RXpwGKzw' \
    --language 'N03y5lRx' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '13' \
    --offset '54' \
    --sortBy 'createdAt:desc,updatedAt,name:asc' \
    --storeId 'Plo5Vsrt' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '7Wyk5R8u' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'TM8IOwRH' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'YVL1lJxA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LWkii3O8' \
    --body '{"appId": "TkDxEsXE", "appType": "DLC", "baseAppId": "Qqf0erhb", "boothName": "FmwnnSeY", "categoryPath": "wVT0TArM", "clazz": "ZrXFLKFY", "displayOrder": 83, "entitlementType": "DURABLE", "ext": {"mWlZZ2Dx": {}, "IN8jiiDS": {}, "7j0j6pq9": {}}, "features": ["VUYoPC8u", "KZq5pkUA", "Hc6cRtnA"], "flexible": true, "images": [{"as": "XqCcksBC", "caption": "am3kyWCk", "height": 25, "imageUrl": "zbx6xOHN", "smallImageUrl": "DZYwavYC", "width": 9}, {"as": "dqFOyRqn", "caption": "gss28TAK", "height": 7, "imageUrl": "y9Rd5j7V", "smallImageUrl": "ELaPGZ3F", "width": 52}, {"as": "xFmXy5ux", "caption": "KCXRH8Pw", "height": 45, "imageUrl": "AeIEgJCO", "smallImageUrl": "pgfIruPs", "width": 88}], "inventoryConfig": {"customAttributes": {"o4en14bS": {}, "x4odD7na": {}, "gBQWhTC7": {}}, "serverCustomAttributes": {"r3NAj6Lx": {}, "1qpqU0iM": {}, "e9Q7cqeE": {}}, "slotUsed": 48}, "itemIds": ["vpALzZUt", "C4pOaqnv", "BEAUt1PK"], "itemQty": {"D12nicry": 75, "v62GQNAH": 52, "mzMEd6Dx": 67}, "itemType": "MEDIA", "listable": false, "localizations": {"bCfe6K9k": {"description": "rUKFVEMj", "localExt": {"hKTO6qIj": {}, "rX76o3XR": {}, "Q3grfUkR": {}}, "longDescription": "Z8OCs5EP", "title": "bZTGjJzB"}, "UcRrzt6q": {"description": "d83qSWVh", "localExt": {"YB3pgo34": {}, "mYtz3xqU": {}, "9P9zml37": {}}, "longDescription": "bcJuZJfh", "title": "I3HhlemU"}, "IjD7yqux": {"description": "1fgOHGVs", "localExt": {"AQ4EL8WN": {}, "lAdvYDra": {}, "HtOrLCNj": {}}, "longDescription": "SFkKsNNa", "title": "2MQXLb2M"}}, "lootBoxConfig": {"rewardCount": 48, "rewards": [{"lootBoxItems": [{"count": 78, "duration": 79, "endDate": "1988-06-27T00:00:00Z", "itemId": "prTVoyqh", "itemSku": "uVi69N4A", "itemType": "XbxEXIEx"}, {"count": 6, "duration": 33, "endDate": "1998-12-06T00:00:00Z", "itemId": "DNnXVQe7", "itemSku": "e9D985Ez", "itemType": "Cbshx7L3"}, {"count": 41, "duration": 61, "endDate": "1979-10-15T00:00:00Z", "itemId": "JjfgkRXH", "itemSku": "WPnmc5mr", "itemType": "f3FwUMZ1"}], "name": "zkEm7Pcm", "odds": 0.6043731252828071, "type": "REWARD_GROUP", "weight": 78}, {"lootBoxItems": [{"count": 50, "duration": 74, "endDate": "1985-09-08T00:00:00Z", "itemId": "72TOzRdo", "itemSku": "V5TnoMHI", "itemType": "svmAKB0n"}, {"count": 45, "duration": 28, "endDate": "1987-12-18T00:00:00Z", "itemId": "BzBtrLio", "itemSku": "8zylnCPO", "itemType": "Zg4izk6z"}, {"count": 19, "duration": 8, "endDate": "1978-04-22T00:00:00Z", "itemId": "PRNSpXb4", "itemSku": "Svay3aFN", "itemType": "7pKd7IAM"}], "name": "jBEgIrbP", "odds": 0.7934333786519256, "type": "REWARD_GROUP", "weight": 99}, {"lootBoxItems": [{"count": 100, "duration": 56, "endDate": "1997-07-30T00:00:00Z", "itemId": "RY6KeCHU", "itemSku": "wZLzDrAf", "itemType": "Qp4eytpk"}, {"count": 36, "duration": 89, "endDate": "1998-11-07T00:00:00Z", "itemId": "QtTlvW4v", "itemSku": "fbCl3Zk8", "itemType": "e3apPlaP"}, {"count": 59, "duration": 90, "endDate": "1974-06-28T00:00:00Z", "itemId": "FR2xx0gz", "itemSku": "3SlXd6jX", "itemType": "S5K78CyU"}], "name": "gwp0C4YA", "odds": 0.9488144806552445, "type": "PROBABILITY_GROUP", "weight": 95}], "rollFunction": "DEFAULT"}, "maxCount": 31, "maxCountPerUser": 29, "name": "UW6btdCn", "optionBoxConfig": {"boxItems": [{"count": 5, "duration": 81, "endDate": "1973-03-07T00:00:00Z", "itemId": "eEjupMwr", "itemSku": "gNLlxRyj", "itemType": "GDDXbehU"}, {"count": 56, "duration": 35, "endDate": "1998-02-17T00:00:00Z", "itemId": "NFhCx0oL", "itemSku": "afn1LUpF", "itemType": "AuvLlOVI"}, {"count": 97, "duration": 10, "endDate": "1987-07-28T00:00:00Z", "itemId": "YOd9yNEL", "itemSku": "9k9JAStB", "itemType": "R6rEU08a"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 26, "fixedTrialCycles": 83, "graceDays": 51}, "regionData": {"jpjbUZXz": [{"currencyCode": "NwxUCpWX", "currencyNamespace": "IKidfUP9", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1972-03-06T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1997-05-17T00:00:00Z", "expireAt": "1995-08-04T00:00:00Z", "price": 12, "purchaseAt": "1991-02-05T00:00:00Z", "trialPrice": 79}, {"currencyCode": "s95SmsGL", "currencyNamespace": "2MyADR40", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1972-03-31T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1972-12-02T00:00:00Z", "expireAt": "1993-07-10T00:00:00Z", "price": 47, "purchaseAt": "1991-07-12T00:00:00Z", "trialPrice": 78}, {"currencyCode": "XK5lLpLp", "currencyNamespace": "KUkcaIhc", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1995-04-02T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1992-04-29T00:00:00Z", "expireAt": "1993-06-29T00:00:00Z", "price": 72, "purchaseAt": "1984-01-12T00:00:00Z", "trialPrice": 76}], "PWyBKMEW": [{"currencyCode": "PmYJOzFp", "currencyNamespace": "GOtiNX62", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1980-04-23T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1994-09-09T00:00:00Z", "expireAt": "1988-01-05T00:00:00Z", "price": 62, "purchaseAt": "1993-11-18T00:00:00Z", "trialPrice": 86}, {"currencyCode": "bEcTVarP", "currencyNamespace": "br2lmNhE", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1997-08-27T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1973-11-12T00:00:00Z", "expireAt": "1996-11-08T00:00:00Z", "price": 8, "purchaseAt": "1993-10-17T00:00:00Z", "trialPrice": 88}, {"currencyCode": "g45LOpXk", "currencyNamespace": "1b3vxjsg", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1971-09-03T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1998-12-22T00:00:00Z", "expireAt": "1997-09-28T00:00:00Z", "price": 63, "purchaseAt": "1996-08-28T00:00:00Z", "trialPrice": 25}], "j0biIEIN": [{"currencyCode": "YBsugFq8", "currencyNamespace": "K8tWK4g9", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1984-09-08T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1971-02-24T00:00:00Z", "expireAt": "1982-12-17T00:00:00Z", "price": 91, "purchaseAt": "1974-08-29T00:00:00Z", "trialPrice": 78}, {"currencyCode": "zIzVjyiw", "currencyNamespace": "NrlxfiFk", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1987-03-01T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1997-03-06T00:00:00Z", "expireAt": "1995-12-14T00:00:00Z", "price": 80, "purchaseAt": "1981-04-04T00:00:00Z", "trialPrice": 62}, {"currencyCode": "byvL5STx", "currencyNamespace": "0jH6L4V9", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1999-09-03T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1988-10-30T00:00:00Z", "expireAt": "1996-04-27T00:00:00Z", "price": 21, "purchaseAt": "1980-04-20T00:00:00Z", "trialPrice": 30}]}, "saleConfig": {"currencyCode": "tISSfQpM", "price": 55}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "tJ4KibmG", "stackable": true, "status": "INACTIVE", "tags": ["XVqBHWbn", "iqRhD2p6", "adSyPNOr"], "targetCurrencyCode": "gIVNrmaY", "targetNamespace": "Lp8na1H3", "thumbnailUrl": "J88F8wKq", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'mnHBsZ4Y' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'nBe54G5P' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'iKNQ7Rdl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 79, "orderNo": "Z3r5shNM"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'jdy370xJ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'T0nHtX9j' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'IWMMbXvZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TI1KJltE' \
    --body '{"carousel": [{"alt": "kJJWqM8x", "previewUrl": "1ufjwRu5", "thumbnailUrl": "GSKxIjaq", "type": "video", "url": "Sw0jlmrk", "videoSource": "youtube"}, {"alt": "Yqnf47nD", "previewUrl": "qm3BkSSL", "thumbnailUrl": "u1yXoerX", "type": "video", "url": "al7b9LU7", "videoSource": "vimeo"}, {"alt": "5bbFx7y3", "previewUrl": "tM1rcdcr", "thumbnailUrl": "XQxpeK7L", "type": "image", "url": "n5KnrIfR", "videoSource": "vimeo"}], "developer": "7yqV4JsW", "forumUrl": "J5fc7z1u", "genres": ["Casual", "Racing", "Action"], "localizations": {"5hnbxm3x": {"announcement": "gUuqBGSm", "slogan": "1xc9ZaMI"}, "n9KO9zTm": {"announcement": "fc55Iz6b", "slogan": "KpQ14YYn"}, "m6b0qjEx": {"announcement": "uf4Kp6Ox", "slogan": "JyAOrJmr"}}, "platformRequirements": {"tM7cRMwP": [{"additionals": "inpTS3Zg", "directXVersion": "n1awe0IB", "diskSpace": "7J5Hjf31", "graphics": "eh8iFbZW", "label": "qx6Px4wb", "osVersion": "CdUXGov2", "processor": "sqecUoEz", "ram": "PTsvFmKl", "soundCard": "u9JmtV9k"}, {"additionals": "yO3Z0m3Y", "directXVersion": "JhBeB1wz", "diskSpace": "0YubbfDr", "graphics": "D7O4JvPd", "label": "LM2nd8FY", "osVersion": "MPt0OU3I", "processor": "sqbCJxJg", "ram": "DLbSLj8G", "soundCard": "5fZf6voY"}, {"additionals": "TBBwkHNt", "directXVersion": "OvGvxdZE", "diskSpace": "wJRZ57mp", "graphics": "3Lzs3LQz", "label": "tZDz5dTm", "osVersion": "xJzKeENs", "processor": "iFChESdk", "ram": "lQ9LycTx", "soundCard": "cIAnKH1l"}], "8mNG4ZCJ": [{"additionals": "YOLTGkUn", "directXVersion": "3pAjK6gT", "diskSpace": "kIqL776H", "graphics": "yjEtKvvA", "label": "sVREFhtL", "osVersion": "07QIhmGu", "processor": "ngNMuF10", "ram": "EnjHICLf", "soundCard": "uNnE3REQ"}, {"additionals": "58aC3UBd", "directXVersion": "DmkLoaHB", "diskSpace": "DZDtAbtl", "graphics": "JlmUZVnr", "label": "wYp0HpA9", "osVersion": "VBiuF7sK", "processor": "bb13HXaS", "ram": "tr0COkIO", "soundCard": "W6GUlQI1"}, {"additionals": "QaXYvSdz", "directXVersion": "EUu8jf0l", "diskSpace": "IRHMbXFI", "graphics": "PNtkyDC4", "label": "M3HdcHSU", "osVersion": "Rwo8mKx7", "processor": "hfsbZXon", "ram": "81ZKwEow", "soundCard": "NFR6aVA5"}], "Rh7gSSXt": [{"additionals": "XbS01S0w", "directXVersion": "pAX3lV5l", "diskSpace": "NBSXCxHy", "graphics": "eYEBi0v7", "label": "dXH8P8OI", "osVersion": "5r4YlhTg", "processor": "4YeX53Ee", "ram": "bt5QoKyW", "soundCard": "AVyNiTgR"}, {"additionals": "VvpVF0Xf", "directXVersion": "ZQfrQ81O", "diskSpace": "N4lSXwNs", "graphics": "iBJjZR6f", "label": "W55HRTuN", "osVersion": "7wmtWd4X", "processor": "i0V1gxrM", "ram": "eHUD0jUh", "soundCard": "8qUD5Fff"}, {"additionals": "En84wvTj", "directXVersion": "0oDrxHX2", "diskSpace": "2bXItGLo", "graphics": "oaEIGARl", "label": "TYgKf28k", "osVersion": "r8iLsQm2", "processor": "BBmIJRNC", "ram": "BCzDdD7J", "soundCard": "dMY1vkF5"}]}, "platforms": ["Linux", "Windows", "Android"], "players": ["Single", "Coop", "Multi"], "primaryGenre": "Simulation", "publisher": "8DxV3Y8e", "releaseDate": "1988-05-07T00:00:00Z", "websiteUrl": "6bffudof"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'RlsuYUIu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vwrC2CWr' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '4MT6kcy3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'do1eLFmC' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3OsHDTnP' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'MDTF8TSg' \
    --itemId 'm0QLFUhc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XDvZo9yn' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'CExBTP0d' \
    --itemId 'UIsc9Ai1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RzIO9WPA' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'qgStNAve' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'x2LDWmxy' \
    --populateBundle  \
    --region '2VBeil7l' \
    --storeId 'fandapAX' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'rzRtudYd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kgaFJ0dL' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 7, "code": "wxqlpkV4", "comparison": "isLessThan", "name": "M6H34y0B", "predicateType": "SeasonPassPredicate", "value": "yKK35pTQ", "values": ["ViZdNF3P", "amtAJT1C", "LmUPTUUl"]}, {"anyOf": 63, "code": "3QsUBiH3", "comparison": "isGreaterThanOrEqual", "name": "NABjESLt", "predicateType": "SeasonPassPredicate", "value": "OHDc0XeP", "values": ["bYB4XwIp", "3I9NNWEE", "z37bNPk1"]}, {"anyOf": 58, "code": "NBNP6jEt", "comparison": "isGreaterThanOrEqual", "name": "mRhiaaRz", "predicateType": "SeasonPassPredicate", "value": "V9LFIdVa", "values": ["g5IhdNzi", "rNXLxday", "yhvYLOSc"]}]}, {"operator": "or", "predicates": [{"anyOf": 51, "code": "Rqh49F3r", "comparison": "isGreaterThan", "name": "JjO0dgmB", "predicateType": "SeasonTierPredicate", "value": "ANUlm5Me", "values": ["7BG2zfAh", "pKEsTiWj", "0s3i4bTc"]}, {"anyOf": 55, "code": "bXyHEZiT", "comparison": "is", "name": "tAjk3kAT", "predicateType": "EntitlementPredicate", "value": "8Bv9rg5A", "values": ["7hqwDxxi", "a6ShZYxz", "y9ObLaRo"]}, {"anyOf": 90, "code": "uHoaaJSq", "comparison": "isGreaterThanOrEqual", "name": "KnPcYPYV", "predicateType": "StatisticCodePredicate", "value": "JZUNiGYF", "values": ["AzSZNlnb", "TTcXSfIB", "NqXHdEZ6"]}]}, {"operator": "or", "predicates": [{"anyOf": 98, "code": "TcVpYAYF", "comparison": "isLessThanOrEqual", "name": "03NT5Kpd", "predicateType": "SeasonPassPredicate", "value": "fSlUFNr1", "values": ["Wsylu22c", "pVIC9Hj1", "UMiGIVKI"]}, {"anyOf": 33, "code": "tNfR2RUX", "comparison": "isLessThan", "name": "ws5tHoYb", "predicateType": "EntitlementPredicate", "value": "20tENrbI", "values": ["qKTjeScV", "CN8OO073", "0uE08Krc"]}, {"anyOf": 36, "code": "mMnRTUrN", "comparison": "isGreaterThan", "name": "SSufXETg", "predicateType": "SeasonTierPredicate", "value": "YhU2RRB7", "values": ["2COvGc0u", "nUB0I4JX", "t5NAn1n8"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'JbT9TWH0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "JQ1cp7bY"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --name 'h6b70NBp' \
    --offset '16' \
    --tag '0pLxbyga' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bfInmiUy", "name": "0CHVOScO", "status": "ACTIVE", "tags": ["HJBoyscu", "4I515OLc", "PQXsd2sL"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'u2lyVH74' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'SIUpGgIF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "6jI8X0T3", "name": "UPdDqYIk", "status": "INACTIVE", "tags": ["H7H0C2YJ", "GAQDyoBV", "oKreCRjn"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'kbA2dPNo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'B4nGOzXD' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '74' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'NmIeOCEg' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '1JCvE4vi' \
    --limit '51' \
    --offset '47' \
    --orderNos 'S5IL2SqX,jRFLpopy,fyszCuFs' \
    --sortBy 'FszfT8K3' \
    --startTime '7ovmUtRV' \
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
    --orderNo 'p6fk7uDS' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3mla8vuM' \
    --body '{"description": "s89bK2wH"}' \
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
    --body '{"dryRun": false, "notifyUrl": "58wQHrWL", "privateKey": "yLlbjXLc"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentMerchantConfig' test.out

#- 150 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["Ukyv27pT", "fGGTsD4W", "Aj67U5Sh"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentDomainWhitelistConfig' test.out

#- 151 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'LG1QYb81' \
    --externalId 'bUbjE0Mo' \
    --limit '84' \
    --notificationSource 'WXPAY' \
    --notificationType '9K8gJ89p' \
    --offset '75' \
    --paymentOrderNo 'WOiFfAYz' \
    --startDate 'QZ3ce4V4' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 151 'QueryPaymentNotifications' test.out

#- 152 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'fm1XLgmp' \
    --limit '85' \
    --offset '69' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 152 'QueryPaymentOrders' test.out

#- 153 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "TMCB5H0y", "currencyNamespace": "ZdTjhcCB", "customParameters": {"fuEEZ2sG": {}, "WXXwDwps": {}, "fUQIeOLG": {}}, "description": "0tGlU5jk", "extOrderNo": "wPan3tT4", "extUserId": "BBkfXmTs", "itemType": "APP", "language": "iO-415", "metadata": {"rR0bmSkG": "UFJy3Xyq", "zeMwS8ZC": "eKhjujoA", "RhAZTIem": "OAa5ND0c"}, "notifyUrl": "jwdtDc81", "omitNotification": false, "platform": "k5GcjXyS", "price": 55, "recurringPaymentOrderNo": "9LU12bCr", "region": "dLi8vDdg", "returnUrl": "y5hm10lF", "sandbox": false, "sku": "DIA9vgr8", "subscriptionId": "rJGMQ2XM", "targetNamespace": "DC4r94wz", "targetUserId": "psnc0kLO", "title": "diQqhFjL"}' \
    > test.out 2>&1
eval_tap $? 153 'CreatePaymentOrderByDedicated' test.out

#- 154 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'wx9nhcwl' \
    > test.out 2>&1
eval_tap $? 154 'ListExtOrderNoByExtTxId' test.out

#- 155 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ja9PDC1W' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrder' test.out

#- 156 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SQUZDPiQ' \
    --body '{"extTxId": "NirQue2n", "paymentMethod": "SZX0JrVm", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 156 'ChargePaymentOrder' test.out

#- 157 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BC7NY1Pn' \
    --body '{"description": "9Azg9zBD"}' \
    > test.out 2>&1
eval_tap $? 157 'RefundPaymentOrderByDedicated' test.out

#- 158 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GCC7ziYL' \
    --body '{"amount": 10, "currencyCode": "ezvOLpDn", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 19, "vat": 21}' \
    > test.out 2>&1
eval_tap $? 158 'SimulatePaymentOrderNotification' test.out

#- 159 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0OhIPlAT' \
    > test.out 2>&1
eval_tap $? 159 'GetPaymentOrderChargeStatus' test.out

#- 160 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'ErYyDTLy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "ksifP6a4", "serviceLabel": 49}' \
    > test.out 2>&1
eval_tap $? 160 'GetPsnEntitlementOwnership' test.out

#- 161 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'uTzFI25q' \
    --body '{"delegationToken": "Y8KsPbo8", "sandboxId": "FyaE7EYR"}' \
    > test.out 2>&1
eval_tap $? 161 'GetXboxEntitlementOwnership' test.out

#- 162 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 162 'GetPlatformEntitlementConfig' test.out

#- 163 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedPlatformOrigins": ["GooglePlay", "Oculus", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePlatformEntitlementConfig' test.out

#- 164 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformWalletConfig' test.out

#- 165 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Other", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformWalletConfig' test.out

#- 166 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 166 'ResetPlatformWalletConfig' test.out

#- 167 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationConfig' test.out

#- 168 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationConfig' test.out

#- 169 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationConfig' test.out

#- 170 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Q9xks2u4' \
    --limit '60' \
    --offset '80' \
    --source 'DLC' \
    --startTime 'aSkaHjem' \
    --status 'SUCCESS' \
    --transactionId 'eFMDsQM9' \
    --userId '1vLGq8h7' \
    > test.out 2>&1
eval_tap $? 170 'QueryRevocationHistories' test.out

#- 171 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'GetRevocationPluginConfig' test.out

#- 172 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "AkxL6wx1"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "ieU0BArh"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 172 'UpdateRevocationPluginConfig' test.out

#- 173 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'DeleteRevocationPluginConfig' test.out

#- 174 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'UploadRevocationPluginConfigCert' test.out

#- 175 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Pd1ghv5W", "eventTopic": "wOBp6jAf", "maxAwarded": 84, "maxAwardedPerUser": 46, "namespaceExpression": "Hy0pQiTd", "rewardCode": "vxwzYfZw", "rewardConditions": [{"condition": "tqqLgSn9", "conditionName": "Hv3YkNOR", "eventName": "UoJXQEBY", "rewardItems": [{"duration": 43, "endDate": "1971-12-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "uJAH5Mvl", "quantity": 99, "sku": "fat2Hwov"}, {"duration": 13, "endDate": "1975-03-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1Q5qKdZW", "quantity": 5, "sku": "HuyBA9s0"}, {"duration": 25, "endDate": "1996-06-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "AmlVQDh6", "quantity": 43, "sku": "Lhhpk9ao"}]}, {"condition": "PTVKTKyH", "conditionName": "grAxGIJN", "eventName": "sZ5g82Qt", "rewardItems": [{"duration": 70, "endDate": "1988-10-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iKG2ByNc", "quantity": 4, "sku": "PpC0GVuV"}, {"duration": 13, "endDate": "1976-08-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "JG744MCI", "quantity": 99, "sku": "l1qJZeVw"}, {"duration": 50, "endDate": "1971-08-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "xlAZquQf", "quantity": 97, "sku": "BOzfT7mv"}]}, {"condition": "ElGzhBZ3", "conditionName": "DPqCLqH7", "eventName": "jt8geQuX", "rewardItems": [{"duration": 5, "endDate": "1982-12-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "o6M5ruEx", "quantity": 93, "sku": "axVLvIcY"}, {"duration": 82, "endDate": "1977-01-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "kNtyJUPZ", "quantity": 84, "sku": "zD8EBXGR"}, {"duration": 21, "endDate": "1992-04-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "I3wXLvTy", "quantity": 23, "sku": "hoeagAMb"}]}], "userIdExpression": "2zG9eNOv"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateReward' test.out

#- 176 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'UpnHeyQ8' \
    --limit '96' \
    --offset '79' \
    --sortBy 'namespace,namespace:desc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 176 'QueryRewards' test.out

#- 177 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'ExportRewards' test.out

#- 178 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 178 'ImportRewards' test.out

#- 179 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ctv1z49l' \
    > test.out 2>&1
eval_tap $? 179 'GetReward' test.out

#- 180 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WV8yy0vp' \
    --body '{"description": "D5rLKiNi", "eventTopic": "5jAJmSZo", "maxAwarded": 89, "maxAwardedPerUser": 9, "namespaceExpression": "o25NtpL0", "rewardCode": "x50u7bbK", "rewardConditions": [{"condition": "6ZfY8Jfv", "conditionName": "VeQCWtZ0", "eventName": "lBwZgUzO", "rewardItems": [{"duration": 36, "endDate": "1971-08-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "i2qo98xM", "quantity": 68, "sku": "LHPQw8U8"}, {"duration": 30, "endDate": "1974-06-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1lRS8mrY", "quantity": 23, "sku": "XsEwSQAm"}, {"duration": 57, "endDate": "1987-12-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "fT0dPvB1", "quantity": 14, "sku": "eE4rb0mE"}]}, {"condition": "tpRhRfx2", "conditionName": "CRYtaKPo", "eventName": "3iy9WPwF", "rewardItems": [{"duration": 48, "endDate": "1976-07-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "GVwpLqmc", "quantity": 30, "sku": "digSuRZX"}, {"duration": 6, "endDate": "1972-02-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "FkdO3zWk", "quantity": 79, "sku": "SkEWhb3m"}, {"duration": 94, "endDate": "1982-06-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "93IQbu9q", "quantity": 44, "sku": "JdUJGd8H"}]}, {"condition": "l1hxtKw7", "conditionName": "RNqKGw3M", "eventName": "PFsOdyQh", "rewardItems": [{"duration": 20, "endDate": "1996-02-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vkKsiSAQ", "quantity": 84, "sku": "wEX5ID6n"}, {"duration": 55, "endDate": "1987-02-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "v9T8t5id", "quantity": 13, "sku": "m3ZwY0E5"}, {"duration": 51, "endDate": "1971-11-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1ILDGTGH", "quantity": 70, "sku": "IxbccbFm"}]}], "userIdExpression": "PdHbSfQu"}' \
    > test.out 2>&1
eval_tap $? 180 'UpdateReward' test.out

#- 181 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AzRi0l9E' \
    > test.out 2>&1
eval_tap $? 181 'DeleteReward' test.out

#- 182 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '42f7sc40' \
    --body '{"payload": {"T3g2s3ec": {}, "HXn6c6ec": {}, "nJ4bbbeg": {}}}' \
    > test.out 2>&1
eval_tap $? 182 'CheckEventCondition' test.out

#- 183 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'SMkz4Thq' \
    --body '{"conditionName": "XJC2RJNb", "userId": "c8t9FBVh"}' \
    > test.out 2>&1
eval_tap $? 183 'DeleteRewardConditionRecord' test.out

#- 184 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'KFG5VfJ8' \
    --limit '97' \
    --offset '4' \
    --start 'xxXzN3a3' \
    --storeId 'SIE4IQZN' \
    --viewId '8uTFWioY' \
    > test.out 2>&1
eval_tap $? 184 'QuerySections' test.out

#- 185 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BQOAbivS' \
    --body '{"active": false, "displayOrder": 89, "endDate": "1988-05-16T00:00:00Z", "ext": {"nu4cxjL0": {}, "sdQhQyUS": {}, "ee1LWmRJ": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 66, "itemCount": 65, "rule": "SEQUENCE"}, "items": [{"id": "bo3z3iFD", "sku": "ljduvzLN"}, {"id": "XSJi3kQp", "sku": "e2FZPL59"}, {"id": "eIbu0xQz", "sku": "IgtQwU5v"}], "localizations": {"5BVLmdXl": {"description": "WeE2hinu", "localExt": {"UdHfas1i": {}, "RaT34hN3": {}, "adEZCars": {}}, "longDescription": "IiWFH1R0", "title": "v8lxFFIs"}, "wjXebgaq": {"description": "dqpSVBRV", "localExt": {"lYNPaGKX": {}, "bn5ch1gq": {}, "Lx8J3NhP": {}}, "longDescription": "Zkz6pspZ", "title": "C1ibV8Iq"}, "9r7BvOc8": {"description": "WOYU4aE2", "localExt": {"S7YvujH9": {}, "fNy4xL7Z": {}, "tXvru1Qp": {}}, "longDescription": "wndyo5sZ", "title": "QRpu70IK"}}, "name": "6NfCXZrI", "rotationType": "CUSTOM", "startDate": "1987-07-12T00:00:00Z", "viewId": "K8CXibz6"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateSection' test.out

#- 186 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y0wuttum' \
    > test.out 2>&1
eval_tap $? 186 'PurgeExpiredSection' test.out

#- 187 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '74vp5uUj' \
    --storeId 'suSSqMzg' \
    > test.out 2>&1
eval_tap $? 187 'GetSection' test.out

#- 188 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'GghXQKPb' \
    --storeId 'oxy0N9ra' \
    --body '{"active": false, "displayOrder": 91, "endDate": "1974-03-10T00:00:00Z", "ext": {"bEEJrkiy": {}, "QdNq0pSM": {}, "39sdXZPA": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 48, "itemCount": 50, "rule": "SEQUENCE"}, "items": [{"id": "oTOaR5Rc", "sku": "zCaWaCPy"}, {"id": "tFOya2eJ", "sku": "2beVn50b"}, {"id": "dZDgorIV", "sku": "fMatos6l"}], "localizations": {"hD8ixykM": {"description": "ZSog2LNM", "localExt": {"JI3N1yEk": {}, "l20ArW2t": {}, "lXk5LGNM": {}}, "longDescription": "KjWyncYT", "title": "Blrjk4hf"}, "ZlsRzXjF": {"description": "dtnMfUpe", "localExt": {"jn0FDyty": {}, "hMt49xW2": {}, "KSMs2Z8M": {}}, "longDescription": "0OS4wmtQ", "title": "SYa1BzvE"}, "WjXmyYos": {"description": "NdQtLrXo", "localExt": {"5J4DAiZP": {}, "Dm58NraF": {}, "rFOWUmI8": {}}, "longDescription": "0yxKgUAX", "title": "nfAI4A3N"}}, "name": "gm9BCFPu", "rotationType": "CUSTOM", "startDate": "1991-08-28T00:00:00Z", "viewId": "dCynvcu7"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateSection' test.out

#- 189 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Q3NF8jg8' \
    --storeId 'IQE1da0V' \
    > test.out 2>&1
eval_tap $? 189 'DeleteSection' test.out

#- 190 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ListStores' test.out

#- 191 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "xV5TdBB0", "defaultRegion": "1mqFqib4", "description": "a5TxSS7N", "supportedLanguages": ["jjJ5Vz79", "0cve5U0D", "QVwnANfl"], "supportedRegions": ["ROHfjgET", "WS0paVp1", "KWqX1Ouv"], "title": "awVEspce"}' \
    > test.out 2>&1
eval_tap $? 191 'CreateStore' test.out

#- 192 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'SECTION' \
    > test.out 2>&1
eval_tap $? 192 'GetCatalogDefinition' test.out

#- 193 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DownloadCSVTemplates' test.out

#- 194 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["61pF9auM", "j1PZUjJj", "NL8SqWMM"], "idsToBeExported": ["Kj8iT7G2", "NzduR50t", "ILRiUYMS"], "storeId": "abUXPMQ0"}' \
    > test.out 2>&1
eval_tap $? 194 'ExportStoreByCSV' test.out

#- 195 ImportStore
eval_tap 0 195 'ImportStore # SKIP deprecated' test.out

#- 196 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 196 'GetPublishedStore' test.out

#- 197 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'DeletePublishedStore' test.out

#- 198 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'GetPublishedStoreBackup' test.out

#- 199 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'RollbackPublishedStore' test.out

#- 200 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jgdSuG5C' \
    > test.out 2>&1
eval_tap $? 200 'GetStore' test.out

#- 201 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x1bhTzTW' \
    --body '{"defaultLanguage": "OSfN4kSm", "defaultRegion": "rVHdbmV2", "description": "gfDZ3ihE", "supportedLanguages": ["Lic8yplz", "mjlhgsfT", "3N41ajb7"], "supportedRegions": ["DgFMJp81", "rVoEbXMC", "aGyeekVh"], "title": "hIkduklH"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateStore' test.out

#- 202 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DSBcUmUc' \
    > test.out 2>&1
eval_tap $? 202 'DeleteStore' test.out

#- 203 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jm39K65v' \
    --action 'DELETE' \
    --itemSku 'jk5g8O7h' \
    --itemType 'APP' \
    --limit '71' \
    --offset '45' \
    --selected  \
    --sortBy 'updatedAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'rJq69bOl' \
    --updatedAtStart 'VGC3NkUP' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 203 'QueryChanges' test.out

#- 204 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VoFS6sK0' \
    > test.out 2>&1
eval_tap $? 204 'PublishAll' test.out

#- 205 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tc8mxeaN' \
    > test.out 2>&1
eval_tap $? 205 'PublishSelected' test.out

#- 206 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AEQi4OY9' \
    > test.out 2>&1
eval_tap $? 206 'SelectAllRecords' test.out

#- 207 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pA625ZJO' \
    --action 'UPDATE' \
    --itemSku 'qb3n4qS6' \
    --itemType 'SEASON' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd '3fBsvoSi' \
    --updatedAtStart 'psFQrGxo' \
    > test.out 2>&1
eval_tap $? 207 'SelectAllRecordsByCriteria' test.out

#- 208 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OyM7V1vX' \
    --action 'CREATE' \
    --itemSku '7Inb6sMv' \
    --itemType 'BUNDLE' \
    --type 'SECTION' \
    --updatedAtEnd 'ECoEgHDX' \
    --updatedAtStart 'mV4KpU3V' \
    > test.out 2>&1
eval_tap $? 208 'GetStatistic' test.out

#- 209 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iPTq29do' \
    > test.out 2>&1
eval_tap $? 209 'UnselectAllRecords' test.out

#- 210 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'bdMqcIDg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VPUHclMk' \
    > test.out 2>&1
eval_tap $? 210 'SelectRecord' test.out

#- 211 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'ZOnUUdP4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gKhg9cqY' \
    > test.out 2>&1
eval_tap $? 211 'UnselectRecord' test.out

#- 212 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'flI8J7so' \
    --targetStoreId 'WqFgrBLG' \
    > test.out 2>&1
eval_tap $? 212 'CloneStore' test.out

#- 213 ExportStore
eval_tap 0 213 'ExportStore # SKIP deprecated' test.out

#- 214 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q1iW6eoe' \
    --end 'sjvZADej' \
    --limit '93' \
    --offset '0' \
    --sortBy 'mq8VmlUH' \
    --start 'LrBwHNRX' \
    --success  \
    > test.out 2>&1
eval_tap $? 214 'QueryImportHistory' test.out

#- 215 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WJ2k9g2Q' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'OOxyXs8k' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 215 'ImportStoreByCSV' test.out

#- 216 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'SrOBLE0C' \
    --limit '85' \
    --offset '98' \
    --sku 'cHU01Vv8' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    --userId '59uqfWuw' \
    > test.out 2>&1
eval_tap $? 216 'QuerySubscriptions' test.out

#- 217 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6E7GmmBP' \
    > test.out 2>&1
eval_tap $? 217 'RecurringChargeSubscription' test.out

#- 218 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'GOqGKiA1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetTicketDynamic' test.out

#- 219 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'ljDh42AL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "EvnuhN6i"}' \
    > test.out 2>&1
eval_tap $? 219 'DecreaseTicketSale' test.out

#- 220 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'jAP8C810' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketBoothID' test.out

#- 221 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'vmqzC5tE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 22, "orderNo": "FhzDenUM"}' \
    > test.out 2>&1
eval_tap $? 221 'IncreaseTicketSale' test.out

#- 222 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 23, "currencyCode": "vRbGcmWb", "expireAt": "1975-08-30T00:00:00Z"}, "debitPayload": {"count": 38, "currencyCode": "21gjRwir", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "YwRup9mA", "entitlementOrigin": "System", "itemIdentity": "4u2Kex51", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 32, "entitlementId": "brzNwk4C"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 52, "currencyCode": "j3Y9bZID", "expireAt": "1971-09-06T00:00:00Z"}, "debitPayload": {"count": 43, "currencyCode": "P6DAIH0d", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 12, "entitlementCollectionId": "UklyGkwx", "entitlementOrigin": "Twitch", "itemIdentity": "yviWcQ9I", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "hMlHbyPJ"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 73, "currencyCode": "R91qFqXT", "expireAt": "1979-07-02T00:00:00Z"}, "debitPayload": {"count": 42, "currencyCode": "jSSKh7ik", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 19, "entitlementCollectionId": "Thj0MIFb", "entitlementOrigin": "Xbox", "itemIdentity": "ueT0q89n", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 92, "entitlementId": "YyIhwozw"}, "type": "FULFILL_ITEM"}], "userId": "spUNa87C"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 57, "currencyCode": "ZEM7TiLd", "expireAt": "1973-06-26T00:00:00Z"}, "debitPayload": {"count": 77, "currencyCode": "4zT6TP6L", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 81, "entitlementCollectionId": "VNQJ6qHL", "entitlementOrigin": "System", "itemIdentity": "cgznHu3X", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 33, "entitlementId": "uljXDPEy"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 52, "currencyCode": "jEP4RF71", "expireAt": "1971-07-24T00:00:00Z"}, "debitPayload": {"count": 54, "currencyCode": "PInqEJyi", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 6, "entitlementCollectionId": "gLdrPtlx", "entitlementOrigin": "Steam", "itemIdentity": "L4hJwJKi", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "laFMDupM"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 61, "currencyCode": "kZgqrn2f", "expireAt": "1973-04-29T00:00:00Z"}, "debitPayload": {"count": 72, "currencyCode": "oSQMNzXi", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 69, "entitlementCollectionId": "pcXSjlw6", "entitlementOrigin": "System", "itemIdentity": "xprcggRL", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "VrQVqfhd"}, "type": "FULFILL_ITEM"}], "userId": "1UxMDYax"}, {"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 61, "currencyCode": "jl4Hf9ZM", "expireAt": "1990-04-22T00:00:00Z"}, "debitPayload": {"count": 91, "currencyCode": "EZkqLBII", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 51, "entitlementCollectionId": "L2mOGZN6", "entitlementOrigin": "Nintendo", "itemIdentity": "vsuF66S7", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 1, "entitlementId": "16kOXCDP"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 42, "currencyCode": "dLc3W9PJ", "expireAt": "1988-01-11T00:00:00Z"}, "debitPayload": {"count": 4, "currencyCode": "EbHuOHFb", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 14, "entitlementCollectionId": "BI9DTskq", "entitlementOrigin": "Twitch", "itemIdentity": "nxG8aoh2", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 27, "entitlementId": "CwWbPsoI"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 17, "currencyCode": "aO1c65UM", "expireAt": "1988-12-10T00:00:00Z"}, "debitPayload": {"count": 70, "currencyCode": "UK7kJDzu", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "v8GuHZbD", "entitlementOrigin": "IOS", "itemIdentity": "J6OAjWlZ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "hfNwa9rm"}, "type": "DEBIT_WALLET"}], "userId": "jXRfRUNM"}], "metadata": {"a7Gt3jhI": {}, "5IUnIhLX": {}, "HbpkDMSK": {}}, "needPreCheck": false, "transactionId": "1mMJInV3", "type": "zOOArv5O"}' \
    > test.out 2>&1
eval_tap $? 222 'Commit' test.out

#- 223 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '91' \
    --status 'INIT' \
    --type 'RSqVRVVc' \
    --userId 'KB0ALmWZ' \
    > test.out 2>&1
eval_tap $? 223 'GetTradeHistoryByCriteria' test.out

#- 224 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'UNI2iNdI' \
    > test.out 2>&1
eval_tap $? 224 'GetTradeHistoryByTransactionId' test.out

#- 225 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8vtviNM' \
    --body '{"achievements": [{"id": "UTZIhLby", "value": 50}, {"id": "1edmevML", "value": 11}, {"id": "0PxT5qWQ", "value": 20}], "steamUserId": "uLkYUvgE"}' \
    > test.out 2>&1
eval_tap $? 225 'UnlockSteamUserAchievement' test.out

#- 226 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bkz27l8v' \
    --xboxUserId 'Xg0BKeeH' \
    > test.out 2>&1
eval_tap $? 226 'GetXblUserAchievements' test.out

#- 227 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mM1M0sAb' \
    --body '{"achievements": [{"id": "xkBsoCqM", "percentComplete": 41}, {"id": "aAuyQtwz", "percentComplete": 45}, {"id": "mPA15gms", "percentComplete": 14}], "serviceConfigId": "YOY7T9Hm", "titleId": "I2wApBM8", "xboxUserId": "YkwTPdkF"}' \
    > test.out 2>&1
eval_tap $? 227 'UpdateXblUserAchievement' test.out

#- 228 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'JqTPP6Du' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeCampaign' test.out

#- 229 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALF4Iq4o' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeEntitlement' test.out

#- 230 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'MWciyX38' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeFulfillment' test.out

#- 231 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'YGESEx6q' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeIntegration' test.out

#- 232 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'AlT804Dx' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeOrder' test.out

#- 233 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kb9gm2bb' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizePayment' test.out

#- 234 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPgj7rBp' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeRevocation' test.out

#- 235 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNI6Yz2m' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeSubscription' test.out

#- 236 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'fhUr7AOW' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeWallet' test.out

#- 237 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRD0YPyk' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 237 'GetUserDLCByPlatform' test.out

#- 238 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptcptkk4' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 238 'GetUserDLC' test.out

#- 239 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIUdFbNV' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 'ibhz03t1' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'qqqGeEyq' \
    --features 'p8adcuO0,aJNiAh7j,QTSiDDLG' \
    --fuzzyMatchName  \
    --itemId '6GjKI4ml,yu0npdt0,84CnKMfz' \
    --limit '19' \
    --offset '7' \
    --origin 'Epic' \
    > test.out 2>&1
eval_tap $? 239 'QueryUserEntitlements' test.out

#- 240 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hNPx1gWJ' \
    --body '[{"collectionId": "UUcOA69L", "endDate": "1980-03-04T00:00:00Z", "grantedCode": "ZghFRD2l", "itemId": "2oAO2aWH", "itemNamespace": "aYb80ImN", "language": "uNqI-zsZi", "origin": "Xbox", "quantity": 85, "region": "CCaDy78H", "source": "PURCHASE", "startDate": "1985-06-02T00:00:00Z", "storeId": "YIZYbboY"}, {"collectionId": "nwhjoQf2", "endDate": "1992-11-07T00:00:00Z", "grantedCode": "scfEKpyA", "itemId": "oSD4PLt5", "itemNamespace": "VwIiShhX", "language": "VYQJ", "origin": "Epic", "quantity": 85, "region": "jBfgjI5g", "source": "IAP", "startDate": "1984-09-10T00:00:00Z", "storeId": "jiqkxWjY"}, {"collectionId": "3zP8XNvm", "endDate": "1971-03-22T00:00:00Z", "grantedCode": "9LJGPhDw", "itemId": "tpEBF2ra", "itemNamespace": "vVP7ro9B", "language": "rBI-WJxa-Cp", "origin": "IOS", "quantity": 49, "region": "qKklc4Lg", "source": "PROMOTION", "startDate": "1982-09-08T00:00:00Z", "storeId": "H6AMQuiR"}]' \
    > test.out 2>&1
eval_tap $? 240 'GrantUserEntitlement' test.out

#- 241 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rk0vmahY' \
    --activeOnly  \
    --appId 'IExwiWnw' \
    > test.out 2>&1
eval_tap $? 241 'GetUserAppEntitlementByAppId' test.out

#- 242 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '5hcV9mov' \
    --activeOnly  \
    --limit '93' \
    --offset '3' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 242 'QueryUserEntitlementsByAppType' test.out

#- 243 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3Ed3lgbE' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform '83WWDqbY' \
    --itemId 'jTDnw38P' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementByItemId' test.out

#- 244 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'oeEfwVBX' \
    --ids 'SLrrFtP2,BkCjfhxC,YqdYifqc' \
    --platform 'C0M5alpH' \
    > test.out 2>&1
eval_tap $? 244 'GetUserActiveEntitlementsByItemIds' test.out

#- 245 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '6gEaKB1W' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'gsX0JzRI' \
    --sku '899WtYpP' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementBySku' test.out

#- 246 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIyd1ZQQ' \
    --appIds 'u5uYV2FB,5QBXoIIK,PrErKWNo' \
    --itemIds 'v5LL79S7,lBWUXDv1,SV5O6KGY' \
    --platform 'IwmcOxst' \
    --skus 'Zr2SNsZf,SXvEkyo3,chZvIuX9' \
    > test.out 2>&1
eval_tap $? 246 'ExistsAnyUserActiveEntitlement' test.out

#- 247 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'qRl5v73O' \
    --platform 'xmA0GGnE' \
    --itemIds '0FcAwKIg,7T4vpwQ7,jfBCK5rV' \
    > test.out 2>&1
eval_tap $? 247 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 248 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DV9Rmeqa' \
    --appId 'gWuppVL7' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 249 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'n30IbXic' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'JS5M3shu' \
    --itemId 'rtq2GU9v' \
    > test.out 2>&1
eval_tap $? 249 'GetUserEntitlementOwnershipByItemId' test.out

#- 250 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALMyf25R' \
    --ids 'VtiUChbZ,2Wc7dbdS,yh8U3QF1' \
    --platform 'GFgOCSnj' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementOwnershipByItemIds' test.out

#- 251 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'nn1UIPWb' \
    --entitlementClazz 'APP' \
    --platform 'CRgfdWj4' \
    --sku 'Axggk4js' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipBySku' test.out

#- 252 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'mToVwhkW' \
    > test.out 2>&1
eval_tap $? 252 'RevokeAllEntitlements' test.out

#- 253 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVqPd9ex' \
    --entitlementIds 'qjwrbxrt' \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserEntitlements' test.out

#- 254 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'tsfyPQlp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Op1AVU3o' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlement' test.out

#- 255 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'rA9VoC7J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JUYmQMk2' \
    --body '{"collectionId": "q2tNpUvi", "endDate": "1974-09-30T00:00:00Z", "nullFieldList": ["yB68srRL", "YVZ9X9jN", "1MEyNU9Q"], "origin": "Epic", "reason": "VJaOKAC8", "startDate": "1995-07-17T00:00:00Z", "status": "INACTIVE", "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserEntitlement' test.out

#- 256 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'iNthwxG2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CI6Tf8Mf' \
    --body '{"options": ["YdSMlGqw", "ioM5D5ab", "FzuXIMSx"], "platform": "6o5lxESh", "requestId": "1FaODxH6", "useCount": 23}' \
    > test.out 2>&1
eval_tap $? 256 'ConsumeUserEntitlement' test.out

#- 257 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'PQOqgCck' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CcUlhrTj' \
    > test.out 2>&1
eval_tap $? 257 'DisableUserEntitlement' test.out

#- 258 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'k42K142n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yObsY6zf' \
    > test.out 2>&1
eval_tap $? 258 'EnableUserEntitlement' test.out

#- 259 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'QKOHq6Sk' \
    --namespace "$AB_NAMESPACE" \
    --userId '6POrZM3d' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementHistories' test.out

#- 260 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'XfBvpbwC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPv4FwZZ' \
    > test.out 2>&1
eval_tap $? 260 'RevokeUserEntitlement' test.out

#- 261 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'jiQotn6T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddcpY0YY' \
    --body '{"reason": "wQ1hly5J", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlementByUseCount' test.out

#- 262 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '85cFqafH' \
    --namespace "$AB_NAMESPACE" \
    --userId '0fqmlMRp' \
    --quantity '94' \
    > test.out 2>&1
eval_tap $? 262 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 263 RevokeUseCount
eval_tap 0 263 'RevokeUseCount # SKIP deprecated' test.out

#- 264 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '38pgrlec' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vjTsosqm' \
    --body '{"platform": "Czvorr4i", "requestId": "kT3MH15B", "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 264 'SellUserEntitlement' test.out

#- 265 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qlydZ0HB' \
    --body '{"duration": 79, "endDate": "1976-11-12T00:00:00Z", "entitlementCollectionId": "mp3MMszT", "entitlementOrigin": "System", "itemId": "mzVIoiJx", "itemSku": "3CD2uDQS", "language": "3TeHFCx1", "metadata": {"8IFlI6LM": {}, "0lOkGK1I": {}, "ojWReBwl": {}}, "order": {"currency": {"currencyCode": "ZUkta5kG", "currencySymbol": "TbmBu0uO", "currencyType": "VIRTUAL", "decimals": 68, "namespace": "tIGn8KzA"}, "ext": {"dGX7bScD": {}, "rvwlAMh0": {}, "vktYpeo6": {}}, "free": true}, "orderNo": "yNeIxMOB", "origin": "Other", "overrideBundleItemQty": {"NZNEPqRE": 99, "HtBv5kTz": 59, "ZIkUqDQB": 50}, "quantity": 95, "region": "SvYaZ5WZ", "source": "REDEEM_CODE", "startDate": "1989-01-19T00:00:00Z", "storeId": "vOBUhuq0"}' \
    > test.out 2>&1
eval_tap $? 265 'FulfillItem' test.out

#- 266 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '3Qnua40P' \
    --body '{"code": "QO6ZPVWw", "language": "vdz-eY", "region": "LEhW4NNf"}' \
    > test.out 2>&1
eval_tap $? 266 'RedeemCode' test.out

#- 267 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxu61niK' \
    --body '{"itemId": "H3erjtb9", "itemSku": "Lrx7R5GY", "quantity": 66}' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckFulfillItem' test.out

#- 268 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6HUhGDyK' \
    --body '{"entitlementCollectionId": "LCymS8gg", "entitlementOrigin": "Xbox", "metadata": {"DB3qbyPq": {}, "zXc0CKY4": {}, "0mnFIuE6": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "Gzfbfl7X", "namespace": "spmbcKqe"}, "item": {"itemId": "ZNtsULVJ", "itemName": "kcvfq2JH", "itemSku": "fIsIfm2s", "itemType": "K8ytT9gp"}, "quantity": 76, "type": "CURRENCY"}, {"currency": {"currencyCode": "whrIvvc9", "namespace": "qDv7mv2o"}, "item": {"itemId": "nPoVZFty", "itemName": "OJJyoqmc", "itemSku": "2IXxbHjS", "itemType": "lUuxYS6y"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "D70xYtkH", "namespace": "oSW7OtVj"}, "item": {"itemId": "3OxhtvA8", "itemName": "BsAkgCeU", "itemSku": "F6GaC7jJ", "itemType": "8kkF84pG"}, "quantity": 83, "type": "ITEM"}], "source": "PURCHASE", "transactionId": "7K0qXl9o"}' \
    > test.out 2>&1
eval_tap $? 268 'FulfillRewards' test.out

#- 269 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'doIesVaq' \
    --endTime '8PXqqSIH' \
    --limit '22' \
    --offset '76' \
    --productId 'VhFETRVN' \
    --startTime 'JoWBHlin' \
    --status 'FULFILLED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserIAPOrders' test.out

#- 270 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lzv0J3Zd' \
    > test.out 2>&1
eval_tap $? 270 'QueryAllUserIAPOrders' test.out

#- 271 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'VW8wcMbu' \
    --endTime 'c6Ys8XOg' \
    --limit '60' \
    --offset '31' \
    --startTime 'QT7iTuqF' \
    --status 'FAIL' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPConsumeHistory' test.out

#- 272 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVGhDAvz' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "GvpR-FPYf", "productId": "YURb0ujt", "region": "c6hbJ67K", "transactionId": "0IncB1jK", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 272 'MockFulfillIAPItem' test.out

#- 273 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yx3cFIbu' \
    --discounted  \
    --itemId '1bnhh0nB' \
    --limit '80' \
    --offset '34' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserOrders' test.out

#- 274 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDSfCn0z' \
    --body '{"currencyCode": "RPbC2gop", "currencyNamespace": "E2Gb31VV", "discountCodes": ["ey3nHFgd", "hn0bFEVW", "ZYGm9pgp"], "discountedPrice": 65, "entitlementPlatform": "Nintendo", "ext": {"xfikPXAk": {}, "79jSbx6O": {}, "kV1MDBW8": {}}, "itemId": "COFC6YSy", "language": "rAmEPkLS", "options": {"skipPriceValidation": true}, "platform": "Xbox", "price": 46, "quantity": 89, "region": "hrIIkEnB", "returnUrl": "fN8taqge", "sandbox": false, "sectionId": "HOb9n55M"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminCreateUserOrder' test.out

#- 275 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtaLZEYd' \
    --itemId '9poA9Rgo' \
    > test.out 2>&1
eval_tap $? 275 'CountOfPurchasedItem' test.out

#- 276 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tYLuUeZb' \
    --userId 'jCQfNuqK' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrder' test.out

#- 277 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hxM7Feiq' \
    --userId 'zjkqu1Qn' \
    --body '{"status": "REFUNDING", "statusReason": "ngq0YHh1"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserOrderStatus' test.out

#- 278 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'f7blsPoL' \
    --userId 'UDoBuC9L' \
    > test.out 2>&1
eval_tap $? 278 'FulfillUserOrder' test.out

#- 279 GetUserOrderGrant
eval_tap 0 279 'GetUserOrderGrant # SKIP deprecated' test.out

#- 280 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Mr4GxZ2h' \
    --userId 'F1txDeP9' \
    > test.out 2>&1
eval_tap $? 280 'GetUserOrderHistories' test.out

#- 281 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'y7lFU4Hp' \
    --userId 'Tn8qzngr' \
    --body '{"additionalData": {"cardSummary": "nDxHN6Yx"}, "authorisedTime": "1990-05-31T00:00:00Z", "chargebackReversedTime": "1992-03-12T00:00:00Z", "chargebackTime": "1994-08-29T00:00:00Z", "chargedTime": "1996-08-24T00:00:00Z", "createdTime": "1999-10-08T00:00:00Z", "currency": {"currencyCode": "rG1CHWYV", "currencySymbol": "TrEOT0Nx", "currencyType": "REAL", "decimals": 87, "namespace": "ksI0CIpf"}, "customParameters": {"gM1ns7OW": {}, "lwFOdI7N": {}, "l6IT5iIi": {}}, "extOrderNo": "TWFrnd9s", "extTxId": "B3kXYiq1", "extUserId": "mnpjdjTB", "issuedAt": "1984-05-31T00:00:00Z", "metadata": {"BSfETA6j": "fmIC2CeT", "NnetHs71": "GayeiNEP", "5Coswl51": "oOfnsRTW"}, "namespace": "f4C3Gz3M", "nonceStr": "QxS1YAep", "paymentData": {"discountAmount": 14, "discountCode": "P5Sv1TB3", "subtotalPrice": 28, "tax": 10, "totalPrice": 22}, "paymentMethod": "P2MD9cjH", "paymentMethodFee": 62, "paymentOrderNo": "d6bPEad5", "paymentProvider": "ADYEN", "paymentProviderFee": 65, "paymentStationUrl": "LfoSxpNP", "price": 80, "refundedTime": "1988-10-28T00:00:00Z", "salesTax": 93, "sandbox": false, "sku": "xHtlqDBt", "status": "REFUNDED", "statusReason": "otd4HRVn", "subscriptionId": "Ymz0Vhcx", "subtotalPrice": 84, "targetNamespace": "M3XGDGhx", "targetUserId": "axFaDSZ6", "tax": 10, "totalPrice": 40, "totalTax": 0, "txEndTime": "1981-06-04T00:00:00Z", "type": "f6lKk7z9", "userId": "tsBnKKar", "vat": 100}' \
    > test.out 2>&1
eval_tap $? 281 'ProcessUserOrderNotification' test.out

#- 282 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '39ACImOn' \
    --userId '23w7LmHx' \
    > test.out 2>&1
eval_tap $? 282 'DownloadUserOrderReceipt' test.out

#- 283 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'OH1TShA2' \
    --body '{"currencyCode": "6EApPmco", "currencyNamespace": "2h7mFKOC", "customParameters": {"l0bOwdyO": {}, "KBJippGw": {}, "ULsnHeQb": {}}, "description": "cQvIVqhx", "extOrderNo": "jzwhDv9K", "extUserId": "ARcR9LNw", "itemType": "OPTIONBOX", "language": "Ye-nGje", "metadata": {"dqPvOX6x": "ffOWLkNG", "YIlCoc8C": "xcTAmv8t", "O47OSmPN": "phJOtC7u"}, "notifyUrl": "i0MoqLKz", "omitNotification": true, "platform": "VLkRPLnX", "price": 31, "recurringPaymentOrderNo": "15YCuxoC", "region": "Ql42XtSk", "returnUrl": "qBcaR8qj", "sandbox": false, "sku": "tv7NQyDi", "subscriptionId": "GRfiYmnZ", "title": "ZX4puGqc"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserPaymentOrder' test.out

#- 284 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lJmRo4xr' \
    --userId 'kMfbqoYs' \
    --body '{"description": "s1Jdwf0r"}' \
    > test.out 2>&1
eval_tap $? 284 'RefundUserPaymentOrder' test.out

#- 285 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'M1rbWxW6' \
    > test.out 2>&1
eval_tap $? 285 'GetUserPlatformAccountClosureHistories' test.out

#- 286 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4TxdaJU' \
    --body '{"code": "KjeHHWYi", "orderNo": "zCCZdtww"}' \
    > test.out 2>&1
eval_tap $? 286 'ApplyUserRedemption' test.out

#- 287 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3iDNVb3' \
    --body '{"meta": {"JgP6geDq": {}, "WkkYDT4y": {}, "JhPfbzpI": {}}, "reason": "3DkHWZiQ", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "oM6cXGON", "namespace": "aJxlFjQH"}, "entitlement": {"entitlementId": "wH0sqC6C"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "vJ8kBIjL", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 62, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "GM55OjUL", "namespace": "big4iCpy"}, "entitlement": {"entitlementId": "2KDSmA3M"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "WlW0HhS3", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "DNXqzFSN", "namespace": "J1eDcdq2"}, "entitlement": {"entitlementId": "Vy1Dv24f"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "C9lQ0g6F", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 48, "type": "CURRENCY"}], "source": "ORDER", "transactionId": "hDJmItCm"}' \
    > test.out 2>&1
eval_tap $? 287 'DoRevocation' test.out

#- 288 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'jjuwkgy4' \
    --body '{"gameSessionId": "DkhGLx54", "payload": {"VqgfogTg": {}, "wPjhdBHh": {}, "ep3RM5XF": {}}, "scid": "gQqYTD2X", "sessionTemplateName": "km9Bm3kD"}' \
    > test.out 2>&1
eval_tap $? 288 'RegisterXblSessions' test.out

#- 289 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNmYDaUa' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'RtkK23xL' \
    --limit '21' \
    --offset '84' \
    --sku 'gFioxTpg' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 289 'QueryUserSubscriptions' test.out

#- 290 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'jcsrHoBl' \
    --excludeSystem  \
    --limit '92' \
    --offset '30' \
    --subscriptionId 'rwaeNT5o' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionActivities' test.out

#- 291 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjlCMzEB' \
    --body '{"grantDays": 68, "itemId": "0D74U3gd", "language": "p9PZxw9H", "reason": "3kH7fHJk", "region": "3kxe2A5W", "source": "ZbevVaYQ"}' \
    > test.out 2>&1
eval_tap $? 291 'PlatformSubscribeSubscription' test.out

#- 292 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nsPMV3bC' \
    --itemId 'vA6VgCIX' \
    > test.out 2>&1
eval_tap $? 292 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 293 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yqndairT' \
    --userId 'mOaGpITd' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscription' test.out

#- 294 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3zQtXtgo' \
    --userId 'Knb93UpS' \
    > test.out 2>&1
eval_tap $? 294 'DeleteUserSubscription' test.out

#- 295 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'X8xTh2Di' \
    --userId 'Jj0TCWwf' \
    --force  \
    --body '{"immediate": true, "reason": "ogLd9ZGd"}' \
    > test.out 2>&1
eval_tap $? 295 'CancelSubscription' test.out

#- 296 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4unKPPxb' \
    --userId '7ey8zJqx' \
    --body '{"grantDays": 79, "reason": "f2plqINd"}' \
    > test.out 2>&1
eval_tap $? 296 'GrantDaysToSubscription' test.out

#- 297 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'O7IOtJcz' \
    --userId '0jXFYA1j' \
    --excludeFree  \
    --limit '48' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 297 'GetUserSubscriptionBillingHistories' test.out

#- 298 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pwYBkCE2' \
    --userId 'Qngut3Zu' \
    --body '{"additionalData": {"cardSummary": "2Ztf6TRW"}, "authorisedTime": "1987-01-02T00:00:00Z", "chargebackReversedTime": "1988-12-20T00:00:00Z", "chargebackTime": "1981-05-02T00:00:00Z", "chargedTime": "1983-03-22T00:00:00Z", "createdTime": "1998-10-26T00:00:00Z", "currency": {"currencyCode": "nEKHWDtu", "currencySymbol": "K7obrGUX", "currencyType": "REAL", "decimals": 5, "namespace": "lbuFdXn6"}, "customParameters": {"ceu0IpHT": {}, "nk3Up0a5": {}, "8nYrUrC8": {}}, "extOrderNo": "cZfJF0Nj", "extTxId": "SqE6BqUP", "extUserId": "owNc5ufq", "issuedAt": "1985-10-15T00:00:00Z", "metadata": {"1Iz7YViZ": "DpSwFIMn", "mrSKD9ss": "vAVySViv", "8b9r4i99": "r9LVbExi"}, "namespace": "w9Me60ic", "nonceStr": "Rt14iLU5", "paymentData": {"discountAmount": 3, "discountCode": "tbwqAYTb", "subtotalPrice": 84, "tax": 27, "totalPrice": 4}, "paymentMethod": "vMCV2Lte", "paymentMethodFee": 2, "paymentOrderNo": "BwVzIhrj", "paymentProvider": "XSOLLA", "paymentProviderFee": 29, "paymentStationUrl": "mcg3ExIZ", "price": 57, "refundedTime": "1988-12-22T00:00:00Z", "salesTax": 9, "sandbox": false, "sku": "1gKB2um5", "status": "CHARGEBACK", "statusReason": "SpH6TZnJ", "subscriptionId": "Yzc0EEI3", "subtotalPrice": 91, "targetNamespace": "pW877Ohj", "targetUserId": "Rls73Hyg", "tax": 36, "totalPrice": 6, "totalTax": 63, "txEndTime": "1991-07-20T00:00:00Z", "type": "3gOKmve7", "userId": "uZ5What8", "vat": 23}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserSubscriptionNotification' test.out

#- 299 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'uLQFnnKq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I7d6vH8b' \
    --body '{"count": 18, "orderNo": "XZ0a9YiY"}' \
    > test.out 2>&1
eval_tap $? 299 'AcquireUserTicket' test.out

#- 300 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'QLxubUEj' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserCurrencyWallets' test.out

#- 301 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode '8l3kjUez' \
    --namespace "$AB_NAMESPACE" \
    --userId '4v7EIjtf' \
    --body '{"allowOverdraft": true, "amount": 29, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"qn8sH4um": {}, "XR02XrB5": {}, "86a5QvUE": {}}, "reason": "tFg65TYC"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitUserWalletByCurrencyCode' test.out

#- 302 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'RcRGk3MU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vIMIUks1' \
    --limit '15' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 302 'ListUserCurrencyTransactions' test.out

#- 303 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'VTEhWbnW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHH4wIGz' \
    --request '{"amount": 13, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"y7wE0vHy": {}, "6XVYA63L": {}, "JV5uwOKE": {}}, "reason": "kRXIUvxQ", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 303 'CheckBalance' test.out

#- 304 CheckWallet
eval_tap 0 304 'CheckWallet # SKIP deprecated' test.out

#- 305 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'SZurwzZs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jgxNrP6K' \
    --body '{"amount": 50, "expireAt": "1990-10-14T00:00:00Z", "metadata": {"xRRSNv7M": {}, "ZvxjASMB": {}, "IaH0wGPM": {}}, "origin": "Steam", "reason": "MDBTllLX", "source": "REFUND"}' \
    > test.out 2>&1
eval_tap $? 305 'CreditUserWallet' test.out

#- 306 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode '0tArX2k3' \
    --namespace "$AB_NAMESPACE" \
    --userId '8P04zjqj' \
    --request '{"amount": 15, "debitBalanceSource": "PAYMENT", "metadata": {"leMlEmrG": {}, "hPAeAzx3": {}, "yFy5aGV4": {}}, "reason": "pje1P84D", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 306 'DebitByWalletPlatform' test.out

#- 307 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'UZgr5IxW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLyoAYUQ' \
    --body '{"amount": 90, "metadata": {"paAa86C9": {}, "SO8PFeoP": {}, "n9n4rhBw": {}}, "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 307 'PayWithUserWallet' test.out

#- 308 GetUserWallet
eval_tap 0 308 'GetUserWallet # SKIP deprecated' test.out

#- 309 DebitUserWallet
eval_tap 0 309 'DebitUserWallet # SKIP deprecated' test.out

#- 310 DisableUserWallet
eval_tap 0 310 'DisableUserWallet # SKIP deprecated' test.out

#- 311 EnableUserWallet
eval_tap 0 311 'EnableUserWallet # SKIP deprecated' test.out

#- 312 ListUserWalletTransactions
eval_tap 0 312 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 313 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '8a3XAP7J' \
    > test.out 2>&1
eval_tap $? 313 'ListViews' test.out

#- 314 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FeyjSutO' \
    --body '{"displayOrder": 27, "localizations": {"RqlNcVLM": {"description": "2pAGq5zP", "localExt": {"ICabGWGI": {}, "xM3GYQle": {}, "izFXTxBp": {}}, "longDescription": "zTj8O5gM", "title": "t3ADGhpV"}, "heXFNl56": {"description": "g8Rl3FCC", "localExt": {"NWIrsQ76": {}, "JQjomS86": {}, "rcSxunuU": {}}, "longDescription": "riVFLahc", "title": "8vM0bNIW"}, "mENv3hdk": {"description": "QmPTTEsA", "localExt": {"c5hpmgE9": {}, "D7GWGf5x": {}, "Qh07oKOn": {}}, "longDescription": "Cb7noL1M", "title": "l2wlso3J"}}, "name": "VcyEqRvV"}' \
    > test.out 2>&1
eval_tap $? 314 'CreateView' test.out

#- 315 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'IWRqgkkl' \
    --storeId '3hHhf5Dx' \
    > test.out 2>&1
eval_tap $? 315 'GetView' test.out

#- 316 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'euec4Oh2' \
    --storeId 'ZPjJ6Yaf' \
    --body '{"displayOrder": 79, "localizations": {"KF5P2tvG": {"description": "BFXy27Fl", "localExt": {"KcZlsJDj": {}, "AaiiyeK4": {}, "RQHaaWH0": {}}, "longDescription": "CmJ43Epz", "title": "wlUK7Ln5"}, "kSXOafYO": {"description": "vgPswurk", "localExt": {"t9blSZZO": {}, "6tD2qtCO": {}, "k7F3vQJN": {}}, "longDescription": "WECU1wxi", "title": "SvivcyeS"}, "CAxnmUWp": {"description": "sa763RO0", "localExt": {"rXMoQozl": {}, "3WqP6kUm": {}, "VZEWyW5F": {}}, "longDescription": "66y1ym2u", "title": "i3FSDXsb"}}, "name": "x8X1G9V5"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateView' test.out

#- 317 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'u0HzuIs1' \
    --storeId 'LAmXr4uC' \
    > test.out 2>&1
eval_tap $? 317 'DeleteView' test.out

#- 318 QueryWallets
eval_tap 0 318 'QueryWallets # SKIP deprecated' test.out

#- 319 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 96, "expireAt": "1998-10-06T00:00:00Z", "metadata": {"AttmqpuY": {}, "uliViYBy": {}, "YqbNj7fC": {}}, "origin": "Steam", "reason": "R7Bd5DFb", "source": "IAP"}, "currencyCode": "T5ey915r", "userIds": ["Mk51qd4o", "vpEUXFqE", "R7coCFwt"]}, {"creditRequest": {"amount": 95, "expireAt": "1999-05-16T00:00:00Z", "metadata": {"xeVJBlW5": {}, "uzBfydZj": {}, "OaX8JiwD": {}}, "origin": "Twitch", "reason": "gXUqpHUg", "source": "REFUND"}, "currencyCode": "w4xzPoO6", "userIds": ["3vP6NAdI", "S8rL16HV", "O0Z9SP1B"]}, {"creditRequest": {"amount": 48, "expireAt": "1990-02-20T00:00:00Z", "metadata": {"SsEPtidb": {}, "71rLdD2F": {}, "PE18ZBKY": {}}, "origin": "Oculus", "reason": "1XOswSO3", "source": "ACHIEVEMENT"}, "currencyCode": "6k8QTt9s", "userIds": ["eGlxs7Pi", "bF2JFDC3", "xJQqN9fr"]}]' \
    > test.out 2>&1
eval_tap $? 319 'BulkCredit' test.out

#- 320 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "sPuVsnlq", "request": {"allowOverdraft": false, "amount": 31, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"fdVkjCfb": {}, "hpxBlSgY": {}, "r2fVvuP8": {}}, "reason": "Qp4ZHl6t"}, "userIds": ["4pN5w4zQ", "v2TzNGCV", "YBAI56GH"]}, {"currencyCode": "l0fscFvf", "request": {"allowOverdraft": false, "amount": 68, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"wsQwusId": {}, "RTkCIbhK": {}, "wcrKxv7o": {}}, "reason": "WD7nWsRU"}, "userIds": ["4e15QazV", "Mi2FUEbT", "k5cdybHy"]}, {"currencyCode": "JJCwhNrp", "request": {"allowOverdraft": false, "amount": 78, "balanceOrigin": "Nintendo", "balanceSource": "IAP_REVOCATION", "metadata": {"tDRGtsqp": {}, "cjSNTa96": {}, "I7WbKxXy": {}}, "reason": "55Ntr7u7"}, "userIds": ["884YOTKa", "DrE8lBun", "Rx7chDft"]}]' \
    > test.out 2>&1
eval_tap $? 320 'BulkDebit' test.out

#- 321 GetWallet
eval_tap 0 321 'GetWallet # SKIP deprecated' test.out

#- 322 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'QvXqCtY3' \
    --end 'XeYeIVDx' \
    --start 'iSsdJ9BS' \
    > test.out 2>&1
eval_tap $? 322 'SyncOrders' test.out

#- 323 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["7gI54UPQ", "NFCMyYf2", "2oVlhunk"], "apiKey": "t8fKbiIz", "authoriseAsCapture": false, "blockedPaymentMethods": ["qcETdFlF", "9qMH2UVe", "TMxePa1s"], "clientKey": "o6j7IHyp", "dropInSettings": "vInUfGhm", "liveEndpointUrlPrefix": "hQz6cTOt", "merchantAccount": "6ZhY1X8d", "notificationHmacKey": "HaICpMbF", "notificationPassword": "f9euqHpo", "notificationUsername": "Ws4jQTCM", "returnUrl": "cahgNTwr", "settings": "pbNwwjCm"}' \
    > test.out 2>&1
eval_tap $? 323 'TestAdyenConfig' test.out

#- 324 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "3SgcOYOX", "privateKey": "S4zJPzpg", "publicKey": "cNieWucj", "returnUrl": "huK8Xtx0"}' \
    > test.out 2>&1
eval_tap $? 324 'TestAliPayConfig' test.out

#- 325 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "GMXv9eyx", "secretKey": "kBjTEFem"}' \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfig' test.out

#- 326 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Dx09ppvP' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentMerchantConfig' test.out

#- 327 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "GiY1MPyR", "webhookSecretKey": "5MHOsF2x"}' \
    > test.out 2>&1
eval_tap $? 327 'TestNeonPayConfig' test.out

#- 328 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "PQ9rUF2O", "clientSecret": "W18qpcKB", "returnUrl": "r0s1BzNn", "webHookId": "zYF5LrhL"}' \
    > test.out 2>&1
eval_tap $? 328 'TestPayPalConfig' test.out

#- 329 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["K7oBXJMy", "eXShPdGc", "er8HxnSf"], "publishableKey": "vHfNVLVI", "secretKey": "xY2sWj0p", "webhookSecret": "kQbsh3qg"}' \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfig' test.out

#- 330 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "nIbdCB47", "key": "nKPXJ0FE", "mchid": "WaiXVvaQ", "returnUrl": "BCiFMpWi"}' \
    > test.out 2>&1
eval_tap $? 330 'TestWxPayConfig' test.out

#- 331 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "L9yIZA7Y", "flowCompletionUrl": "CBCBdOZD", "merchantId": 21, "projectId": 60, "projectSecretKey": "kSNmn6eB"}' \
    > test.out 2>&1
eval_tap $? 331 'TestXsollaConfig' test.out

#- 332 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'xHDS0QtR' \
    > test.out 2>&1
eval_tap $? 332 'GetPaymentMerchantConfig1' test.out

#- 333 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'HbnA6Ilh' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Qy2hBMG7", "hQ7NwR1v", "Aw3YQj9v"], "apiKey": "N2CSvDQ9", "authoriseAsCapture": true, "blockedPaymentMethods": ["EzJ8ao8e", "AqZ7307B", "HyQkUoZr"], "clientKey": "Lx2uMABS", "dropInSettings": "ZD3qWMlD", "liveEndpointUrlPrefix": "wIV4cpfq", "merchantAccount": "2OdHMpa6", "notificationHmacKey": "IvVLAtn3", "notificationPassword": "6VZZqOgB", "notificationUsername": "Y6V5Fov0", "returnUrl": "lJilJmkn", "settings": "c9kiVeGo"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateAdyenConfig' test.out

#- 334 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'VvuNX7Wg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestAdyenConfigById' test.out

#- 335 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'V10LzM29' \
    --sandbox  \
    --validate  \
    --body '{"appId": "VaeiOKGS", "privateKey": "1cFBzQvu", "publicKey": "LyiKqypi", "returnUrl": "p9vhXcZb"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAliPayConfig' test.out

#- 336 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'c9mRv52K' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAliPayConfigById' test.out

#- 337 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'XQJggt4t' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "8mWWKXbz", "secretKey": "FwaGc8Fq"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateCheckoutConfig' test.out

#- 338 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'qFFEZmTi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestCheckoutConfigById' test.out

#- 339 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id '6N277r5W' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "QP5CuQPe", "webhookSecretKey": "Rs2InhNK"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateNeonPayConfig' test.out

#- 340 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'qTwFeIlC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestNeonPayConfigById' test.out

#- 341 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'tewPV915' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "nhaaleDK", "clientSecret": "FmvhiVsD", "returnUrl": "2gHwfbM3", "webHookId": "XexRu6LF"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePayPalConfig' test.out

#- 342 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'UgdCu6Hs' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfigById' test.out

#- 343 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '4CcTerf9' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["kR2eLDai", "L86S3iQD", "YqLozmrx"], "publishableKey": "2et25Ci3", "secretKey": "EXEiQ3jN", "webhookSecret": "WLlNdeLF"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateStripeConfig' test.out

#- 344 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'X3Z6vLiB' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestStripeConfigById' test.out

#- 345 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'Zcp6Wy06' \
    --validate  \
    --body '{"appId": "lV2qJqXO", "key": "ZD6ZiAuo", "mchid": "0fANp0OP", "returnUrl": "JUOTGpAy"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWxPayConfig' test.out

#- 346 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'BwrG0NPW' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 346 'UpdateWxPayConfigCert' test.out

#- 347 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'GwaBQCJx' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfigById' test.out

#- 348 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'mPh7gSt1' \
    --validate  \
    --body '{"apiKey": "MnqFQo3m", "flowCompletionUrl": "af9MJJ7d", "merchantId": 30, "projectId": 98, "projectSecretKey": "bKmTINVF"}' \
    > test.out 2>&1
eval_tap $? 348 'UpdateXsollaConfig' test.out

#- 349 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'h0UsOlyw' \
    > test.out 2>&1
eval_tap $? 349 'TestXsollaConfigById' test.out

#- 350 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'VBkbcEbB' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaUIConfig' test.out

#- 351 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '77' \
    --namespace "$AB_NAMESPACE" \
    --offset '87' \
    --region 'Cu3l9oKU' \
    > test.out 2>&1
eval_tap $? 351 'QueryPaymentProviderConfig' test.out

#- 352 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "wYpH9NvX", "region": "crcUGDr5", "sandboxTaxJarApiToken": "Zx3Teeim", "specials": ["ALIPAY", "WALLET", "XSOLLA"], "taxJarApiToken": "EWO0ruuA", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 352 'CreatePaymentProviderConfig' test.out

#- 353 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 353 'GetAggregatePaymentProviders' test.out

#- 354 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'uLbJOD5W' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentProviderConfig' test.out

#- 355 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetSpecialPaymentProviders' test.out

#- 356 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'sDgFl3Gq' \
    --body '{"aggregate": "STRIPE", "namespace": "Gv1LWS15", "region": "LRVeTyWf", "sandboxTaxJarApiToken": "z2NZX9ga", "specials": ["WALLET", "WXPAY", "PAYPAL"], "taxJarApiToken": "C1OAIRdm", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 356 'UpdatePaymentProviderConfig' test.out

#- 357 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'P6dv3hgX' \
    > test.out 2>&1
eval_tap $? 357 'DeletePaymentProviderConfig' test.out

#- 358 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 358 'GetPaymentTaxConfig' test.out

#- 359 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "VfRXz9hH", "taxJarApiToken": "55b3XDa9", "taxJarEnabled": true, "taxJarProductCodesMapping": {"VUnroZGF": "kE82tZq4", "hIhq91qq": "B0nQx9Zq", "fH0lGL7V": "NDdRVVjc"}}' \
    > test.out 2>&1
eval_tap $? 359 'UpdatePaymentTaxConfig' test.out

#- 360 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'sTszKx5w' \
    --end 'kaC9CSB3' \
    --start 'LwnPItvH' \
    > test.out 2>&1
eval_tap $? 360 'SyncPaymentOrders' test.out

#- 361 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'TP2WQm1h' \
    --storeId 'nfwgbmCm' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetRootCategories' test.out

#- 362 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '2V4JoVKR' \
    --storeId 'KjmTs4nW' \
    > test.out 2>&1
eval_tap $? 362 'DownloadCategories' test.out

#- 363 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'KZgV3IVR' \
    --namespace "$AB_NAMESPACE" \
    --language 'bj0nQheE' \
    --storeId 'GQkX5kk5' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetCategory' test.out

#- 364 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '0BI7A2da' \
    --namespace "$AB_NAMESPACE" \
    --language '79nrf1Pv' \
    --storeId 'j1mNcskB' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetChildCategories' test.out

#- 365 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '32JI4dY0' \
    --namespace "$AB_NAMESPACE" \
    --language '4ABrJuyp' \
    --storeId 'TY6CQFUA' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetDescendantCategories' test.out

#- 366 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 366 'PublicListCurrencies' test.out

#- 367 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 367 'GeDLCDurableRewardShortMap' test.out

#- 368 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 368 'GetIAPItemMapping' test.out

#- 369 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'kxbv0vFa' \
    --region 'zURRIICM' \
    --storeId 'HPQsWLqz' \
    --appId 'cEEIKFu3' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemByAppId' test.out

#- 370 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'M8WvBCBv' \
    --categoryPath 'DtnnHM4C' \
    --features '8uobcg89' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --language 's2I6xUoD' \
    --limit '59' \
    --offset '53' \
    --region 'jNYxXN07' \
    --sortBy 'displayOrder:asc,displayOrder:desc,createdAt:asc' \
    --storeId 'bNuZGPPP' \
    --tags 'dquCdzCH' \
    > test.out 2>&1
eval_tap $? 370 'PublicQueryItems' test.out

#- 371 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'LVkzqtTQ' \
    --region 'ZGkPoJPo' \
    --storeId 'y8lLtVve' \
    --sku 'admzr7iP' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemBySku' test.out

#- 372 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '7xaWZ22s' \
    --storeId 'dv7VEB7U' \
    --itemIds 'debHiF5w' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetEstimatedPrice' test.out

#- 373 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'df0r0ZmS' \
    --region 'oxmPJ4U0' \
    --storeId 'SX1Uc3ex' \
    --itemIds 'FGI625lB' \
    > test.out 2>&1
eval_tap $? 373 'PublicBulkGetItems' test.out

#- 374 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["nEQjRpYa", "K7vHNDBV", "0jFKVPg4"]}' \
    > test.out 2>&1
eval_tap $? 374 'PublicValidateItemPurchaseCondition' test.out

#- 375 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'SUBSCRIPTION' \
    --limit '11' \
    --offset '12' \
    --region 'APr1k5BF' \
    --storeId 'hxuHuHSE' \
    --keyword 'uEUdGBYg' \
    --language 'HPgFfsgJ' \
    > test.out 2>&1
eval_tap $? 375 'PublicSearchItems' test.out

#- 376 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'KlcYjmzR' \
    --namespace "$AB_NAMESPACE" \
    --language 'tzKKI7nn' \
    --region 'WpISepXM' \
    --storeId 'sCYGE7Vx' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetApp' test.out

#- 377 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'sWJByrvY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicGetItemDynamicData' test.out

#- 378 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'Df5lkPWh' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'BmbYDAzh' \
    --populateBundle  \
    --region 'OdCZshJj' \
    --storeId 's0dbicL7' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetItem' test.out

#- 379 GetPaymentCustomization
eval_tap 0 379 'GetPaymentCustomization # SKIP deprecated' test.out

#- 380 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "Yfq0ZyBs", "successUrl": "2F055Ie3"}, "paymentOrderNo": "GcjOTmZ8", "paymentProvider": "NEONPAY", "returnUrl": "FOyQTXXP", "ui": "jGIVClrT", "zipCode": "v2J5U4Oy"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetPaymentUrl' test.out

#- 381 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fGIwpwTo' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetPaymentMethods' test.out

#- 382 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BImxtQkC' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUnpaidPaymentOrder' test.out

#- 383 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BDFjwoE4' \
    --paymentProvider 'WXPAY' \
    --zipCode 'b3bB3hUY' \
    --body '{"token": "nkiviqHS"}' \
    > test.out 2>&1
eval_tap $? 383 'Pay' test.out

#- 384 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'K9Mjm99O' \
    > test.out 2>&1
eval_tap $? 384 'PublicCheckPaymentOrderPaidStatus' test.out

#- 385 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 's92SDBmH' \
    > test.out 2>&1
eval_tap $? 385 'GetPaymentPublicConfig' test.out

#- 386 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'DLvryapP' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetQRCode' test.out

#- 387 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'gAoqLIxn' \
    --foreinginvoice '75KtNoWv' \
    --invoiceId 'M9WdjqAw' \
    --payload 'Mpno7Vwn' \
    --redirectResult 'WtIfCiwr' \
    --resultCode 'jOGm8E7A' \
    --sessionId 'EBILNvby' \
    --status 'pdFWEzmA' \
    --token 'cekotuqM' \
    --type 'HxrfGs81' \
    --userId 'iPRb2TpI' \
    --orderNo '1VkegLVY' \
    --paymentOrderNo 'aEYM7DX1' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'kGWZGs9q' \
    > test.out 2>&1
eval_tap $? 387 'PublicNormalizePaymentReturnUrl' test.out

#- 388 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'WixP4oK3' \
    --paymentOrderNo 'O6HxXHO4' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxValue' test.out

#- 389 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bIppYeDN' \
    > test.out 2>&1
eval_tap $? 389 'GetRewardByCode' test.out

#- 390 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'UBlVlv0l' \
    --limit '80' \
    --offset '87' \
    --sortBy 'rewardCode:desc,namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 390 'QueryRewards1' test.out

#- 391 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'byOLTbFS' \
    > test.out 2>&1
eval_tap $? 391 'GetReward1' test.out

#- 392 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicListStores' test.out

#- 393 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ZSp35aKc,HNhcdNnv,3V10DX03' \
    --itemIds 'BtwuFvqe,WIwvnaif,AxS5GPXR' \
    --skus '5BDd0PLe,lLLKc68P,uPcEdQIy' \
    > test.out 2>&1
eval_tap $? 393 'PublicExistsAnyMyActiveEntitlement' test.out

#- 394 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '3B7r5pfs' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 395 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'MAP0QQQT' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 396 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'fboVsFb2' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 397 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'QBIv4pER,aSYtdnSb,JbXVkj7t' \
    --itemIds 'tSyMrBSj,gg1EhB1g,CvpAukKT' \
    --skus 'm3KNLlWf,SSZGg2Vz,zAp0zRsK' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetEntitlementOwnershipToken' test.out

#- 398 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "D6NYZYEC", "language": "zXj", "region": "SoM0SsCR"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncTwitchDropsEntitlement' test.out

#- 399 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'vpJPoraU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyWallet' test.out

#- 400 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'DK0JFBnK' \
    --body '{"epicGamesJwtToken": "kBdjVgnd"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncEpicGameDLC' test.out

#- 401 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'moLwzpgp' \
    > test.out 2>&1
eval_tap $? 401 'SyncOculusDLC' test.out

#- 402 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'nakICkdv' \
    --body '{"serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 402 'PublicSyncPsnDlcInventory' test.out

#- 403 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOoZtURK' \
    --body '{"serviceLabels": [19, 54, 55]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 404 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeEmAWnP' \
    --body '{"appId": "cxfzgPLi", "steamId": "nlqdfaBs"}' \
    > test.out 2>&1
eval_tap $? 404 'SyncSteamDLC' test.out

#- 405 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '3hUAtIEk' \
    --body '{"xstsToken": "6XlexMN4"}' \
    > test.out 2>&1
eval_tap $? 405 'SyncXboxDLC' test.out

#- 406 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zJSM5vLJ' \
    --appType 'DEMO' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'whHTphcs' \
    --features 'lIH8RYOi,1RUHDJLB,t3ScLuHx' \
    --itemId 'yX2Fy1tD,DK3JyutT,SifYybQG' \
    --limit '85' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 406 'PublicQueryUserEntitlements' test.out

#- 407 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppRNXuGI' \
    --appId 'gZOiEFlO' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementByAppId' test.out

#- 408 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqG2RINd' \
    --limit '61' \
    --offset '74' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlementsByAppType' test.out

#- 409 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1TEp2vR' \
    --availablePlatformOnly  \
    --ids 'ccLIQx87,FN3L3cxq,FuNfkCw0' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementsByIds' test.out

#- 410 PublicGetUserEntitlementByItemId
eval_tap 0 410 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 411 PublicGetUserEntitlementBySku
eval_tap 0 411 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 412 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'xXhP48Ks' \
    --endDate 'mOWsq7cj' \
    --entitlementClazz 'OPTIONBOX' \
    --limit '60' \
    --offset '66' \
    --startDate 'GFTFBfFJ' \
    > test.out 2>&1
eval_tap $? 412 'PublicUserEntitlementHistory' test.out

#- 413 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'plBtcG1K' \
    --appIds 'l9xHe8uH,2JB1pxGF,ybOeO6kD' \
    --itemIds 'lYBS1Gn7,CSX7pxSp,NIjOx1W8' \
    --skus 'K0Aw62h2,yJFlNyyP,LjPo3QXu' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyUserActiveEntitlement' test.out

#- 414 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ghd4qbJV' \
    --appId 'WPb5aNLl' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEFLBhYd' \
    --entitlementClazz 'APP' \
    --itemId 'KFrv345x' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 416 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '0U8lOal0' \
    --ids 'Yuzjo4ht,XyL95xU0,944ud3IH' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 417 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEmTAvG1' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'n67gyCah' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 418 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'MdurpscG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'elCceGRr' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlement' test.out

#- 419 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'j5YTPQCA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHlYii6W' \
    --body '{"options": ["zJXgoMvm", "SEw3FGZR", "FR8zPJHa"], "requestId": "PCjrZjSy", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 419 'PublicConsumeUserEntitlement' test.out

#- 420 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId '0lBx2LKx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jcPTB2k0' \
    --body '{"requestId": "qOn2SijP", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSellUserEntitlement' test.out

#- 421 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'S4TE4YeZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ct2RHUd0' \
    --body '{"useCount": 17}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSplitUserEntitlement' test.out

#- 422 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '2nrX42WW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DgCgvn9z' \
    --body '{"entitlementId": "keAj4VLS", "useCount": 45}' \
    > test.out 2>&1
eval_tap $? 422 'PublicTransferUserEntitlement' test.out

#- 423 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'hL1y8pP0' \
    --body '{"code": "8K69Jgzx", "language": "jxE_FJBO", "region": "wBEELt8r"}' \
    > test.out 2>&1
eval_tap $? 423 'PublicRedeemCode' test.out

#- 424 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8VKNLF3E' \
    --body '{"excludeOldTransactions": true, "language": "ac-djTN-bE", "productId": "T3y51Bu1", "receiptData": "cUkO0M5x", "region": "4UMtNHy7", "transactionId": "Hh6W3k85"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicFulfillAppleIAPItem' test.out

#- 425 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1X5Ap96' \
    --body '{"epicGamesJwtToken": "Q1NsyP2p"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncEpicGamesInventory' test.out

#- 426 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXNdg4Qy' \
    --body '{"autoAck": false, "language": "gg_BlGu-NH", "orderId": "QSvjrpiy", "packageName": "QhO4wpQR", "productId": "lKG5ARTl", "purchaseTime": 76, "purchaseToken": "NHKLcGdG", "region": "O3cNxdcL"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillGoogleIAPItem' test.out

#- 427 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kco00rKQ' \
    > test.out 2>&1
eval_tap $? 427 'SyncOculusConsumableEntitlements' test.out

#- 428 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAKTWKrU' \
    --body '{"currencyCode": "W1mhNBQj", "price": 0.9771345577735008, "productId": "uPmqZuOd", "serviceLabel": 52}' \
    > test.out 2>&1
eval_tap $? 428 'PublicReconcilePlayStationStore' test.out

#- 429 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kc6IjSzf' \
    --body '{"currencyCode": "xDmJNVGr", "price": 0.862453903116917, "productId": "G0IWQrBB", "serviceLabels": [0, 9, 18]}' \
    > test.out 2>&1
eval_tap $? 429 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 430 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKPXmbTA' \
    --body '{"appId": "KHgGWADc", "currencyCode": "8iZRtfa3", "language": "sh_hAIF-Re", "price": 0.6782671077903667, "productId": "aAtk9WJj", "region": "SfNEJmfT", "steamId": "70LysYRs"}' \
    > test.out 2>&1
eval_tap $? 430 'SyncSteamInventory' test.out

#- 431 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8pIgDQZ' \
    --body '{"gameId": "FO5jqXaA", "language": "PfG", "region": "76wmTrGb"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncTwitchDropsEntitlement1' test.out

#- 432 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zvr3RpMk' \
    --body '{"currencyCode": "iFIxuPR9", "price": 0.5376837024391934, "productId": "n6rOoUGZ", "xstsToken": "23D97dnb"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncXboxInventory' test.out

#- 433 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9aARqCF' \
    --discounted  \
    --itemId 'uE7wrmUM' \
    --limit '57' \
    --offset '67' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 433 'PublicQueryUserOrders' test.out

#- 434 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDxgeV8w' \
    --body '{"currencyCode": "QJkwoMsV", "discountCodes": ["QY2G1YtH", "MeV5WVFW", "UlNtvXlL"], "discountedPrice": 35, "ext": {"ZuAuQXXW": {}, "8kRVjOS6": {}, "qkoDw0XR": {}}, "itemId": "nA182zSa", "language": "OBO-ST", "price": 21, "quantity": 96, "region": "HexVEOIt", "returnUrl": "BwESudNC", "sectionId": "CdhsFl82"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicCreateUserOrder' test.out

#- 435 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'jwiUccHO' \
    --body '{"currencyCode": "oQiCsYwo", "discountCodes": ["lXEdTA4d", "C0QGQA0P", "ZJSy0KND"], "discountedPrice": 81, "itemId": "949Jmb0Z", "price": 86, "quantity": 62}' \
    > test.out 2>&1
eval_tap $? 435 'PublicPreviewOrderPrice' test.out

#- 436 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5IQNKfMs' \
    --userId 'rk8PKqvK' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserOrder' test.out

#- 437 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zkYShYk5' \
    --userId 'cHEqZF4K' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelUserOrder' test.out

#- 438 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '31X6ASv9' \
    --userId 'NAurW7Fv' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrderHistories' test.out

#- 439 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Fdh1GScb' \
    --userId 'bzIGOvrP' \
    > test.out 2>&1
eval_tap $? 439 'PublicDownloadUserOrderReceipt' test.out

#- 440 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'VFKGTpSE' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetPaymentAccounts' test.out

#- 441 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'A6rg8e7j' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'Za11QovJ' \
    > test.out 2>&1
eval_tap $? 441 'PublicDeletePaymentAccount' test.out

#- 442 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlwsM3g4' \
    --autoCalcEstimatedPrice  \
    --language 'OUYtg2fd' \
    --region 'G5LpC8bu' \
    --storeId 'EWCktZzq' \
    --viewId 'Pyq1Rs7i' \
    > test.out 2>&1
eval_tap $? 442 'PublicListActiveSections' test.out

#- 443 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'jriszZNl' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '9Zbb25Yf' \
    --limit '0' \
    --offset '97' \
    --sku 'H4Y53HlH' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 443 'PublicQueryUserSubscriptions' test.out

#- 444 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3SaHMsHW' \
    --body '{"currencyCode": "jXPYRzqZ", "itemId": "unfSV9PR", "language": "Hhf-qB", "region": "5rA5ep8e", "returnUrl": "Gx9Mzc4d", "source": "ZRq4saAZ"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicSubscribeSubscription' test.out

#- 445 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cd8eYFBr' \
    --itemId '22QTocxM' \
    > test.out 2>&1
eval_tap $? 445 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 446 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Lqiooevm' \
    --userId 'Q0xwkHLo' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserSubscription' test.out

#- 447 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'M0Lri1kp' \
    --userId 'hDSUSfls' \
    > test.out 2>&1
eval_tap $? 447 'PublicChangeSubscriptionBillingAccount' test.out

#- 448 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FkR23z5z' \
    --userId '17TFXQSL' \
    --body '{"immediate": false, "reason": "uyeqE1zh"}' \
    > test.out 2>&1
eval_tap $? 448 'PublicCancelSubscription' test.out

#- 449 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4FkgzbEm' \
    --userId 'Ufv31pxq' \
    --excludeFree  \
    --limit '17' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserSubscriptionBillingHistories' test.out

#- 450 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHWvotOC' \
    --language 'HNn96rMQ' \
    --storeId 'QeKdFWhf' \
    > test.out 2>&1
eval_tap $? 450 'PublicListViews' test.out

#- 451 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'EBxAdDGV' \
    --namespace "$AB_NAMESPACE" \
    --userId '8pvCJHiC' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetWallet' test.out

#- 452 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'jidmPhwH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ght1yg5Z' \
    --limit '12' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 452 'PublicListUserWalletTransactions' test.out

#- 453 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetMyDLCContent' test.out

#- 454 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime '1YKBitL5' \
    --limit '48' \
    --offset '62' \
    --startTime '0pLijl5N' \
    --state 'REVOKE_FAILED' \
    --transactionId 'myHr2BOI' \
    --userId 'PjPFWJYx' \
    > test.out 2>&1
eval_tap $? 454 'QueryFulfillments' test.out

#- 455 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'mlb0tlS1' \
    --baseAppId 'jkAfkcHM' \
    --categoryPath 'c15ckeZy' \
    --features 'VYwHH1g5' \
    --includeSubCategoryItem  \
    --itemName 'A0zFeWw6' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP,EXTENSION,SUBSCRIPTION' \
    --limit '54' \
    --offset '2' \
    --region 'eMZ2aO8D' \
    --sectionExclusive  \
    --sortBy 'updatedAt,name,createdAt' \
    --storeId 'yteXSPuw' \
    --tags 'FBR6qmfB' \
    --targetNamespace 'lvZUJXf4' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 455 'QueryItemsV2' test.out

#- 456 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'stImrVAA' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 456 'ImportStore1' test.out

#- 457 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EoqOqw2c' \
    --body '{"itemIds": ["3xb8r4N7", "pX05erFC", "QruOhMUk"]}' \
    > test.out 2>&1
eval_tap $? 457 'ExportStore1' test.out

#- 458 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4ePsHcA' \
    --body '{"entitlementCollectionId": "fex0UynB", "entitlementOrigin": "Oculus", "metadata": {"jwvCdz7y": {}, "DbHwGHTc": {}, "gYuO6iDJ": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "WjH6HqZA", "namespace": "85tTccnU"}, "item": {"itemId": "Smt0I2kw", "itemName": "CwBx6QFm", "itemSku": "7lR5QUkO", "itemType": "2jfqCfFC"}, "quantity": 24, "type": "CURRENCY"}, {"currency": {"currencyCode": "0UC4Ef6V", "namespace": "kAeOVzZ5"}, "item": {"itemId": "356ePJbC", "itemName": "Cr0aZZNh", "itemSku": "0FqH1tzg", "itemType": "D8EbBB5y"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"currencyCode": "rdJ2t4zA", "namespace": "dmyA4MOR"}, "item": {"itemId": "ew5JZSv4", "itemName": "Y2pR6T5g", "itemSku": "zFMyVCV7", "itemType": "axh5pSR1"}, "quantity": 21, "type": "CURRENCY"}], "source": "PROMOTION", "transactionId": "C1X8ZA0J"}' \
    > test.out 2>&1
eval_tap $? 458 'FulfillRewardsV2' test.out

#- 459 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'mkujJU9J' \
    --userId 'Uph8STdv' \
    --body '{"items": [{"duration": 20, "endDate": "1975-10-26T00:00:00Z", "entitlementCollectionId": "lsHzIlG7", "entitlementOrigin": "Twitch", "itemId": "CQBgzLlO", "itemSku": "SNyLoUQA", "language": "RUw30SOk", "metadata": {"P7P6IPcm": {}, "lisSFvN3": {}, "iTyBB0lP": {}}, "orderNo": "zY3G8lBY", "origin": "Steam", "quantity": 69, "region": "onwuuCp4", "source": "SELL_BACK", "startDate": "1974-02-26T00:00:00Z", "storeId": "Oe3SaELA"}, {"duration": 54, "endDate": "1998-09-24T00:00:00Z", "entitlementCollectionId": "oAScrjgs", "entitlementOrigin": "GooglePlay", "itemId": "eHirShQO", "itemSku": "ovLVLRTA", "language": "KrBxpiXP", "metadata": {"wv7PjyKV": {}, "27aEL7VS": {}, "nf9FsdXb": {}}, "orderNo": "DaHTOEUu", "origin": "Twitch", "quantity": 87, "region": "wha1PWDl", "source": "PAYMENT", "startDate": "1995-12-19T00:00:00Z", "storeId": "WEEOGwIK"}, {"duration": 14, "endDate": "1983-11-30T00:00:00Z", "entitlementCollectionId": "qLBUulpk", "entitlementOrigin": "Steam", "itemId": "RBdBdgKr", "itemSku": "ymo5a2Wk", "language": "zuybxqEb", "metadata": {"T0BLc6Hl": {}, "4CJShd9C": {}, "sNDkxuzF": {}}, "orderNo": "CRlsDhLV", "origin": "Other", "quantity": 46, "region": "UEWWucz7", "source": "IAP", "startDate": "1986-07-26T00:00:00Z", "storeId": "BhE66naM"}]}' \
    > test.out 2>&1
eval_tap $? 459 'FulfillItems' test.out

#- 460 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'FHjVmukY' \
    --userId '039nozAQ' \
    > test.out 2>&1
eval_tap $? 460 'RevokeItems' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
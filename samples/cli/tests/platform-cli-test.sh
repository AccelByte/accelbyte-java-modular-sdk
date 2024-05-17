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
echo "1..448"

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
    --id '9lIiiylH' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'y8HkjWXi' \
    --body '{"grantDays": "iyEPdFYE"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'vaqsLnm1' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '953LanzJ' \
    --body '{"grantDays": "LaU5Tf0Y"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "UdyCdjbi", "dryRun": false, "fulfillmentUrl": "dhJWsuMj", "itemType": "MEDIA", "purchaseConditionUrl": "EL8D3Emp"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'wSWYKyI4' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'WqCTvT7T' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'zkOBaPOs' \
    --body '{"clazz": "bCuCsOcW", "dryRun": true, "fulfillmentUrl": "NxoKhCCK", "purchaseConditionUrl": "JOoLc0Vz"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'L2pv0NqW' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --name '6AA4gT9y' \
    --offset '56' \
    --tag 'i5ZF1En5' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fHs1siBf", "discountConfig": {"categories": [{"categoryPath": "iBuNug54", "includeSubCategories": true}, {"categoryPath": "29VR6Hzf", "includeSubCategories": true}, {"categoryPath": "Slcho1gU", "includeSubCategories": false}], "currencyCode": "cccyK3yO", "currencyNamespace": "U4rQ1dLC", "discountAmount": 77, "discountPercentage": 39, "discountType": "PERCENTAGE", "items": [{"itemId": "d6bETUr4", "itemName": "kQAF2bOw"}, {"itemId": "nljYhvRV", "itemName": "ySZyLq5Y"}, {"itemId": "sPhxMwqX", "itemName": "iEaZbJgO"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 6, "itemId": "HWsvxBWc", "itemName": "DlZamMN6", "quantity": 90}, {"extraSubscriptionDays": 15, "itemId": "BpPRVlsD", "itemName": "CCn8WfaY", "quantity": 69}, {"extraSubscriptionDays": 0, "itemId": "694w5rm5", "itemName": "SQaSVCvM", "quantity": 58}], "maxRedeemCountPerCampaignPerUser": 29, "maxRedeemCountPerCode": 29, "maxRedeemCountPerCodePerUser": 19, "maxSaleCount": 86, "name": "gVTAPHrK", "redeemEnd": "1998-03-26T00:00:00Z", "redeemStart": "1995-11-17T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["2aphi5rd", "Furjwbzx", "baksaAsB"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'yRRyYQJ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'NsTsSgB0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "CPjLuXL5", "discountConfig": {"categories": [{"categoryPath": "5vYIeNVZ", "includeSubCategories": false}, {"categoryPath": "O49wFlUn", "includeSubCategories": true}, {"categoryPath": "JxthWKFz", "includeSubCategories": true}], "currencyCode": "Ba9Fa0p0", "currencyNamespace": "7Y3QAIzr", "discountAmount": 71, "discountPercentage": 20, "discountType": "PERCENTAGE", "items": [{"itemId": "ei0L4D78", "itemName": "fwVvJ1nP"}, {"itemId": "iaZ5rPx4", "itemName": "bLTwnvV1"}, {"itemId": "X3UGhd3E", "itemName": "slejV97e"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 61, "itemId": "geVo1ecG", "itemName": "F3xqDycE", "quantity": 83}, {"extraSubscriptionDays": 65, "itemId": "IIK8BuVo", "itemName": "Jfs5WDmX", "quantity": 55}, {"extraSubscriptionDays": 37, "itemId": "oehHKC18", "itemName": "efOZykhL", "quantity": 74}], "maxRedeemCountPerCampaignPerUser": 77, "maxRedeemCountPerCode": 23, "maxRedeemCountPerCodePerUser": 76, "maxSaleCount": 35, "name": "n7jHr7P1", "redeemEnd": "1999-03-26T00:00:00Z", "redeemStart": "1974-02-03T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["IjyvGpdG", "6kxeZxR4", "WCLU2usk"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'XVr1ZrUy' \
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
    --body '{"appConfig": {"appName": "kJ5fxDwc"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "HLKwwa3D"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "1D9YnYnk"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "TeeFaALE"}, "extendType": "CUSTOM"}' \
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
    --storeId 'kGVzolV9' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '5FlDpawS' \
    --body '{"categoryPath": "tJokok0i", "localizationDisplayNames": {"Xok9Pd4Z": "hbgubNF5", "ttOa9lHO": "H3BuyOfw", "ml7BSmk0": "0f32SYIj"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'he78qS9P' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '8PjwslfJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MIZ1Huw4' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'lK2Y5wiv' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wmdakh7n' \
    --body '{"localizationDisplayNames": {"W3t0jYyS": "yjoYvBtI", "TejdlcKK": "h04JHkoO", "L8rCt4bK": "sgv11SY5"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '5OkeDoqb' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5XPlWQ8G' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'cv66kxUc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vzdSC5E3' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '6ZJuIkru' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dcvohyOe' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'RTlVNEYK' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '45' \
    --code 'Zxr5pJ6m' \
    --limit '17' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '6bEKG7qj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "oEhkLW8X", "quantity": 41}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'Sq7R7IFh' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '69' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'vnne9HAX' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '91' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'm5N2kMVR' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '79' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'P7H834Bq' \
    --namespace "$AB_NAMESPACE" \
    --code '9GIWU6nn' \
    --limit '23' \
    --offset '50' \
    --userId 'emIAhAdr' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'YDcdx78I' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'sUMabGfk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'jryNKHBG' \
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
    --body '{"currencyCode": "rmEPgtqT", "currencySymbol": "9vBV2zRM", "currencyType": "REAL", "decimals": 17, "localizationDescriptions": {"I0vl6XVq": "BGZJOPBz", "C2nNcqs4": "7ul9U72B", "29cBVRoN": "YMQaR4Kn"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '4VZcXLAv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"aDRaQzeS": "9z3AxVrr", "biBwb9rh": "bsI8W75j", "C9HpLyfn": "y4uxG0QH"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'iwrCfBVl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'urUykjfj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'z9uJuALs' \
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
    --body '{"data": [{"id": "1yqhuWaa", "rewards": [{"currency": {"currencyCode": "qgDUuywZ", "namespace": "VZO4PurY"}, "item": {"itemId": "ghxQjhTo", "itemSku": "Y4FAPI1i", "itemType": "5URY0XEE"}, "quantity": 100, "type": "ITEM"}, {"currency": {"currencyCode": "Rn6s2IYV", "namespace": "mCQ41KHV"}, "item": {"itemId": "Q20hS5zr", "itemSku": "wjZKjUe3", "itemType": "IOlDWNUV"}, "quantity": 46, "type": "CURRENCY"}, {"currency": {"currencyCode": "3z1mKz9T", "namespace": "acimtuMi"}, "item": {"itemId": "cPgiL2aR", "itemSku": "HCeR2JnW", "itemType": "xutUAmJc"}, "quantity": 30, "type": "ITEM"}]}, {"id": "FbX8C43s", "rewards": [{"currency": {"currencyCode": "a7GosZVY", "namespace": "a1C5mKuZ"}, "item": {"itemId": "UVMi8b03", "itemSku": "tOzPCEiq", "itemType": "rjahD7Sl"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"currencyCode": "A00PgROZ", "namespace": "4VxxtGFo"}, "item": {"itemId": "vQWLJR0t", "itemSku": "5AUPg7Lp", "itemType": "MZcdp0J4"}, "quantity": 37, "type": "CURRENCY"}, {"currency": {"currencyCode": "N4SWMq9x", "namespace": "cqv88s1y"}, "item": {"itemId": "VF6yGCe5", "itemSku": "23UStdnB", "itemType": "SRwnRpt1"}, "quantity": 21, "type": "CURRENCY"}]}, {"id": "33SDVBx7", "rewards": [{"currency": {"currencyCode": "u4lEsXOV", "namespace": "Qtk7a8GB"}, "item": {"itemId": "ZOnkPaOZ", "itemSku": "V8OrJiNv", "itemType": "8wm62AlV"}, "quantity": 7, "type": "ITEM"}, {"currency": {"currencyCode": "mGIy0PbH", "namespace": "I2trAXk1"}, "item": {"itemId": "JkltFheM", "itemSku": "89aPAq6U", "itemType": "KVuZBPWY"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "cZbMvPvg", "namespace": "ImNp691x"}, "item": {"itemId": "eKqUv1D4", "itemSku": "ZZhwG0Xx", "itemType": "9SgfaTLl"}, "quantity": 88, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"ARQSjdlc": "Ogi3NCOR", "WlqYoCNL": "LWJFBPBo", "McF2UthT": "Khtlzbif"}}, {"platform": "OCULUS", "platformDlcIdMap": {"EOdtPSmK": "ImabHfyk", "924ijH8T": "CFPliMLP", "IZ8dj4tw": "d0SYYJ7X"}}, {"platform": "XBOX", "platformDlcIdMap": {"Bbn4jUuA": "zcE27W8S", "lgwRA4RB": "7Y4kG0uN", "5qJvsJuL": "K523ll9V"}}]}' \
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
    --appType 'DEMO' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'RiyqVrfx' \
    --itemId '4XKk11Tq,g72y53xe,cTMmNyBt' \
    --limit '28' \
    --offset '12' \
    --origin 'Steam' \
    --userId 'vCsMk1lO' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'LnvuGRS9,1iyfIyAL,EG2drPKL' \
    --limit '95' \
    --offset '77' \
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
    --body '{"entitlementGrantList": [{"collectionId": "Xd5AagXa", "endDate": "1996-02-19T00:00:00Z", "grantedCode": "bTKuziye", "itemId": "JNrgqb1L", "itemNamespace": "7CN9qJeB", "language": "pz_uCAO", "origin": "Oculus", "quantity": 65, "region": "sS7mUe0k", "source": "PURCHASE", "startDate": "1987-12-28T00:00:00Z", "storeId": "RpjVs8oo"}, {"collectionId": "G93ycgvK", "endDate": "1997-08-06T00:00:00Z", "grantedCode": "2p1aUIPe", "itemId": "mMLeQ9T8", "itemNamespace": "e0Eu2x1l", "language": "ksKU_450", "origin": "Xbox", "quantity": 81, "region": "8i6eEQAi", "source": "REWARD", "startDate": "1983-07-16T00:00:00Z", "storeId": "LMd8YaKp"}, {"collectionId": "0kYOHokl", "endDate": "1991-01-18T00:00:00Z", "grantedCode": "np9CGCBY", "itemId": "Oym8kavH", "itemNamespace": "HdDS8Dkb", "language": "wKJz-NdNq", "origin": "Other", "quantity": 76, "region": "jKFksLP5", "source": "REWARD", "startDate": "1990-11-02T00:00:00Z", "storeId": "9UWfZuxQ"}], "userIds": ["WrKXuuEf", "zsKBFZIj", "jeX9CWOw"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["LDmK6i0E", "3CB3V70T", "4oxYWWj5"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '5NExg1O8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '91' \
    --status 'FAIL' \
    --userId 'lQkVlDoZ' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '1RSs8h31' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'ixqqJXYe' \
    --limit '72' \
    --offset '7' \
    --startTime 'lsY4UP6m' \
    --status 'INIT' \
    --userId 'dieP8QIo' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "210SAvoL", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 82, "clientTransactionId": "0yBB7BnY"}, {"amountConsumed": 40, "clientTransactionId": "V2QSy4rd"}, {"amountConsumed": 12, "clientTransactionId": "Nbu3bI0h"}], "entitlementId": "2MZfgViH", "usageCount": 48}, {"clientTransaction": [{"amountConsumed": 41, "clientTransactionId": "n3D0xSNr"}, {"amountConsumed": 21, "clientTransactionId": "G2IXwcEA"}, {"amountConsumed": 37, "clientTransactionId": "JJQzsz61"}], "entitlementId": "vdGQ2AYh", "usageCount": 16}, {"clientTransaction": [{"amountConsumed": 29, "clientTransactionId": "jogjKuGW"}, {"amountConsumed": 5, "clientTransactionId": "1jWPlupW"}, {"amountConsumed": 60, "clientTransactionId": "6bu5xN5x"}], "entitlementId": "wAdH6a1j", "usageCount": 94}], "purpose": "eqe0Xd4y"}, "originalTitleName": "YFKeR75F", "paymentProductSKU": "X6WSrLmi", "purchaseDate": "XooSu6uz", "sourceOrderItemId": "T24WSqPU", "titleName": "oU9FMeLl"}, "eventDomain": "XMAOEBCu", "eventSource": "NOjqR0zi", "eventType": "hb2Ltb5c", "eventVersion": 48, "id": "nc2SDGqo", "timestamp": "oQGltJ4A"}' \
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
    --body '{"bundleId": "3WZAqf2P", "password": "SuMuF7W9"}' \
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
    --body '{"sandboxId": "8lqOWYjc"}' \
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
    --body '{"applicationName": "55DWWGA4", "serviceAccountId": "5vg8tl6C"}' \
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
    --body '{"data": [{"itemIdentity": "Wpi3AZeH", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"Ui6Gvreg": "cAuXKj9U", "oywSm6gA": "RJ2Tlf0y", "73DJrkp2": "9UY6Dfc4"}}, {"itemIdentity": "4DvH332S", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"Z2yUu3pE": "deZpIcHG", "49iYcw1X": "jTssAWGp", "8r3MlZBl": "BZPwo9xn"}}, {"itemIdentity": "BlKRVPIP", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"XKhxi4sP": "vZ3LMYdB", "ljhgc5a4": "H0tC9i3p", "2Es1TUTJ": "B6tlbe04"}}]}' \
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
    --body '{"appId": "h2gfxzaC", "appSecret": "ppAPgTnP"}' \
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
    --body '{"backOfficeServerClientId": "AmrqWcnW", "backOfficeServerClientSecret": "OufwcHTm", "enableStreamJob": true, "environment": "ajgc6OrL", "streamName": "xPIzxm0C", "streamPartnerName": "XmAKqXIn"}' \
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
    --body '{"backOfficeServerClientId": "7erbWjza", "backOfficeServerClientSecret": "L0vY6HMr", "enableStreamJob": false, "environment": "2GShi8Tc", "streamName": "HnVFceZF", "streamPartnerName": "7KQin4DC"}' \
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
    --body '{"appId": "MqeYjuEj", "publisherAuthenticationKey": "NqOgLuMt"}' \
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
    --body '{"clientId": "DpZREs40", "clientSecret": "TEYQSszi", "organizationId": "vWF3atsL"}' \
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
    --body '{"relyingPartyCert": "ZIliNruv"}' \
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
    --password '2iUX4Zqs' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'vcqR4UKd' \
    --itemId 'gyVq2Wss' \
    --itemType 'SUBSCRIPTION' \
    --endTime 'XQZVUNCu' \
    --startTime 'toKScmYd' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'QkB3gI3A' \
    --itemId 'LhoEhisn' \
    --itemType 'OPTIONBOX' \
    --endTime '9pl12PVw' \
    --startTime 't0DnD7Mr' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aMtvWyqO' \
    --body '{"categoryPath": "k0JIaoYM", "targetItemId": "2W3cUpLi", "targetNamespace": "t0ScAlHm"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wjpAVMZN' \
    --body '{"appId": "wxKzIn4q", "appType": "DLC", "baseAppId": "fBqfsD39", "boothName": "4eCV1LDO", "categoryPath": "CMMIo0zr", "clazz": "LuAQwAkg", "displayOrder": 71, "entitlementType": "CONSUMABLE", "ext": {"lh1vVhiw": {}, "E5MWSIce": {}, "aRHIHLrt": {}}, "features": ["EZwLsqXj", "ddstWzoM", "T1p35ibs"], "flexible": false, "images": [{"as": "CKRNWUXT", "caption": "NMUhDQK6", "height": 90, "imageUrl": "RYiOw19R", "smallImageUrl": "ZJIR3f2X", "width": 23}, {"as": "di2czoZg", "caption": "CdJm2l0g", "height": 29, "imageUrl": "uwkfeY34", "smallImageUrl": "34w36qb9", "width": 100}, {"as": "JLVdZ5Mh", "caption": "3fdB8yRI", "height": 46, "imageUrl": "qEfA4U0F", "smallImageUrl": "0iYCinOK", "width": 60}], "inventoryConfig": {"customAttributes": {"k9wlj2du": {}, "4Izh15tX": {}, "vVAaIpDP": {}}, "serverCustomAttributes": {"k6RfkZuX": {}, "l6YP0IE3": {}, "8DnPA2k6": {}}, "slotUsed": 91}, "itemIds": ["CpQMPFDw", "IWKIyCXS", "rfs9Nguj"], "itemQty": {"8I1Ec7YT": 76, "lQt5dNl2": 2, "nEpwkTAk": 25}, "itemType": "APP", "listable": true, "localizations": {"2jNwypLX": {"description": "j5syaTfp", "localExt": {"dmdgcY08": {}, "k9jsx524": {}, "ZTmehvcT": {}}, "longDescription": "qiP8N1my", "title": "bjULgZtn"}, "42KkIAlN": {"description": "PyHi0iCQ", "localExt": {"1soViZNM": {}, "zvMMeXf2": {}, "2X8M8qw3": {}}, "longDescription": "YcolwgcF", "title": "tU1yW8ls"}, "ZObcUN2V": {"description": "VEfaFjKA", "localExt": {"FDc64gF2": {}, "bNDnVXdR": {}, "YAyeRxVW": {}}, "longDescription": "9X4lheVB", "title": "WO26snRZ"}}, "lootBoxConfig": {"rewardCount": 72, "rewards": [{"lootBoxItems": [{"count": 83, "duration": 25, "endDate": "1985-06-01T00:00:00Z", "itemId": "yCZUFTti", "itemSku": "uORrOemW", "itemType": "2mHhMYDP"}, {"count": 7, "duration": 53, "endDate": "1976-08-02T00:00:00Z", "itemId": "nT4jsHPX", "itemSku": "NM5M2urt", "itemType": "23gTrabb"}, {"count": 45, "duration": 50, "endDate": "1988-02-05T00:00:00Z", "itemId": "ONkKfmV4", "itemSku": "3QWx4VFd", "itemType": "BAQZDP0N"}], "name": "UeqJCUtM", "odds": 0.7264073606159633, "type": "PROBABILITY_GROUP", "weight": 79}, {"lootBoxItems": [{"count": 84, "duration": 96, "endDate": "1985-09-24T00:00:00Z", "itemId": "37kFptiY", "itemSku": "pwVwACQA", "itemType": "NgsvfY6q"}, {"count": 92, "duration": 25, "endDate": "1976-10-12T00:00:00Z", "itemId": "XevRs8nw", "itemSku": "v4JKcEQP", "itemType": "Z582llV1"}, {"count": 7, "duration": 34, "endDate": "1998-10-24T00:00:00Z", "itemId": "l3I4iiLJ", "itemSku": "di6s3qPR", "itemType": "bMDZosgc"}], "name": "OvwLl6ny", "odds": 0.5379973795125093, "type": "PROBABILITY_GROUP", "weight": 1}, {"lootBoxItems": [{"count": 58, "duration": 92, "endDate": "1996-08-17T00:00:00Z", "itemId": "3vQjOK3D", "itemSku": "5WeVm8Rn", "itemType": "wMR3CtjC"}, {"count": 90, "duration": 21, "endDate": "1996-04-10T00:00:00Z", "itemId": "uXTw9l1H", "itemSku": "dKBqh17P", "itemType": "IqsAbExq"}, {"count": 44, "duration": 25, "endDate": "1972-01-29T00:00:00Z", "itemId": "oJPY0BWQ", "itemSku": "wlOyZhc1", "itemType": "TdsTaHV1"}], "name": "4WTkOK59", "odds": 0.8544272512027784, "type": "REWARD_GROUP", "weight": 16}], "rollFunction": "DEFAULT"}, "maxCount": 77, "maxCountPerUser": 59, "name": "3OBy8C3O", "optionBoxConfig": {"boxItems": [{"count": 45, "duration": 10, "endDate": "1993-09-09T00:00:00Z", "itemId": "Qigqpbi5", "itemSku": "qXLQqvcY", "itemType": "Kl7qgxlA"}, {"count": 91, "duration": 12, "endDate": "1971-12-18T00:00:00Z", "itemId": "CxWdg0F5", "itemSku": "d4Bty5E2", "itemType": "Tfkbyntt"}, {"count": 3, "duration": 27, "endDate": "1984-01-07T00:00:00Z", "itemId": "9Wyy3oRr", "itemSku": "NQKfoohr", "itemType": "YOQU9Yas"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 88, "fixedTrialCycles": 37, "graceDays": 68}, "regionData": {"XwCDSDnb": [{"currencyCode": "NeZzoiv6", "currencyNamespace": "h6xtrdJK", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1977-06-18T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1981-05-31T00:00:00Z", "expireAt": "1993-03-15T00:00:00Z", "price": 65, "purchaseAt": "1999-12-06T00:00:00Z", "trialPrice": 51}, {"currencyCode": "YX517rDc", "currencyNamespace": "Xzc8nHyy", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1971-10-06T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-08-03T00:00:00Z", "expireAt": "1994-11-08T00:00:00Z", "price": 84, "purchaseAt": "1979-03-19T00:00:00Z", "trialPrice": 90}, {"currencyCode": "6hIuhYCY", "currencyNamespace": "dnsCyqeE", "currencyType": "VIRTUAL", "discountAmount": 65, "discountExpireAt": "1988-05-08T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1974-11-24T00:00:00Z", "expireAt": "1986-02-27T00:00:00Z", "price": 67, "purchaseAt": "1972-02-26T00:00:00Z", "trialPrice": 32}], "x87FqBgV": [{"currencyCode": "IpzBCdxY", "currencyNamespace": "0qZ1TPS2", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1989-08-04T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1995-02-26T00:00:00Z", "expireAt": "1974-12-13T00:00:00Z", "price": 22, "purchaseAt": "1972-09-11T00:00:00Z", "trialPrice": 57}, {"currencyCode": "Vb21pXfO", "currencyNamespace": "lJHkTS7E", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1977-04-26T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1972-04-03T00:00:00Z", "expireAt": "1992-08-07T00:00:00Z", "price": 83, "purchaseAt": "1979-12-06T00:00:00Z", "trialPrice": 98}, {"currencyCode": "ItIq4XYy", "currencyNamespace": "SCOurB7w", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1977-09-11T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1978-02-22T00:00:00Z", "expireAt": "1992-08-29T00:00:00Z", "price": 36, "purchaseAt": "1972-08-01T00:00:00Z", "trialPrice": 69}], "dC1DJpV3": [{"currencyCode": "WK06A0nd", "currencyNamespace": "RCoEJirJ", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1971-05-31T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1994-11-12T00:00:00Z", "expireAt": "1996-03-28T00:00:00Z", "price": 59, "purchaseAt": "1996-02-02T00:00:00Z", "trialPrice": 56}, {"currencyCode": "MiSbraV7", "currencyNamespace": "F3Lm6xqT", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1992-11-06T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1973-02-26T00:00:00Z", "expireAt": "1989-10-18T00:00:00Z", "price": 90, "purchaseAt": "1982-12-21T00:00:00Z", "trialPrice": 58}, {"currencyCode": "G6lVTcSN", "currencyNamespace": "mZZgEYCF", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1987-03-27T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1972-09-05T00:00:00Z", "expireAt": "1996-08-29T00:00:00Z", "price": 98, "purchaseAt": "1991-12-11T00:00:00Z", "trialPrice": 80}]}, "saleConfig": {"currencyCode": "TTI7IAAY", "price": 16}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "xEj5aMsh", "stackable": true, "status": "ACTIVE", "tags": ["O8T9f6Vi", "CCd5EOuS", "4lyp6ZL0"], "targetCurrencyCode": "GH21MyrB", "targetNamespace": "HEwhxqGs", "thumbnailUrl": "gDE8bnik", "useCount": 40}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EPwaS54U' \
    --appId 'oxYbGOpv' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'xCR8PQSv' \
    --baseAppId 'EI5L0hBj' \
    --categoryPath 'GOTxLLv6' \
    --features '5GQXqYWb' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --limit '68' \
    --offset '67' \
    --region 'TX1T6b7M' \
    --sortBy 'name:asc,displayOrder:desc,updatedAt' \
    --storeId 'C6jcNRwb' \
    --tags 'dHFFXOgM' \
    --targetNamespace 'JuHn10Pu' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'czjwfjTW,Hl7l1zw3,hyZmBIa2' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'cZRfct94' \
    --itemIds 'N3KaQ4zo' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dkA2bU2Y' \
    --sku 'uu5gH7bM' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'GgLA2uXf' \
    --populateBundle  \
    --region 'ktsn8TpK' \
    --storeId '7NvkCENg' \
    --sku 'ykshWF5G' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'emFDZdUV' \
    --region 'azBKWVd3' \
    --storeId '8ZcWjzVh' \
    --itemIds '53BhFHi2' \
    --userId 'eW3P7TLN' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ROn8KzqT' \
    --sku '5MpWNaae' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '59C3oLKQ,JXGPfQVa,jBoiFZNn' \
    --storeId 'eKucgHM1' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'oD6xPSpz' \
    --region 'KxvX3aWA' \
    --storeId 'o3W6Ot5a' \
    --itemIds 'tBj8aEnX' \
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
    --platform 'TlPqRg24' \
    --userId 'trwvgOXp' \
    --body '{"itemIds": ["vuGS8568", "SbiZ7Feu", "FHxuaomx"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fJAOLOs3' \
    --body '{"changes": [{"itemIdentities": ["rYZgffRR", "xuf6jwhA", "CPrUTG16"], "itemIdentityType": "ITEM_ID", "regionData": {"ICELSFry": [{"currencyCode": "wmJWEBj2", "currencyNamespace": "Rj8AK5N7", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1975-10-02T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1996-05-26T00:00:00Z", "discountedPrice": 89, "expireAt": "1979-07-26T00:00:00Z", "price": 15, "purchaseAt": "1995-07-22T00:00:00Z", "trialPrice": 80}, {"currencyCode": "ZqjQrcDk", "currencyNamespace": "ru2Ej4uI", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1999-10-06T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1978-10-13T00:00:00Z", "discountedPrice": 75, "expireAt": "1974-01-27T00:00:00Z", "price": 81, "purchaseAt": "1987-11-25T00:00:00Z", "trialPrice": 34}, {"currencyCode": "HRAaJsc2", "currencyNamespace": "RdQ0B5oy", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1977-12-07T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1975-07-12T00:00:00Z", "discountedPrice": 52, "expireAt": "1976-05-31T00:00:00Z", "price": 36, "purchaseAt": "1994-10-01T00:00:00Z", "trialPrice": 27}], "6h8oTizg": [{"currencyCode": "ceA9eA96", "currencyNamespace": "3S046bJn", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1996-05-22T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1978-06-14T00:00:00Z", "discountedPrice": 70, "expireAt": "1990-04-08T00:00:00Z", "price": 86, "purchaseAt": "1971-06-12T00:00:00Z", "trialPrice": 3}, {"currencyCode": "BiQGuVWc", "currencyNamespace": "5t5ijB8r", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1972-10-08T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1987-07-22T00:00:00Z", "discountedPrice": 32, "expireAt": "1975-06-18T00:00:00Z", "price": 32, "purchaseAt": "1984-09-13T00:00:00Z", "trialPrice": 68}, {"currencyCode": "u3DTZdqW", "currencyNamespace": "TtooVoMP", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1980-10-20T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1975-01-28T00:00:00Z", "discountedPrice": 23, "expireAt": "1977-06-09T00:00:00Z", "price": 71, "purchaseAt": "1997-04-25T00:00:00Z", "trialPrice": 35}], "hICU7KnJ": [{"currencyCode": "2BewV55F", "currencyNamespace": "Mr1jnTuJ", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1987-06-16T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1974-07-25T00:00:00Z", "discountedPrice": 72, "expireAt": "1993-05-01T00:00:00Z", "price": 52, "purchaseAt": "1973-09-03T00:00:00Z", "trialPrice": 41}, {"currencyCode": "JzyHA3n6", "currencyNamespace": "32jTXsgP", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1995-06-10T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-11-16T00:00:00Z", "discountedPrice": 6, "expireAt": "1985-12-16T00:00:00Z", "price": 11, "purchaseAt": "1988-04-15T00:00:00Z", "trialPrice": 94}, {"currencyCode": "bEJdVpA8", "currencyNamespace": "28USOrc3", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1971-03-03T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1995-07-21T00:00:00Z", "discountedPrice": 54, "expireAt": "1981-08-16T00:00:00Z", "price": 38, "purchaseAt": "1973-03-25T00:00:00Z", "trialPrice": 63}]}}, {"itemIdentities": ["l265xqeG", "vVbvuEC2", "FrhojjJ2"], "itemIdentityType": "ITEM_ID", "regionData": {"j71LnGUP": [{"currencyCode": "IeW5lmtu", "currencyNamespace": "NnjwOqUU", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1991-05-08T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1990-06-07T00:00:00Z", "discountedPrice": 73, "expireAt": "1985-04-07T00:00:00Z", "price": 51, "purchaseAt": "1996-11-26T00:00:00Z", "trialPrice": 77}, {"currencyCode": "ikQy5ngh", "currencyNamespace": "P9Rz1MPQ", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1993-11-12T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1989-03-05T00:00:00Z", "discountedPrice": 81, "expireAt": "1984-06-10T00:00:00Z", "price": 57, "purchaseAt": "1978-10-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "RjrV5rRQ", "currencyNamespace": "0iegQoKH", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1981-11-12T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1981-11-23T00:00:00Z", "discountedPrice": 18, "expireAt": "1976-06-25T00:00:00Z", "price": 18, "purchaseAt": "1980-11-01T00:00:00Z", "trialPrice": 63}], "WtRYG53D": [{"currencyCode": "89RqTXVK", "currencyNamespace": "1uHgmenR", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1997-12-14T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1990-03-01T00:00:00Z", "discountedPrice": 47, "expireAt": "1979-07-23T00:00:00Z", "price": 70, "purchaseAt": "1991-12-17T00:00:00Z", "trialPrice": 40}, {"currencyCode": "RlTYq15j", "currencyNamespace": "3uQBCYgX", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1978-03-27T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1978-11-25T00:00:00Z", "discountedPrice": 48, "expireAt": "1984-08-10T00:00:00Z", "price": 17, "purchaseAt": "1982-04-14T00:00:00Z", "trialPrice": 47}, {"currencyCode": "AQbDdBkH", "currencyNamespace": "b1hahmYF", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1995-06-03T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1981-04-17T00:00:00Z", "discountedPrice": 97, "expireAt": "1982-02-13T00:00:00Z", "price": 28, "purchaseAt": "1996-05-12T00:00:00Z", "trialPrice": 79}], "iPF4ErtN": [{"currencyCode": "75DaH6pp", "currencyNamespace": "GgfG5W37", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1976-06-30T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1973-07-31T00:00:00Z", "discountedPrice": 66, "expireAt": "1975-07-02T00:00:00Z", "price": 93, "purchaseAt": "1990-05-22T00:00:00Z", "trialPrice": 100}, {"currencyCode": "hMlYFsPd", "currencyNamespace": "fYo9ybxj", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1986-03-31T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1987-08-11T00:00:00Z", "discountedPrice": 82, "expireAt": "1976-02-12T00:00:00Z", "price": 61, "purchaseAt": "1980-09-25T00:00:00Z", "trialPrice": 88}, {"currencyCode": "NYCj9O7z", "currencyNamespace": "eNb7UREt", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1980-09-24T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1985-07-10T00:00:00Z", "discountedPrice": 12, "expireAt": "1971-05-31T00:00:00Z", "price": 56, "purchaseAt": "1977-01-07T00:00:00Z", "trialPrice": 2}]}}, {"itemIdentities": ["xXTn5W4p", "nBnLZaHL", "NURi5iXi"], "itemIdentityType": "ITEM_SKU", "regionData": {"eF4ZWXPx": [{"currencyCode": "jpOxjU9s", "currencyNamespace": "NJHecA5t", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1983-11-10T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1991-07-24T00:00:00Z", "discountedPrice": 63, "expireAt": "1982-02-13T00:00:00Z", "price": 73, "purchaseAt": "1995-02-28T00:00:00Z", "trialPrice": 93}, {"currencyCode": "Xum6xczk", "currencyNamespace": "1yMviJwF", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1979-11-20T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1982-07-13T00:00:00Z", "discountedPrice": 51, "expireAt": "1989-06-07T00:00:00Z", "price": 70, "purchaseAt": "1972-01-08T00:00:00Z", "trialPrice": 92}, {"currencyCode": "JUwPoXLM", "currencyNamespace": "16Q7M4SY", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1987-08-06T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1973-05-19T00:00:00Z", "discountedPrice": 21, "expireAt": "1987-09-30T00:00:00Z", "price": 39, "purchaseAt": "1973-04-01T00:00:00Z", "trialPrice": 49}], "3mvkyxcW": [{"currencyCode": "F5wBaCU3", "currencyNamespace": "9OBjdh8k", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1991-11-28T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1975-02-12T00:00:00Z", "discountedPrice": 6, "expireAt": "1988-09-21T00:00:00Z", "price": 28, "purchaseAt": "1984-04-25T00:00:00Z", "trialPrice": 56}, {"currencyCode": "sMPa3Q0M", "currencyNamespace": "h30xHzaL", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1983-12-24T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1986-02-25T00:00:00Z", "discountedPrice": 41, "expireAt": "1990-04-12T00:00:00Z", "price": 27, "purchaseAt": "1981-01-12T00:00:00Z", "trialPrice": 51}, {"currencyCode": "j7rYmljX", "currencyNamespace": "hVFz1O4u", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1978-07-17T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1972-11-15T00:00:00Z", "discountedPrice": 23, "expireAt": "1992-10-15T00:00:00Z", "price": 54, "purchaseAt": "1992-05-15T00:00:00Z", "trialPrice": 5}], "6zBy0l7C": [{"currencyCode": "sCku6BJ6", "currencyNamespace": "YaUz9fWT", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1981-03-11T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1992-10-31T00:00:00Z", "discountedPrice": 21, "expireAt": "1990-12-23T00:00:00Z", "price": 85, "purchaseAt": "1991-01-29T00:00:00Z", "trialPrice": 8}, {"currencyCode": "VPJfryu6", "currencyNamespace": "FdS8v6ik", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1981-06-02T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1986-06-04T00:00:00Z", "discountedPrice": 14, "expireAt": "1997-12-02T00:00:00Z", "price": 44, "purchaseAt": "1975-01-25T00:00:00Z", "trialPrice": 37}, {"currencyCode": "1ndgeN5E", "currencyNamespace": "RN8Bgath", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1981-02-14T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1988-03-13T00:00:00Z", "discountedPrice": 91, "expireAt": "1999-10-20T00:00:00Z", "price": 33, "purchaseAt": "1993-10-12T00:00:00Z", "trialPrice": 28}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '66' \
    --offset '83' \
    --sortBy 'WBLwd1UK' \
    --storeId 'NPQUZTQh' \
    --keyword 'bAhk7Sxz' \
    --language 'YqXmrGA7' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '53' \
    --offset '59' \
    --sortBy 'displayOrder:desc,createdAt,name:desc' \
    --storeId 'VNu8iUTr' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'aUTbMufk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'VtNrmdqm' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'b2m6PZhO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vR8V0rva' \
    --body '{"appId": "lJPvF97P", "appType": "SOFTWARE", "baseAppId": "xVRS3rvG", "boothName": "cs8GTpw8", "categoryPath": "VeCDTAVS", "clazz": "LNLSRzEu", "displayOrder": 10, "entitlementType": "CONSUMABLE", "ext": {"Konfa7R7": {}, "m6BkIQCx": {}, "9XfhGfjj": {}}, "features": ["YoKheB7L", "ezAw5X6e", "zQVnAxDW"], "flexible": false, "images": [{"as": "aHOpMUBe", "caption": "8MJjbsk2", "height": 20, "imageUrl": "txj48zBq", "smallImageUrl": "oThak2Or", "width": 71}, {"as": "lx2ZE3wI", "caption": "e4AgRtCE", "height": 97, "imageUrl": "w86YgZCR", "smallImageUrl": "0FWBb5Qt", "width": 41}, {"as": "Z1nG9oFg", "caption": "PX2SgxRH", "height": 43, "imageUrl": "ZQsaava8", "smallImageUrl": "YOhDFmXU", "width": 34}], "inventoryConfig": {"customAttributes": {"vqNdX9aW": {}, "tp4kAwZX": {}, "vdNe03lS": {}}, "serverCustomAttributes": {"SEHOF4Jm": {}, "zPKKBV4Z": {}, "YUCHS2hw": {}}, "slotUsed": 88}, "itemIds": ["tcdGEf7w", "H2cIHVPJ", "FewL3GY3"], "itemQty": {"jCDKNpbx": 48, "uwWLYGcL": 99, "tCzbTDeb": 68}, "itemType": "COINS", "listable": false, "localizations": {"uy8wwTKf": {"description": "lUufm8T7", "localExt": {"sJeOSDU2": {}, "EME6164e": {}, "fOYQxUGM": {}}, "longDescription": "N1xLKkPL", "title": "OkizSz3M"}, "TmmOGWGO": {"description": "eTpKdBC3", "localExt": {"cODwbvns": {}, "VMWWLVPN": {}, "2K0UE3ZW": {}}, "longDescription": "680buFuR", "title": "gFW9QYwJ"}, "s3hqSxzF": {"description": "V01lrWCL", "localExt": {"UN8LzGK7": {}, "sgwCowYa": {}, "CprXeSBJ": {}}, "longDescription": "mLqufccN", "title": "Tneoun6V"}}, "lootBoxConfig": {"rewardCount": 87, "rewards": [{"lootBoxItems": [{"count": 33, "duration": 43, "endDate": "1979-09-29T00:00:00Z", "itemId": "Vx2hIHgq", "itemSku": "vM4xatgX", "itemType": "cPqFpURx"}, {"count": 12, "duration": 57, "endDate": "1972-10-16T00:00:00Z", "itemId": "TYFFv3QM", "itemSku": "lz9aMZd7", "itemType": "xkHjRoYT"}, {"count": 19, "duration": 0, "endDate": "1984-08-11T00:00:00Z", "itemId": "lVBVvWxR", "itemSku": "goMKFISH", "itemType": "HcQbr5IV"}], "name": "o40WaZj6", "odds": 0.7744061205915295, "type": "PROBABILITY_GROUP", "weight": 41}, {"lootBoxItems": [{"count": 63, "duration": 98, "endDate": "1971-01-28T00:00:00Z", "itemId": "ebkFfnSi", "itemSku": "Ux961faq", "itemType": "n2MI1tmC"}, {"count": 84, "duration": 7, "endDate": "1976-07-17T00:00:00Z", "itemId": "HKoOysUq", "itemSku": "4FftlYIK", "itemType": "WcMdSAsK"}, {"count": 97, "duration": 59, "endDate": "1997-09-04T00:00:00Z", "itemId": "EsOpT8B4", "itemSku": "LeILleHw", "itemType": "ppAqQmeu"}], "name": "g8CdvNve", "odds": 0.5003836439083766, "type": "PROBABILITY_GROUP", "weight": 17}, {"lootBoxItems": [{"count": 10, "duration": 25, "endDate": "1975-11-17T00:00:00Z", "itemId": "f2Yq6fUm", "itemSku": "YcydaRP1", "itemType": "YMRVBufr"}, {"count": 77, "duration": 24, "endDate": "1989-12-23T00:00:00Z", "itemId": "COD82HjH", "itemSku": "fXkMf95U", "itemType": "tI1uBzX3"}, {"count": 21, "duration": 92, "endDate": "1987-08-13T00:00:00Z", "itemId": "A9GgzYT8", "itemSku": "ory33AGY", "itemType": "3KmBswYR"}], "name": "6CrNjESx", "odds": 0.6624797369135992, "type": "REWARD", "weight": 87}], "rollFunction": "CUSTOM"}, "maxCount": 34, "maxCountPerUser": 99, "name": "nuKnY21c", "optionBoxConfig": {"boxItems": [{"count": 67, "duration": 91, "endDate": "1985-10-30T00:00:00Z", "itemId": "PxzXofDw", "itemSku": "Vov5jo5H", "itemType": "Q6yQAyDx"}, {"count": 71, "duration": 58, "endDate": "1992-02-27T00:00:00Z", "itemId": "Fcg5Im3J", "itemSku": "KkLUBb81", "itemType": "kw3j5tRj"}, {"count": 82, "duration": 66, "endDate": "1999-11-12T00:00:00Z", "itemId": "hUEDlZbO", "itemSku": "sstjvsy5", "itemType": "WZdKylUB"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 19, "fixedTrialCycles": 24, "graceDays": 8}, "regionData": {"5qoKHq0A": [{"currencyCode": "mgxYRKpk", "currencyNamespace": "tnKJvLbE", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1990-03-04T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1997-10-22T00:00:00Z", "expireAt": "1976-07-28T00:00:00Z", "price": 90, "purchaseAt": "1973-09-22T00:00:00Z", "trialPrice": 60}, {"currencyCode": "DNy2Fjnt", "currencyNamespace": "p44DltYv", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1982-03-02T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1999-06-15T00:00:00Z", "expireAt": "1989-10-23T00:00:00Z", "price": 25, "purchaseAt": "1983-03-23T00:00:00Z", "trialPrice": 64}, {"currencyCode": "puuE4Fbx", "currencyNamespace": "WdfuyZI1", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1989-07-05T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1972-03-11T00:00:00Z", "expireAt": "1995-03-23T00:00:00Z", "price": 25, "purchaseAt": "1992-07-21T00:00:00Z", "trialPrice": 35}], "i53crce9": [{"currencyCode": "3fhBvfLH", "currencyNamespace": "Q1NxS1cr", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1975-01-15T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1977-11-14T00:00:00Z", "expireAt": "1978-10-26T00:00:00Z", "price": 13, "purchaseAt": "1977-08-19T00:00:00Z", "trialPrice": 53}, {"currencyCode": "TyWuYCjt", "currencyNamespace": "rJNPDrK6", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1990-08-14T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1977-09-23T00:00:00Z", "expireAt": "1996-08-11T00:00:00Z", "price": 58, "purchaseAt": "1976-01-02T00:00:00Z", "trialPrice": 100}, {"currencyCode": "c1U6tyr2", "currencyNamespace": "S0ePHRg3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-19T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1996-04-23T00:00:00Z", "expireAt": "1978-10-14T00:00:00Z", "price": 98, "purchaseAt": "1982-03-22T00:00:00Z", "trialPrice": 49}], "8V23aplo": [{"currencyCode": "TEZjpYH7", "currencyNamespace": "YwUGDJbC", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1981-10-20T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1972-08-22T00:00:00Z", "expireAt": "1997-12-09T00:00:00Z", "price": 52, "purchaseAt": "1978-02-11T00:00:00Z", "trialPrice": 94}, {"currencyCode": "isRgY71R", "currencyNamespace": "vbpeRhWH", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1994-01-25T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1971-08-04T00:00:00Z", "expireAt": "1984-08-22T00:00:00Z", "price": 85, "purchaseAt": "1986-12-16T00:00:00Z", "trialPrice": 1}, {"currencyCode": "AEDWeWC9", "currencyNamespace": "M4zMyhGp", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1999-06-25T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1992-12-08T00:00:00Z", "expireAt": "1991-11-22T00:00:00Z", "price": 46, "purchaseAt": "1990-06-27T00:00:00Z", "trialPrice": 88}]}, "saleConfig": {"currencyCode": "K5LArwHs", "price": 7}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "uWBMNuRD", "stackable": true, "status": "ACTIVE", "tags": ["4wftawXz", "EVOB0QNS", "W6KPAyZY"], "targetCurrencyCode": "fBNsxyk5", "targetNamespace": "sCw80if1", "thumbnailUrl": "hsRYDd5R", "useCount": 21}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'on0DDF5V' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '7IEumgDz' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'DGZKyKwc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 56, "orderNo": "4Hwhx43z"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'sDphsj7m' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'tCnI8n6S' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'JGK7Bmoa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y66Ck2IV' \
    --body '{"carousel": [{"alt": "Y5P4J4oO", "previewUrl": "LzKw7xPv", "thumbnailUrl": "CBcwcZKo", "type": "video", "url": "qn6nAAwY", "videoSource": "generic"}, {"alt": "4LKglISa", "previewUrl": "6z9hCaaw", "thumbnailUrl": "L1sAQMQg", "type": "image", "url": "BHByz9Px", "videoSource": "generic"}, {"alt": "Z1wEkd78", "previewUrl": "DcUHdIS4", "thumbnailUrl": "dYed94kT", "type": "image", "url": "VFpA2ioj", "videoSource": "generic"}], "developer": "rMAlrANf", "forumUrl": "pIPuvw9P", "genres": ["Strategy", "Sports", "Action"], "localizations": {"Rh19OCMK": {"announcement": "Rs0F9cFD", "slogan": "xLoK9UWe"}, "NfYve3cb": {"announcement": "QcxK4SOc", "slogan": "kZV81mX4"}, "XnLVddCR": {"announcement": "BlECKlpS", "slogan": "KbDHxTRP"}}, "platformRequirements": {"ldeSUR5H": [{"additionals": "qLE4G68s", "directXVersion": "QIdaEe5p", "diskSpace": "EKNfaOfD", "graphics": "XuHR9sgm", "label": "mlFtYdPl", "osVersion": "9aRWX3CJ", "processor": "lzOCNmkG", "ram": "w9P6fNml", "soundCard": "jNWpATZG"}, {"additionals": "2D9chxcJ", "directXVersion": "XpKV9Rs3", "diskSpace": "3UR1pq4L", "graphics": "xBb7xWfH", "label": "rC8iqBda", "osVersion": "5q23gIIn", "processor": "u7JajAdz", "ram": "X75QhGgC", "soundCard": "r7DK16kj"}, {"additionals": "Vi0irnbL", "directXVersion": "fX9PjqOi", "diskSpace": "HyThft1f", "graphics": "G4lumrQx", "label": "Ug2wae0T", "osVersion": "wFkmsQfV", "processor": "2R9Ze9lg", "ram": "YGAXx5qm", "soundCard": "fm0xjKV5"}], "t39UUntu": [{"additionals": "KtBERJ62", "directXVersion": "C6c2DQRv", "diskSpace": "Jmilju0D", "graphics": "it9F8rLZ", "label": "AihCnCip", "osVersion": "wHYpdBmU", "processor": "0levE0mN", "ram": "kN8ieE1z", "soundCard": "BMCUXoeA"}, {"additionals": "B5HMjXNw", "directXVersion": "XmrBWgpr", "diskSpace": "iQS7mRu5", "graphics": "6OQMX0ya", "label": "KqpseeVS", "osVersion": "6m9nWd1w", "processor": "oeigqyZD", "ram": "YBsrZWcf", "soundCard": "5msTP81A"}, {"additionals": "Fv1UzQcl", "directXVersion": "OHHH9qoe", "diskSpace": "h42HlEip", "graphics": "RusdqLtT", "label": "MutFov9W", "osVersion": "7XonPrXB", "processor": "WVp0V9B6", "ram": "ukEa4Dby", "soundCard": "7N0ZHYSX"}], "LJOr4TUS": [{"additionals": "iwHo3aig", "directXVersion": "9zGvf7Qu", "diskSpace": "CbVyn3eJ", "graphics": "T3xZEclT", "label": "PflUzhrH", "osVersion": "IIO8Xeh3", "processor": "siQFnxyo", "ram": "DD58N1tW", "soundCard": "w8UUQpRH"}, {"additionals": "1uzjRuKq", "directXVersion": "ehBt7EXr", "diskSpace": "E7i802pw", "graphics": "UJQUrg9I", "label": "30YFMk15", "osVersion": "mfL7shpX", "processor": "8sxj8HZ7", "ram": "YpQdqIXt", "soundCard": "USCzJA3G"}, {"additionals": "i5tfKGz9", "directXVersion": "UDkeGuq2", "diskSpace": "WCmS5BFz", "graphics": "TRzwKxun", "label": "iitGqlpl", "osVersion": "umNkEteD", "processor": "NJtBbx6Z", "ram": "WsCOtPUP", "soundCard": "YagBsXGm"}]}, "platforms": ["Windows", "Linux", "Windows"], "players": ["Multi", "Multi", "Coop"], "primaryGenre": "RPG", "publisher": "QYHBaoNO", "releaseDate": "1982-02-20T00:00:00Z", "websiteUrl": "1TucCIef"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'fI2vAL3u' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iSi2TqXL' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '7o3IIoPb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'skD6xlwV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'amHmm8TU' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'QzW6gMx3' \
    --itemId 'FsoRCvno' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hlEv59aJ' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'paaerVNl' \
    --itemId '1oHe8zpE' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8NhioHLW' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'sxt04SOW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'NeIdEVsi' \
    --populateBundle  \
    --region 'UDp3o4fL' \
    --storeId 'YW7ROX0B' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'b2cV1Lef' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3Ci7JXi7' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 45, "comparison": "includes", "name": "tc8wl2Rb", "predicateType": "SeasonTierPredicate", "value": "fGJRTGcu", "values": ["S8YGiE7q", "bw4PpGHA", "KdFbMvML"]}, {"anyOf": 9, "comparison": "includes", "name": "8bAloiKT", "predicateType": "EntitlementPredicate", "value": "gAy0d85E", "values": ["pmAOKd6y", "TAkPMHi6", "9mJK8qvf"]}, {"anyOf": 25, "comparison": "isLessThanOrEqual", "name": "nTYI4z3n", "predicateType": "EntitlementPredicate", "value": "J7Fmv6sD", "values": ["NwWy8jjh", "2qI3LAH8", "NEa9QNuz"]}]}, {"operator": "and", "predicates": [{"anyOf": 97, "comparison": "isLessThan", "name": "oA90KiT6", "predicateType": "SeasonTierPredicate", "value": "D5qRUCSr", "values": ["6OKkyVAX", "uPHTbF0m", "htyPXvV3"]}, {"anyOf": 76, "comparison": "isLessThanOrEqual", "name": "3GDE1lOd", "predicateType": "SeasonTierPredicate", "value": "XJCsur0a", "values": ["2LaP5OOk", "nob0ziK5", "2Zt4KXkX"]}, {"anyOf": 64, "comparison": "is", "name": "ZAtU6ovs", "predicateType": "SeasonTierPredicate", "value": "zrlvTnIh", "values": ["Jgrxmzrh", "irQqJFFW", "B7jlzEzS"]}]}, {"operator": "and", "predicates": [{"anyOf": 87, "comparison": "isGreaterThanOrEqual", "name": "rY0V0zF6", "predicateType": "EntitlementPredicate", "value": "KW1os8pE", "values": ["Ab84Om9X", "00wprC0W", "yxXeJEhu"]}, {"anyOf": 18, "comparison": "isNot", "name": "eeMqP682", "predicateType": "EntitlementPredicate", "value": "9E9r4Miy", "values": ["M78YfTVL", "E24DYKi6", "zYObWc8h"]}, {"anyOf": 23, "comparison": "isGreaterThanOrEqual", "name": "wGkCHqLv", "predicateType": "EntitlementPredicate", "value": "HCM2d1BS", "values": ["9wFTHjl3", "zrxEcueC", "cUwUGe0e"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'eO9or3oV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "f1B4ZFyA"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --name 'NYXmmxbk' \
    --offset '54' \
    --tag 'EWxVi2bn' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "P2m3Ba86", "name": "ryNKLPuD", "status": "ACTIVE", "tags": ["HVSsKIBm", "jxNeyWTV", "kIBBDLOa"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'Lw7A97gt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'mRUPHMsE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "m7LqHxJ3", "name": "aNbIOwFZ", "status": "INACTIVE", "tags": ["YZWfKERT", "E2HGofHg", "3CyO2cVT"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'XvfCRdKy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'vGbnE08b' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '22' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'oZq2B04n' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'v82jmKsC' \
    --limit '37' \
    --offset '19' \
    --orderNos 'ZrcpHj1U,wq3H00bI,JKJMuxUs' \
    --sortBy 'e0Kc27BF' \
    --startTime 'gonvsraM' \
    --status 'REFUND_FAILED' \
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
    --orderNo 'QYRnkyUs' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'J89GWfQG' \
    --body '{"description": "sWtMStCv"}' \
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
    --body '{"dryRun": true, "notifyUrl": "I9Jec91p", "privateKey": "wU8U398j"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Yfou528W' \
    --externalId '5QOUaHjd' \
    --limit '42' \
    --notificationSource 'STRIPE' \
    --notificationType 'h9r6m7F5' \
    --offset '95' \
    --paymentOrderNo 'PPXoCHMJ' \
    --startDate 'jhvngB8L' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 149 'QueryPaymentNotifications' test.out

#- 150 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '5i8ILZri' \
    --limit '64' \
    --offset '13' \
    --status 'CHARGE_FAILED' \
    > test.out 2>&1
eval_tap $? 150 'QueryPaymentOrders' test.out

#- 151 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "JNK7F2XN", "currencyNamespace": "vrlWQrM7", "customParameters": {"d1sGoiO3": {}, "HsLb18gz": {}, "l29pUbxE": {}}, "description": "OTLLrhpu", "extOrderNo": "fS5gWEVd", "extUserId": "w8qKpVL3", "itemType": "COINS", "language": "ZmqH-CA", "metadata": {"IDaHfNdi": "wYeirxzJ", "4bsUBAGn": "r9XpM5wU", "yqU7kvRp": "KREoViZu"}, "notifyUrl": "c0OgXhAd", "omitNotification": true, "platform": "FsFNHDyJ", "price": 38, "recurringPaymentOrderNo": "bP7BfQBu", "region": "AN8hxZEH", "returnUrl": "ZNfC4ZhE", "sandbox": false, "sku": "Aud9bn6Y", "subscriptionId": "kPzkj48s", "targetNamespace": "gBnJhfJD", "targetUserId": "gHJhV5RI", "title": "mwa0L4XA"}' \
    > test.out 2>&1
eval_tap $? 151 'CreatePaymentOrderByDedicated' test.out

#- 152 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'DOCmYDCx' \
    > test.out 2>&1
eval_tap $? 152 'ListExtOrderNoByExtTxId' test.out

#- 153 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'eIfcHKSj' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrder' test.out

#- 154 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bPcqUNOH' \
    --body '{"extTxId": "2idkdREc", "paymentMethod": "Nakq9bqB", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 154 'ChargePaymentOrder' test.out

#- 155 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AWvZDp7t' \
    --body '{"description": "vFUHZsXR"}' \
    > test.out 2>&1
eval_tap $? 155 'RefundPaymentOrderByDedicated' test.out

#- 156 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HGiTSLM8' \
    --body '{"amount": 52, "currencyCode": "5LsVlVv0", "notifyType": "REFUND", "paymentProvider": "XSOLLA", "salesTax": 64, "vat": 13}' \
    > test.out 2>&1
eval_tap $? 156 'SimulatePaymentOrderNotification' test.out

#- 157 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ls5HS6Hy' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrderChargeStatus' test.out

#- 158 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformEntitlementConfig' test.out

#- 159 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedPlatformOrigins": ["Oculus", "Playstation", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformEntitlementConfig' test.out

#- 160 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 160 'GetPlatformWalletConfig' test.out

#- 161 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Oculus", "GooglePlay", "Oculus"]}' \
    > test.out 2>&1
eval_tap $? 161 'UpdatePlatformWalletConfig' test.out

#- 162 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime 'RTBOcNm4' \
    --limit '27' \
    --offset '37' \
    --source 'DLC' \
    --startTime 'ClTXz3xx' \
    --status 'SUCCESS' \
    --transactionId 'Osl3rTeG' \
    --userId 'cHhlFX2t' \
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
    --body '{"appConfig": {"appName": "UuOsMSz0"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "ZsMB4hGE"}, "extendType": "APP"}' \
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
    --body '{"description": "K6uad42T", "eventTopic": "1euUw3j9", "maxAwarded": 70, "maxAwardedPerUser": 13, "namespaceExpression": "peAyI6QA", "rewardCode": "m6x2Xogw", "rewardConditions": [{"condition": "1v22DmVQ", "conditionName": "ui1rvFQi", "eventName": "YfduKbTJ", "rewardItems": [{"duration": 3, "endDate": "1984-06-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cZ8iBVtx", "quantity": 69, "sku": "GTy0LpNU"}, {"duration": 84, "endDate": "1997-10-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "i5rNHKVc", "quantity": 55, "sku": "tolCYfts"}, {"duration": 1, "endDate": "1979-08-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RSH3Uw4V", "quantity": 8, "sku": "e38V1Ce9"}]}, {"condition": "NUEi4L4I", "conditionName": "7e1r6KmJ", "eventName": "QBrfXT63", "rewardItems": [{"duration": 38, "endDate": "1977-04-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MBIU5l6c", "quantity": 18, "sku": "Wb01UE8G"}, {"duration": 31, "endDate": "1977-02-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MTgjV2Wg", "quantity": 39, "sku": "Xo0E2rr3"}, {"duration": 68, "endDate": "1981-09-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Dic2AorF", "quantity": 3, "sku": "RtpwPuDe"}]}, {"condition": "RWN2lXLT", "conditionName": "aLB2n8lH", "eventName": "tfntSzVq", "rewardItems": [{"duration": 64, "endDate": "1976-07-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "wgDaqEGc", "quantity": 32, "sku": "5ToOAKAf"}, {"duration": 84, "endDate": "1994-01-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8lhdmNwh", "quantity": 69, "sku": "gupLeG3B"}, {"duration": 61, "endDate": "1984-01-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1na4X7U7", "quantity": 38, "sku": "btDn01oA"}]}], "userIdExpression": "5hcR91ne"}' \
    > test.out 2>&1
eval_tap $? 171 'CreateReward' test.out

#- 172 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'nNfTmlE0' \
    --limit '5' \
    --offset '1' \
    --sortBy 'rewardCode:asc,rewardCode:desc' \
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
    --rewardId 'UoN7KgX1' \
    > test.out 2>&1
eval_tap $? 175 'GetReward' test.out

#- 176 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ah1l0oxN' \
    --body '{"description": "5Odv25xj", "eventTopic": "E9dPy8gO", "maxAwarded": 61, "maxAwardedPerUser": 40, "namespaceExpression": "xUBG5ALV", "rewardCode": "QnA1oppp", "rewardConditions": [{"condition": "GWZNpi2s", "conditionName": "eqeBOOHG", "eventName": "lUkQHnDX", "rewardItems": [{"duration": 80, "endDate": "1974-03-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "kxAFJ7Ia", "quantity": 4, "sku": "pHP7i4Of"}, {"duration": 37, "endDate": "1971-03-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "6YDbTEG5", "quantity": 95, "sku": "FWoTaH0k"}, {"duration": 34, "endDate": "1972-03-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZbwMfzAX", "quantity": 0, "sku": "1jCBsWlT"}]}, {"condition": "wTeJeXV8", "conditionName": "kzpx7kVz", "eventName": "PSJh1bCG", "rewardItems": [{"duration": 36, "endDate": "1981-04-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "xv5gLBfS", "quantity": 99, "sku": "hwiH1f96"}, {"duration": 53, "endDate": "1974-08-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iTkknHv6", "quantity": 25, "sku": "MHEy0vot"}, {"duration": 68, "endDate": "1986-08-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "if9ddV8L", "quantity": 73, "sku": "xOlIsY7d"}]}, {"condition": "Os5ZDMrh", "conditionName": "AIX9Ahlv", "eventName": "MYYlj4wX", "rewardItems": [{"duration": 77, "endDate": "1989-10-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "XKALjeSQ", "quantity": 91, "sku": "7FN1FLFV"}, {"duration": 48, "endDate": "1971-09-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "AfV3DYUX", "quantity": 13, "sku": "mnqIZHcW"}, {"duration": 90, "endDate": "1994-02-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5eR4ff1h", "quantity": 62, "sku": "hPKcwQoc"}]}], "userIdExpression": "iW1adGxb"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateReward' test.out

#- 177 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'l1M74Cam' \
    > test.out 2>&1
eval_tap $? 177 'DeleteReward' test.out

#- 178 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'oAjzA7xe' \
    --body '{"payload": {"bdzNiEoq": {}, "u5QpyM0g": {}, "UynvUTEH": {}}}' \
    > test.out 2>&1
eval_tap $? 178 'CheckEventCondition' test.out

#- 179 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Q1HUAe4d' \
    --body '{"conditionName": "1iGlanMa", "userId": "tEcTMZwv"}' \
    > test.out 2>&1
eval_tap $? 179 'DeleteRewardConditionRecord' test.out

#- 180 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'sypDvTmq' \
    --limit '31' \
    --offset '17' \
    --start 'Yfsxhi0c' \
    --storeId 'rTF3IvaX' \
    --viewId '1Y8oC4rH' \
    > test.out 2>&1
eval_tap $? 180 'QuerySections' test.out

#- 181 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KmwRFAEJ' \
    --body '{"active": false, "displayOrder": 50, "endDate": "1977-12-26T00:00:00Z", "ext": {"POg8tnB2": {}, "ZA1OOoOe": {}, "PxhxWfiH": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 78, "itemCount": 88, "rule": "SEQUENCE"}, "items": [{"id": "T5ZFZvph", "sku": "KHrQY3uu"}, {"id": "vQSpDYfF", "sku": "CPjV95RB"}, {"id": "TEOdNAHR", "sku": "QkxjqKbZ"}], "localizations": {"pFyCodBf": {"description": "YhLUcmrv", "localExt": {"OkWHkREl": {}, "kUNOkxh3": {}, "t59eOjGf": {}}, "longDescription": "QSjlwZ5a", "title": "dJdfX80o"}, "YlD1Pp1O": {"description": "XoQBTSvx", "localExt": {"hTOnwUJE": {}, "ueM8P9Z3": {}, "sdMLWxjA": {}}, "longDescription": "DLfffA6q", "title": "dENyvxkq"}, "GC26wPfU": {"description": "csAoxDyF", "localExt": {"nnR632db": {}, "FLRtKykJ": {}, "cVNKsskx": {}}, "longDescription": "ZJHgbK7w", "title": "M2He3uKZ"}}, "name": "QKv3ebTN", "rotationType": "NONE", "startDate": "1985-07-14T00:00:00Z", "viewId": "EhP7RWKV"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateSection' test.out

#- 182 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '16PSoTd1' \
    > test.out 2>&1
eval_tap $? 182 'PurgeExpiredSection' test.out

#- 183 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'JKQS9awZ' \
    --storeId 's4WvMewG' \
    > test.out 2>&1
eval_tap $? 183 'GetSection' test.out

#- 184 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'xYP176ZG' \
    --storeId 'qiwGsekJ' \
    --body '{"active": false, "displayOrder": 61, "endDate": "1993-01-29T00:00:00Z", "ext": {"sDolY5qz": {}, "PgE0eMDe": {}, "jDj7ZqSr": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 96, "itemCount": 84, "rule": "SEQUENCE"}, "items": [{"id": "FvKfeLS2", "sku": "wRLzozmD"}, {"id": "W80EnXn2", "sku": "53pMdcBq"}, {"id": "VNMvKSVt", "sku": "dgOjtfOW"}], "localizations": {"HbjoHmjM": {"description": "ZS4GMrlm", "localExt": {"4BoY1SIQ": {}, "t2d9b2wQ": {}, "4umxNmfI": {}}, "longDescription": "4xicGIUl", "title": "ba2MmjXP"}, "SyFdHdEB": {"description": "u0Q6mbkh", "localExt": {"jivdabn2": {}, "VZgftkLQ": {}, "BgilZQ3e": {}}, "longDescription": "vgH4KIV4", "title": "CLaymaZD"}, "3wnN22oW": {"description": "gCa0p7i9", "localExt": {"uUKb7lb7": {}, "V4QaKrse": {}, "Ytd2Wr6O": {}}, "longDescription": "SuqR6r9B", "title": "o8o2xBHY"}}, "name": "1h4qi6ci", "rotationType": "CUSTOM", "startDate": "1973-02-06T00:00:00Z", "viewId": "vmwmBb1R"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateSection' test.out

#- 185 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'PUfjzJyO' \
    --storeId '3Sd7bZTg' \
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
    --body '{"defaultLanguage": "8q6T0U3a", "defaultRegion": "ppkvXkmW", "description": "k7SO8drM", "supportedLanguages": ["L4weLYIU", "sQm49IpH", "oXrB0Wq6"], "supportedRegions": ["taWcDMyn", "UwL0Jz15", "Ig35SttM"], "title": "W4rz9X6w"}' \
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
    --body '{"catalogType": "ITEM", "fieldsToBeIncluded": ["wNNYPPnH", "v55M5Vp9", "tzh2Vtv2"], "idsToBeExported": ["nGa5eG4P", "YBC2Rw3F", "rSOzqPp2"], "storeId": "qmEcr5VY"}' \
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
    --storeId 'On426pyZ' \
    > test.out 2>&1
eval_tap $? 196 'GetStore' test.out

#- 197 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IuqkBxBz' \
    --body '{"defaultLanguage": "GLekHGTa", "defaultRegion": "9CqfjW0g", "description": "FNoRp8ps", "supportedLanguages": ["NGO9T0Fs", "MT9isL44", "1Vln1Qhf"], "supportedRegions": ["IxfQ3gqV", "w4JDILP1", "9Z8GSeHI"], "title": "BZdnQ6O7"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateStore' test.out

#- 198 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'plpy9jLO' \
    > test.out 2>&1
eval_tap $? 198 'DeleteStore' test.out

#- 199 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X3jaBlWc' \
    --action 'DELETE' \
    --itemSku 'OudWDJqP' \
    --itemType 'CODE' \
    --limit '58' \
    --offset '0' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'uSMcAlUi' \
    --updatedAtStart 'C32IaCDU' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 199 'QueryChanges' test.out

#- 200 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dBhvL7kI' \
    > test.out 2>&1
eval_tap $? 200 'PublishAll' test.out

#- 201 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c5fXbbnW' \
    > test.out 2>&1
eval_tap $? 201 'PublishSelected' test.out

#- 202 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rVYSLfZz' \
    > test.out 2>&1
eval_tap $? 202 'SelectAllRecords' test.out

#- 203 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Iro5EqFG' \
    --action 'UPDATE' \
    --itemSku 'CseT5wvb' \
    --itemType 'SEASON' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'Ri6L1Taf' \
    --updatedAtStart 'bVo153sc' \
    > test.out 2>&1
eval_tap $? 203 'SelectAllRecordsByCriteria' test.out

#- 204 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'j0j5BoN9' \
    --action 'UPDATE' \
    --itemSku '5v29ESdb' \
    --itemType 'LOOTBOX' \
    --type 'VIEW' \
    --updatedAtEnd 'y7SGpE6H' \
    --updatedAtStart 'nAsx0XZz' \
    > test.out 2>&1
eval_tap $? 204 'GetStatistic' test.out

#- 205 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'seMHqCMr' \
    > test.out 2>&1
eval_tap $? 205 'UnselectAllRecords' test.out

#- 206 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '05h39mNI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UhG2IVOS' \
    > test.out 2>&1
eval_tap $? 206 'SelectRecord' test.out

#- 207 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'NWlQ8dJf' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1m0ilNcm' \
    > test.out 2>&1
eval_tap $? 207 'UnselectRecord' test.out

#- 208 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YA39mSak' \
    --targetStoreId '5sivMcSt' \
    > test.out 2>&1
eval_tap $? 208 'CloneStore' test.out

#- 209 ExportStore
eval_tap 0 209 'ExportStore # SKIP deprecated' test.out

#- 210 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sWp6N6Rb' \
    --end '207vRYKi' \
    --limit '100' \
    --offset '75' \
    --sortBy 'a7W0nrhS' \
    --start 'b0JdcuY7' \
    --success  \
    > test.out 2>&1
eval_tap $? 210 'QueryImportHistory' test.out

#- 211 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '3NvZkfTK' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'QVJaTVIH' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 211 'ImportStoreByCSV' test.out

#- 212 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'dLDrBrLX' \
    --limit '81' \
    --offset '84' \
    --sku '0xbtbklj' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'O3K1Ceac' \
    > test.out 2>&1
eval_tap $? 212 'QuerySubscriptions' test.out

#- 213 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PztznTFz' \
    > test.out 2>&1
eval_tap $? 213 'RecurringChargeSubscription' test.out

#- 214 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'eSbfbniZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketDynamic' test.out

#- 215 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'QqwuzDbw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "DpBOHXzk"}' \
    > test.out 2>&1
eval_tap $? 215 'DecreaseTicketSale' test.out

#- 216 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'NGti8QIV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'GetTicketBoothID' test.out

#- 217 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'qbYf8uPW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 39, "orderNo": "E7KtH32I"}' \
    > test.out 2>&1
eval_tap $? 217 'IncreaseTicketSale' test.out

#- 218 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 58, "currencyCode": "q9Dshc9a", "expireAt": "1975-10-30T00:00:00Z"}, "debitPayload": {"count": 34, "currencyCode": "ucmSVYXU", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 46, "entitlementCollectionId": "kq8ic25G", "entitlementOrigin": "Twitch", "itemIdentity": "CaLz84Th", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "ii8i3thi"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Other", "count": 24, "currencyCode": "JurmZLEn", "expireAt": "1986-02-09T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "V5GA1O7D", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "XQXX2TYK", "entitlementOrigin": "Other", "itemIdentity": "IyBz4fpF", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "leivU1Y9"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 4, "currencyCode": "zYVpQURr", "expireAt": "1975-02-01T00:00:00Z"}, "debitPayload": {"count": 21, "currencyCode": "owlbdKtW", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 29, "entitlementCollectionId": "Ov6ZohjK", "entitlementOrigin": "Other", "itemIdentity": "7NOr5bVF", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "mivw3wkf"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "9kNoAec2"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 5, "currencyCode": "HkQEO9Ey", "expireAt": "1991-10-15T00:00:00Z"}, "debitPayload": {"count": 44, "currencyCode": "0us0ROth", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 34, "entitlementCollectionId": "faES0Zv2", "entitlementOrigin": "Steam", "itemIdentity": "2dFixhyz", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 77, "entitlementId": "nTguQ8yr"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Other", "count": 84, "currencyCode": "8HLBn9hM", "expireAt": "1980-05-23T00:00:00Z"}, "debitPayload": {"count": 45, "currencyCode": "mTF6JjQq", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 53, "entitlementCollectionId": "W8Cbl8wv", "entitlementOrigin": "GooglePlay", "itemIdentity": "XFEViPp0", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 74, "entitlementId": "gHQZoZXK"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 55, "currencyCode": "gr2PioFW", "expireAt": "1972-03-05T00:00:00Z"}, "debitPayload": {"count": 81, "currencyCode": "HiFLuHcL", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 56, "entitlementCollectionId": "hms0iohh", "entitlementOrigin": "Twitch", "itemIdentity": "VcOTAi9f", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 3, "entitlementId": "JXvWqifV"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "0eBliil1"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 17, "currencyCode": "kiodjkba", "expireAt": "1975-06-12T00:00:00Z"}, "debitPayload": {"count": 50, "currencyCode": "u4h8t7Rh", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 20, "entitlementCollectionId": "hgx3PNSJ", "entitlementOrigin": "Xbox", "itemIdentity": "WqbzgfpM", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 100, "entitlementId": "W52KDDkL"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 72, "currencyCode": "IJE9ih8q", "expireAt": "1984-08-27T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "qkYN57JC", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 63, "entitlementCollectionId": "8qtsmoI0", "entitlementOrigin": "Steam", "itemIdentity": "KTxkeeYz", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 28, "entitlementId": "SPd1b2zH"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 17, "currencyCode": "iIO9gSEC", "expireAt": "1976-12-29T00:00:00Z"}, "debitPayload": {"count": 63, "currencyCode": "pHyoupL1", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 48, "entitlementCollectionId": "LcTHBjsk", "entitlementOrigin": "Other", "itemIdentity": "SE36N9Kt", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 4, "entitlementId": "ObBw9IH4"}, "type": "DEBIT_WALLET"}], "userId": "hkLJBc4i"}], "metadata": {"jwnX3gzS": {}, "jJ5LxXnd": {}, "q3jZ5JL3": {}}, "needPreCheck": false, "transactionId": "FHQnWNl5", "type": "EiIWR571"}' \
    > test.out 2>&1
eval_tap $? 218 'Commit' test.out

#- 219 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '80' \
    --status 'SUCCESS' \
    --type 'eatgZNQv' \
    --userId 'YQ6qsstI' \
    > test.out 2>&1
eval_tap $? 219 'GetTradeHistoryByCriteria' test.out

#- 220 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '4pGnp0Rw' \
    > test.out 2>&1
eval_tap $? 220 'GetTradeHistoryByTransactionId' test.out

#- 221 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsJe1Y6F' \
    --body '{"achievements": [{"id": "w2NqY3jF", "value": 34}, {"id": "okBppzMe", "value": 24}, {"id": "i6mKXQZq", "value": 15}], "steamUserId": "AtWRFois"}' \
    > test.out 2>&1
eval_tap $? 221 'UnlockSteamUserAchievement' test.out

#- 222 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uB6wvOVu' \
    --xboxUserId 'htXHrk6P' \
    > test.out 2>&1
eval_tap $? 222 'GetXblUserAchievements' test.out

#- 223 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'dAAYrmG7' \
    --body '{"achievements": [{"id": "iR9hZcy5", "percentComplete": 1}, {"id": "AeAEWs0V", "percentComplete": 93}, {"id": "N8QP78Fu", "percentComplete": 37}], "serviceConfigId": "NrCqJqoE", "titleId": "ei1TIgC6", "xboxUserId": "prKlUR6j"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateXblUserAchievement' test.out

#- 224 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '5dNmioNe' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeCampaign' test.out

#- 225 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TjSG5B3F' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeEntitlement' test.out

#- 226 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'u0b1UGcg' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeFulfillment' test.out

#- 227 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'TzSMY3Hw' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizeIntegration' test.out

#- 228 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'JDx0hgX0' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeOrder' test.out

#- 229 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxmz4v2J' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizePayment' test.out

#- 230 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'pYLpkPWc' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeRevocation' test.out

#- 231 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyEYIM5I' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeSubscription' test.out

#- 232 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'iU6OlWtN' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeWallet' test.out

#- 233 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '4bDQ6FOb' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 233 'GetUserDLCByPlatform' test.out

#- 234 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gj1BIi0A' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 234 'GetUserDLC' test.out

#- 235 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQBTanst' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId '0psAkHfP' \
    --entitlementClazz 'CODE' \
    --entitlementName 'q1UOn97i' \
    --features '9A2nox02,OA2Re30x,KGLIfAUW' \
    --fuzzyMatchName  \
    --itemId 'foVDKCYO,ogW4tc9i,ATtvRg3z' \
    --limit '41' \
    --offset '38' \
    --origin 'Xbox' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserEntitlements' test.out

#- 236 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'atmQT03O' \
    --body '[{"collectionId": "uKmyxJpx", "endDate": "1986-07-15T00:00:00Z", "grantedCode": "XmldBuMt", "itemId": "VgUW2q8O", "itemNamespace": "oVa29mVa", "language": "BsH-wyhR", "origin": "IOS", "quantity": 86, "region": "jUIBpd03", "source": "REDEEM_CODE", "startDate": "1985-11-23T00:00:00Z", "storeId": "t5kQ6D5g"}, {"collectionId": "JUk7meuN", "endDate": "1978-04-27T00:00:00Z", "grantedCode": "fluDLroT", "itemId": "ST2IPhVQ", "itemNamespace": "21VHf0SM", "language": "Ka_kjQS_Aa", "origin": "Twitch", "quantity": 32, "region": "tTxYQN1V", "source": "REFERRAL_BONUS", "startDate": "1989-07-16T00:00:00Z", "storeId": "ExjEBU93"}, {"collectionId": "nU0DhdTo", "endDate": "1976-07-23T00:00:00Z", "grantedCode": "RMJ1bKRb", "itemId": "F96zWc7n", "itemNamespace": "wMIILqfL", "language": "Ypt-FAwG-Dl", "origin": "Xbox", "quantity": 87, "region": "jkjwijyS", "source": "REFERRAL_BONUS", "startDate": "1973-07-20T00:00:00Z", "storeId": "Z4dCHosT"}]' \
    > test.out 2>&1
eval_tap $? 236 'GrantUserEntitlement' test.out

#- 237 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'aOuX4cl5' \
    --activeOnly  \
    --appId 'BoRPE4CY' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementByAppId' test.out

#- 238 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '4TOtuNZK' \
    --activeOnly  \
    --limit '35' \
    --offset '40' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserEntitlementsByAppType' test.out

#- 239 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'bexKxIn8' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'B0JRpdnT' \
    --itemId 'hROeqVy9' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementByItemId' test.out

#- 240 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'aTDl8Q2G' \
    --ids 'YWcBRwwi,of1SMbAI,shaMUsF4' \
    --platform 'cYgRJzI6' \
    > test.out 2>&1
eval_tap $? 240 'GetUserActiveEntitlementsByItemIds' test.out

#- 241 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlLIQZiD' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform '4YljLbwO' \
    --sku 'Wty4rxae' \
    > test.out 2>&1
eval_tap $? 241 'GetUserEntitlementBySku' test.out

#- 242 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'k87fctwr' \
    --appIds 'rGdiJ0kz,GRgKOsqp,8FZCX9vn' \
    --itemIds 'sX8qrpZf,xt91IXue,Ncy9ZwE5' \
    --platform 'PvRy0r55' \
    --skus 'EmK53WSQ,78QGmUhJ,BTKUz403' \
    > test.out 2>&1
eval_tap $? 242 'ExistsAnyUserActiveEntitlement' test.out

#- 243 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '692ipYUX' \
    --platform 'oz4Dxqp8' \
    --itemIds '3rqOYLIv,2Q0iAZ3f,WO29fSCZ' \
    > test.out 2>&1
eval_tap $? 243 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 244 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 's4upObj2' \
    --appId '2dibYNLS' \
    > test.out 2>&1
eval_tap $? 244 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 245 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'h6mMJbAR' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'VLsc0slO' \
    --itemId 'as9cJQRf' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipByItemId' test.out

#- 246 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '0afbVCs0' \
    --ids '5EpiCCNE,TT3AggOC,2tHvK0RD' \
    --platform 'TWlqHk2K' \
    > test.out 2>&1
eval_tap $? 246 'GetUserEntitlementOwnershipByItemIds' test.out

#- 247 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogSeccPa' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'ZmdCNQGs' \
    --sku 'PS5L4fEm' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementOwnershipBySku' test.out

#- 248 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5nGqCtP' \
    > test.out 2>&1
eval_tap $? 248 'RevokeAllEntitlements' test.out

#- 249 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2SJgbC0C' \
    --entitlementIds 'xOiTYpcC' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlements' test.out

#- 250 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'PLekfQIk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zj6nPeIS' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlement' test.out

#- 251 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'GnLkmKxV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OjpTSnTW' \
    --body '{"collectionId": "CFlAO5dP", "endDate": "1993-01-12T00:00:00Z", "nullFieldList": ["T0BDCFR2", "I6285eMk", "3qnuhtsG"], "origin": "Oculus", "reason": "zKNNjf7R", "startDate": "1990-10-23T00:00:00Z", "status": "INACTIVE", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateUserEntitlement' test.out

#- 252 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'VhtrjvUF' \
    --namespace "$AB_NAMESPACE" \
    --userId 's6EYPCrB' \
    --body '{"options": ["Lo6rh9PO", "jDCHlcgq", "ZiLMR6oE"], "platform": "vFpwmfoQ", "requestId": "OjeiTagd", "useCount": 97}' \
    > test.out 2>&1
eval_tap $? 252 'ConsumeUserEntitlement' test.out

#- 253 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '93TD4rfA' \
    --namespace "$AB_NAMESPACE" \
    --userId '7hgBaf6A' \
    > test.out 2>&1
eval_tap $? 253 'DisableUserEntitlement' test.out

#- 254 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '2mbRyAkY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7cb0gm3' \
    > test.out 2>&1
eval_tap $? 254 'EnableUserEntitlement' test.out

#- 255 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'mzg1Xk76' \
    --namespace "$AB_NAMESPACE" \
    --userId '6vGAFaog' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementHistories' test.out

#- 256 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'zC7mcMJO' \
    --namespace "$AB_NAMESPACE" \
    --userId '7I7RPQSE' \
    > test.out 2>&1
eval_tap $? 256 'RevokeUserEntitlement' test.out

#- 257 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '50umToFD' \
    --namespace "$AB_NAMESPACE" \
    --userId '0wH8SXap' \
    --body '{"reason": "YqkxGn07", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 257 'RevokeUserEntitlementByUseCount' test.out

#- 258 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'Q3EolJLZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SuQIoopT' \
    --quantity '31' \
    > test.out 2>&1
eval_tap $? 258 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 259 RevokeUseCount
eval_tap 0 259 'RevokeUseCount # SKIP deprecated' test.out

#- 260 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'PRIzMy5t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XXC6uJuM' \
    --body '{"platform": "vfft1fws", "requestId": "gyJlgKJd", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 260 'SellUserEntitlement' test.out

#- 261 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMw2QGft' \
    --body '{"duration": 96, "endDate": "1989-02-03T00:00:00Z", "entitlementCollectionId": "T4twyIII", "entitlementOrigin": "Other", "itemId": "r0jkHxYu", "itemSku": "E9qemON4", "language": "19YYoKAa", "metadata": {"tINygyMT": {}, "5E5LoYNO": {}, "DDsKH6H5": {}}, "order": {"currency": {"currencyCode": "MOpqnUzL", "currencySymbol": "gTxxgPZY", "currencyType": "REAL", "decimals": 13, "namespace": "lS2duKpP"}, "ext": {"d7S6lZlO": {}, "YvD4wcsG": {}, "N1DKiVX1": {}}, "free": false}, "orderNo": "ckwcmsnF", "origin": "Steam", "overrideBundleItemQty": {"25lEYfd7": 78, "4XOPQTd0": 84, "DY0auPZf": 18}, "quantity": 45, "region": "oxpZdNwo", "source": "DLC", "startDate": "1981-05-22T00:00:00Z", "storeId": "wox7dvUI"}' \
    > test.out 2>&1
eval_tap $? 261 'FulfillItem' test.out

#- 262 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'sOqrYEis' \
    --body '{"code": "Cqi742hD", "language": "xf-vT", "region": "s3oCFJ4g"}' \
    > test.out 2>&1
eval_tap $? 262 'RedeemCode' test.out

#- 263 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2eB4EfT2' \
    --body '{"itemId": "PrnoeSAw", "itemSku": "GMrcQfXQ", "quantity": 62}' \
    > test.out 2>&1
eval_tap $? 263 'PreCheckFulfillItem' test.out

#- 264 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Waq19zPr' \
    --body '{"entitlementCollectionId": "3TAaNyL9", "entitlementOrigin": "Oculus", "metadata": {"V16SqfzN": {}, "sEZBbK7U": {}, "4aSfOyBZ": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "2UcIKHXy", "namespace": "zROG73eE"}, "item": {"itemId": "mVuiSJqf", "itemSku": "oJN8sGjB", "itemType": "Tph4LT6E"}, "quantity": 25, "type": "ITEM"}, {"currency": {"currencyCode": "RGvGkRoS", "namespace": "Rm49ceR4"}, "item": {"itemId": "HKg2U6h3", "itemSku": "b4gupX8d", "itemType": "bcYK2vTJ"}, "quantity": 22, "type": "CURRENCY"}, {"currency": {"currencyCode": "8Dp4r8bL", "namespace": "P93mrcin"}, "item": {"itemId": "Xsyn1op5", "itemSku": "DighuWW3", "itemType": "BRY9Gq3v"}, "quantity": 53, "type": "CURRENCY"}], "source": "EXPIRATION", "transactionId": "bVpJyucl"}' \
    > test.out 2>&1
eval_tap $? 264 'FulfillRewards' test.out

#- 265 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hD0exlSJ' \
    --endTime '4UonFkXR' \
    --limit '21' \
    --offset '31' \
    --productId '1iOvpnXW' \
    --startTime 'ujgGh59W' \
    --status 'FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPOrders' test.out

#- 266 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '8CjFZtau' \
    > test.out 2>&1
eval_tap $? 266 'QueryAllUserIAPOrders' test.out

#- 267 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'OFnkQFcs' \
    --endTime 'LI3UtSpA' \
    --limit '71' \
    --offset '93' \
    --startTime 'phXDlgaO' \
    --status 'FAIL' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserIAPConsumeHistory' test.out

#- 268 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5kMLxh4' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "OSMn-Jp", "productId": "L1yiB8T0", "region": "XRi4GvKM", "transactionId": "kQ5FGPfB", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 268 'MockFulfillIAPItem' test.out

#- 269 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '9vKETicn' \
    --discounted  \
    --itemId 'NaDopxwt' \
    --limit '40' \
    --offset '79' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserOrders' test.out

#- 270 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '3JqlomAC' \
    --body '{"currencyCode": "y8Qo5YH7", "currencyNamespace": "UKHPJnuQ", "discountCodes": ["78tTFDDI", "M9ofV2jW", "Gsq3ahw1"], "discountedPrice": 2, "entitlementPlatform": "Nintendo", "ext": {"un337P7V": {}, "FGzjiKuv": {}, "8hs9E0jV": {}}, "itemId": "TmwuRTlb", "language": "j87yRS8y", "options": {"skipPriceValidation": false}, "platform": "Steam", "price": 77, "quantity": 82, "region": "VF6RsT3J", "returnUrl": "0usQy4dF", "sandbox": false, "sectionId": "dmioHXY4"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateUserOrder' test.out

#- 271 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UyeO7aUh' \
    --itemId 'r5syE7dJ' \
    > test.out 2>&1
eval_tap $? 271 'CountOfPurchasedItem' test.out

#- 272 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JcQvZDZi' \
    --userId 'eUto8uRL' \
    > test.out 2>&1
eval_tap $? 272 'GetUserOrder' test.out

#- 273 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TZO4wEPU' \
    --userId 'z7Llpu7q' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "hXsE89Dz"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateUserOrderStatus' test.out

#- 274 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OqEc8aDw' \
    --userId 'AyHPBJhN' \
    > test.out 2>&1
eval_tap $? 274 'FulfillUserOrder' test.out

#- 275 GetUserOrderGrant
eval_tap 0 275 'GetUserOrderGrant # SKIP deprecated' test.out

#- 276 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nINDe4Wq' \
    --userId 'uicQX2EW' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrderHistories' test.out

#- 277 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'J2MqBxdq' \
    --userId '9K2gZQAp' \
    --body '{"additionalData": {"cardSummary": "uddClhvI"}, "authorisedTime": "1982-01-01T00:00:00Z", "chargebackReversedTime": "1975-05-11T00:00:00Z", "chargebackTime": "1986-10-01T00:00:00Z", "chargedTime": "1974-12-04T00:00:00Z", "createdTime": "1999-03-22T00:00:00Z", "currency": {"currencyCode": "wqaiPte8", "currencySymbol": "bEVmlWXc", "currencyType": "VIRTUAL", "decimals": 33, "namespace": "rb5fHINd"}, "customParameters": {"tvQBdc9C": {}, "XDe90iar": {}, "VgXo3SpO": {}}, "extOrderNo": "WIcUCLrk", "extTxId": "EPhapWnl", "extUserId": "l8MKavcG", "issuedAt": "1977-04-05T00:00:00Z", "metadata": {"0aTNkVgj": "m3zqSG9F", "OyUWr4CN": "XNLqcV8P", "gzGSuXyj": "vZE4rVpr"}, "namespace": "cemNiXrF", "nonceStr": "XL5JwpK7", "paymentMethod": "IUow4UpH", "paymentMethodFee": 36, "paymentOrderNo": "wzBnISxj", "paymentProvider": "XSOLLA", "paymentProviderFee": 70, "paymentStationUrl": "JdGdbhrJ", "price": 7, "refundedTime": "1972-01-28T00:00:00Z", "salesTax": 86, "sandbox": true, "sku": "ivNqbYNV", "status": "CHARGED", "statusReason": "XtyVgrlV", "subscriptionId": "JpnAZ5K7", "subtotalPrice": 60, "targetNamespace": "nT9gYULg", "targetUserId": "BthkCc3N", "tax": 57, "totalPrice": 1, "totalTax": 95, "txEndTime": "1989-05-13T00:00:00Z", "type": "oYbb8KrT", "userId": "TnVuBGkz", "vat": 23}' \
    > test.out 2>&1
eval_tap $? 277 'ProcessUserOrderNotification' test.out

#- 278 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OqiXmwkG' \
    --userId '6VLZnIb6' \
    > test.out 2>&1
eval_tap $? 278 'DownloadUserOrderReceipt' test.out

#- 279 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'JwuFva2U' \
    --body '{"currencyCode": "olN9Ynj4", "currencyNamespace": "biTh2HrJ", "customParameters": {"bHwoZMbV": {}, "A6xVmelF": {}, "5BGxsIwS": {}}, "description": "wYkj6Z5s", "extOrderNo": "sPs3VguE", "extUserId": "kQfIxImv", "itemType": "BUNDLE", "language": "ur", "metadata": {"NlP9tOUM": "uaNSfVBe", "7kNFMZ3p": "DiUQdL6q", "M2BTyQcS": "JK404ig2"}, "notifyUrl": "hnQ0hkXg", "omitNotification": false, "platform": "XTYsbCbi", "price": 50, "recurringPaymentOrderNo": "oD2LkuL5", "region": "XdKd3L1y", "returnUrl": "qsB3UK8d", "sandbox": true, "sku": "RsP20mbX", "subscriptionId": "YvuDXwFx", "title": "ctCspXJR"}' \
    > test.out 2>&1
eval_tap $? 279 'CreateUserPaymentOrder' test.out

#- 280 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GeAwe1ym' \
    --userId 'NFKg7BPq' \
    --body '{"description": "HCO38iUn"}' \
    > test.out 2>&1
eval_tap $? 280 'RefundUserPaymentOrder' test.out

#- 281 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ao5k3mII' \
    --body '{"code": "UG72KG3l", "orderNo": "GvKcKBPX"}' \
    > test.out 2>&1
eval_tap $? 281 'ApplyUserRedemption' test.out

#- 282 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'LuRvVp5k' \
    --body '{"meta": {"CGqfNPxE": {}, "AsROay4X": {}, "gWU1URdr": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Nintendo", "currencyCode": "HNUwsC7v", "namespace": "NUGL3QXF"}, "entitlement": {"entitlementId": "Pjbc9MDH"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "3yPWbquf", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 91, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "2d9JbvEm", "namespace": "zUCakpbx"}, "entitlement": {"entitlementId": "h7crVE8o"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "ricYysVF", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 87, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "pxYK0UH0", "namespace": "bjIUjW7p"}, "entitlement": {"entitlementId": "FD499qPd"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "sUmvV1pl", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 16, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "QJ5UiqJ8"}' \
    > test.out 2>&1
eval_tap $? 282 'DoRevocation' test.out

#- 283 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdWgsv6B' \
    --body '{"gameSessionId": "rBtH6Oq6", "payload": {"O0Rwqzve": {}, "XSv3bgAJ": {}, "1k7ii2og": {}}, "scid": "ZsGQeRJQ", "sessionTemplateName": "FoXOGrpY"}' \
    > test.out 2>&1
eval_tap $? 283 'RegisterXblSessions' test.out

#- 284 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '9tw5e5Lx' \
    --chargeStatus 'CHARGED' \
    --itemId 'dM3Gz186' \
    --limit '74' \
    --offset '23' \
    --sku 'b0UnudDR' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserSubscriptions' test.out

#- 285 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxHmqast' \
    --excludeSystem  \
    --limit '7' \
    --offset '100' \
    --subscriptionId 'pzWqQ04h' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionActivities' test.out

#- 286 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'eNsjKTsj' \
    --body '{"grantDays": 86, "itemId": "RXEaRhO4", "language": "vSt59eGc", "reason": "ONztPFyh", "region": "90ducL29", "source": "UmUqeJ5C"}' \
    > test.out 2>&1
eval_tap $? 286 'PlatformSubscribeSubscription' test.out

#- 287 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wFh2X5hl' \
    --itemId 'mi02mRMN' \
    > test.out 2>&1
eval_tap $? 287 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 288 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cRg0DYix' \
    --userId 'TbGjF342' \
    > test.out 2>&1
eval_tap $? 288 'GetUserSubscription' test.out

#- 289 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xlQKbqXy' \
    --userId '8mXxb6uP' \
    > test.out 2>&1
eval_tap $? 289 'DeleteUserSubscription' test.out

#- 290 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'm1I9IQ2Q' \
    --userId 'uicIjMWl' \
    --force  \
    --body '{"immediate": false, "reason": "BDVi0QnZ"}' \
    > test.out 2>&1
eval_tap $? 290 'CancelSubscription' test.out

#- 291 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'sxdNJMi9' \
    --userId '9rT77woW' \
    --body '{"grantDays": 43, "reason": "6q6h7Z2J"}' \
    > test.out 2>&1
eval_tap $? 291 'GrantDaysToSubscription' test.out

#- 292 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'O9Y2f6F7' \
    --userId 'senEv9Ra' \
    --excludeFree  \
    --limit '23' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 292 'GetUserSubscriptionBillingHistories' test.out

#- 293 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dGjIYAEo' \
    --userId 'z6OMCSYx' \
    --body '{"additionalData": {"cardSummary": "WT168MSY"}, "authorisedTime": "1996-09-28T00:00:00Z", "chargebackReversedTime": "1972-05-24T00:00:00Z", "chargebackTime": "1980-08-27T00:00:00Z", "chargedTime": "1971-07-08T00:00:00Z", "createdTime": "1979-04-18T00:00:00Z", "currency": {"currencyCode": "lYlZtvi4", "currencySymbol": "J9iQ4erL", "currencyType": "REAL", "decimals": 36, "namespace": "bo6TO3gG"}, "customParameters": {"ne2Wuit5": {}, "U0utUkqg": {}, "XTuCJXg7": {}}, "extOrderNo": "2NrYDZ0L", "extTxId": "kGlW6GH6", "extUserId": "Kw95iutZ", "issuedAt": "1975-10-28T00:00:00Z", "metadata": {"qr3hD6p3": "fKfBxjwS", "SXKDhKKe": "54lF4J21", "bf7rRgWv": "3tENfGUB"}, "namespace": "o0blkYAS", "nonceStr": "BB6ZYY1I", "paymentMethod": "yKahiuuN", "paymentMethodFee": 12, "paymentOrderNo": "riEPOcOg", "paymentProvider": "WXPAY", "paymentProviderFee": 26, "paymentStationUrl": "pRPbydg9", "price": 6, "refundedTime": "1992-11-24T00:00:00Z", "salesTax": 40, "sandbox": true, "sku": "OVQCVT3s", "status": "INIT", "statusReason": "Ls9bvL59", "subscriptionId": "w9ufirP8", "subtotalPrice": 8, "targetNamespace": "zUJuiZN7", "targetUserId": "zzyYACqu", "tax": 44, "totalPrice": 80, "totalTax": 74, "txEndTime": "1972-05-04T00:00:00Z", "type": "vakCBISQ", "userId": "ypAKfcBG", "vat": 88}' \
    > test.out 2>&1
eval_tap $? 293 'ProcessUserSubscriptionNotification' test.out

#- 294 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'yV1pSgKU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'um6GBpUv' \
    --body '{"count": 25, "orderNo": "crhE0vCQ"}' \
    > test.out 2>&1
eval_tap $? 294 'AcquireUserTicket' test.out

#- 295 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'Aqw4FSB3' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserCurrencyWallets' test.out

#- 296 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'eUF4Sguf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zg06jMnp' \
    --body '{"allowOverdraft": true, "amount": 54, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"KXbwNGjk": {}, "dnjhRR4Y": {}, "5lF1BXug": {}}, "reason": "phLdHVWW"}' \
    > test.out 2>&1
eval_tap $? 296 'DebitUserWalletByCurrencyCode' test.out

#- 297 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'FswjGXif' \
    --namespace "$AB_NAMESPACE" \
    --userId '15P4gENZ' \
    --limit '80' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 297 'ListUserCurrencyTransactions' test.out

#- 298 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'kcVR9N67' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ccno8Yh4' \
    --request '{"amount": 18, "debitBalanceSource": "PAYMENT", "metadata": {"P5e4WYIE": {}, "NXw2PTgs": {}, "SLsrobOx": {}}, "reason": "CvTSyA6E", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 298 'CheckBalance' test.out

#- 299 CheckWallet
eval_tap 0 299 'CheckWallet # SKIP deprecated' test.out

#- 300 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'Cr05kkFa' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZuaNUhb' \
    --body '{"amount": 89, "expireAt": "1994-07-29T00:00:00Z", "metadata": {"L0AmGFfS": {}, "UoGAD2UK": {}, "ebWMYcSa": {}}, "origin": "IOS", "reason": "vN3VLDJ2", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 300 'CreditUserWallet' test.out

#- 301 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'Ke1xSZi2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HR6EihzL' \
    --request '{"amount": 49, "debitBalanceSource": "OTHER", "metadata": {"VhrjPy0U": {}, "2syzPjJ6": {}, "OdS80uqF": {}}, "reason": "UEFvQdWv", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitByWalletPlatform' test.out

#- 302 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'SZ46vtug' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iV31rGgu' \
    --body '{"amount": 20, "metadata": {"KYLGsNUf": {}, "WRnTiEDz": {}, "ZgKoRpgu": {}}, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 302 'PayWithUserWallet' test.out

#- 303 GetUserWallet
eval_tap 0 303 'GetUserWallet # SKIP deprecated' test.out

#- 304 DebitUserWallet
eval_tap 0 304 'DebitUserWallet # SKIP deprecated' test.out

#- 305 DisableUserWallet
eval_tap 0 305 'DisableUserWallet # SKIP deprecated' test.out

#- 306 EnableUserWallet
eval_tap 0 306 'EnableUserWallet # SKIP deprecated' test.out

#- 307 ListUserWalletTransactions
eval_tap 0 307 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 308 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dla6Ga2d' \
    > test.out 2>&1
eval_tap $? 308 'ListViews' test.out

#- 309 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PYOpzzem' \
    --body '{"displayOrder": 8, "localizations": {"mJCaU8yD": {"description": "w1w0OEcn", "localExt": {"bpXAC6AS": {}, "kW3JlHzn": {}, "UxurF1Sv": {}}, "longDescription": "wDdR7PZw", "title": "NAOvn2pY"}, "Gmbreh0r": {"description": "AfZkfGfg", "localExt": {"5tXOpTNF": {}, "lWP17kJO": {}, "9Xnp932q": {}}, "longDescription": "Cr5y4wV4", "title": "UBjoacCQ"}, "Q82ZhBKA": {"description": "SQQ7ALs3", "localExt": {"6W01JunS": {}, "yDGAoX9b": {}, "74kO36jB": {}}, "longDescription": "6MpvIId5", "title": "oSogkIMe"}}, "name": "p8AaQM0p"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateView' test.out

#- 310 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'veWFuHpG' \
    --storeId 'AcwPxkZk' \
    > test.out 2>&1
eval_tap $? 310 'GetView' test.out

#- 311 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'EEVe1Mu2' \
    --storeId 'PDbSAkrX' \
    --body '{"displayOrder": 84, "localizations": {"B1WBKxe0": {"description": "qhMTBFWg", "localExt": {"GGvo8FSN": {}, "ieFPVaMu": {}, "FHsjUW9Z": {}}, "longDescription": "cMznLVut", "title": "0pmLRlui"}, "SFuaa282": {"description": "ob8ljuC4", "localExt": {"KXdZx96P": {}, "tRmUqda3": {}, "sb0oLFC6": {}}, "longDescription": "ulzzSTu1", "title": "FnhHRbqM"}, "qQ7JYkID": {"description": "5VK8Nbua", "localExt": {"q5erNyhA": {}, "ycWCuPwN": {}, "naPVn5SD": {}}, "longDescription": "Z9EkCItW", "title": "N5m9lN2l"}}, "name": "JO9tHxib"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateView' test.out

#- 312 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'sv2euBpe' \
    --storeId 'hUrKXmqH' \
    > test.out 2>&1
eval_tap $? 312 'DeleteView' test.out

#- 313 QueryWallets
eval_tap 0 313 'QueryWallets # SKIP deprecated' test.out

#- 314 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 99, "expireAt": "1980-06-26T00:00:00Z", "metadata": {"7XwblOZc": {}, "O876KwNV": {}, "AqpBuMt6": {}}, "origin": "Nintendo", "reason": "uSKa6wTs", "source": "SELL_BACK"}, "currencyCode": "IDxEVfgF", "userIds": ["P41OfC5u", "PvIR0nJU", "JeE9rfNC"]}, {"creditRequest": {"amount": 62, "expireAt": "1990-08-31T00:00:00Z", "metadata": {"k5qSHzLp": {}, "rkmFklwl": {}, "PHvN1KtU": {}}, "origin": "Steam", "reason": "cUNYQXHa", "source": "REWARD"}, "currencyCode": "t7Rr67pk", "userIds": ["00NUyul2", "F83rp2MW", "gCDCpas4"]}, {"creditRequest": {"amount": 9, "expireAt": "1982-03-28T00:00:00Z", "metadata": {"S3opsTT9": {}, "41ysAOmh": {}, "fRKCLAou": {}}, "origin": "IOS", "reason": "sDBfjrNZ", "source": "IAP"}, "currencyCode": "TrONesPO", "userIds": ["HAG1fXpH", "U1b2IO6j", "HWX1qtjY"]}]' \
    > test.out 2>&1
eval_tap $? 314 'BulkCredit' test.out

#- 315 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "u6EezRW5", "request": {"allowOverdraft": true, "amount": 29, "balanceOrigin": "Twitch", "balanceSource": "DLC_REVOCATION", "metadata": {"LRNgzLsg": {}, "iDmrH5hH": {}, "4yUw5K3I": {}}, "reason": "af9BG0aL"}, "userIds": ["QtGBN2Wc", "7MnZpK8w", "SgQgmCWO"]}, {"currencyCode": "cwDJFDEt", "request": {"allowOverdraft": false, "amount": 88, "balanceOrigin": "Steam", "balanceSource": "ORDER_REVOCATION", "metadata": {"ud49BlMt": {}, "L6ecsuI9": {}, "V9Mtlxfr": {}}, "reason": "kfA16n2n"}, "userIds": ["72xUXxaE", "KtCTiPaq", "9KrTEIHq"]}, {"currencyCode": "kZIzAG1D", "request": {"allowOverdraft": true, "amount": 29, "balanceOrigin": "Oculus", "balanceSource": "DLC_REVOCATION", "metadata": {"gxYH6ibf": {}, "eL8F4Rdh": {}, "OavOYRcs": {}}, "reason": "CV5ql7j3"}, "userIds": ["rPtkb0uK", "kN983NjI", "y6E2mzrf"]}]' \
    > test.out 2>&1
eval_tap $? 315 'BulkDebit' test.out

#- 316 GetWallet
eval_tap 0 316 'GetWallet # SKIP deprecated' test.out

#- 317 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'tEBimrmn' \
    --end 'jqGX6HbW' \
    --start '4YKaSvEW' \
    > test.out 2>&1
eval_tap $? 317 'SyncOrders' test.out

#- 318 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["8dBstuET", "EsVkGOi8", "ieHLeMz5"], "apiKey": "PrlZ0VIN", "authoriseAsCapture": false, "blockedPaymentMethods": ["Ffe4XPIg", "w4n57Q6k", "OsUbJuG0"], "clientKey": "hq8jUX1V", "dropInSettings": "3C4CIr5D", "liveEndpointUrlPrefix": "wqFF8lnT", "merchantAccount": "7vfDMB54", "notificationHmacKey": "AxkRBjHq", "notificationPassword": "1Uh0c293", "notificationUsername": "oqZKl59h", "returnUrl": "EWIJr3Ub", "settings": "06lMT4vW"}' \
    > test.out 2>&1
eval_tap $? 318 'TestAdyenConfig' test.out

#- 319 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Edr2Xlo5", "privateKey": "F21yyrdo", "publicKey": "soXC05ik", "returnUrl": "JziP9eLd"}' \
    > test.out 2>&1
eval_tap $? 319 'TestAliPayConfig' test.out

#- 320 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "kHz6ovDD", "secretKey": "1va2CdAB"}' \
    > test.out 2>&1
eval_tap $? 320 'TestCheckoutConfig' test.out

#- 321 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'ZMs7BJ4e' \
    > test.out 2>&1
eval_tap $? 321 'DebugMatchedPaymentMerchantConfig' test.out

#- 322 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "Hvsav2Mp", "clientSecret": "6fzemOyR", "returnUrl": "6vRooSki", "webHookId": "aXV7b94k"}' \
    > test.out 2>&1
eval_tap $? 322 'TestPayPalConfig' test.out

#- 323 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["Z9k8Qrgr", "nih7mZHN", "VgwJ26rV"], "publishableKey": "uZFqeeeA", "secretKey": "dSdN0bwb", "webhookSecret": "e839c4kO"}' \
    > test.out 2>&1
eval_tap $? 323 'TestStripeConfig' test.out

#- 324 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "leXReMbF", "key": "Wy53Jxs0", "mchid": "OZ3SghmX", "returnUrl": "XVzZcfdh"}' \
    > test.out 2>&1
eval_tap $? 324 'TestWxPayConfig' test.out

#- 325 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "z3ZnnhRT", "flowCompletionUrl": "J5JKrtjL", "merchantId": 63, "projectId": 73, "projectSecretKey": "lGoYLtaK"}' \
    > test.out 2>&1
eval_tap $? 325 'TestXsollaConfig' test.out

#- 326 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'dWnNJvZ4' \
    > test.out 2>&1
eval_tap $? 326 'GetPaymentMerchantConfig' test.out

#- 327 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'fBAAYzkZ' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["ibI5fgVv", "QhzqzcN6", "6lZPr7bM"], "apiKey": "ZAlsgvjv", "authoriseAsCapture": true, "blockedPaymentMethods": ["GmQLce56", "6xTRVobr", "awa20M1S"], "clientKey": "wFdNleqm", "dropInSettings": "Xgm9qjPV", "liveEndpointUrlPrefix": "qZOTz5Ir", "merchantAccount": "wkQN09XN", "notificationHmacKey": "TSYzKc4d", "notificationPassword": "8DDmDG0t", "notificationUsername": "wmYNbFdG", "returnUrl": "1fSrTehL", "settings": "WT21KSCz"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAdyenConfig' test.out

#- 328 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'qFIrZFq5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAdyenConfigById' test.out

#- 329 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'pFkT07rw' \
    --sandbox  \
    --validate  \
    --body '{"appId": "t4TUT5Bu", "privateKey": "KttRkr0X", "publicKey": "ZhM3x4aV", "returnUrl": "9MhioZGq"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateAliPayConfig' test.out

#- 330 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'tc50lCnF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestAliPayConfigById' test.out

#- 331 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '424D0IDe' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "px7UOGm5", "secretKey": "CG4ekEB7"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdateCheckoutConfig' test.out

#- 332 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'r2Ey1hJX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestCheckoutConfigById' test.out

#- 333 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '0LOIH30g' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "UFchzCbi", "clientSecret": "WHyccJQ0", "returnUrl": "uHJIjgDY", "webHookId": "4unQTwlx"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdatePayPalConfig' test.out

#- 334 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'dm47G446' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestPayPalConfigById' test.out

#- 335 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'sHnjMaO4' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["0f7PmqJZ", "xYyp62IP", "b3vMINPU"], "publishableKey": "gEt4tQ0N", "secretKey": "SrVPKE2g", "webhookSecret": "DU9EKbML"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateStripeConfig' test.out

#- 336 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'TzMMxMVp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestStripeConfigById' test.out

#- 337 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'zrI7LZJi' \
    --validate  \
    --body '{"appId": "who43mMD", "key": "yUP54ye7", "mchid": "zaEDhnCT", "returnUrl": "2bxVNwd5"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateWxPayConfig' test.out

#- 338 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'DzyG2zSD' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 338 'UpdateWxPayConfigCert' test.out

#- 339 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'qJCxxt02' \
    > test.out 2>&1
eval_tap $? 339 'TestWxPayConfigById' test.out

#- 340 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ecYVFCFo' \
    --validate  \
    --body '{"apiKey": "ADJcTLbD", "flowCompletionUrl": "WCTwnbaP", "merchantId": 9, "projectId": 63, "projectSecretKey": "gfAQ9Saq"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaConfig' test.out

#- 341 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '9p4Q9NOC' \
    > test.out 2>&1
eval_tap $? 341 'TestXsollaConfigById' test.out

#- 342 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ZqKkFzes' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateXsollaUIConfig' test.out

#- 343 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '33' \
    --namespace "$AB_NAMESPACE" \
    --offset '24' \
    --region '5QKbzpxn' \
    > test.out 2>&1
eval_tap $? 343 'QueryPaymentProviderConfig' test.out

#- 344 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "V639y42d", "region": "u7KEZimt", "sandboxTaxJarApiToken": "VBIBDZa8", "specials": ["WALLET", "CHECKOUT", "XSOLLA"], "taxJarApiToken": "3Wd7WL2o", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 344 'CreatePaymentProviderConfig' test.out

#- 345 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetAggregatePaymentProviders' test.out

#- 346 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'z11Z8wu6' \
    > test.out 2>&1
eval_tap $? 346 'DebugMatchedPaymentProviderConfig' test.out

#- 347 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 347 'GetSpecialPaymentProviders' test.out

#- 348 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'nodVPyub' \
    --body '{"aggregate": "ADYEN", "namespace": "Bl84ndfQ", "region": "GVtdjDTE", "sandboxTaxJarApiToken": "rv1HlvpC", "specials": ["XSOLLA", "CHECKOUT", "WALLET"], "taxJarApiToken": "q0WbLWCi", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 348 'UpdatePaymentProviderConfig' test.out

#- 349 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '6WMkV4vl' \
    > test.out 2>&1
eval_tap $? 349 'DeletePaymentProviderConfig' test.out

#- 350 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 350 'GetPaymentTaxConfig' test.out

#- 351 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "IAyzr82w", "taxJarApiToken": "40ePrAxm", "taxJarEnabled": false, "taxJarProductCodesMapping": {"KuELw4I1": "rjrYtrMJ", "9DOxFGkF": "c2G8zybh", "oJ2CjvlP": "IPAyhVK0"}}' \
    > test.out 2>&1
eval_tap $? 351 'UpdatePaymentTaxConfig' test.out

#- 352 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'QbIadd39' \
    --end 'd0Xql9ho' \
    --start 'jLCpBSNy' \
    > test.out 2>&1
eval_tap $? 352 'SyncPaymentOrders' test.out

#- 353 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'fHZAvAaZ' \
    --storeId '1skV4gv2' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetRootCategories' test.out

#- 354 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'fnuDW43R' \
    --storeId 'FSEkeIU2' \
    > test.out 2>&1
eval_tap $? 354 'DownloadCategories' test.out

#- 355 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'MntebXPD' \
    --namespace "$AB_NAMESPACE" \
    --language 'j1u6IH8M' \
    --storeId 'DD7eKa8O' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetCategory' test.out

#- 356 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'gmrUz6cf' \
    --namespace "$AB_NAMESPACE" \
    --language 'UvYVShwm' \
    --storeId 'fFyNfpuh' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetChildCategories' test.out

#- 357 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'oqRDsM4c' \
    --namespace "$AB_NAMESPACE" \
    --language 'xu2lLx31' \
    --storeId 'K4ZX8ADX' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetDescendantCategories' test.out

#- 358 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 358 'PublicListCurrencies' test.out

#- 359 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 359 'GeDLCDurableRewardShortMap' test.out

#- 360 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 360 'GetIAPItemMapping' test.out

#- 361 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'd5W17O4v' \
    --region '990nlPpI' \
    --storeId '2tZ0dUh2' \
    --appId 'LMsLASpe' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemByAppId' test.out

#- 362 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'UlwuKNZ0' \
    --categoryPath 'Qgrcftd4' \
    --features '7VnWbQ9q' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'FItzL1D0' \
    --limit '66' \
    --offset '15' \
    --region 'F4f23s5P' \
    --sortBy 'name:asc,createdAt,updatedAt:asc' \
    --storeId 'IlwZM3SU' \
    --tags 'JNWvHCGN' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryItems' test.out

#- 363 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'LyPEx4am' \
    --region 'C1kmJwuJ' \
    --storeId 'w89Gjf2S' \
    --sku 'Ht9wmbti' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItemBySku' test.out

#- 364 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'hLB4UBLc' \
    --storeId 'AJGpdmOO' \
    --itemIds 'ApoQMMFt' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetEstimatedPrice' test.out

#- 365 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'rTTX401v' \
    --region 'FBTLVX5N' \
    --storeId 'V5RXXxtg' \
    --itemIds 'EgiZ2aHv' \
    > test.out 2>&1
eval_tap $? 365 'PublicBulkGetItems' test.out

#- 366 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["WjFi7tBJ", "1shR9jzk", "wDQ4rAL3"]}' \
    > test.out 2>&1
eval_tap $? 366 'PublicValidateItemPurchaseCondition' test.out

#- 367 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'MEDIA' \
    --limit '10' \
    --offset '30' \
    --region 'ppklmi0f' \
    --storeId 'XnYiaIqj' \
    --keyword 'J0dRGeFY' \
    --language 'mSU0PUa8' \
    > test.out 2>&1
eval_tap $? 367 'PublicSearchItems' test.out

#- 368 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'FLqUfN5R' \
    --namespace "$AB_NAMESPACE" \
    --language 'Lezei9yo' \
    --region 'SlwBMLyp' \
    --storeId 'pKHF4RME' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetApp' test.out

#- 369 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '3qpUGxy1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemDynamicData' test.out

#- 370 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'cdvPg4CK' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'c9lUzuWF' \
    --populateBundle  \
    --region 'bBFxxQe3' \
    --storeId 'rumc2guV' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetItem' test.out

#- 371 GetPaymentCustomization
eval_tap 0 371 'GetPaymentCustomization # SKIP deprecated' test.out

#- 372 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "n0soh0Vk", "paymentProvider": "ALIPAY", "returnUrl": "wQtFagcE", "ui": "yPQZqT2M", "zipCode": "6ioGI3Ho"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetPaymentUrl' test.out

#- 373 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gAWK3JfB' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentMethods' test.out

#- 374 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Yqv7JkdB' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUnpaidPaymentOrder' test.out

#- 375 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PAlFIYWE' \
    --paymentProvider 'ADYEN' \
    --zipCode 'lQFp3LDQ' \
    --body '{"token": "Zsd9fmEr"}' \
    > test.out 2>&1
eval_tap $? 375 'Pay' test.out

#- 376 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IvL3erE5' \
    > test.out 2>&1
eval_tap $? 376 'PublicCheckPaymentOrderPaidStatus' test.out

#- 377 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region '67qoCrG3' \
    > test.out 2>&1
eval_tap $? 377 'GetPaymentPublicConfig' test.out

#- 378 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'dBXCsoHU' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetQRCode' test.out

#- 379 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'wOKhCCE2' \
    --foreinginvoice 'dNAQchCF' \
    --invoiceId 'cd0JJyaN' \
    --payload 'zgluHRTh' \
    --redirectResult '7oe4VvSA' \
    --resultCode '2C5seS0v' \
    --sessionId 'WjBm3jf2' \
    --status 'lNKKv7iI' \
    --token 'J7F0qk98' \
    --type '11nOdBev' \
    --userId 'PwW3BfES' \
    --orderNo 'kfdV4dgS' \
    --paymentOrderNo 'CqqEg90m' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'aTeyBhpU' \
    > test.out 2>&1
eval_tap $? 379 'PublicNormalizePaymentReturnUrl' test.out

#- 380 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'k1Oc8FoA' \
    --paymentOrderNo 'kkGFiS9s' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 380 'GetPaymentTaxValue' test.out

#- 381 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'R38jFsg3' \
    > test.out 2>&1
eval_tap $? 381 'GetRewardByCode' test.out

#- 382 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'OMZJw12Z' \
    --limit '73' \
    --offset '66' \
    --sortBy 'rewardCode:asc,namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 382 'QueryRewards1' test.out

#- 383 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '82WC0a3S' \
    > test.out 2>&1
eval_tap $? 383 'GetReward1' test.out

#- 384 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicListStores' test.out

#- 385 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'wlHEtROm,bDNP56m4,w1M7J6hI' \
    --itemIds '2k6RhsRf,8zWDzr0I,kA6xUwqj' \
    --skus 'WIfCtBlL,NOpO4ex5,ALLsYR5i' \
    > test.out 2>&1
eval_tap $? 385 'PublicExistsAnyMyActiveEntitlement' test.out

#- 386 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'kGwTZi6G' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 387 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'yYLT1FbX' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 388 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'JNELk3gm' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 389 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ZQhcQebo,QKkZHFwb,9VTYs28V' \
    --itemIds 'nLQde1zw,x5oqQsIk,5zRo95WZ' \
    --skus 'gyzVLzKF,pwdgepJG,AjnvTNbi' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetEntitlementOwnershipToken' test.out

#- 390 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "fWOr9bwv", "language": "AsRS-xOEX_MN", "region": "6vXhqUrt"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncTwitchDropsEntitlement' test.out

#- 391 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'B1uT4kOc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicGetMyWallet' test.out

#- 392 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRkNJjEg' \
    --body '{"epicGamesJwtToken": "6FaMTO69"}' \
    > test.out 2>&1
eval_tap $? 392 'SyncEpicGameDLC' test.out

#- 393 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'kvRJcNIU' \
    > test.out 2>&1
eval_tap $? 393 'SyncOculusDLC' test.out

#- 394 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'cIfLNDCA' \
    --body '{"serviceLabel": 99}' \
    > test.out 2>&1
eval_tap $? 394 'PublicSyncPsnDlcInventory' test.out

#- 395 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '6ivJrfxa' \
    --body '{"serviceLabels": [81, 18, 27]}' \
    > test.out 2>&1
eval_tap $? 395 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 396 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkea8BOS' \
    --body '{"appId": "ib7EhwvQ", "steamId": "O0fHYCUL"}' \
    > test.out 2>&1
eval_tap $? 396 'SyncSteamDLC' test.out

#- 397 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wBxFxQSq' \
    --body '{"xstsToken": "QL1IE6Kk"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncXboxDLC' test.out

#- 398 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'X0PheJ4w' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'CODE' \
    --entitlementName 'uBNESALm' \
    --features 'iABEV78q,JYajaqdm,SAufzdDF' \
    --itemId 'jreryIVv,FQhtWre9,8rBw0Z6W' \
    --limit '78' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlements' test.out

#- 399 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gkbs2upT' \
    --appId 'hBtiaazn' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserAppEntitlementByAppId' test.out

#- 400 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '2eMqy54k' \
    --limit '96' \
    --offset '78' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 400 'PublicQueryUserEntitlementsByAppType' test.out

#- 401 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'MYubsIZk' \
    --availablePlatformOnly  \
    --ids 'mFqapsrc,UY4wumSZ,8xWD6WbM' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlementsByIds' test.out

#- 402 PublicGetUserEntitlementByItemId
eval_tap 0 402 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 403 PublicGetUserEntitlementBySku
eval_tap 0 403 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 404 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FgI3SySk' \
    --endDate 'liksGwbo' \
    --entitlementClazz 'LOOTBOX' \
    --limit '20' \
    --offset '47' \
    --startDate 'O5oH0KD8' \
    > test.out 2>&1
eval_tap $? 404 'PublicUserEntitlementHistory' test.out

#- 405 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hEUJdshY' \
    --appIds 'PMIpJdbn,tbcdH4T0,YsTA1Z9P' \
    --itemIds 'kJOjl5g1,jX5Hg7r5,Q63HtygM' \
    --skus 'QR5f2bKu,oOf1K5tq,C3qhrdw5' \
    > test.out 2>&1
eval_tap $? 405 'PublicExistsAnyUserActiveEntitlement' test.out

#- 406 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '4OEYFdLY' \
    --appId '1meXYs3E' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 407 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'd2CfUn7A' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'TtHPCbJ1' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 408 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBsUbknA' \
    --ids 'Mcn5gZ43,umKUtPuN,BOOdmq3l' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 409 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrS8qd7u' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'mRiXmJOG' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 410 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'H6y0raa3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7NvRHNE' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserEntitlement' test.out

#- 411 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'mwOjVbmv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YoyIfYrV' \
    --body '{"options": ["ugxVDSso", "G3BPfSfi", "QocRUbfQ"], "requestId": "eO02gwdm", "useCount": 4}' \
    > test.out 2>&1
eval_tap $? 411 'PublicConsumeUserEntitlement' test.out

#- 412 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'HNtXs3ph' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ev4h2JzD' \
    --body '{"requestId": "m1p1TyJG", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 412 'PublicSellUserEntitlement' test.out

#- 413 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'wNcWK3gA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xt3Tl3au' \
    --body '{"useCount": 68}' \
    > test.out 2>&1
eval_tap $? 413 'PublicSplitUserEntitlement' test.out

#- 414 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'UMLXulWx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KuJJMmnL' \
    --body '{"entitlementId": "d5vloT8N", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 414 'PublicTransferUserEntitlement' test.out

#- 415 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLzNFu0p' \
    --body '{"code": "96oMF5hQ", "language": "kIWD_984", "region": "462red4S"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicRedeemCode' test.out

#- 416 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Falb0STO' \
    --body '{"excludeOldTransactions": false, "language": "Rgr_ajWo_un", "productId": "CY6LBfuv", "receiptData": "jDEWlfPj", "region": "cfVOWRuj", "transactionId": "jzLi99ev"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicFulfillAppleIAPItem' test.out

#- 417 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBsvGTV5' \
    --body '{"epicGamesJwtToken": "MrqtAAn8"}' \
    > test.out 2>&1
eval_tap $? 417 'SyncEpicGamesInventory' test.out

#- 418 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8sX5kfrm' \
    --body '{"autoAck": true, "language": "jX_532", "orderId": "oXyLIHrB", "packageName": "0WQdPHam", "productId": "kO6DVyOW", "purchaseTime": 66, "purchaseToken": "XNKoU5iA", "region": "A3IoVYRw"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicFulfillGoogleIAPItem' test.out

#- 419 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'W884nAKx' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusConsumableEntitlements' test.out

#- 420 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '0qr9gmfH' \
    --body '{"currencyCode": "HVJcykLV", "price": 0.7062222204474369, "productId": "WMu2gOV7", "serviceLabel": 72}' \
    > test.out 2>&1
eval_tap $? 420 'PublicReconcilePlayStationStore' test.out

#- 421 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZfHK1cV' \
    --body '{"currencyCode": "LpCaySuD", "price": 0.4831289173997064, "productId": "AKXMvx2C", "serviceLabels": [0, 43, 79]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 422 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGEapAE8' \
    --body '{"appId": "axhW4G4f", "currencyCode": "CYgdN1LX", "language": "IErx-QVkY-RR", "price": 0.9771719818103958, "productId": "UK7Iz2Hk", "region": "vijmTENr", "steamId": "rQFzMOEu"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamInventory' test.out

#- 423 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpyxVscY' \
    --body '{"gameId": "LiKdpKat", "language": "lUTA-Rkby", "region": "M6YwfyMu"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncTwitchDropsEntitlement1' test.out

#- 424 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wotMOstc' \
    --body '{"currencyCode": "ZPTNKXZv", "price": 0.3447508179328045, "productId": "cn12hmEs", "xstsToken": "jrxd0UfU"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncXboxInventory' test.out

#- 425 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5W0F4mT' \
    --discounted  \
    --itemId 'rJFjqSK5' \
    --limit '54' \
    --offset '72' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 425 'PublicQueryUserOrders' test.out

#- 426 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOBMBgGt' \
    --body '{"currencyCode": "YHQu9f2a", "discountCodes": ["nEugPBwM", "tcSDFtYI", "9I8BWz7o"], "discountedPrice": 17, "ext": {"Uf4m17RB": {}, "kNabG68O": {}, "VrVvEqs7": {}}, "itemId": "5iWEQ7lH", "language": "lmkF", "price": 21, "quantity": 42, "region": "r3uZFiye", "returnUrl": "XuQdzRvL", "sectionId": "hMy2u8uV"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicCreateUserOrder' test.out

#- 427 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bt2HtF4Z' \
    --body '{"currencyCode": "28QIG12b", "discountCodes": ["Ts1KPPVK", "uHy3NgcV", "lJcE5EWT"], "discountedPrice": 87, "itemId": "UiyVTLSA", "price": 26, "quantity": 24}' \
    > test.out 2>&1
eval_tap $? 427 'PublicPreviewOrderPrice' test.out

#- 428 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'm1f732an' \
    --userId 'NgB4gMVA' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetUserOrder' test.out

#- 429 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YdskDQ1z' \
    --userId 'xmi1eMmw' \
    > test.out 2>&1
eval_tap $? 429 'PublicCancelUserOrder' test.out

#- 430 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sR5wRZ5u' \
    --userId 'MwPh7YSm' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserOrderHistories' test.out

#- 431 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '21o2qAZE' \
    --userId 'pfvS7Bpz' \
    > test.out 2>&1
eval_tap $? 431 'PublicDownloadUserOrderReceipt' test.out

#- 432 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'wIpHyesE' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetPaymentAccounts' test.out

#- 433 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'sEedsw8i' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'fQdZ1dmN' \
    > test.out 2>&1
eval_tap $? 433 'PublicDeletePaymentAccount' test.out

#- 434 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xm0qHsP8' \
    --autoCalcEstimatedPrice  \
    --language 'ktjcrY0l' \
    --region 'QayqYXCe' \
    --storeId '4MN3yLTw' \
    --viewId 'jRmnafsD' \
    > test.out 2>&1
eval_tap $? 434 'PublicListActiveSections' test.out

#- 435 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'V9IDYcCe' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'N2oXhjZq' \
    --limit '29' \
    --offset '34' \
    --sku 'z2dts7Z2' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserSubscriptions' test.out

#- 436 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQS8Rvbo' \
    --body '{"currencyCode": "76h6p3qk", "itemId": "DZRl9rHl", "language": "rID", "region": "NOsU7NEZ", "returnUrl": "XyYgV4Fr", "source": "igipCslv"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicSubscribeSubscription' test.out

#- 437 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqwvBhoc' \
    --itemId 'jQfDd8lN' \
    > test.out 2>&1
eval_tap $? 437 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 438 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4ZtyH3yv' \
    --userId 'YppbKbBR' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserSubscription' test.out

#- 439 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RqkD9JD3' \
    --userId 'gIIMTDtE' \
    > test.out 2>&1
eval_tap $? 439 'PublicChangeSubscriptionBillingAccount' test.out

#- 440 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DNq9R9BP' \
    --userId 'qsn7kXEB' \
    --body '{"immediate": true, "reason": "31dKj1Fa"}' \
    > test.out 2>&1
eval_tap $? 440 'PublicCancelSubscription' test.out

#- 441 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8jA8qrtu' \
    --userId 'xieVpMyM' \
    --excludeFree  \
    --limit '65' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 441 'PublicGetUserSubscriptionBillingHistories' test.out

#- 442 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'YTTSyNHJ' \
    --language '5d56N3IE' \
    --storeId 'KwuEwb1X' \
    > test.out 2>&1
eval_tap $? 442 'PublicListViews' test.out

#- 443 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'FkOYbHRx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJHztrE8' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetWallet' test.out

#- 444 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'pUcO387q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VslhYZbC' \
    --limit '66' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 444 'PublicListUserWalletTransactions' test.out

#- 445 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'KaWLYF77' \
    --baseAppId '0A7SRtAz' \
    --categoryPath 'P45VhpSS' \
    --features 'opnKE5jc' \
    --includeSubCategoryItem  \
    --itemName 'M98c6rRU' \
    --itemStatus 'ACTIVE' \
    --itemType 'EXTENSION' \
    --limit '21' \
    --offset '57' \
    --region 'rWifNQcT' \
    --sectionExclusive  \
    --sortBy 'displayOrder,createdAt,updatedAt' \
    --storeId '2Nvb5uzg' \
    --tags 'N9MOIDh6' \
    --targetNamespace 'PWGxljRQ' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 445 'QueryItems1' test.out

#- 446 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J6u2v9iC' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 446 'ImportStore1' test.out

#- 447 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RubBG83P' \
    --body '{"itemIds": ["ub4j7RCf", "S8cpRaJP", "IklJol3D"]}' \
    > test.out 2>&1
eval_tap $? 447 'ExportStore1' test.out

#- 448 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '61TOTLDT' \
    --body '{"entitlementCollectionId": "7aA4inVV", "entitlementOrigin": "IOS", "metadata": {"X3ZvdReO": {}, "793UcH4B": {}, "fRNpWPlj": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "qYDpeMmc", "namespace": "UulsOiNQ"}, "item": {"itemId": "AsBYj5Zo", "itemSku": "b03hDcPu", "itemType": "9kzGaHtH"}, "quantity": 14, "type": "ITEM"}, {"currency": {"currencyCode": "JFA3R7KV", "namespace": "Y3FijTYs"}, "item": {"itemId": "AGjeeJi0", "itemSku": "qc9EDNpf", "itemType": "cs5bMI8M"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "aq8fmjwF", "namespace": "2Ab9U8Ku"}, "item": {"itemId": "A4F9NbRP", "itemSku": "KRpcKKms", "itemType": "UmvwlUCY"}, "quantity": 27, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "hgSTlMTL"}' \
    > test.out 2>&1
eval_tap $? 448 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
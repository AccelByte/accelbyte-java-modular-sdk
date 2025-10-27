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
echo "1..507"

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
    --id 'MiIHcOhG' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'mvXraQp5' \
    --body '{"grantDays": "haeSvjJf"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'nGbjb6Yz' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'QejTN4It' \
    --body '{"grantDays": "U7MYveSC"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "jOaeADHo", "dryRun": false, "fulfillmentUrl": "DYPCP8rs", "itemType": "CODE", "purchaseConditionUrl": "tAEaHKUh"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'b8D9vDxq' \
    --itemType 'EXTENSION' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'nLXHWqpe' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '7OX4Y5jg' \
    --body '{"clazz": "KOiJxivr", "dryRun": true, "fulfillmentUrl": "dEbZPFli", "purchaseConditionUrl": "3JSVriXR"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'IHUrdnqx' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --name 'Ro5pASqR' \
    --offset '98' \
    --tag '5w6zJpuj' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TdmFIPzH", "discountConfig": {"categories": [{"categoryPath": "i6FXhpeL", "includeSubCategories": true}, {"categoryPath": "ORRh0f27", "includeSubCategories": false}, {"categoryPath": "wrnSAgl8", "includeSubCategories": false}], "currencyCode": "oU8dR6fJ", "currencyNamespace": "UrIwpolJ", "discountAmount": 90, "discountPercentage": 39, "discountType": "AMOUNT", "items": [{"itemId": "QtDaDQKJ", "itemName": "TLdaZnlt"}, {"itemId": "CXAGIKG6", "itemName": "IfjNDo52"}, {"itemId": "hSorXWYY", "itemName": "B9OCwWx3"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 7, "itemId": "YFmoGXBq", "itemName": "AMzXvLsA", "quantity": 20}, {"extraSubscriptionDays": 8, "itemId": "BqO2h98A", "itemName": "HoMzHgf3", "quantity": 81}, {"extraSubscriptionDays": 39, "itemId": "PAsFZE8B", "itemName": "hxHdZ9Mi", "quantity": 71}], "maxRedeemCountPerCampaignPerUser": 48, "maxRedeemCountPerCode": 11, "maxRedeemCountPerCodePerUser": 31, "maxSaleCount": 69, "name": "6nsROU70", "redeemEnd": "1979-12-31T00:00:00Z", "redeemStart": "1998-09-30T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["83v1aeTf", "2DgicEt7", "aH42wDv5"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'nemZVsLv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'SdiqlPk3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mchH5X3C", "discountConfig": {"categories": [{"categoryPath": "H4ZoJfwq", "includeSubCategories": true}, {"categoryPath": "UlvLjqA6", "includeSubCategories": false}, {"categoryPath": "lLJYIT1G", "includeSubCategories": true}], "currencyCode": "wFQf0c3J", "currencyNamespace": "y7wCVyXX", "discountAmount": 83, "discountPercentage": 1, "discountType": "PERCENTAGE", "items": [{"itemId": "qQLGX6rJ", "itemName": "w4jNLZSl"}, {"itemId": "lDvifG2t", "itemName": "KuqlQwVb"}, {"itemId": "7raKPoUk", "itemName": "RULZjHXy"}], "restrictType": "NONE", "stackable": false}, "items": [{"extraSubscriptionDays": 2, "itemId": "vw7ENyV3", "itemName": "f0BIXTDk", "quantity": 64}, {"extraSubscriptionDays": 95, "itemId": "2LgRJmaF", "itemName": "HleqMV4Y", "quantity": 28}, {"extraSubscriptionDays": 88, "itemId": "WKmaHG1c", "itemName": "Zr0CYyut", "quantity": 66}], "maxRedeemCountPerCampaignPerUser": 35, "maxRedeemCountPerCode": 49, "maxRedeemCountPerCodePerUser": 57, "maxSaleCount": 20, "name": "c4JVseFM", "redeemEnd": "1998-04-28T00:00:00Z", "redeemStart": "1979-04-15T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["7vzw3wgD", "hpyprwzg", "6GXGwdIC"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'Jw0x1Pd6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "hjjqQZp2", "oldName": "GaRy2mXF"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'gFGvINWG' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'hW3CDh4Q' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'Xq1nNJRY' \
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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["ENTITLEMENT", "CATALOG", "DLC"]}' \
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
    --body '{"appConfig": {"appName": "uYP0dewP"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "SdFrcZcl"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "MwMHkm2p"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "Nae9gwJ4"}, "extendType": "CUSTOM"}' \
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
    --storeId 'g4QY6yTM' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '1O6E6UEP' \
    --body '{"categoryPath": "px2A2Zoo", "localizationDisplayNames": {"ArD06sBi": "PKdK2Z3W", "y0mMigRo": "LqoSBWY8", "Pahu1p3i": "AR4h3k4l"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G49ICZOn' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'ouhwNTXg' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1M9wqnrE' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '4gdp83vA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VYz3UOvu' \
    --body '{"localizationDisplayNames": {"EXVuHqQI": "XSY0pBi0", "IvZxU7uc": "3uAEonfp", "89ZeXsXM": "1NF9rnuI"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '9JF2XC4g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zNN0u7o8' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'tPJk9BNT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BuJAjL8m' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'YlyU1c9P' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H2HR9oOs' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'qEYrxFfD' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName '6LAZZbgK' \
    --batchNo '80,85,72' \
    --code 'aP7M6Toz' \
    --limit '80' \
    --offset '99' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'V3Ok7uq6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "WLnxKCBg", "codeValue": "8wpzOiVS", "quantity": 24}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '3EL9Pi8N' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'ac3L6mwm' \
    --batchNo '87,3,6' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'kXAggB2n' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'pkVbCRK5' \
    --batchNo '48,52,98' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '4TLg4azR' \
    --namespace "$AB_NAMESPACE" \
    --batchName '8Ub1JQQC' \
    --batchNo '48,2,29' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'xk6rdMOZ' \
    --namespace "$AB_NAMESPACE" \
    --code 'GB7xJhYp' \
    --limit '21' \
    --offset '0' \
    --userId '2aFxaslT' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'HYPTgBZA' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'FM6iyE6y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'evv9WFoT' \
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
    --body '{"currencyCode": "PiJVIvOb", "currencySymbol": "y1kC6FbK", "currencyType": "REAL", "decimals": 74, "localizationDescriptions": {"uN2QUKNh": "Q0n60Njj", "MKBBupM6": "9R4iPVsq", "uLdCZcss": "f2WRQ4d6"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'zU5SvDKs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"fQxJYjAW": "jsxK54ed", "VIOdYjmU": "PI4Z37ty", "vygNF0hU": "cARfm5ty"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'RusL2Ji6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'jWErEqzC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '3ueVT5AX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'WNqDFWwd' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'jvYo11m8' \
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
    --body '{"data": [{"autoUpdate": true, "enableRevocation": true, "id": "Fk4lBZYh", "rewards": [{"currency": {"currencyCode": "RcUvlW1p", "namespace": "lyKU0QJI"}, "item": {"itemId": "xRLVB28R", "itemName": "JyDEXUc3", "itemSku": "zuQ4rw4M", "itemType": "M357RkMe"}, "quantity": 81, "type": "ITEM"}, {"currency": {"currencyCode": "WPsV43mB", "namespace": "jw10h13V"}, "item": {"itemId": "uavfuops", "itemName": "mVoBuSOV", "itemSku": "CG9V1ycQ", "itemType": "Na5Yuca1"}, "quantity": 45, "type": "ITEM"}, {"currency": {"currencyCode": "eus4yYdI", "namespace": "3I5BKwjl"}, "item": {"itemId": "4ekYF9nz", "itemName": "XHvsAsU8", "itemSku": "acTWjv32", "itemType": "jPO7BNBJ"}, "quantity": 0, "type": "ITEM"}], "rvn": 54}, {"autoUpdate": false, "enableRevocation": true, "id": "3HcMQCLx", "rewards": [{"currency": {"currencyCode": "y6iJ551i", "namespace": "jT38omJJ"}, "item": {"itemId": "vNZzmiEP", "itemName": "WJ18rflX", "itemSku": "XWMgVeQ7", "itemType": "yUXZH7AQ"}, "quantity": 3, "type": "ITEM"}, {"currency": {"currencyCode": "TPDdUbCU", "namespace": "3YEpE9sG"}, "item": {"itemId": "Xs0EZ3yH", "itemName": "IMta3VUU", "itemSku": "e36Am5to", "itemType": "bxjLU4td"}, "quantity": 50, "type": "CURRENCY"}, {"currency": {"currencyCode": "Xa0vgGid", "namespace": "xg6LkRqG"}, "item": {"itemId": "s84EY4W1", "itemName": "rQn704HB", "itemSku": "IWIH1Qcj", "itemType": "o5nAO4TG"}, "quantity": 34, "type": "CURRENCY"}], "rvn": 21}, {"autoUpdate": true, "enableRevocation": true, "id": "La5GSziq", "rewards": [{"currency": {"currencyCode": "Fst2xN7f", "namespace": "4jWL2wOa"}, "item": {"itemId": "XJfeRfPf", "itemName": "SKPkHjbj", "itemSku": "lj9D3bd5", "itemType": "IrLU1SRh"}, "quantity": 75, "type": "ITEM"}, {"currency": {"currencyCode": "1JhICxTg", "namespace": "yF3Xaqy4"}, "item": {"itemId": "XPpHsBDH", "itemName": "UloXxrKm", "itemSku": "iHvfXwGM", "itemType": "690egCZE"}, "quantity": 39, "type": "ITEM"}, {"currency": {"currencyCode": "DPI81VTj", "namespace": "Bmkfw8vI"}, "item": {"itemId": "nGeGCVqH", "itemName": "jgo4jotJ", "itemSku": "bK2xE7G4", "itemType": "OrShwKwr"}, "quantity": 63, "type": "CURRENCY"}], "rvn": 30}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"G6RMJJFm": "okbIsxSL", "7PQQEmG4": "FSEtIdNu", "hxIPSna1": "hf6rmJ4I"}}, {"platform": "STEAM", "platformDlcIdMap": {"PZV9fTdn": "b3QbpcBb", "hQpzQ6Kw": "CNS3G3PX", "cEKGuaVh": "Xap762u8"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"VslfOECw": "ZEddj5GB", "G3b4iZA6": "LwMdMHsd", "jleMDaDV": "GblROc8K"}}]}' \
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
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 't4LFQEW5' \
    --itemId 'EK0RKR5w,rgghZpBK,LX2B0iwe' \
    --limit '23' \
    --offset '38' \
    --origin 'GooglePlay' \
    --userId 'K5AgSy3y' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '2mxLKe11,IkLKg4L9,WKc3ufHT' \
    --limit '32' \
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
    --body '{"entitlementGrantList": [{"collectionId": "A3fxQXsV", "endDate": "1992-05-18T00:00:00Z", "grantedCode": "2cwBQug7", "itemId": "2cwYZH3J", "itemNamespace": "PqXMy8iy", "language": "Grs-NTJe", "metadata": {"B4GWeWWd": {}, "IeYQSn74": {}, "Rh3Bod0V": {}}, "origin": "Other", "quantity": 31, "region": "wLtG3OuS", "source": "IAP", "startDate": "1974-08-04T00:00:00Z", "storeId": "OgI41Mp6"}, {"collectionId": "cLmqOICq", "endDate": "1989-03-02T00:00:00Z", "grantedCode": "TZnhpqrm", "itemId": "4zahUL2E", "itemNamespace": "X7lDNagJ", "language": "lFXV_Wphn-it", "metadata": {"H8biDRl2": {}, "fWV5yNuM": {}, "HaDElSg7": {}}, "origin": "Oculus", "quantity": 52, "region": "tWesLWRf", "source": "PROMOTION", "startDate": "1995-03-04T00:00:00Z", "storeId": "OgyHC1X4"}, {"collectionId": "MPrHu6VU", "endDate": "1985-09-13T00:00:00Z", "grantedCode": "ISXvroAO", "itemId": "XNTq0A84", "itemNamespace": "ymc4QT7G", "language": "Uaz-uzYc", "metadata": {"vudoXIpS": {}, "EUyf5IQz": {}, "VfyevPMa": {}}, "origin": "GooglePlay", "quantity": 14, "region": "hWbOGCi6", "source": "ACHIEVEMENT", "startDate": "1981-08-07T00:00:00Z", "storeId": "B9PgSjSV"}], "userIds": ["Sehb1BNR", "wO3fZgs8", "1MiUqO6d"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["MrltOUjO", "MAgNkXmi", "7zB0d91U"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'tKggFNmY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '87' \
    --status 'FAIL' \
    --userId 'SLW3HG6f' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'KS6t7HAX' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'BzTDMIPm' \
    --limit '76' \
    --offset '46' \
    --startTime '6LQs2KKn' \
    --status 'SUCCESS' \
    --userId '58caXDp4' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "TMr7zYUL", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 84, "clientTransactionId": "ZZHuH8TC"}, {"amountConsumed": 2, "clientTransactionId": "Zb9HrRu5"}, {"amountConsumed": 7, "clientTransactionId": "NZXr8y1n"}], "entitlementId": "LlswSqoN", "usageCount": 93}, {"clientTransaction": [{"amountConsumed": 3, "clientTransactionId": "WGUVc93b"}, {"amountConsumed": 48, "clientTransactionId": "6t6hH4eX"}, {"amountConsumed": 89, "clientTransactionId": "BYLS29cJ"}], "entitlementId": "i5dgcPCQ", "usageCount": 75}, {"clientTransaction": [{"amountConsumed": 79, "clientTransactionId": "r1TpBrEB"}, {"amountConsumed": 46, "clientTransactionId": "PF1TgHJF"}, {"amountConsumed": 87, "clientTransactionId": "KsH15LG1"}], "entitlementId": "XmXR494R", "usageCount": 6}], "purpose": "M1htFCSt"}, "originalTitleName": "7aQSfG7P", "paymentProductSKU": "fHB6APVQ", "purchaseDate": "zX4IPSI7", "sourceOrderItemId": "rMfvPk7U", "titleName": "tOHubs5R"}, "eventDomain": "xLQ199GV", "eventSource": "xCzXcxqN", "eventType": "yTpglO4J", "eventVersion": 24, "id": "gOUo0f0w", "timestamp": "ELE9dSsn"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "fBWfTaV2", "eventState": "wUMJbdeG", "lineItemId": "RSowYiQw", "orderId": "ZxAGMurT", "productId": "uHOLRrbq", "productType": "MicgA6n7", "purchasedDate": "NlcLnN7c", "sandboxId": "bJ3lqJWk", "skuId": "oz6g1NrH", "subscriptionData": {"consumedDurationInDays": 75, "dateTime": "utpYUMxt", "durationInDays": 33, "recurrenceId": "PHqnwVmo"}}, "datacontenttype": "NGlfdbiN", "id": "PurRQoiz", "source": "pLWdzZDm", "specVersion": "u2GnNcMB", "subject": "4dtgFWxc", "time": "VSPREYA7", "traceparent": "clF0niyE", "type": "efoypfBw"}' \
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
    --body '{"appAppleId": 36, "bundleId": "HUqsc0pY", "issuerId": "I69QmUKO", "keyId": "DGiqTm62", "password": "ceiVfSnp", "version": "V2"}' \
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
    --body '{"sandboxId": "TDJWqFlO"}' \
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
    --body '{"applicationName": "U0xblVeG", "notificationTokenAudience": "aYPtVmgQ", "notificationTokenEmail": "nHDxe34B", "packageName": "ZekvCfrO", "serviceAccountId": "E35OIQKt"}' \
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
    --body '{"data": [{"itemIdentity": "zyKviS0E", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"LyR87SlM": "S4MTxCmj", "KzSrmfRT": "pug9JLVW", "PqTNzlc7": "u9KYfkSJ"}}, {"itemIdentity": "WqWaCwdh", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"GEw93iUk": "jFGt2cgY", "qKTeUC4H": "zE7Nwrbs", "IcedtfOq": "g9X0bWTI"}}, {"itemIdentity": "vsHzSDRK", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"tsdRutcI": "6Fe3XlEG", "beWtrheA": "mxEnN59k", "VnWROxng": "v4o6Ezrz"}}]}' \
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
    --body '{"appId": "3rT1Cqpx", "appSecret": "JWVjzBr7", "webhookVerifyToken": "5fr8pn7W"}' \
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
    --body '{"sku": "ui9vgUae"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'aHaMFAQG' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'Yq0mE4zN' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "AB9A4dxo", "sku": "djB5avxa"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku '8ognffYO' \
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
    --body '{"backOfficeServerClientId": "G2aFSdwd", "backOfficeServerClientSecret": "TvIHS0Mv", "enableStreamJob": true, "environment": "6MGvwFLY", "streamName": "HFiB8N0g", "streamPartnerName": "ap9NUZP6"}' \
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
    --body '{"backOfficeServerClientId": "VMptYNsL", "backOfficeServerClientSecret": "qWpy7ssa", "enableStreamJob": false, "environment": "0yaqKItn", "streamName": "FrOKZwW5", "streamPartnerName": "NUEmslMs"}' \
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
    --body '{"appId": "5qos0iYU", "env": "SANDBOX", "publisherAuthenticationKey": "6PySKKSg", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "kLbR1xq8", "clientSecret": "FulqLM5a", "organizationId": "lZWQWN7W"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "SIgPVwI2", "entraAppClientSecret": "XWi352UL", "entraTenantId": "Pst7Wr4f", "relyingPartyCert": "LmtmEevC"}' \
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
    --password 'UGOMiOuc' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '6oGwC6Up' \
    --externalId 'qVkTFUDo' \
    --limit '42' \
    --offset '24' \
    --source 'EPICGAMES' \
    --startDate 'VqeNKvUQ' \
    --status 'ERROR' \
    --type 'SvSQNzIb' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '93' \
    --orderId 'oyloHXSo' \
    --steamId 'y6AiN4Cc' \
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
    --body '{"env": "SANDBOX", "lastTime": "1972-12-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'aWep6j8q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '10' \
    --orderId 'FDnt7BFR' \
    --processStatus 'PROCESSED' \
    --steamId '8qsBy3h8' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 't2OFI6Zr' \
    --limit '43' \
    --offset '36' \
    --platform 'GOOGLE' \
    --productId 'lfyMnNMs' \
    --userId 'WS0dmhgE' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'sETBUBLC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'grc6movE' \
    --feature 'mCwUrNC8' \
    --itemId 'qLUPnU0V' \
    --itemType 'EXTENSION' \
    --startTime 'AklWkqaC' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'BmvIkNq3' \
    --feature 'qt52HJEs' \
    --itemId 'T3iKkLxL' \
    --itemType 'SEASON' \
    --startTime 'SEXgBM0t' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Cmb8FXpy' \
    --body '{"categoryPath": "qmXYssUM", "targetItemId": "cGDMWr4u", "targetNamespace": "pIsz2WkW"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '6GjriOOG' \
    --body '{"appId": "Lb5kcOb5", "appType": "DEMO", "baseAppId": "PAYekyW6", "boothName": "gF1cjGz6", "categoryPath": "5ZXIrIVC", "clazz": "h9pW4kQE", "displayOrder": 31, "entitlementType": "DURABLE", "ext": {"Yw9Xcn4e": {}, "SbEOc4sT": {}, "29cTTpRU": {}}, "features": ["TUY2sncp", "Kmh8RlxH", "oyxHVVFH"], "flexible": false, "images": [{"as": "INdRudHT", "caption": "ik9Pk0pf", "height": 90, "imageUrl": "W2L7Tfvp", "smallImageUrl": "c9O7pbbK", "width": 13}, {"as": "l9zBM26s", "caption": "36tvh2dU", "height": 41, "imageUrl": "lLbCGi42", "smallImageUrl": "uLf2PU6o", "width": 88}, {"as": "IJgY5Aqg", "caption": "IeOpcgSg", "height": 83, "imageUrl": "d8ZRL5Eu", "smallImageUrl": "ZqD8AeJL", "width": 86}], "inventoryConfig": {"customAttributes": {"0wK4eFXd": {}, "KC6iNvUW": {}, "CKd80rFK": {}}, "serverCustomAttributes": {"tSJdOYxJ": {}, "k1xEPnFA": {}, "DIy67LGP": {}}, "slotUsed": 85}, "itemId": "inrXbIX5", "itemIds": ["ixI9QyMO", "AoTN8iI5", "A9yd8VNe"], "itemQty": {"BjugsQLr": 40, "0cauO7fL": 72, "7SRNwflT": 65}, "itemType": "MEDIA", "listable": true, "localizations": {"cnEd2YCs": {"description": "5vDX5vex", "localExt": {"yxm3NPY3": {}, "hloaDFFT": {}, "dUDU1Uqo": {}}, "longDescription": "7VzY1bav", "title": "ISFZLMEn"}, "2mhnvpKx": {"description": "YjxV3IoN", "localExt": {"ty6SReIm": {}, "uS9uW1WH": {}, "QR0AIn87": {}}, "longDescription": "iVEZ919d", "title": "kDqibdjb"}, "jTc6RvWW": {"description": "wFx9NOn0", "localExt": {"OGRdu9xi": {}, "k6HMoiWp": {}, "tJY2TBNV": {}}, "longDescription": "NAq0ECnH", "title": "nVogpHpB"}}, "lootBoxConfig": {"rewardCount": 80, "rewards": [{"lootBoxItems": [{"count": 45, "duration": 43, "endDate": "1990-07-11T00:00:00Z", "itemId": "LIQ4ZSfP", "itemSku": "BIC2MEYn", "itemType": "Erhqj4Dn"}, {"count": 94, "duration": 64, "endDate": "1999-09-23T00:00:00Z", "itemId": "8RxlYZ4Q", "itemSku": "0ivfgUxz", "itemType": "YlsrZG3y"}, {"count": 33, "duration": 16, "endDate": "1989-03-19T00:00:00Z", "itemId": "8M3q6yAt", "itemSku": "JVPvBR6J", "itemType": "Cbr57Nuy"}], "name": "Bl7VVUTA", "odds": 0.6845592812160101, "type": "REWARD_GROUP", "weight": 84}, {"lootBoxItems": [{"count": 17, "duration": 78, "endDate": "1995-11-03T00:00:00Z", "itemId": "BX2MactZ", "itemSku": "4B2iDEYn", "itemType": "RnOHkwFy"}, {"count": 32, "duration": 19, "endDate": "1994-07-31T00:00:00Z", "itemId": "zhvRiizq", "itemSku": "I8syzqyW", "itemType": "RNBPa6Wz"}, {"count": 23, "duration": 38, "endDate": "1972-12-16T00:00:00Z", "itemId": "HlRhvRzP", "itemSku": "RBOK49ZZ", "itemType": "SX65bdQq"}], "name": "4pjJE5gZ", "odds": 0.6645622033323754, "type": "REWARD_GROUP", "weight": 19}, {"lootBoxItems": [{"count": 94, "duration": 49, "endDate": "1981-01-06T00:00:00Z", "itemId": "ZQLCeGRk", "itemSku": "8vHYD4mh", "itemType": "R5ejyetz"}, {"count": 75, "duration": 81, "endDate": "1978-09-26T00:00:00Z", "itemId": "jZtbVYUJ", "itemSku": "9mIKpBee", "itemType": "2Jhar2Fm"}, {"count": 31, "duration": 8, "endDate": "1972-02-11T00:00:00Z", "itemId": "V671Uqkj", "itemSku": "JB9aShrk", "itemType": "0b371CVE"}], "name": "DYzAHAmQ", "odds": 0.5371969176779432, "type": "REWARD_GROUP", "weight": 12}], "rollFunction": "CUSTOM"}, "maxCount": 73, "maxCountPerUser": 1, "name": "qvvuoG8Z", "optionBoxConfig": {"boxItems": [{"count": 41, "duration": 20, "endDate": "1983-09-24T00:00:00Z", "itemId": "kE2Lp7kv", "itemSku": "UbOSHW1r", "itemType": "kY98UavQ"}, {"count": 57, "duration": 31, "endDate": "1995-01-20T00:00:00Z", "itemId": "oZhmPR8Q", "itemSku": "B50Q6bMf", "itemType": "mxYRYKjl"}, {"count": 42, "duration": 2, "endDate": "1990-03-24T00:00:00Z", "itemId": "CYEsgnrY", "itemSku": "nqhCnYhD", "itemType": "3sX5EAmA"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 81, "fixedTrialCycles": 41, "graceDays": 77}, "regionData": {"qPjkXCtW": [{"currencyCode": "o9PuqFRS", "currencyNamespace": "IkNWQ7TB", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1992-02-17T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1991-10-18T00:00:00Z", "expireAt": "1995-10-27T00:00:00Z", "price": 79, "purchaseAt": "1980-11-03T00:00:00Z", "trialPrice": 51}, {"currencyCode": "BMzupHiu", "currencyNamespace": "sawUQ3D2", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1982-03-27T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1992-02-27T00:00:00Z", "expireAt": "1991-02-19T00:00:00Z", "price": 47, "purchaseAt": "1984-02-16T00:00:00Z", "trialPrice": 10}, {"currencyCode": "Gvt83elW", "currencyNamespace": "1tD4PGY4", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1986-10-31T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1990-01-08T00:00:00Z", "expireAt": "1980-06-24T00:00:00Z", "price": 88, "purchaseAt": "1991-08-23T00:00:00Z", "trialPrice": 99}], "IodxDBTQ": [{"currencyCode": "g42ST50R", "currencyNamespace": "XSV7hxWQ", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1972-03-06T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1999-05-19T00:00:00Z", "expireAt": "1995-04-16T00:00:00Z", "price": 49, "purchaseAt": "1990-01-09T00:00:00Z", "trialPrice": 74}, {"currencyCode": "EUwUC9Bc", "currencyNamespace": "F4MZ8vTs", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1972-08-09T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1977-12-17T00:00:00Z", "expireAt": "1999-10-18T00:00:00Z", "price": 28, "purchaseAt": "1977-12-13T00:00:00Z", "trialPrice": 97}, {"currencyCode": "SK61wfF2", "currencyNamespace": "tHiMcrL5", "currencyType": "VIRTUAL", "discountAmount": 59, "discountExpireAt": "1998-09-05T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1971-06-04T00:00:00Z", "expireAt": "1976-05-30T00:00:00Z", "price": 31, "purchaseAt": "1999-02-11T00:00:00Z", "trialPrice": 68}], "F24loVFw": [{"currencyCode": "Z9VwM97D", "currencyNamespace": "ZCobf88E", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1979-02-24T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1997-11-28T00:00:00Z", "expireAt": "1976-07-08T00:00:00Z", "price": 92, "purchaseAt": "1972-12-24T00:00:00Z", "trialPrice": 81}, {"currencyCode": "tYVOdjzI", "currencyNamespace": "NXwgiSos", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1974-05-06T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1976-07-29T00:00:00Z", "expireAt": "1989-03-18T00:00:00Z", "price": 58, "purchaseAt": "1986-01-20T00:00:00Z", "trialPrice": 44}, {"currencyCode": "YcZQnjeb", "currencyNamespace": "SAFSKeAX", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1979-11-30T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1990-07-08T00:00:00Z", "expireAt": "1984-11-05T00:00:00Z", "price": 94, "purchaseAt": "1986-07-08T00:00:00Z", "trialPrice": 7}]}, "saleConfig": {"currencyCode": "LKyIhO1e", "price": 58}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "q5furEN5", "stackable": false, "status": "INACTIVE", "tags": ["KZ0O8cPL", "HJFRFboA", "kHQ5Pvzc"], "targetCurrencyCode": "wGUjxFvx", "targetNamespace": "nVfCZ3Iu", "thumbnailUrl": "YWmIfEg7", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dUDmcS1x' \
    --appId 'WWGHZJ7t' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'awAayPXN' \
    --baseAppId 'Smx8UmKI' \
    --categoryPath 'EnWSYieX' \
    --features 'ZQqCJLvc' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '51' \
    --offset '38' \
    --region 'c40LG0lw' \
    --sortBy 'updatedAt,displayOrder:desc' \
    --storeId 'Pcz51gYE' \
    --tags 'mikz0RNU' \
    --targetNamespace 'XbiVfHOm' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'md4FiLb0,rY0VVhNq,hUcEHhcZ' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'GnH0k647' \
    --itemIds 'afDC0GqY' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UjIlU0W2' \
    --sku 'EqS5qWML' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'TPpEGore' \
    --populateBundle  \
    --region 'NXxbTWDg' \
    --storeId 'At3mDcTw' \
    --sku 'tyzkJqCu' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'vG6YqyOe' \
    --region 'H7xiiIPe' \
    --storeId 'uz7aEZYV' \
    --itemIds 'Ft4ACLuW' \
    --userId 'CgJ4xuDR' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2GcpNlxA' \
    --sku 'xRjRPs0L' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'GXMZ7Woo,G38uKP4T,gS0NimLQ' \
    --storeId 'SQ3RWOI5' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Y5JDy8CN' \
    --region '5ofc0FtH' \
    --storeId 'BtyGF1Nt' \
    --itemIds 'VwtEHSJH' \
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
    --platform '1sB42mpQ' \
    --userId 'o4nTEf6s' \
    --body '{"itemIds": ["TN9R6WAT", "sXPUtUwZ", "6dH6XcBT"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OHrGQ9Nh' \
    --body '{"changes": [{"itemIdentities": ["MDbKEKfi", "LERcpTNI", "fja6sS8h"], "itemIdentityType": "ITEM_ID", "regionData": {"hwoxmOPf": [{"currencyCode": "hRw6nxnh", "currencyNamespace": "PBiFmtaM", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1980-01-23T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1993-08-17T00:00:00Z", "discountedPrice": 98, "expireAt": "1972-11-20T00:00:00Z", "price": 96, "purchaseAt": "1995-04-11T00:00:00Z", "trialPrice": 98}, {"currencyCode": "A29AIvZb", "currencyNamespace": "ysw4RKd9", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1980-01-09T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1987-10-19T00:00:00Z", "discountedPrice": 16, "expireAt": "1975-07-11T00:00:00Z", "price": 87, "purchaseAt": "1988-04-14T00:00:00Z", "trialPrice": 48}, {"currencyCode": "eAtMOYed", "currencyNamespace": "oDNffvGC", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1971-05-27T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1973-06-20T00:00:00Z", "discountedPrice": 25, "expireAt": "1971-03-31T00:00:00Z", "price": 72, "purchaseAt": "1997-03-21T00:00:00Z", "trialPrice": 60}], "ns6TY8Mo": [{"currencyCode": "9nqSB4Kq", "currencyNamespace": "aP53zkm8", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1987-05-12T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-08-15T00:00:00Z", "discountedPrice": 7, "expireAt": "1984-06-06T00:00:00Z", "price": 51, "purchaseAt": "1979-08-24T00:00:00Z", "trialPrice": 53}, {"currencyCode": "bvD31hjS", "currencyNamespace": "L1z5gH8e", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1990-11-10T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1979-10-05T00:00:00Z", "discountedPrice": 84, "expireAt": "1980-01-28T00:00:00Z", "price": 10, "purchaseAt": "1988-07-16T00:00:00Z", "trialPrice": 92}, {"currencyCode": "kYpWqExJ", "currencyNamespace": "u24cd3j7", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1975-01-15T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1977-12-14T00:00:00Z", "discountedPrice": 28, "expireAt": "1974-10-12T00:00:00Z", "price": 90, "purchaseAt": "1984-06-19T00:00:00Z", "trialPrice": 24}], "p8UghNXR": [{"currencyCode": "ie7OIDZy", "currencyNamespace": "TAGGypcT", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1990-01-25T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1977-04-14T00:00:00Z", "discountedPrice": 77, "expireAt": "1972-02-21T00:00:00Z", "price": 44, "purchaseAt": "1981-07-01T00:00:00Z", "trialPrice": 0}, {"currencyCode": "MNfksxxh", "currencyNamespace": "09M5Ub2s", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1971-01-11T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1981-11-29T00:00:00Z", "discountedPrice": 58, "expireAt": "1971-06-18T00:00:00Z", "price": 96, "purchaseAt": "1990-04-01T00:00:00Z", "trialPrice": 54}, {"currencyCode": "CoI1mHpe", "currencyNamespace": "lLSgVxjP", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1988-02-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1978-04-04T00:00:00Z", "discountedPrice": 13, "expireAt": "1984-01-31T00:00:00Z", "price": 41, "purchaseAt": "1979-05-03T00:00:00Z", "trialPrice": 22}]}}, {"itemIdentities": ["2XzwLmP6", "Q2kZox7n", "ERoZlLmc"], "itemIdentityType": "ITEM_SKU", "regionData": {"1O0RoVNK": [{"currencyCode": "rezY0Ibx", "currencyNamespace": "krfYV5dW", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1973-11-29T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1971-07-24T00:00:00Z", "discountedPrice": 12, "expireAt": "1998-11-23T00:00:00Z", "price": 35, "purchaseAt": "1992-07-22T00:00:00Z", "trialPrice": 46}, {"currencyCode": "GKMQBirU", "currencyNamespace": "rTPDSB0g", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1985-07-10T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1972-09-22T00:00:00Z", "discountedPrice": 14, "expireAt": "1991-02-11T00:00:00Z", "price": 33, "purchaseAt": "1971-10-31T00:00:00Z", "trialPrice": 19}, {"currencyCode": "BnDv1YF9", "currencyNamespace": "Nt3S6syi", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1980-09-03T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1991-04-16T00:00:00Z", "discountedPrice": 34, "expireAt": "1971-10-02T00:00:00Z", "price": 61, "purchaseAt": "1976-03-13T00:00:00Z", "trialPrice": 52}], "jo7CpdKW": [{"currencyCode": "QXMZrQZj", "currencyNamespace": "DZcskXn3", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1988-06-19T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1976-06-08T00:00:00Z", "discountedPrice": 15, "expireAt": "1980-01-07T00:00:00Z", "price": 89, "purchaseAt": "1990-02-17T00:00:00Z", "trialPrice": 74}, {"currencyCode": "NahZKp4S", "currencyNamespace": "ZcL657oQ", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1983-10-28T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1973-10-02T00:00:00Z", "discountedPrice": 90, "expireAt": "1976-10-03T00:00:00Z", "price": 82, "purchaseAt": "1974-10-11T00:00:00Z", "trialPrice": 28}, {"currencyCode": "SxezU3vy", "currencyNamespace": "jtedGaXp", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1976-09-04T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1990-01-26T00:00:00Z", "discountedPrice": 19, "expireAt": "1985-03-05T00:00:00Z", "price": 23, "purchaseAt": "1990-05-22T00:00:00Z", "trialPrice": 85}], "DcXmLXic": [{"currencyCode": "9qutqb4V", "currencyNamespace": "z7FpGOSJ", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1987-08-17T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1986-09-07T00:00:00Z", "discountedPrice": 34, "expireAt": "1974-09-13T00:00:00Z", "price": 24, "purchaseAt": "1993-07-30T00:00:00Z", "trialPrice": 75}, {"currencyCode": "z2ClwWtB", "currencyNamespace": "9qZEj40U", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1990-01-18T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1985-08-17T00:00:00Z", "discountedPrice": 48, "expireAt": "1975-10-09T00:00:00Z", "price": 91, "purchaseAt": "1973-05-16T00:00:00Z", "trialPrice": 66}, {"currencyCode": "WXsif46Q", "currencyNamespace": "4ayrVyYW", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1976-12-22T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1996-01-12T00:00:00Z", "discountedPrice": 69, "expireAt": "1986-09-07T00:00:00Z", "price": 49, "purchaseAt": "1980-07-25T00:00:00Z", "trialPrice": 97}]}}, {"itemIdentities": ["EqFYO13X", "v2297EN4", "8JR4hSzB"], "itemIdentityType": "ITEM_ID", "regionData": {"MYjqVsnS": [{"currencyCode": "fuu2v75P", "currencyNamespace": "TNF3Ff9v", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1992-06-28T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1974-03-04T00:00:00Z", "discountedPrice": 67, "expireAt": "1986-01-04T00:00:00Z", "price": 27, "purchaseAt": "1982-09-25T00:00:00Z", "trialPrice": 31}, {"currencyCode": "ExUknR2l", "currencyNamespace": "EJaEMwCV", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1990-07-19T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1971-01-25T00:00:00Z", "discountedPrice": 96, "expireAt": "1979-06-14T00:00:00Z", "price": 42, "purchaseAt": "1988-08-28T00:00:00Z", "trialPrice": 74}, {"currencyCode": "WnFBvohB", "currencyNamespace": "aAMvyYwG", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1975-10-12T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1973-02-03T00:00:00Z", "discountedPrice": 38, "expireAt": "1981-02-27T00:00:00Z", "price": 38, "purchaseAt": "1987-07-08T00:00:00Z", "trialPrice": 60}], "Oabjxtje": [{"currencyCode": "WAQ1yOdR", "currencyNamespace": "i54p6dTn", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1987-07-07T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1997-08-13T00:00:00Z", "discountedPrice": 85, "expireAt": "1996-12-30T00:00:00Z", "price": 12, "purchaseAt": "1983-08-06T00:00:00Z", "trialPrice": 75}, {"currencyCode": "WbVnbD3a", "currencyNamespace": "fXKddFeu", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1971-03-29T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1997-03-03T00:00:00Z", "discountedPrice": 0, "expireAt": "1991-10-16T00:00:00Z", "price": 30, "purchaseAt": "1980-02-14T00:00:00Z", "trialPrice": 5}, {"currencyCode": "7l0oUdJw", "currencyNamespace": "Dg4Ngte8", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1987-04-20T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1998-11-08T00:00:00Z", "discountedPrice": 65, "expireAt": "1971-11-24T00:00:00Z", "price": 71, "purchaseAt": "1971-09-11T00:00:00Z", "trialPrice": 66}], "dB2ry14e": [{"currencyCode": "DlokchYQ", "currencyNamespace": "34H3KqQx", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1986-01-16T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1974-03-15T00:00:00Z", "discountedPrice": 17, "expireAt": "1980-06-02T00:00:00Z", "price": 22, "purchaseAt": "1978-03-31T00:00:00Z", "trialPrice": 67}, {"currencyCode": "vjOzv360", "currencyNamespace": "gZM1Oasw", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1977-10-02T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1991-06-02T00:00:00Z", "discountedPrice": 9, "expireAt": "1996-02-07T00:00:00Z", "price": 12, "purchaseAt": "1988-01-12T00:00:00Z", "trialPrice": 80}, {"currencyCode": "8SysJNMO", "currencyNamespace": "XnnUCenr", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1990-01-30T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1976-10-02T00:00:00Z", "discountedPrice": 61, "expireAt": "1981-10-18T00:00:00Z", "price": 33, "purchaseAt": "1985-02-01T00:00:00Z", "trialPrice": 5}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '40' \
    --offset '23' \
    --sortBy 'aFBnZdD2' \
    --storeId 'MZUB9AL9' \
    --keyword 'rdZZORJJ' \
    --language 'hBZBRlRe' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '48' \
    --offset '58' \
    --sortBy 'name:asc,name:desc,displayOrder:asc' \
    --storeId '7wuh1Mhc' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'famoZbOY' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'vCp9Pa3V' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'EbCK96uH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MtRPeJvA' \
    --body '{"appId": "5ubnIOrP", "appType": "DEMO", "baseAppId": "3xCsWHDl", "boothName": "B9KmXqCb", "categoryPath": "thLzSjGQ", "clazz": "C2m8PAMs", "displayOrder": 58, "entitlementType": "DURABLE", "ext": {"OBP5Uz8V": {}, "4yPgMj1c": {}, "m57L4vFq": {}}, "features": ["Ia6nOjND", "stk2Fw4v", "ruXCbBTP"], "flexible": false, "images": [{"as": "zYinucbT", "caption": "2cvHtOmR", "height": 78, "imageUrl": "ItxaAfN7", "smallImageUrl": "7ehb1gdA", "width": 4}, {"as": "8AOOrHkt", "caption": "t6WZo7iv", "height": 30, "imageUrl": "Oj32qiy8", "smallImageUrl": "vRevzSkO", "width": 6}, {"as": "BqhpNnvi", "caption": "C29qjajV", "height": 92, "imageUrl": "iNOWeMkk", "smallImageUrl": "Guk45RIs", "width": 55}], "inventoryConfig": {"customAttributes": {"hJRAo5Qc": {}, "t0mP2RD6": {}, "w2yfeKnx": {}}, "serverCustomAttributes": {"1Vn3ttpJ": {}, "QfYBDutc": {}, "AWVZ7jOz": {}}, "slotUsed": 39}, "itemIds": ["ioLJtPwF", "t9V13tiO", "r2rhsSJo"], "itemQty": {"B7q6XRmc": 62, "tIf3opon": 9, "hqXpAmKr": 73}, "itemType": "SEASON", "listable": true, "localizations": {"zjrpkWDM": {"description": "QhYQ0Iiz", "localExt": {"fsyVWBuS": {}, "rnN5smwe": {}, "16ezBbgv": {}}, "longDescription": "SpSl3HhR", "title": "pxLrixmJ"}, "kn64Y7BM": {"description": "eXQ9o94m", "localExt": {"Gw6puXue": {}, "hQ9J8AIX": {}, "QM6RMmFx": {}}, "longDescription": "kCo0MY6P", "title": "mB4pmbkv"}, "XlTHtPkS": {"description": "UY6w4cBE", "localExt": {"BjDxEzIY": {}, "HU8wbtfI": {}, "EabLtcq8": {}}, "longDescription": "23ehqwpY", "title": "470USOGO"}}, "lootBoxConfig": {"rewardCount": 59, "rewards": [{"lootBoxItems": [{"count": 28, "duration": 15, "endDate": "1993-08-25T00:00:00Z", "itemId": "3ppGrYku", "itemSku": "AqaGJ0kw", "itemType": "aoi2gU0B"}, {"count": 33, "duration": 0, "endDate": "1976-11-29T00:00:00Z", "itemId": "dwTlshE9", "itemSku": "oozyi1GU", "itemType": "aoWIrLHU"}, {"count": 45, "duration": 83, "endDate": "1977-06-19T00:00:00Z", "itemId": "VB0f4esW", "itemSku": "jRQ3mdNO", "itemType": "VC9CTqDU"}], "name": "LUMt8Lk3", "odds": 0.11183569934349524, "type": "REWARD_GROUP", "weight": 83}, {"lootBoxItems": [{"count": 66, "duration": 94, "endDate": "1984-11-18T00:00:00Z", "itemId": "NII5S5mK", "itemSku": "Sp3n7QoG", "itemType": "55NH47zT"}, {"count": 75, "duration": 76, "endDate": "1983-08-28T00:00:00Z", "itemId": "yA0QFOTy", "itemSku": "Z6z24xQT", "itemType": "HJUGMJkM"}, {"count": 25, "duration": 91, "endDate": "1982-06-08T00:00:00Z", "itemId": "59WL9l9O", "itemSku": "q4K6DPJX", "itemType": "LKS3Hbsh"}], "name": "XLjMmhGs", "odds": 0.662986769874647, "type": "PROBABILITY_GROUP", "weight": 62}, {"lootBoxItems": [{"count": 48, "duration": 62, "endDate": "1988-11-30T00:00:00Z", "itemId": "zaeADQCF", "itemSku": "Ym5TpAEi", "itemType": "h3peY8co"}, {"count": 46, "duration": 68, "endDate": "1999-08-29T00:00:00Z", "itemId": "DcVJb2N3", "itemSku": "Ax5pnUat", "itemType": "rJpUtB9a"}, {"count": 58, "duration": 60, "endDate": "1976-11-14T00:00:00Z", "itemId": "FE7BCyE9", "itemSku": "DxQYW5Nv", "itemType": "gkyIMES1"}], "name": "hYFf7Hi4", "odds": 0.8448226269220291, "type": "PROBABILITY_GROUP", "weight": 71}], "rollFunction": "CUSTOM"}, "maxCount": 69, "maxCountPerUser": 16, "name": "P78m4Q1f", "optionBoxConfig": {"boxItems": [{"count": 27, "duration": 33, "endDate": "1979-01-07T00:00:00Z", "itemId": "8Tc7dQmN", "itemSku": "R4kXtXGp", "itemType": "a4GU5eaL"}, {"count": 88, "duration": 78, "endDate": "1971-01-04T00:00:00Z", "itemId": "t31P0j7T", "itemSku": "gOBlFJma", "itemType": "uRTDmdDB"}, {"count": 49, "duration": 0, "endDate": "1971-07-26T00:00:00Z", "itemId": "hWgLafzL", "itemSku": "IEgkb9Zg", "itemType": "Ke8H2dJN"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 25, "fixedTrialCycles": 70, "graceDays": 35}, "regionData": {"F2bmfVI7": [{"currencyCode": "FJdUyMLg", "currencyNamespace": "705f0Gnd", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1980-06-10T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1987-09-18T00:00:00Z", "expireAt": "1998-05-04T00:00:00Z", "price": 52, "purchaseAt": "1980-04-07T00:00:00Z", "trialPrice": 35}, {"currencyCode": "FMB9T1BC", "currencyNamespace": "FIjHOR3a", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1977-05-13T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1977-06-15T00:00:00Z", "expireAt": "1984-09-03T00:00:00Z", "price": 5, "purchaseAt": "1991-11-26T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AuYBCCe2", "currencyNamespace": "SwEYwfpc", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1994-06-25T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1986-02-02T00:00:00Z", "expireAt": "1983-06-20T00:00:00Z", "price": 32, "purchaseAt": "1979-01-04T00:00:00Z", "trialPrice": 77}], "LkVfzaFk": [{"currencyCode": "zN75is8X", "currencyNamespace": "dDsmioSK", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1996-08-20T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1997-11-05T00:00:00Z", "expireAt": "1977-11-27T00:00:00Z", "price": 79, "purchaseAt": "1974-03-05T00:00:00Z", "trialPrice": 87}, {"currencyCode": "bBad6Dcl", "currencyNamespace": "GhXYu2vV", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1990-11-19T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1993-05-07T00:00:00Z", "expireAt": "1996-04-02T00:00:00Z", "price": 27, "purchaseAt": "1981-07-26T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1iGXR6Av", "currencyNamespace": "6EFBNMLp", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1981-01-28T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1989-11-06T00:00:00Z", "expireAt": "1983-03-15T00:00:00Z", "price": 24, "purchaseAt": "1973-04-06T00:00:00Z", "trialPrice": 46}], "iIyJXCeK": [{"currencyCode": "zwPZEgUF", "currencyNamespace": "XyaMcqRX", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1998-09-16T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1986-11-17T00:00:00Z", "expireAt": "1986-08-01T00:00:00Z", "price": 46, "purchaseAt": "1983-12-15T00:00:00Z", "trialPrice": 1}, {"currencyCode": "z3YvjbpJ", "currencyNamespace": "OYCuF8RM", "currencyType": "REAL", "discountAmount": 12, "discountExpireAt": "1975-10-30T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1976-02-29T00:00:00Z", "expireAt": "1986-11-10T00:00:00Z", "price": 25, "purchaseAt": "1993-06-26T00:00:00Z", "trialPrice": 15}, {"currencyCode": "o1S6v6l1", "currencyNamespace": "cLK5tbvv", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1978-04-18T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1984-03-14T00:00:00Z", "expireAt": "1976-02-19T00:00:00Z", "price": 10, "purchaseAt": "1979-08-05T00:00:00Z", "trialPrice": 92}]}, "saleConfig": {"currencyCode": "Z94BHGmS", "price": 9}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "yzilS1UR", "stackable": true, "status": "INACTIVE", "tags": ["iKkCBOpT", "Bv72BKe9", "9s3h0y10"], "targetCurrencyCode": "HDVFkWIF", "targetNamespace": "W1l5QsAu", "thumbnailUrl": "WoLbx70t", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'x290e52B' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'IAP,CAMPAIGN,DLC' \
    --force  \
    --storeId 'lnzAoKpe' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Vr8KD2ki' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 85, "orderNo": "sgEOS6Bv"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'c3xclQHj' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9fXWxXLW' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'xX4SediG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qbsr5yBr' \
    --body '{"carousel": [{"alt": "tH8ikBbI", "previewUrl": "hrQTAL2g", "thumbnailUrl": "fNFEYqGL", "type": "image", "url": "7WT7NT0C", "videoSource": "generic"}, {"alt": "04sUtqW5", "previewUrl": "vT2wMfBM", "thumbnailUrl": "ipjWulhJ", "type": "image", "url": "twt7xd7x", "videoSource": "generic"}, {"alt": "QCyNaoEl", "previewUrl": "agPcWeAn", "thumbnailUrl": "CXwpiitG", "type": "image", "url": "YJAuy6a0", "videoSource": "generic"}], "developer": "YNC6BUvZ", "forumUrl": "XT8md7uy", "genres": ["Strategy", "Racing", "RPG"], "localizations": {"IKef1yyS": {"announcement": "YOv7FLci", "slogan": "UYVDwRW1"}, "RiAC7yp1": {"announcement": "KNUQDLX4", "slogan": "9bxbodtz"}, "bS70jLY8": {"announcement": "4fEuj3sw", "slogan": "WswMe5ky"}}, "platformRequirements": {"zqbXoFO6": [{"additionals": "Cqt665xL", "directXVersion": "hPBd6KSb", "diskSpace": "DziN7WuB", "graphics": "nFuxb590", "label": "2RUl39PU", "osVersion": "rKGL4JNt", "processor": "LRqbjf6t", "ram": "JphP7xpJ", "soundCard": "vNL7lYs7"}, {"additionals": "vT3HSzQN", "directXVersion": "Mjk00fZJ", "diskSpace": "Qmp8Oav7", "graphics": "oBvjIbMe", "label": "sKF2Bxhx", "osVersion": "87M7mq21", "processor": "XrgrYQUA", "ram": "QqnV35if", "soundCard": "IppFlt4W"}, {"additionals": "OFcSKEsC", "directXVersion": "QQffr2Xl", "diskSpace": "ywkx6LJA", "graphics": "GjABgqUq", "label": "QzwxNNte", "osVersion": "DP2AqVFV", "processor": "9n7Ql3yB", "ram": "cVkp4oBA", "soundCard": "3QrGnk7w"}], "iFbWSSFE": [{"additionals": "cbbQBJdX", "directXVersion": "IhTj6Lez", "diskSpace": "ZYRVR2Bs", "graphics": "n5uBrBgO", "label": "BIgcfSIa", "osVersion": "VzXEhXvh", "processor": "Gn5QW8Tt", "ram": "a2sP7rP3", "soundCard": "8k2VNEno"}, {"additionals": "mztZRCwL", "directXVersion": "T80OHqRW", "diskSpace": "67mJT8iJ", "graphics": "irsi4qT5", "label": "819tjcaU", "osVersion": "bWyhr5UZ", "processor": "aZKYzrzC", "ram": "K9B98CvJ", "soundCard": "yxlPmJCH"}, {"additionals": "iiIuCMlg", "directXVersion": "j0SfkUyP", "diskSpace": "XCjJPs91", "graphics": "VnPZxewu", "label": "vuOhIbcs", "osVersion": "xXkh3oSM", "processor": "du2nt9Aw", "ram": "PHYN8cHI", "soundCard": "1RoS6Kwj"}], "FTFgGiIV": [{"additionals": "eKXFP6Gl", "directXVersion": "kX9RpG0K", "diskSpace": "M6dfsPKs", "graphics": "WLhPUZco", "label": "kUjDYSjU", "osVersion": "2QKexcgk", "processor": "s3D8rYh4", "ram": "OB153cv5", "soundCard": "xEVyopDv"}, {"additionals": "Dub7Cu5X", "directXVersion": "5YKRrwQA", "diskSpace": "pngSOt1R", "graphics": "mkG43vDA", "label": "fzDJnGoU", "osVersion": "Ay8pEykJ", "processor": "14VSHmJ2", "ram": "p0Att52y", "soundCard": "PBWJR8pl"}, {"additionals": "e2mn0t18", "directXVersion": "USQHd1SO", "diskSpace": "2yR2dHum", "graphics": "n2Z2KlJR", "label": "EG18h7rd", "osVersion": "hGkeBryt", "processor": "MnJAMtz4", "ram": "aYB7tP7W", "soundCard": "0UcSK8li"}]}, "platforms": ["Android", "Linux", "Windows"], "players": ["Coop", "MMO", "Multi"], "primaryGenre": "RPG", "publisher": "elyN7nxl", "releaseDate": "1999-11-10T00:00:00Z", "websiteUrl": "dgKleDuI"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'ciupNZtQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1GX3quy6' \
    --body '{"featuresToCheck": ["ENTITLEMENT", "REWARD"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'dCTWv1qA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'E4q4gD55' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dwf2EhFO' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '8WaNRgMe' \
    --itemId 'NNGPWEjx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'baZ9DeUH' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'SOo0FU2Y' \
    --itemId 'VfClpRyo' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dBOnxQDE' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'aCdTanA2' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'AEcleYMC' \
    --populateBundle  \
    --region 'ImwqOq2G' \
    --storeId 'sg1ROHhL' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'aN2LwmgG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'd8ntx8Ql' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 29, "code": "1fn5RXT2", "comparison": "isGreaterThanOrEqual", "name": "xo8lBH6i", "predicateType": "SeasonTierPredicate", "value": "cCF1YXzb", "values": ["LYddOhMg", "5NmfTgQv", "UqkSH0T4"]}, {"anyOf": 5, "code": "6D4wz7pI", "comparison": "includes", "name": "lNBWnVLb", "predicateType": "EntitlementPredicate", "value": "gDYnCErC", "values": ["lZ0Dqn29", "bIqOiRqS", "OiZPGZzw"]}, {"anyOf": 68, "code": "EWxHFCVR", "comparison": "isGreaterThan", "name": "vzHsihls", "predicateType": "SeasonTierPredicate", "value": "6oxAscG3", "values": ["8lpPNhll", "xmnRQC9q", "62l6E1qn"]}]}, {"operator": "or", "predicates": [{"anyOf": 59, "code": "eM8lkaG5", "comparison": "is", "name": "rv7HT8Yf", "predicateType": "SeasonTierPredicate", "value": "mnknU6DK", "values": ["KE6ubJyV", "e7lSADr5", "gP7qasY6"]}, {"anyOf": 93, "code": "4oJUpoZU", "comparison": "isNot", "name": "y2MIFGcG", "predicateType": "SeasonPassPredicate", "value": "s0fgyOEs", "values": ["vJeoxjSZ", "8DX2gad3", "NRDUt5JS"]}, {"anyOf": 2, "code": "vzymTeAH", "comparison": "excludes", "name": "UcNMKIzH", "predicateType": "SeasonPassPredicate", "value": "FmJcAjGL", "values": ["uvnj34yb", "4fHWLp7J", "ssRirqy7"]}]}, {"operator": "or", "predicates": [{"anyOf": 27, "code": "bSA6dOkC", "comparison": "isGreaterThan", "name": "hx43tZcD", "predicateType": "StatisticCodePredicate", "value": "3Qtn3CBX", "values": ["LiJ9eduU", "CJUVnmrz", "xViSp3ed"]}, {"anyOf": 72, "code": "ol5VhzND", "comparison": "is", "name": "HccFtnqC", "predicateType": "SeasonTierPredicate", "value": "Ov3lor2m", "values": ["jRXa4Rkx", "2hlSgGZz", "hOztSYF4"]}, {"anyOf": 77, "code": "J9GNTggn", "comparison": "isNot", "name": "znVr1cyJ", "predicateType": "SeasonTierPredicate", "value": "ZzEyQCID", "values": ["fwqvYXBs", "4pc3EDYm", "mI1VUygg"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId '31zlkhXk' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CAMPAIGN,REWARD,DLC' \
    --storeId 'pKkcXFQd' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'F6QK82rM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "aZYbl9rH"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --name '6SqojW9u' \
    --offset '66' \
    --tag 'YOOnJTsO' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HbzHG1tl", "name": "8SrhGpYY", "status": "INACTIVE", "tags": ["vnWLnLOZ", "GSmYXpJt", "Wt7UiaB7"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'aUbktFrD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'SdsVF0bt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "267MLwkW", "name": "sgfKT0Zl", "status": "INACTIVE", "tags": ["coz6sq9X", "gyE1VEdV", "jhkzoAcp"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'LxzLZVNp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'WFgTBGbT' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '92' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'ToI6iYpf' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '94vYbZTG' \
    --limit '27' \
    --offset '6' \
    --orderNos 'JSZbE9yn,iMpYZrrO,xUEGQd9A' \
    --sortBy 'YO2GqZju' \
    --startTime 'Ul3P99gI' \
    --status 'DELETED' \
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
    --orderNo 'IrZcXLoD' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oEI5W2vv' \
    --body '{"description": "4MfDHRQK"}' \
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
    --body '{"domains": ["EGHIFvGi", "fCx55DkE", "PZjeduT6"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'toMqgkax' \
    --externalId 'xz5c9UGo' \
    --limit '66' \
    --notificationSource 'ADYEN' \
    --notificationType 'zp1AWFAM' \
    --offset '79' \
    --paymentOrderNo 'brJ6sPCY' \
    --startDate 'fX7N4AiV' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'HMcS5UTp' \
    --limit '69' \
    --offset '48' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "hEDOLiRL", "currencyNamespace": "SMO6iq0w", "customParameters": {"bxQwRYAM": {}, "kE2lvQO4": {}, "2giZzgnA": {}}, "description": "izDMSfm2", "extOrderNo": "YL4UaPDS", "extUserId": "cw9lQl0H", "itemType": "APP", "language": "CfGr_CqHS_DT", "metadata": {"huSzTb9S": "JWiODPHU", "tcZEdVNP": "d56UzepK", "of2RHbdu": "KC29MSNb"}, "notifyUrl": "YlsiDP5N", "omitNotification": false, "platform": "yYMoHcna", "price": 63, "recurringPaymentOrderNo": "OdpMbLkI", "region": "FlPOjVMS", "returnUrl": "cPKfMpqQ", "sandbox": true, "sku": "lSAAXCtN", "subscriptionId": "wI8S9RED", "targetNamespace": "fwg35Sh4", "targetUserId": "mLMpFLsZ", "title": "mPIHGQ2f"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'FL2ezgqe' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'w7snxAmS' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TkUYEyse' \
    --body '{"extTxId": "tfqqoKCp", "paymentMethod": "i1NzljQD", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZL5zqBTy' \
    --body '{"description": "J5FuK0Dn"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hg7wp1ox' \
    --body '{"amount": 5, "currencyCode": "NvlebCuS", "notifyType": "REFUND", "paymentProvider": "ALIPAY", "salesTax": 97, "vat": 81}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ly3DBncx' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'wS1iHDtk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "fli8XXc7", "serviceLabel": 65}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'xJEBp0qu' \
    --body '{"delegationToken": "CpOOCg2S", "sandboxId": "6xEXaRKJ"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["GooglePlay", "Steam", "Other"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Twitch", "Epic", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
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
    --endTime 'fHyyorj9' \
    --limit '56' \
    --offset '52' \
    --source 'DLC' \
    --startTime 'SzMuJapy' \
    --status 'FAIL' \
    --transactionId '94swuwYG' \
    --userId 'lBzIHolh' \
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
    --body '{"appConfig": {"appName": "GhctTHcu"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "FyAZALF3"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateRevocationPluginConfig' test.out

#- 194 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'DeleteRevocationPluginConfig' test.out

#- 195 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCert' test.out

#- 196 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "jQbfLOAA", "eventTopic": "QV7rTbsY", "maxAwarded": 85, "maxAwardedPerUser": 17, "namespaceExpression": "xu9v22hp", "rewardCode": "ZngY8gQm", "rewardConditions": [{"condition": "1U5n48fo", "conditionName": "fe0UAZIW", "eventName": "mywaFOOK", "rewardItems": [{"duration": 96, "endDate": "1999-03-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "fUiDWsWX", "quantity": 47, "sku": "SFcVBrJN"}, {"duration": 60, "endDate": "1979-11-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "fR6lLdJ1", "quantity": 66, "sku": "qKgM6o7T"}, {"duration": 51, "endDate": "1998-10-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vBzfIyc6", "quantity": 20, "sku": "UNhrdtiG"}]}, {"condition": "ShWhT1SF", "conditionName": "BAcEsfmB", "eventName": "1NPowDhv", "rewardItems": [{"duration": 48, "endDate": "1991-01-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "stHyr9lH", "quantity": 37, "sku": "xadP00Bg"}, {"duration": 68, "endDate": "1971-01-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "R61dSnZl", "quantity": 66, "sku": "JrWboM4F"}, {"duration": 58, "endDate": "1985-09-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "7ifbmmq4", "quantity": 27, "sku": "K8jilfS9"}]}, {"condition": "02uCQDzu", "conditionName": "zfD3id6j", "eventName": "tkrYN4hJ", "rewardItems": [{"duration": 27, "endDate": "1997-04-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0ZMrZIHH", "quantity": 35, "sku": "0MQVzVEI"}, {"duration": 34, "endDate": "1984-06-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "QnusgoW9", "quantity": 1, "sku": "1EEJBpiu"}, {"duration": 39, "endDate": "1975-02-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HickoDSz", "quantity": 15, "sku": "7UNjHqRv"}]}], "userIdExpression": "71Cw4Yl1"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateReward' test.out

#- 197 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '3DW6OMRp' \
    --limit '99' \
    --offset '10' \
    --sortBy 'namespace:asc,rewardCode:desc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 197 'QueryRewards' test.out

#- 198 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'ExportRewards' test.out

#- 199 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 199 'ImportRewards' test.out

#- 200 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'omhwiuaD' \
    > test.out 2>&1
eval_tap $? 200 'GetReward' test.out

#- 201 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AqjUKqCI' \
    --body '{"description": "y1teDiLs", "eventTopic": "V2q90nLo", "maxAwarded": 53, "maxAwardedPerUser": 86, "namespaceExpression": "rbqSkhbI", "rewardCode": "sWw61AFJ", "rewardConditions": [{"condition": "0u5ENwwc", "conditionName": "r67J3ru7", "eventName": "U1iKwDK0", "rewardItems": [{"duration": 31, "endDate": "1997-11-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "BVaQUmsZ", "quantity": 95, "sku": "A2VmiYe6"}, {"duration": 54, "endDate": "1971-08-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "bJZ3a0h1", "quantity": 25, "sku": "aCR6xCXi"}, {"duration": 19, "endDate": "1997-04-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "al2F8uV3", "quantity": 76, "sku": "5Jb4O3sB"}]}, {"condition": "2hWmCaB6", "conditionName": "vaKlu5Oq", "eventName": "qr0yPZdB", "rewardItems": [{"duration": 74, "endDate": "1990-07-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "D05VRbqI", "quantity": 56, "sku": "A73q5eVJ"}, {"duration": 73, "endDate": "1974-03-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ji127mjz", "quantity": 96, "sku": "NXQgk6BJ"}, {"duration": 88, "endDate": "1991-02-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "F1QJUkoO", "quantity": 58, "sku": "jTcRT3Pz"}]}, {"condition": "632YUEJi", "conditionName": "pTpstk4z", "eventName": "CK8QwP7n", "rewardItems": [{"duration": 65, "endDate": "1974-04-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "GyalW5Q9", "quantity": 11, "sku": "VAYhBD5P"}, {"duration": 38, "endDate": "1991-02-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5nTNYrSG", "quantity": 72, "sku": "vv0qyv3D"}, {"duration": 27, "endDate": "1984-09-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "XFzJjsTZ", "quantity": 92, "sku": "Oy5CSnxP"}]}], "userIdExpression": "aW2RgjpU"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateReward' test.out

#- 202 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aNAz5K3Q' \
    > test.out 2>&1
eval_tap $? 202 'DeleteReward' test.out

#- 203 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'haUXsel0' \
    --body '{"payload": {"EsFyaQKX": {}, "nTY2Hyq6": {}, "ZiEVdsM7": {}}}' \
    > test.out 2>&1
eval_tap $? 203 'CheckEventCondition' test.out

#- 204 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PWDBBnUi' \
    --body '{"conditionName": "L8dz6WEH", "userId": "A1wk1Cwv"}' \
    > test.out 2>&1
eval_tap $? 204 'DeleteRewardConditionRecord' test.out

#- 205 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'cjSdoPIb' \
    --limit '39' \
    --offset '24' \
    --start 'vF4LWRsX' \
    --storeId 'Sj4PlUhv' \
    --viewId 'dfCkMwY8' \
    > test.out 2>&1
eval_tap $? 205 'QuerySections' test.out

#- 206 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eot9vlB9' \
    --body '{"active": false, "displayOrder": 5, "endDate": "1986-11-09T00:00:00Z", "ext": {"PWySvRZm": {}, "fRDO8amU": {}, "B64NwPIV": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 35, "itemCount": 84, "rule": "SEQUENCE"}, "items": [{"id": "IAgnSZe2", "sku": "ZZkeDrok"}, {"id": "EcAjNGfq", "sku": "G1vu5e8k"}, {"id": "94ZpsABv", "sku": "FDGSYfmf"}], "localizations": {"II1V1SyD": {"description": "9ChfNx0i", "localExt": {"SRSrpcsR": {}, "xRIt1uq8": {}, "sM5AEdMw": {}}, "longDescription": "n6k4srEH", "title": "IqkFVDJW"}, "jrWghets": {"description": "doAMPkyz", "localExt": {"S0nBFZ6O": {}, "s5uPiMRD": {}, "RuTGCe8Q": {}}, "longDescription": "Ya7OEMSh", "title": "IjHaZi9x"}, "nUPET4N6": {"description": "VAcBOIdB", "localExt": {"jUxVPS4m": {}, "FUT3baOw": {}, "WgSrjums": {}}, "longDescription": "UfTlVZGC", "title": "SubM3xnE"}}, "name": "fngWeRms", "rotationType": "CUSTOM", "startDate": "1996-03-29T00:00:00Z", "viewId": "h00EbVrA"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateSection' test.out

#- 207 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZNGS9lu5' \
    > test.out 2>&1
eval_tap $? 207 'PurgeExpiredSection' test.out

#- 208 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'RYEa8KY9' \
    --storeId 'qdMNfk1F' \
    > test.out 2>&1
eval_tap $? 208 'GetSection' test.out

#- 209 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'mJpfjh9p' \
    --storeId 'p5CRXD10' \
    --body '{"active": true, "displayOrder": 57, "endDate": "1999-11-05T00:00:00Z", "ext": {"Gj9mfkx5": {}, "v7KuWeWD": {}, "yafSLANZ": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 98, "itemCount": 47, "rule": "SEQUENCE"}, "items": [{"id": "kay3NmvO", "sku": "LZOvKDm7"}, {"id": "jmolW34n", "sku": "nI6XVvbZ"}, {"id": "oqbogXap", "sku": "elFCU9fZ"}], "localizations": {"bDThAKaH": {"description": "NCohAahp", "localExt": {"uSU1QoPR": {}, "5Db93SvP": {}, "o0zWspl7": {}}, "longDescription": "Kd7mac3w", "title": "x2BzDyRt"}, "ROGDgA9I": {"description": "dNXPpVOq", "localExt": {"SNkEaK3d": {}, "hhIsHqCo": {}, "8FUQvs2Y": {}}, "longDescription": "l0UFfunZ", "title": "GFCeHZRx"}, "QCWr9n3B": {"description": "d7MqCzeG", "localExt": {"CRQq5AoN": {}, "7eLBbsd4": {}, "Itp5wMFb": {}}, "longDescription": "onfjL2pj", "title": "KFdsQUQE"}}, "name": "pv6lYhfr", "rotationType": "FIXED_PERIOD", "startDate": "1987-05-01T00:00:00Z", "viewId": "BClxo86l"}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateSection' test.out

#- 210 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'lpj2R6Na' \
    --storeId 'udCtSTOj' \
    > test.out 2>&1
eval_tap $? 210 'DeleteSection' test.out

#- 211 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'ListStores' test.out

#- 212 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "pQWfoX95", "defaultRegion": "eIVv9BD8", "description": "4Yn9JGrC", "supportedLanguages": ["UUUvmEqB", "aATTak7s", "F0DiTo6r"], "supportedRegions": ["TqtRx0Xl", "pttq1Fhx", "rjAHuzZn"], "title": "pGvtVUp3"}' \
    > test.out 2>&1
eval_tap $? 212 'CreateStore' test.out

#- 213 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 213 'GetCatalogDefinition' test.out

#- 214 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'DownloadCSVTemplates' test.out

#- 215 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["Uccp02Xq", "KsUjWk1K", "9ccJKx9o"], "idsToBeExported": ["OQsy6feZ", "sGIReWLO", "wwIw3SSy"], "storeId": "tqA7yHmU"}' \
    > test.out 2>&1
eval_tap $? 215 'ExportStoreByCSV' test.out

#- 216 ImportStore
eval_tap 0 216 'ImportStore # SKIP deprecated' test.out

#- 217 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 217 'GetPublishedStore' test.out

#- 218 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'DeletePublishedStore' test.out

#- 219 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'GetPublishedStoreBackup' test.out

#- 220 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'RollbackPublishedStore' test.out

#- 221 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MszsB3Aw' \
    > test.out 2>&1
eval_tap $? 221 'GetStore' test.out

#- 222 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Aa9R01l9' \
    --body '{"defaultLanguage": "Vf4sQ7lg", "defaultRegion": "loDYFh2F", "description": "LH7Y5IPR", "supportedLanguages": ["L8l4q6br", "lAzlVpzW", "du8aZptx"], "supportedRegions": ["Avucw5IR", "n4FWeliv", "tIZWqNOr"], "title": "pnnBJIpg"}' \
    > test.out 2>&1
eval_tap $? 222 'UpdateStore' test.out

#- 223 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TJwMRi1i' \
    > test.out 2>&1
eval_tap $? 223 'DeleteStore' test.out

#- 224 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WLqSBOse' \
    --action 'CREATE' \
    --itemSku 'hzKeDTRd' \
    --itemType 'APP' \
    --limit '31' \
    --offset '32' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'obUoawB3' \
    --updatedAtStart 'ooBDyKHK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 224 'QueryChanges' test.out

#- 225 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dxkUQY41' \
    > test.out 2>&1
eval_tap $? 225 'PublishAll' test.out

#- 226 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId '4GJuCpGz' \
    > test.out 2>&1
eval_tap $? 226 'PublishSelected' test.out

#- 227 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SOsFxQrt' \
    > test.out 2>&1
eval_tap $? 227 'SelectAllRecords' test.out

#- 228 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uHe1DWl3' \
    --action 'UPDATE' \
    --itemSku 'PBsCVyFm' \
    --itemType 'SEASON' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd '1LDpsSEa' \
    --updatedAtStart 'dDxTUny6' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecordsByCriteria' test.out

#- 229 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dKizjVWF' \
    --action 'CREATE' \
    --itemSku 'hpEVjx5F' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd '8dkBE6k2' \
    --updatedAtStart 'pri4a5Wr' \
    > test.out 2>&1
eval_tap $? 229 'GetStatistic' test.out

#- 230 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Wk3zoN8s' \
    > test.out 2>&1
eval_tap $? 230 'UnselectAllRecords' test.out

#- 231 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'QEyvroYB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GObNmwGY' \
    > test.out 2>&1
eval_tap $? 231 'SelectRecord' test.out

#- 232 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'Lv5c0fay' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wYdsHK5E' \
    > test.out 2>&1
eval_tap $? 232 'UnselectRecord' test.out

#- 233 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'N0exREeu' \
    --targetStoreId '9YyhLIo0' \
    > test.out 2>&1
eval_tap $? 233 'CloneStore' test.out

#- 234 ExportStore
eval_tap 0 234 'ExportStore # SKIP deprecated' test.out

#- 235 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mL4ogVHG' \
    --end 'gor8nKB8' \
    --limit '73' \
    --offset '18' \
    --sortBy 'svj2MWhQ' \
    --start '8LsQBN0l' \
    --success  \
    > test.out 2>&1
eval_tap $? 235 'QueryImportHistory' test.out

#- 236 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jwh4Qcwv' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'V3g03Gk1' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 236 'ImportStoreByCSV' test.out

#- 237 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'hptsP2bD' \
    --limit '14' \
    --offset '28' \
    --sku 'fFloj83S' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'RiaDqqCo' \
    > test.out 2>&1
eval_tap $? 237 'QuerySubscriptions' test.out

#- 238 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SiUkyxwg' \
    > test.out 2>&1
eval_tap $? 238 'RecurringChargeSubscription' test.out

#- 239 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'RIibdNiz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'GetTicketDynamic' test.out

#- 240 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '4ig1t5Vk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "fBKjgMn9"}' \
    > test.out 2>&1
eval_tap $? 240 'DecreaseTicketSale' test.out

#- 241 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Jx2hfuJO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetTicketBoothID' test.out

#- 242 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'AD5s6eNu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 58, "orderNo": "X7SE3iS6"}' \
    > test.out 2>&1
eval_tap $? 242 'IncreaseTicketSale' test.out

#- 243 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 24, "currencyCode": "u6d5fEs6", "expireAt": "1978-10-27T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "EhfriS1w", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 64, "entitlementCollectionId": "Kw4HJr5Z", "entitlementOrigin": "Other", "itemIdentity": "TsAiHCaj", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 47, "entitlementId": "1KLs7Gzq"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 82, "currencyCode": "6eec90GX", "expireAt": "1991-07-23T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "GZQLYbav", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 3, "entitlementCollectionId": "c33SfyV1", "entitlementOrigin": "GooglePlay", "itemIdentity": "hM6bEMRB", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 66, "entitlementId": "Au94e8qv"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 90, "currencyCode": "SQPn4Dm7", "expireAt": "1975-02-24T00:00:00Z"}, "debitPayload": {"count": 20, "currencyCode": "OiCIimqN", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 50, "entitlementCollectionId": "PoZVHxhM", "entitlementOrigin": "Playstation", "itemIdentity": "vTjZ0U7v", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "LIBw2AtH"}, "type": "FULFILL_ITEM"}], "userId": "xUYnBpYD"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 18, "currencyCode": "qSMrXlsv", "expireAt": "1990-08-21T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "vIynJBGA", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 86, "entitlementCollectionId": "6HyMzp6h", "entitlementOrigin": "System", "itemIdentity": "4Y2OvJAM", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "k4hdkEqm"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 19, "currencyCode": "JUAQIz0z", "expireAt": "1980-04-30T00:00:00Z"}, "debitPayload": {"count": 84, "currencyCode": "J78RVXSk", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 98, "entitlementCollectionId": "2hSHp80L", "entitlementOrigin": "Playstation", "itemIdentity": "p1qiRiue", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "T4SbZvun"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Other", "count": 45, "currencyCode": "nwC1qrpt", "expireAt": "1986-01-15T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "qQKKpPjq", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "UpSmlkMx", "entitlementOrigin": "GooglePlay", "itemIdentity": "vUeABbw2", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 39, "entitlementId": "HEhncJvQ"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "qscaJSAE"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 77, "currencyCode": "zwuMJnBO", "expireAt": "1982-02-05T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "E9Ik4DbQ", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 52, "entitlementCollectionId": "Y374EtcC", "entitlementOrigin": "Xbox", "itemIdentity": "tPYm5g8S", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 52, "entitlementId": "yhNjrYX9"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 0, "currencyCode": "uqdzUnCY", "expireAt": "1997-07-07T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "qEvo00vb", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 94, "entitlementCollectionId": "JThZRumg", "entitlementOrigin": "IOS", "itemIdentity": "xsHFnxLc", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 14, "entitlementId": "m2UzXJM3"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 62, "currencyCode": "vak6Nace", "expireAt": "1985-12-28T00:00:00Z"}, "debitPayload": {"count": 67, "currencyCode": "J8PGJwxq", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 26, "entitlementCollectionId": "s9Y794nC", "entitlementOrigin": "System", "itemIdentity": "c3JTLHpN", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 64, "entitlementId": "8Svfej8S"}, "type": "FULFILL_ITEM"}], "userId": "vcNVnNFD"}], "metadata": {"Xk3wcTd6": {}, "OAedVAGC": {}, "K5Zl85Y8": {}}, "needPreCheck": true, "transactionId": "HPQvqWQ5", "type": "biQabYh3"}' \
    > test.out 2>&1
eval_tap $? 243 'Commit' test.out

#- 244 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '6' \
    --status 'INIT' \
    --type 'g3nWQ0Bu' \
    --userId '0A419HUk' \
    > test.out 2>&1
eval_tap $? 244 'GetTradeHistoryByCriteria' test.out

#- 245 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'aEZ3SkgD' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByTransactionId' test.out

#- 246 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvw9bzaO' \
    --body '{"achievements": [{"id": "NGvTsuuM", "value": 53}, {"id": "VeKkWThS", "value": 81}, {"id": "HoqCmJet", "value": 22}], "steamUserId": "IL56brQC"}' \
    > test.out 2>&1
eval_tap $? 246 'UnlockSteamUserAchievement' test.out

#- 247 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yx3L1ORX' \
    --xboxUserId 'Vfjn82Wy' \
    > test.out 2>&1
eval_tap $? 247 'GetXblUserAchievements' test.out

#- 248 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qn9X1itF' \
    --body '{"achievements": [{"id": "13Yuuz0X", "percentComplete": 90}, {"id": "QGWTDeoT", "percentComplete": 74}, {"id": "LXLYwlWp", "percentComplete": 62}], "serviceConfigId": "vr1IJBc3", "titleId": "BFT9Be61", "xboxUserId": "Bi1ijx8h"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateXblUserAchievement' test.out

#- 249 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJuta6sm' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeCampaign' test.out

#- 250 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'j9ja5SvZ' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeEntitlement' test.out

#- 251 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '4QZIwM6l' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeFulfillment' test.out

#- 252 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMwEtLqu' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeIntegration' test.out

#- 253 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTKWlbB5' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeOrder' test.out

#- 254 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'bqXUvuyg' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizePayment' test.out

#- 255 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ivsi0Ipq' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizeRevocation' test.out

#- 256 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIzGDQFH' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeSubscription' test.out

#- 257 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'YsHxrnmo' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeWallet' test.out

#- 258 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'vxA3N7JS' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 258 'GetUserDLCByPlatform' test.out

#- 259 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'U0xsDuMi' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLC' test.out

#- 260 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rxoc6scg' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 'HDVFsfpi' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'sp08HDuX' \
    --features 'mXzWQMNO,lOS7HUuU,lBSgv9bV' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId '77YYpw55,20NWaN6T,jXVxLNTm' \
    --limit '40' \
    --offset '28' \
    --origin 'System' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserEntitlements' test.out

#- 261 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aM8TfFt0' \
    --body '[{"collectionId": "vWnvQa44", "endDate": "1994-05-09T00:00:00Z", "grantedCode": "YKrnOpbT", "itemId": "2xNRTohq", "itemNamespace": "UIVgN9LJ", "language": "YdC-poHf-av", "metadata": {"NgH1QkOd": {}, "a0cL5UI3": {}, "00b4EB7l": {}}, "origin": "Oculus", "quantity": 100, "region": "glwX8wMU", "source": "IAP", "startDate": "1982-12-06T00:00:00Z", "storeId": "Y63M5Vib"}, {"collectionId": "RELoMnvP", "endDate": "1977-07-04T00:00:00Z", "grantedCode": "rp1wG6sp", "itemId": "GCHPsPMO", "itemNamespace": "UhNTkGoF", "language": "nuZK_Ts", "metadata": {"EcZTX6HO": {}, "xeXN80kv": {}, "fFNPJa17": {}}, "origin": "GooglePlay", "quantity": 49, "region": "ql0cdw1V", "source": "REDEEM_CODE", "startDate": "1972-12-09T00:00:00Z", "storeId": "A12J6BA1"}, {"collectionId": "KohZhFEs", "endDate": "1987-06-13T00:00:00Z", "grantedCode": "ZAsUOfOq", "itemId": "7TocD9mx", "itemNamespace": "8zx0u1Hm", "language": "rU", "metadata": {"jrhp40l6": {}, "4i0mn8sq": {}, "za26H6GE": {}}, "origin": "Playstation", "quantity": 40, "region": "XHwcUwYE", "source": "REFERRAL_BONUS", "startDate": "1993-02-13T00:00:00Z", "storeId": "LCkCvQUE"}]' \
    > test.out 2>&1
eval_tap $? 261 'GrantUserEntitlement' test.out

#- 262 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSxdvYwy' \
    --activeOnly  \
    --appId 'ZZBRKsO2' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementByAppId' test.out

#- 263 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'dpa1DBMB' \
    --activeOnly  \
    --limit '69' \
    --offset '94' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserEntitlementsByAppType' test.out

#- 264 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'djgQMSTz' \
    --ids 'mYlmu6Uz,UaYMT9mS,Rr571mcz' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementsByIds' test.out

#- 265 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLqDsQEh' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'oBjaXceU' \
    --itemId 'mihMYNHq' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementByItemId' test.out

#- 266 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DM758lIv' \
    --ids 'OFZmSjPu,8jzmhOgo,kEeYsacv' \
    --platform 'HLupA4nT' \
    > test.out 2>&1
eval_tap $? 266 'GetUserActiveEntitlementsByItemIds' test.out

#- 267 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'BBPLCTa8' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'sLH3KZsi' \
    --sku 'UA9HOEnh' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementBySku' test.out

#- 268 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3HvGmXzI' \
    --appIds 'oFEx7ver,JWSssHSW,IJpgSHim' \
    --itemIds 'HNHRU68M,Clss5ivl,hFmaWLhg' \
    --platform 'hjD7p95N' \
    --skus 'pDEEPXMR,662STquA,Aa9lkwcJ' \
    > test.out 2>&1
eval_tap $? 268 'ExistsAnyUserActiveEntitlement' test.out

#- 269 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'eCqEByzt' \
    --platform 'hNDoLytT' \
    --itemIds 'GhRbyfXL,lW1T5IBR,DnrGYF5j' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 270 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ibtsl70R' \
    --appId 'I8Jzwalb' \
    > test.out 2>&1
eval_tap $? 270 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 271 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4gKFqmma' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform '7c8bvcXx' \
    --itemId '0gF4Nrl1' \
    > test.out 2>&1
eval_tap $? 271 'GetUserEntitlementOwnershipByItemId' test.out

#- 272 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7eOsW5yp' \
    --ids 'tYLRrH3i,GV7y1gzZ,n4WL9Krx' \
    --platform 'EC09x14s' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemIds' test.out

#- 273 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VL4WAfFA' \
    --entitlementClazz 'MEDIA' \
    --platform 'NlEJf7j9' \
    --sku 'SKwmReqb' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipBySku' test.out

#- 274 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahbp1Etx' \
    > test.out 2>&1
eval_tap $? 274 'RevokeAllEntitlements' test.out

#- 275 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdiaOdSs' \
    --entitlementIds 'DZAmWS9n' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlements' test.out

#- 276 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Gkavln3o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T4DaKJEN' \
    > test.out 2>&1
eval_tap $? 276 'GetUserEntitlement' test.out

#- 277 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'mUgH8yPf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHTmfrUm' \
    --body '{"collectionId": "DNN0q1Ui", "endDate": "1974-08-28T00:00:00Z", "nullFieldList": ["awA54LDl", "K0g0HVQU", "z5QxTGrc"], "origin": "Other", "reason": "ZKHGpSZV", "startDate": "1974-01-08T00:00:00Z", "status": "ACTIVE", "useCount": 83}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserEntitlement' test.out

#- 278 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '4N6aYUEc' \
    --namespace "$AB_NAMESPACE" \
    --userId '5NlfQZPk' \
    --body '{"metadata": {"1Clwmbtl": {}, "Sm21h06i": {}, "bwc6UYGB": {}}, "options": ["50mQVv3X", "wMkYLNgN", "uZnNeDQO"], "platform": "4ImMTw12", "requestId": "yj5CeXs5", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 278 'ConsumeUserEntitlement' test.out

#- 279 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'cWxNLoMI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'camiku6i' \
    > test.out 2>&1
eval_tap $? 279 'DisableUserEntitlement' test.out

#- 280 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'td7jSudo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TgcjbvTX' \
    > test.out 2>&1
eval_tap $? 280 'EnableUserEntitlement' test.out

#- 281 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'tlcdEIjP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q8apbsAi' \
    > test.out 2>&1
eval_tap $? 281 'GetUserEntitlementHistories' test.out

#- 282 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'olVXkEft' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5zdun6Y' \
    --body '{"metadata": {"CdaO17WU": {}, "shCQxjQX": {}, "WGbtUnxi": {}}}' \
    > test.out 2>&1
eval_tap $? 282 'RevokeUserEntitlement' test.out

#- 283 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'Brhmukew' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gFDvSTWB' \
    --body '{"reason": "FFtN4U42", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlementByUseCount' test.out

#- 284 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'lPWLWruK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H4cF0hQz' \
    --quantity '10' \
    > test.out 2>&1
eval_tap $? 284 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 285 RevokeUseCount
eval_tap 0 285 'RevokeUseCount # SKIP deprecated' test.out

#- 286 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'Vrj8LY1y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jwkeeq5Q' \
    --body '{"platform": "INMaxb8I", "requestId": "XYySl1fF", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 286 'SellUserEntitlement' test.out

#- 287 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cjawo5UR' \
    --body '{"duration": 87, "endDate": "1985-07-26T00:00:00Z", "entitlementCollectionId": "esjXzyAs", "entitlementOrigin": "Xbox", "itemId": "TGbnYmgF", "itemSku": "PQ4xhfVn", "language": "9F10yZJe", "metadata": {"ItqK2Nk9": {}, "kntfL8LJ": {}, "CDH3qxTj": {}}, "order": {"currency": {"currencyCode": "uzcA7xg1", "currencySymbol": "egjHGHYu", "currencyType": "VIRTUAL", "decimals": 27, "namespace": "hDsf6nIt"}, "ext": {"UaSL5kQD": {}, "yNX6prSK": {}, "Q7TTgXh0": {}}, "free": true}, "orderNo": "jV3PELCE", "origin": "Xbox", "overrideBundleItemQty": {"STvit9Ca": 9, "p0wUUe7Z": 100, "U4wNPMt7": 28}, "quantity": 89, "region": "S21aBljQ", "source": "REDEEM_CODE", "startDate": "1997-07-21T00:00:00Z", "storeId": "2SrZroAm"}' \
    > test.out 2>&1
eval_tap $? 287 'FulfillItem' test.out

#- 288 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRar6bud' \
    --body '{"code": "MZSxHSb9", "language": "fhDq-064", "region": "2bio01o6"}' \
    > test.out 2>&1
eval_tap $? 288 'RedeemCode' test.out

#- 289 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'efZRyjQS' \
    --body '{"itemId": "V4vG55Jf", "itemSku": "kPwZOGtj", "quantity": 67}' \
    > test.out 2>&1
eval_tap $? 289 'PreCheckFulfillItem' test.out

#- 290 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'wICvbBcu' \
    --body '{"entitlementCollectionId": "664TsPkz", "entitlementOrigin": "Playstation", "metadata": {"hSJtTWdk": {}, "bzsC11vJ": {}, "5j4krXYt": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "9v3oWcVm", "namespace": "ktJpqvaT"}, "item": {"itemId": "QBcIOHtI", "itemName": "iTtnDu0P", "itemSku": "E9JqNgBc", "itemType": "0PqriFej"}, "quantity": 34, "type": "ITEM"}, {"currency": {"currencyCode": "fMCJ7IzC", "namespace": "xF9P0RJN"}, "item": {"itemId": "eXKIO2Ky", "itemName": "8JEJMpcR", "itemSku": "xx2dwoAn", "itemType": "S3FvtQ4W"}, "quantity": 45, "type": "ITEM"}, {"currency": {"currencyCode": "8D4Gn7h5", "namespace": "lmKgfnor"}, "item": {"itemId": "TsqKwBXh", "itemName": "TK6dgRA9", "itemSku": "JT4C38Ei", "itemType": "5eOehUWA"}, "quantity": 35, "type": "CURRENCY"}], "source": "IAP", "transactionId": "h02CaPU2"}' \
    > test.out 2>&1
eval_tap $? 290 'FulfillRewards' test.out

#- 291 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3DXNEoEy' \
    --endTime 'Ce32ZRNQ' \
    --limit '35' \
    --offset '54' \
    --productId 'im0eOWUT' \
    --startTime 'uMeqmSnE' \
    --status 'PARTIAL_REVOKED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 291 'QueryUserIAPOrders' test.out

#- 292 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1EubysH' \
    > test.out 2>&1
eval_tap $? 292 'QueryAllUserIAPOrders' test.out

#- 293 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '7lM3D5kL' \
    --endTime 'RyzMu6Ys' \
    --limit '5' \
    --offset '24' \
    --startTime 'iWzQV2m9' \
    --status 'FAIL' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserIAPConsumeHistory' test.out

#- 294 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'r3bQyiEC' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XWWp_dJTz-645", "productId": "Ax7Vq33Z", "region": "PdJzSDmE", "transactionId": "IDxEuTbo", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 294 'MockFulfillIAPItem' test.out

#- 295 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPM0FIuM' \
    --body '{"skus": ["FgYHu0Ge", "JBOfytC1", "xZKeYp5j"]}' \
    > test.out 2>&1
eval_tap $? 295 'AdminSyncOculusSubscriptions' test.out

#- 296 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo '2jKl0dJg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j28T9G2U' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetIAPOrderLineItems' test.out

#- 297 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8J92nhV' \
    > test.out 2>&1
eval_tap $? 297 'AdminSyncSteamAbnormalTransaction' test.out

#- 298 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ji6UBFpk' \
    --body '{"orderId": "jSUVqTn1"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamIAPByTransaction' test.out

#- 299 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'akmaskxB' \
    --activeOnly  \
    --groupId 'IPxegxCx' \
    --limit '52' \
    --offset '62' \
    --platform 'XBOX' \
    --productId 'Z0nZQ7DG' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserThirdPartySubscription' test.out

#- 300 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'HwlhezJr' \
    --groupId 'G68duqtn' \
    > test.out 2>&1
eval_tap $? 300 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId '5AJyfvTe' \
    --productId '1APSxi3v' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 302 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'jggJTUZQ' \
    --activeOnly  \
    --groupId 'vmWEt3zV' \
    --limit '65' \
    --offset '0' \
    --platform 'TWITCH' \
    --productId 'J7EAIh3G' \
    > test.out 2>&1
eval_tap $? 302 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 303 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'bXInGNYl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fL5nCc0x' \
    > test.out 2>&1
eval_tap $? 303 'GetThirdPartySubscriptionDetails' test.out

#- 304 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'eveCE33F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWCyHIbK' \
    --limit '77' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 304 'GetSubscriptionHistory' test.out

#- 305 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'wOM3eX6u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqFK9WMl' \
    > test.out 2>&1
eval_tap $? 305 'SyncSubscriptionTransaction' test.out

#- 306 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'wOpqWy83' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A5xkEwTv' \
    > test.out 2>&1
eval_tap $? 306 'GetThirdPartyUserSubscriptionDetails' test.out

#- 307 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'dhESf9K5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRntVTDa' \
    > test.out 2>&1
eval_tap $? 307 'SyncSubscription' test.out

#- 308 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'S9FBsAJp' \
    --discounted  \
    --itemId 'Z7RIPDuk' \
    --limit '23' \
    --offset '62' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 308 'QueryUserOrders' test.out

#- 309 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '6av3ASQs' \
    --body '{"currencyCode": "W2UuwDKP", "currencyNamespace": "M4JTetUT", "discountCodes": ["yCsy0k4O", "4sTPw7EL", "VQCWz2i9"], "discountedPrice": 20, "entitlementPlatform": "Other", "ext": {"HbWROcAE": {}, "d7oAZWEk": {}, "PXgn7beu": {}}, "itemId": "4YmfmI8Z", "language": "DsEJqsWg", "options": {"skipPriceValidation": false}, "platform": "IOS", "price": 81, "quantity": 25, "region": "7hoRvuzu", "returnUrl": "Wfz85x1d", "sandbox": true, "sectionId": "3rdLqhZd"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateUserOrder' test.out

#- 310 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UEUiiQCx' \
    --itemId 'rJYCbYmE' \
    > test.out 2>&1
eval_tap $? 310 'CountOfPurchasedItem' test.out

#- 311 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FuAAuxRd' \
    --userId '0yXb0IAG' \
    > test.out 2>&1
eval_tap $? 311 'GetUserOrder' test.out

#- 312 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yb2pg9ht' \
    --userId 'zC2dwZhY' \
    --body '{"status": "REFUNDED", "statusReason": "vPUWllLC"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateUserOrderStatus' test.out

#- 313 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0Ltgpdtm' \
    --userId 'YVnvLdn9' \
    > test.out 2>&1
eval_tap $? 313 'FulfillUserOrder' test.out

#- 314 GetUserOrderGrant
eval_tap 0 314 'GetUserOrderGrant # SKIP deprecated' test.out

#- 315 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VOqci89a' \
    --userId 'pK9cQKot' \
    > test.out 2>&1
eval_tap $? 315 'GetUserOrderHistories' test.out

#- 316 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'COP3iSrD' \
    --userId 'oip4Jr0f' \
    --body '{"additionalData": {"cardSummary": "N6zYpJKa"}, "authorisedTime": "1980-06-03T00:00:00Z", "chargebackReversedTime": "1978-04-10T00:00:00Z", "chargebackTime": "1981-05-27T00:00:00Z", "chargedTime": "1981-02-22T00:00:00Z", "createdTime": "1971-06-20T00:00:00Z", "currency": {"currencyCode": "FVazriix", "currencySymbol": "aI5pLMV8", "currencyType": "VIRTUAL", "decimals": 68, "namespace": "Gnfmaf35"}, "customParameters": {"D7rqvNOb": {}, "YXzUGZD8": {}, "JhQNFBqZ": {}}, "extOrderNo": "VhL9BlX5", "extTxId": "8qc2OsUe", "extUserId": "vnyTk5iV", "issuedAt": "1987-11-20T00:00:00Z", "metadata": {"lsDtGwiz": "khiqYcHW", "6J8rLqyI": "bavZX5Gx", "F6rsW7iE": "k2dm5l5k"}, "namespace": "mBFbPqhy", "nonceStr": "zBV8OOtD", "paymentData": {"discountAmount": 89, "discountCode": "S591FUYu", "subtotalPrice": 57, "tax": 45, "totalPrice": 72}, "paymentMethod": "vMjGykS5", "paymentMethodFee": 96, "paymentOrderNo": "0InFMjxw", "paymentProvider": "CHECKOUT", "paymentProviderFee": 47, "paymentStationUrl": "THCWPYcE", "price": 39, "refundedTime": "1985-10-26T00:00:00Z", "salesTax": 31, "sandbox": true, "sku": "QfxCgoph", "status": "AUTHORISED", "statusReason": "XSBT8xbc", "subscriptionId": "6GXYQkeF", "subtotalPrice": 53, "targetNamespace": "OCvRoSvS", "targetUserId": "2bEYUIAd", "tax": 81, "totalPrice": 46, "totalTax": 21, "txEndTime": "1974-01-09T00:00:00Z", "type": "snvJEsw6", "userId": "8Fo1iCjG", "vat": 72}' \
    > test.out 2>&1
eval_tap $? 316 'ProcessUserOrderNotification' test.out

#- 317 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PN3Wheqs' \
    --userId 'qXL3gVmx' \
    > test.out 2>&1
eval_tap $? 317 'DownloadUserOrderReceipt' test.out

#- 318 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICkifkN9' \
    --body '{"currencyCode": "nwWVjSnk", "currencyNamespace": "4YpNWGCf", "customParameters": {"AyzY9hYV": {}, "ryDTkg7k": {}, "lA4KEm4P": {}}, "description": "YumkvJqz", "extOrderNo": "x2Y4hpVl", "extUserId": "6shD2GXg", "itemType": "SUBSCRIPTION", "language": "LkxG-LSJm_mi", "metadata": {"470LMElw": "jhxLzsyu", "8T1vf5l7": "O0oTJoeA", "3J4g0LAn": "EGSO6Osr"}, "notifyUrl": "ZcmyRQxe", "omitNotification": true, "platform": "uXRPkM24", "price": 27, "recurringPaymentOrderNo": "vkNNowOh", "region": "6UmgQAZG", "returnUrl": "VkvDJoP1", "sandbox": false, "sku": "gN2MVPrL", "subscriptionId": "ncUgAEm0", "title": "pWnfcaKb"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserPaymentOrder' test.out

#- 319 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hv8QKv6E' \
    --userId 'U84yItjz' \
    --body '{"description": "LJA6o5Y9"}' \
    > test.out 2>&1
eval_tap $? 319 'RefundUserPaymentOrder' test.out

#- 320 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'w1xcJaJk' \
    > test.out 2>&1
eval_tap $? 320 'GetUserPlatformAccountClosureHistories' test.out

#- 321 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'vfn7vHJb' \
    --body '{"code": "hAzh1hLX", "orderNo": "iWLcPYMB"}' \
    > test.out 2>&1
eval_tap $? 321 'ApplyUserRedemption' test.out

#- 322 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'qY5d86SB' \
    --body '{"meta": {"8GlpYABW": {}, "4pQCCmZk": {}, "ooyW7Ewi": {}}, "reason": "XNZSD44k", "requestId": "7JXCwc1X", "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "yHbOxHhV", "namespace": "NHddPZGC"}, "entitlement": {"entitlementId": "JrNonUYA"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "upKm8cdv", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 52, "type": "ITEM"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "MyZMvDLj", "namespace": "1rKHmAsQ"}, "entitlement": {"entitlementId": "uScYxgx7"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "gSPPtnrT", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 82, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "FRopoIwi", "namespace": "QS2wrMGH"}, "entitlement": {"entitlementId": "TEWH9ftN"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "pcF8Z9e5", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 45, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "ONrNk4Zo"}' \
    > test.out 2>&1
eval_tap $? 322 'DoRevocation' test.out

#- 323 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7RkKBL4' \
    --body '{"gameSessionId": "y2olR1sc", "payload": {"kzUFn074": {}, "Tx2wUzPP": {}, "47kBuriE": {}}, "scid": "WnHuFnMJ", "sessionTemplateName": "8Gdb4mU6"}' \
    > test.out 2>&1
eval_tap $? 323 'RegisterXblSessions' test.out

#- 324 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '8VUcf0lB' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'voxT4gcC' \
    --limit '88' \
    --offset '47' \
    --sku 'Sf3qUIEY' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 324 'QueryUserSubscriptions' test.out

#- 325 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '8XvfWCpW' \
    --excludeSystem  \
    --limit '13' \
    --offset '33' \
    --subscriptionId 'tgTgbWR8' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionActivities' test.out

#- 326 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4QVJK8aU' \
    --body '{"grantDays": 63, "itemId": "hge4oC4o", "language": "0bdNY2lp", "reason": "DEFrL9qp", "region": "pjNu8jc2", "source": "QTfrWltD"}' \
    > test.out 2>&1
eval_tap $? 326 'PlatformSubscribeSubscription' test.out

#- 327 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjwlMKfV' \
    --itemId 'Yc2IAukK' \
    > test.out 2>&1
eval_tap $? 327 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 328 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MK5f7bZi' \
    --userId 'viRlQpeL' \
    > test.out 2>&1
eval_tap $? 328 'GetUserSubscription' test.out

#- 329 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5nKbC68s' \
    --userId '7J1oqnzI' \
    > test.out 2>&1
eval_tap $? 329 'DeleteUserSubscription' test.out

#- 330 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mqEEX0st' \
    --userId 'vP5WxF4m' \
    --force  \
    --body '{"immediate": true, "reason": "UPxkW3Xq"}' \
    > test.out 2>&1
eval_tap $? 330 'CancelSubscription' test.out

#- 331 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Jxknt9LD' \
    --userId 'pmOu8ZTR' \
    --body '{"grantDays": 71, "reason": "zjmzSEyn"}' \
    > test.out 2>&1
eval_tap $? 331 'GrantDaysToSubscription' test.out

#- 332 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SNdi9GPv' \
    --userId 'fUNz3x4E' \
    --excludeFree  \
    --limit '41' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 332 'GetUserSubscriptionBillingHistories' test.out

#- 333 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GHjNHLEU' \
    --userId 'HiybNNOh' \
    --body '{"additionalData": {"cardSummary": "lKZCqmdk"}, "authorisedTime": "1993-11-22T00:00:00Z", "chargebackReversedTime": "1991-12-26T00:00:00Z", "chargebackTime": "1974-06-29T00:00:00Z", "chargedTime": "1982-02-08T00:00:00Z", "createdTime": "1988-09-08T00:00:00Z", "currency": {"currencyCode": "K7BWzI0J", "currencySymbol": "uEbKq83a", "currencyType": "VIRTUAL", "decimals": 7, "namespace": "6DhJ6pgU"}, "customParameters": {"vnJ2OD3E": {}, "EGd8Pkzt": {}, "miENeFaj": {}}, "extOrderNo": "cn25faes", "extTxId": "GoasuLYa", "extUserId": "swxCv7kr", "issuedAt": "1998-04-11T00:00:00Z", "metadata": {"X4uyGECi": "xMVOJMgP", "YtMgUHSH": "CFAIHMWD", "BQv1azpC": "w4ygKHtS"}, "namespace": "K58ROQmH", "nonceStr": "u9eoPEtt", "paymentData": {"discountAmount": 88, "discountCode": "K4tZpOnM", "subtotalPrice": 27, "tax": 64, "totalPrice": 61}, "paymentMethod": "IqA9TmkA", "paymentMethodFee": 95, "paymentOrderNo": "AOD0Eoo2", "paymentProvider": "WXPAY", "paymentProviderFee": 73, "paymentStationUrl": "mZOD8Jz8", "price": 22, "refundedTime": "1978-04-01T00:00:00Z", "salesTax": 40, "sandbox": true, "sku": "DL3qoFDV", "status": "REFUNDED", "statusReason": "8MASbOUW", "subscriptionId": "zxBXXaAn", "subtotalPrice": 64, "targetNamespace": "mNHk8Zna", "targetUserId": "sVSVpLc5", "tax": 20, "totalPrice": 2, "totalTax": 30, "txEndTime": "1987-05-01T00:00:00Z", "type": "2hsTj6kx", "userId": "nCTLhggm", "vat": 9}' \
    > test.out 2>&1
eval_tap $? 333 'ProcessUserSubscriptionNotification' test.out

#- 334 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'vyCRruCi' \
    --namespace "$AB_NAMESPACE" \
    --userId '8EifYDMf' \
    --body '{"count": 49, "orderNo": "MUs1kogw"}' \
    > test.out 2>&1
eval_tap $? 334 'AcquireUserTicket' test.out

#- 335 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsNSRzrI' \
    > test.out 2>&1
eval_tap $? 335 'QueryUserCurrencyWallets' test.out

#- 336 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'ZtNwSAe4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fku8cXpx' \
    --body '{"allowOverdraft": false, "amount": 90, "balanceOrigin": "Playstation", "balanceSource": "OTHER", "metadata": {"cFOJWNDK": {}, "FcyOWMZ3": {}, "o5d2Zmab": {}}, "reason": "NU3J8XnD"}' \
    > test.out 2>&1
eval_tap $? 336 'DebitUserWalletByCurrencyCode' test.out

#- 337 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'bRvnEYgg' \
    --namespace "$AB_NAMESPACE" \
    --userId '70vO7KR4' \
    --limit '77' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 337 'ListUserCurrencyTransactions' test.out

#- 338 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'ItXaPgRF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vw44HPnN' \
    --request '{"amount": 11, "debitBalanceSource": "PAYMENT", "metadata": {"dEeY6ioz": {}, "pn7CSXRY": {}, "O5g1lgtv": {}}, "reason": "DF09YwEk", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 338 'CheckBalance' test.out

#- 339 CheckWallet
eval_tap 0 339 'CheckWallet # SKIP deprecated' test.out

#- 340 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'XKtjgCsj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OtDQAZ6G' \
    --body '{"amount": 62, "expireAt": "1972-03-20T00:00:00Z", "metadata": {"Y5I9vcGu": {}, "00Sf65JI": {}, "0hY5M0GT": {}}, "origin": "Epic", "reason": "53wCa6qW", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 340 'CreditUserWallet' test.out

#- 341 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'PUQBNhKG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUeEDSMe' \
    --request '{"amount": 43, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"aNQoopZh": {}, "eH6bSleP": {}, "Ww9BPvdJ": {}}, "reason": "XruDJSYb", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 341 'DebitByWalletPlatform' test.out

#- 342 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'utjQrW2P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFyCqP2B' \
    --body '{"amount": 46, "metadata": {"aV5G1FNl": {}, "wMrcVPmv": {}, "dsaleMC1": {}}, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 342 'PayWithUserWallet' test.out

#- 343 GetUserWallet
eval_tap 0 343 'GetUserWallet # SKIP deprecated' test.out

#- 344 DebitUserWallet
eval_tap 0 344 'DebitUserWallet # SKIP deprecated' test.out

#- 345 DisableUserWallet
eval_tap 0 345 'DisableUserWallet # SKIP deprecated' test.out

#- 346 EnableUserWallet
eval_tap 0 346 'EnableUserWallet # SKIP deprecated' test.out

#- 347 ListUserWalletTransactions
eval_tap 0 347 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 348 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tMlxiPLv' \
    > test.out 2>&1
eval_tap $? 348 'ListViews' test.out

#- 349 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tlp66mif' \
    --body '{"displayOrder": 59, "localizations": {"jfmRZ9g6": {"description": "yweKrewa", "localExt": {"RIWgmFOH": {}, "WvwlbNl2": {}, "ehT4sVyV": {}}, "longDescription": "ySD4G7j7", "title": "gOCEHDaQ"}, "Y3JMscgN": {"description": "RUBrcOaE", "localExt": {"r5f7w0DT": {}, "Uo6QWr3p": {}, "XtDwH790": {}}, "longDescription": "PBO310V5", "title": "DhuLAkSd"}, "LizpnBrt": {"description": "ZuGVbm26", "localExt": {"M70CCF9W": {}, "5OSic8rG": {}, "Ye24thmv": {}}, "longDescription": "90NP3EeO", "title": "oKKFk8E0"}}, "name": "8IHoBmpv"}' \
    > test.out 2>&1
eval_tap $? 349 'CreateView' test.out

#- 350 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '6Cgsi6nS' \
    --storeId '6Pt4t9lE' \
    > test.out 2>&1
eval_tap $? 350 'GetView' test.out

#- 351 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'SFDQchxc' \
    --storeId '4kWc1wv7' \
    --body '{"displayOrder": 23, "localizations": {"lPKicDJV": {"description": "Ad1ZIrVI", "localExt": {"MGPrn0eT": {}, "pPOsficg": {}, "LHiM2HcQ": {}}, "longDescription": "Wc1c1iIB", "title": "YcEfVl4N"}, "1aJQdmBW": {"description": "rEZWG6a7", "localExt": {"YupFsKaP": {}, "ikQDWt4G": {}, "FrxpoOc8": {}}, "longDescription": "IiGTg2rM", "title": "pWQgL551"}, "AuIykXLJ": {"description": "EHvKH2xh", "localExt": {"J3MWPRYY": {}, "8EW5E0za": {}, "NvxDZhoQ": {}}, "longDescription": "1IlfIn1i", "title": "I36XCD1z"}}, "name": "lbAjohZP"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateView' test.out

#- 352 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'H7wL9q7I' \
    --storeId 'E6JnfhEz' \
    > test.out 2>&1
eval_tap $? 352 'DeleteView' test.out

#- 353 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'GetWalletConfig' test.out

#- 354 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateWalletConfig' test.out

#- 355 QueryWallets
eval_tap 0 355 'QueryWallets # SKIP deprecated' test.out

#- 356 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 70, "expireAt": "1998-08-09T00:00:00Z", "metadata": {"XdQsMZKP": {}, "e4tD1hCn": {}, "z8soqirL": {}}, "origin": "Nintendo", "reason": "J4iwdbqu", "source": "REFERRAL_BONUS"}, "currencyCode": "q9v9ABjb", "userIds": ["wnQXjp1g", "EZpWmGQN", "67whVipG"]}, {"creditRequest": {"amount": 65, "expireAt": "1993-04-22T00:00:00Z", "metadata": {"VMYaDnN6": {}, "6O2YQHVy": {}, "DwQD84Ka": {}}, "origin": "Steam", "reason": "5jmeG4e0", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "0ZdMffay", "userIds": ["zzuW0XEU", "rwYZr2KT", "PoHZnEJC"]}, {"creditRequest": {"amount": 2, "expireAt": "1974-02-16T00:00:00Z", "metadata": {"E1rbKckw": {}, "bmjUoHFv": {}, "Wj98VBGj": {}}, "origin": "GooglePlay", "reason": "1RUJV2de", "source": "ACHIEVEMENT"}, "currencyCode": "JYi7GesF", "userIds": ["ZIj5RkoB", "Aj6wru4i", "xVP5iktg"]}]' \
    > test.out 2>&1
eval_tap $? 356 'BulkCredit' test.out

#- 357 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "MPQ3om8s", "request": {"allowOverdraft": false, "amount": 67, "balanceOrigin": "Epic", "balanceSource": "IAP_REVOCATION", "metadata": {"kk6pJ0eV": {}, "ddn8y7bI": {}, "DGz3c9Fn": {}}, "reason": "rE3MwoYO"}, "userIds": ["jc0SQPmy", "mAEKeYxa", "VhP4Mtnw"]}, {"currencyCode": "QwKX5cDT", "request": {"allowOverdraft": false, "amount": 51, "balanceOrigin": "Xbox", "balanceSource": "TRADE", "metadata": {"MVZrx1Az": {}, "DWLGvBBC": {}, "sBIRxsIO": {}}, "reason": "JWbbXW1Q"}, "userIds": ["czxuMfWU", "gdSjQsip", "LqrJ8adT"]}, {"currencyCode": "NsRGXw8j", "request": {"allowOverdraft": false, "amount": 8, "balanceOrigin": "Epic", "balanceSource": "OTHER", "metadata": {"LQz99hRV": {}, "MqSS0nsl": {}, "eY1xc3SS": {}}, "reason": "V7IfmHds"}, "userIds": ["VaZyxOKs", "jHPsWebD", "aNX0PtPg"]}]' \
    > test.out 2>&1
eval_tap $? 357 'BulkDebit' test.out

#- 358 GetWallet
eval_tap 0 358 'GetWallet # SKIP deprecated' test.out

#- 359 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '8fEvKULx' \
    --end 'L1YRQekq' \
    --start 'ah8LCDQH' \
    > test.out 2>&1
eval_tap $? 359 'SyncOrders' test.out

#- 360 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["cTF9LhXT", "Z0rIcBfJ", "jXxibZnB"], "apiKey": "goDil0za", "authoriseAsCapture": true, "blockedPaymentMethods": ["QhBmYOw8", "OetmBG5t", "yj8XshJP"], "clientKey": "QuvQN3T3", "dropInSettings": "09mJkIxh", "liveEndpointUrlPrefix": "pisEpJUU", "merchantAccount": "L8NUZGly", "notificationHmacKey": "xsBiMCjy", "notificationPassword": "lHodTbL6", "notificationUsername": "76cg3uv6", "returnUrl": "BftCsv34", "settings": "gOXk54CE"}' \
    > test.out 2>&1
eval_tap $? 360 'TestAdyenConfig' test.out

#- 361 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "JQ4oQqmc", "privateKey": "xq5v8inY", "publicKey": "tEVadjDA", "returnUrl": "sUGYGIa0"}' \
    > test.out 2>&1
eval_tap $? 361 'TestAliPayConfig' test.out

#- 362 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "mhOOO3C4", "secretKey": "2LSCZNJ6"}' \
    > test.out 2>&1
eval_tap $? 362 'TestCheckoutConfig' test.out

#- 363 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '8ZiCIjaF' \
    > test.out 2>&1
eval_tap $? 363 'DebugMatchedPaymentMerchantConfig' test.out

#- 364 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "xEns8PLn", "webhookSecretKey": "xo2ERRzr"}' \
    > test.out 2>&1
eval_tap $? 364 'TestNeonPayConfig' test.out

#- 365 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "0cFzVNjc", "clientSecret": "pz2vjM1S", "returnUrl": "Mf9uWN6t", "webHookId": "FdAi89j3"}' \
    > test.out 2>&1
eval_tap $? 365 'TestPayPalConfig' test.out

#- 366 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["RQY2UjtQ", "rwJu32W9", "nZrWZJaM"], "publishableKey": "Pv2rpHDI", "secretKey": "q3NVXlE1", "webhookSecret": "rJLI3Fzl"}' \
    > test.out 2>&1
eval_tap $? 366 'TestStripeConfig' test.out

#- 367 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "M2KDyjq4", "key": "R5TbKxBP", "mchid": "X7VeR6Jp", "returnUrl": "O85c5ngz"}' \
    > test.out 2>&1
eval_tap $? 367 'TestWxPayConfig' test.out

#- 368 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "EUYIsalD", "flowCompletionUrl": "hDwiaG44", "merchantId": 72, "projectId": 77, "projectSecretKey": "gNpBoc13"}' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfig' test.out

#- 369 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'aJGZaXzu' \
    > test.out 2>&1
eval_tap $? 369 'GetPaymentMerchantConfig1' test.out

#- 370 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'abcxlrl4' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["rYIx9Z8V", "0yyiNXJH", "PoxHOVjG"], "apiKey": "5jT8Ik6o", "authoriseAsCapture": false, "blockedPaymentMethods": ["doLZMkPG", "VlbQide5", "iUrMLTyE"], "clientKey": "9pF9IQfs", "dropInSettings": "0t0aKBKw", "liveEndpointUrlPrefix": "y8g1iTqu", "merchantAccount": "JLhxsJqk", "notificationHmacKey": "MW7XiZk8", "notificationPassword": "0YjS4mYF", "notificationUsername": "MOoyBm5h", "returnUrl": "1gURHb64", "settings": "pEkSxRNr"}' \
    > test.out 2>&1
eval_tap $? 370 'UpdateAdyenConfig' test.out

#- 371 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'RCFtgLGg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 371 'TestAdyenConfigById' test.out

#- 372 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'F2Wb8zAE' \
    --sandbox  \
    --validate  \
    --body '{"appId": "kOjbKasn", "privateKey": "rHVvOSDE", "publicKey": "4vPeoxG2", "returnUrl": "mlkuZxTI"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAliPayConfig' test.out

#- 373 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'vVgw7AQ0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAliPayConfigById' test.out

#- 374 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'VTKyQeQ1' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "nTvbp9yh", "secretKey": "uhys8yeT"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateCheckoutConfig' test.out

#- 375 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'jh6dydlT' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestCheckoutConfigById' test.out

#- 376 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'GjnlEaBO' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "PEHYei0a", "webhookSecretKey": "nLUxkc1j"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateNeonPayConfig' test.out

#- 377 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'ufTeHIFF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestNeonPayConfigById' test.out

#- 378 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '7iYHEaSE' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "bL94gQxw", "clientSecret": "9a3AFVeu", "returnUrl": "n9kAKpYY", "webHookId": "qyA6ILHt"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePayPalConfig' test.out

#- 379 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'UmjKTI87' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestPayPalConfigById' test.out

#- 380 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'vOrTxTI3' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["2mej9LkK", "6hVEaOgl", "mWQkdqsj"], "publishableKey": "bHhBgViM", "secretKey": "HB1YL96s", "webhookSecret": "2DerUwBz"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateStripeConfig' test.out

#- 381 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'J4HuYPQR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestStripeConfigById' test.out

#- 382 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '3DGsM6VH' \
    --validate  \
    --body '{"appId": "5YKS0WGY", "key": "FQa3NJWU", "mchid": "EjRGvEyT", "returnUrl": "mUfNRXCQ"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateWxPayConfig' test.out

#- 383 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'tzoDzXb7' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 383 'UpdateWxPayConfigCert' test.out

#- 384 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Va1SKnNG' \
    > test.out 2>&1
eval_tap $? 384 'TestWxPayConfigById' test.out

#- 385 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'qSiAuegA' \
    --validate  \
    --body '{"apiKey": "9n36C0hQ", "flowCompletionUrl": "baBmhrB7", "merchantId": 46, "projectId": 33, "projectSecretKey": "SXoIp0u3"}' \
    > test.out 2>&1
eval_tap $? 385 'UpdateXsollaConfig' test.out

#- 386 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'rW4cC8iM' \
    > test.out 2>&1
eval_tap $? 386 'TestXsollaConfigById' test.out

#- 387 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ZuX6dclW' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaUIConfig' test.out

#- 388 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '89' \
    --namespace "$AB_NAMESPACE" \
    --offset '60' \
    --region '0FRM1Xl3' \
    > test.out 2>&1
eval_tap $? 388 'QueryPaymentProviderConfig' test.out

#- 389 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "STRIPE", "namespace": "F7vI0uvJ", "region": "dCabcV1p", "sandboxTaxJarApiToken": "A90F5D0q", "specials": ["XSOLLA", "XSOLLA", "WALLET"], "taxJarApiToken": "PQpQoXaE", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 389 'CreatePaymentProviderConfig' test.out

#- 390 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 390 'GetAggregatePaymentProviders' test.out

#- 391 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '0wH8vCWh' \
    > test.out 2>&1
eval_tap $? 391 'DebugMatchedPaymentProviderConfig' test.out

#- 392 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetSpecialPaymentProviders' test.out

#- 393 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'Bq1T1snG' \
    --body '{"aggregate": "STRIPE", "namespace": "3nF6Q3MY", "region": "gLRE8joY", "sandboxTaxJarApiToken": "4cPd33ik", "specials": ["XSOLLA", "STRIPE", "ADYEN"], "taxJarApiToken": "DysZJjp8", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 393 'UpdatePaymentProviderConfig' test.out

#- 394 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '3cd8rIHh' \
    > test.out 2>&1
eval_tap $? 394 'DeletePaymentProviderConfig' test.out

#- 395 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 395 'GetPaymentTaxConfig' test.out

#- 396 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Oua9zkZ9", "taxJarApiToken": "dKhGUIMV", "taxJarEnabled": true, "taxJarProductCodesMapping": {"l5ersi81": "6DNV6eBm", "KWBSrKdZ": "zMwWdb4f", "TZVjDB6B": "8Jku5NvD"}}' \
    > test.out 2>&1
eval_tap $? 396 'UpdatePaymentTaxConfig' test.out

#- 397 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'mUrukzpl' \
    --end 'hlKyXRrf' \
    --start 'nnRfOVez' \
    > test.out 2>&1
eval_tap $? 397 'SyncPaymentOrders' test.out

#- 398 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Rh5RbyKO' \
    --storeId 'NNsAtZAq' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetRootCategories' test.out

#- 399 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'X4Drklgn' \
    --storeId 'YFuxhV0J' \
    > test.out 2>&1
eval_tap $? 399 'DownloadCategories' test.out

#- 400 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'VUSGJWPy' \
    --namespace "$AB_NAMESPACE" \
    --language '92lIFvGu' \
    --storeId 'ZH3c19lE' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetCategory' test.out

#- 401 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'DAnuKEqG' \
    --namespace "$AB_NAMESPACE" \
    --language 'lLDlvcgs' \
    --storeId '9Wk9X3wV' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetChildCategories' test.out

#- 402 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'zQzzYbNR' \
    --namespace "$AB_NAMESPACE" \
    --language 'lK4AxaAf' \
    --storeId 'PUZZ8iew' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetDescendantCategories' test.out

#- 403 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 403 'PublicListCurrencies' test.out

#- 404 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 404 'GeDLCDurableRewardShortMap' test.out

#- 405 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 405 'GetAppleConfigVersion' test.out

#- 406 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 406 'GetIAPItemMapping' test.out

#- 407 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'm7ctRjri' \
    --region 'wSzs1awb' \
    --storeId 'Ak1vlGEH' \
    --appId 'zTauMXv4' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItemByAppId' test.out

#- 408 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'EtxgoYg1' \
    --categoryPath 'Ws2SZ5W1' \
    --features 'SnWfUPt2' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --language 'kGUy8dnT' \
    --limit '61' \
    --offset '10' \
    --region '0NpcKUuh' \
    --sortBy 'createdAt,updatedAt:desc,createdAt:asc' \
    --storeId '8nILGLzF' \
    --tags 'fkIgJjIn' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryItems' test.out

#- 409 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'M3sY2V4k' \
    --region '8iPSnqPI' \
    --storeId 'filLvapd' \
    --sku 'HwFjMW32' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemBySku' test.out

#- 410 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'A31VBvOe' \
    --storeId 'UF3enha6' \
    --itemIds 'ud7EDEB3' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetEstimatedPrice' test.out

#- 411 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'KIDKFmAf' \
    --region 'hVSEZIwn' \
    --storeId 'QucBsmql' \
    --itemIds '3ZzTn9nl' \
    > test.out 2>&1
eval_tap $? 411 'PublicBulkGetItems' test.out

#- 412 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["vVUnSi5W", "GeCmiSad", "HUOjNoQg"]}' \
    > test.out 2>&1
eval_tap $? 412 'PublicValidateItemPurchaseCondition' test.out

#- 413 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '10' \
    --offset '54' \
    --region 'Kp4PXV6q' \
    --storeId 'Lyg5di2B' \
    --keyword 'oKv4EVVm' \
    --language 'NJ1ik6IE' \
    > test.out 2>&1
eval_tap $? 413 'PublicSearchItems' test.out

#- 414 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'Vf3ZQwmm' \
    --namespace "$AB_NAMESPACE" \
    --language '61xZBCHR' \
    --region 'vzPdOjtZ' \
    --storeId 'wNouKYoj' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetApp' test.out

#- 415 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '8Sxo3Wiy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetItemDynamicData' test.out

#- 416 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'sCERor0G' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'pqGoD2Sf' \
    --populateBundle  \
    --region 'lweSxncX' \
    --storeId 'Cu8x4R5K' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetItem' test.out

#- 417 GetPaymentCustomization
eval_tap 0 417 'GetPaymentCustomization # SKIP deprecated' test.out

#- 418 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "PhqMNMW8", "successUrl": "94nRUSiB"}, "paymentOrderNo": "jYgOlLQZ", "paymentProvider": "ADYEN", "returnUrl": "erUtnxkW", "ui": "dfeeeK3n", "zipCode": "hYySOcYo"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetPaymentUrl' test.out

#- 419 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mIkfxGYS' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetPaymentMethods' test.out

#- 420 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '5iGHE56M' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUnpaidPaymentOrder' test.out

#- 421 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zyrBP0E8' \
    --paymentProvider 'STRIPE' \
    --zipCode 'D09wweLn' \
    --body '{"token": "lvi4niyG"}' \
    > test.out 2>&1
eval_tap $? 421 'Pay' test.out

#- 422 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Lzcya17H' \
    > test.out 2>&1
eval_tap $? 422 'PublicCheckPaymentOrderPaidStatus' test.out

#- 423 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 't4T7jzQ8' \
    > test.out 2>&1
eval_tap $? 423 'GetPaymentPublicConfig' test.out

#- 424 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'E0nFEsto' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetQRCode' test.out

#- 425 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'bYec0gBf' \
    --foreinginvoice 'UcbKMWwM' \
    --invoiceId 'FvkkKtA1' \
    --payload 'udVoVY7R' \
    --redirectResult 'CJ8Tc4HC' \
    --resultCode 'mNaxF9Bx' \
    --sessionId 'IxS6uj0v' \
    --status 'Z7bPak7M' \
    --token 'yFrQvSF3' \
    --type '4X3coiJy' \
    --userId '6PNK27iX' \
    --orderNo 'UZ1xuxHf' \
    --paymentOrderNo 'PVC3wGva' \
    --paymentProvider 'PAYPAL' \
    --returnUrl '9FfVo7qu' \
    > test.out 2>&1
eval_tap $? 425 'PublicNormalizePaymentReturnUrl' test.out

#- 426 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'BxrMwduX' \
    --paymentOrderNo 'PimuyFPc' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 426 'GetPaymentTaxValue' test.out

#- 427 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '3RcHiZHz' \
    > test.out 2>&1
eval_tap $? 427 'GetRewardByCode' test.out

#- 428 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'lCvxwESC' \
    --limit '55' \
    --offset '38' \
    --sortBy 'rewardCode:desc,namespace:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 428 'QueryRewards1' test.out

#- 429 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ntk3bj9e' \
    > test.out 2>&1
eval_tap $? 429 'GetReward1' test.out

#- 430 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicListStores' test.out

#- 431 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'dDoKyZs6,Nt03LUFM,U409RScz' \
    --itemIds '8OCl6w9J,LnbRH7FG,nqtoxluc' \
    --skus 'dchIzOca,aNb7xVmu,c1SSMcNu' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyMyActiveEntitlement' test.out

#- 432 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'uvrG3TSB' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'NmcA40R2' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 434 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'T9Fm4pNT' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 435 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'BgmraqNg,i5p8aOh3,jvPugpvK' \
    --itemIds 'sfHFZwFB,wIqds8p0,inT5L2qk' \
    --skus 'qBJEdXEk,2X4hLnSt,UViHdkVQ' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetEntitlementOwnershipToken' test.out

#- 436 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Pai56wa2", "language": "Wx", "region": "76x8S7Ps"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncTwitchDropsEntitlement' test.out

#- 437 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'kugz3uBa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 437 'PublicGetMyWallet' test.out

#- 438 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'IHe9fMmy' \
    --body '{"epicGamesJwtToken": "fxOe5VIC"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncEpicGameDLC' test.out

#- 439 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSHiD6fA' \
    > test.out 2>&1
eval_tap $? 439 'SyncOculusDLC' test.out

#- 440 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Aa9hh1sZ' \
    --body '{"serviceLabel": 64}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSyncPsnDlcInventory' test.out

#- 441 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'brJOv0HO' \
    --body '{"serviceLabels": [81, 90, 74]}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 442 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qggEJuXh' \
    --body '{"appId": "U9Ryhj8i", "steamId": "tybprIJ4"}' \
    > test.out 2>&1
eval_tap $? 442 'SyncSteamDLC' test.out

#- 443 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVXEe1WJ' \
    --body '{"xstsToken": "nTOAIuxB"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncXboxDLC' test.out

#- 444 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5NS1OzGe' \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName '8H7pmAb0' \
    --features '5iIsVwrD,DbtZ65zA,ipr0jtC6' \
    --itemId 'fayviUfy,SJs58QdH,zUmu61Zk' \
    --limit '81' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 444 'PublicQueryUserEntitlements' test.out

#- 445 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MyS1SiOU' \
    --appId 'O0Wvbmsw' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementByAppId' test.out

#- 446 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbOVrj6k' \
    --limit '71' \
    --offset '48' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlementsByAppType' test.out

#- 447 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'samEqUhp' \
    --availablePlatformOnly  \
    --ids 'GH4TIrkx,Lpa6fKwz,boyYX0mx' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementsByIds' test.out

#- 448 PublicGetUserEntitlementByItemId
eval_tap 0 448 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 449 PublicGetUserEntitlementBySku
eval_tap 0 449 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 450 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'blICk0CT' \
    --endDate 'DvWCWAE8' \
    --entitlementClazz 'CODE' \
    --limit '25' \
    --offset '11' \
    --startDate 'OfnMWt08' \
    > test.out 2>&1
eval_tap $? 450 'PublicUserEntitlementHistory' test.out

#- 451 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUxijmKF' \
    --appIds 'Zgc93Ltr,KQsLHIRR,TBsGdCuv' \
    --itemIds '9eb2QNfu,aWcB7ylG,sHi7Vgm1' \
    --skus 'AZY4C7pK,XoF4G0lX,Xdtr1sJn' \
    > test.out 2>&1
eval_tap $? 451 'PublicExistsAnyUserActiveEntitlement' test.out

#- 452 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6rghyYK' \
    --appId 'lnVpHfOW' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 453 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xz06LY15' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'Ax4vfnZO' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 454 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzM0JnC5' \
    --ids 'gWtRslEL,CsjgaDnW,Ram9nOT2' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 455 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZdASWITA' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '2cypVLzT' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 456 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'wxeCa2Gg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8lpfgSE' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlement' test.out

#- 457 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Wv6tOK4g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b0CqRKsl' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["mhkMcphT", "Cr4u2Asx", "pyJrwvjB"], "requestId": "tv0d2V2T", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 457 'PublicConsumeUserEntitlement' test.out

#- 458 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'rjNBXykz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DHzmEgni' \
    --body '{"requestId": "Ois8jKWD", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 458 'PublicSellUserEntitlement' test.out

#- 459 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'uRpTyxs9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EuPH9FhM' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 50}' \
    > test.out 2>&1
eval_tap $? 459 'PublicSplitUserEntitlement' test.out

#- 460 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'AHhA0jdD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEvrSdG3' \
    --body '{"entitlementId": "bZuIll9j", "metadata": {"operationSource": "INVENTORY"}, "useCount": 100}' \
    > test.out 2>&1
eval_tap $? 460 'PublicTransferUserEntitlement' test.out

#- 461 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'g5guCz39' \
    --body '{"code": "7z5J5Paz", "language": "aQYg", "region": "Crcp5fdp"}' \
    > test.out 2>&1
eval_tap $? 461 'PublicRedeemCode' test.out

#- 462 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rNOBTAOV' \
    --body '{"excludeOldTransactions": true, "language": "BVQ", "productId": "wScFsh1x", "receiptData": "r6J8erRV", "region": "3J9W1Hxn", "transactionId": "1cCgRBic"}' \
    > test.out 2>&1
eval_tap $? 462 'PublicFulfillAppleIAPItem' test.out

#- 463 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNIunTIH' \
    --body '{"epicGamesJwtToken": "5GrRBOiR"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncEpicGamesInventory' test.out

#- 464 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'u5RoGUQL' \
    --body '{"autoAck": false, "autoConsume": true, "language": "vRM", "orderId": "OdMcon9e", "packageName": "0cYotnzt", "productId": "zwUsIV7E", "purchaseTime": 4, "purchaseToken": "nBsZ473K", "region": "W4OIXWSK", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillGoogleIAPItem' test.out

#- 465 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q14p2WPI' \
    --body '{"skus": ["wIoIny84", "etcL2shV", "w3cA05Ne"]}' \
    > test.out 2>&1
eval_tap $? 465 'SyncOculusSubscriptions' test.out

#- 466 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '06UHPHuB' \
    > test.out 2>&1
eval_tap $? 466 'SyncOculusConsumableEntitlements' test.out

#- 467 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '1ilHU5cI' \
    --body '{"currencyCode": "kk8pEBPI", "price": 0.7532159342030496, "productId": "CrzDyp0k", "serviceLabel": 85}' \
    > test.out 2>&1
eval_tap $? 467 'PublicReconcilePlayStationStore' test.out

#- 468 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 're8qSCzH' \
    --body '{"currencyCode": "4IrFvdYS", "price": 0.5229430139651741, "productId": "o4sk9Wk4", "serviceLabels": [24, 66, 22]}' \
    > test.out 2>&1
eval_tap $? 468 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 469 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wx6hVyNp' \
    --body '{"appId": "dFKoaoOK", "currencyCode": "Bswb9wuv", "language": "hmKj-KmAk", "price": 0.40506901494729897, "productId": "4arwXXFu", "region": "KphTwJN4", "steamId": "pZFXy2Rr"}' \
    > test.out 2>&1
eval_tap $? 469 'SyncSteamInventory' test.out

#- 470 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q3hCj8tu' \
    > test.out 2>&1
eval_tap $? 470 'SyncSteamAbnormalTransaction' test.out

#- 471 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '7hWBAZFg' \
    --body '{"orderId": "xuo9MoZI"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamIAPByTransaction' test.out

#- 472 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId 'lkBsut3r' \
    --activeOnly  \
    --groupId 'AAUeJPYq' \
    --limit '62' \
    --offset '10' \
    --productId '18DXX56G' \
    > test.out 2>&1
eval_tap $? 472 'PublicQueryUserThirdPartySubscription' test.out

#- 473 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BmxmGfgI' \
    --body '{"gameId": "hMrfxji1", "language": "VP_qgep", "region": "faIc2HRZ"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncTwitchDropsEntitlement1' test.out

#- 474 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'XKAcrRrR' \
    --body '{"currencyCode": "83IEWXrZ", "price": 0.3530521043471503, "productId": "Tc93zEnM", "xstsToken": "4zjap8Im"}' \
    > test.out 2>&1
eval_tap $? 474 'SyncXboxInventory' test.out

#- 475 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3y74Oru' \
    --discounted  \
    --itemId 'iOOEvMT7' \
    --limit '25' \
    --offset '24' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserOrders' test.out

#- 476 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUMJAsur' \
    --body '{"currencyCode": "gwCETzRO", "discountCodes": ["toBbaAPe", "NCQxD3MR", "hf6tGUNx"], "discountedPrice": 85, "ext": {"uTvZAWfQ": {}, "wNorki3K": {}, "husCP91y": {}}, "itemId": "HOCKedEe", "language": "LU_jpII", "price": 44, "quantity": 38, "region": "EF0AKF05", "returnUrl": "ilyNaCvg", "sectionId": "5jH1knQQ"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicCreateUserOrder' test.out

#- 477 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'WhY00Csf' \
    --body '{"currencyCode": "XF6VMJ4B", "discountCodes": ["0ivB1f4w", "jpnrKsky", "vljoSEiv"], "discountedPrice": 95, "itemId": "7LO1DB25", "price": 45, "quantity": 81}' \
    > test.out 2>&1
eval_tap $? 477 'PublicPreviewOrderPrice' test.out

#- 478 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ctrFAhrp' \
    --userId 'cU4VlsSy' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserOrder' test.out

#- 479 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ThuX2Of1' \
    --userId 'YX97Ta88' \
    > test.out 2>&1
eval_tap $? 479 'PublicCancelUserOrder' test.out

#- 480 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sMYcaek2' \
    --userId '2OsLV9Lm' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrderHistories' test.out

#- 481 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FVb26lBG' \
    --userId 'rv02bFlr' \
    > test.out 2>&1
eval_tap $? 481 'PublicDownloadUserOrderReceipt' test.out

#- 482 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '7XWgTBMS' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetPaymentAccounts' test.out

#- 483 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'vr54iGJQ' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'IrcbZ2MZ' \
    > test.out 2>&1
eval_tap $? 483 'PublicDeletePaymentAccount' test.out

#- 484 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9DHFCUp' \
    --autoCalcEstimatedPrice  \
    --language 'J908uAur' \
    --region 'ohr2EvR5' \
    --storeId 'Kf2zV6u8' \
    --viewId 'gndk31HJ' \
    > test.out 2>&1
eval_tap $? 484 'PublicListActiveSections' test.out

#- 485 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'klSYLYos' \
    --chargeStatus 'CHARGED' \
    --itemId 'kmsm7DuK' \
    --limit '38' \
    --offset '21' \
    --sku 'NwKwStaM' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 485 'PublicQueryUserSubscriptions' test.out

#- 486 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZuHpkdP0' \
    --body '{"currencyCode": "QNPxUURS", "itemId": "nCwObFr4", "language": "EcNQ", "region": "rbQPIZga", "returnUrl": "s9Nv6a3B", "source": "R1W8fINn"}' \
    > test.out 2>&1
eval_tap $? 486 'PublicSubscribeSubscription' test.out

#- 487 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DTXeiona' \
    --itemId 'ff2eWczE' \
    > test.out 2>&1
eval_tap $? 487 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 488 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZU8ij6f9' \
    --userId 'ozEtAkz0' \
    > test.out 2>&1
eval_tap $? 488 'PublicGetUserSubscription' test.out

#- 489 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LxdmsORS' \
    --userId 'f23qvClt' \
    > test.out 2>&1
eval_tap $? 489 'PublicChangeSubscriptionBillingAccount' test.out

#- 490 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Lx206QrJ' \
    --userId 'MoGyJv4P' \
    --body '{"immediate": true, "reason": "iPxC9xRy"}' \
    > test.out 2>&1
eval_tap $? 490 'PublicCancelSubscription' test.out

#- 491 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Rd0yxNej' \
    --userId 'ZIfwkhfk' \
    --excludeFree  \
    --limit '99' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 491 'PublicGetUserSubscriptionBillingHistories' test.out

#- 492 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'fRX7KK0P' \
    --language 'QSmgP3kk' \
    --storeId 'i50gLwiY' \
    > test.out 2>&1
eval_tap $? 492 'PublicListViews' test.out

#- 493 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'KzZj8sax' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fBdoM50f' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetWallet' test.out

#- 494 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '1EMdfeLS' \
    --namespace "$AB_NAMESPACE" \
    --userId '5fzGsZtj' \
    --limit '94' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 494 'PublicListUserWalletTransactions' test.out

#- 495 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetMyDLCContent' test.out

#- 496 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'e06jUZrL' \
    --limit '74' \
    --offset '94' \
    --startTime 'UU5cYbDa' \
    --state 'FULFILLED' \
    --transactionId 'pQsQV2VM' \
    --userId 'eRTeMIF9' \
    > test.out 2>&1
eval_tap $? 496 'QueryFulfillments' test.out

#- 497 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'sfsfP0MQ' \
    --baseAppId 'ulAaLuSM' \
    --categoryPath 'IVdXtiOC' \
    --features 'D7ELTYXn' \
    --includeSubCategoryItem  \
    --itemName 'HeVvqVsX' \
    --itemStatus 'ACTIVE' \
    --itemType 'LOOTBOX,EXTENSION,SEASON' \
    --limit '69' \
    --offset '78' \
    --region 'Aa3IAFQC' \
    --sectionExclusive  \
    --sortBy 'updatedAt,createdAt:desc,updatedAt:asc' \
    --storeId 'tf5YzMEf' \
    --tags 'DSb0W0nT' \
    --targetNamespace '2dHfPCZU' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 497 'QueryItemsV2' test.out

#- 498 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LfcVN7kc' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 498 'ImportStore1' test.out

#- 499 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MZtcsnej' \
    --body '{"itemIds": ["6rv3hga6", "Sb8Xn2KD", "xqqIDBJB"]}' \
    > test.out 2>&1
eval_tap $? 499 'ExportStore1' test.out

#- 500 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BggIMKCa' \
    --body '{"entitlementCollectionId": "kBwYh9HP", "entitlementOrigin": "GooglePlay", "metadata": {"myQkiToS": {}, "8YuhMFAe": {}, "ZAKnHfsu": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "LjY6UUY6", "namespace": "B4GZ0ROg"}, "item": {"itemId": "EZ6XLZW5", "itemName": "6LGDGWo1", "itemSku": "h7YJZAzd", "itemType": "CetXYc4T"}, "quantity": 43, "type": "ITEM"}, {"currency": {"currencyCode": "e9UW7bdq", "namespace": "VufcVsXk"}, "item": {"itemId": "olaWGWXH", "itemName": "DfUIkCRM", "itemSku": "srZZN9dE", "itemType": "CvtXrPkX"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "GH2fv7in", "namespace": "ksIzV5ez"}, "item": {"itemId": "8ztyat7y", "itemName": "gdaFJhT1", "itemSku": "6pVzJocX", "itemType": "f76F99ai"}, "quantity": 79, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "xZFBRvK2"}' \
    > test.out 2>&1
eval_tap $? 500 'FulfillRewardsV2' test.out

#- 501 FulfillItems
eval_tap 0 501 'FulfillItems # SKIP deprecated' test.out

#- 502 RetryFulfillItems
eval_tap 0 502 'RetryFulfillItems # SKIP deprecated' test.out

#- 503 RevokeItems
eval_tap 0 503 'RevokeItems # SKIP deprecated' test.out

#- 504 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2rFnXkxl' \
    --body '{"transactionId": "betnfchD"}' \
    > test.out 2>&1
eval_tap $? 504 'V2PublicFulfillAppleIAPItem' test.out

#- 505 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'tZxaURuS' \
    --userId '1OQP7S9L' \
    --body '{"items": [{"duration": 25, "endDate": "1996-09-10T00:00:00Z", "entitlementCollectionId": "F5V3yu1P", "entitlementOrigin": "Other", "itemId": "Yjb8eklX", "itemSku": "DtJJsO2j", "language": "E5f4KPet", "metadata": {"lD9YZg0d": {}, "DJbohEsK": {}, "SeYadhb7": {}}, "orderNo": "Zv8EIR5S", "origin": "Steam", "quantity": 87, "region": "NMd4KnPa", "source": "DLC", "startDate": "1976-08-19T00:00:00Z", "storeId": "qEaOZdb6"}, {"duration": 66, "endDate": "1987-02-09T00:00:00Z", "entitlementCollectionId": "VQ5x4N6e", "entitlementOrigin": "Xbox", "itemId": "wSpXK3p2", "itemSku": "pbNr5yUG", "language": "b5hlQ0RH", "metadata": {"Jd7etYFR": {}, "e0siCMQP": {}, "j2c2vF2v": {}}, "orderNo": "Jv3oykU3", "origin": "Nintendo", "quantity": 50, "region": "KxsLf3AG", "source": "ACHIEVEMENT", "startDate": "1992-04-16T00:00:00Z", "storeId": "YwK5ARQq"}, {"duration": 1, "endDate": "1987-04-25T00:00:00Z", "entitlementCollectionId": "cHaJivEO", "entitlementOrigin": "Oculus", "itemId": "KxpKjE1I", "itemSku": "RWANskwk", "language": "M3hyVCTm", "metadata": {"6SW5OCNv": {}, "zZuU6zNF": {}, "BRqmKUv7": {}}, "orderNo": "N9y93M0i", "origin": "IOS", "quantity": 7, "region": "NdOLKQSv", "source": "EXPIRATION", "startDate": "1981-08-07T00:00:00Z", "storeId": "fMBAcgY4"}]}' \
    > test.out 2>&1
eval_tap $? 505 'FulfillItemsV3' test.out

#- 506 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'W0SbSLwY' \
    --userId '589PIeBl' \
    > test.out 2>&1
eval_tap $? 506 'RetryFulfillItemsV3' test.out

#- 507 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'IAlH6N8W' \
    --userId 'VznjtkqM' \
    > test.out 2>&1
eval_tap $? 507 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
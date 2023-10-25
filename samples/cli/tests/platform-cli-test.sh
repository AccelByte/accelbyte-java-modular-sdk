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
echo "1..423"

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
    --id 'PDldwOjo' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'Aov1FLaM' \
    --body '{"grantDays": "yrVQ2xll"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'CBgKkRhG' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'rEJVaTno' \
    --body '{"grantDays": "Cdv04240"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "RYnbzgAT", "dryRun": true, "fulfillmentUrl": "acDOk0UQ", "itemType": "MEDIA", "purchaseConditionUrl": "f3a78uCG"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'L76RP3Xl' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'Yt5DgkxT' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'QXteP8Ts' \
    --body '{"clazz": "pPnsCFEm", "dryRun": true, "fulfillmentUrl": "J6s718gU", "purchaseConditionUrl": "gDJhBlPT"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'DrfyBbjV' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --name '3xUpgHlx' \
    --offset '84' \
    --tag 'jQditHVN' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wKLC2h43", "items": [{"extraSubscriptionDays": 71, "itemId": "D8hHjxoz", "itemName": "DOLDmCz7", "quantity": 91}, {"extraSubscriptionDays": 93, "itemId": "AxWFMZs0", "itemName": "gLUimF7J", "quantity": 41}, {"extraSubscriptionDays": 69, "itemId": "tleU2eCc", "itemName": "xH9mHrt5", "quantity": 93}], "maxRedeemCountPerCampaignPerUser": 53, "maxRedeemCountPerCode": 76, "maxRedeemCountPerCodePerUser": 77, "maxSaleCount": 84, "name": "X71eimCm", "redeemEnd": "1996-05-14T00:00:00Z", "redeemStart": "1993-08-23T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["9pTbqo0n", "sQ7LHKB8", "1HA8V90f"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'xf2jZzQa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'ttcReJHo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SjU9f1sM", "items": [{"extraSubscriptionDays": 34, "itemId": "ZY9zhixp", "itemName": "iXKanFzV", "quantity": 76}, {"extraSubscriptionDays": 39, "itemId": "KCHR6ca2", "itemName": "GC5vpAT3", "quantity": 64}, {"extraSubscriptionDays": 67, "itemId": "tkopXIaI", "itemName": "OyGmnIGX", "quantity": 95}], "maxRedeemCountPerCampaignPerUser": 45, "maxRedeemCountPerCode": 74, "maxRedeemCountPerCodePerUser": 61, "maxSaleCount": 4, "name": "BkKluDL7", "redeemEnd": "1972-05-10T00:00:00Z", "redeemStart": "1997-09-27T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["jjnlD248", "GRNnb1Zk", "aeqd7oYS"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'cs227B7X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetLootBoxPluginConfig' test.out

#- 19 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "2NlCTNXf"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "m51wACZF"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateLootBoxPluginConfig' test.out

#- 20 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteLootBoxPluginConfig' test.out

#- 21 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'UplodLootBoxPluginConfigCert' test.out

#- 22 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 22 'GetLootBoxGrpcInfo' test.out

#- 23 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetSectionPluginConfig' test.out

#- 24 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "EGsGkfzr"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "9pBMwUVz"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateSectionPluginConfig' test.out

#- 25 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteSectionPluginConfig' test.out

#- 26 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 26 'UploadSectionPluginConfigCert' test.out

#- 27 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'j53kHfke' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H5X80J2J' \
    --body '{"categoryPath": "Z3kUe2uI", "localizationDisplayNames": {"qGxbW2i3": "HvxdWo5q", "9M4nLJMA": "tOyLHrkT", "txYWzjAF": "yi87UeB0"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FzVbd66y' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'mcsRLomB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QsMZgawU' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'w9SInKZH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nLTLHHu9' \
    --body '{"localizationDisplayNames": {"YNiXRIPC": "iPlokvMT", "0pOWkh82": "b550ErIo", "qyLnTpys": "4cpI5XOM"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'PV0Fm0zM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E6nrixif' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'z45Gg9hm' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7S752WPj' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '3ngWlenI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QBUcJFlp' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'N87vhJqP' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '89' \
    --code 'buywZU4j' \
    --limit '37' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'VKwNe0vC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 3}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'E7W0r1e6' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '7' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'Eo8Fekqe' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '16' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'c0b5lhCR' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '12' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'oTAXbLtA' \
    --namespace "$AB_NAMESPACE" \
    --code 'OeXKhAey' \
    --limit '12' \
    --offset '66' \
    --userId 'eIRt5FZD' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'xT54zMN9' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'MEZRFIBB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'Te0l8kqn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'EnableCode' test.out

#- 44 GetServicePluginConfig
eval_tap 0 44 'GetServicePluginConfig # SKIP deprecated' test.out

#- 45 UpdateServicePluginConfig
eval_tap 0 45 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 46 DeleteServicePluginConfig
eval_tap 0 46 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 47 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 47 'ListCurrencies' test.out

#- 48 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "DgkdUkEG", "currencySymbol": "C33fmPvi", "currencyType": "VIRTUAL", "decimals": 100, "localizationDescriptions": {"Bdjtt0g3": "cr555w1p", "g9vTemaT": "Zd4AUZtx", "g0boVpB4": "RXKcuUmN"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'epnQliKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"GXhf30Fd": "4ApGV1Xh", "JX3XJYl5": "avS4Qmp8", "22AOtxPY": "j8vctIl8"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'OTCs1fgS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'FnLnbd10' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'mJ46flra' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetCurrencySummary' test.out

#- 53 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetDLCItemConfig' test.out

#- 54 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "CCS0kMjb", "rewards": [{"currency": {"currencyCode": "dijtmOcL", "namespace": "BXgJmOAV"}, "item": {"itemId": "xLCnsnmj", "itemSku": "0Z7lR6M5", "itemType": "bfawhPyk"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "2fB6vTOW", "namespace": "iSwm3NKC"}, "item": {"itemId": "AxFsqiYY", "itemSku": "xamGVGQA", "itemType": "qLKXwqDW"}, "quantity": 47, "type": "CURRENCY"}, {"currency": {"currencyCode": "0j9j1T1T", "namespace": "S5a3wPDZ"}, "item": {"itemId": "ILQyJKHP", "itemSku": "vGpuCWcU", "itemType": "ihcY4mee"}, "quantity": 67, "type": "CURRENCY"}]}, {"id": "hqy1cVGv", "rewards": [{"currency": {"currencyCode": "TX6vbvzA", "namespace": "7OENJBC2"}, "item": {"itemId": "YJfPaMfl", "itemSku": "jDPRWtc6", "itemType": "EfJldsGJ"}, "quantity": 14, "type": "CURRENCY"}, {"currency": {"currencyCode": "FYuRx6LQ", "namespace": "j0lV6Nfu"}, "item": {"itemId": "X8QkCcKc", "itemSku": "uGdzR53s", "itemType": "aXVLhbou"}, "quantity": 39, "type": "CURRENCY"}, {"currency": {"currencyCode": "PkqIwFhH", "namespace": "iHa1FX3L"}, "item": {"itemId": "KfPKvVFd", "itemSku": "zfbtzPqb", "itemType": "3s9BphRd"}, "quantity": 12, "type": "ITEM"}]}, {"id": "TYedyM0B", "rewards": [{"currency": {"currencyCode": "YG1YySQo", "namespace": "LDXAleqR"}, "item": {"itemId": "QmJbwT24", "itemSku": "QfNNYiVx", "itemType": "xqiinyM3"}, "quantity": 94, "type": "ITEM"}, {"currency": {"currencyCode": "O7j7cBvh", "namespace": "7epA4xVU"}, "item": {"itemId": "qOtJ7bpW", "itemSku": "XEataf4T", "itemType": "StH0mlhL"}, "quantity": 92, "type": "ITEM"}, {"currency": {"currencyCode": "JRofvlnb", "namespace": "SvMqkyOA"}, "item": {"itemId": "csKnN9ST", "itemSku": "m3kJe2xc", "itemType": "18tIJnue"}, "quantity": 32, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateDLCItemConfig' test.out

#- 55 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteDLCItemConfig' test.out

#- 56 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetPlatformDLCConfig' test.out

#- 57 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"0c76arP0": "mjmjBOVy", "jOBJq0ff": "SEUWHFL0", "ODwIHCn5": "vxenkJHI"}}, {"platform": "PSN", "platformDlcIdMap": {"u2jJbXEz": "a2WZkNNT", "ibLafUfq": "U3zkMYU0", "zUTTy9oV": "MjVg1bNg"}}, {"platform": "XBOX", "platformDlcIdMap": {"AQNiCim1": "gEXPGXZM", "O0xvlJPj": "q90WlTx4", "rlPNgV1f": "dFQxAb4x"}}]}' \
    > test.out 2>&1
eval_tap $? 57 'UpdatePlatformDLCConfig' test.out

#- 58 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'DeletePlatformDLCConfig' test.out

#- 59 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName 'u3WNttju' \
    --itemId '2O41HDXd,oCSCGEyu,FsyDFv2u' \
    --limit '91' \
    --offset '86' \
    --userId '7mITvire' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '0zgn1GLo,hLUn5cYy,EvesLorN' \
    --limit '89' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements1' test.out

#- 61 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1998-06-16T00:00:00Z", "grantedCode": "Y4MqUNkL", "itemId": "N7hSSqll", "itemNamespace": "g8oKQiO6", "language": "Bx", "quantity": 78, "region": "WufOcIGe", "source": "REDEEM_CODE", "startDate": "1983-04-24T00:00:00Z", "storeId": "S1KWOnUX"}, {"endDate": "1983-01-03T00:00:00Z", "grantedCode": "X8KoJoxN", "itemId": "5mJwGn7z", "itemNamespace": "px671SQV", "language": "AK-MdBD-844", "quantity": 55, "region": "euADa7jQ", "source": "REWARD", "startDate": "1976-08-13T00:00:00Z", "storeId": "oiVXGd4x"}, {"endDate": "1973-01-20T00:00:00Z", "grantedCode": "GoZ1qH78", "itemId": "sAK7VNoe", "itemNamespace": "RHbfg0vl", "language": "LS-Vp", "quantity": 62, "region": "7pfkSmN7", "source": "PROMOTION", "startDate": "1978-08-27T00:00:00Z", "storeId": "CZaOpPNs"}], "userIds": ["b0WM8Hqk", "UpYuEdP9", "3GVdgzei"]}' \
    > test.out 2>&1
eval_tap $? 61 'GrantEntitlements' test.out

#- 62 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["nuUFCFUk", "mLbec6pI", "wN4eCpvQ"]' \
    > test.out 2>&1
eval_tap $? 62 'RevokeEntitlements' test.out

#- 63 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'vfEKOt1o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'GetEntitlement' test.out

#- 64 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '65' \
    --status 'FAIL' \
    --userId 'DGmVUm3o' \
    > test.out 2>&1
eval_tap $? 64 'QueryFulfillmentHistories' test.out

#- 65 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'CKaL1kQA' \
    --eventType 'REFUND' \
    --externalOrderId 'ZnmAV6hj' \
    --limit '69' \
    --offset '75' \
    --startTime 'xtwYXwQv' \
    --status 'INIT' \
    --userId 'HnAR33g9' \
    > test.out 2>&1
eval_tap $? 65 'QueryIAPClawbackHistory' test.out

#- 66 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "921wUZQW", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 84, "clientTransactionId": "o2VxXok6"}, {"amountConsumed": 52, "clientTransactionId": "qLfs6X3i"}, {"amountConsumed": 18, "clientTransactionId": "Fbn5UvIG"}], "entitlementId": "540vtQKS", "usageCount": 57}, {"clientTransaction": [{"amountConsumed": 94, "clientTransactionId": "jxAM4iKv"}, {"amountConsumed": 81, "clientTransactionId": "LWX8eZ4A"}, {"amountConsumed": 72, "clientTransactionId": "TIu6GpWz"}], "entitlementId": "60pXnz21", "usageCount": 73}, {"clientTransaction": [{"amountConsumed": 15, "clientTransactionId": "TfAjuaVI"}, {"amountConsumed": 10, "clientTransactionId": "3fxAVWMa"}, {"amountConsumed": 95, "clientTransactionId": "3XMmZtxC"}], "entitlementId": "RJQSwm09", "usageCount": 8}], "purpose": "U8nUBbQg"}, "originalTitleName": "IavariLd", "paymentProductSKU": "e9IxQ3zr", "purchaseDate": "9dcAQAdc", "sourceOrderItemId": "UYtDpjwE", "titleName": "RS8tQpGi"}, "eventDomain": "8Ud7UGyr", "eventSource": "RZF52S1a", "eventType": "HGp5Oz2F", "eventVersion": 62, "id": "xEU4Xwzk", "timestamp": "LwjCAthJ"}' \
    > test.out 2>&1
eval_tap $? 66 'MockPlayStationStreamEvent' test.out

#- 67 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetAppleIAPConfig' test.out

#- 68 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "DcK7OqAt", "password": "sSnwzDS5"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateAppleIAPConfig' test.out

#- 69 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteAppleIAPConfig' test.out

#- 70 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetEpicGamesIAPConfig' test.out

#- 71 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "nWP8Jhr3"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateEpicGamesIAPConfig' test.out

#- 72 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteEpicGamesIAPConfig' test.out

#- 73 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGoogleIAPConfig' test.out

#- 74 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "ThAK2aep", "serviceAccountId": "qjkhAecu"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateGoogleIAPConfig' test.out

#- 75 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteGoogleIAPConfig' test.out

#- 76 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 76 'UpdateGoogleP12File' test.out

#- 77 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetIAPItemConfig' test.out

#- 78 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "Q1cE0WfZ", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"Wt3cZ36q": "uQM66n6F", "qZmNyDcW": "sd3qzqwH", "bUUDytY3": "NMTR42oa"}}, {"itemIdentity": "6aG0DMEk", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"B0PSyoFI": "8kdXG5mH", "lQjZCbzQ": "9t5mrXLt", "r7PH25Mi": "zPJVJsaF"}}, {"itemIdentity": "xwQ83QrI", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"N0o41Zv4": "ksAQ8nK7", "tO1D0uGb": "68dlAjJS", "7r7mLVhL": "wG1cVb1b"}}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateIAPItemConfig' test.out

#- 79 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteIAPItemConfig' test.out

#- 80 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetOculusIAPConfig' test.out

#- 81 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "bPq9ufV9", "appSecret": "kye35aMj"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateOculusIAPConfig' test.out

#- 82 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteOculusIAPConfig' test.out

#- 83 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetPlayStationIAPConfig' test.out

#- 84 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "t14I8QJY", "backOfficeServerClientSecret": "xFdveBnL", "enableStreamJob": true, "environment": "zyBFKkNB", "streamName": "I2DIixct", "streamPartnerName": "OfkEAPLM"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdatePlaystationIAPConfig' test.out

#- 85 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeletePlaystationIAPConfig' test.out

#- 86 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'ValidateExistedPlaystationIAPConfig' test.out

#- 87 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "ozuF8AAM", "backOfficeServerClientSecret": "VghZpqvK", "enableStreamJob": false, "environment": "TORxPcZ8", "streamName": "Czj41VxR", "streamPartnerName": "eTDgD09J"}' \
    > test.out 2>&1
eval_tap $? 87 'ValidatePlaystationIAPConfig' test.out

#- 88 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetSteamIAPConfig' test.out

#- 89 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "AlDeTjRh", "publisherAuthenticationKey": "UezPsEjh"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateSteamIAPConfig' test.out

#- 90 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteSteamIAPConfig' test.out

#- 91 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetTwitchIAPConfig' test.out

#- 92 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "qGXkc8bF", "clientSecret": "DCoXoGqm", "organizationId": "rVQ001o5"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdateTwitchIAPConfig' test.out

#- 93 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeleteTwitchIAPConfig' test.out

#- 94 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetXblIAPConfig' test.out

#- 95 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "AB5eVppy"}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateXblIAPConfig' test.out

#- 96 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'DeleteXblAPConfig' test.out

#- 97 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'xVekEilS' \
    > test.out 2>&1
eval_tap $? 97 'UpdateXblBPCertFile' test.out

#- 98 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'Vw5IRfoy' \
    --itemId 'rkMdOWrW' \
    --itemType 'EXTENSION' \
    --endTime 'oVKDbihT' \
    --startTime 'aw9rmeD8' \
    > test.out 2>&1
eval_tap $? 98 'DownloadInvoiceDetails' test.out

#- 99 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'HiFLjSce' \
    --itemId 'r0JkIy0V' \
    --itemType 'CODE' \
    --endTime 'PAkwU3lI' \
    --startTime 'meFdRLKy' \
    > test.out 2>&1
eval_tap $? 99 'GenerateInvoiceSummary' test.out

#- 100 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GzsMJnE2' \
    --body '{"categoryPath": "4gFD1Wm5", "targetItemId": "cUQifckP", "targetNamespace": "DwsyMdDz"}' \
    > test.out 2>&1
eval_tap $? 100 'SyncInGameItem' test.out

#- 101 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BGT3Ajg2' \
    --body '{"appId": "Tp84G6VN", "appType": "GAME", "baseAppId": "aCoCwus1", "boothName": "tRb4dUF4", "categoryPath": "Dk5YKK6T", "clazz": "HGVlwhwq", "displayOrder": 55, "entitlementType": "DURABLE", "ext": {"Pz6aMvAx": {}, "w7g1xkWS": {}, "gnxGDbhj": {}}, "features": ["sr15rUjz", "HD6ECDTx", "w1KGwVh5"], "flexible": false, "images": [{"as": "FH1AkCix", "caption": "ESE63rar", "height": 79, "imageUrl": "D3907qRD", "smallImageUrl": "dUO4E1Ra", "width": 4}, {"as": "ZneGb2FU", "caption": "HGndf5Sn", "height": 80, "imageUrl": "15CZlCTE", "smallImageUrl": "4Vlinfwo", "width": 66}, {"as": "GkS85KnE", "caption": "oqL4ZoRm", "height": 11, "imageUrl": "fcayKYi7", "smallImageUrl": "9rwnYgIs", "width": 69}], "itemIds": ["Z55KUslI", "D9Yl7qrF", "B45dK4YJ"], "itemQty": {"NVqoRBaX": 24, "qyJskQXz": 88, "lNTgFwpc": 97}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"QHfvwVsP": {"description": "8qi9BpOV", "localExt": {"D79iQofO": {}, "xryOoWaL": {}, "3VkdJl7j": {}}, "longDescription": "5hO0SmBI", "title": "gF7LiMQL"}, "xQpx8jdJ": {"description": "wvKvMXMI", "localExt": {"XShsfyJH": {}, "wqA7Xezb": {}, "YCF51R3B": {}}, "longDescription": "OAK5wdi9", "title": "z3IqYzns"}, "BdBuo3m0": {"description": "vkqO7VoP", "localExt": {"9oCEeyUS": {}, "nW4EggB8": {}, "fJLIPqgU": {}}, "longDescription": "QgHLaaSI", "title": "grOIQ8kW"}}, "lootBoxConfig": {"rewardCount": 20, "rewards": [{"lootBoxItems": [{"count": 42, "duration": 60, "endDate": "1973-05-31T00:00:00Z", "itemId": "4tpJXFUZ", "itemSku": "sZFBNtH2", "itemType": "SVbpNSkJ"}, {"count": 17, "duration": 49, "endDate": "1991-03-26T00:00:00Z", "itemId": "hEZoh6lr", "itemSku": "wVIIVTnA", "itemType": "3GLnbrbG"}, {"count": 21, "duration": 3, "endDate": "1972-04-02T00:00:00Z", "itemId": "OB3CGkby", "itemSku": "RYqxi6kA", "itemType": "00HGIArh"}], "name": "pVLT59rf", "odds": 0.2344797897218236, "type": "REWARD_GROUP", "weight": 66}, {"lootBoxItems": [{"count": 58, "duration": 28, "endDate": "1980-10-03T00:00:00Z", "itemId": "WC4JfmB8", "itemSku": "AY0Jq5U6", "itemType": "mISce49i"}, {"count": 22, "duration": 39, "endDate": "1987-06-04T00:00:00Z", "itemId": "DNVmPuQx", "itemSku": "nhhFszWD", "itemType": "DqRGCIRk"}, {"count": 50, "duration": 29, "endDate": "1971-01-08T00:00:00Z", "itemId": "M5WSy4Eg", "itemSku": "PJcU0YLX", "itemType": "A8ciF5rR"}], "name": "eImtUE4Z", "odds": 0.9890490009082327, "type": "PROBABILITY_GROUP", "weight": 33}, {"lootBoxItems": [{"count": 7, "duration": 42, "endDate": "1987-10-06T00:00:00Z", "itemId": "8DHLyRGs", "itemSku": "TBslQelg", "itemType": "9qaIazUL"}, {"count": 64, "duration": 77, "endDate": "1973-01-12T00:00:00Z", "itemId": "cHzUK8Uu", "itemSku": "I9VMr3b7", "itemType": "KuynbJZr"}, {"count": 14, "duration": 24, "endDate": "1990-05-22T00:00:00Z", "itemId": "otOwb6sD", "itemSku": "cUHdotAT", "itemType": "vCWFIkwP"}], "name": "bBctbEQA", "odds": 0.9573388518666989, "type": "REWARD", "weight": 62}], "rollFunction": "DEFAULT"}, "maxCount": 54, "maxCountPerUser": 5, "name": "sOMlGoOo", "optionBoxConfig": {"boxItems": [{"count": 70, "duration": 15, "endDate": "1995-01-19T00:00:00Z", "itemId": "v2V8d2xx", "itemSku": "ASsSCzGL", "itemType": "Z5U2eSbt"}, {"count": 85, "duration": 87, "endDate": "1977-02-02T00:00:00Z", "itemId": "sk9p9vQF", "itemSku": "L2FLaLDF", "itemType": "CPsApKid"}, {"count": 47, "duration": 86, "endDate": "1980-08-11T00:00:00Z", "itemId": "YoZanu3M", "itemSku": "TAXdrmMb", "itemType": "ATghZp3A"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 94, "fixedTrialCycles": 62, "graceDays": 68}, "regionData": {"i9mD2OFq": [{"currencyCode": "IgH2MP9f", "currencyNamespace": "E8nYKhrB", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1986-03-03T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1999-12-24T00:00:00Z", "expireAt": "1996-02-16T00:00:00Z", "price": 84, "purchaseAt": "1985-09-10T00:00:00Z", "trialPrice": 76}, {"currencyCode": "meeNNtF1", "currencyNamespace": "kILbW01e", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1986-11-14T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1982-09-21T00:00:00Z", "expireAt": "1981-04-18T00:00:00Z", "price": 85, "purchaseAt": "1979-04-28T00:00:00Z", "trialPrice": 36}, {"currencyCode": "Nzvbi9AU", "currencyNamespace": "jnCgdbPM", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1997-01-22T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1995-01-26T00:00:00Z", "expireAt": "1975-04-14T00:00:00Z", "price": 59, "purchaseAt": "1981-01-21T00:00:00Z", "trialPrice": 40}], "3qLe9aWa": [{"currencyCode": "BkkqWgoH", "currencyNamespace": "6UDhXbYE", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1993-02-04T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1981-12-15T00:00:00Z", "expireAt": "1983-04-25T00:00:00Z", "price": 27, "purchaseAt": "1988-08-23T00:00:00Z", "trialPrice": 83}, {"currencyCode": "aKOt2kKw", "currencyNamespace": "BLa4itLa", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1973-08-23T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1992-10-01T00:00:00Z", "expireAt": "1975-10-30T00:00:00Z", "price": 91, "purchaseAt": "1983-11-27T00:00:00Z", "trialPrice": 9}, {"currencyCode": "ko4YHA3w", "currencyNamespace": "iFNeO9Wi", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1988-01-22T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1976-08-14T00:00:00Z", "expireAt": "1979-01-30T00:00:00Z", "price": 69, "purchaseAt": "1977-01-01T00:00:00Z", "trialPrice": 26}], "2wM3Zx4O": [{"currencyCode": "8yURmlYw", "currencyNamespace": "sZRXj3a8", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1982-04-17T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1995-04-24T00:00:00Z", "expireAt": "1984-09-22T00:00:00Z", "price": 67, "purchaseAt": "1996-03-14T00:00:00Z", "trialPrice": 12}, {"currencyCode": "a486qDmB", "currencyNamespace": "Dwg3WBM6", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1988-09-20T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1995-02-15T00:00:00Z", "expireAt": "1982-07-08T00:00:00Z", "price": 70, "purchaseAt": "1992-10-31T00:00:00Z", "trialPrice": 19}, {"currencyCode": "CAFdpicB", "currencyNamespace": "vUcy6P9g", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1974-01-28T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1978-05-06T00:00:00Z", "expireAt": "1988-03-22T00:00:00Z", "price": 75, "purchaseAt": "1972-02-26T00:00:00Z", "trialPrice": 43}]}, "saleConfig": {"currencyCode": "HAi5nvRV", "price": 90}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "dJJi7lul", "stackable": true, "status": "INACTIVE", "tags": ["bfo4ZqMb", "AJIHrfV3", "gGDtvGrz"], "targetCurrencyCode": "8kgS6tSd", "targetNamespace": "q6UEhuA5", "thumbnailUrl": "B9CKQgKY", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 101 'CreateItem' test.out

#- 102 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KEEkxZL7' \
    --appId 'GFnfFzTZ' \
    > test.out 2>&1
eval_tap $? 102 'GetItemByAppId' test.out

#- 103 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'yBjbq576' \
    --baseAppId 'hwzvoKPG' \
    --categoryPath 'iuX7pL5u' \
    --features 'OF18YIe1' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '69' \
    --offset '73' \
    --region 'g47etEbG' \
    --sortBy 'name,name:asc,updatedAt:desc' \
    --storeId '0w5HHtoj' \
    --tags 'zrNy3wxV' \
    --targetNamespace 'zqhUoDYl' \
    > test.out 2>&1
eval_tap $? 103 'QueryItems' test.out

#- 104 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '0EDQiSjA,QQoLWlXr,zbfSdfx0' \
    > test.out 2>&1
eval_tap $? 104 'ListBasicItemsByFeatures' test.out

#- 105 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'es2EmcUr' \
    --itemIds 'pFz3iP7i' \
    > test.out 2>&1
eval_tap $? 105 'GetItems' test.out

#- 106 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'C3zbwOX6' \
    --sku 'FZkxAEtG' \
    > test.out 2>&1
eval_tap $? 106 'GetItemBySku' test.out

#- 107 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'u7CAfV7n' \
    --populateBundle  \
    --region 'UllSqxNR' \
    --storeId 'KXre0taX' \
    --sku 'GleppdcM' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItemBySku' test.out

#- 108 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'bm7nds2J' \
    --storeId '0pbkDNK6' \
    --itemIds '8WAHVSyP' \
    --userId 'Rmz0eAvH' \
    > test.out 2>&1
eval_tap $? 108 'GetEstimatedPrice' test.out

#- 109 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2RjkmEik' \
    --sku 'BcFOgPve' \
    > test.out 2>&1
eval_tap $? 109 'GetItemIdBySku' test.out

#- 110 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'gPd1WIGy,fZJe5C2K,iMS0ZdaO' \
    --storeId 'V6mcA1YV' \
    > test.out 2>&1
eval_tap $? 110 'GetBulkItemIdBySkus' test.out

#- 111 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '11OmDbue' \
    --region 'bUJ5A7zi' \
    --storeId 'OMse7dJQ' \
    --itemIds 'nsZEUzhY' \
    > test.out 2>&1
eval_tap $? 111 'BulkGetLocaleItems' test.out

#- 112 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'GetAvailablePredicateTypes' test.out

#- 113 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBiACx1C' \
    --body '{"itemIds": ["JXbFcDkD", "9yqarpJ7", "EIAcU7TW"]}' \
    > test.out 2>&1
eval_tap $? 113 'ValidateItemPurchaseCondition' test.out

#- 114 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 's8BancWe' \
    --body '{"changes": [{"itemIdentities": ["FaZT8c3i", "v4rt5SIi", "N7aTC98f"], "itemIdentityType": "ITEM_SKU", "regionData": {"QG0FA4mJ": [{"currencyCode": "FlVt5525", "currencyNamespace": "bIfRx8My", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1983-03-21T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1982-05-17T00:00:00Z", "discountedPrice": 98, "expireAt": "1975-11-24T00:00:00Z", "price": 99, "purchaseAt": "1977-06-02T00:00:00Z", "trialPrice": 27}, {"currencyCode": "eaShJDcH", "currencyNamespace": "J9gy4gNE", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1995-07-16T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1980-05-20T00:00:00Z", "discountedPrice": 6, "expireAt": "1979-12-15T00:00:00Z", "price": 31, "purchaseAt": "1982-04-28T00:00:00Z", "trialPrice": 81}, {"currencyCode": "nOyMR4jM", "currencyNamespace": "C5ZfLv5G", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1983-07-23T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1999-04-04T00:00:00Z", "discountedPrice": 2, "expireAt": "1971-09-26T00:00:00Z", "price": 28, "purchaseAt": "1978-12-12T00:00:00Z", "trialPrice": 74}], "IJcMT6YR": [{"currencyCode": "qTJJTnbe", "currencyNamespace": "ew3QKfN4", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1976-07-18T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1987-11-25T00:00:00Z", "discountedPrice": 88, "expireAt": "1989-01-30T00:00:00Z", "price": 17, "purchaseAt": "1978-07-10T00:00:00Z", "trialPrice": 12}, {"currencyCode": "NJcXDovc", "currencyNamespace": "KfWWxkhA", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1984-08-21T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1992-08-28T00:00:00Z", "discountedPrice": 69, "expireAt": "1983-04-28T00:00:00Z", "price": 26, "purchaseAt": "1992-05-20T00:00:00Z", "trialPrice": 8}, {"currencyCode": "H6062tZi", "currencyNamespace": "LcQinQgz", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1974-12-05T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1997-03-07T00:00:00Z", "discountedPrice": 46, "expireAt": "1980-02-05T00:00:00Z", "price": 94, "purchaseAt": "1976-09-02T00:00:00Z", "trialPrice": 13}], "V296IF41": [{"currencyCode": "wIUMHRId", "currencyNamespace": "EvTANDDH", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1991-12-17T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1979-05-11T00:00:00Z", "discountedPrice": 91, "expireAt": "1989-01-24T00:00:00Z", "price": 71, "purchaseAt": "1981-01-25T00:00:00Z", "trialPrice": 46}, {"currencyCode": "f66CftgD", "currencyNamespace": "zGFFV4wq", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1997-06-28T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1983-10-16T00:00:00Z", "discountedPrice": 34, "expireAt": "1972-06-06T00:00:00Z", "price": 68, "purchaseAt": "1985-06-23T00:00:00Z", "trialPrice": 45}, {"currencyCode": "PC0ofIDa", "currencyNamespace": "v1myrJei", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1999-10-06T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1988-12-24T00:00:00Z", "discountedPrice": 29, "expireAt": "1971-02-15T00:00:00Z", "price": 64, "purchaseAt": "1988-11-26T00:00:00Z", "trialPrice": 23}]}}, {"itemIdentities": ["o23jscpm", "BYLnq3dL", "ORTxpsRC"], "itemIdentityType": "ITEM_ID", "regionData": {"BEKEaQmH": [{"currencyCode": "BrJnmAdy", "currencyNamespace": "EAMD8crm", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1996-03-20T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1997-08-04T00:00:00Z", "discountedPrice": 29, "expireAt": "1993-08-04T00:00:00Z", "price": 67, "purchaseAt": "1974-08-15T00:00:00Z", "trialPrice": 74}, {"currencyCode": "sRP2pE4I", "currencyNamespace": "KeQ2ezfH", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1977-09-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1973-10-02T00:00:00Z", "discountedPrice": 95, "expireAt": "1997-10-26T00:00:00Z", "price": 65, "purchaseAt": "1987-03-12T00:00:00Z", "trialPrice": 10}, {"currencyCode": "PYa5wDgJ", "currencyNamespace": "8Gv8NXHv", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1987-06-22T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1978-03-13T00:00:00Z", "discountedPrice": 57, "expireAt": "1994-09-08T00:00:00Z", "price": 8, "purchaseAt": "1996-08-18T00:00:00Z", "trialPrice": 15}], "71pDMNkE": [{"currencyCode": "Qd2xT1jI", "currencyNamespace": "th7GwqeY", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1988-08-26T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1985-07-05T00:00:00Z", "discountedPrice": 93, "expireAt": "1971-07-16T00:00:00Z", "price": 37, "purchaseAt": "1984-12-04T00:00:00Z", "trialPrice": 7}, {"currencyCode": "9Fr5AIOy", "currencyNamespace": "oBvIbLdq", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1997-08-04T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1985-05-03T00:00:00Z", "discountedPrice": 4, "expireAt": "1973-03-02T00:00:00Z", "price": 63, "purchaseAt": "1991-05-25T00:00:00Z", "trialPrice": 69}, {"currencyCode": "SR2fq75t", "currencyNamespace": "YzfapBVa", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1996-06-15T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1974-02-27T00:00:00Z", "discountedPrice": 76, "expireAt": "1981-05-16T00:00:00Z", "price": 19, "purchaseAt": "1982-10-22T00:00:00Z", "trialPrice": 99}], "BT30CDhc": [{"currencyCode": "SDDQ0ujx", "currencyNamespace": "bvg8LjYJ", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1992-04-22T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1977-07-06T00:00:00Z", "discountedPrice": 50, "expireAt": "1990-11-25T00:00:00Z", "price": 90, "purchaseAt": "1985-02-19T00:00:00Z", "trialPrice": 17}, {"currencyCode": "qI0M5j0z", "currencyNamespace": "F2k9x4JB", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1992-04-27T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-12-07T00:00:00Z", "discountedPrice": 87, "expireAt": "1989-12-22T00:00:00Z", "price": 61, "purchaseAt": "1994-02-10T00:00:00Z", "trialPrice": 68}, {"currencyCode": "QcC1tRxs", "currencyNamespace": "u8bGo3im", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1974-04-20T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1980-01-15T00:00:00Z", "discountedPrice": 62, "expireAt": "1992-04-13T00:00:00Z", "price": 44, "purchaseAt": "1974-12-10T00:00:00Z", "trialPrice": 27}]}}, {"itemIdentities": ["XsAv3cnG", "3QZo39Yn", "NXuZ6M3U"], "itemIdentityType": "ITEM_ID", "regionData": {"RpydLpQr": [{"currencyCode": "IepYPz9i", "currencyNamespace": "s4BdMPuU", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1990-11-26T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1979-09-09T00:00:00Z", "discountedPrice": 4, "expireAt": "1984-07-05T00:00:00Z", "price": 24, "purchaseAt": "1978-03-14T00:00:00Z", "trialPrice": 52}, {"currencyCode": "b7z1IoEY", "currencyNamespace": "sKJ2uT8X", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1985-06-27T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1995-12-27T00:00:00Z", "discountedPrice": 39, "expireAt": "1996-04-25T00:00:00Z", "price": 68, "purchaseAt": "1987-07-17T00:00:00Z", "trialPrice": 96}, {"currencyCode": "uPCdtLN6", "currencyNamespace": "qUpYZdiL", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1987-01-24T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1994-11-16T00:00:00Z", "discountedPrice": 65, "expireAt": "1983-12-05T00:00:00Z", "price": 73, "purchaseAt": "1995-02-20T00:00:00Z", "trialPrice": 98}], "NbocPvRF": [{"currencyCode": "tJNTjFgf", "currencyNamespace": "kwDnSv79", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1979-05-09T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1979-11-28T00:00:00Z", "discountedPrice": 13, "expireAt": "1982-11-13T00:00:00Z", "price": 5, "purchaseAt": "1995-04-22T00:00:00Z", "trialPrice": 23}, {"currencyCode": "unonahgT", "currencyNamespace": "3JyQTfn9", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1987-09-16T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1986-01-10T00:00:00Z", "discountedPrice": 70, "expireAt": "1978-11-14T00:00:00Z", "price": 6, "purchaseAt": "1989-03-01T00:00:00Z", "trialPrice": 56}, {"currencyCode": "zyBFmyNO", "currencyNamespace": "S0u1cxNS", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1983-06-10T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1993-09-14T00:00:00Z", "discountedPrice": 29, "expireAt": "1985-07-27T00:00:00Z", "price": 91, "purchaseAt": "1989-03-31T00:00:00Z", "trialPrice": 20}], "TmVCO1Vw": [{"currencyCode": "Jk80blfg", "currencyNamespace": "rxup5rhX", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1987-05-13T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1988-05-03T00:00:00Z", "discountedPrice": 19, "expireAt": "1989-01-23T00:00:00Z", "price": 100, "purchaseAt": "1988-11-18T00:00:00Z", "trialPrice": 22}, {"currencyCode": "IPagVeam", "currencyNamespace": "NKvPNqXu", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1983-07-20T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1980-01-27T00:00:00Z", "discountedPrice": 69, "expireAt": "1999-09-09T00:00:00Z", "price": 26, "purchaseAt": "1981-02-15T00:00:00Z", "trialPrice": 89}, {"currencyCode": "fbpBO7sk", "currencyNamespace": "J0hNFgHm", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1986-02-25T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1993-12-28T00:00:00Z", "discountedPrice": 34, "expireAt": "1998-08-03T00:00:00Z", "price": 88, "purchaseAt": "1976-10-19T00:00:00Z", "trialPrice": 40}]}}]}' \
    > test.out 2>&1
eval_tap $? 114 'BulkUpdateRegionData' test.out

#- 115 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '41' \
    --offset '16' \
    --sortBy 'LWv2SHbS' \
    --storeId 'yB0CSsXl' \
    --keyword 'W48S7YxJ' \
    --language 'xxoq3lkH' \
    > test.out 2>&1
eval_tap $? 115 'SearchItems' test.out

#- 116 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '14' \
    --offset '84' \
    --sortBy 'createdAt:desc,displayOrder,createdAt:asc' \
    --storeId 'bZ6KxVQL' \
    > test.out 2>&1
eval_tap $? 116 'QueryUncategorizedItems' test.out

#- 117 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '3ewHMvtL' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'udCIF3y2' \
    > test.out 2>&1
eval_tap $? 117 'GetItem' test.out

#- 118 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'lbGBP2NP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mzGVanRt' \
    --body '{"appId": "CLxS3oPW", "appType": "SOFTWARE", "baseAppId": "gvSOrCRv", "boothName": "pIa9pqc1", "categoryPath": "1JzG4fig", "clazz": "x59ohMLc", "displayOrder": 78, "entitlementType": "DURABLE", "ext": {"3tjWcjd7": {}, "N1xie7Jb": {}, "HpNfnbAc": {}}, "features": ["jss12xEG", "2U2LZWLp", "Z95x8A99"], "flexible": false, "images": [{"as": "dltOSBu6", "caption": "JuzQLtZy", "height": 63, "imageUrl": "n2VXeF4i", "smallImageUrl": "qEPH1YxN", "width": 56}, {"as": "g5hTkLon", "caption": "Xd7OfmOv", "height": 17, "imageUrl": "BTsJO543", "smallImageUrl": "0IRpRw4t", "width": 17}, {"as": "aMkim93q", "caption": "Mb7nvMac", "height": 85, "imageUrl": "dV2yCEW6", "smallImageUrl": "4uPZ9gay", "width": 38}], "itemIds": ["TUFNBm50", "I1kVnLXW", "gSepKw1U"], "itemQty": {"T7Qdh2Gb": 66, "nPbh4hcY": 70, "BuFIBJfX": 68}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"HabtiL7o": {"description": "Ek5fzfBX", "localExt": {"jeXMfeV9": {}, "rBH8NYnS": {}, "NMY2mv5u": {}}, "longDescription": "ou9mmExX", "title": "6XIXVUqq"}, "OByZq7aS": {"description": "18yPe6xd", "localExt": {"omwNmDq1": {}, "fx1HY0JF": {}, "SkEXnRUQ": {}}, "longDescription": "oghGRR91", "title": "4lqfhlMf"}, "iyGICPRy": {"description": "YCPVLXC2", "localExt": {"9uQblsEy": {}, "bF08fSXr": {}, "XMHVQKQf": {}}, "longDescription": "0pdsAD1r", "title": "6t8Z3F1R"}}, "lootBoxConfig": {"rewardCount": 67, "rewards": [{"lootBoxItems": [{"count": 24, "duration": 86, "endDate": "1999-06-07T00:00:00Z", "itemId": "FTFe9P0E", "itemSku": "EPOxwwYd", "itemType": "FCR2QWbd"}, {"count": 79, "duration": 61, "endDate": "1992-04-11T00:00:00Z", "itemId": "UKIeLmOM", "itemSku": "UcgFoLri", "itemType": "GbtGMBpj"}, {"count": 73, "duration": 98, "endDate": "1982-07-08T00:00:00Z", "itemId": "w5jq7yTq", "itemSku": "hcH3uCd6", "itemType": "SuU12MgJ"}], "name": "cas5mCaN", "odds": 0.9474872145451053, "type": "PROBABILITY_GROUP", "weight": 30}, {"lootBoxItems": [{"count": 58, "duration": 88, "endDate": "1996-05-10T00:00:00Z", "itemId": "NVzETYoW", "itemSku": "2UrVYHrC", "itemType": "dnCo9iCX"}, {"count": 5, "duration": 91, "endDate": "1989-04-22T00:00:00Z", "itemId": "z0adUWQN", "itemSku": "E86YaPTq", "itemType": "rt0stRLU"}, {"count": 40, "duration": 73, "endDate": "1978-02-28T00:00:00Z", "itemId": "EFMFynJY", "itemSku": "g4Bya9cX", "itemType": "8BbwkGP1"}], "name": "fVA9dE3A", "odds": 0.6560169359451127, "type": "PROBABILITY_GROUP", "weight": 29}, {"lootBoxItems": [{"count": 11, "duration": 44, "endDate": "1989-07-19T00:00:00Z", "itemId": "YGU3j8fJ", "itemSku": "yHsusLBK", "itemType": "oLJbPaBs"}, {"count": 33, "duration": 83, "endDate": "1978-09-02T00:00:00Z", "itemId": "G54UySG0", "itemSku": "FqRdcBFP", "itemType": "FzrUrohJ"}, {"count": 49, "duration": 18, "endDate": "1975-10-15T00:00:00Z", "itemId": "4OPxp5o7", "itemSku": "X0rl7sug", "itemType": "yRBOQPPo"}], "name": "c0XpYB5T", "odds": 0.9172494759332049, "type": "REWARD", "weight": 31}], "rollFunction": "CUSTOM"}, "maxCount": 23, "maxCountPerUser": 7, "name": "rYYTnIbe", "optionBoxConfig": {"boxItems": [{"count": 36, "duration": 24, "endDate": "1972-10-30T00:00:00Z", "itemId": "xEe41CnU", "itemSku": "P4yYag9v", "itemType": "ARXhHhFx"}, {"count": 100, "duration": 90, "endDate": "1971-02-28T00:00:00Z", "itemId": "6NkZqelp", "itemSku": "sePQvw8D", "itemType": "c0Vmyj41"}, {"count": 94, "duration": 23, "endDate": "1982-04-02T00:00:00Z", "itemId": "7xQFJUe0", "itemSku": "8TCeqnre", "itemType": "sYzjXOGc"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 53, "fixedTrialCycles": 9, "graceDays": 11}, "regionData": {"RfcMr6M5": [{"currencyCode": "Dr9dKGP3", "currencyNamespace": "PwxKPVCv", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1996-12-15T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1980-01-02T00:00:00Z", "expireAt": "1979-01-20T00:00:00Z", "price": 67, "purchaseAt": "1978-09-21T00:00:00Z", "trialPrice": 68}, {"currencyCode": "1LlU6sED", "currencyNamespace": "vwiviuOO", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1992-12-05T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1997-12-29T00:00:00Z", "expireAt": "1983-01-14T00:00:00Z", "price": 44, "purchaseAt": "1978-02-17T00:00:00Z", "trialPrice": 50}, {"currencyCode": "ljH5KJhf", "currencyNamespace": "jGUFjweg", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1986-07-30T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1971-02-12T00:00:00Z", "expireAt": "1973-08-08T00:00:00Z", "price": 6, "purchaseAt": "1972-01-27T00:00:00Z", "trialPrice": 21}], "HLjokXHu": [{"currencyCode": "vux1t77K", "currencyNamespace": "umk1mYeF", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1999-08-14T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1999-04-30T00:00:00Z", "expireAt": "1976-04-19T00:00:00Z", "price": 22, "purchaseAt": "1982-01-09T00:00:00Z", "trialPrice": 76}, {"currencyCode": "6c0tS08I", "currencyNamespace": "G3A80kIU", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1997-02-04T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1982-08-17T00:00:00Z", "expireAt": "1979-05-06T00:00:00Z", "price": 19, "purchaseAt": "1988-12-09T00:00:00Z", "trialPrice": 24}, {"currencyCode": "KTZtZc1w", "currencyNamespace": "cEwLKslR", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1998-05-03T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1973-04-17T00:00:00Z", "expireAt": "1983-10-27T00:00:00Z", "price": 4, "purchaseAt": "1985-10-09T00:00:00Z", "trialPrice": 48}], "dRPhBloY": [{"currencyCode": "E8byd8jx", "currencyNamespace": "wWur123J", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1988-04-11T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1977-04-15T00:00:00Z", "expireAt": "1978-04-16T00:00:00Z", "price": 7, "purchaseAt": "1980-03-16T00:00:00Z", "trialPrice": 21}, {"currencyCode": "LXIVTvDG", "currencyNamespace": "yCatTbyv", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1991-07-15T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1988-07-12T00:00:00Z", "expireAt": "1991-08-14T00:00:00Z", "price": 1, "purchaseAt": "1979-08-23T00:00:00Z", "trialPrice": 69}, {"currencyCode": "TDDGt12Y", "currencyNamespace": "fDFIzg6Y", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1972-02-20T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1993-04-02T00:00:00Z", "expireAt": "1988-12-25T00:00:00Z", "price": 42, "purchaseAt": "1992-01-12T00:00:00Z", "trialPrice": 4}]}, "saleConfig": {"currencyCode": "wVLilQY7", "price": 96}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "0ZrXjSm9", "stackable": true, "status": "ACTIVE", "tags": ["BOGp8PTZ", "If9ykzWg", "AEglTyMA"], "targetCurrencyCode": "WlHgup15", "targetNamespace": "rvPTyGuP", "thumbnailUrl": "m8fdsrIb", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 118 'UpdateItem' test.out

#- 119 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'nmrsdK59' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'vdBIaS1T' \
    > test.out 2>&1
eval_tap $? 119 'DeleteItem' test.out

#- 120 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'xefgdgpt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 88, "orderNo": "KXazcSSg"}' \
    > test.out 2>&1
eval_tap $? 120 'AcquireItem' test.out

#- 121 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'rnaIofLw' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sa2kOyAB' \
    > test.out 2>&1
eval_tap $? 121 'GetApp' test.out

#- 122 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'dpW3xYgJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1e5zqoW8' \
    --body '{"carousel": [{"alt": "3ibKYigI", "previewUrl": "h05maYZm", "thumbnailUrl": "XLN4zwYN", "type": "image", "url": "5TIUfVrF", "videoSource": "youtube"}, {"alt": "1TeguHaZ", "previewUrl": "LokdEaDM", "thumbnailUrl": "fJAF6ezP", "type": "image", "url": "HoXGdJJ8", "videoSource": "youtube"}, {"alt": "r9E2phIP", "previewUrl": "YB36GtY0", "thumbnailUrl": "FWQXNwi0", "type": "image", "url": "cG0Dygm8", "videoSource": "generic"}], "developer": "di1QlB4Z", "forumUrl": "BdKA3tdx", "genres": ["Sports", "Sports", "Adventure"], "localizations": {"2TWc3dkN": {"announcement": "CWqMjrVa", "slogan": "Nj2UdC5x"}, "FPsuPZY3": {"announcement": "m8afGlWY", "slogan": "SRxyGezZ"}, "FGB4cFq8": {"announcement": "2Owb1RE8", "slogan": "JFBD7esd"}}, "platformRequirements": {"6BsVYoxf": [{"additionals": "QQC8lVJH", "directXVersion": "5IzytOSV", "diskSpace": "FPmek4uE", "graphics": "4RVrWKsW", "label": "wlqOlmAn", "osVersion": "d9LMfRpY", "processor": "IxFvcZw5", "ram": "aNkZNnAA", "soundCard": "EFoNOTuO"}, {"additionals": "lpGDLU1u", "directXVersion": "MJgFsPue", "diskSpace": "GdkVknj2", "graphics": "OAR3vPTO", "label": "uNdVFkCe", "osVersion": "xQaDzBCC", "processor": "JBGQxygY", "ram": "tytGZ5HD", "soundCard": "vqHdKgGV"}, {"additionals": "uoQSKtck", "directXVersion": "r2sFjXcu", "diskSpace": "8cji7juz", "graphics": "8bGyPJb3", "label": "q61mlhCN", "osVersion": "GZByfP41", "processor": "2hIU4kTv", "ram": "WwoD2CKF", "soundCard": "6zHUNviI"}], "VgxlNhnZ": [{"additionals": "bC3MTIyf", "directXVersion": "22UirJQg", "diskSpace": "Y4WVa3EK", "graphics": "O9dcoROS", "label": "VCnlDM16", "osVersion": "t7sZm4DL", "processor": "GYPiotb5", "ram": "7DGWmrjD", "soundCard": "37qeaGi4"}, {"additionals": "bNlPvcxl", "directXVersion": "ekNqvxL8", "diskSpace": "lzTCIa2S", "graphics": "GlcfseVD", "label": "HiQWyeJF", "osVersion": "PAhZxN6l", "processor": "pMkNpO0D", "ram": "KP8wmItz", "soundCard": "L8rGlTwB"}, {"additionals": "dRmsYpXP", "directXVersion": "3YVW51xe", "diskSpace": "faVN1AM0", "graphics": "m6aT7v6R", "label": "pb34NeU6", "osVersion": "uM39dmoE", "processor": "nopX6PF4", "ram": "eRFdgev0", "soundCard": "H8VXKy1t"}], "6T4E4Ern": [{"additionals": "ZKKYsmjG", "directXVersion": "5dLrtzaA", "diskSpace": "Ubd1vWiM", "graphics": "QoIEnnxl", "label": "KRwzJ64a", "osVersion": "MouG7wJY", "processor": "DPnAgfkp", "ram": "6VYj6lzC", "soundCard": "shdXB5ZF"}, {"additionals": "kHehalJZ", "directXVersion": "bnyuOHue", "diskSpace": "6wIKttWB", "graphics": "5gk35G6A", "label": "XJ7f4pmT", "osVersion": "R0cIHwoO", "processor": "myDLBU7v", "ram": "oXAh69RQ", "soundCard": "JlayllVd"}, {"additionals": "y3Yi63zr", "directXVersion": "6m2EvGbu", "diskSpace": "6GwND6bC", "graphics": "8AhCKmin", "label": "kgdcBzj5", "osVersion": "roiagdmq", "processor": "sdKnqSsu", "ram": "KndOMVx5", "soundCard": "cAxI1GpF"}]}, "platforms": ["Android", "MacOS", "Android"], "players": ["CrossPlatformMulti", "LocalCoop", "CrossPlatformMulti"], "primaryGenre": "Racing", "publisher": "5ygpHVSC", "releaseDate": "1991-03-30T00:00:00Z", "websiteUrl": "FvCeWY7W"}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateApp' test.out

#- 123 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'OsrPHBvP' \
    --namespace "$AB_NAMESPACE" \
    --storeId '97REMlGz' \
    > test.out 2>&1
eval_tap $? 123 'DisableItem' test.out

#- 124 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'ShLado2w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 124 'GetItemDynamicData' test.out

#- 125 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'KrpFkDHA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BnKfpqfT' \
    > test.out 2>&1
eval_tap $? 125 'EnableItem' test.out

#- 126 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'hoJoliTF' \
    --itemId 'W4vfMTrO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IcGrhJ9K' \
    > test.out 2>&1
eval_tap $? 126 'FeatureItem' test.out

#- 127 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'LTLcgdCt' \
    --itemId 'KfaruE0j' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0lSyZRIl' \
    > test.out 2>&1
eval_tap $? 127 'DefeatureItem' test.out

#- 128 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'EBuBpbhQ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'p0aLBE9a' \
    --populateBundle  \
    --region 'gW8YC5R4' \
    --storeId 'ivvSdgeC' \
    > test.out 2>&1
eval_tap $? 128 'GetLocaleItem' test.out

#- 129 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '7H0dkbBf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cPWMvmaZ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 82, "comparison": "is", "name": "WnrTcZkQ", "predicateType": "EntitlementPredicate", "value": "mumvMJe4", "values": ["DhWUPANS", "dvwtuUk0", "9Mvp1djC"]}, {"anyOf": 54, "comparison": "isGreaterThan", "name": "Tw05qZ1X", "predicateType": "EntitlementPredicate", "value": "CK7gOkl8", "values": ["isixRf3k", "uoS5IrQ3", "05mnx974"]}, {"anyOf": 3, "comparison": "isNot", "name": "m467h5Jk", "predicateType": "EntitlementPredicate", "value": "J3F169Aw", "values": ["ZO2WhuAY", "XKaI0x3I", "joQs6ZR5"]}]}, {"operator": "and", "predicates": [{"anyOf": 73, "comparison": "includes", "name": "PxWbBmL1", "predicateType": "SeasonTierPredicate", "value": "6585G0Oq", "values": ["eDPDT1rj", "r82YJEDQ", "NEct2aPB"]}, {"anyOf": 77, "comparison": "isNot", "name": "OicmZOUH", "predicateType": "SeasonPassPredicate", "value": "cLZchcRD", "values": ["GZyKTsiY", "GTMBdhOg", "hPZHFLXt"]}, {"anyOf": 46, "comparison": "isLessThan", "name": "AK4evkmQ", "predicateType": "SeasonTierPredicate", "value": "aFFG8ln8", "values": ["bmPEIGDd", "0pKxqzHU", "x46kiLbR"]}]}, {"operator": "and", "predicates": [{"anyOf": 53, "comparison": "is", "name": "W4qrtpIn", "predicateType": "EntitlementPredicate", "value": "M8a8DE2s", "values": ["LhXLRY7T", "ZktfbJJ3", "MU95GI2U"]}, {"anyOf": 17, "comparison": "isGreaterThan", "name": "gYATNGpk", "predicateType": "SeasonTierPredicate", "value": "qmjEt4k9", "values": ["Tq7DF1zn", "IjPkPtbW", "2hlttW9v"]}, {"anyOf": 16, "comparison": "isGreaterThan", "name": "jMZFseFs", "predicateType": "EntitlementPredicate", "value": "3b2w7ubw", "values": ["49gvJ2hV", "mFVh45Jt", "RtnioBqH"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItemPurchaseCondition' test.out

#- 130 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'cwwKiXqj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "DPNV9gzN"}' \
    > test.out 2>&1
eval_tap $? 130 'ReturnItem' test.out

#- 131 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --name 'Dt8yJIga' \
    --offset '5' \
    --tag 'z6CNspze' \
    > test.out 2>&1
eval_tap $? 131 'QueryKeyGroups' test.out

#- 132 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "79X1OBuG", "name": "wS3Q1hja", "status": "ACTIVE", "tags": ["vAAlCejI", "jcb0t0qo", "8Fjmy44m"]}' \
    > test.out 2>&1
eval_tap $? 132 'CreateKeyGroup' test.out

#- 133 GetKeyGroupByBoothName
eval_tap 0 133 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 134 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'VmTlcyug' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'GetKeyGroup' test.out

#- 135 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'JDVBWUWR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "DBZoOht2", "name": "up82TPF1", "status": "ACTIVE", "tags": ["uaJA4OV2", "eQ8LruFX", "a9y1zEBl"]}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateKeyGroup' test.out

#- 136 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '70ySlxKT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroupDynamic' test.out

#- 137 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'Bx4xbjji' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '11' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 137 'ListKeys' test.out

#- 138 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'WEd72oqH' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'UploadKeys' test.out

#- 139 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'qBmAQpRh' \
    --limit '59' \
    --offset '61' \
    --orderNos 'LmSEQ6sw,bmpCV3Ko,EZ1SjpvR' \
    --sortBy 'dlFnWry8' \
    --startTime 'GmKGQc3V' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 139 'QueryOrders' test.out

#- 140 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetOrderStatistics' test.out

#- 141 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dWyqYjBr' \
    > test.out 2>&1
eval_tap $? 141 'GetOrder' test.out

#- 142 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yOLnraiP' \
    --body '{"description": "YVhpzKkV"}' \
    > test.out 2>&1
eval_tap $? 142 'RefundOrder' test.out

#- 143 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'GetPaymentCallbackConfig' test.out

#- 144 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "rl0ypj9V", "privateKey": "nkg0fbJw"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdatePaymentCallbackConfig' test.out

#- 145 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'CtCkk8ZI' \
    --externalId 'N9E9XdYD' \
    --limit '30' \
    --notificationSource 'WXPAY' \
    --notificationType 'OUzdhqky' \
    --offset '13' \
    --paymentOrderNo 'BeQebgfG' \
    --startDate 'e0uVePAx' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 145 'QueryPaymentNotifications' test.out

#- 146 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'sgYVjuP6' \
    --limit '68' \
    --offset '83' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 146 'QueryPaymentOrders' test.out

#- 147 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "qC0ThU9g", "currencyNamespace": "88Gosn2o", "customParameters": {"kCwQowrf": {}, "QugocYnd": {}, "4Dl4OoLZ": {}}, "description": "wmIITbSn", "extOrderNo": "5bkC2sBA", "extUserId": "tzKWlsG9", "itemType": "CODE", "language": "xtL-JaPz_mM", "metadata": {"P7Wo9Xza": "NDF3lpSh", "BbEBV9CD": "mVD3WnLf", "Lf7RV61z": "sEDZY8zE"}, "notifyUrl": "PsdsbnV8", "omitNotification": true, "platform": "dzmXartE", "price": 23, "recurringPaymentOrderNo": "Ilx2gVah", "region": "P39WsGFD", "returnUrl": "h2TPnClH", "sandbox": true, "sku": "rnM4fB7i", "subscriptionId": "Wo9TGpMm", "targetNamespace": "wwB6FBRP", "targetUserId": "mwktL1A9", "title": "gah5SXjK"}' \
    > test.out 2>&1
eval_tap $? 147 'CreatePaymentOrderByDedicated' test.out

#- 148 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'xZk4pj4R' \
    > test.out 2>&1
eval_tap $? 148 'ListExtOrderNoByExtTxId' test.out

#- 149 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'S33rkszm' \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentOrder' test.out

#- 150 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kzNEzOqT' \
    --body '{"extTxId": "YAVwWdy6", "paymentMethod": "ReFalRoY", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 150 'ChargePaymentOrder' test.out

#- 151 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'urDkLlp1' \
    --body '{"description": "1bXTj6dd"}' \
    > test.out 2>&1
eval_tap $? 151 'RefundPaymentOrderByDedicated' test.out

#- 152 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AK67sQal' \
    --body '{"amount": 81, "currencyCode": "Hz39x3lY", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 33, "vat": 81}' \
    > test.out 2>&1
eval_tap $? 152 'SimulatePaymentOrderNotification' test.out

#- 153 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'F5H149Gb' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrderChargeStatus' test.out

#- 154 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 154 'GetPlatformWalletConfig' test.out

#- 155 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    --body '{"allowedBalanceOrigins": ["Twitch", "Nintendo", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePlatformWalletConfig' test.out

#- 156 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 156 'ResetPlatformWalletConfig' test.out

#- 157 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetRevocationConfig' test.out

#- 158 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 158 'UpdateRevocationConfig' test.out

#- 159 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'DeleteRevocationConfig' test.out

#- 160 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'j7y2gb9K' \
    --limit '99' \
    --offset '75' \
    --source 'OTHER' \
    --startTime 'E2v9s2dy' \
    --status 'FAIL' \
    --transactionId 'mBmtpipF' \
    --userId 'Bc8WQagg' \
    > test.out 2>&1
eval_tap $? 160 'QueryRevocationHistories' test.out

#- 161 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetRevocationPluginConfig' test.out

#- 162 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "LjX38uXT"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "NCMNK3IQ"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateRevocationPluginConfig' test.out

#- 163 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeleteRevocationPluginConfig' test.out

#- 164 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 164 'UploadRevocationPluginConfigCert' test.out

#- 165 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "QhLNqceY", "eventTopic": "aBp4EnDa", "maxAwarded": 52, "maxAwardedPerUser": 20, "namespaceExpression": "GGKfe2wZ", "rewardCode": "uVmOdJfc", "rewardConditions": [{"condition": "pcE3Us1o", "conditionName": "6yJNTv1m", "eventName": "0BeGyNrW", "rewardItems": [{"duration": 73, "endDate": "1995-05-09T00:00:00Z", "itemId": "VGTXyaj1", "quantity": 50}, {"duration": 6, "endDate": "1976-06-15T00:00:00Z", "itemId": "HDkXRJzs", "quantity": 33}, {"duration": 79, "endDate": "1982-02-26T00:00:00Z", "itemId": "Rv1iqxpQ", "quantity": 89}]}, {"condition": "3D7pC5m4", "conditionName": "DsoRoBV5", "eventName": "UrP5U4dC", "rewardItems": [{"duration": 22, "endDate": "1989-08-24T00:00:00Z", "itemId": "TPpWA30U", "quantity": 6}, {"duration": 82, "endDate": "1998-07-21T00:00:00Z", "itemId": "pKxcE7Y8", "quantity": 15}, {"duration": 17, "endDate": "1982-05-12T00:00:00Z", "itemId": "vIAwxrsh", "quantity": 12}]}, {"condition": "18djt0Yk", "conditionName": "9IGQ3iTn", "eventName": "IRPwOizT", "rewardItems": [{"duration": 65, "endDate": "1972-09-18T00:00:00Z", "itemId": "3aF9jmlW", "quantity": 25}, {"duration": 70, "endDate": "1974-01-30T00:00:00Z", "itemId": "3az0VyUk", "quantity": 5}, {"duration": 4, "endDate": "1994-05-29T00:00:00Z", "itemId": "ZoY9fjme", "quantity": 32}]}], "userIdExpression": "UPvAzS9b"}' \
    > test.out 2>&1
eval_tap $? 165 'CreateReward' test.out

#- 166 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '8IBea4Tc' \
    --limit '70' \
    --offset '47' \
    --sortBy 'rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 166 'QueryRewards' test.out

#- 167 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'ExportRewards' test.out

#- 168 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 168 'ImportRewards' test.out

#- 169 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'xyGQijJy' \
    > test.out 2>&1
eval_tap $? 169 'GetReward' test.out

#- 170 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'GvGZx722' \
    --body '{"description": "RwQWnwho", "eventTopic": "lpDk7ihJ", "maxAwarded": 84, "maxAwardedPerUser": 79, "namespaceExpression": "DwmAgb3k", "rewardCode": "gd8Lous6", "rewardConditions": [{"condition": "gRP20RH4", "conditionName": "2vnkFvva", "eventName": "i0eypIsw", "rewardItems": [{"duration": 86, "endDate": "1978-08-28T00:00:00Z", "itemId": "RchIg1ff", "quantity": 9}, {"duration": 3, "endDate": "1990-07-10T00:00:00Z", "itemId": "3mZILM6u", "quantity": 100}, {"duration": 77, "endDate": "1974-04-25T00:00:00Z", "itemId": "ubGLOKTc", "quantity": 71}]}, {"condition": "h0zVUIc5", "conditionName": "lIvswP59", "eventName": "28VrEfLl", "rewardItems": [{"duration": 49, "endDate": "1999-03-20T00:00:00Z", "itemId": "lqvDagqT", "quantity": 51}, {"duration": 47, "endDate": "1992-10-27T00:00:00Z", "itemId": "vw0VKmou", "quantity": 85}, {"duration": 4, "endDate": "1991-02-03T00:00:00Z", "itemId": "eMRPip3q", "quantity": 48}]}, {"condition": "C15bzeIx", "conditionName": "z1tAYdfU", "eventName": "3g16wj2v", "rewardItems": [{"duration": 94, "endDate": "1998-11-25T00:00:00Z", "itemId": "F1Sg9duD", "quantity": 2}, {"duration": 100, "endDate": "1983-02-10T00:00:00Z", "itemId": "X5hz5Uia", "quantity": 42}, {"duration": 26, "endDate": "1997-08-02T00:00:00Z", "itemId": "d7oSr6i1", "quantity": 100}]}], "userIdExpression": "Hk6nXYSR"}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateReward' test.out

#- 171 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YwBpJjFJ' \
    > test.out 2>&1
eval_tap $? 171 'DeleteReward' test.out

#- 172 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZCscBT05' \
    --body '{"payload": {"NWxacIkF": {}, "ak1WBqqY": {}, "UoMOyZnQ": {}}}' \
    > test.out 2>&1
eval_tap $? 172 'CheckEventCondition' test.out

#- 173 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sU09wwuJ' \
    --body '{"conditionName": "2BoxcCrC", "userId": "4dVm0rJV"}' \
    > test.out 2>&1
eval_tap $? 173 'DeleteRewardConditionRecord' test.out

#- 174 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'MkWHZPxP' \
    --limit '23' \
    --offset '30' \
    --start 'rGRxhmst' \
    --storeId 'GQjV15Wq' \
    --viewId 'uT5c8Bqa' \
    > test.out 2>&1
eval_tap $? 174 'QuerySections' test.out

#- 175 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SzqUSFnV' \
    --body '{"active": false, "displayOrder": 66, "endDate": "1988-05-22T00:00:00Z", "ext": {"IrG1U1YL": {}, "cpi7apXF": {}, "dfQkV3Wp": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 57, "itemCount": 25, "rule": "SEQUENCE"}, "items": [{"id": "YZkXrQlg", "sku": "z1iLxYai"}, {"id": "7gIfcfN1", "sku": "pZ5m42Ex"}, {"id": "r1S0bzfp", "sku": "7gtL2Wq3"}], "localizations": {"kQbIQErm": {"description": "5GBySy89", "localExt": {"KcNFQ3ZA": {}, "zxfSpGNl": {}, "JEgbTrdB": {}}, "longDescription": "PRL5lORR", "title": "AGbR9kFa"}, "gWEWS0IB": {"description": "lvgtSO9r", "localExt": {"wZyYGdIZ": {}, "2wnFqfCk": {}, "9fWTh3YH": {}}, "longDescription": "UhQhHHmV", "title": "ORVk4DZf"}, "7OL4JEq0": {"description": "4MP2Pwov", "localExt": {"EB1pX8wX": {}, "e52qo82T": {}, "vhWMF8Bl": {}}, "longDescription": "zRb7Pdz4", "title": "y8wQK38X"}}, "name": "GEiQDDtp", "rotationType": "NONE", "startDate": "1999-01-09T00:00:00Z", "viewId": "SM2d44PP"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateSection' test.out

#- 176 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pxXXX2Gj' \
    > test.out 2>&1
eval_tap $? 176 'PurgeExpiredSection' test.out

#- 177 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'z9MjOa4J' \
    --storeId 'PRAs8JR4' \
    > test.out 2>&1
eval_tap $? 177 'GetSection' test.out

#- 178 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '6sTQScMf' \
    --storeId 'sznIKk1H' \
    --body '{"active": true, "displayOrder": 19, "endDate": "1973-02-28T00:00:00Z", "ext": {"aig8xsVe": {}, "X1iJ9wBH": {}, "lUFYLKye": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 35, "itemCount": 26, "rule": "SEQUENCE"}, "items": [{"id": "GwBzX3gS", "sku": "dwbcHbKA"}, {"id": "sHdGXWeR", "sku": "nW7cOOqe"}, {"id": "BPIkkEj7", "sku": "lG0VpOJT"}], "localizations": {"vcCpNsxL": {"description": "RW0BTrqI", "localExt": {"VbqZjDEr": {}, "eMGLHFnF": {}, "ECeHzIhF": {}}, "longDescription": "nKjYRA0R", "title": "nys2j5Wi"}, "W9O7DvDP": {"description": "2shzuYNV", "localExt": {"CwDlCSAb": {}, "5IoRK8HJ": {}, "8j9862hm": {}}, "longDescription": "gfgFlJJ1", "title": "60UboaB1"}, "WeUnBIgN": {"description": "vE9u00tC", "localExt": {"JcJJruOn": {}, "QfrnFTBv": {}, "hxczBf5B": {}}, "longDescription": "Q90VZMjY", "title": "tWWTb6hv"}}, "name": "T7oIlEny", "rotationType": "CUSTOM", "startDate": "1991-12-04T00:00:00Z", "viewId": "Pk56d6lb"}' \
    > test.out 2>&1
eval_tap $? 178 'UpdateSection' test.out

#- 179 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '9bReD4cN' \
    --storeId 'jepzbRUC' \
    > test.out 2>&1
eval_tap $? 179 'DeleteSection' test.out

#- 180 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'ListStores' test.out

#- 181 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "7y0pfPNg", "defaultRegion": "gHsE8Q19", "description": "omoDGkvZ", "supportedLanguages": ["UK46jU33", "rAXRo3k6", "8raLylzj"], "supportedRegions": ["g6XwQaqt", "fpozYfbx", "N4niPovl"], "title": "zzDGtqkG"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateStore' test.out

#- 182 ImportStore
eval_tap 0 182 'ImportStore # SKIP deprecated' test.out

#- 183 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'GetPublishedStore' test.out

#- 184 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'DeletePublishedStore' test.out

#- 185 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 185 'GetPublishedStoreBackup' test.out

#- 186 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'RollbackPublishedStore' test.out

#- 187 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rmgT9tfJ' \
    > test.out 2>&1
eval_tap $? 187 'GetStore' test.out

#- 188 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Iy572BcX' \
    --body '{"defaultLanguage": "0zaPOk3G", "defaultRegion": "cJVabk1o", "description": "v0mIcugK", "supportedLanguages": ["vprEswi0", "Vm7BDxmY", "saxjlN7L"], "supportedRegions": ["hO4dxaXa", "txIwqjDK", "vUbWKbvL"], "title": "9HqJZpql"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateStore' test.out

#- 189 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gw2WMqbS' \
    > test.out 2>&1
eval_tap $? 189 'DeleteStore' test.out

#- 190 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'euZtL5b1' \
    --action 'UPDATE' \
    --itemSku 'ZPlOcCzs' \
    --itemType 'MEDIA' \
    --limit '61' \
    --offset '62' \
    --selected  \
    --sortBy 'createdAt:desc,updatedAt:desc,updatedAt' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'JpQuiqx4' \
    --updatedAtStart 'QJHno4Gi' \
    > test.out 2>&1
eval_tap $? 190 'QueryChanges' test.out

#- 191 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q6QmRRtz' \
    > test.out 2>&1
eval_tap $? 191 'PublishAll' test.out

#- 192 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'goxHhtSM' \
    > test.out 2>&1
eval_tap $? 192 'PublishSelected' test.out

#- 193 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ROULjtJH' \
    > test.out 2>&1
eval_tap $? 193 'SelectAllRecords' test.out

#- 194 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '0tCVaSzR' \
    --action 'DELETE' \
    --itemSku 'HFyCqKoR' \
    --itemType 'APP' \
    --type 'CATEGORY' \
    --updatedAtEnd 'nRFSskyw' \
    --updatedAtStart 'qnizIAEE' \
    > test.out 2>&1
eval_tap $? 194 'GetStatistic' test.out

#- 195 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L9JRjZVX' \
    > test.out 2>&1
eval_tap $? 195 'UnselectAllRecords' test.out

#- 196 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'iiKee4Tx' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2uOLSyNC' \
    > test.out 2>&1
eval_tap $? 196 'SelectRecord' test.out

#- 197 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'O418MvQY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kLvzo14T' \
    > test.out 2>&1
eval_tap $? 197 'UnselectRecord' test.out

#- 198 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6ltHXqcl' \
    --targetStoreId '7PaTrFZq' \
    > test.out 2>&1
eval_tap $? 198 'CloneStore' test.out

#- 199 ExportStore
eval_tap 0 199 'ExportStore # SKIP deprecated' test.out

#- 200 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'cYvWlgGo' \
    --limit '7' \
    --offset '9' \
    --sku 'KOb0Yrol' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'uJWueCC4' \
    > test.out 2>&1
eval_tap $? 200 'QuerySubscriptions' test.out

#- 201 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8AhfovQe' \
    > test.out 2>&1
eval_tap $? 201 'RecurringChargeSubscription' test.out

#- 202 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'iRLTnOq0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 202 'GetTicketDynamic' test.out

#- 203 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'RFU4D2ET' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "sa9ib9OV"}' \
    > test.out 2>&1
eval_tap $? 203 'DecreaseTicketSale' test.out

#- 204 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Sk00yCnS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'GetTicketBoothID' test.out

#- 205 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'WYQyF1Yb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 47, "orderNo": "oRTGiIJO"}' \
    > test.out 2>&1
eval_tap $? 205 'IncreaseTicketSale' test.out

#- 206 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'htVcrz94' \
    --body '{"achievements": [{"id": "GOhdpLXL", "value": 18}, {"id": "GfBKcIry", "value": 76}, {"id": "erjjbVrl", "value": 94}], "steamUserId": "GEQ9cxcz"}' \
    > test.out 2>&1
eval_tap $? 206 'UnlockSteamUserAchievement' test.out

#- 207 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YeNghVkp' \
    --xboxUserId 'Q5WeBWyy' \
    > test.out 2>&1
eval_tap $? 207 'GetXblUserAchievements' test.out

#- 208 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqjtnYaK' \
    --body '{"achievements": [{"id": "Ej3FeWMI", "percentComplete": 10}, {"id": "UlKRtOqR", "percentComplete": 18}, {"id": "RnyKjVST", "percentComplete": 38}], "serviceConfigId": "554RVDth", "titleId": "THIY23FJ", "xboxUserId": "vQzRfa5Z"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateXblUserAchievement' test.out

#- 209 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zu1RpM7k' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizeCampaign' test.out

#- 210 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'EKCiSrYs' \
    > test.out 2>&1
eval_tap $? 210 'AnonymizeEntitlement' test.out

#- 211 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJOo8k8E' \
    > test.out 2>&1
eval_tap $? 211 'AnonymizeFulfillment' test.out

#- 212 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'tiL5COYp' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizeIntegration' test.out

#- 213 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'SClUC2Zv' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizeOrder' test.out

#- 214 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'xfqW7weI' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizePayment' test.out

#- 215 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'zO7B0Mno' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeRevocation' test.out

#- 216 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'JgzDVUDx' \
    > test.out 2>&1
eval_tap $? 216 'AnonymizeSubscription' test.out

#- 217 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8R9U67Y' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeWallet' test.out

#- 218 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMAG7esN' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 218 'GetUserDLCByPlatform' test.out

#- 219 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'LHUG1GAC' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 219 'GetUserDLC' test.out

#- 220 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zuT62JiU' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'RBhYX4ps' \
    --features 'J5AUkRmK,x7R0sMR9,yofpV5Ys' \
    --itemId 'hTCmAqkq,uaNzYkuJ,ZV0DAamT' \
    --limit '63' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserEntitlements' test.out

#- 221 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yss1i0eT' \
    --body '[{"endDate": "1981-06-12T00:00:00Z", "grantedCode": "pTEycWNE", "itemId": "PfNm5mLp", "itemNamespace": "LVDBJWXi", "language": "mzQ-rEVC-847", "quantity": 73, "region": "u4pqlFEV", "source": "IAP", "startDate": "1980-11-07T00:00:00Z", "storeId": "AHi39JRu"}, {"endDate": "1992-12-14T00:00:00Z", "grantedCode": "pdZykdMp", "itemId": "YzMIjfnn", "itemNamespace": "Asg25FrC", "language": "HHRQ", "quantity": 25, "region": "xlXN9Gvz", "source": "REFERRAL_BONUS", "startDate": "1980-06-14T00:00:00Z", "storeId": "G63fQYba"}, {"endDate": "1991-03-12T00:00:00Z", "grantedCode": "Ond6Cy1N", "itemId": "vVEjuv40", "itemNamespace": "gQaiXlgg", "language": "Qj", "quantity": 57, "region": "nIiTY3a1", "source": "OTHER", "startDate": "1981-05-25T00:00:00Z", "storeId": "Q0hrp6bl"}]' \
    > test.out 2>&1
eval_tap $? 221 'GrantUserEntitlement' test.out

#- 222 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '0YXBORIA' \
    --activeOnly  \
    --appId 'hZHf1i6E' \
    > test.out 2>&1
eval_tap $? 222 'GetUserAppEntitlementByAppId' test.out

#- 223 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'A1NFfwDY' \
    --activeOnly  \
    --limit '65' \
    --offset '56' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 223 'QueryUserEntitlementsByAppType' test.out

#- 224 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SFQDmFsi' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'UEBA8ba0' \
    > test.out 2>&1
eval_tap $? 224 'GetUserEntitlementByItemId' test.out

#- 225 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ucG8wSaJ' \
    --ids '9DSRuqmy,e9fuSbab,2x9yC2WY' \
    > test.out 2>&1
eval_tap $? 225 'GetUserActiveEntitlementsByItemIds' test.out

#- 226 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gSv7HkFT' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'zDIYRFeJ' \
    > test.out 2>&1
eval_tap $? 226 'GetUserEntitlementBySku' test.out

#- 227 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MTAKIHuE' \
    --appIds 'gZDuX82x,oubIVpwG,y97y8Smj' \
    --itemIds 'pYh9zUtp,fR93Cal6,i0RhGKjY' \
    --skus '3vOI70w0,w1DVzOEZ,5QeHo93t' \
    > test.out 2>&1
eval_tap $? 227 'ExistsAnyUserActiveEntitlement' test.out

#- 228 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QMnp7uLm' \
    --itemIds 'SQFURd4h,cFVTxkaU,iXfFxAzX' \
    > test.out 2>&1
eval_tap $? 228 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 229 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2JWRrCx' \
    --appId 'AlUjYfKB' \
    > test.out 2>&1
eval_tap $? 229 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 230 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'EzwVZpSG' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '5sBwh6Le' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlementOwnershipByItemId' test.out

#- 231 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'br2sijeF' \
    --ids 'OyKkIq0a,DJZFdD2o,NPp1jAZh' \
    > test.out 2>&1
eval_tap $? 231 'GetUserEntitlementOwnershipByItemIds' test.out

#- 232 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '9iGLxaIm' \
    --entitlementClazz 'APP' \
    --sku 'bvaW5NnQ' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementOwnershipBySku' test.out

#- 233 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ko3yPI8B' \
    > test.out 2>&1
eval_tap $? 233 'RevokeAllEntitlements' test.out

#- 234 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'VK3GcI9G' \
    --entitlementIds 'mstxqLsf' \
    > test.out 2>&1
eval_tap $? 234 'RevokeUserEntitlements' test.out

#- 235 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'fHpXcaSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHay4YP6' \
    > test.out 2>&1
eval_tap $? 235 'GetUserEntitlement' test.out

#- 236 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'zS6n3hBj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxqUkwWY' \
    --body '{"endDate": "1979-07-04T00:00:00Z", "nullFieldList": ["S0MlMB9E", "IVrjJPPY", "BqxwXLgh"], "startDate": "1985-09-03T00:00:00Z", "status": "SOLD", "useCount": 7}' \
    > test.out 2>&1
eval_tap $? 236 'UpdateUserEntitlement' test.out

#- 237 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '80I50LRn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHuY0qDx' \
    --body '{"options": ["xj4vHWv7", "BIaZOZwS", "g1ECS9WL"], "requestId": "LVzjgKt7", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 237 'ConsumeUserEntitlement' test.out

#- 238 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'yd1IWPRQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 't2GxOglS' \
    > test.out 2>&1
eval_tap $? 238 'DisableUserEntitlement' test.out

#- 239 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'wKzjyaWs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TTCNRfes' \
    > test.out 2>&1
eval_tap $? 239 'EnableUserEntitlement' test.out

#- 240 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'sBl5lgpV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWi6V0Oh' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementHistories' test.out

#- 241 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '6PXXmr8r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWhPa6Au' \
    > test.out 2>&1
eval_tap $? 241 'RevokeUserEntitlement' test.out

#- 242 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'Sxii5Qqj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yHkTiosc' \
    --body '{"reason": "XEaOoxGm", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUseCount' test.out

#- 243 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'g4N55qwY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWVkAaFC' \
    --body '{"requestId": "w9SXxoFw", "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 243 'SellUserEntitlement' test.out

#- 244 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0b9e2vC' \
    --body '{"duration": 67, "endDate": "1978-04-13T00:00:00Z", "itemId": "Busj3OXX", "itemSku": "NF9RqlNT", "language": "yZcj11Wr", "metadata": {"MiktN1UQ": {}, "x6webb9B": {}, "28smkdcr": {}}, "order": {"currency": {"currencyCode": "VN2VEgJ3", "currencySymbol": "0A8vQUq2", "currencyType": "REAL", "decimals": 27, "namespace": "tEF40ogj"}, "ext": {"UZQv9dKI": {}, "lVeJt89M": {}, "SnpxNGas": {}}, "free": false}, "orderNo": "3nwctjs4", "origin": "Steam", "overrideBundleItemQty": {"QQjLRfOZ": 36, "WjtB7pmm": 44, "21O73UE5": 71}, "quantity": 59, "region": "QfZfbo33", "source": "REDEEM_CODE", "startDate": "1993-04-19T00:00:00Z", "storeId": "FtdOsRPc"}' \
    > test.out 2>&1
eval_tap $? 244 'FulfillItem' test.out

#- 245 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'LsOEby7F' \
    --body '{"code": "x0m6vaFR", "language": "xe_LjWt", "region": "DsiAXrmS"}' \
    > test.out 2>&1
eval_tap $? 245 'RedeemCode' test.out

#- 246 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'YLWTnXcI' \
    --body '{"metadata": {"KkGrmjl6": {}, "sC2qRIF2": {}, "PWUBMYsq": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "ayccbjoB", "namespace": "I9eZwfDe"}, "item": {"itemId": "VVDIoIIZ", "itemSku": "MxX6hwTx", "itemType": "8ZmVzhyz"}, "quantity": 29, "type": "CURRENCY"}, {"currency": {"currencyCode": "AkF7JbgW", "namespace": "jP5Ez8bZ"}, "item": {"itemId": "m6A82GRy", "itemSku": "tfYoem7w", "itemType": "IVsr8Rzv"}, "quantity": 63, "type": "CURRENCY"}, {"currency": {"currencyCode": "fd8Jl1SL", "namespace": "SwaVxwZX"}, "item": {"itemId": "O9Vqs0n6", "itemSku": "6vzWeyCD", "itemType": "2jjTJPYM"}, "quantity": 3, "type": "CURRENCY"}], "source": "PAYMENT", "transactionId": "3Prvdxwi"}' \
    > test.out 2>&1
eval_tap $? 246 'FulfillRewards' test.out

#- 247 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bLmDnagg' \
    --endTime 'BnWwdfVu' \
    --limit '85' \
    --offset '65' \
    --productId 'gb4ueCFk' \
    --startTime '2JeVOksk' \
    --status 'FULFILLED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserIAPOrders' test.out

#- 248 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZOLVuST' \
    > test.out 2>&1
eval_tap $? 248 'QueryAllUserIAPOrders' test.out

#- 249 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXAV6squ' \
    --endTime 'E6OsPu69' \
    --limit '27' \
    --offset '10' \
    --startTime 'ITAZTcGu' \
    --status 'SUCCESS' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserIAPConsumeHistory' test.out

#- 250 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'i4a7kR7I' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "HkMr-sMwx", "productId": "NFmBP1pe", "region": "iOV3EkQE", "transactionId": "LNzzo7f8", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 250 'MockFulfillIAPItem' test.out

#- 251 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'QRW2aNpm' \
    --itemId 'zxcKMixQ' \
    --limit '93' \
    --offset '100' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 251 'QueryUserOrders' test.out

#- 252 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9fXZSVuj' \
    --body '{"currencyCode": "bffeW98h", "currencyNamespace": "mnO2u1g6", "discountedPrice": 51, "ext": {"Hj0dHQUH": {}, "dAnfkPvf": {}, "KKt1wdz6": {}}, "itemId": "3SgTa8PE", "language": "ctTCpezi", "options": {"skipPriceValidation": true}, "platform": "Oculus", "price": 35, "quantity": 94, "region": "o29sKQXO", "returnUrl": "CegbW9OV", "sandbox": true, "sectionId": "TdzinhmS"}' \
    > test.out 2>&1
eval_tap $? 252 'AdminCreateUserOrder' test.out

#- 253 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ij88hK2H' \
    --itemId 'PM2K6zJw' \
    > test.out 2>&1
eval_tap $? 253 'CountOfPurchasedItem' test.out

#- 254 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'h5LDhbI1' \
    --userId 'ZraJsaLS' \
    > test.out 2>&1
eval_tap $? 254 'GetUserOrder' test.out

#- 255 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZBcmUkQr' \
    --userId 'wtLnQDBf' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "QDOIyLZ3"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserOrderStatus' test.out

#- 256 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Dy4p6XNv' \
    --userId 'svYOxJkA' \
    > test.out 2>&1
eval_tap $? 256 'FulfillUserOrder' test.out

#- 257 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gAZeOlst' \
    --userId '23Yaxzxc' \
    > test.out 2>&1
eval_tap $? 257 'GetUserOrderGrant' test.out

#- 258 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nJraei5P' \
    --userId 'o6qn9qxY' \
    > test.out 2>&1
eval_tap $? 258 'GetUserOrderHistories' test.out

#- 259 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GQKhULhU' \
    --userId 'MzWXVBC9' \
    --body '{"additionalData": {"cardSummary": "bPiVVyiQ"}, "authorisedTime": "1984-07-13T00:00:00Z", "chargebackReversedTime": "1994-06-11T00:00:00Z", "chargebackTime": "1973-03-14T00:00:00Z", "chargedTime": "1988-08-11T00:00:00Z", "createdTime": "1975-09-04T00:00:00Z", "currency": {"currencyCode": "iHWmmP69", "currencySymbol": "IodGg6M8", "currencyType": "VIRTUAL", "decimals": 92, "namespace": "cFZrpP1T"}, "customParameters": {"ycIcGraz": {}, "a2xfTOlf": {}, "Ys618M0J": {}}, "extOrderNo": "YS4M6xvx", "extTxId": "SHfq0xIO", "extUserId": "RqQogD5t", "issuedAt": "1971-03-15T00:00:00Z", "metadata": {"4WEdIpqP": "e3UV0HZI", "gcJICqTc": "XmSc2E3q", "QCBgUBAL": "PFygg1zh"}, "namespace": "6WBsUi8N", "nonceStr": "x2sLlsi1", "paymentMethod": "UmqjaDhP", "paymentMethodFee": 41, "paymentOrderNo": "2a64QyMk", "paymentProvider": "ADYEN", "paymentProviderFee": 35, "paymentStationUrl": "xCpqhVxq", "price": 9, "refundedTime": "1980-05-01T00:00:00Z", "salesTax": 46, "sandbox": true, "sku": "QOz4zG82", "status": "DELETED", "statusReason": "Q3jaHoE5", "subscriptionId": "gkQAReMj", "subtotalPrice": 64, "targetNamespace": "TAnnkGMB", "targetUserId": "rmaykHtP", "tax": 42, "totalPrice": 57, "totalTax": 19, "txEndTime": "1975-11-26T00:00:00Z", "type": "LvqKxTgL", "userId": "1OrTwNj7", "vat": 80}' \
    > test.out 2>&1
eval_tap $? 259 'ProcessUserOrderNotification' test.out

#- 260 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BYu4w7Av' \
    --userId 'VgFX6epV' \
    > test.out 2>&1
eval_tap $? 260 'DownloadUserOrderReceipt' test.out

#- 261 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ISh5DH4f' \
    --body '{"currencyCode": "JiWblExR", "currencyNamespace": "ZTyE0YrD", "customParameters": {"MgwSS4dp": {}, "VwvEQdnE": {}, "0OLvQlkF": {}}, "description": "vPvnFfQH", "extOrderNo": "dqCNQ7hd", "extUserId": "vVgHJMj7", "itemType": "SEASON", "language": "Csk-LG", "metadata": {"2yAqRnZd": "0ahcWTOD", "bCxql2zN": "7g89c07y", "13bjnbui": "LH5H76hF"}, "notifyUrl": "8bpvx5d4", "omitNotification": true, "platform": "qHRePPzH", "price": 44, "recurringPaymentOrderNo": "oEi7cJUV", "region": "eX13wgyo", "returnUrl": "yh90Wf29", "sandbox": true, "sku": "QvDM4a3F", "subscriptionId": "fhlE0RYj", "title": "uYrpnF8u"}' \
    > test.out 2>&1
eval_tap $? 261 'CreateUserPaymentOrder' test.out

#- 262 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'oYQONEG5' \
    --userId 'RiGXNx4h' \
    --body '{"description": "p6filraR"}' \
    > test.out 2>&1
eval_tap $? 262 'RefundUserPaymentOrder' test.out

#- 263 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'cnaQe5lR' \
    --body '{"code": "gxC7t5lO", "orderNo": "Ll21jXSb"}' \
    > test.out 2>&1
eval_tap $? 263 'ApplyUserRedemption' test.out

#- 264 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'qem4hUKM' \
    --body '{"meta": {"xgqbaODa": {}, "y2uTVByh": {}, "2U2Qn0Sf": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Epic", "currencyCode": "WJYO3wFM", "namespace": "u7lyAc6Q"}, "entitlement": {"entitlementId": "Trlp1Nle"}, "item": {"itemIdentity": "ac6EI4XW", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 9, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "L8pkjwGW", "namespace": "YqIxMq9f"}, "entitlement": {"entitlementId": "kbDHnOFv"}, "item": {"itemIdentity": "NcpJnohS", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 8, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "pemI6g9h", "namespace": "1KjaQ4Zq"}, "entitlement": {"entitlementId": "3sgd6oHC"}, "item": {"itemIdentity": "2rtQfkgF", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 30, "type": "ITEM"}], "source": "OTHER", "transactionId": "NbYQQp3v"}' \
    > test.out 2>&1
eval_tap $? 264 'DoRevocation' test.out

#- 265 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlHW4BI9' \
    --body '{"gameSessionId": "HvPeCTkp", "payload": {"x96Tljes": {}, "Cz6tH2vT": {}, "2fn6KE3g": {}}, "scid": "jZ8RDQKR", "sessionTemplateName": "6Kkw2z23"}' \
    > test.out 2>&1
eval_tap $? 265 'RegisterXblSessions' test.out

#- 266 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRnu5T3Q' \
    --chargeStatus 'CHARGED' \
    --itemId '8DwnHley' \
    --limit '9' \
    --offset '75' \
    --sku 'DcVDckpt' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 266 'QueryUserSubscriptions' test.out

#- 267 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'BN01lxA1' \
    --excludeSystem  \
    --limit '15' \
    --offset '78' \
    --subscriptionId 'vEa3lvgu' \
    > test.out 2>&1
eval_tap $? 267 'GetUserSubscriptionActivities' test.out

#- 268 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'B75ZD6Ki' \
    --body '{"grantDays": 74, "itemId": "iCsK7HSR", "language": "ArqgLnqS", "reason": "Qfyo5jwC", "region": "eyWoUDxV", "source": "KptlZjjO"}' \
    > test.out 2>&1
eval_tap $? 268 'PlatformSubscribeSubscription' test.out

#- 269 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUGoLx3n' \
    --itemId '3hg6GrAo' \
    > test.out 2>&1
eval_tap $? 269 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 270 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1qJh2LYR' \
    --userId '63w5AUiu' \
    > test.out 2>&1
eval_tap $? 270 'GetUserSubscription' test.out

#- 271 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zRRyW5aR' \
    --userId 'ETVoG6bF' \
    > test.out 2>&1
eval_tap $? 271 'DeleteUserSubscription' test.out

#- 272 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6MnORxIx' \
    --userId 'nquE1nEI' \
    --force  \
    --body '{"immediate": true, "reason": "a2B42hKi"}' \
    > test.out 2>&1
eval_tap $? 272 'CancelSubscription' test.out

#- 273 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xsRrVT7H' \
    --userId 'jxlYU4EZ' \
    --body '{"grantDays": 28, "reason": "YdS6fpXg"}' \
    > test.out 2>&1
eval_tap $? 273 'GrantDaysToSubscription' test.out

#- 274 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ope933sj' \
    --userId 'tZEK0M6X' \
    --excludeFree  \
    --limit '65' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 274 'GetUserSubscriptionBillingHistories' test.out

#- 275 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7Iwi168y' \
    --userId 'cgUk3Ed4' \
    --body '{"additionalData": {"cardSummary": "mXcNocg0"}, "authorisedTime": "1977-03-23T00:00:00Z", "chargebackReversedTime": "1985-12-01T00:00:00Z", "chargebackTime": "1977-04-10T00:00:00Z", "chargedTime": "1971-06-22T00:00:00Z", "createdTime": "1988-12-13T00:00:00Z", "currency": {"currencyCode": "vtZb4XLr", "currencySymbol": "QfUCgJAd", "currencyType": "REAL", "decimals": 17, "namespace": "9BtyOtNf"}, "customParameters": {"S0lXWU2f": {}, "iWPD67C2": {}, "34wu1nRL": {}}, "extOrderNo": "wslK8uwB", "extTxId": "jmvP9rtl", "extUserId": "RfIIsTVm", "issuedAt": "1986-11-14T00:00:00Z", "metadata": {"kmmzX3qK": "RPWXKwfQ", "2fzBKLV5": "MYPpnzTC", "P2CNlwyR": "5o7cPYpJ"}, "namespace": "ofgFkBqO", "nonceStr": "H0GxIUL9", "paymentMethod": "wHUt0a61", "paymentMethodFee": 27, "paymentOrderNo": "286clWa2", "paymentProvider": "WALLET", "paymentProviderFee": 7, "paymentStationUrl": "BwW4bP4T", "price": 59, "refundedTime": "1991-06-02T00:00:00Z", "salesTax": 49, "sandbox": false, "sku": "FdfHJTXr", "status": "AUTHORISED", "statusReason": "2Lc9soqc", "subscriptionId": "YWqyzfI3", "subtotalPrice": 16, "targetNamespace": "6OKBLDcP", "targetUserId": "ch6EkUCq", "tax": 50, "totalPrice": 35, "totalTax": 86, "txEndTime": "1977-09-28T00:00:00Z", "type": "sE6Fxd5a", "userId": "nLbVOqwu", "vat": 46}' \
    > test.out 2>&1
eval_tap $? 275 'ProcessUserSubscriptionNotification' test.out

#- 276 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'AH9I9z6p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxAiL3IW' \
    --body '{"count": 55, "orderNo": "I1jKVfmX"}' \
    > test.out 2>&1
eval_tap $? 276 'AcquireUserTicket' test.out

#- 277 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '1VSkJlOt' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserCurrencyWallets' test.out

#- 278 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'ZFWXZxtb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lizo8N7v' \
    --body '{"allowOverdraft": true, "amount": 72, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"O25yHnRV": {}, "2bw8i7Ge": {}, "Hcivo9Da": {}}, "reason": "mRtxXe3P"}' \
    > test.out 2>&1
eval_tap $? 278 'DebitUserWalletByCurrencyCode' test.out

#- 279 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Dc3ctWTu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZ4xfWbz' \
    --limit '55' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 279 'ListUserCurrencyTransactions' test.out

#- 280 CheckWallet
eval_tap 0 280 'CheckWallet # SKIP deprecated' test.out

#- 281 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'W5O0MeZC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZAyL0GK' \
    --body '{"amount": 59, "expireAt": "1978-08-12T00:00:00Z", "metadata": {"vTPaXfg8": {}, "WPLqzcXl": {}, "Ag0ZM6We": {}}, "origin": "Other", "reason": "mNlOanEy", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 281 'CreditUserWallet' test.out

#- 282 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'sH6RaEUR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qgVPEVyP' \
    --body '{"amount": 5, "metadata": {"qBIBaIe4": {}, "sZJxd2km": {}, "hvgMBERo": {}}, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 282 'PayWithUserWallet' test.out

#- 283 GetUserWallet
eval_tap 0 283 'GetUserWallet # SKIP deprecated' test.out

#- 284 DebitUserWallet
eval_tap 0 284 'DebitUserWallet # SKIP deprecated' test.out

#- 285 DisableUserWallet
eval_tap 0 285 'DisableUserWallet # SKIP deprecated' test.out

#- 286 EnableUserWallet
eval_tap 0 286 'EnableUserWallet # SKIP deprecated' test.out

#- 287 ListUserWalletTransactions
eval_tap 0 287 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 288 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '6MhUJpGC' \
    > test.out 2>&1
eval_tap $? 288 'ListViews' test.out

#- 289 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hPepll7R' \
    --body '{"displayOrder": 47, "localizations": {"bMVD5255": {"description": "6Rcfw7vB", "localExt": {"37qyH46m": {}, "mBkmYSeV": {}, "h6LurSAW": {}}, "longDescription": "r20KcloV", "title": "WGL8ZnXn"}, "9B8wL1Nx": {"description": "UfLemLgU", "localExt": {"dw8SAFt5": {}, "rMvv8iu2": {}, "OqdIBR7m": {}}, "longDescription": "6ad75Zbj", "title": "89B5y7Aw"}, "Bd7KMY15": {"description": "1esxk0vW", "localExt": {"m5f2zrKb": {}, "3PdgcUum": {}, "hw65iWVY": {}}, "longDescription": "rZKAkN15", "title": "kipKMBIp"}}, "name": "HsN7nMod"}' \
    > test.out 2>&1
eval_tap $? 289 'CreateView' test.out

#- 290 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'fMNcyMqo' \
    --storeId 'VioMxchd' \
    > test.out 2>&1
eval_tap $? 290 'GetView' test.out

#- 291 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '83uhwQWx' \
    --storeId '5Vqf90At' \
    --body '{"displayOrder": 17, "localizations": {"E3pZXbDL": {"description": "LAv38kxt", "localExt": {"D9UYOBzP": {}, "khxxjKOH": {}, "OpkeXcU9": {}}, "longDescription": "ZndRbMtC", "title": "qHT11cXO"}, "Xh1XKSP7": {"description": "oQDb6Dvh", "localExt": {"8zzfX5sQ": {}, "mGXSzYbc": {}, "FSkiSRnJ": {}}, "longDescription": "3eN20RAX", "title": "iybRvn1D"}, "Ko4fUSH6": {"description": "J5cWAK7f", "localExt": {"6FIQIFhs": {}, "kdUSpPHy": {}, "8QLy9ISw": {}}, "longDescription": "tLWaxfW1", "title": "dT1IU9WD"}}, "name": "5iSVDWl7"}' \
    > test.out 2>&1
eval_tap $? 291 'UpdateView' test.out

#- 292 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'LFiFYFn0' \
    --storeId 'eeK05KuR' \
    > test.out 2>&1
eval_tap $? 292 'DeleteView' test.out

#- 293 QueryWallets
eval_tap 0 293 'QueryWallets # SKIP deprecated' test.out

#- 294 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 60, "expireAt": "1974-10-08T00:00:00Z", "metadata": {"37m0pSCn": {}, "zhSyxGRO": {}, "NIYoG3lV": {}}, "origin": "Epic", "reason": "kez58csp", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "yIfOeDAI", "userIds": ["7T6DL5gu", "qP2XmUol", "mpJwg1ht"]}, {"creditRequest": {"amount": 42, "expireAt": "1991-11-04T00:00:00Z", "metadata": {"thIQ6BlD": {}, "NWEILwNh": {}, "OavBnqEf": {}}, "origin": "IOS", "reason": "RUrL5yXB", "source": "OTHER"}, "currencyCode": "FBH6KRFQ", "userIds": ["QUObayTG", "aWUZffbz", "vLoLdg5k"]}, {"creditRequest": {"amount": 93, "expireAt": "1981-01-04T00:00:00Z", "metadata": {"eJGl2DcB": {}, "mtUPZr75": {}, "xDwPbF3j": {}}, "origin": "Twitch", "reason": "rw6zsjfo", "source": "GIFT"}, "currencyCode": "LHtKyKVf", "userIds": ["RmwOhzeI", "oRQaTkJx", "eR3JCuMz"]}]' \
    > test.out 2>&1
eval_tap $? 294 'BulkCredit' test.out

#- 295 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "oknoILxG", "request": {"allowOverdraft": false, "amount": 7, "balanceOrigin": "Steam", "balanceSource": "OTHER", "metadata": {"X2VU42xE": {}, "OWDIYAR2": {}, "3VwkcBEu": {}}, "reason": "BVJhfd8w"}, "userIds": ["AWuBeVuB", "INUaxkUo", "i8jnvdWU"]}, {"currencyCode": "RjKcpa28", "request": {"allowOverdraft": true, "amount": 24, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"vNrl1Okn": {}, "M5fVPApZ": {}, "wj9HI5hD": {}}, "reason": "sUZh81ro"}, "userIds": ["JrlY3rlN", "aCR3ZpLe", "NdZPduvx"]}, {"currencyCode": "Ho5ELfuT", "request": {"allowOverdraft": true, "amount": 45, "balanceOrigin": "Playstation", "balanceSource": "OTHER", "metadata": {"o8GMeUzE": {}, "zievolVZ": {}, "vlCaWh3p": {}}, "reason": "jRStOy00"}, "userIds": ["c9VrZxDN", "qrilLYhw", "zs9O0oIC"]}]' \
    > test.out 2>&1
eval_tap $? 295 'BulkDebit' test.out

#- 296 GetWallet
eval_tap 0 296 'GetWallet # SKIP deprecated' test.out

#- 297 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'iVS2kCt7' \
    --end 'jPHKzS3V' \
    --start 'FckInJcY' \
    > test.out 2>&1
eval_tap $? 297 'SyncOrders' test.out

#- 298 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["PZ56Ow0B", "bw4jklnd", "Xmte4Hgk"], "apiKey": "FdTA6XRs", "authoriseAsCapture": true, "blockedPaymentMethods": ["gES503pQ", "QyEaBG5x", "FCmb4NGT"], "clientKey": "VyU7REX3", "dropInSettings": "bD5NYlDI", "liveEndpointUrlPrefix": "EW4ptdQ7", "merchantAccount": "1jjzCb0i", "notificationHmacKey": "umpQB4Vu", "notificationPassword": "OwZBHk8C", "notificationUsername": "3wSOwEq9", "returnUrl": "6wQ9z351", "settings": "sgIsoEba"}' \
    > test.out 2>&1
eval_tap $? 298 'TestAdyenConfig' test.out

#- 299 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "dzLyFhOO", "privateKey": "xk1sW4m8", "publicKey": "Anx2A7DY", "returnUrl": "79Koj7cX"}' \
    > test.out 2>&1
eval_tap $? 299 'TestAliPayConfig' test.out

#- 300 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "bZF18LYU", "secretKey": "92nM9RaL"}' \
    > test.out 2>&1
eval_tap $? 300 'TestCheckoutConfig' test.out

#- 301 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'yq8yhTe6' \
    > test.out 2>&1
eval_tap $? 301 'DebugMatchedPaymentMerchantConfig' test.out

#- 302 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "BpTUGLpz", "clientSecret": "JawHqEwo", "returnUrl": "NIJqv7aq", "webHookId": "e0FOqz5j"}' \
    > test.out 2>&1
eval_tap $? 302 'TestPayPalConfig' test.out

#- 303 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["3294SVqC", "KAJFAdVQ", "FMUhRSKz"], "publishableKey": "USOfYeZO", "secretKey": "PgDqAtnY", "webhookSecret": "DkAh9lxA"}' \
    > test.out 2>&1
eval_tap $? 303 'TestStripeConfig' test.out

#- 304 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "GkxSYX5f", "key": "SNiS1lYV", "mchid": "R2ChNWvq", "returnUrl": "J3ClkcYk"}' \
    > test.out 2>&1
eval_tap $? 304 'TestWxPayConfig' test.out

#- 305 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "XT46k12X", "flowCompletionUrl": "b8RXnABB", "merchantId": 16, "projectId": 25, "projectSecretKey": "9Q9XpaBA"}' \
    > test.out 2>&1
eval_tap $? 305 'TestXsollaConfig' test.out

#- 306 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '3dmaCDDx' \
    > test.out 2>&1
eval_tap $? 306 'GetPaymentMerchantConfig' test.out

#- 307 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '3HqvBWqT' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["iSeohAZe", "IsFZyPeF", "EsB6FNvj"], "apiKey": "gtieU9RW", "authoriseAsCapture": false, "blockedPaymentMethods": ["UPMfBwoC", "sP1gw00o", "9FDFf950"], "clientKey": "9o9FADSK", "dropInSettings": "vaN95WTB", "liveEndpointUrlPrefix": "GvV5AnTi", "merchantAccount": "4SqrGCjR", "notificationHmacKey": "s504zIXU", "notificationPassword": "XGy2T8j2", "notificationUsername": "vsqZSjcG", "returnUrl": "HJE4WgvV", "settings": "cWwMs8vy"}' \
    > test.out 2>&1
eval_tap $? 307 'UpdateAdyenConfig' test.out

#- 308 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '0lNwUNLT' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 308 'TestAdyenConfigById' test.out

#- 309 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Q3xx6TXU' \
    --sandbox  \
    --validate  \
    --body '{"appId": "X331FOz6", "privateKey": "ft4F7FqP", "publicKey": "5ajflN9p", "returnUrl": "klIBxn6a"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateAliPayConfig' test.out

#- 310 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'B5lNm45m' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 310 'TestAliPayConfigById' test.out

#- 311 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'qtuGaL9u' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "MW5E3GcP", "secretKey": "iTMyCd2H"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateCheckoutConfig' test.out

#- 312 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'jXDWx2vu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 312 'TestCheckoutConfigById' test.out

#- 313 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'iBcSa7dD' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "6A5FEF8b", "clientSecret": "Yi8ifJkn", "returnUrl": "R5o28CUb", "webHookId": "DByMzBID"}' \
    > test.out 2>&1
eval_tap $? 313 'UpdatePayPalConfig' test.out

#- 314 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '7Rs9VlgF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 314 'TestPayPalConfigById' test.out

#- 315 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'H8HAlQpf' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["iAd9T3kb", "AoLOgB0g", "xyfnLEvM"], "publishableKey": "OPK59Uvn", "secretKey": "0YNJnMhh", "webhookSecret": "iA9FZ37P"}' \
    > test.out 2>&1
eval_tap $? 315 'UpdateStripeConfig' test.out

#- 316 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '6T2Ne8oI' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfigById' test.out

#- 317 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'Wltnn0zw' \
    --validate  \
    --body '{"appId": "b3JrU6u8", "key": "cZmyNHzf", "mchid": "6BmHpOib", "returnUrl": "b1bNtHOV"}' \
    > test.out 2>&1
eval_tap $? 317 'UpdateWxPayConfig' test.out

#- 318 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '3NKTT6wr' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 318 'UpdateWxPayConfigCert' test.out

#- 319 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'BBfpcTlZ' \
    > test.out 2>&1
eval_tap $? 319 'TestWxPayConfigById' test.out

#- 320 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '3ifZIsX6' \
    --validate  \
    --body '{"apiKey": "1S4O7mQV", "flowCompletionUrl": "oW0KKB0o", "merchantId": 53, "projectId": 63, "projectSecretKey": "dJPlWzze"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateXsollaConfig' test.out

#- 321 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'Hee0CCwn' \
    > test.out 2>&1
eval_tap $? 321 'TestXsollaConfigById' test.out

#- 322 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'LB1rcIdF' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateXsollaUIConfig' test.out

#- 323 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '84' \
    --namespace "$AB_NAMESPACE" \
    --offset '36' \
    --region 'I59q2wcX' \
    > test.out 2>&1
eval_tap $? 323 'QueryPaymentProviderConfig' test.out

#- 324 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "li7YBvDn", "region": "TV8XDuiT", "sandboxTaxJarApiToken": "gcZDK77s", "specials": ["CHECKOUT", "WALLET", "CHECKOUT"], "taxJarApiToken": "fXjbfRp1", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 324 'CreatePaymentProviderConfig' test.out

#- 325 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 325 'GetAggregatePaymentProviders' test.out

#- 326 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'oBmvjOqm' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentProviderConfig' test.out

#- 327 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 327 'GetSpecialPaymentProviders' test.out

#- 328 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '3g98KsCQ' \
    --body '{"aggregate": "XSOLLA", "namespace": "ESPDm7ZJ", "region": "EAbA3qt9", "sandboxTaxJarApiToken": "vDHWvUSp", "specials": ["WALLET", "ADYEN", "ADYEN"], "taxJarApiToken": "bXjDCVi1", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 328 'UpdatePaymentProviderConfig' test.out

#- 329 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'ap7Q851w' \
    > test.out 2>&1
eval_tap $? 329 'DeletePaymentProviderConfig' test.out

#- 330 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 330 'GetPaymentTaxConfig' test.out

#- 331 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "9xNuJ5PV", "taxJarApiToken": "6Uilimji", "taxJarEnabled": true, "taxJarProductCodesMapping": {"53po0DUi": "F2JYp0OP", "m39NfP3p": "CNyXjCCj", "HnwsXObT": "dJe4OHiS"}}' \
    > test.out 2>&1
eval_tap $? 331 'UpdatePaymentTaxConfig' test.out

#- 332 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'sWLLM0kl' \
    --end 'aWAbN5OU' \
    --start 'Hswo12af' \
    > test.out 2>&1
eval_tap $? 332 'SyncPaymentOrders' test.out

#- 333 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '9dnehWsN' \
    --storeId '6FIQBmiF' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetRootCategories' test.out

#- 334 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'sedh2ncx' \
    --storeId 'WSexupuH' \
    > test.out 2>&1
eval_tap $? 334 'DownloadCategories' test.out

#- 335 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'ash5Twig' \
    --namespace "$AB_NAMESPACE" \
    --language '6gk2KmTI' \
    --storeId 'wVwBquo8' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetCategory' test.out

#- 336 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'o8xvHKOj' \
    --namespace "$AB_NAMESPACE" \
    --language 'csSbCstu' \
    --storeId 'qFtNi5g2' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetChildCategories' test.out

#- 337 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'znN1ee68' \
    --namespace "$AB_NAMESPACE" \
    --language 'QF83K0oO' \
    --storeId 'WiBe2Kcw' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetDescendantCategories' test.out

#- 338 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 338 'PublicListCurrencies' test.out

#- 339 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 339 'GeDLCDurableRewardShortMap' test.out

#- 340 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 340 'GetIAPItemMapping' test.out

#- 341 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'mrUurmE9' \
    --region 'sAzf1TsJ' \
    --storeId 'pXUjd3RQ' \
    --appId 'R7Qwpglx' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetItemByAppId' test.out

#- 342 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId '6DHQu93B' \
    --categoryPath '7M7I502H' \
    --features 'dcixUBnz' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'wP0XsnuT' \
    --limit '37' \
    --offset '78' \
    --region 'jv8QrqYx' \
    --sortBy 'name,createdAt:desc' \
    --storeId 'x4ZcuO9C' \
    --tags '8f2aIAfO' \
    > test.out 2>&1
eval_tap $? 342 'PublicQueryItems' test.out

#- 343 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '27QMbF9e' \
    --region 'L7gwVtjA' \
    --storeId 'zNpfJWmJ' \
    --sku 'GbwNZ6Dl' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetItemBySku' test.out

#- 344 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'Ko4W6HZD' \
    --storeId 'dTiPPbhv' \
    --itemIds 'TcO7Icwx' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetEstimatedPrice' test.out

#- 345 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'vMdUDE0O' \
    --region 'l9TBn19G' \
    --storeId 'JWwM2kiQ' \
    --itemIds 'GEVCoEa8' \
    > test.out 2>&1
eval_tap $? 345 'PublicBulkGetItems' test.out

#- 346 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["HzHYX0e5", "5tyQOJbZ", "JqUPcGxK"]}' \
    > test.out 2>&1
eval_tap $? 346 'PublicValidateItemPurchaseCondition' test.out

#- 347 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'LOOTBOX' \
    --limit '35' \
    --offset '88' \
    --region 'A4c7XvzZ' \
    --storeId 'IxRwUPlR' \
    --keyword 'DGNomAr0' \
    --language 'kEzRmXjV' \
    > test.out 2>&1
eval_tap $? 347 'PublicSearchItems' test.out

#- 348 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'vg5SQgrG' \
    --namespace "$AB_NAMESPACE" \
    --language 'tM9Jqzto' \
    --region '8JAofCDt' \
    --storeId 'cbhRaXrr' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetApp' test.out

#- 349 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'B53zhTea' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'PublicGetItemDynamicData' test.out

#- 350 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'ZHZ9flBk' \
    --namespace "$AB_NAMESPACE" \
    --language 'hSvv9M7d' \
    --populateBundle  \
    --region 'aTE3ioPB' \
    --storeId '2RsbuAva' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetItem' test.out

#- 351 GetPaymentCustomization
eval_tap 0 351 'GetPaymentCustomization # SKIP deprecated' test.out

#- 352 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "Lb6mZZlH", "paymentProvider": "CHECKOUT", "returnUrl": "GhXqMlSr", "ui": "hmBg9ddq", "zipCode": "g0o1ZQZo"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetPaymentUrl' test.out

#- 353 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DHPuFp5w' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetPaymentMethods' test.out

#- 354 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CSwL0cx3' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUnpaidPaymentOrder' test.out

#- 355 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RtkOWjNC' \
    --paymentProvider 'STRIPE' \
    --zipCode 'JKA4w4CN' \
    --body '{"token": "V80SWQlR"}' \
    > test.out 2>&1
eval_tap $? 355 'Pay' test.out

#- 356 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Cx13iMzE' \
    > test.out 2>&1
eval_tap $? 356 'PublicCheckPaymentOrderPaidStatus' test.out

#- 357 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'a5dQWHwZ' \
    > test.out 2>&1
eval_tap $? 357 'GetPaymentPublicConfig' test.out

#- 358 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'fnnWx1fU' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetQRCode' test.out

#- 359 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'JOgD4glw' \
    --foreinginvoice '8DXctIip' \
    --invoiceId 'DSMlTdg6' \
    --payload 'oRSV9koD' \
    --redirectResult 'KM6syFNW' \
    --resultCode 'cHp2tsvf' \
    --sessionId '97q7DEQK' \
    --status 'bHNc1qef' \
    --token 'DZCZ1rOx' \
    --type 'IRMgNMLx' \
    --userId 'YnDJDL55' \
    --orderNo 'WeJJ8BxE' \
    --paymentOrderNo '56D9gX6q' \
    --paymentProvider 'ALIPAY' \
    --returnUrl '8Pfj2e1n' \
    > test.out 2>&1
eval_tap $? 359 'PublicNormalizePaymentReturnUrl' test.out

#- 360 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'T1J8Sl5f' \
    --paymentOrderNo 'Y0GYD0JR' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentTaxValue' test.out

#- 361 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '9b6lJ5up' \
    > test.out 2>&1
eval_tap $? 361 'GetRewardByCode' test.out

#- 362 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'EYXfLkYp' \
    --limit '28' \
    --offset '33' \
    --sortBy 'namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 362 'QueryRewards1' test.out

#- 363 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '0CgiiL1v' \
    > test.out 2>&1
eval_tap $? 363 'GetReward1' test.out

#- 364 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 364 'PublicListStores' test.out

#- 365 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Cb7Q8QmW,dEQZOKJ9,1PLpP82G' \
    --itemIds 'HxvV2tHz,ekluZHx8,LaWHhpIR' \
    --skus 'tEqNajAp,Q0RwvauZ,mIeHbyrH' \
    > test.out 2>&1
eval_tap $? 365 'PublicExistsAnyMyActiveEntitlement' test.out

#- 366 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'nFjfuxgN' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 367 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'msLJn8jr' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 368 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'Th5NWv5m' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 369 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '98DFSYbM,IbRyYbtZ,EYhqvtDI' \
    --itemIds 'hLvLreHD,IHbPofWu,yK5r8aCA' \
    --skus 'XR42yusP,5M249Vvz,T62XK7y8' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetEntitlementOwnershipToken' test.out

#- 370 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "daPQwwoO", "language": "OXzg_GXGF", "region": "fa2uR4QS"}' \
    > test.out 2>&1
eval_tap $? 370 'SyncTwitchDropsEntitlement' test.out

#- 371 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'bmF1xCCI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 371 'PublicGetMyWallet' test.out

#- 372 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLYlB5c0' \
    --body '{"epicGamesJwtToken": "nYYh9ooW"}' \
    > test.out 2>&1
eval_tap $? 372 'SyncEpicGameDLC' test.out

#- 373 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3JAzVP7' \
    > test.out 2>&1
eval_tap $? 373 'SyncOculusDLC' test.out

#- 374 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'KYnBzpZX' \
    --body '{"serviceLabel": 31}' \
    > test.out 2>&1
eval_tap $? 374 'PublicSyncPsnDlcInventory' test.out

#- 375 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'GXoIxG0O' \
    --body '{"serviceLabels": [38, 18, 86]}' \
    > test.out 2>&1
eval_tap $? 375 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 376 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'k2CUKRep' \
    --body '{"appId": "7biY9sVo", "steamId": "kJ6g3Fhg"}' \
    > test.out 2>&1
eval_tap $? 376 'SyncSteamDLC' test.out

#- 377 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '11OMA1nr' \
    --body '{"xstsToken": "dovh7d1Z"}' \
    > test.out 2>&1
eval_tap $? 377 'SyncXboxDLC' test.out

#- 378 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'avnG3Ncl' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName '0ztQ7dd0' \
    --features 'BWvlDHj2,8CNlBs10,hqQJ4d0H' \
    --itemId 'SWgTJsIt,7pbmybpZ,Qryo7w3q' \
    --limit '96' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 378 'PublicQueryUserEntitlements' test.out

#- 379 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DbJiHT3a' \
    --appId '2QEFEHVI' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserAppEntitlementByAppId' test.out

#- 380 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'J0WcgH7y' \
    --limit '59' \
    --offset '4' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 380 'PublicQueryUserEntitlementsByAppType' test.out

#- 381 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nxehGtHZ' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId '9aXCEOu0' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserEntitlementByItemId' test.out

#- 382 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '4daRCkP2' \
    --entitlementClazz 'APP' \
    --sku '1FyRlw5P' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUserEntitlementBySku' test.out

#- 383 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QwQloufl' \
    --appIds 'BljbKR7b,iVhVfs0y,wUVUKwpO' \
    --itemIds 'h8QJiDw7,yded2kVZ,UZ2jcnh7' \
    --skus 'H5y7NduX,a7eSQblf,mMv1OiG3' \
    > test.out 2>&1
eval_tap $? 383 'PublicExistsAnyUserActiveEntitlement' test.out

#- 384 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'h9iDlOVQ' \
    --appId 'iO7DKKIJ' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 385 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rJe1N2gk' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'qWT8Wilw' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 386 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'crBcjb8T' \
    --ids 'oZYpI4hO,WQ3XcJLF,DjJuzG0O' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 387 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKkOO0iC' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'oBkCnFpQ' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 388 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'kUXTohGX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y8tLMO8N' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserEntitlement' test.out

#- 389 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '3wbJX6NX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZIa7iWf' \
    --body '{"options": ["uOi7NMLO", "FuEvxxP6", "FnisXIvQ"], "requestId": "LTzxBzYC", "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 389 'PublicConsumeUserEntitlement' test.out

#- 390 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'IBiH2tJZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dEfXUUky' \
    --body '{"requestId": "dn5yHf3B", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 390 'PublicSellUserEntitlement' test.out

#- 391 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'nrZZeWLI' \
    --body '{"code": "xncOyJTy", "language": "hMgV", "region": "dDLRoGL0"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicRedeemCode' test.out

#- 392 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '65xatblk' \
    --body '{"excludeOldTransactions": false, "language": "ILh_uKLJ", "productId": "awcpzCcz", "receiptData": "v0FIqewe", "region": "Dg2TlgVZ", "transactionId": "VE6ydhbZ"}' \
    > test.out 2>&1
eval_tap $? 392 'PublicFulfillAppleIAPItem' test.out

#- 393 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8cVb2Lg' \
    --body '{"epicGamesJwtToken": "5PiO4LVv"}' \
    > test.out 2>&1
eval_tap $? 393 'SyncEpicGamesInventory' test.out

#- 394 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIApRaWb' \
    --body '{"autoAck": false, "language": "tir_pqcF-PL", "orderId": "2piCnofg", "packageName": "OxlJijCc", "productId": "jkaKEPl3", "purchaseTime": 72, "purchaseToken": "S9nXDqbt", "region": "PrrFBMsg"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicFulfillGoogleIAPItem' test.out

#- 395 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'UAIAAw3a' \
    > test.out 2>&1
eval_tap $? 395 'SyncOculusConsumableEntitlements' test.out

#- 396 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '3hM41BeC' \
    --body '{"currencyCode": "UBy8XXX2", "price": 0.20075476474151277, "productId": "2JwCAYwo", "serviceLabel": 65}' \
    > test.out 2>&1
eval_tap $? 396 'PublicReconcilePlayStationStore' test.out

#- 397 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUAreNiG' \
    --body '{"currencyCode": "v3M5Oyfb", "price": 0.867649074800908, "productId": "i08K5YQj", "serviceLabels": [19, 25, 59]}' \
    > test.out 2>&1
eval_tap $? 397 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 398 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'N0208Z4x' \
    --body '{"appId": "hIItWpfp", "currencyCode": "My5tF95p", "language": "WV_kInx-148", "price": 0.4043602109965747, "productId": "EgLnbnzy", "region": "pm9W5gJh", "steamId": "n2MMKkLN"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncSteamInventory' test.out

#- 399 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gfYIORiH' \
    --body '{"gameId": "5hlDCoqc", "language": "Vqx_CIcH-524", "region": "8yvXumqT"}' \
    > test.out 2>&1
eval_tap $? 399 'SyncTwitchDropsEntitlement1' test.out

#- 400 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'm914RIWh' \
    --body '{"currencyCode": "1r824vFg", "price": 0.3317368813803251, "productId": "i6aeev5Z", "xstsToken": "Rqg0jIKj"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncXboxInventory' test.out

#- 401 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FYmDtZ5c' \
    --itemId 'xReTsSmS' \
    --limit '85' \
    --offset '50' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryUserOrders' test.out

#- 402 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYWKWgrM' \
    --body '{"currencyCode": "PIlcmbUO", "discountedPrice": 84, "ext": {"0splDgB8": {}, "bu4HQKDi": {}, "xIlU1H4m": {}}, "itemId": "PtFDDRA2", "language": "jQmH-WvCC_056", "price": 30, "quantity": 86, "region": "Zyhs6kaj", "returnUrl": "aKorM0de", "sectionId": "ZQyuut5p"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicCreateUserOrder' test.out

#- 403 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EfXFIZoJ' \
    --userId 'mWivKWYa' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetUserOrder' test.out

#- 404 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F5g0OtLa' \
    --userId 'pR7DQBi5' \
    > test.out 2>&1
eval_tap $? 404 'PublicCancelUserOrder' test.out

#- 405 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OYyq71mV' \
    --userId 'xLDeZjln' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserOrderHistories' test.out

#- 406 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JPCXKpCJ' \
    --userId 'zAWKEgZJ' \
    > test.out 2>&1
eval_tap $? 406 'PublicDownloadUserOrderReceipt' test.out

#- 407 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jeqNnJf2' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetPaymentAccounts' test.out

#- 408 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'xaNoBqgs' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'ZPAf0yup' \
    > test.out 2>&1
eval_tap $? 408 'PublicDeletePaymentAccount' test.out

#- 409 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'u25pKAsD' \
    --language 'EJXQqts3' \
    --region 'Sm7UkgDZ' \
    --storeId 'dPPTkAy7' \
    --viewId 'pjMOSglW' \
    > test.out 2>&1
eval_tap $? 409 'PublicListActiveSections' test.out

#- 410 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'jLVqJQan' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '9Jj5DD1u' \
    --limit '77' \
    --offset '93' \
    --sku 'coYwGFBT' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryUserSubscriptions' test.out

#- 411 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNQHmotY' \
    --body '{"currencyCode": "AT50vbRr", "itemId": "H4X6slyJ", "language": "bxQd-xlGY-388", "region": "iN9l4xpc", "returnUrl": "NnCRcibU", "source": "ZrengCEo"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicSubscribeSubscription' test.out

#- 412 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdCWuug5' \
    --itemId 'epEdJL8l' \
    > test.out 2>&1
eval_tap $? 412 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 413 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eaJNuTXo' \
    --userId 'hlLQD0wT' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUserSubscription' test.out

#- 414 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eesi2L7D' \
    --userId 'yFrrhdbp' \
    > test.out 2>&1
eval_tap $? 414 'PublicChangeSubscriptionBillingAccount' test.out

#- 415 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'oKLlk1wy' \
    --userId 'zkYq1xIm' \
    --body '{"immediate": true, "reason": "YeJJJDzK"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCancelSubscription' test.out

#- 416 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bNqZ8S7W' \
    --userId 'DJb9xhht' \
    --excludeFree  \
    --limit '9' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserSubscriptionBillingHistories' test.out

#- 417 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTdUi03c' \
    --language '4pFl2Dwl' \
    --storeId 'S8cYtCeN' \
    > test.out 2>&1
eval_tap $? 417 'PublicListViews' test.out

#- 418 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'a4PYVIvd' \
    --namespace "$AB_NAMESPACE" \
    --userId '8kjadBiy' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetWallet' test.out

#- 419 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'o0x3GnvG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GjuMlQWE' \
    --limit '8' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 419 'PublicListUserWalletTransactions' test.out

#- 420 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'i4GA8lBo' \
    --baseAppId 'dAGXD0ZR' \
    --categoryPath 'yfgXmhC6' \
    --features 'FxclB4qN' \
    --includeSubCategoryItem  \
    --itemName 'pwr6ZfmV' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON' \
    --limit '38' \
    --offset '91' \
    --region 'S7E9HQOp' \
    --sectionExclusive  \
    --sortBy 'name,displayOrder,name:asc' \
    --storeId 't3UFQS2O' \
    --tags 'FLLvU39C' \
    --targetNamespace '6rlYIehB' \
    > test.out 2>&1
eval_tap $? 420 'QueryItems1' test.out

#- 421 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '9ugS65Vp' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 421 'ImportStore1' test.out

#- 422 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '7DW82PX8' \
    --body '{"itemIds": ["aDrJQPew", "IULMcZBE", "KIW2bxUB"]}' \
    > test.out 2>&1
eval_tap $? 422 'ExportStore1' test.out

#- 423 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTNTUPAc' \
    --body '{"metadata": {"6JBShv27": {}, "aB8tOWpx": {}, "PzuQCRtn": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "mhpySzP6", "namespace": "r9J1aYE7"}, "item": {"itemId": "vn4LGuHv", "itemSku": "p9eioEWh", "itemType": "VL5juQD2"}, "quantity": 75, "type": "ITEM"}, {"currency": {"currencyCode": "H9GNgEyo", "namespace": "xeDHAUwc"}, "item": {"itemId": "iasdE4I3", "itemSku": "NDSPILZE", "itemType": "BfksFAvU"}, "quantity": 32, "type": "ITEM"}, {"currency": {"currencyCode": "rAXb8Egb", "namespace": "q4YZLNSL"}, "item": {"itemId": "8riLdvbp", "itemSku": "3l1MeGjK", "itemType": "V1MGboHW"}, "quantity": 12, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "ya6t4Jij"}' \
    > test.out 2>&1
eval_tap $? 423 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
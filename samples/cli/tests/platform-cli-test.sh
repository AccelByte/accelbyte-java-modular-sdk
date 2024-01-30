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
echo "1..444"

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
    --id 'su8Ph11I' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'UcjF8lLF' \
    --body '{"grantDays": "LmNVYTzX"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'Ome5ZSxX' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'MFC6Vyqo' \
    --body '{"grantDays": "o733u0Og"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "yJyqmJZ5", "dryRun": false, "fulfillmentUrl": "tIkKjsKB", "itemType": "APP", "purchaseConditionUrl": "FTcoWZEJ"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'M6D8KA6c' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'AzAjhATO' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'O00nseyE' \
    --body '{"clazz": "8GTNTH0n", "dryRun": true, "fulfillmentUrl": "UQuFZ5Sn", "purchaseConditionUrl": "diR9eYd6"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '6COuSgcF' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --name 'm24hX5l2' \
    --offset '44' \
    --tag '6WVSfHho' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "pV5BQOsm", "items": [{"extraSubscriptionDays": 73, "itemId": "s6419LHe", "itemName": "olshGUKq", "quantity": 92}, {"extraSubscriptionDays": 6, "itemId": "DsWh2IfA", "itemName": "msCZy7dq", "quantity": 46}, {"extraSubscriptionDays": 50, "itemId": "fNsbGQuR", "itemName": "pibMB6r6", "quantity": 90}], "maxRedeemCountPerCampaignPerUser": 39, "maxRedeemCountPerCode": 71, "maxRedeemCountPerCodePerUser": 93, "maxSaleCount": 21, "name": "Uu9zosPD", "redeemEnd": "1990-01-29T00:00:00Z", "redeemStart": "1987-04-22T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["LahoK6Ye", "skyfitAd", "mZm9DQcf"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'fPTgvnza' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'yP0x3T9z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9lFua2p2", "items": [{"extraSubscriptionDays": 55, "itemId": "ZWWcQoFU", "itemName": "6iLu4Nxc", "quantity": 64}, {"extraSubscriptionDays": 28, "itemId": "GLsdKjRK", "itemName": "qWNKECaR", "quantity": 13}, {"extraSubscriptionDays": 81, "itemId": "GzdPuwq4", "itemName": "i6M79xKb", "quantity": 20}], "maxRedeemCountPerCampaignPerUser": 38, "maxRedeemCountPerCode": 28, "maxRedeemCountPerCodePerUser": 0, "maxSaleCount": 68, "name": "DbQfNpw1", "redeemEnd": "1991-07-16T00:00:00Z", "redeemStart": "1972-10-13T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["VWHdkaeQ", "WlWznTBp", "BI26luE3"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'EQ39ZiUG' \
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
    --body '{"appConfig": {"appName": "hvyNAYjo"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "m7o7ik08"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "g0Uswj6e"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "DU0h6SYX"}, "extendType": "APP"}' \
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
    --storeId 'Yg1Ex6qu' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'T2gVty5A' \
    --body '{"categoryPath": "oNvFpg6t", "localizationDisplayNames": {"WlEEXsRc": "6Jq7M0y4", "fydNlju0": "mvicxAgi", "gDiFdeA3": "sYiQf9oq"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RkEyGFEf' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'zbiX4Aqa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RfakinoJ' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'hd8JHqKB' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0p6nKxOY' \
    --body '{"localizationDisplayNames": {"TBYXLTGF": "CtKHatL3", "snLvCNnV": "7aKt31ud", "aFBy5cJn": "tUILZK1V"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'SexHqNiQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7FAnQUVm' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'gAzPGIeY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ez1fn6Se' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '0iujigj5' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0yBl8PVR' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Xa9DIpey' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '53' \
    --code 'X5OHldLY' \
    --limit '5' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'YB3DvG3C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 44}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '0gx3Spzf' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '67' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'eASTh8P7' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '59' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'Pb9BmQhg' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '74' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'phbHqLz8' \
    --namespace "$AB_NAMESPACE" \
    --code 'C3GZtcxB' \
    --limit '55' \
    --offset '28' \
    --userId 'OxoSVLl2' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'fEX2tdEy' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 's2qmsJo0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'qZgJoJ5h' \
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
    --body '{"currencyCode": "rNZOYVot", "currencySymbol": "UYMTWWhX", "currencyType": "VIRTUAL", "decimals": 98, "localizationDescriptions": {"otTFYT9B": "CvjbqN42", "kNYUyt2R": "VkEMBKfs", "3DuOkfQB": "fTW4AVKP"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '6AXq7DUK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"fP2VltYH": "i2rhDVzF", "1Nnec4SQ": "32Qs3taz", "GxL4KqjU": "hqsbsMXP"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'HUQVK2ni' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'kLYb5t1r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'KFnLmpzT' \
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
    --body '{"data": [{"id": "7dYUHZMT", "rewards": [{"currency": {"currencyCode": "redlQ2kM", "namespace": "a1lBAMz1"}, "item": {"itemId": "omIppdLQ", "itemSku": "shDJ9uHk", "itemType": "zHV6qT94"}, "quantity": 100, "type": "ITEM"}, {"currency": {"currencyCode": "en7JfDXr", "namespace": "SBCSsdp8"}, "item": {"itemId": "jmaSepUG", "itemSku": "Hy56nH2Q", "itemType": "XmS9pVl2"}, "quantity": 65, "type": "ITEM"}, {"currency": {"currencyCode": "V4bmABln", "namespace": "b1ytWaAY"}, "item": {"itemId": "0ckJTLQS", "itemSku": "QNV9Ju5H", "itemType": "WSIrLy3H"}, "quantity": 7, "type": "CURRENCY"}]}, {"id": "PGsECk1G", "rewards": [{"currency": {"currencyCode": "n7I3q71t", "namespace": "TxPJn6TC"}, "item": {"itemId": "fKAbs0Qv", "itemSku": "wHiZwhir", "itemType": "nmlUC2ag"}, "quantity": 35, "type": "ITEM"}, {"currency": {"currencyCode": "QXWqB9kM", "namespace": "3LeCrZxS"}, "item": {"itemId": "L2d1C01L", "itemSku": "s9idMbGl", "itemType": "4GIOtbV6"}, "quantity": 50, "type": "CURRENCY"}, {"currency": {"currencyCode": "51VYf2Et", "namespace": "tv01WUjZ"}, "item": {"itemId": "iz54vadT", "itemSku": "IoMNL4HS", "itemType": "fLUog69D"}, "quantity": 41, "type": "CURRENCY"}]}, {"id": "QyRUrfxg", "rewards": [{"currency": {"currencyCode": "0Jusetzm", "namespace": "Gd2zIw4s"}, "item": {"itemId": "c87XgIm4", "itemSku": "mQ93eV5G", "itemType": "QiO4GkUY"}, "quantity": 26, "type": "CURRENCY"}, {"currency": {"currencyCode": "SAmGCgED", "namespace": "XfrPqCXU"}, "item": {"itemId": "vkmexKT9", "itemSku": "F3bi8Rhg", "itemType": "HJ8vKJgJ"}, "quantity": 59, "type": "ITEM"}, {"currency": {"currencyCode": "0vbLWG23", "namespace": "9gkFgldc"}, "item": {"itemId": "7gbtYB3v", "itemSku": "bvNcynS7", "itemType": "qfJTmxZ9"}, "quantity": 7, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"QXXpeJ13": "CDG10PbW", "yrjuHALG": "MM6acS8W", "ynLTFdNF": "qnD8ve7D"}}, {"platform": "OCULUS", "platformDlcIdMap": {"cNlhjCWZ": "QrvVREAL", "Dx1pf0zH": "OTM5zj53", "o2MtEbdR": "Jynxozdj"}}, {"platform": "XBOX", "platformDlcIdMap": {"ch16aAUj": "2e0jr9OJ", "mSZOCoB7": "3ILtBpzd", "OZZrQAbW": "uFngkMaD"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'BCSikBy8' \
    --itemId 'VnIqrEBy,OzQl7F97,ugjqy9o4' \
    --limit '73' \
    --offset '41' \
    --origin 'Twitch' \
    --userId 'cTmCcZhF' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'ZAYf7cKc,rkpHVpX3,Qsjh9DqU' \
    --limit '96' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements1' test.out

#- 61 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'EnableEntitlementOriginFeature' test.out

#- 62 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 62 'GetEntitlementConfigInfo' test.out

#- 63 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "PxYpiQDL", "endDate": "1998-10-06T00:00:00Z", "grantedCode": "Y1L8u7AU", "itemId": "uuBXJIPt", "itemNamespace": "00XoYxhC", "language": "TVpv_Wxkn_fz", "origin": "Oculus", "quantity": 95, "region": "w1VHwabo", "source": "OTHER", "startDate": "1977-01-26T00:00:00Z", "storeId": "8g0CbyFC"}, {"collectionId": "F5qqWhh2", "endDate": "1993-03-05T00:00:00Z", "grantedCode": "D6AZNcoZ", "itemId": "hBwTHNkY", "itemNamespace": "QuFP52BK", "language": "nbWd", "origin": "Oculus", "quantity": 85, "region": "uvtcZXei", "source": "IAP", "startDate": "1971-05-03T00:00:00Z", "storeId": "3Hk9toPB"}, {"collectionId": "2EjiP7Ln", "endDate": "1994-01-09T00:00:00Z", "grantedCode": "l9Xqr9lB", "itemId": "SQRbwRSR", "itemNamespace": "ZZPu06MD", "language": "dnca-ELXL", "origin": "Oculus", "quantity": 27, "region": "cTJXTHbk", "source": "GIFT", "startDate": "1979-10-30T00:00:00Z", "storeId": "kFLm8YaB"}], "userIds": ["XybPQm8B", "pn10UNlJ", "3R9XsOzX"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["wm9ajQbS", "GElH8Y0N", "8Nj73acR"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'Gb6SWCyY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '64' \
    --status 'FAIL' \
    --userId '0YTikGpZ' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MwWfgMXl' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'Xo9rVfa1' \
    --limit '63' \
    --offset '4' \
    --startTime '74X3Ap7S' \
    --status 'SUCCESS' \
    --userId 'oXPYTiAu' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "VGwBWeIN", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 21, "clientTransactionId": "6Uo6XXTK"}, {"amountConsumed": 99, "clientTransactionId": "aQzXlWCT"}, {"amountConsumed": 71, "clientTransactionId": "ahwCaPB6"}], "entitlementId": "FioznIwx", "usageCount": 38}, {"clientTransaction": [{"amountConsumed": 4, "clientTransactionId": "ozcXH9uo"}, {"amountConsumed": 59, "clientTransactionId": "7vgYJS2Z"}, {"amountConsumed": 31, "clientTransactionId": "rKVsQEHK"}], "entitlementId": "zas3xcM6", "usageCount": 59}, {"clientTransaction": [{"amountConsumed": 8, "clientTransactionId": "iyX7IUfp"}, {"amountConsumed": 38, "clientTransactionId": "UnUEkgyR"}, {"amountConsumed": 67, "clientTransactionId": "rG0odaqz"}], "entitlementId": "RPKvqkpO", "usageCount": 82}], "purpose": "k4iQPNoI"}, "originalTitleName": "5qFpWQY0", "paymentProductSKU": "WcCqcLNf", "purchaseDate": "vkejkAXe", "sourceOrderItemId": "VPpNJSWL", "titleName": "5eF3kSUU"}, "eventDomain": "n58zVL2o", "eventSource": "61xA80HM", "eventType": "joRFTAnN", "eventVersion": 28, "id": "x5elOaTg", "timestamp": "16HQJwdn"}' \
    > test.out 2>&1
eval_tap $? 68 'MockPlayStationStreamEvent' test.out

#- 69 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetAppleIAPConfig' test.out

#- 70 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "m5ixMGwy", "password": "yLRQIQBG"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateAppleIAPConfig' test.out

#- 71 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteAppleIAPConfig' test.out

#- 72 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetEpicGamesIAPConfig' test.out

#- 73 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "xAZO0zcX"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateEpicGamesIAPConfig' test.out

#- 74 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'DeleteEpicGamesIAPConfig' test.out

#- 75 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'GetGoogleIAPConfig' test.out

#- 76 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "A1gBy6ov", "serviceAccountId": "QI7vpq1z"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateGoogleIAPConfig' test.out

#- 77 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'DeleteGoogleIAPConfig' test.out

#- 78 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleP12File' test.out

#- 79 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetIAPItemConfig' test.out

#- 80 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "CduLciXD", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"oNCxmMW4": "89HPe9wl", "5A6VMLp0": "tASzpC8q", "yCZQDZ3f": "457EzsIF"}}, {"itemIdentity": "UJ8rCqou", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"7NgMm7G2": "dRjjFinZ", "fq3GJZmS": "NlTPjBbv", "oGasVvzr": "2ImEQSuS"}}, {"itemIdentity": "p1Uj5VUE", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"tBLbehIv": "kvEVJDft", "cn0I517W": "5kDj2BhZ", "CBrNhDgS": "q5wKC0mU"}}]}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateIAPItemConfig' test.out

#- 81 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteIAPItemConfig' test.out

#- 82 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetOculusIAPConfig' test.out

#- 83 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "FrR1nAWX", "appSecret": "75EpC4mA"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateOculusIAPConfig' test.out

#- 84 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'DeleteOculusIAPConfig' test.out

#- 85 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetPlayStationIAPConfig' test.out

#- 86 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "QbisgiZz", "backOfficeServerClientSecret": "wb7Yja3I", "enableStreamJob": true, "environment": "ieIf1dN2", "streamName": "OBhT7Jnn", "streamPartnerName": "74l3WhJ0"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdatePlaystationIAPConfig' test.out

#- 87 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeletePlaystationIAPConfig' test.out

#- 88 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'ValidateExistedPlaystationIAPConfig' test.out

#- 89 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "FEH3j0xe", "backOfficeServerClientSecret": "asSZeiqC", "enableStreamJob": false, "environment": "3KTB76ux", "streamName": "aEwNqlYO", "streamPartnerName": "6GvWR5jd"}' \
    > test.out 2>&1
eval_tap $? 89 'ValidatePlaystationIAPConfig' test.out

#- 90 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetSteamIAPConfig' test.out

#- 91 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "32IusX4F", "publisherAuthenticationKey": "ZzFUUPbN"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateSteamIAPConfig' test.out

#- 92 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteSteamIAPConfig' test.out

#- 93 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetTwitchIAPConfig' test.out

#- 94 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "qciKkqCI", "clientSecret": "Jb4w5nUa", "organizationId": "d2Gm8R7s"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateTwitchIAPConfig' test.out

#- 95 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'DeleteTwitchIAPConfig' test.out

#- 96 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetXblIAPConfig' test.out

#- 97 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "k4mLpbN6"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateXblIAPConfig' test.out

#- 98 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteXblAPConfig' test.out

#- 99 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'ev6RdfaS' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'n5YvNnU0' \
    --itemId 'PpMEw8f3' \
    --itemType 'BUNDLE' \
    --endTime 'O9h5MoaK' \
    --startTime 'rXyCdcCB' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '48dBcelw' \
    --itemId 'bVQ0JvcO' \
    --itemType 'SEASON' \
    --endTime 'x6ATqYjn' \
    --startTime 'LyhslfpI' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RepgExwK' \
    --body '{"categoryPath": "3XmTI1pb", "targetItemId": "Sqv3ZyKU", "targetNamespace": "Gd7RW78Z"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '9ilFy6HN' \
    --body '{"appId": "YBTpvdDI", "appType": "GAME", "baseAppId": "ZgVmE1oH", "boothName": "duHzWvf5", "categoryPath": "R5LAAfUP", "clazz": "RIO1oeiK", "displayOrder": 79, "entitlementType": "CONSUMABLE", "ext": {"3oovKZ8x": {}, "BFLqxUU9": {}, "8jiybvGo": {}}, "features": ["0yEnNdgM", "Yjjro4mY", "Xnk0VrZ8"], "flexible": false, "images": [{"as": "DymeLV8w", "caption": "uBj3qDkv", "height": 4, "imageUrl": "TZGea4Pb", "smallImageUrl": "RC3gFtHK", "width": 7}, {"as": "bkeu5TTq", "caption": "Ns9HdWgs", "height": 9, "imageUrl": "ZunFzO4s", "smallImageUrl": "VrI19UIc", "width": 89}, {"as": "83OyobSo", "caption": "dGfqxKFj", "height": 25, "imageUrl": "1Wj7rT2V", "smallImageUrl": "y51ra9D5", "width": 2}], "inventoryConfig": {"customAttributes": {"Y7UUAiGZ": {}, "hM6guKzs": {}, "AwTogvBt": {}}, "serverCustomAttributes": {"7fscCL2g": {}, "2p9XVtKf": {}, "pN2Q0gG7": {}}, "slotUsed": 50}, "itemIds": ["8ouKsYhu", "ELBrrJIo", "0edPVuST"], "itemQty": {"KdMaRTbX": 21, "q06wUwbv": 15, "bZ13ipnS": 22}, "itemType": "CODE", "listable": false, "localizations": {"Da57sddr": {"description": "QjEzEhaK", "localExt": {"3NTXPBXx": {}, "jILHDDVO": {}, "h1Qg0ugF": {}}, "longDescription": "TwiY64GJ", "title": "NQKg4jiY"}, "DCtFgyF6": {"description": "sGCosPfk", "localExt": {"EsjDfA20": {}, "zqrJX6D9": {}, "D33Yj5c6": {}}, "longDescription": "AK145sYk", "title": "VREMcmHZ"}, "S5tQDjl0": {"description": "zDTZghZs", "localExt": {"mfwpkzeI": {}, "f4qhnY4i": {}, "6HCsqBbM": {}}, "longDescription": "Q8dvU766", "title": "ol8DwVSs"}}, "lootBoxConfig": {"rewardCount": 68, "rewards": [{"lootBoxItems": [{"count": 49, "duration": 39, "endDate": "1987-11-25T00:00:00Z", "itemId": "xNduhGZo", "itemSku": "RpdZuw4L", "itemType": "WpDDBm6u"}, {"count": 24, "duration": 76, "endDate": "1986-02-17T00:00:00Z", "itemId": "Avb0Hgr7", "itemSku": "aRspxx8m", "itemType": "QXSmNKKp"}, {"count": 17, "duration": 60, "endDate": "1984-11-03T00:00:00Z", "itemId": "hm8ZrvaX", "itemSku": "8tz4eBA6", "itemType": "CdAV53PG"}], "name": "UVIns7hM", "odds": 0.47176159002926954, "type": "PROBABILITY_GROUP", "weight": 75}, {"lootBoxItems": [{"count": 62, "duration": 35, "endDate": "1991-05-05T00:00:00Z", "itemId": "mjCBzVne", "itemSku": "KT1bWjGi", "itemType": "8cL1sFdP"}, {"count": 98, "duration": 24, "endDate": "1998-09-17T00:00:00Z", "itemId": "cRK8K9yf", "itemSku": "yw59romr", "itemType": "swDXxIhc"}, {"count": 0, "duration": 49, "endDate": "1989-06-12T00:00:00Z", "itemId": "1CZzURTG", "itemSku": "SRowf7bS", "itemType": "G43AagH0"}], "name": "a4MFJCsZ", "odds": 0.5981299804552899, "type": "REWARD_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 79, "duration": 59, "endDate": "1995-12-15T00:00:00Z", "itemId": "C2Ys1Pml", "itemSku": "2KrJhscv", "itemType": "QeJZgWP3"}, {"count": 81, "duration": 88, "endDate": "1992-11-07T00:00:00Z", "itemId": "bhYBfqz6", "itemSku": "iiC9O5nt", "itemType": "IDAJdQJj"}, {"count": 76, "duration": 64, "endDate": "1972-07-23T00:00:00Z", "itemId": "byyIbOqR", "itemSku": "Yffxivq6", "itemType": "HRc9Xvg8"}], "name": "EHH3S7BZ", "odds": 0.420203677823377, "type": "REWARD", "weight": 52}], "rollFunction": "DEFAULT"}, "maxCount": 84, "maxCountPerUser": 86, "name": "vpYUSgBE", "optionBoxConfig": {"boxItems": [{"count": 67, "duration": 63, "endDate": "1984-05-27T00:00:00Z", "itemId": "kVbLGkVB", "itemSku": "LVusIh3C", "itemType": "C3OmnxRy"}, {"count": 68, "duration": 61, "endDate": "1983-12-30T00:00:00Z", "itemId": "pIfhbXjo", "itemSku": "t2v3Y6bD", "itemType": "dkjaDMaZ"}, {"count": 78, "duration": 57, "endDate": "1974-08-06T00:00:00Z", "itemId": "IO8vAfpA", "itemSku": "iOHwKUO3", "itemType": "7lpEMcKN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 38, "fixedTrialCycles": 56, "graceDays": 12}, "regionData": {"peZ5vSQo": [{"currencyCode": "MGdtE8dJ", "currencyNamespace": "HjT0UB1N", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1973-09-21T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1997-09-15T00:00:00Z", "expireAt": "1975-09-27T00:00:00Z", "price": 68, "purchaseAt": "1996-01-08T00:00:00Z", "trialPrice": 83}, {"currencyCode": "juQe6bAt", "currencyNamespace": "cH2EmRhB", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1996-08-11T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1972-10-07T00:00:00Z", "expireAt": "1999-01-11T00:00:00Z", "price": 41, "purchaseAt": "1979-09-05T00:00:00Z", "trialPrice": 35}, {"currencyCode": "F4nXO6yc", "currencyNamespace": "8FJ0VcIR", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1991-01-01T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1981-09-19T00:00:00Z", "expireAt": "1976-06-30T00:00:00Z", "price": 23, "purchaseAt": "1995-04-30T00:00:00Z", "trialPrice": 29}], "NQOs3PgZ": [{"currencyCode": "9RwhHQmJ", "currencyNamespace": "fPAwppbE", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1989-12-12T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1999-03-23T00:00:00Z", "expireAt": "1996-11-18T00:00:00Z", "price": 4, "purchaseAt": "1973-04-05T00:00:00Z", "trialPrice": 50}, {"currencyCode": "ftO6C2C8", "currencyNamespace": "7SAuKY5Q", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1996-01-20T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-07-28T00:00:00Z", "expireAt": "1972-10-17T00:00:00Z", "price": 74, "purchaseAt": "1974-10-20T00:00:00Z", "trialPrice": 3}, {"currencyCode": "RL0Zdf0m", "currencyNamespace": "RMTSoKEf", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1987-06-01T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1971-05-02T00:00:00Z", "expireAt": "1987-06-28T00:00:00Z", "price": 0, "purchaseAt": "1972-10-20T00:00:00Z", "trialPrice": 80}], "2ZnPnVCv": [{"currencyCode": "Xu7UkSKg", "currencyNamespace": "oqyK81uc", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1984-01-17T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1974-02-09T00:00:00Z", "expireAt": "1982-12-31T00:00:00Z", "price": 40, "purchaseAt": "1996-04-30T00:00:00Z", "trialPrice": 31}, {"currencyCode": "H5gqvPyx", "currencyNamespace": "nxBj2w5b", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1978-10-09T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1980-08-18T00:00:00Z", "expireAt": "1984-10-08T00:00:00Z", "price": 78, "purchaseAt": "1978-09-03T00:00:00Z", "trialPrice": 97}, {"currencyCode": "aSzd4zR3", "currencyNamespace": "xpWfxuFk", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1980-09-04T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1993-07-18T00:00:00Z", "expireAt": "1971-05-26T00:00:00Z", "price": 92, "purchaseAt": "1975-07-30T00:00:00Z", "trialPrice": 45}]}, "saleConfig": {"currencyCode": "ODMXA1NW", "price": 75}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "PzXuiqqD", "stackable": false, "status": "ACTIVE", "tags": ["Ah2BKilU", "DC6yRBWO", "GxjliWcE"], "targetCurrencyCode": "n1TZtFL7", "targetNamespace": "YtThjHeC", "thumbnailUrl": "ijkyo5tC", "useCount": 99}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SnmWs0ah' \
    --appId 'G03fsa7q' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'DWtXBVYk' \
    --baseAppId 'Ob6C87lw' \
    --categoryPath 'OPA4o3O5' \
    --features 'bjcvKkps' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '47' \
    --offset '88' \
    --region 'dch6m4zI' \
    --sortBy 'createdAt:desc,createdAt' \
    --storeId 'UkoLg4nX' \
    --tags 'jjug1qHu' \
    --targetNamespace 'c36fNNb0' \
    > test.out 2>&1
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'AjIJs8U7,wqXTv957,uzzydo9L' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zRGSJZmf' \
    --itemIds 'fMYg7lIv' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'JzWmC9y1' \
    --sku 'PMkqD0Rd' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '9gK0DQZ9' \
    --populateBundle  \
    --region 'B0Y0nq3t' \
    --storeId 'KgqBCkTU' \
    --sku 'lNooQTZZ' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'gm28wqMa' \
    --region 'XC4AapOf' \
    --storeId 'cgDB2EXV' \
    --itemIds 'YjopeTM3' \
    --userId 'AhnosVCU' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zGSd0hSI' \
    --sku 'osxLRgKS' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '1cWzTsD6,2qBkpRyR,Lcgk4lIu' \
    --storeId 'ibRy0yrt' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'v9fC4Y3E' \
    --region 'okcIG6vv' \
    --storeId 'Nap8ciJ9' \
    --itemIds 'nuS4VeKL' \
    > test.out 2>&1
eval_tap $? 113 'BulkGetLocaleItems' test.out

#- 114 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetAvailablePredicateTypes' test.out

#- 115 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'lBnwipLl' \
    --userId 'lbhuRqzS' \
    --body '{"itemIds": ["LGZ8galB", "g6ixQh3h", "PH1o7zyO"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'enO7FJDw' \
    --body '{"changes": [{"itemIdentities": ["xKakQTgl", "JhwoS8yH", "xEFELmGc"], "itemIdentityType": "ITEM_ID", "regionData": {"QyKxO0xR": [{"currencyCode": "cobq9Byn", "currencyNamespace": "HYO05nKo", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1993-11-30T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1980-06-26T00:00:00Z", "discountedPrice": 90, "expireAt": "1975-06-10T00:00:00Z", "price": 6, "purchaseAt": "1975-12-09T00:00:00Z", "trialPrice": 91}, {"currencyCode": "7F2WSZvY", "currencyNamespace": "QlsILdAv", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1979-03-19T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1992-04-28T00:00:00Z", "discountedPrice": 3, "expireAt": "1987-08-24T00:00:00Z", "price": 82, "purchaseAt": "1978-04-15T00:00:00Z", "trialPrice": 29}, {"currencyCode": "dpqhrWSR", "currencyNamespace": "ri4KdTn4", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1974-01-23T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1985-03-24T00:00:00Z", "discountedPrice": 22, "expireAt": "1994-08-11T00:00:00Z", "price": 73, "purchaseAt": "1999-06-09T00:00:00Z", "trialPrice": 86}], "Vhd4T3d9": [{"currencyCode": "kqFmvK7o", "currencyNamespace": "3lFDhlRx", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1976-02-16T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1991-03-09T00:00:00Z", "discountedPrice": 29, "expireAt": "1994-03-05T00:00:00Z", "price": 3, "purchaseAt": "1997-09-08T00:00:00Z", "trialPrice": 0}, {"currencyCode": "2RmeYsp5", "currencyNamespace": "pucNMdmX", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1988-06-22T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1978-08-25T00:00:00Z", "discountedPrice": 68, "expireAt": "1972-07-06T00:00:00Z", "price": 99, "purchaseAt": "1987-04-09T00:00:00Z", "trialPrice": 18}, {"currencyCode": "13nbktY1", "currencyNamespace": "IvsLaUYN", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1996-10-09T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1979-08-06T00:00:00Z", "discountedPrice": 13, "expireAt": "1979-01-25T00:00:00Z", "price": 37, "purchaseAt": "1977-08-31T00:00:00Z", "trialPrice": 51}], "FKfUpWXN": [{"currencyCode": "S44ZNobS", "currencyNamespace": "v87E9sn3", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1977-03-27T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1997-08-29T00:00:00Z", "discountedPrice": 51, "expireAt": "1983-03-20T00:00:00Z", "price": 32, "purchaseAt": "1984-02-01T00:00:00Z", "trialPrice": 32}, {"currencyCode": "7N55mkCS", "currencyNamespace": "rd4oRhcg", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1975-07-15T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1992-04-17T00:00:00Z", "discountedPrice": 70, "expireAt": "1981-08-07T00:00:00Z", "price": 87, "purchaseAt": "1977-04-02T00:00:00Z", "trialPrice": 34}, {"currencyCode": "3os3kzEp", "currencyNamespace": "zmvFFxJ4", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1985-08-12T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1986-04-09T00:00:00Z", "discountedPrice": 74, "expireAt": "1972-04-21T00:00:00Z", "price": 81, "purchaseAt": "1976-06-12T00:00:00Z", "trialPrice": 86}]}}, {"itemIdentities": ["u9c5MOxO", "8lZfgQse", "hV5hmqkN"], "itemIdentityType": "ITEM_ID", "regionData": {"EDJdt3xo": [{"currencyCode": "S5SqasGh", "currencyNamespace": "spKMSg1B", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1989-12-17T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1972-08-21T00:00:00Z", "discountedPrice": 48, "expireAt": "1988-06-05T00:00:00Z", "price": 63, "purchaseAt": "1979-01-16T00:00:00Z", "trialPrice": 51}, {"currencyCode": "CV4UI3Lt", "currencyNamespace": "ZjB8JCBJ", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1982-12-13T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1991-09-01T00:00:00Z", "discountedPrice": 88, "expireAt": "1999-04-17T00:00:00Z", "price": 63, "purchaseAt": "1999-06-07T00:00:00Z", "trialPrice": 68}, {"currencyCode": "FS6Cuz4z", "currencyNamespace": "6KCRb66e", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1997-10-02T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1998-09-12T00:00:00Z", "discountedPrice": 65, "expireAt": "1980-12-18T00:00:00Z", "price": 33, "purchaseAt": "1992-03-05T00:00:00Z", "trialPrice": 58}], "VmDqqX8U": [{"currencyCode": "Sx6DFYN8", "currencyNamespace": "Ic5CzwVq", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1997-03-13T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1977-06-24T00:00:00Z", "discountedPrice": 44, "expireAt": "1974-07-09T00:00:00Z", "price": 58, "purchaseAt": "1997-10-15T00:00:00Z", "trialPrice": 77}, {"currencyCode": "rCRWH4H4", "currencyNamespace": "a7s7pZfJ", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1991-05-10T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1983-12-02T00:00:00Z", "discountedPrice": 20, "expireAt": "1985-02-13T00:00:00Z", "price": 1, "purchaseAt": "1971-05-14T00:00:00Z", "trialPrice": 53}, {"currencyCode": "MBgZoyud", "currencyNamespace": "QmRGEXZK", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1984-06-12T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1973-06-23T00:00:00Z", "discountedPrice": 93, "expireAt": "1993-03-23T00:00:00Z", "price": 4, "purchaseAt": "1980-09-30T00:00:00Z", "trialPrice": 46}], "BHSPD0UH": [{"currencyCode": "0g7Vp69c", "currencyNamespace": "GwFsPWjZ", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1994-11-18T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1974-12-04T00:00:00Z", "discountedPrice": 72, "expireAt": "1989-03-28T00:00:00Z", "price": 80, "purchaseAt": "1980-02-11T00:00:00Z", "trialPrice": 97}, {"currencyCode": "Jn375br4", "currencyNamespace": "cjnspoIZ", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1975-06-01T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1978-03-05T00:00:00Z", "discountedPrice": 63, "expireAt": "1996-08-02T00:00:00Z", "price": 32, "purchaseAt": "1979-11-30T00:00:00Z", "trialPrice": 20}, {"currencyCode": "RhvnkyDr", "currencyNamespace": "3S8PLt2K", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1994-08-03T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1976-12-27T00:00:00Z", "discountedPrice": 48, "expireAt": "1985-01-29T00:00:00Z", "price": 49, "purchaseAt": "1996-08-26T00:00:00Z", "trialPrice": 8}]}}, {"itemIdentities": ["6iF8BHmc", "EZsKIR0z", "ZHIrvExZ"], "itemIdentityType": "ITEM_SKU", "regionData": {"xlasqHwB": [{"currencyCode": "auFBjj8t", "currencyNamespace": "HcruQNWK", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1998-07-28T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1977-08-03T00:00:00Z", "discountedPrice": 12, "expireAt": "1977-08-11T00:00:00Z", "price": 34, "purchaseAt": "1976-05-26T00:00:00Z", "trialPrice": 43}, {"currencyCode": "8krydaJP", "currencyNamespace": "uzCk0Kif", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1994-01-15T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-05-15T00:00:00Z", "discountedPrice": 68, "expireAt": "1990-08-26T00:00:00Z", "price": 73, "purchaseAt": "1999-09-25T00:00:00Z", "trialPrice": 65}, {"currencyCode": "wxawjyb7", "currencyNamespace": "W3Dhb8LP", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1975-03-17T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1978-12-09T00:00:00Z", "discountedPrice": 87, "expireAt": "1979-07-19T00:00:00Z", "price": 77, "purchaseAt": "1989-07-27T00:00:00Z", "trialPrice": 26}], "POO5rcJv": [{"currencyCode": "3ptxwHlq", "currencyNamespace": "2pSRhgKu", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1986-12-13T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1983-11-23T00:00:00Z", "discountedPrice": 54, "expireAt": "1978-11-02T00:00:00Z", "price": 13, "purchaseAt": "1971-01-23T00:00:00Z", "trialPrice": 69}, {"currencyCode": "FxFgD5Sr", "currencyNamespace": "dYyqVanw", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1985-07-01T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1977-01-12T00:00:00Z", "discountedPrice": 59, "expireAt": "1990-11-28T00:00:00Z", "price": 52, "purchaseAt": "1988-05-16T00:00:00Z", "trialPrice": 29}, {"currencyCode": "Bu7phtGN", "currencyNamespace": "wBExnqxj", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1975-08-03T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1971-03-11T00:00:00Z", "discountedPrice": 13, "expireAt": "1980-04-30T00:00:00Z", "price": 42, "purchaseAt": "1992-11-02T00:00:00Z", "trialPrice": 1}], "Umc0r3eZ": [{"currencyCode": "DHTi75G4", "currencyNamespace": "VD9AE0WI", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1978-12-23T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1974-02-22T00:00:00Z", "discountedPrice": 30, "expireAt": "1972-02-01T00:00:00Z", "price": 21, "purchaseAt": "1973-01-22T00:00:00Z", "trialPrice": 95}, {"currencyCode": "Ugo6NVQp", "currencyNamespace": "0bHbe0go", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1973-04-14T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1997-09-04T00:00:00Z", "discountedPrice": 69, "expireAt": "1979-09-11T00:00:00Z", "price": 6, "purchaseAt": "1984-07-02T00:00:00Z", "trialPrice": 92}, {"currencyCode": "Bxmew7X0", "currencyNamespace": "cB51gHLT", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1971-06-13T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1983-10-06T00:00:00Z", "discountedPrice": 29, "expireAt": "1984-12-26T00:00:00Z", "price": 74, "purchaseAt": "1972-10-30T00:00:00Z", "trialPrice": 81}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '44' \
    --offset '53' \
    --sortBy '0jZ7d9xI' \
    --storeId 'yqUzaNAH' \
    --keyword 'FaeT0fBO' \
    --language 'XZ0tRMZw' \
    > test.out 2>&1
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '84' \
    --offset '40' \
    --sortBy 'displayOrder:asc,name:desc,updatedAt' \
    --storeId 'SxedjixM' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'NzMzNJ2f' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yuk2lV0h' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'TDY8gsEX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ztXLp4gD' \
    --body '{"appId": "vk6IB8yJ", "appType": "DEMO", "baseAppId": "XkSJmIFU", "boothName": "TCw2mE0T", "categoryPath": "Bl0odZ1k", "clazz": "G3uY0Mbb", "displayOrder": 83, "entitlementType": "CONSUMABLE", "ext": {"9alQVOJd": {}, "fhU3aLGP": {}, "FTb0SYOR": {}}, "features": ["gZyQEmTe", "7nFFoEpQ", "4z1AxUAx"], "flexible": true, "images": [{"as": "1yrTm7NW", "caption": "K3GSY1uO", "height": 23, "imageUrl": "zVmn4JQM", "smallImageUrl": "ByXb5wh3", "width": 88}, {"as": "VCSmcgdf", "caption": "5q5okdjs", "height": 63, "imageUrl": "tMfepqqf", "smallImageUrl": "KNza44cx", "width": 21}, {"as": "9pkWhNHd", "caption": "6zCpLPC2", "height": 14, "imageUrl": "7RgB8OVx", "smallImageUrl": "zhVqNyLQ", "width": 3}], "inventoryConfig": {"customAttributes": {"Bkm8Qv2n": {}, "8jGMyh9c": {}, "mWp4aKeb": {}}, "serverCustomAttributes": {"xVMC94E0": {}, "LGGumVKG": {}, "yeUOOVzS": {}}, "slotUsed": 36}, "itemIds": ["5N7efonn", "KiyeYUEI", "c2cvtFX4"], "itemQty": {"sF5xiJG9": 7, "K1mgu63d": 52, "QDFq7kN7": 58}, "itemType": "APP", "listable": false, "localizations": {"Sr8pxeD4": {"description": "2GBUTYVP", "localExt": {"Ku1uCDcV": {}, "skSPRuxj": {}, "usNM5HD3": {}}, "longDescription": "14pQmfRH", "title": "n7mwXQXZ"}, "Ec4U380j": {"description": "0Mkefc6P", "localExt": {"YbPREbHx": {}, "PdZIuova": {}, "hjWMtLv8": {}}, "longDescription": "Zas7502s", "title": "tGEn4g36"}, "ANMwT4ff": {"description": "xP6TvwyU", "localExt": {"pkOIx8Ez": {}, "giDcPpNp": {}, "KwRSEW3e": {}}, "longDescription": "mlj0CVFA", "title": "hEEZ5RV5"}}, "lootBoxConfig": {"rewardCount": 85, "rewards": [{"lootBoxItems": [{"count": 67, "duration": 61, "endDate": "1978-04-27T00:00:00Z", "itemId": "XAgrLuI3", "itemSku": "lhoY5u4g", "itemType": "7odEPlXM"}, {"count": 90, "duration": 59, "endDate": "1986-11-01T00:00:00Z", "itemId": "qaA3hvOT", "itemSku": "1TVehoZc", "itemType": "yBLhGv6Z"}, {"count": 39, "duration": 78, "endDate": "1988-06-03T00:00:00Z", "itemId": "V81JS5GY", "itemSku": "LZRR1Ec2", "itemType": "hJ05L33z"}], "name": "CE6SDcsG", "odds": 0.6359239138430925, "type": "REWARD", "weight": 76}, {"lootBoxItems": [{"count": 96, "duration": 88, "endDate": "1971-04-19T00:00:00Z", "itemId": "ItaDf50q", "itemSku": "TogdYczd", "itemType": "qHogR9pL"}, {"count": 71, "duration": 49, "endDate": "1999-01-03T00:00:00Z", "itemId": "yytdb06Z", "itemSku": "Y1csqIbC", "itemType": "nJM9kjPT"}, {"count": 26, "duration": 93, "endDate": "1978-07-14T00:00:00Z", "itemId": "6wfH7WhS", "itemSku": "56YcBo8h", "itemType": "ZDZdy3hd"}], "name": "NYxhDddz", "odds": 0.9679751784853345, "type": "REWARD_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 21, "duration": 27, "endDate": "1990-09-17T00:00:00Z", "itemId": "ZfMSq46z", "itemSku": "qLe9SPNG", "itemType": "IcWcvWtg"}, {"count": 27, "duration": 95, "endDate": "1992-05-25T00:00:00Z", "itemId": "ZX8lx5gm", "itemSku": "VuZi44Gd", "itemType": "CsqayPlk"}, {"count": 25, "duration": 90, "endDate": "1998-09-14T00:00:00Z", "itemId": "tTQzjsGR", "itemSku": "6xDKVVhi", "itemType": "rj4i53yE"}], "name": "2FUa28T6", "odds": 0.5454578632374703, "type": "REWARD_GROUP", "weight": 17}], "rollFunction": "DEFAULT"}, "maxCount": 14, "maxCountPerUser": 45, "name": "hCjYZysA", "optionBoxConfig": {"boxItems": [{"count": 37, "duration": 100, "endDate": "1979-09-19T00:00:00Z", "itemId": "7vQb4aQe", "itemSku": "qAnbwstq", "itemType": "oifsZKpL"}, {"count": 31, "duration": 81, "endDate": "1974-06-01T00:00:00Z", "itemId": "BXEBXFpp", "itemSku": "8keh1chH", "itemType": "mZo5Qe4C"}, {"count": 41, "duration": 27, "endDate": "1998-09-16T00:00:00Z", "itemId": "JRIbUeaG", "itemSku": "TecTB5wU", "itemType": "nX7DhLjp"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 45, "fixedTrialCycles": 94, "graceDays": 56}, "regionData": {"V2FMX4Aa": [{"currencyCode": "4buz7YcT", "currencyNamespace": "aqQxk3yS", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1986-09-06T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1971-02-17T00:00:00Z", "expireAt": "1983-05-19T00:00:00Z", "price": 14, "purchaseAt": "1991-03-31T00:00:00Z", "trialPrice": 8}, {"currencyCode": "Tg08Zomc", "currencyNamespace": "eJj6L2KQ", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1990-11-08T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1982-09-09T00:00:00Z", "expireAt": "1971-10-29T00:00:00Z", "price": 47, "purchaseAt": "1996-03-09T00:00:00Z", "trialPrice": 9}, {"currencyCode": "GFkAUEw0", "currencyNamespace": "FFn6H48R", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1981-02-13T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1983-03-06T00:00:00Z", "expireAt": "1976-05-11T00:00:00Z", "price": 98, "purchaseAt": "1981-08-22T00:00:00Z", "trialPrice": 56}], "fEnHii76": [{"currencyCode": "7q6vzqLD", "currencyNamespace": "KDMjirU6", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1972-12-05T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1989-08-13T00:00:00Z", "expireAt": "1996-08-04T00:00:00Z", "price": 21, "purchaseAt": "1984-07-27T00:00:00Z", "trialPrice": 37}, {"currencyCode": "3RJU7lyT", "currencyNamespace": "IWh36pF9", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1974-01-16T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1987-04-16T00:00:00Z", "expireAt": "1986-07-06T00:00:00Z", "price": 4, "purchaseAt": "1972-06-12T00:00:00Z", "trialPrice": 20}, {"currencyCode": "GGeA7XOp", "currencyNamespace": "HB86TDb4", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1984-11-05T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1976-07-29T00:00:00Z", "expireAt": "1988-07-29T00:00:00Z", "price": 30, "purchaseAt": "1998-06-01T00:00:00Z", "trialPrice": 54}], "lGOXOn7P": [{"currencyCode": "nCZeWMju", "currencyNamespace": "bDpJBSg3", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1996-01-21T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1985-08-31T00:00:00Z", "expireAt": "1990-08-15T00:00:00Z", "price": 83, "purchaseAt": "1988-06-19T00:00:00Z", "trialPrice": 79}, {"currencyCode": "TQkIe03S", "currencyNamespace": "hJWsqijf", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1992-10-31T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1986-09-19T00:00:00Z", "expireAt": "1994-08-13T00:00:00Z", "price": 63, "purchaseAt": "1996-12-19T00:00:00Z", "trialPrice": 85}, {"currencyCode": "V11NaRee", "currencyNamespace": "sASaIT4c", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1979-02-01T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1979-12-27T00:00:00Z", "expireAt": "1977-11-16T00:00:00Z", "price": 46, "purchaseAt": "1986-03-05T00:00:00Z", "trialPrice": 85}]}, "saleConfig": {"currencyCode": "F85lDA7b", "price": 60}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "ukJiy3Ub", "stackable": false, "status": "ACTIVE", "tags": ["pjUkAzzw", "y72J8P7d", "dMb1EqZu"], "targetCurrencyCode": "cGa955eb", "targetNamespace": "wSpOQvWa", "thumbnailUrl": "dZoO88fb", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'YZ1CYnAz' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'Eifn308F' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '5Bjmc2df' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 24, "orderNo": "FBqefUYS"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'cITbCI6S' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2sn2F8I9' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'SjoSoOa0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'REVDarEV' \
    --body '{"carousel": [{"alt": "vLZFkPvG", "previewUrl": "icIGN8m5", "thumbnailUrl": "wCSnSAg2", "type": "video", "url": "MRRFsVHz", "videoSource": "youtube"}, {"alt": "pHEC9zi4", "previewUrl": "3wqyEmV3", "thumbnailUrl": "65ONzm96", "type": "video", "url": "gjHHb3q4", "videoSource": "vimeo"}, {"alt": "mCknyJ7H", "previewUrl": "M1EJVzBY", "thumbnailUrl": "7PZpSbkQ", "type": "video", "url": "H8LjJrdE", "videoSource": "youtube"}], "developer": "1AWbKpyl", "forumUrl": "lK7Nb7X9", "genres": ["Casual", "Casual", "Adventure"], "localizations": {"t8XxNhEN": {"announcement": "8uoj18pm", "slogan": "bMgaNZ2T"}, "xCjZYmpK": {"announcement": "uMbZv2Tw", "slogan": "YhabfD4l"}, "P5TshPiW": {"announcement": "uZl8QygV", "slogan": "XJxRKqRt"}}, "platformRequirements": {"4ELWCPBQ": [{"additionals": "7f82jVKv", "directXVersion": "kuV7XsVG", "diskSpace": "NGT3CWwp", "graphics": "NIhMcuvh", "label": "rHlXUJif", "osVersion": "ut2zXP35", "processor": "ISaexmYB", "ram": "EjdLdZsg", "soundCard": "PxEXZhnk"}, {"additionals": "2DioZRci", "directXVersion": "MdFD3M6t", "diskSpace": "pBiyNTpP", "graphics": "NqGJjlkt", "label": "XdSbJA9s", "osVersion": "JqfnBx94", "processor": "N8qcG3J9", "ram": "fNuy3OCe", "soundCard": "tirBnpFk"}, {"additionals": "lca6tar8", "directXVersion": "pd2BHzfb", "diskSpace": "fpNGxWIA", "graphics": "x7u4QZt6", "label": "E7OCr94x", "osVersion": "lbe1qcbj", "processor": "XCeTz1PR", "ram": "0G5NINFO", "soundCard": "VB5yUY6V"}], "hKXNJDLt": [{"additionals": "RLvC1u7z", "directXVersion": "WiUf93gj", "diskSpace": "36Mwx0LL", "graphics": "wkDpSioL", "label": "ir4y014V", "osVersion": "lQBJkXUu", "processor": "4h99kAx2", "ram": "90F6vrS0", "soundCard": "8ZVYVoSC"}, {"additionals": "3NzgiswN", "directXVersion": "7fK8U6bh", "diskSpace": "R7Qrw1Wi", "graphics": "xZrbhjhc", "label": "UnPHSxQD", "osVersion": "6UjFiQf7", "processor": "H1DAwbwC", "ram": "5UVK5vsg", "soundCard": "Ril27tBC"}, {"additionals": "VqJbwFRD", "directXVersion": "am02K0Ts", "diskSpace": "IDn3Dofw", "graphics": "bBnVl3Nl", "label": "yhY5geK3", "osVersion": "NLb6Cuzi", "processor": "uXt041H6", "ram": "pj0kfRZU", "soundCard": "Pad1zbLQ"}], "AuRlyRWC": [{"additionals": "pAekU7ce", "directXVersion": "flAqP2Ph", "diskSpace": "63uFd6Tp", "graphics": "zruOA3lt", "label": "l66bjmyD", "osVersion": "xabiGKIX", "processor": "PGOggJDo", "ram": "EwRuzWmn", "soundCard": "27XBQkp3"}, {"additionals": "0bMtQlXQ", "directXVersion": "dz4KsPcj", "diskSpace": "pETPEEwj", "graphics": "0kT1Cd4R", "label": "OjSEO6tT", "osVersion": "TkSrNOWv", "processor": "LWEm2KZe", "ram": "mtcEhIaT", "soundCard": "SirDo1ZG"}, {"additionals": "kuapux7Q", "directXVersion": "8vkyotUG", "diskSpace": "joaXlyHO", "graphics": "swKtyx8H", "label": "I9JKjx1u", "osVersion": "WOYj79XG", "processor": "5Ukda5LR", "ram": "bIYOwE66", "soundCard": "IqBJcBoe"}]}, "platforms": ["MacOS", "MacOS", "Windows"], "players": ["CrossPlatformMulti", "Single", "MMO"], "primaryGenre": "MassivelyMultiplayer", "publisher": "LEsWMEXH", "releaseDate": "1990-04-15T00:00:00Z", "websiteUrl": "M52LsGaJ"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'yHE5EHKN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xVRxUjEN' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '1tnxSz8p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'jRARvf5Q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ibqxXHYE' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'vlNf5kg7' \
    --itemId 'xk5L1nuv' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZpXVFZF4' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'iNzYhgxm' \
    --itemId 'poLFbfp3' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2s8Sa2Og' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '1iNbJqHt' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ImFjhByV' \
    --populateBundle  \
    --region 'lJmGd10C' \
    --storeId 'ok4ujGc2' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'irG0vYe1' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3PvWgKhY' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 68, "comparison": "isLessThan", "name": "RjFD5KDX", "predicateType": "SeasonPassPredicate", "value": "1IA2662l", "values": ["oDqKkaUE", "kzyjvh7z", "NtSejffA"]}, {"anyOf": 7, "comparison": "isGreaterThan", "name": "c1rsumXi", "predicateType": "SeasonTierPredicate", "value": "T1U7kQbC", "values": ["Ug60FsMK", "XUqoOhCW", "gJrxLzRb"]}, {"anyOf": 31, "comparison": "isNot", "name": "jxrMKrRP", "predicateType": "SeasonTierPredicate", "value": "40IcPw8t", "values": ["iRj9HSI4", "k35ZpRhP", "PFQAbab6"]}]}, {"operator": "and", "predicates": [{"anyOf": 14, "comparison": "is", "name": "meswcs3G", "predicateType": "EntitlementPredicate", "value": "Tjq5BKI9", "values": ["Inaz3cGP", "ZONyS2JS", "JI9AYNV3"]}, {"anyOf": 73, "comparison": "is", "name": "pHAzzxsZ", "predicateType": "EntitlementPredicate", "value": "QiY2Ia5o", "values": ["SlFNaT1x", "PDoQgc24", "lIxQOcTf"]}, {"anyOf": 61, "comparison": "isLessThan", "name": "KUDzCW6E", "predicateType": "SeasonPassPredicate", "value": "j1YVaFab", "values": ["db6d0BSO", "VAsrJew3", "vdVklYnY"]}]}, {"operator": "or", "predicates": [{"anyOf": 64, "comparison": "isGreaterThanOrEqual", "name": "SKs8rznx", "predicateType": "SeasonTierPredicate", "value": "vQKybZgi", "values": ["agLxU0wZ", "AS9m22Nj", "DVRJ1Jy8"]}, {"anyOf": 87, "comparison": "isLessThanOrEqual", "name": "7tLkpgZQ", "predicateType": "SeasonTierPredicate", "value": "WNOfva3r", "values": ["mX5W1xHW", "riiM48Xc", "TfHMNghQ"]}, {"anyOf": 67, "comparison": "isLessThanOrEqual", "name": "gvZQqKWx", "predicateType": "SeasonTierPredicate", "value": "s0UgPXAf", "values": ["N6m1KzgW", "puItGycH", "BIq8PnVM"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'hB7R59fK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "X6utXu95"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --name 'EGZctc0l' \
    --offset '35' \
    --tag 'LVbZabHp' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Ntea9pcY", "name": "G90XwX1u", "status": "INACTIVE", "tags": ["uR9VlLBC", "vVscb96y", "gTO36jVC"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '31tVFY5L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'LD9dTyNf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TFGC1tGk", "name": "QMiRiUgS", "status": "ACTIVE", "tags": ["hUmIa0qe", "f7Wqoy7U", "K3QSqYRT"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'HeRKPskF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'NWWrIhCZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '21' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'msdTMJuy' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'zNJUOzNA' \
    --limit '65' \
    --offset '42' \
    --orderNos 'ITIkj4tv,DjRN79x4,tJPjGkXf' \
    --sortBy 'pSpBuqVh' \
    --startTime 'PnVg6AKm' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 141 'QueryOrders' test.out

#- 142 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetOrderStatistics' test.out

#- 143 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xEfmZXfc' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QkXDvcMY' \
    --body '{"description": "6iqFwBCt"}' \
    > test.out 2>&1
eval_tap $? 144 'RefundOrder' test.out

#- 145 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetPaymentCallbackConfig' test.out

#- 146 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "zS2nPn5A", "privateKey": "PzQ5Z6Lq"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'neQ1EwFb' \
    --externalId 'smivC1G3' \
    --limit '11' \
    --notificationSource 'ALIPAY' \
    --notificationType 'xxJQgIbU' \
    --offset '51' \
    --paymentOrderNo 'dzhXJNIE' \
    --startDate '7Q9In87h' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'nbRiSuDI' \
    --limit '29' \
    --offset '64' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "hlCP8rir", "currencyNamespace": "N8HyiT2d", "customParameters": {"cR89OtCY": {}, "C8O2jaWE": {}, "rnN9sXvS": {}}, "description": "6NdlNLJs", "extOrderNo": "xYLFWJGK", "extUserId": "mJRBuoLj", "itemType": "SEASON", "language": "xGT-gXdd", "metadata": {"Am8iVTkz": "YYWmnJRP", "KbsVs5sL": "I7rywFt3", "TTEVecrE": "e0lehPNL"}, "notifyUrl": "wE1q6KBS", "omitNotification": false, "platform": "kB42tNMW", "price": 97, "recurringPaymentOrderNo": "gx7oWUnE", "region": "NlLJ4SkL", "returnUrl": "rg12hUpz", "sandbox": true, "sku": "Hz4Wrs7a", "subscriptionId": "fGWyDqJR", "targetNamespace": "hSDYCgPD", "targetUserId": "VQulzXY7", "title": "IXB6lPZd"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'LIilR5rP' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wJlubqaF' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'InoQh3O1' \
    --body '{"extTxId": "QNE7anE1", "paymentMethod": "S4C3UbgA", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wKiudWSx' \
    --body '{"description": "SQJyzdeW"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KipebNG6' \
    --body '{"amount": 64, "currencyCode": "WwEnWGUM", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 52, "vat": 96}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iG9HBOqo' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["Other", "Oculus", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePlatformEntitlementConfig' test.out

#- 158 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformWalletConfig' test.out

#- 159 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Steam", "Nintendo", "Other"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformWalletConfig' test.out

#- 160 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 160 'ResetPlatformWalletConfig' test.out

#- 161 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetRevocationConfig' test.out

#- 162 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateRevocationConfig' test.out

#- 163 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeleteRevocationConfig' test.out

#- 164 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'osRznvvu' \
    --limit '0' \
    --offset '93' \
    --source 'OTHER' \
    --startTime 'XJi1QkHp' \
    --status 'SUCCESS' \
    --transactionId 'QETW7l0Z' \
    --userId 'YAk2QLVG' \
    > test.out 2>&1
eval_tap $? 164 'QueryRevocationHistories' test.out

#- 165 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'GetRevocationPluginConfig' test.out

#- 166 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "HYmQQQls"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "S2H7crpj"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 166 'UpdateRevocationPluginConfig' test.out

#- 167 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'DeleteRevocationPluginConfig' test.out

#- 168 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 168 'UploadRevocationPluginConfigCert' test.out

#- 169 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3FEzXQGs", "eventTopic": "W3lYPO3i", "maxAwarded": 8, "maxAwardedPerUser": 11, "namespaceExpression": "y8E9POWg", "rewardCode": "jLxXUx6w", "rewardConditions": [{"condition": "tKmf2B3z", "conditionName": "twkHidgF", "eventName": "z8JNx6Fo", "rewardItems": [{"duration": 26, "endDate": "1972-11-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZbejBn6t", "quantity": 35, "sku": "vL5ECc0U"}, {"duration": 43, "endDate": "1971-02-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CRUjmugN", "quantity": 22, "sku": "FhPgqeIr"}, {"duration": 49, "endDate": "1982-10-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jn3UQ8v7", "quantity": 73, "sku": "PlOKbJbW"}]}, {"condition": "7Yf7H6qL", "conditionName": "6Zdg5L5r", "eventName": "1zsGFuqT", "rewardItems": [{"duration": 32, "endDate": "1996-08-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TEEfCsT5", "quantity": 91, "sku": "Y3ss3Ouc"}, {"duration": 74, "endDate": "1992-12-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "C50T60et", "quantity": 41, "sku": "288LtrWW"}, {"duration": 28, "endDate": "1972-01-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "EaKJW2Ze", "quantity": 58, "sku": "8pZJIZgH"}]}, {"condition": "8gDmdzfe", "conditionName": "oTcPGYLe", "eventName": "pBJYILtX", "rewardItems": [{"duration": 58, "endDate": "1980-06-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CMTZ6XyQ", "quantity": 13, "sku": "9I7RPBBc"}, {"duration": 10, "endDate": "1976-08-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jJ26rBnR", "quantity": 55, "sku": "KjulLZuX"}, {"duration": 36, "endDate": "1999-12-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "CZuRDk3O", "quantity": 43, "sku": "FMXFwY3j"}]}], "userIdExpression": "yxjkDBPO"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'b6xdSMB7' \
    --limit '4' \
    --offset '18' \
    --sortBy 'rewardCode,rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 170 'QueryRewards' test.out

#- 171 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'ExportRewards' test.out

#- 172 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 172 'ImportRewards' test.out

#- 173 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'soiCubVk' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Bqyod9KY' \
    --body '{"description": "ZOwEdDtW", "eventTopic": "SPg5LNbP", "maxAwarded": 43, "maxAwardedPerUser": 44, "namespaceExpression": "eLds1zts", "rewardCode": "iVEJmgH1", "rewardConditions": [{"condition": "Ed7X2eBI", "conditionName": "2YOblJc4", "eventName": "pw36OXuE", "rewardItems": [{"duration": 37, "endDate": "1988-09-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "vO4NfyAr", "quantity": 65, "sku": "l4LRb4RV"}, {"duration": 42, "endDate": "1989-09-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ExCDko6T", "quantity": 86, "sku": "ntbs0i3m"}, {"duration": 83, "endDate": "1973-05-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "UlhMBw9c", "quantity": 48, "sku": "hL1CGjc7"}]}, {"condition": "UyNmH2DE", "conditionName": "ztQOWkEQ", "eventName": "d4iQJe8q", "rewardItems": [{"duration": 99, "endDate": "1999-07-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NnUgCwtg", "quantity": 86, "sku": "BS45m9Oh"}, {"duration": 93, "endDate": "1992-08-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "yugz4ufw", "quantity": 43, "sku": "GYkAe5Mx"}, {"duration": 73, "endDate": "1988-05-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qSskJJ3y", "quantity": 69, "sku": "Xif2s6P1"}]}, {"condition": "VuOAbjuM", "conditionName": "cY1oHIWT", "eventName": "9Ywo3V5q", "rewardItems": [{"duration": 31, "endDate": "1983-03-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "YIKuRqSO", "quantity": 67, "sku": "uUrgDx5B"}, {"duration": 29, "endDate": "1983-10-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "VTBozyTa", "quantity": 73, "sku": "VMxsFwO6"}, {"duration": 63, "endDate": "1986-07-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "3PQdVmmj", "quantity": 41, "sku": "wg8o9T4L"}]}], "userIdExpression": "He1zs7iH"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'm61FeoJS' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'wF4vv7U8' \
    --body '{"payload": {"fBtddzTP": {}, "rxo5LsIp": {}, "h7hbsmOg": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WO7ql50V' \
    --body '{"conditionName": "QOrs3GN4", "userId": "OUBQ1vVL"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'bj4R7Ea2' \
    --limit '30' \
    --offset '37' \
    --start 'Gn0UT6mB' \
    --storeId 'kbt9oQer' \
    --viewId 'KrMAEQja' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fP1VJ2U4' \
    --body '{"active": false, "displayOrder": 37, "endDate": "1978-06-30T00:00:00Z", "ext": {"2ErLpBcl": {}, "8VwAkpHU": {}, "qUZRgYtY": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 29, "itemCount": 71, "rule": "SEQUENCE"}, "items": [{"id": "CDo9DUJ2", "sku": "DMJUZYe4"}, {"id": "sG4l96Jk", "sku": "dsPgIr9M"}, {"id": "yToJAy1f", "sku": "hvJTzoo9"}], "localizations": {"yxGEhVF5": {"description": "15XhXgbx", "localExt": {"Q261Ehgw": {}, "91utllji": {}, "9gV3wsoG": {}}, "longDescription": "sGyvLQak", "title": "rKvGHczJ"}, "MGyOlgkm": {"description": "3G6KnlO9", "localExt": {"U74TkNAU": {}, "raKmEeSd": {}, "0m4hpIbe": {}}, "longDescription": "cw6unXl6", "title": "rMn3546n"}, "WbuTHoWG": {"description": "UCsDkMp9", "localExt": {"PSaPfaL1": {}, "OyNMW0xD": {}, "WeVRofl4": {}}, "longDescription": "CQ8UBslj", "title": "tSoQqoqN"}}, "name": "4cWfVq0r", "rotationType": "CUSTOM", "startDate": "1990-04-28T00:00:00Z", "viewId": "PLKJKWOj"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OtxOV2JJ' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '7NsT4WFY' \
    --storeId 'fLYnyqA9' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'deNt96Fa' \
    --storeId 'iCdO16oe' \
    --body '{"active": false, "displayOrder": 86, "endDate": "1993-03-24T00:00:00Z", "ext": {"291nzmKA": {}, "TruVPGoL": {}, "waaiO3H3": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 96, "itemCount": 26, "rule": "SEQUENCE"}, "items": [{"id": "Tkmgv4u6", "sku": "fvrK76Gl"}, {"id": "nOiNyIgo", "sku": "BflnM2mC"}, {"id": "8UGqHgph", "sku": "wK12hWoU"}], "localizations": {"4Ir2qqxT": {"description": "QGtdsWyN", "localExt": {"pBoSFsHH": {}, "Di8e4SPQ": {}, "xebCKhbN": {}}, "longDescription": "04PCOuUN", "title": "qQUPGypz"}, "oMHGKhHH": {"description": "8Fi2Y4WP", "localExt": {"cjzGEcAa": {}, "VmRvUoWK": {}, "EC7bLjSJ": {}}, "longDescription": "qkS2kT6f", "title": "ECksRkEp"}, "aWzQXS7m": {"description": "9KJVHG1I", "localExt": {"4MRtq6me": {}, "YLZo5mQP": {}, "sYQM8RCp": {}}, "longDescription": "5kUOqfKV", "title": "ciW2w9QX"}}, "name": "PEgEreXH", "rotationType": "FIXED_PERIOD", "startDate": "1976-03-04T00:00:00Z", "viewId": "vv9OimBL"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'bJoaNUFZ' \
    --storeId '8gNJqvRV' \
    > test.out 2>&1
eval_tap $? 183 'DeleteSection' test.out

#- 184 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'ListStores' test.out

#- 185 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "DQO1lqki", "defaultRegion": "LCiy6aWC", "description": "jLroJmHu", "supportedLanguages": ["F2YB2u6g", "eH3Y5fRX", "Jdhn0OgV"], "supportedRegions": ["yJ1brYKn", "DJowdSpt", "T0DlfGar"], "title": "nyO7Fr6Z"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 186 'GetCatalogDefinition' test.out

#- 187 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 187 'DownloadCSVTemplates' test.out

#- 188 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["RoDQIzo6", "iKZBzrZ3", "grVkxV1M"], "idsToBeExported": ["8OklVuaH", "Of8kjVvs", "czUojxuQ"], "storeId": "iiBDFnvb"}' \
    > test.out 2>&1
eval_tap $? 188 'ExportStoreByCSV' test.out

#- 189 ImportStore
eval_tap 0 189 'ImportStore # SKIP deprecated' test.out

#- 190 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'GetPublishedStore' test.out

#- 191 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 191 'DeletePublishedStore' test.out

#- 192 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetPublishedStoreBackup' test.out

#- 193 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'RollbackPublishedStore' test.out

#- 194 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kcxhaJit' \
    > test.out 2>&1
eval_tap $? 194 'GetStore' test.out

#- 195 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Bm1EjKFn' \
    --body '{"defaultLanguage": "4PXTFgs6", "defaultRegion": "s9PNmutQ", "description": "D2Ifopip", "supportedLanguages": ["c7rDTPk5", "7MsjdDUE", "6PPn01XQ"], "supportedRegions": ["bMKrHaDs", "5zLJ44n2", "uvU4M2nW"], "title": "Lih8a9BQ"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateStore' test.out

#- 196 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZPGaM5QW' \
    > test.out 2>&1
eval_tap $? 196 'DeleteStore' test.out

#- 197 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kYq5UYAe' \
    --action 'CREATE' \
    --itemSku 'c2eafADx' \
    --itemType 'COINS' \
    --limit '58' \
    --offset '99' \
    --selected  \
    --sortBy 'createdAt,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'q8O1vGPA' \
    --updatedAtStart 'j2K8KVIu' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 197 'QueryChanges' test.out

#- 198 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AXeF07VK' \
    > test.out 2>&1
eval_tap $? 198 'PublishAll' test.out

#- 199 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HUUQDGoz' \
    > test.out 2>&1
eval_tap $? 199 'PublishSelected' test.out

#- 200 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UFlbNQzH' \
    > test.out 2>&1
eval_tap $? 200 'SelectAllRecords' test.out

#- 201 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NqLlw9Yd' \
    --action 'UPDATE' \
    --itemSku '8ztmDPzL' \
    --itemType 'COINS' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd 'XbCYt2qw' \
    --updatedAtStart 'BXRyiXBY' \
    > test.out 2>&1
eval_tap $? 201 'SelectAllRecordsByCriteria' test.out

#- 202 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AsrUY2gW' \
    --action 'DELETE' \
    --itemSku 'bFG6jWYx' \
    --itemType 'MEDIA' \
    --type 'CATEGORY' \
    --updatedAtEnd 'FkJA1V2Z' \
    --updatedAtStart 'F9HXeD2Q' \
    > test.out 2>&1
eval_tap $? 202 'GetStatistic' test.out

#- 203 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '6XQvHqfC' \
    > test.out 2>&1
eval_tap $? 203 'UnselectAllRecords' test.out

#- 204 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'uK2Rc11L' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4PVOKvoH' \
    > test.out 2>&1
eval_tap $? 204 'SelectRecord' test.out

#- 205 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'JCI1IOU8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NAYnbhMo' \
    > test.out 2>&1
eval_tap $? 205 'UnselectRecord' test.out

#- 206 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uii8Yahj' \
    --targetStoreId '33SeRlci' \
    > test.out 2>&1
eval_tap $? 206 'CloneStore' test.out

#- 207 ExportStore
eval_tap 0 207 'ExportStore # SKIP deprecated' test.out

#- 208 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wPs6FOXq' \
    --end 'k9Wpgpp8' \
    --limit '25' \
    --offset '60' \
    --sortBy 'kmvaesF6' \
    --start 'EDVMKjYQ' \
    --success  \
    > test.out 2>&1
eval_tap $? 208 'QueryImportHistory' test.out

#- 209 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Odz3YRgr' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'PmiCAnfr' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 209 'ImportStoreByCSV' test.out

#- 210 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'kg0Xo6KE' \
    --limit '60' \
    --offset '7' \
    --sku 'GosvAgtp' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId 'lPwC8Pgv' \
    > test.out 2>&1
eval_tap $? 210 'QuerySubscriptions' test.out

#- 211 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SQSFOnrG' \
    > test.out 2>&1
eval_tap $? 211 'RecurringChargeSubscription' test.out

#- 212 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'kPfjGQeu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'GetTicketDynamic' test.out

#- 213 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'kXITznaD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "XiAx5DLb"}' \
    > test.out 2>&1
eval_tap $? 213 'DecreaseTicketSale' test.out

#- 214 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '0zEhjWVh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketBoothID' test.out

#- 215 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'dmbep7Ba' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 82, "orderNo": "7U1cuIYt"}' \
    > test.out 2>&1
eval_tap $? 215 'IncreaseTicketSale' test.out

#- 216 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 29, "currencyCode": "qJEt7hPm", "expireAt": "1991-12-16T00:00:00Z"}, "debitPayload": {"count": 30, "currencyCode": "Sz00tuj1", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 70, "entitlementCollectionId": "PlusVmKv", "entitlementOrigin": "Xbox", "itemIdentity": "7oBXf1R0", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 32, "entitlementId": "BMDyWzfg"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 55, "currencyCode": "cx0Gv8ZP", "expireAt": "1973-03-02T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "Z32eJl3O", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 9, "entitlementCollectionId": "bd7u6Q1T", "entitlementOrigin": "Steam", "itemIdentity": "aRpOw8Vy", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 77, "entitlementId": "1zcmcSku"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 62, "currencyCode": "kbER0X9h", "expireAt": "1997-11-27T00:00:00Z"}, "debitPayload": {"count": 63, "currencyCode": "lEau6yBK", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 65, "entitlementCollectionId": "wfVHxnQz", "entitlementOrigin": "Nintendo", "itemIdentity": "N6wb8yG7", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "yAZrkAEP"}, "type": "CREDIT_WALLET"}], "userId": "PxPlAFL6"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 0, "currencyCode": "dOfPjrou", "expireAt": "1991-09-09T00:00:00Z"}, "debitPayload": {"count": 79, "currencyCode": "yHIwnG7P", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 78, "entitlementCollectionId": "CyK33ME3", "entitlementOrigin": "IOS", "itemIdentity": "kw6YelKi", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 97, "entitlementId": "oJdwNlK6"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 25, "currencyCode": "IBkBTDsl", "expireAt": "1971-06-23T00:00:00Z"}, "debitPayload": {"count": 16, "currencyCode": "RYle20MW", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 11, "entitlementCollectionId": "Ax40iePC", "entitlementOrigin": "GooglePlay", "itemIdentity": "DV6BV574", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "d00FJhnI"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 1, "currencyCode": "4IQZNL38", "expireAt": "1986-03-18T00:00:00Z"}, "debitPayload": {"count": 96, "currencyCode": "puXgGGNA", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 9, "entitlementCollectionId": "L5KbXLKo", "entitlementOrigin": "Steam", "itemIdentity": "vvzN6zls", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "WZqJREVX"}, "type": "CREDIT_WALLET"}], "userId": "3uwJbmug"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 39, "currencyCode": "a6fMNgjr", "expireAt": "1977-12-11T00:00:00Z"}, "debitPayload": {"count": 20, "currencyCode": "sDvGFzXm", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "MrgnGjY3", "entitlementOrigin": "System", "itemIdentity": "XhkJEsH7", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "QLyljTNw"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 44, "currencyCode": "dCcsF36k", "expireAt": "1993-08-18T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "Z1t8Ed6S", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 39, "entitlementCollectionId": "M3buURs5", "entitlementOrigin": "Other", "itemIdentity": "xk6i6rdo", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "bmVIrRdu"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 42, "currencyCode": "BB8pCH5d", "expireAt": "1985-07-06T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "AZqpTijg", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "t0jO8Tz3", "entitlementOrigin": "IOS", "itemIdentity": "FiVLAL0n", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 15, "entitlementId": "T2iPqftv"}, "type": "CREDIT_WALLET"}], "userId": "BOGXsBnZ"}], "metadata": {"P5RoVso5": {}, "owcOz8K5": {}, "bRMJKR1E": {}}, "needPreCheck": false, "transactionId": "A5axD3Hs", "type": "qkBZINtA"}' \
    > test.out 2>&1
eval_tap $? 216 'Commit' test.out

#- 217 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '93' \
    --status 'FAILED' \
    --type '25l5EBAH' \
    --userId '1rfWnXhm' \
    > test.out 2>&1
eval_tap $? 217 'GetTradeHistoryByCriteria' test.out

#- 218 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'qzblbt8m' \
    > test.out 2>&1
eval_tap $? 218 'GetTradeHistoryByTransactionId' test.out

#- 219 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'RspqPGAv' \
    --body '{"achievements": [{"id": "VS3YvNZG", "value": 60}, {"id": "QxrrhLLQ", "value": 95}, {"id": "KFgMU0hV", "value": 21}], "steamUserId": "AMonOfz8"}' \
    > test.out 2>&1
eval_tap $? 219 'UnlockSteamUserAchievement' test.out

#- 220 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '8VgmWTHF' \
    --xboxUserId '3ofIjjQq' \
    > test.out 2>&1
eval_tap $? 220 'GetXblUserAchievements' test.out

#- 221 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWhyxIdL' \
    --body '{"achievements": [{"id": "cM1uWhUi", "percentComplete": 54}, {"id": "lMftCg8U", "percentComplete": 37}, {"id": "2RkNv1q4", "percentComplete": 57}], "serviceConfigId": "Ro2DaFJp", "titleId": "ojBcSJVk", "xboxUserId": "usxNUy8V"}' \
    > test.out 2>&1
eval_tap $? 221 'UpdateXblUserAchievement' test.out

#- 222 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'u3JtDV5g' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizeCampaign' test.out

#- 223 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OBhDSUSC' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeEntitlement' test.out

#- 224 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'eB8CNkGh' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeFulfillment' test.out

#- 225 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'PmcEX99T' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeIntegration' test.out

#- 226 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uorosLkI' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeOrder' test.out

#- 227 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'GNKCIdHe' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizePayment' test.out

#- 228 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'jai9OaMf' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeRevocation' test.out

#- 229 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '8oPQcGnu' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeSubscription' test.out

#- 230 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMw92rnp' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeWallet' test.out

#- 231 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zxy4rU4i' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 231 'GetUserDLCByPlatform' test.out

#- 232 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'd7eIw40O' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 232 'GetUserDLC' test.out

#- 233 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '89CpMI4l' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'SmgUYn41' \
    --entitlementClazz 'APP' \
    --entitlementName 'M2B2C5Wx' \
    --features '4vHezEhs,6iAm0D28,WrM0xvjV' \
    --fuzzyMatchName  \
    --itemId 'JiF1KetE,QHJcbVdl,jdWAONwz' \
    --limit '78' \
    --offset '92' \
    --origin 'IOS' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserEntitlements' test.out

#- 234 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qrcs3ANr' \
    --body '[{"collectionId": "soliy8gY", "endDate": "1973-11-10T00:00:00Z", "grantedCode": "xpk4geou", "itemId": "gNtzExVV", "itemNamespace": "4PizNNbP", "language": "ct_AjQB_qd", "origin": "Twitch", "quantity": 37, "region": "0kXIOjLA", "source": "PURCHASE", "startDate": "1990-12-02T00:00:00Z", "storeId": "2AKMKQPD"}, {"collectionId": "TvjYzNrz", "endDate": "1976-07-26T00:00:00Z", "grantedCode": "Gkde5O4J", "itemId": "Tyq37y7G", "itemNamespace": "vQxn7yjE", "language": "aEJ_Vc", "origin": "Twitch", "quantity": 21, "region": "oWuaFRzV", "source": "PURCHASE", "startDate": "1975-12-14T00:00:00Z", "storeId": "pl0UOUCo"}, {"collectionId": "FgMgQONW", "endDate": "1986-04-17T00:00:00Z", "grantedCode": "n9PSYCzq", "itemId": "CinNhEM6", "itemNamespace": "2989LRWw", "language": "CtHb_zq", "origin": "Oculus", "quantity": 79, "region": "GMhZ0EcK", "source": "OTHER", "startDate": "1990-03-03T00:00:00Z", "storeId": "0wchnTkV"}]' \
    > test.out 2>&1
eval_tap $? 234 'GrantUserEntitlement' test.out

#- 235 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vx4dAYAs' \
    --activeOnly  \
    --appId 'EfQBCQCY' \
    > test.out 2>&1
eval_tap $? 235 'GetUserAppEntitlementByAppId' test.out

#- 236 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZG7a0aNq' \
    --activeOnly  \
    --limit '91' \
    --offset '73' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserEntitlementsByAppType' test.out

#- 237 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1J1qJfCS' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'iXdHA3YC' \
    --itemId '2W4lmjGO' \
    > test.out 2>&1
eval_tap $? 237 'GetUserEntitlementByItemId' test.out

#- 238 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xm2GyDKk' \
    --ids '2h9Jsom8,NBUuINIu,LSJvj2Kc' \
    --platform 'YdExNywY' \
    > test.out 2>&1
eval_tap $? 238 'GetUserActiveEntitlementsByItemIds' test.out

#- 239 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChLyV4lD' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'BQQYIdh1' \
    --sku '3xOIzBsu' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementBySku' test.out

#- 240 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OUMDa7tZ' \
    --appIds 'Xx5hZRHU,LEcCSnNP,jLCz9lZm' \
    --itemIds 'OOdbsOZw,gOFqLLbK,Hp46IUpU' \
    --platform 'LclrpkPd' \
    --skus '0hqHoNbe,LuCaEycW,eY1nkUp2' \
    > test.out 2>&1
eval_tap $? 240 'ExistsAnyUserActiveEntitlement' test.out

#- 241 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'FW5tYexV' \
    --platform 'qiCn5JV7' \
    --itemIds 'G9tykVoO,7240B7p8,WFqRthXM' \
    > test.out 2>&1
eval_tap $? 241 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 242 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '5yLs184z' \
    --appId 'XR5EdcBC' \
    > test.out 2>&1
eval_tap $? 242 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 243 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFpiNl4v' \
    --entitlementClazz 'CODE' \
    --platform 'O53UXFzh' \
    --itemId 'phNuidIZ' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementOwnershipByItemId' test.out

#- 244 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMMayQiK' \
    --ids 'XA94yLbJ,xPseNg18,QWs7jhMR' \
    --platform 'HGW14IpU' \
    > test.out 2>&1
eval_tap $? 244 'GetUserEntitlementOwnershipByItemIds' test.out

#- 245 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'kAGV2vu8' \
    --entitlementClazz 'CODE' \
    --platform 'x2KTeMuF' \
    --sku '94mB2ngW' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipBySku' test.out

#- 246 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGCVxYxS' \
    > test.out 2>&1
eval_tap $? 246 'RevokeAllEntitlements' test.out

#- 247 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbpEsxWp' \
    --entitlementIds 'gfgOecxe' \
    > test.out 2>&1
eval_tap $? 247 'RevokeUserEntitlements' test.out

#- 248 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '6UpeR9Ym' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANdXNDu4' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlement' test.out

#- 249 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'j4KsBCF4' \
    --namespace "$AB_NAMESPACE" \
    --userId '4RjO3NM5' \
    --body '{"collectionId": "L39dumGj", "endDate": "1983-01-05T00:00:00Z", "nullFieldList": ["mwA8yQ24", "A1QNnDCp", "tkWC3O4F"], "origin": "Epic", "reason": "jnMq9f46", "startDate": "1990-10-06T00:00:00Z", "status": "CONSUMED", "useCount": 60}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateUserEntitlement' test.out

#- 250 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'IM75SkQc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MzSXaW85' \
    --body '{"options": ["wryMkIZv", "z4SK851o", "sXnFfGev"], "platform": "MPaQExP8", "requestId": "7jJnkjny", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 250 'ConsumeUserEntitlement' test.out

#- 251 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'Lmlwbu4n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RB27AJXh' \
    > test.out 2>&1
eval_tap $? 251 'DisableUserEntitlement' test.out

#- 252 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'ouwSOCNm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnYtMCHP' \
    > test.out 2>&1
eval_tap $? 252 'EnableUserEntitlement' test.out

#- 253 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'bwem3ROC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BtybpP60' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementHistories' test.out

#- 254 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'ULV8oyNc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y8NoPQJQ' \
    > test.out 2>&1
eval_tap $? 254 'RevokeUserEntitlement' test.out

#- 255 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'DeMslW2O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3uKzx7A' \
    --body '{"reason": "2AXER6so", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 255 'RevokeUserEntitlementByUseCount' test.out

#- 256 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'djRZriqs' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Gtv0jnD' \
    --quantity '16' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 257 RevokeUseCount
eval_tap 0 257 'RevokeUseCount # SKIP deprecated' test.out

#- 258 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '4rH9vo6f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yKwja6qi' \
    --body '{"platform": "JqLxKIkJ", "requestId": "sNgUYQA6", "useCount": 4}' \
    > test.out 2>&1
eval_tap $? 258 'SellUserEntitlement' test.out

#- 259 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ggVPTgJ0' \
    --body '{"duration": 18, "endDate": "1995-04-18T00:00:00Z", "entitlementCollectionId": "uBO6sSXw", "entitlementOrigin": "Epic", "itemId": "dmcA6H3Q", "itemSku": "2tZuQlSJ", "language": "ZGNtyRKF", "metadata": {"zfR0RxHJ": {}, "Ojve5tyq": {}, "8kej7ADu": {}}, "order": {"currency": {"currencyCode": "RUxQc9gn", "currencySymbol": "lZaserMo", "currencyType": "REAL", "decimals": 1, "namespace": "bQuRdRef"}, "ext": {"54YBnd5E": {}, "eoQFimWc": {}, "CwmOYYhW": {}}, "free": true}, "orderNo": "8R8k0QD2", "origin": "GooglePlay", "overrideBundleItemQty": {"HhNeDUVC": 58, "lQ2xXPoL": 12, "elmwuOkm": 7}, "quantity": 26, "region": "n5IbktTj", "source": "PROMOTION", "startDate": "1977-08-13T00:00:00Z", "storeId": "TtImNbzO"}' \
    > test.out 2>&1
eval_tap $? 259 'FulfillItem' test.out

#- 260 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXJDupcD' \
    --body '{"code": "UeRE712q", "language": "Lfw-602", "region": "uxkRDh8y"}' \
    > test.out 2>&1
eval_tap $? 260 'RedeemCode' test.out

#- 261 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQ4Dk98c' \
    --body '{"itemId": "Q3MS4bs4", "itemSku": "wEADsLSY", "quantity": 97}' \
    > test.out 2>&1
eval_tap $? 261 'PreCheckFulfillItem' test.out

#- 262 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhZIwoKW' \
    --body '{"entitlementCollectionId": "fH9qeqdU", "entitlementOrigin": "Nintendo", "metadata": {"NwdZJo8j": {}, "wGx3VWHT": {}, "fVxnHacf": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "ZtPbxqDA", "namespace": "aTgPfpXU"}, "item": {"itemId": "oDtIs2HK", "itemSku": "6psw0yPN", "itemType": "YDrfIzuf"}, "quantity": 64, "type": "ITEM"}, {"currency": {"currencyCode": "j0A5a1xH", "namespace": "EUYxRNvY"}, "item": {"itemId": "1HRU708M", "itemSku": "tzQUH2fG", "itemType": "9EGtPGwm"}, "quantity": 100, "type": "CURRENCY"}, {"currency": {"currencyCode": "IH5CleSN", "namespace": "XeJSwnpY"}, "item": {"itemId": "CmJGEemN", "itemSku": "jQhNHXWJ", "itemType": "3QZBh97D"}, "quantity": 23, "type": "ITEM"}], "source": "PAYMENT", "transactionId": "PqPzrfzg"}' \
    > test.out 2>&1
eval_tap $? 262 'FulfillRewards' test.out

#- 263 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ldia3p5p' \
    --endTime 'WruvW79t' \
    --limit '67' \
    --offset '29' \
    --productId '6vVadcs7' \
    --startTime 'UBQU3lOI' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserIAPOrders' test.out

#- 264 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sIjyQ9u9' \
    > test.out 2>&1
eval_tap $? 264 'QueryAllUserIAPOrders' test.out

#- 265 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rt3m0ZQq' \
    --endTime 'KuXgsNI7' \
    --limit '68' \
    --offset '80' \
    --startTime 'UDBQg5bN' \
    --status 'SUCCESS' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPConsumeHistory' test.out

#- 266 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vc7ktnnN' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "pV", "productId": "c2gVqgzz", "region": "iYlNjQKz", "transactionId": "iLNSxry2", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 266 'MockFulfillIAPItem' test.out

#- 267 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIXmfFmq' \
    --itemId 'Nx96RxB6' \
    --limit '62' \
    --offset '6' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserOrders' test.out

#- 268 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIpAE2hL' \
    --body '{"currencyCode": "bJ75cdIa", "currencyNamespace": "L6iqVssO", "discountedPrice": 1, "entitlementPlatform": "Playstation", "ext": {"LDWJz8hP": {}, "oVIqyhhL": {}, "7sLiNXp5": {}}, "itemId": "CF9L1rrI", "language": "C78BJTEP", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 75, "quantity": 27, "region": "ejQyoAtL", "returnUrl": "dt7fweSZ", "sandbox": true, "sectionId": "U8RAAZId"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminCreateUserOrder' test.out

#- 269 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ClyLTElO' \
    --itemId 'SddAXeHx' \
    > test.out 2>&1
eval_tap $? 269 'CountOfPurchasedItem' test.out

#- 270 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hnE09ZZw' \
    --userId 'j9sel4ZT' \
    > test.out 2>&1
eval_tap $? 270 'GetUserOrder' test.out

#- 271 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'O5I71pfn' \
    --userId 'sAC01W6m' \
    --body '{"status": "CLOSED", "statusReason": "jH7NgoBv"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserOrderStatus' test.out

#- 272 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KRaBM8wf' \
    --userId 'z0JvbcHK' \
    > test.out 2>&1
eval_tap $? 272 'FulfillUserOrder' test.out

#- 273 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yA1OozKS' \
    --userId 'SeDcQcWE' \
    > test.out 2>&1
eval_tap $? 273 'GetUserOrderGrant' test.out

#- 274 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oJqsM0w6' \
    --userId 'lJALWeR1' \
    > test.out 2>&1
eval_tap $? 274 'GetUserOrderHistories' test.out

#- 275 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'P3CaRgq5' \
    --userId 'iWjihDn4' \
    --body '{"additionalData": {"cardSummary": "6mOUymSY"}, "authorisedTime": "1979-08-23T00:00:00Z", "chargebackReversedTime": "1974-03-15T00:00:00Z", "chargebackTime": "1986-01-13T00:00:00Z", "chargedTime": "1977-06-28T00:00:00Z", "createdTime": "1979-01-24T00:00:00Z", "currency": {"currencyCode": "rTEK9DPc", "currencySymbol": "9JhADn53", "currencyType": "REAL", "decimals": 85, "namespace": "p4DAz2X0"}, "customParameters": {"KP7BgMIc": {}, "NewjBvnI": {}, "3dLe3L9f": {}}, "extOrderNo": "PZlF8z9i", "extTxId": "bx0pbha6", "extUserId": "TyqjVsSJ", "issuedAt": "1980-06-17T00:00:00Z", "metadata": {"cQIsRqrK": "Z3WgLB9v", "hhtwBaiM": "g5eZ0TML", "WEGB1m7E": "3FTUt3Kr"}, "namespace": "92lSulYn", "nonceStr": "Hpb6qSSF", "paymentMethod": "IcqeFhrv", "paymentMethodFee": 20, "paymentOrderNo": "T6qYNc8z", "paymentProvider": "CHECKOUT", "paymentProviderFee": 60, "paymentStationUrl": "7xkVdIwc", "price": 33, "refundedTime": "1982-12-27T00:00:00Z", "salesTax": 61, "sandbox": false, "sku": "IplDdtXL", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "kW3gLhvl", "subscriptionId": "RPoa37za", "subtotalPrice": 60, "targetNamespace": "IpUMhOF2", "targetUserId": "Rlu62CNl", "tax": 43, "totalPrice": 36, "totalTax": 62, "txEndTime": "1973-05-22T00:00:00Z", "type": "vmRe3LuB", "userId": "MyRg5rYL", "vat": 73}' \
    > test.out 2>&1
eval_tap $? 275 'ProcessUserOrderNotification' test.out

#- 276 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'I3rpnyoA' \
    --userId 'D1XqmmAJ' \
    > test.out 2>&1
eval_tap $? 276 'DownloadUserOrderReceipt' test.out

#- 277 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '7K5OHUaQ' \
    --body '{"currencyCode": "3kX9jcad", "currencyNamespace": "LtbaJlqB", "customParameters": {"VC32f9Ww": {}, "k1QInQia": {}, "bZRWjXP9": {}}, "description": "tM8Zky2T", "extOrderNo": "3u6eh4bv", "extUserId": "m0iSPvK8", "itemType": "SUBSCRIPTION", "language": "rh_seLI", "metadata": {"S0Z5dC27": "iV6nt0ET", "DsEOET46": "OH5WISbm", "RKVLWnHx": "VXieB0kt"}, "notifyUrl": "GzzAhlGV", "omitNotification": true, "platform": "9N3AZ7tS", "price": 10, "recurringPaymentOrderNo": "7LxokTST", "region": "gZs9RoAr", "returnUrl": "qoDyiFZH", "sandbox": true, "sku": "poE2F58X", "subscriptionId": "SAZIb3bz", "title": "ZOmNf5o5"}' \
    > test.out 2>&1
eval_tap $? 277 'CreateUserPaymentOrder' test.out

#- 278 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fkii5481' \
    --userId 'GF0UWxns' \
    --body '{"description": "zHjYvWaX"}' \
    > test.out 2>&1
eval_tap $? 278 'RefundUserPaymentOrder' test.out

#- 279 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Skrs8fnG' \
    --body '{"code": "xn0RAq5R", "orderNo": "0upVf81g"}' \
    > test.out 2>&1
eval_tap $? 279 'ApplyUserRedemption' test.out

#- 280 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '6HoQ4Nvm' \
    --body '{"meta": {"somLIEJV": {}, "OaqW63Gw": {}, "blnusKPY": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Epic", "currencyCode": "9tLzoE8R", "namespace": "FI3x8OW4"}, "entitlement": {"entitlementId": "ILxC8Axy"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "LQd4mHpF", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 36, "type": "ITEM"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "a3lbChvB", "namespace": "1G8ZHe3B"}, "entitlement": {"entitlementId": "wbsEL1kN"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "0j9WhCj6", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "ecKKqDT6", "namespace": "z4g0dyz7"}, "entitlement": {"entitlementId": "1aUiqIa6"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "T7BBFhA0", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 63, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "ZGHMJq06"}' \
    > test.out 2>&1
eval_tap $? 280 'DoRevocation' test.out

#- 281 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbBmTBxa' \
    --body '{"gameSessionId": "SFY0GgyR", "payload": {"XlYxoR10": {}, "c4Bw04KO": {}, "39vfO14D": {}}, "scid": "Hsb42dxk", "sessionTemplateName": "ZtL0RqHH"}' \
    > test.out 2>&1
eval_tap $? 281 'RegisterXblSessions' test.out

#- 282 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxcUnwgF' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'gsuPJqb5' \
    --limit '57' \
    --offset '52' \
    --sku 'DXqcmvL2' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 282 'QueryUserSubscriptions' test.out

#- 283 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q5FSTJLa' \
    --excludeSystem  \
    --limit '91' \
    --offset '31' \
    --subscriptionId 'kott54ir' \
    > test.out 2>&1
eval_tap $? 283 'GetUserSubscriptionActivities' test.out

#- 284 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'vke06q1f' \
    --body '{"grantDays": 28, "itemId": "F6UO5RJ9", "language": "0uKL2iC3", "reason": "JMExfpEr", "region": "q1yVGQ5L", "source": "lla8zxdo"}' \
    > test.out 2>&1
eval_tap $? 284 'PlatformSubscribeSubscription' test.out

#- 285 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3RvapD75' \
    --itemId 'wfOtBuFm' \
    > test.out 2>&1
eval_tap $? 285 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 286 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'A47GpGzl' \
    --userId 'JxZGdCQa' \
    > test.out 2>&1
eval_tap $? 286 'GetUserSubscription' test.out

#- 287 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qVPD7Pkd' \
    --userId 'a6CQyLBa' \
    > test.out 2>&1
eval_tap $? 287 'DeleteUserSubscription' test.out

#- 288 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NolCYXlK' \
    --userId 'mPCZHpFo' \
    --force  \
    --body '{"immediate": false, "reason": "8z7fP8rq"}' \
    > test.out 2>&1
eval_tap $? 288 'CancelSubscription' test.out

#- 289 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fQGTvmrG' \
    --userId 'QLihT5D7' \
    --body '{"grantDays": 68, "reason": "jgVL2P3o"}' \
    > test.out 2>&1
eval_tap $? 289 'GrantDaysToSubscription' test.out

#- 290 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qpKIXJop' \
    --userId 'vJsWERQU' \
    --excludeFree  \
    --limit '93' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionBillingHistories' test.out

#- 291 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rQHNFV0a' \
    --userId 'bDNqfy48' \
    --body '{"additionalData": {"cardSummary": "1IM2nDoU"}, "authorisedTime": "1981-09-25T00:00:00Z", "chargebackReversedTime": "1975-12-18T00:00:00Z", "chargebackTime": "1998-03-23T00:00:00Z", "chargedTime": "1984-02-25T00:00:00Z", "createdTime": "1981-09-06T00:00:00Z", "currency": {"currencyCode": "meLNnPbx", "currencySymbol": "AHEdV1ZO", "currencyType": "VIRTUAL", "decimals": 92, "namespace": "DQ2eQ5v8"}, "customParameters": {"k8EP0jAn": {}, "ztZUJjPC": {}, "HAUYCIQu": {}}, "extOrderNo": "jcVwnq9x", "extTxId": "T1nusVID", "extUserId": "khnn2HWI", "issuedAt": "1994-04-27T00:00:00Z", "metadata": {"OOnkmIs6": "IGKCQqg4", "CW2Khc77": "fI1VDCn2", "6hZzs2bH": "yXx1phjs"}, "namespace": "1GwJttlU", "nonceStr": "Ht8WrJBW", "paymentMethod": "PBM88XgT", "paymentMethodFee": 82, "paymentOrderNo": "jMXnKWLs", "paymentProvider": "WALLET", "paymentProviderFee": 21, "paymentStationUrl": "m9E6fgSC", "price": 80, "refundedTime": "1994-03-11T00:00:00Z", "salesTax": 96, "sandbox": false, "sku": "Oh78fWz4", "status": "REFUND_FAILED", "statusReason": "o2rLP7GN", "subscriptionId": "4i1Ve7wQ", "subtotalPrice": 12, "targetNamespace": "F4cjKT8i", "targetUserId": "O91kG8id", "tax": 42, "totalPrice": 3, "totalTax": 0, "txEndTime": "1975-01-05T00:00:00Z", "type": "SXjCykWq", "userId": "yNkhmAK6", "vat": 26}' \
    > test.out 2>&1
eval_tap $? 291 'ProcessUserSubscriptionNotification' test.out

#- 292 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'q7BCatUI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UqBjLc64' \
    --body '{"count": 98, "orderNo": "gHn3VT4T"}' \
    > test.out 2>&1
eval_tap $? 292 'AcquireUserTicket' test.out

#- 293 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOYU9Unx' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserCurrencyWallets' test.out

#- 294 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'SmERyOZN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z5oj5Tgu' \
    --body '{"allowOverdraft": true, "amount": 14, "balanceOrigin": "Twitch", "balanceSource": "TRADE", "metadata": {"NgOOgnm6": {}, "5401PA4n": {}, "9fe3gRnK": {}}, "reason": "3vubQjnE"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitUserWalletByCurrencyCode' test.out

#- 295 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'AnrssQXw' \
    --namespace "$AB_NAMESPACE" \
    --userId '9CwEGCoR' \
    --limit '35' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 295 'ListUserCurrencyTransactions' test.out

#- 296 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'pWpkBalT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWEI4c79' \
    --request '{"amount": 48, "debitBalanceSource": "EXPIRATION", "metadata": {"jg4EMhcb": {}, "I5mV0psP": {}, "a2cWPSUC": {}}, "reason": "WBGtvDAV", "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 296 'CheckBalance' test.out

#- 297 CheckWallet
eval_tap 0 297 'CheckWallet # SKIP deprecated' test.out

#- 298 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'Pt90wORM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWXzcMyK' \
    --body '{"amount": 1, "expireAt": "1998-05-08T00:00:00Z", "metadata": {"HJOSfvoj": {}, "OJ7lwIJJ": {}, "c57ZybOI": {}}, "origin": "Oculus", "reason": "WZsAgdox", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 298 'CreditUserWallet' test.out

#- 299 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'WbYFH6ce' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WMnySgDv' \
    --request '{"amount": 30, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"I9AiKofM": {}, "QOHrmdSa": {}, "NNAJc33T": {}}, "reason": "FEoSoGyn", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 299 'DebitByWalletPlatform' test.out

#- 300 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'p7doOTu6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAOlf0Ki' \
    --body '{"amount": 79, "metadata": {"KH4ihMgx": {}, "GCml7psO": {}, "BQvzREM9": {}}, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 300 'PayWithUserWallet' test.out

#- 301 GetUserWallet
eval_tap 0 301 'GetUserWallet # SKIP deprecated' test.out

#- 302 DebitUserWallet
eval_tap 0 302 'DebitUserWallet # SKIP deprecated' test.out

#- 303 DisableUserWallet
eval_tap 0 303 'DisableUserWallet # SKIP deprecated' test.out

#- 304 EnableUserWallet
eval_tap 0 304 'EnableUserWallet # SKIP deprecated' test.out

#- 305 ListUserWalletTransactions
eval_tap 0 305 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 306 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PhvunuSh' \
    > test.out 2>&1
eval_tap $? 306 'ListViews' test.out

#- 307 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TzNn3DSt' \
    --body '{"displayOrder": 63, "localizations": {"adRW0jiO": {"description": "oEEGO6OY", "localExt": {"YqApJyto": {}, "UU7eu0ND": {}, "YDr0B3C0": {}}, "longDescription": "cbYSYlkE", "title": "qDFobFzK"}, "QeA8nTmQ": {"description": "qbK7Hfag", "localExt": {"OjtlEEt4": {}, "WYabl1hh": {}, "4DiBoZt9": {}}, "longDescription": "CJKfE6Qt", "title": "pJAFMMCn"}, "U8YvLw0w": {"description": "XdDyXkQu", "localExt": {"6ES8JnsY": {}, "MlVKYkZz": {}, "uvjqbweq": {}}, "longDescription": "64Mzjgcq", "title": "w26oFH4E"}}, "name": "TUM7rAhH"}' \
    > test.out 2>&1
eval_tap $? 307 'CreateView' test.out

#- 308 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'nVy4vArU' \
    --storeId 'JHJF53kb' \
    > test.out 2>&1
eval_tap $? 308 'GetView' test.out

#- 309 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '5rwObYcF' \
    --storeId 'hBqgrzuj' \
    --body '{"displayOrder": 29, "localizations": {"wyj9jSpu": {"description": "yoGh6Mok", "localExt": {"Sou5E2Kg": {}, "TlFSoZGv": {}, "IKBaRGSJ": {}}, "longDescription": "x1tUU5ZF", "title": "jRG5nazJ"}, "BHDdM95V": {"description": "WbfqSuMZ", "localExt": {"d4aBqBq3": {}, "UuH4twwq": {}, "4UPpihGQ": {}}, "longDescription": "acNib0rD", "title": "RpT5KaJi"}, "hqbYiDoG": {"description": "2bQKZ9Aw", "localExt": {"9V52hHY2": {}, "xpzuz0Eb": {}, "JEOHipc2": {}}, "longDescription": "3sEDakWN", "title": "R5aDmawt"}}, "name": "3CPQiFWx"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateView' test.out

#- 310 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'k5CT6gik' \
    --storeId 'mrV6CuPp' \
    > test.out 2>&1
eval_tap $? 310 'DeleteView' test.out

#- 311 QueryWallets
eval_tap 0 311 'QueryWallets # SKIP deprecated' test.out

#- 312 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 64, "expireAt": "1977-06-23T00:00:00Z", "metadata": {"t9CPAkkt": {}, "wNrnLGGR": {}, "sMjyodSO": {}}, "origin": "Xbox", "reason": "5ekL18Wz", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "frO828AE", "userIds": ["X2rLhJuP", "5QiB4jnp", "Aov9OFf3"]}, {"creditRequest": {"amount": 79, "expireAt": "1974-10-10T00:00:00Z", "metadata": {"P1sEXOix": {}, "zSQWgwi2": {}, "En41sOZ6": {}}, "origin": "Other", "reason": "hETqPR8G", "source": "TRADE"}, "currencyCode": "mBefU7T3", "userIds": ["QoyoS9mh", "aXZIJVzI", "3oGMQc69"]}, {"creditRequest": {"amount": 60, "expireAt": "1986-08-02T00:00:00Z", "metadata": {"zmKbg0jH": {}, "WfPn46hr": {}, "mUrtTCVK": {}}, "origin": "Playstation", "reason": "zlXJlwVr", "source": "REFERRAL_BONUS"}, "currencyCode": "vk8UwbHI", "userIds": ["SOINlelD", "K0jLnBX0", "5UiMQgQF"]}]' \
    > test.out 2>&1
eval_tap $? 312 'BulkCredit' test.out

#- 313 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "v2XdPUIS", "request": {"allowOverdraft": false, "amount": 99, "balanceOrigin": "Nintendo", "balanceSource": "TRADE", "metadata": {"mtZXxF0m": {}, "3vBfpsvW": {}, "9Sa9hTaV": {}}, "reason": "OQaNOsZa"}, "userIds": ["8sc8xdsL", "UQXGSfRC", "dlfYeKsO"]}, {"currencyCode": "FfJnAmO8", "request": {"allowOverdraft": false, "amount": 15, "balanceOrigin": "Nintendo", "balanceSource": "EXPIRATION", "metadata": {"C9pqxULR": {}, "xEEftycd": {}, "XoH8WYio": {}}, "reason": "PLS4gl9L"}, "userIds": ["8yBhxg6R", "vIpdIYui", "FJoxrOzZ"]}, {"currencyCode": "waB9szpD", "request": {"allowOverdraft": false, "amount": 69, "balanceOrigin": "IOS", "balanceSource": "ORDER_REVOCATION", "metadata": {"Q4vf9yhg": {}, "i79joPsG": {}, "oSUJYsHk": {}}, "reason": "UdxQPCEM"}, "userIds": ["ijLnkZVT", "rr2iMSss", "zLILIXNL"]}]' \
    > test.out 2>&1
eval_tap $? 313 'BulkDebit' test.out

#- 314 GetWallet
eval_tap 0 314 'GetWallet # SKIP deprecated' test.out

#- 315 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'a5p3vX29' \
    --end 'ZxAw2TPe' \
    --start 'my6eXKMy' \
    > test.out 2>&1
eval_tap $? 315 'SyncOrders' test.out

#- 316 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["rwYTeBeQ", "5616uhvM", "qthY24jJ"], "apiKey": "Ksuah5Fa", "authoriseAsCapture": true, "blockedPaymentMethods": ["gG4qdnih", "pYlZS27B", "3lR13fWc"], "clientKey": "LEqxUzJd", "dropInSettings": "m2g57V0j", "liveEndpointUrlPrefix": "3Tkt99NU", "merchantAccount": "JaxQypi3", "notificationHmacKey": "i7PPtVer", "notificationPassword": "zzM8gghf", "notificationUsername": "c6tEC8yv", "returnUrl": "HS3xa8br", "settings": "PaiGW3D0"}' \
    > test.out 2>&1
eval_tap $? 316 'TestAdyenConfig' test.out

#- 317 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "loj7ChQi", "privateKey": "GlxUHT9T", "publicKey": "0dV9n82I", "returnUrl": "FX2xKsQH"}' \
    > test.out 2>&1
eval_tap $? 317 'TestAliPayConfig' test.out

#- 318 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "xhEHist7", "secretKey": "ftFTN3Ww"}' \
    > test.out 2>&1
eval_tap $? 318 'TestCheckoutConfig' test.out

#- 319 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '0izo1r6a' \
    > test.out 2>&1
eval_tap $? 319 'DebugMatchedPaymentMerchantConfig' test.out

#- 320 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "v3ULStOf", "clientSecret": "WUZfQZQa", "returnUrl": "v9On40E2", "webHookId": "jWE7BIgU"}' \
    > test.out 2>&1
eval_tap $? 320 'TestPayPalConfig' test.out

#- 321 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["aY9kQHlw", "MFU4vCcG", "8YU2Hc41"], "publishableKey": "NS7tJNqJ", "secretKey": "bynFdiov", "webhookSecret": "borH1IPF"}' \
    > test.out 2>&1
eval_tap $? 321 'TestStripeConfig' test.out

#- 322 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "JXHURaWl", "key": "mzK2Isq6", "mchid": "W4oRF6ph", "returnUrl": "KvBTykgH"}' \
    > test.out 2>&1
eval_tap $? 322 'TestWxPayConfig' test.out

#- 323 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Dl3WxNH4", "flowCompletionUrl": "LvwhThvP", "merchantId": 4, "projectId": 77, "projectSecretKey": "OXDy3jYv"}' \
    > test.out 2>&1
eval_tap $? 323 'TestXsollaConfig' test.out

#- 324 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '1T857Mv0' \
    > test.out 2>&1
eval_tap $? 324 'GetPaymentMerchantConfig' test.out

#- 325 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'ZCHifgBn' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["5Sk05KSe", "AWDtr28y", "aSRn1iVu"], "apiKey": "5dLAXsoV", "authoriseAsCapture": false, "blockedPaymentMethods": ["XfQEyDtb", "wtaI8ahP", "gsAIfTGC"], "clientKey": "I18AQVJT", "dropInSettings": "fp8C7qU7", "liveEndpointUrlPrefix": "h9qTrWNW", "merchantAccount": "WcyOu6As", "notificationHmacKey": "h4UFNLTq", "notificationPassword": "yQj75OXs", "notificationUsername": "tRleQBgv", "returnUrl": "QKsLtSt0", "settings": "FUqnkTa3"}' \
    > test.out 2>&1
eval_tap $? 325 'UpdateAdyenConfig' test.out

#- 326 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'KiZsYuFF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 326 'TestAdyenConfigById' test.out

#- 327 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'hpZ1LPP6' \
    --sandbox  \
    --validate  \
    --body '{"appId": "WxCSRIo5", "privateKey": "WJb1TScU", "publicKey": "BzfCNs0E", "returnUrl": "PugtcdY0"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAliPayConfig' test.out

#- 328 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'YzdqEwgp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAliPayConfigById' test.out

#- 329 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '69DoHhPa' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "aLBia2NK", "secretKey": "BCKjTwxR"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateCheckoutConfig' test.out

#- 330 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'IU3HvvCU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestCheckoutConfigById' test.out

#- 331 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'RBHUgGPK' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "kZpxvbUZ", "clientSecret": "cmlazbSj", "returnUrl": "pD9r5rP4", "webHookId": "bvjVVEQL"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdatePayPalConfig' test.out

#- 332 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'tioSLPVk' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestPayPalConfigById' test.out

#- 333 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'a1PUMS2k' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["QIQeOiMW", "6JiaaekJ", "go4dcbwI"], "publishableKey": "fNHUqwUG", "secretKey": "UC4MPIqy", "webhookSecret": "zqYc2ftM"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateStripeConfig' test.out

#- 334 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'i3rDurik' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestStripeConfigById' test.out

#- 335 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'GPOmnIks' \
    --validate  \
    --body '{"appId": "kLN15uxI", "key": "CSOg0jtj", "mchid": "2ZCQYMLZ", "returnUrl": "MT6SK1IB"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateWxPayConfig' test.out

#- 336 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '4XMmnvoc' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 336 'UpdateWxPayConfigCert' test.out

#- 337 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'eYzz10DJ' \
    > test.out 2>&1
eval_tap $? 337 'TestWxPayConfigById' test.out

#- 338 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'NFPSyxT2' \
    --validate  \
    --body '{"apiKey": "ZA2w6dz1", "flowCompletionUrl": "0esDkNh1", "merchantId": 73, "projectId": 49, "projectSecretKey": "MQ9moW0M"}' \
    > test.out 2>&1
eval_tap $? 338 'UpdateXsollaConfig' test.out

#- 339 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'wYUleH4q' \
    > test.out 2>&1
eval_tap $? 339 'TestXsollaConfigById' test.out

#- 340 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'kxdh5JZr' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaUIConfig' test.out

#- 341 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '3' \
    --namespace "$AB_NAMESPACE" \
    --offset '38' \
    --region 'jKpqVEjf' \
    > test.out 2>&1
eval_tap $? 341 'QueryPaymentProviderConfig' test.out

#- 342 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "ik07TzPO", "region": "0S87uu2O", "sandboxTaxJarApiToken": "YYUIOwVB", "specials": ["PAYPAL", "XSOLLA", "PAYPAL"], "taxJarApiToken": "RQT9GzI1", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 342 'CreatePaymentProviderConfig' test.out

#- 343 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 343 'GetAggregatePaymentProviders' test.out

#- 344 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'B6WCnaqK' \
    > test.out 2>&1
eval_tap $? 344 'DebugMatchedPaymentProviderConfig' test.out

#- 345 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetSpecialPaymentProviders' test.out

#- 346 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'W0R3E6r1' \
    --body '{"aggregate": "XSOLLA", "namespace": "UZ5w9tKH", "region": "VlECPtgE", "sandboxTaxJarApiToken": "5l6rDGB1", "specials": ["XSOLLA", "WXPAY", "ADYEN"], "taxJarApiToken": "SZjzkwi4", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 346 'UpdatePaymentProviderConfig' test.out

#- 347 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '3krH891E' \
    > test.out 2>&1
eval_tap $? 347 'DeletePaymentProviderConfig' test.out

#- 348 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 348 'GetPaymentTaxConfig' test.out

#- 349 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "41wypcGi", "taxJarApiToken": "5B4MGxLm", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Oj908S41": "HYRk26iu", "wgeC0xRm": "MMFKZUlb", "72VEuWIV": "joxqMcdZ"}}' \
    > test.out 2>&1
eval_tap $? 349 'UpdatePaymentTaxConfig' test.out

#- 350 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'ygFPrwOx' \
    --end '8rJy5UUB' \
    --start 'dKtLLlpe' \
    > test.out 2>&1
eval_tap $? 350 'SyncPaymentOrders' test.out

#- 351 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '3EGgBVhH' \
    --storeId 'QKaJRu0L' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetRootCategories' test.out

#- 352 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '6DkWWBqb' \
    --storeId 'dOaVrkrI' \
    > test.out 2>&1
eval_tap $? 352 'DownloadCategories' test.out

#- 353 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'BqTtKZgs' \
    --namespace "$AB_NAMESPACE" \
    --language 'xVCWKzY0' \
    --storeId 'R9y1khYu' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetCategory' test.out

#- 354 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'nU668bak' \
    --namespace "$AB_NAMESPACE" \
    --language '9efgbGpc' \
    --storeId 'euvyg3oW' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetChildCategories' test.out

#- 355 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'MMxaBJaw' \
    --namespace "$AB_NAMESPACE" \
    --language 'GQDFqTGD' \
    --storeId 'hj7jj7hj' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetDescendantCategories' test.out

#- 356 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 356 'PublicListCurrencies' test.out

#- 357 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 357 'GeDLCDurableRewardShortMap' test.out

#- 358 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 358 'GetIAPItemMapping' test.out

#- 359 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'Px2xuXJa' \
    --region 'Mm470vUM' \
    --storeId 'kYxSay8n' \
    --appId 'Kod5y94l' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetItemByAppId' test.out

#- 360 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'AHsyzZEl' \
    --categoryPath 'xvoNN6r5' \
    --features 'tKeQTqMx' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'cvz3ULxc' \
    --limit '48' \
    --offset '40' \
    --region 'QV1o03pE' \
    --sortBy 'displayOrder,name:desc,updatedAt' \
    --storeId 'xIf3FDrt' \
    --tags 'bvuW1cGk' \
    > test.out 2>&1
eval_tap $? 360 'PublicQueryItems' test.out

#- 361 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'yDFtIXw5' \
    --region '1lgz7R4V' \
    --storeId 'LuqEc016' \
    --sku 'susi5XgW' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemBySku' test.out

#- 362 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '28twLWaX' \
    --storeId 'Zcqrepwt' \
    --itemIds 'FCd905iw' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetEstimatedPrice' test.out

#- 363 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'vjuf6Q83' \
    --region 'gIJDzLsd' \
    --storeId 'XGfHi3xX' \
    --itemIds 'kMdXBMH9' \
    > test.out 2>&1
eval_tap $? 363 'PublicBulkGetItems' test.out

#- 364 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["TCNl9KEn", "98dscjHm", "CidF6jhU"]}' \
    > test.out 2>&1
eval_tap $? 364 'PublicValidateItemPurchaseCondition' test.out

#- 365 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '92' \
    --offset '34' \
    --region 'JDj3hCLG' \
    --storeId 'F0Lkms2h' \
    --keyword 'D29TbIzf' \
    --language '6YZqbcTy' \
    > test.out 2>&1
eval_tap $? 365 'PublicSearchItems' test.out

#- 366 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'NtV1ILHo' \
    --namespace "$AB_NAMESPACE" \
    --language 'ycrjEbTz' \
    --region 'iDyfcUx8' \
    --storeId 'asasG45Y' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetApp' test.out

#- 367 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '0Hb9QSfW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 367 'PublicGetItemDynamicData' test.out

#- 368 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '5cG46hMk' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '83kxuYsW' \
    --populateBundle  \
    --region 'SaczkzEs' \
    --storeId 'ZiPG36Ql' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetItem' test.out

#- 369 GetPaymentCustomization
eval_tap 0 369 'GetPaymentCustomization # SKIP deprecated' test.out

#- 370 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "yrCLyZPQ", "paymentProvider": "ADYEN", "returnUrl": "7P3TNPzz", "ui": "T4gTkWkz", "zipCode": "jQ8TMY6j"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetPaymentUrl' test.out

#- 371 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cMkokpGo' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetPaymentMethods' test.out

#- 372 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XvxRzPMs' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetUnpaidPaymentOrder' test.out

#- 373 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ikqIA6Mu' \
    --paymentProvider 'STRIPE' \
    --zipCode '3NJASGan' \
    --body '{"token": "Km6fw7Q3"}' \
    > test.out 2>&1
eval_tap $? 373 'Pay' test.out

#- 374 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yDtwWncF' \
    > test.out 2>&1
eval_tap $? 374 'PublicCheckPaymentOrderPaidStatus' test.out

#- 375 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'YhUd5Nig' \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentPublicConfig' test.out

#- 376 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'RbaL02Ta' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetQRCode' test.out

#- 377 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'k4XpF85C' \
    --foreinginvoice '7CfY6lfo' \
    --invoiceId '5MNjeKbq' \
    --payload 'Aox3lg4E' \
    --redirectResult 'iJFY4Jxw' \
    --resultCode 'h0hlxGlg' \
    --sessionId 'DjAibiss' \
    --status 'lCbthl2H' \
    --token 'SD9rKJcH' \
    --type 'MnpbN40O' \
    --userId 'nhG1ni3C' \
    --orderNo 'MTdxNWEc' \
    --paymentOrderNo '70WzYu00' \
    --paymentProvider 'WALLET' \
    --returnUrl '6AlYf8p3' \
    > test.out 2>&1
eval_tap $? 377 'PublicNormalizePaymentReturnUrl' test.out

#- 378 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'BJJTYikP' \
    --paymentOrderNo 'IcHBBnHj' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 378 'GetPaymentTaxValue' test.out

#- 379 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '5a5bEA1x' \
    > test.out 2>&1
eval_tap $? 379 'GetRewardByCode' test.out

#- 380 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'qpe6EYos' \
    --limit '47' \
    --offset '87' \
    --sortBy 'rewardCode:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 380 'QueryRewards1' test.out

#- 381 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7awcMJXX' \
    > test.out 2>&1
eval_tap $? 381 'GetReward1' test.out

#- 382 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'PublicListStores' test.out

#- 383 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'sIyVGoQV,fHoyWJD8,P5NLqRRb' \
    --itemIds 'ad0k20Xe,FFR7c25e,n6Pf6MVw' \
    --skus '1MSiJn9O,9Gu4SATe,rZ4SRcPc' \
    > test.out 2>&1
eval_tap $? 383 'PublicExistsAnyMyActiveEntitlement' test.out

#- 384 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'tt6nUd0j' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 385 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'loGKkN34' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 386 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'MxlJLbY0' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 387 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'tfC6tC3s,taKGrvlx,2sn3sewz' \
    --itemIds 'qlPQgLXI,hSP4v2nS,BTtFYIGa' \
    --skus 'sZWDmMk6,Rz5jG9tZ,2419t2AU' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetEntitlementOwnershipToken' test.out

#- 388 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "sAeOA3Zh", "language": "XB-YeGQ_575", "region": "junY4WQn"}' \
    > test.out 2>&1
eval_tap $? 388 'SyncTwitchDropsEntitlement' test.out

#- 389 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'oaMmFf1a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicGetMyWallet' test.out

#- 390 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'yx4RWfLn' \
    --body '{"epicGamesJwtToken": "u4v95yUg"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncEpicGameDLC' test.out

#- 391 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'vjKyDw7G' \
    > test.out 2>&1
eval_tap $? 391 'SyncOculusDLC' test.out

#- 392 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1j2y4CWX' \
    --body '{"serviceLabel": 34}' \
    > test.out 2>&1
eval_tap $? 392 'PublicSyncPsnDlcInventory' test.out

#- 393 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'UybNWaJJ' \
    --body '{"serviceLabels": [98, 67, 85]}' \
    > test.out 2>&1
eval_tap $? 393 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 394 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XKHLtstM' \
    --body '{"appId": "WEmNRjhc", "steamId": "w46K1bbq"}' \
    > test.out 2>&1
eval_tap $? 394 'SyncSteamDLC' test.out

#- 395 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCxT6XjQ' \
    --body '{"xstsToken": "VQLX5iTW"}' \
    > test.out 2>&1
eval_tap $? 395 'SyncXboxDLC' test.out

#- 396 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zGyLopHz' \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'k9bUX70k' \
    --features 'DgTfFFH6,y3jdJ6qv,BdZX80sO' \
    --itemId 'fZYe371B,h1tkTaF5,L8tVd1yo' \
    --limit '74' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 396 'PublicQueryUserEntitlements' test.out

#- 397 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oz8WGaz2' \
    --appId 'wBMNCDqR' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementByAppId' test.out

#- 398 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'PVnOc15D' \
    --limit '85' \
    --offset '99' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlementsByAppType' test.out

#- 399 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1BrIsmBU' \
    --availablePlatformOnly  \
    --ids 'on8LhgNa,UycWp2MB,AgwzE2tS' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementsByIds' test.out

#- 400 PublicGetUserEntitlementByItemId
eval_tap 0 400 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 401 PublicGetUserEntitlementBySku
eval_tap 0 401 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 402 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQj7L5VC' \
    --appIds 'aGCAdnzh,6UeqGCSs,5ZR6q0SB' \
    --itemIds '1FlSIxU5,eRYcdgPT,dBdzTJjT' \
    --skus 'RdLjHqzl,PGpOzBvS,vtew9DrH' \
    > test.out 2>&1
eval_tap $? 402 'PublicExistsAnyUserActiveEntitlement' test.out

#- 403 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ss4ELogL' \
    --appId 'sh3RKBgL' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 404 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMg9ZuxS' \
    --entitlementClazz 'CODE' \
    --itemId 'SAv2wNmR' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 405 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'J8gKeKW6' \
    --ids 'F0W8fTxs,g5CI6XWB,XkWAzV3s' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 406 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRi1qbjO' \
    --entitlementClazz 'MEDIA' \
    --sku 'pkm3jIk5' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 407 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'KhTO2Oyp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLUevILJ' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlement' test.out

#- 408 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'EjRIpWdj' \
    --namespace "$AB_NAMESPACE" \
    --userId '2jFxdAol' \
    --body '{"options": ["LX0tjNTD", "xukIO3ao", "u8RvMRRR"], "requestId": "Vm5Uuk3N", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 408 'PublicConsumeUserEntitlement' test.out

#- 409 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'mYVZzHPk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIuEHany' \
    --body '{"requestId": "LKO28K3A", "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 409 'PublicSellUserEntitlement' test.out

#- 410 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'D3fuQS1W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ixa1IM6F' \
    --body '{"useCount": 31}' \
    > test.out 2>&1
eval_tap $? 410 'PublicSplitUserEntitlement' test.out

#- 411 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '0UwqyqD0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LuMVtMJz' \
    --body '{"entitlementId": "KS7qoM3P", "useCount": 59}' \
    > test.out 2>&1
eval_tap $? 411 'PublicTransferUserEntitlement' test.out

#- 412 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OurBjBgQ' \
    --body '{"code": "mreGOCoO", "language": "kjr_FvMI", "region": "F1KVQ2eg"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicRedeemCode' test.out

#- 413 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZKIxmwO' \
    --body '{"excludeOldTransactions": true, "language": "xn", "productId": "EXMhBVbD", "receiptData": "kfyP3t88", "region": "Tv2NcHDv", "transactionId": "Od8DfkAB"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicFulfillAppleIAPItem' test.out

#- 414 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FfojhjvD' \
    --body '{"epicGamesJwtToken": "ZuAcsbNC"}' \
    > test.out 2>&1
eval_tap $? 414 'SyncEpicGamesInventory' test.out

#- 415 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RvY9cQqf' \
    --body '{"autoAck": false, "language": "KZ_Fr", "orderId": "yQUwCdYw", "packageName": "4ivny3Lv", "productId": "MNufT0ob", "purchaseTime": 78, "purchaseToken": "RH7GjtRp", "region": "wEMWF2vU"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicFulfillGoogleIAPItem' test.out

#- 416 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 's4CJOXhf' \
    > test.out 2>&1
eval_tap $? 416 'SyncOculusConsumableEntitlements' test.out

#- 417 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'SismmUIj' \
    --body '{"currencyCode": "ktafMx7v", "price": 0.9979522570070833, "productId": "tFpg9s1S", "serviceLabel": 64}' \
    > test.out 2>&1
eval_tap $? 417 'PublicReconcilePlayStationStore' test.out

#- 418 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTCtNkfy' \
    --body '{"currencyCode": "MA95857X", "price": 0.6747994337124904, "productId": "6cbuaASK", "serviceLabels": [96, 67, 55]}' \
    > test.out 2>&1
eval_tap $? 418 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 419 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1EUMGjO' \
    --body '{"appId": "lpql4QSN", "currencyCode": "ScMTYY0l", "language": "fSJG-rVWz", "price": 0.1451434706154262, "productId": "XPxMG759", "region": "PAlDZz6J", "steamId": "jsi2uWOS"}' \
    > test.out 2>&1
eval_tap $? 419 'SyncSteamInventory' test.out

#- 420 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4gPGoYcD' \
    --body '{"gameId": "E4msz7IN", "language": "rRcr-639", "region": "tb7RVcHp"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncTwitchDropsEntitlement1' test.out

#- 421 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'd0j4VO4b' \
    --body '{"currencyCode": "hGu6Dj7L", "price": 0.3930860631263775, "productId": "ARG1Uldx", "xstsToken": "G0xkow7P"}' \
    > test.out 2>&1
eval_tap $? 421 'SyncXboxInventory' test.out

#- 422 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrvamujj' \
    --itemId 'LzMTsu4b' \
    --limit '68' \
    --offset '58' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 422 'PublicQueryUserOrders' test.out

#- 423 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'EA9lDqnA' \
    --body '{"currencyCode": "RlJjtaoJ", "discountedPrice": 24, "ext": {"FYOK41t3": {}, "Cyu1HE9Q": {}, "qQWyHTgt": {}}, "itemId": "kTnwPDNG", "language": "kt", "price": 11, "quantity": 52, "region": "N0olJQ4B", "returnUrl": "eJIDOaK9", "sectionId": "6o72DkJ5"}' \
    > test.out 2>&1
eval_tap $? 423 'PublicCreateUserOrder' test.out

#- 424 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M1PeiYiK' \
    --userId 'oWjFrzfi' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetUserOrder' test.out

#- 425 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tiyEj39A' \
    --userId 'PfloOYgv' \
    > test.out 2>&1
eval_tap $? 425 'PublicCancelUserOrder' test.out

#- 426 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4HlcP3Mb' \
    --userId 'InXnrcFs' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserOrderHistories' test.out

#- 427 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Fn5Yx4n8' \
    --userId 'hkTOMcjE' \
    > test.out 2>&1
eval_tap $? 427 'PublicDownloadUserOrderReceipt' test.out

#- 428 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'RdGWkpwV' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetPaymentAccounts' test.out

#- 429 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'iDvQ7tlJ' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '3z6oh0Un' \
    > test.out 2>&1
eval_tap $? 429 'PublicDeletePaymentAccount' test.out

#- 430 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXE14Ckc' \
    --autoCalcEstimatedPrice  \
    --language 'ENEzr37X' \
    --region 'St66bMay' \
    --storeId 'et1Cgis9' \
    --viewId 'baDO2bz3' \
    > test.out 2>&1
eval_tap $? 430 'PublicListActiveSections' test.out

#- 431 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnenXYr0' \
    --chargeStatus 'CHARGED' \
    --itemId 'UTjtjeMz' \
    --limit '72' \
    --offset '13' \
    --sku 'aj9PPP1S' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 431 'PublicQueryUserSubscriptions' test.out

#- 432 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'FvOoNJvx' \
    --body '{"currencyCode": "dOTEkUP1", "itemId": "8W84x6og", "language": "oXJ-409", "region": "9j7MgCpL", "returnUrl": "xdcCyPvU", "source": "v5srGMDo"}' \
    > test.out 2>&1
eval_tap $? 432 'PublicSubscribeSubscription' test.out

#- 433 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3e8D6j20' \
    --itemId 'wy4vsFu2' \
    > test.out 2>&1
eval_tap $? 433 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 434 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wAAEtyr2' \
    --userId 'Ri0jhDzI' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserSubscription' test.out

#- 435 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yviIS001' \
    --userId 'qNE4eJKn' \
    > test.out 2>&1
eval_tap $? 435 'PublicChangeSubscriptionBillingAccount' test.out

#- 436 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3jc4iT7v' \
    --userId 'AOUrjmjb' \
    --body '{"immediate": true, "reason": "uWEraIUX"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicCancelSubscription' test.out

#- 437 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MB2FkL3I' \
    --userId '6V6wro6F' \
    --excludeFree  \
    --limit '9' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetUserSubscriptionBillingHistories' test.out

#- 438 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'OZopxd6T' \
    --language 'O44iFKZh' \
    --storeId 'q9f1UUoy' \
    > test.out 2>&1
eval_tap $? 438 'PublicListViews' test.out

#- 439 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'RAdhSsH4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nb7rJTjY' \
    > test.out 2>&1
eval_tap $? 439 'PublicGetWallet' test.out

#- 440 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'Wg78rmwm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WTEjXGcr' \
    --limit '92' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 440 'PublicListUserWalletTransactions' test.out

#- 441 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate '026djqXy' \
    --baseAppId 'Aa4xhdl1' \
    --categoryPath 'arX3w36z' \
    --features 'WMedl1kQ' \
    --includeSubCategoryItem  \
    --itemName 'vQxAxZfx' \
    --itemStatus 'INACTIVE' \
    --itemType 'APP' \
    --limit '23' \
    --offset '62' \
    --region 's64yWLDv' \
    --sectionExclusive  \
    --sortBy 'updatedAt:desc,updatedAt:asc' \
    --storeId '3yJPAOex' \
    --tags '1p1GKYw9' \
    --targetNamespace 'hg0UhqBD' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 441 'QueryItems1' test.out

#- 442 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'S59gnOqQ' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 442 'ImportStore1' test.out

#- 443 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bpTHNg8B' \
    --body '{"itemIds": ["vNeNLQSf", "s3tFbVyH", "KSDeXXdN"]}' \
    > test.out 2>&1
eval_tap $? 443 'ExportStore1' test.out

#- 444 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZAZgRiRt' \
    --body '{"entitlementCollectionId": "ZBaSBDOD", "entitlementOrigin": "Twitch", "metadata": {"clwRJHSK": {}, "rXtFm0ho": {}, "rdVTAoxB": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "5Djzccni", "namespace": "14tLS4a0"}, "item": {"itemId": "TLYiV4km", "itemSku": "tYqvJQNf", "itemType": "MO6iwUu8"}, "quantity": 55, "type": "ITEM"}, {"currency": {"currencyCode": "jliiQExb", "namespace": "ycEodIUy"}, "item": {"itemId": "VQGyPLbC", "itemSku": "zuG7UnQ6", "itemType": "NVxlnocS"}, "quantity": 40, "type": "CURRENCY"}, {"currency": {"currencyCode": "dbFh7Npw", "namespace": "OyF5yOuD"}, "item": {"itemId": "qv4QEijv", "itemSku": "ajuiYx4X", "itemType": "b4C59Tmq"}, "quantity": 25, "type": "CURRENCY"}], "source": "PURCHASE", "transactionId": "euVMBVnS"}' \
    > test.out 2>&1
eval_tap $? 444 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
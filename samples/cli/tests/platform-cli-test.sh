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
echo "1..436"

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
    --id 'W0X4BIXx' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'PitVQGrg' \
    --body '{"grantDays": "X2oJygO9"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '43I3zksH' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'bJt1kABY' \
    --body '{"grantDays": "PEZ2VoGv"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "dmZXqSLA", "dryRun": false, "fulfillmentUrl": "pqkjK5d5", "itemType": "COINS", "purchaseConditionUrl": "STHP9rry"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'xqKplEMc' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'F2OlPDKT' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'YXiHTvJs' \
    --body '{"clazz": "zH8uLJKI", "dryRun": false, "fulfillmentUrl": "YTBMBpH0", "purchaseConditionUrl": "A6izoPJ0"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '21T5KgUq' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name '68DlxQJD' \
    --offset '24' \
    --tag 'lPP8dQWx' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0BX6dYGd", "items": [{"extraSubscriptionDays": 59, "itemId": "U7M9pfuL", "itemName": "bGIfCIS5", "quantity": 16}, {"extraSubscriptionDays": 83, "itemId": "BXEyPyHP", "itemName": "C7TgBx0d", "quantity": 47}, {"extraSubscriptionDays": 68, "itemId": "07WMyEMW", "itemName": "3QggWqFl", "quantity": 29}], "maxRedeemCountPerCampaignPerUser": 65, "maxRedeemCountPerCode": 49, "maxRedeemCountPerCodePerUser": 27, "maxSaleCount": 54, "name": "VtfrLkNr", "redeemEnd": "1980-07-10T00:00:00Z", "redeemStart": "1984-02-02T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["sR4aTxKr", "5zZiZd6y", "cRvRHsOU"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'IoDQsqa8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'O2G7J2qQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oxTyozZf", "items": [{"extraSubscriptionDays": 61, "itemId": "2SXOspSn", "itemName": "khnNyEgu", "quantity": 98}, {"extraSubscriptionDays": 51, "itemId": "k585VFom", "itemName": "u0FacODT", "quantity": 70}, {"extraSubscriptionDays": 63, "itemId": "6dKKg8df", "itemName": "9AjCfDKQ", "quantity": 56}], "maxRedeemCountPerCampaignPerUser": 87, "maxRedeemCountPerCode": 93, "maxRedeemCountPerCodePerUser": 40, "maxSaleCount": 65, "name": "N8wgkQNm", "redeemEnd": "1994-12-22T00:00:00Z", "redeemStart": "1997-11-01T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["pxZ9GjY4", "3fmc4EIw", "C6RnjPrL"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '2yryzZYx' \
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
    --body '{"appConfig": {"appName": "kEqbwPC5"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "xJCgNTTk"}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "kbmnWyUJ"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "sCbp5zRm"}, "extendType": "CUSTOM"}' \
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
    --storeId 'b4mDaQAF' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '89uvFHvE' \
    --body '{"categoryPath": "wsK0tuc0", "localizationDisplayNames": {"tWe2zt8p": "Zh9ABnf8", "ol5JXbJM": "CRKHpRkp", "wLVOVdqq": "VOOsIBGz"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FlAPZzpB' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'gYwba5fs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BnYBCPCd' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '0EpYGnea' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GFw02EUP' \
    --body '{"localizationDisplayNames": {"1KNpqBUN": "Ejo7q6J6", "jmHsgBD9": "qKx8aed3", "JyGSBqJV": "fWNeqx1O"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'g4wNbRIF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ry69eJUu' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '8uUkhQuG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iafszEMJ' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'K1O9GZQs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ByLGybor' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '78vLsocn' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '67' \
    --code 'hScKZlZo' \
    --limit '42' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'aw5M7PM5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 71}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'uvQnWH0L' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '9' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'Bb3EVfNf' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '64' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'RWxcyHKc' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '0' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '2YOln0Ly' \
    --namespace "$AB_NAMESPACE" \
    --code 'wVXnYv8l' \
    --limit '1' \
    --offset '20' \
    --userId 'eLiOukvl' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'HFkrA4ue' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'eFajf3X3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '70KYayMW' \
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
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 47 'ListCurrencies' test.out

#- 48 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "169lmqvw", "currencySymbol": "27rZduti", "currencyType": "VIRTUAL", "decimals": 6, "localizationDescriptions": {"moA4mRMh": "ugYYFPkf", "lGu29wfM": "DXQn6Iq4", "6Y9yB0Gu": "GeP8RttJ"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'PhUeDCsu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"8WhLv6P9": "SS3vvQdU", "t02PJM0r": "jZz3gngy", "txXq5In1": "hheizcHm"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '3metMClH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 's22ChCkC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '4YHhaWOM' \
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
    --body '{"data": [{"id": "vUJeX9Y6", "rewards": [{"currency": {"currencyCode": "7BNqfuX5", "namespace": "vjmF2jF6"}, "item": {"itemId": "WGbBaNMO", "itemSku": "tdVcNZWc", "itemType": "O1GdfKHd"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "cvQ5A5Ph", "namespace": "n2h6Luos"}, "item": {"itemId": "uimf1fsQ", "itemSku": "pIeDXRHx", "itemType": "tWr8ukJH"}, "quantity": 71, "type": "ITEM"}, {"currency": {"currencyCode": "ealxM4Vz", "namespace": "AoZzBwKm"}, "item": {"itemId": "ERz43any", "itemSku": "Z8rEGQv6", "itemType": "Zku4iRgd"}, "quantity": 85, "type": "CURRENCY"}]}, {"id": "ZwTUdoqz", "rewards": [{"currency": {"currencyCode": "hruzWSC3", "namespace": "REDf2VwY"}, "item": {"itemId": "7gS67HE9", "itemSku": "XraeSPBQ", "itemType": "GKSADYVP"}, "quantity": 67, "type": "CURRENCY"}, {"currency": {"currencyCode": "3y9LlH4A", "namespace": "mkvvanz0"}, "item": {"itemId": "MPqafGtm", "itemSku": "7yGxfMUC", "itemType": "MckQ4PrK"}, "quantity": 22, "type": "ITEM"}, {"currency": {"currencyCode": "NbntJyoS", "namespace": "gGOGNzmj"}, "item": {"itemId": "Lm8HUNc1", "itemSku": "uotspfKk", "itemType": "NTCwZEQJ"}, "quantity": 77, "type": "CURRENCY"}]}, {"id": "36Pg5bAi", "rewards": [{"currency": {"currencyCode": "rqTteA7u", "namespace": "rmn1Sy5A"}, "item": {"itemId": "LAkw5Spy", "itemSku": "Q1wpjI9t", "itemType": "HnkaFNSc"}, "quantity": 88, "type": "ITEM"}, {"currency": {"currencyCode": "wVC85RDE", "namespace": "RizDiBOy"}, "item": {"itemId": "Xd5prUMl", "itemSku": "A2I6cWn6", "itemType": "0fLivtkz"}, "quantity": 86, "type": "ITEM"}, {"currency": {"currencyCode": "G8W5X51G", "namespace": "yMHejdF8"}, "item": {"itemId": "Lurac0IH", "itemSku": "12DEKI6T", "itemType": "GQzy197l"}, "quantity": 83, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"ZbEg9zOg": "09zm3uCJ", "yF43DtLj": "XaXf96DZ", "eyrGHfan": "olUC8C3T"}}, {"platform": "STEAM", "platformDlcIdMap": {"W76h7XtM": "glLT60Y5", "cLVEt59H": "iOqoohYC", "X8hocngb": "mSpQnsPC"}}, {"platform": "PSN", "platformDlcIdMap": {"2Q1ut5Co": "SWWlbEiF", "QQA6MI4d": "z5OZe4a3", "6NEPArgS": "oibKB7o3"}}]}' \
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
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'SFagDTgm' \
    --itemId 'QvEiHUWB,DLMZkC8T,0fSti05V' \
    --limit '2' \
    --offset '3' \
    --origin 'Xbox' \
    --userId 'tuC2yy0E' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'MwLle5hq,OMgkwwLt,N0nOZ3dZ' \
    --limit '2' \
    --offset '72' \
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
    --body '{"entitlementGrantList": [{"endDate": "1983-05-07T00:00:00Z", "grantedCode": "bES2V4gi", "itemId": "VdAW2liF", "itemNamespace": "cumXraxa", "language": "XWul_874", "origin": "GooglePlay", "quantity": 15, "region": "pESdhDn5", "source": "REWARD", "startDate": "1971-11-03T00:00:00Z", "storeId": "4EHwh0cc"}, {"endDate": "1986-10-07T00:00:00Z", "grantedCode": "tNnu4X9p", "itemId": "3kzufjPq", "itemNamespace": "oaYM2JHq", "language": "cBGz-pGOQ-lN", "origin": "Playstation", "quantity": 48, "region": "7DIBJ0IQ", "source": "REFERRAL_BONUS", "startDate": "1977-01-26T00:00:00Z", "storeId": "pgJT8mOO"}, {"endDate": "1984-06-19T00:00:00Z", "grantedCode": "CB4Hp2V7", "itemId": "tpXTmX9A", "itemNamespace": "udWlbNGU", "language": "Pn_fTgQ-959", "origin": "Steam", "quantity": 26, "region": "GKbGfoP6", "source": "GIFT", "startDate": "1991-02-08T00:00:00Z", "storeId": "QS3ynW8P"}], "userIds": ["GodXfhRA", "NyVHfzP7", "0mgk7pHH"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["7K3Wjq6O", "LnSeTyHx", "WKS2EwY2"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'dMNK4acU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '30' \
    --status 'SUCCESS' \
    --userId 'gaaBFk6E' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'n6G8juRk' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'sYxGBF9y' \
    --limit '56' \
    --offset '4' \
    --startTime 'I4sNdG3I' \
    --status 'SUCCESS' \
    --userId '5dqGr06Z' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "w0dRaX0r", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 56, "clientTransactionId": "UCzopIpQ"}, {"amountConsumed": 43, "clientTransactionId": "lpaQuf8r"}, {"amountConsumed": 59, "clientTransactionId": "uNcETfPE"}], "entitlementId": "KlqDHHWk", "usageCount": 15}, {"clientTransaction": [{"amountConsumed": 21, "clientTransactionId": "f4OaCSxj"}, {"amountConsumed": 100, "clientTransactionId": "LfyIbsRP"}, {"amountConsumed": 27, "clientTransactionId": "S73hVcDv"}], "entitlementId": "Vr1efKq3", "usageCount": 25}, {"clientTransaction": [{"amountConsumed": 76, "clientTransactionId": "ZuV40NQz"}, {"amountConsumed": 67, "clientTransactionId": "c8ewmZ59"}, {"amountConsumed": 100, "clientTransactionId": "VOaqw1iN"}], "entitlementId": "mnSbhHkV", "usageCount": 13}], "purpose": "7dfBPzz6"}, "originalTitleName": "gGzmV9vT", "paymentProductSKU": "T0gcpHKc", "purchaseDate": "JYz7fHth", "sourceOrderItemId": "xF5763Vi", "titleName": "MJBKCJtn"}, "eventDomain": "mEv0xGDH", "eventSource": "IIH3LSMO", "eventType": "T9CIowyi", "eventVersion": 16, "id": "GhrnKTTB", "timestamp": "ZVst03cY"}' \
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
    --body '{"bundleId": "cDf1WAD5", "password": "b6x8TUxz"}' \
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
    --body '{"sandboxId": "VomIAcWp"}' \
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
    --body '{"applicationName": "LMcvj2ve", "serviceAccountId": "nZwToMNn"}' \
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
    --body '{"data": [{"itemIdentity": "f2Ix41MM", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"hOAZzcQT": "Qt7dZfb7", "1cg320al": "hfntyj2c", "W26aabeF": "ssyf5Uqb"}}, {"itemIdentity": "eRbDIspD", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"qm1ii4BC": "1aLNKCGC", "BDYGl2AZ": "2rEnx4lx", "BWC6D26w": "g8dwL6T4"}}, {"itemIdentity": "PoA2NdU8", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"tPxqgTKE": "W8TU2i3Z", "TUTTu1qq": "6SK67AwZ", "UvcSxxWl": "UTVUFR3v"}}]}' \
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
    --body '{"appId": "naL1wmh3", "appSecret": "LPw4d7k0"}' \
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
    --body '{"backOfficeServerClientId": "zW1oPaY8", "backOfficeServerClientSecret": "Uh0FwsdW", "enableStreamJob": true, "environment": "hTF1zSrB", "streamName": "0JNB1QJS", "streamPartnerName": "s7kJhJfR"}' \
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
    --body '{"backOfficeServerClientId": "2f1kpuvl", "backOfficeServerClientSecret": "LG6ASgF8", "enableStreamJob": true, "environment": "O1S6Mza0", "streamName": "gpiuNq5f", "streamPartnerName": "VIOPjSMK"}' \
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
    --body '{"appId": "kfrjQIY1", "publisherAuthenticationKey": "CKhhgaP5"}' \
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
    --body '{"clientId": "2zSkXxZX", "clientSecret": "svRvG2sf", "organizationId": "HGfClCDH"}' \
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
    --body '{"relyingPartyCert": "1Mh78cDA"}' \
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
    --password '48xBUznS' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'TzX3DNon' \
    --itemId 'Qgx0308J' \
    --itemType 'EXTENSION' \
    --endTime '4gBgMpyg' \
    --startTime '0BI6bs0A' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'L7xChda6' \
    --itemId 'fNLdVOAW' \
    --itemType 'SUBSCRIPTION' \
    --endTime '1SgaPbc2' \
    --startTime 'FlZE4DI6' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '5PawVdlm' \
    --body '{"categoryPath": "qeGqs02z", "targetItemId": "wrM3Oc2B", "targetNamespace": "UTbtB3Yy"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kj9ZNg6P' \
    --body '{"appId": "geFjtBfc", "appType": "DLC", "baseAppId": "P5jlOs8S", "boothName": "Md34t2k9", "categoryPath": "b06eQi4r", "clazz": "ZNoP8gtB", "displayOrder": 75, "entitlementType": "DURABLE", "ext": {"M7O9qgxb": {}, "G7f4Ceks": {}, "9CtMbizG": {}}, "features": ["kBCyAAHr", "GX3jIicn", "MHkvt7wZ"], "flexible": true, "images": [{"as": "SCS6kKmi", "caption": "f7uhkx4T", "height": 29, "imageUrl": "mkPbdMRG", "smallImageUrl": "418m8gPm", "width": 8}, {"as": "3M2yakn1", "caption": "KRliBAiM", "height": 10, "imageUrl": "8ZmOx5bu", "smallImageUrl": "eAIQJ1Kp", "width": 19}, {"as": "4s8luK7q", "caption": "3XvQpuAL", "height": 0, "imageUrl": "F59WoGes", "smallImageUrl": "wRnwewQr", "width": 98}], "itemIds": ["eBt78oPM", "d8IWf4j9", "OvhbWGPM"], "itemQty": {"3jCCtUHj": 64, "qkPdi4H8": 62, "54mBa65D": 54}, "itemType": "COINS", "listable": false, "localizations": {"VgRwBpZ7": {"description": "4gezx1LN", "localExt": {"YKudIJU8": {}, "60YetKU3": {}, "ZkkYQSXB": {}}, "longDescription": "hKOb0llO", "title": "V7S3vKCm"}, "rqqGeCmr": {"description": "1dCad5Kb", "localExt": {"nmVLbCZt": {}, "rvs3I5NG": {}, "KXf0zA1b": {}}, "longDescription": "BVUFE44o", "title": "FoGgOees"}, "4jSv2XXl": {"description": "qMxfpEYb", "localExt": {"VH7CZMmX": {}, "cKOUDhHm": {}, "HMGPIgMW": {}}, "longDescription": "qB17P2gl", "title": "6ASpx2sW"}}, "lootBoxConfig": {"rewardCount": 82, "rewards": [{"lootBoxItems": [{"count": 18, "duration": 26, "endDate": "1983-09-17T00:00:00Z", "itemId": "msmljeck", "itemSku": "p637R9uE", "itemType": "FzLQM75R"}, {"count": 76, "duration": 37, "endDate": "1984-10-31T00:00:00Z", "itemId": "6GZVZOXD", "itemSku": "kmlomu95", "itemType": "xNQfIufa"}, {"count": 50, "duration": 23, "endDate": "1980-03-12T00:00:00Z", "itemId": "DPNlgmNW", "itemSku": "6yRvlocA", "itemType": "tdIEXATd"}], "name": "1wHCs0lD", "odds": 0.25540603814648155, "type": "REWARD_GROUP", "weight": 82}, {"lootBoxItems": [{"count": 34, "duration": 11, "endDate": "1979-12-28T00:00:00Z", "itemId": "BCo27Rds", "itemSku": "ycglvIOY", "itemType": "DmZwxKav"}, {"count": 43, "duration": 16, "endDate": "1990-02-20T00:00:00Z", "itemId": "gWpcMTcA", "itemSku": "ax4PgYzI", "itemType": "R0KhZqfC"}, {"count": 78, "duration": 55, "endDate": "1990-03-04T00:00:00Z", "itemId": "ImhvGx3L", "itemSku": "qmqZqKTA", "itemType": "VqnYl5DF"}], "name": "qUgKEdqD", "odds": 0.04508448864808101, "type": "REWARD_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 61, "duration": 17, "endDate": "1973-07-06T00:00:00Z", "itemId": "pdPz3TJk", "itemSku": "oQUcYnNb", "itemType": "7mwQ8thq"}, {"count": 50, "duration": 67, "endDate": "1983-02-23T00:00:00Z", "itemId": "oSPMRq0G", "itemSku": "LMHwhMOv", "itemType": "AXQgIQET"}, {"count": 14, "duration": 91, "endDate": "1987-03-06T00:00:00Z", "itemId": "3C6uDmVI", "itemSku": "wI9JZlHW", "itemType": "e05txCNW"}], "name": "AhG7qZTa", "odds": 0.18415763851055145, "type": "REWARD_GROUP", "weight": 9}], "rollFunction": "CUSTOM"}, "maxCount": 79, "maxCountPerUser": 36, "name": "aZKdh9oF", "optionBoxConfig": {"boxItems": [{"count": 89, "duration": 84, "endDate": "1995-04-01T00:00:00Z", "itemId": "9ZADTFGS", "itemSku": "SItCdlpa", "itemType": "S5YpM6iQ"}, {"count": 49, "duration": 8, "endDate": "1996-08-17T00:00:00Z", "itemId": "dJ4qCY52", "itemSku": "QG4cdtXs", "itemType": "bnkV0GLF"}, {"count": 99, "duration": 69, "endDate": "1988-05-27T00:00:00Z", "itemId": "ak4FFvd6", "itemSku": "gUMmOgzt", "itemType": "tRz5bKdt"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 4, "fixedTrialCycles": 96, "graceDays": 91}, "regionData": {"9U9raFqe": [{"currencyCode": "RLmSQJU7", "currencyNamespace": "oK7b5i6O", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1994-06-26T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1998-02-04T00:00:00Z", "expireAt": "1990-05-04T00:00:00Z", "price": 46, "purchaseAt": "1980-03-08T00:00:00Z", "trialPrice": 63}, {"currencyCode": "7vvx3eFb", "currencyNamespace": "vSxcF5ik", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1992-02-29T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1999-03-09T00:00:00Z", "expireAt": "1975-09-13T00:00:00Z", "price": 64, "purchaseAt": "1978-03-29T00:00:00Z", "trialPrice": 70}, {"currencyCode": "ueDQUlzp", "currencyNamespace": "Gomhok8v", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1976-04-26T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1996-10-23T00:00:00Z", "expireAt": "1992-09-02T00:00:00Z", "price": 50, "purchaseAt": "1990-11-20T00:00:00Z", "trialPrice": 6}], "OZzH3fmg": [{"currencyCode": "MZI1mnR3", "currencyNamespace": "0DbhDGfk", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1997-03-21T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1988-01-19T00:00:00Z", "expireAt": "1992-02-03T00:00:00Z", "price": 41, "purchaseAt": "1990-03-19T00:00:00Z", "trialPrice": 55}, {"currencyCode": "mglr9ADw", "currencyNamespace": "CbGEC8I2", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1988-02-24T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1989-11-22T00:00:00Z", "expireAt": "1995-12-02T00:00:00Z", "price": 41, "purchaseAt": "1990-12-13T00:00:00Z", "trialPrice": 83}, {"currencyCode": "BxyrGSTT", "currencyNamespace": "7FfoDlGa", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1982-08-02T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1979-10-08T00:00:00Z", "expireAt": "1991-10-14T00:00:00Z", "price": 100, "purchaseAt": "1982-04-08T00:00:00Z", "trialPrice": 61}], "rXsFwU0d": [{"currencyCode": "ar4EyQBq", "currencyNamespace": "P2PMfayo", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1983-01-08T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1991-01-31T00:00:00Z", "expireAt": "1974-09-11T00:00:00Z", "price": 60, "purchaseAt": "1994-07-20T00:00:00Z", "trialPrice": 29}, {"currencyCode": "fxD7Qxb1", "currencyNamespace": "323MO5zc", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1993-09-21T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1993-05-08T00:00:00Z", "expireAt": "1994-08-25T00:00:00Z", "price": 49, "purchaseAt": "1990-07-19T00:00:00Z", "trialPrice": 2}, {"currencyCode": "2U1BIy2Z", "currencyNamespace": "fhM1FZJq", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1986-08-02T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1995-11-30T00:00:00Z", "expireAt": "1978-05-18T00:00:00Z", "price": 60, "purchaseAt": "1985-12-14T00:00:00Z", "trialPrice": 62}]}, "saleConfig": {"currencyCode": "FSyzFlvW", "price": 4}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "ecWERmRk", "stackable": false, "status": "ACTIVE", "tags": ["Z5WtP4mx", "ggZvTqjm", "JrRbmTHw"], "targetCurrencyCode": "q02JKEEW", "targetNamespace": "Gsqd9HlJ", "thumbnailUrl": "wbNiwvyF", "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Ne1Mq2OK' \
    --appId '04Gvgrf5' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'Sxa0bWOL' \
    --baseAppId 'A7Arg68D' \
    --categoryPath '0H0379iF' \
    --features 'DmTuWbFh' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '76' \
    --offset '87' \
    --region 'uVWo4MJI' \
    --sortBy 'createdAt:asc,displayOrder:desc,updatedAt' \
    --storeId 'K46eIV5M' \
    --tags 'Vo8orYCW' \
    --targetNamespace 'haLgq55Z' \
    > test.out 2>&1
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '7Q2hCgma,jYNh2gnM,a8oibWSr' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Ud4dDU1L' \
    --itemIds 'NjLgmRMp' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'AFhtA6U7' \
    --sku '2a9lGYQJ' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'sMor09wo' \
    --populateBundle  \
    --region 'OdXjjSGN' \
    --storeId 'Oen28TqZ' \
    --sku 'A8kJqYrY' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'Iid3FpJd' \
    --storeId 'X3BnGDXz' \
    --itemIds 'qpiMQIaU' \
    --userId 'Rkomd2Y3' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ePKx4SQf' \
    --sku 'wgzuvJ33' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'QMhcigKu,K4mt7cE5,IlTFy0pW' \
    --storeId '8SCOPfaJ' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '2x3ySpLW' \
    --region '7hUe4ui9' \
    --storeId 'wi0n2rHQ' \
    --itemIds 'hMFNcvgi' \
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
    --userId 'bTIQ6Po3' \
    --body '{"itemIds": ["RH5YaUu0", "K5h9l8xZ", "YVHOz5Xo"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ee5zn7Vt' \
    --body '{"changes": [{"itemIdentities": ["sKsfKATp", "JNTphNx0", "idmqdX8G"], "itemIdentityType": "ITEM_SKU", "regionData": {"pHJ1Iw18": [{"currencyCode": "4wC6gGYY", "currencyNamespace": "T27Apb5b", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1990-08-22T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-04-13T00:00:00Z", "discountedPrice": 31, "expireAt": "1981-09-03T00:00:00Z", "price": 70, "purchaseAt": "1990-04-27T00:00:00Z", "trialPrice": 34}, {"currencyCode": "xlavSBlC", "currencyNamespace": "3Spn1BSo", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1976-11-14T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1996-11-05T00:00:00Z", "discountedPrice": 34, "expireAt": "1981-07-27T00:00:00Z", "price": 57, "purchaseAt": "1971-05-14T00:00:00Z", "trialPrice": 54}, {"currencyCode": "5cWRwFkR", "currencyNamespace": "H0Zfj560", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1989-09-05T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1981-10-09T00:00:00Z", "discountedPrice": 72, "expireAt": "1978-01-01T00:00:00Z", "price": 73, "purchaseAt": "1988-10-31T00:00:00Z", "trialPrice": 37}], "1GwVtdy9": [{"currencyCode": "ztGf3rSA", "currencyNamespace": "UbjsiMHt", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1994-11-07T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-10-12T00:00:00Z", "discountedPrice": 62, "expireAt": "1980-09-26T00:00:00Z", "price": 14, "purchaseAt": "1994-05-15T00:00:00Z", "trialPrice": 44}, {"currencyCode": "UcX8dq7v", "currencyNamespace": "nkjet8cR", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1980-08-26T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1976-02-01T00:00:00Z", "discountedPrice": 38, "expireAt": "1973-02-16T00:00:00Z", "price": 69, "purchaseAt": "1981-05-27T00:00:00Z", "trialPrice": 43}, {"currencyCode": "e3rHbQKD", "currencyNamespace": "D62Gt9MZ", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1993-04-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1999-01-11T00:00:00Z", "discountedPrice": 90, "expireAt": "1976-09-06T00:00:00Z", "price": 42, "purchaseAt": "1976-07-28T00:00:00Z", "trialPrice": 24}], "11RiSgsJ": [{"currencyCode": "rc7D5XVr", "currencyNamespace": "1N6Gz1wE", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1997-11-11T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1972-01-17T00:00:00Z", "discountedPrice": 53, "expireAt": "1994-02-26T00:00:00Z", "price": 83, "purchaseAt": "1979-06-15T00:00:00Z", "trialPrice": 31}, {"currencyCode": "RSHnu5Pi", "currencyNamespace": "kCQyZcLE", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1986-01-16T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1981-02-03T00:00:00Z", "discountedPrice": 78, "expireAt": "1986-06-17T00:00:00Z", "price": 73, "purchaseAt": "1990-07-01T00:00:00Z", "trialPrice": 98}, {"currencyCode": "xtTYH3MW", "currencyNamespace": "qz4GhJt2", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1972-02-24T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1988-10-21T00:00:00Z", "discountedPrice": 85, "expireAt": "1995-02-25T00:00:00Z", "price": 47, "purchaseAt": "1981-08-26T00:00:00Z", "trialPrice": 82}]}}, {"itemIdentities": ["Erepl1cp", "k2WQH28L", "VpwANBmY"], "itemIdentityType": "ITEM_SKU", "regionData": {"sGHH1DAL": [{"currencyCode": "YBWkAv68", "currencyNamespace": "RsPdrvYk", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1974-01-10T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1975-09-04T00:00:00Z", "discountedPrice": 9, "expireAt": "1996-07-02T00:00:00Z", "price": 10, "purchaseAt": "1990-04-19T00:00:00Z", "trialPrice": 16}, {"currencyCode": "DGU4ergP", "currencyNamespace": "ImMgMfnn", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1996-04-09T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1982-01-09T00:00:00Z", "discountedPrice": 12, "expireAt": "1997-12-30T00:00:00Z", "price": 40, "purchaseAt": "1979-08-27T00:00:00Z", "trialPrice": 62}, {"currencyCode": "v1wA2y6D", "currencyNamespace": "PbpbP4Ac", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1978-03-03T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1978-08-25T00:00:00Z", "discountedPrice": 62, "expireAt": "1999-09-16T00:00:00Z", "price": 46, "purchaseAt": "1979-01-09T00:00:00Z", "trialPrice": 87}], "HBggWS3T": [{"currencyCode": "7CwQF9lQ", "currencyNamespace": "9sHNSou4", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1984-07-12T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1975-07-21T00:00:00Z", "discountedPrice": 58, "expireAt": "1994-05-03T00:00:00Z", "price": 37, "purchaseAt": "1991-09-27T00:00:00Z", "trialPrice": 28}, {"currencyCode": "nFMKwRwg", "currencyNamespace": "m0aXvnPN", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1981-12-01T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1989-12-30T00:00:00Z", "discountedPrice": 59, "expireAt": "1996-09-08T00:00:00Z", "price": 53, "purchaseAt": "1971-08-03T00:00:00Z", "trialPrice": 77}, {"currencyCode": "NH1yXhaf", "currencyNamespace": "41IVYF7F", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1979-07-02T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1991-02-23T00:00:00Z", "discountedPrice": 82, "expireAt": "1982-12-11T00:00:00Z", "price": 51, "purchaseAt": "1989-02-26T00:00:00Z", "trialPrice": 73}], "QLcjGbDK": [{"currencyCode": "PRenrRsZ", "currencyNamespace": "LGL0ld1W", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1988-11-19T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1979-07-01T00:00:00Z", "discountedPrice": 29, "expireAt": "1998-07-27T00:00:00Z", "price": 44, "purchaseAt": "1988-01-08T00:00:00Z", "trialPrice": 36}, {"currencyCode": "hFXDEhag", "currencyNamespace": "kTfNcmiY", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1978-11-05T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1999-04-06T00:00:00Z", "discountedPrice": 28, "expireAt": "1984-04-14T00:00:00Z", "price": 0, "purchaseAt": "1995-09-23T00:00:00Z", "trialPrice": 51}, {"currencyCode": "N4xHHrfi", "currencyNamespace": "an4WcMjA", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1972-12-04T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1997-08-17T00:00:00Z", "discountedPrice": 58, "expireAt": "1996-01-02T00:00:00Z", "price": 32, "purchaseAt": "1988-05-29T00:00:00Z", "trialPrice": 8}]}}, {"itemIdentities": ["Alyg1CeY", "9mIfmPTX", "6BjmdO25"], "itemIdentityType": "ITEM_SKU", "regionData": {"GGYmcMVd": [{"currencyCode": "Ues1XP4w", "currencyNamespace": "X575UUBh", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1979-06-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1983-11-17T00:00:00Z", "discountedPrice": 19, "expireAt": "1993-09-17T00:00:00Z", "price": 10, "purchaseAt": "1997-08-06T00:00:00Z", "trialPrice": 45}, {"currencyCode": "yvGFI6g7", "currencyNamespace": "6czjMQEL", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1990-03-17T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1979-01-10T00:00:00Z", "discountedPrice": 20, "expireAt": "1979-10-16T00:00:00Z", "price": 47, "purchaseAt": "1989-08-06T00:00:00Z", "trialPrice": 10}, {"currencyCode": "SvErHo0v", "currencyNamespace": "bTfG9ZTZ", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1988-07-08T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1975-06-30T00:00:00Z", "discountedPrice": 18, "expireAt": "1974-01-12T00:00:00Z", "price": 7, "purchaseAt": "1982-11-27T00:00:00Z", "trialPrice": 46}], "DeaTRKhC": [{"currencyCode": "pgsn7qsI", "currencyNamespace": "GS2V5G03", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1999-02-02T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1989-03-29T00:00:00Z", "discountedPrice": 49, "expireAt": "1999-11-26T00:00:00Z", "price": 17, "purchaseAt": "1982-06-21T00:00:00Z", "trialPrice": 66}, {"currencyCode": "jnLoYg92", "currencyNamespace": "RPJVoLUh", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1999-08-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1998-03-19T00:00:00Z", "discountedPrice": 70, "expireAt": "1995-10-14T00:00:00Z", "price": 37, "purchaseAt": "1981-09-30T00:00:00Z", "trialPrice": 92}, {"currencyCode": "vJNCtVLB", "currencyNamespace": "TEpGCiY0", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1996-10-09T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1981-01-09T00:00:00Z", "discountedPrice": 50, "expireAt": "1996-09-24T00:00:00Z", "price": 97, "purchaseAt": "1989-11-12T00:00:00Z", "trialPrice": 82}], "t8scVlPb": [{"currencyCode": "UxaDxLGl", "currencyNamespace": "GauVPRNR", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1977-01-05T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1995-11-29T00:00:00Z", "discountedPrice": 25, "expireAt": "1983-10-12T00:00:00Z", "price": 11, "purchaseAt": "1982-06-07T00:00:00Z", "trialPrice": 23}, {"currencyCode": "bMR4n2sH", "currencyNamespace": "UiLCPLJz", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1996-02-28T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1985-08-06T00:00:00Z", "discountedPrice": 36, "expireAt": "1979-03-17T00:00:00Z", "price": 24, "purchaseAt": "1992-06-27T00:00:00Z", "trialPrice": 80}, {"currencyCode": "Ln4keFZ3", "currencyNamespace": "0beuKyIR", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1975-07-16T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1977-03-08T00:00:00Z", "discountedPrice": 80, "expireAt": "1985-04-06T00:00:00Z", "price": 71, "purchaseAt": "1991-01-20T00:00:00Z", "trialPrice": 73}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '87' \
    --offset '97' \
    --sortBy 'uh8fxrMX' \
    --storeId '0NrnDMsQ' \
    --keyword 'gC7ho1Ms' \
    --language 'X2SwILV5' \
    > test.out 2>&1
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '13' \
    --offset '21' \
    --sortBy 'createdAt:asc,displayOrder:desc,updatedAt' \
    --storeId 'hvbIvUMi' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'BvWp25X0' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'e184UEVV' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'yCfMIsOD' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7ubQkwsv' \
    --body '{"appId": "r8SP6KTt", "appType": "SOFTWARE", "baseAppId": "blz5Usi1", "boothName": "fWL9QCDN", "categoryPath": "xs4Rr3dB", "clazz": "N5TbceTn", "displayOrder": 58, "entitlementType": "DURABLE", "ext": {"J25TQlaC": {}, "IPwkejUB": {}, "V2KkmHb5": {}}, "features": ["FneTl49M", "yhMVAJix", "OoIi6U0d"], "flexible": false, "images": [{"as": "J3pJRNBf", "caption": "TTc3o01G", "height": 65, "imageUrl": "4FO3PFW1", "smallImageUrl": "nmhmDfHb", "width": 18}, {"as": "4O3KHt8u", "caption": "XifjcTt2", "height": 78, "imageUrl": "MfzF6sLV", "smallImageUrl": "wufzRmHL", "width": 78}, {"as": "UkjfatDV", "caption": "kfKNTFOW", "height": 49, "imageUrl": "VvlDsTE5", "smallImageUrl": "pV0lbz7o", "width": 10}], "itemIds": ["upvCC8Nb", "Uk31wpy6", "nSg4rh31"], "itemQty": {"cbbGKrWY": 18, "D8vFZwlH": 39, "tByoYZrg": 99}, "itemType": "CODE", "listable": true, "localizations": {"oxRs9H1Y": {"description": "5lTV3Vwv", "localExt": {"cBhICM0t": {}, "VBO6UNNL": {}, "x4FskWgl": {}}, "longDescription": "w5zsqKi2", "title": "GHzDJIVu"}, "KAk6ZYhR": {"description": "v5p5cZoR", "localExt": {"TZdaAV9I": {}, "p54XURmZ": {}, "Th64WcTd": {}}, "longDescription": "wHqGBeeB", "title": "ooiS82Wj"}, "YRYU36wE": {"description": "lx9ClXpY", "localExt": {"jl1K02lb": {}, "sWP7YStz": {}, "HlsItING": {}}, "longDescription": "7U1OEM3T", "title": "mHuALe3c"}}, "lootBoxConfig": {"rewardCount": 62, "rewards": [{"lootBoxItems": [{"count": 93, "duration": 95, "endDate": "1987-09-10T00:00:00Z", "itemId": "ocAIR5sX", "itemSku": "mZOpGKcg", "itemType": "EHKhMcef"}, {"count": 62, "duration": 70, "endDate": "1975-11-28T00:00:00Z", "itemId": "1OVvsMZ6", "itemSku": "Y8D5w06R", "itemType": "MSX5FvEw"}, {"count": 55, "duration": 22, "endDate": "1990-03-02T00:00:00Z", "itemId": "mKh0eW3H", "itemSku": "0JYevuMA", "itemType": "Lu2qU9UA"}], "name": "Qao0W6Lo", "odds": 0.14040814108993338, "type": "REWARD", "weight": 0}, {"lootBoxItems": [{"count": 19, "duration": 77, "endDate": "1989-10-28T00:00:00Z", "itemId": "N4g8B1e9", "itemSku": "DPWAn1Ut", "itemType": "ba6iaURe"}, {"count": 37, "duration": 43, "endDate": "1995-08-07T00:00:00Z", "itemId": "1D94gsRH", "itemSku": "v4rdAvUP", "itemType": "aeZBZpU4"}, {"count": 72, "duration": 57, "endDate": "1979-03-12T00:00:00Z", "itemId": "luPh48dS", "itemSku": "X0jsLBXS", "itemType": "7cAJStsu"}], "name": "sP4y5F1O", "odds": 0.3010773042809628, "type": "REWARD", "weight": 64}, {"lootBoxItems": [{"count": 55, "duration": 3, "endDate": "1999-11-26T00:00:00Z", "itemId": "CENPYYzo", "itemSku": "o62M7vFC", "itemType": "CyfY7lWe"}, {"count": 53, "duration": 81, "endDate": "1999-08-18T00:00:00Z", "itemId": "c2tnka3f", "itemSku": "uu5RZYa0", "itemType": "dR4RetAA"}, {"count": 54, "duration": 58, "endDate": "1989-09-19T00:00:00Z", "itemId": "IGfcJHtG", "itemSku": "TTsS5aYS", "itemType": "9etsotfg"}], "name": "9EzFJVst", "odds": 0.34895908051325875, "type": "REWARD", "weight": 94}], "rollFunction": "DEFAULT"}, "maxCount": 9, "maxCountPerUser": 10, "name": "Bi818pGW", "optionBoxConfig": {"boxItems": [{"count": 55, "duration": 48, "endDate": "1983-06-09T00:00:00Z", "itemId": "ISahw3Rv", "itemSku": "mjmwRJr4", "itemType": "2hCR87Df"}, {"count": 70, "duration": 65, "endDate": "1980-04-23T00:00:00Z", "itemId": "spCDagTS", "itemSku": "KyXmj13n", "itemType": "8uGdZ6vn"}, {"count": 54, "duration": 81, "endDate": "1999-04-11T00:00:00Z", "itemId": "4YRRbbpW", "itemSku": "WsnJon2E", "itemType": "wlfbQBqf"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 39, "fixedTrialCycles": 61, "graceDays": 90}, "regionData": {"xgP3edXJ": [{"currencyCode": "90oGeonz", "currencyNamespace": "T7MPcwF5", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1998-09-18T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1983-03-18T00:00:00Z", "expireAt": "1973-10-04T00:00:00Z", "price": 30, "purchaseAt": "1993-07-09T00:00:00Z", "trialPrice": 56}, {"currencyCode": "RtrlNeKS", "currencyNamespace": "TH4AmJ81", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1977-11-16T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1983-06-09T00:00:00Z", "expireAt": "1985-08-03T00:00:00Z", "price": 55, "purchaseAt": "1991-06-20T00:00:00Z", "trialPrice": 61}, {"currencyCode": "AqVtbaP3", "currencyNamespace": "PqvMaA9m", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1976-09-16T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1984-01-02T00:00:00Z", "expireAt": "1983-11-23T00:00:00Z", "price": 54, "purchaseAt": "1975-10-09T00:00:00Z", "trialPrice": 8}], "iPqtwRYb": [{"currencyCode": "7frhT3Gc", "currencyNamespace": "wwGH4Lx9", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1971-06-04T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1984-05-27T00:00:00Z", "expireAt": "1984-05-06T00:00:00Z", "price": 90, "purchaseAt": "1972-01-10T00:00:00Z", "trialPrice": 71}, {"currencyCode": "yxUO8hqX", "currencyNamespace": "nSEqELaQ", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1971-11-19T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1987-11-16T00:00:00Z", "expireAt": "1975-04-03T00:00:00Z", "price": 98, "purchaseAt": "1976-09-24T00:00:00Z", "trialPrice": 44}, {"currencyCode": "s1JIvqRn", "currencyNamespace": "X5HvgXV6", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1991-06-15T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1998-10-08T00:00:00Z", "expireAt": "1999-06-14T00:00:00Z", "price": 14, "purchaseAt": "1994-04-30T00:00:00Z", "trialPrice": 93}], "PZGHivHX": [{"currencyCode": "tuOIIsl0", "currencyNamespace": "X7AKWtLF", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1993-12-05T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1999-03-20T00:00:00Z", "expireAt": "1977-03-17T00:00:00Z", "price": 28, "purchaseAt": "1999-12-02T00:00:00Z", "trialPrice": 89}, {"currencyCode": "EnkuSBeU", "currencyNamespace": "CVb6i2Tp", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1971-09-30T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1974-07-01T00:00:00Z", "expireAt": "1980-10-16T00:00:00Z", "price": 80, "purchaseAt": "1971-09-21T00:00:00Z", "trialPrice": 46}, {"currencyCode": "c7ReodtS", "currencyNamespace": "pYnFcUQ1", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1999-03-11T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1999-05-29T00:00:00Z", "expireAt": "1980-05-27T00:00:00Z", "price": 60, "purchaseAt": "1986-06-15T00:00:00Z", "trialPrice": 70}]}, "saleConfig": {"currencyCode": "O7Fg0xmR", "price": 34}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "ruS0lhOx", "stackable": false, "status": "INACTIVE", "tags": ["oQzlMPDb", "gsjblN5e", "hLQd5hC1"], "targetCurrencyCode": "n0eH1myh", "targetNamespace": "mZBr6AQz", "thumbnailUrl": "9Dh2Lrj6", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'ykoDd0Xx' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'X5mBI4Wk' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'ps6Ls9Es' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 84, "orderNo": "OF6eb2WO"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'TAvERDc1' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'IXUKdvR4' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'ucTbJLJt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZNljGfGw' \
    --body '{"carousel": [{"alt": "zozDKpTw", "previewUrl": "ZnaEZrpc", "thumbnailUrl": "gS8xQCi5", "type": "video", "url": "wpqEAFGs", "videoSource": "generic"}, {"alt": "1yjc5SSO", "previewUrl": "JsRD2SO2", "thumbnailUrl": "w3uCGFy1", "type": "video", "url": "clQtLdOk", "videoSource": "generic"}, {"alt": "ypacWcHn", "previewUrl": "6MWYZGqp", "thumbnailUrl": "gQT7zKsI", "type": "video", "url": "V9KKjQE2", "videoSource": "vimeo"}], "developer": "YRCOBmto", "forumUrl": "cDsuLzFa", "genres": ["Casual", "Indie", "Adventure"], "localizations": {"Z2wSPHh0": {"announcement": "TguHfq7N", "slogan": "C2jb70Fd"}, "CNi6qfhf": {"announcement": "gbNEOAAq", "slogan": "xLrfNZOj"}, "7UgsZ8Hh": {"announcement": "xtkyZMxE", "slogan": "CMO4KoGW"}}, "platformRequirements": {"YQ36wRDf": [{"additionals": "t2s6UgaX", "directXVersion": "0BLiuMfw", "diskSpace": "TESSyO9U", "graphics": "zSpssMEe", "label": "Hkxhu04g", "osVersion": "lYBsKIry", "processor": "H8Cun1Ux", "ram": "hf05Wm4L", "soundCard": "jJ6hLF7m"}, {"additionals": "NM62dpQa", "directXVersion": "rcom5eGJ", "diskSpace": "gFByT1EH", "graphics": "SNHzrmfT", "label": "W62Rq5YG", "osVersion": "5kNoCB9e", "processor": "FvFfiPvM", "ram": "h0oFJVNw", "soundCard": "3xvIXfl8"}, {"additionals": "V4gF9ytZ", "directXVersion": "Qnk1Hmtd", "diskSpace": "EjM9aUeb", "graphics": "VPkPkdr3", "label": "TnUf0SmA", "osVersion": "Sb3ixy8Q", "processor": "j1mpDs0Z", "ram": "c7kZim9j", "soundCard": "MWVg2vlr"}], "Pew92jVO": [{"additionals": "Gpb0HHo2", "directXVersion": "sUJPvMlm", "diskSpace": "h0q8wM0Y", "graphics": "jk7dbQc0", "label": "uX9oNzeb", "osVersion": "d1bOE3ny", "processor": "Xtbsm4u7", "ram": "wCWS18IJ", "soundCard": "ik4BDVJD"}, {"additionals": "OBzq2Mxw", "directXVersion": "erhXv4TM", "diskSpace": "a7eVZ9zl", "graphics": "nP1je9RF", "label": "HW8GIsq7", "osVersion": "RQlrUovc", "processor": "3KbBhUzY", "ram": "d9Oaoif5", "soundCard": "7h04baQ1"}, {"additionals": "JZ8ESwVZ", "directXVersion": "0ENOeXOh", "diskSpace": "9L1CUqBF", "graphics": "C8olq3HH", "label": "ibQcsgkY", "osVersion": "2Cs5CSZz", "processor": "MLiGzGtZ", "ram": "NVzeSkQM", "soundCard": "aYG0CSds"}], "5H2zkFsN": [{"additionals": "VXHiZ5SO", "directXVersion": "jo6RiHEN", "diskSpace": "ymI17E4a", "graphics": "15qD0vNh", "label": "P6VBxop1", "osVersion": "CZz71dV9", "processor": "sY7CynYv", "ram": "Ywa7ol7w", "soundCard": "c6aRRNYb"}, {"additionals": "69MwSsW6", "directXVersion": "XWOqkynS", "diskSpace": "Gq9KPoYp", "graphics": "E2xTXO7p", "label": "mgqpwlhl", "osVersion": "L9zESq5a", "processor": "pEswZVIL", "ram": "gahaKaVK", "soundCard": "hLfCKM5c"}, {"additionals": "4WHssgtK", "directXVersion": "69E66RRb", "diskSpace": "hUvGFDoy", "graphics": "9BWTBH4b", "label": "NkUAuqhC", "osVersion": "GE1oZEWz", "processor": "81m9c6bW", "ram": "8SjoSgWm", "soundCard": "xAQeoU7T"}]}, "platforms": ["Windows", "Windows", "Linux"], "players": ["CrossPlatformMulti", "Multi", "MMO"], "primaryGenre": "Action", "publisher": "TIbMQk5v", "releaseDate": "1974-06-23T00:00:00Z", "websiteUrl": "nCeKHj7X"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'RAE6ln0N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LjdQ9Mkt' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'PjgEihY8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'OuhgSpH8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9IW1gpYV' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'a7SvQH9e' \
    --itemId 'bVHmaK8c' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'faDCNq4g' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'HNJ5c29x' \
    --itemId 'CE0T9JHl' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3vdpLMH6' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'xrLQg71W' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ChxKnxHC' \
    --populateBundle  \
    --region 'VXxiccdY' \
    --storeId 'K6cNgdns' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'gw9CXjVk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F9ZvNNn0' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 81, "comparison": "isGreaterThanOrEqual", "name": "u1J8MGyS", "predicateType": "EntitlementPredicate", "value": "LTqqA1Qh", "values": ["iJwXtzgZ", "yxdkKgYV", "Y2NMzEfi"]}, {"anyOf": 50, "comparison": "includes", "name": "8BfFf02M", "predicateType": "SeasonTierPredicate", "value": "kIahAhRr", "values": ["bmabJqKo", "JZ25SC2q", "PeiEtFzj"]}, {"anyOf": 46, "comparison": "isLessThanOrEqual", "name": "2jo9pwiY", "predicateType": "EntitlementPredicate", "value": "mON3Qh4l", "values": ["I1YOQqaW", "UzBvieLk", "zXm3iZ63"]}]}, {"operator": "or", "predicates": [{"anyOf": 65, "comparison": "includes", "name": "i87fklBp", "predicateType": "SeasonPassPredicate", "value": "4L9k6UXB", "values": ["Cj9HC3Oh", "mcUqQEqS", "QUDp41UH"]}, {"anyOf": 41, "comparison": "is", "name": "75O15Hkn", "predicateType": "SeasonPassPredicate", "value": "gPkO73fu", "values": ["mbBxhaGu", "fpRwfoiD", "7w1pr5a6"]}, {"anyOf": 1, "comparison": "isLessThan", "name": "LudJwi2T", "predicateType": "SeasonPassPredicate", "value": "zGUUJ10I", "values": ["2PqTWHHr", "DqheuL9z", "8viw7SGT"]}]}, {"operator": "and", "predicates": [{"anyOf": 63, "comparison": "isLessThanOrEqual", "name": "XS4A76il", "predicateType": "EntitlementPredicate", "value": "PkMlsOPc", "values": ["Mf3ytV1T", "lhJJk37n", "86tdBEth"]}, {"anyOf": 90, "comparison": "isNot", "name": "vPHe9t9m", "predicateType": "SeasonTierPredicate", "value": "Na7SDuxV", "values": ["eHajemFP", "phTuIHJ7", "tQArYQRa"]}, {"anyOf": 51, "comparison": "isLessThan", "name": "LCBh9sw2", "predicateType": "EntitlementPredicate", "value": "piqc0Nsz", "values": ["hb6LxsuY", "62nZ11fa", "UAQr1Vzb"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'befi7u5S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "IGZNi8WN"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --name 'uBJ7075h' \
    --offset '92' \
    --tag '5XXtqdSl' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "n2iToJo0", "name": "BaB4Z8Qv", "status": "INACTIVE", "tags": ["YyO80qYv", "0EM64A29", "6yaczbm1"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'I7C4f2f1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'hi9dokL5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bqOnojzH", "name": "eLFy5cFE", "status": "ACTIVE", "tags": ["0CBPRVqn", "cme6b91t", "nQHsfN35"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'QWQckBdP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'tE8KbnUg' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '81' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'f7lM8SSj' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MP8H533E' \
    --limit '54' \
    --offset '15' \
    --orderNos 'uMbKvm4o,1arc0q3L,ostOhmiy' \
    --sortBy 'tZtbOrq1' \
    --startTime 'k9qyl94f' \
    --status 'CLOSED' \
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
    --orderNo '9Na4Hr6v' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bOPEkcKc' \
    --body '{"description": "7crm0lq0"}' \
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
    --body '{"dryRun": true, "notifyUrl": "nRCeZ0n4", "privateKey": "L4aezKkL"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'iBsrljVB' \
    --externalId '6mLNVrGB' \
    --limit '88' \
    --notificationSource 'WALLET' \
    --notificationType '3dlJos8Y' \
    --offset '13' \
    --paymentOrderNo 'yDCn2joK' \
    --startDate 'EO5ovlFS' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'L64EUI82' \
    --limit '98' \
    --offset '46' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "TJ53sfTW", "currencyNamespace": "R15PfxS8", "customParameters": {"FaDSWP5E": {}, "kqhoC6P9": {}, "1rmTivTD": {}}, "description": "05qC9Dkw", "extOrderNo": "0TYVZdJK", "extUserId": "0ErInsOO", "itemType": "SEASON", "language": "JdhY-IU", "metadata": {"MgUwSGIS": "usjk9paY", "2z6FfS68": "uZwiIIRC", "MgTAMius": "aH7jktMu"}, "notifyUrl": "BeWeI0pr", "omitNotification": false, "platform": "AHivphzM", "price": 37, "recurringPaymentOrderNo": "NHdo2ltT", "region": "v9qR0uou", "returnUrl": "DubPGnRi", "sandbox": false, "sku": "Z8vg1WS2", "subscriptionId": "WgqP937n", "targetNamespace": "NxD8ihQY", "targetUserId": "t6PEwMgu", "title": "pECLy8iH"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'z7BcIxHD' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bNUwrDFC' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4Jqt649p' \
    --body '{"extTxId": "RkYikDQQ", "paymentMethod": "WGZSlHwH", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ea00D33L' \
    --body '{"description": "XrNzHLnS"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LTdaEtr9' \
    --body '{"amount": 97, "currencyCode": "o7Ixaa5A", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 24, "vat": 77}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lKj2Smb7' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedPlatformOrigins": ["IOS", "GooglePlay", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePlatformEntitlementConfig' test.out

#- 158 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformWalletConfig' test.out

#- 159 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Steam", "GooglePlay", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformWalletConfig' test.out

#- 160 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
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
    --endTime 'PD4LEiUC' \
    --limit '89' \
    --offset '14' \
    --source 'DLC' \
    --startTime 'akK7PHi9' \
    --status 'SUCCESS' \
    --transactionId 'keVpp7I2' \
    --userId 'yXXafyUz' \
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
    --body '{"appConfig": {"appName": "R20Phu0D"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "q6RbF0sq"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "le8OxtyB", "eventTopic": "mxCIqljG", "maxAwarded": 4, "maxAwardedPerUser": 91, "namespaceExpression": "exEZhJeF", "rewardCode": "O9Oe26Ud", "rewardConditions": [{"condition": "Su2hRyqo", "conditionName": "ecPUx5Wn", "eventName": "tpP8iaNF", "rewardItems": [{"duration": 97, "endDate": "1974-12-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "tVKcL4KO", "quantity": 6, "sku": "DEisPd8y"}, {"duration": 96, "endDate": "1976-05-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "q28Wpbhh", "quantity": 73, "sku": "yAwPHEAN"}, {"duration": 88, "endDate": "1990-01-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "XILHHqFj", "quantity": 88, "sku": "x9gZzAM1"}]}, {"condition": "e4KhxGoW", "conditionName": "lY2RCg4r", "eventName": "YI14BuRZ", "rewardItems": [{"duration": 56, "endDate": "1977-10-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dhxLldkq", "quantity": 80, "sku": "9hlEkQZh"}, {"duration": 95, "endDate": "1976-07-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "luj1qvWe", "quantity": 69, "sku": "Dea0rC1Y"}, {"duration": 5, "endDate": "1971-07-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "b053CF2f", "quantity": 33, "sku": "og0uwy3A"}]}, {"condition": "7Pd9i8nY", "conditionName": "YaFxaAHd", "eventName": "DxHTwXms", "rewardItems": [{"duration": 48, "endDate": "1998-02-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "f2jEGxWz", "quantity": 54, "sku": "duXa6ls2"}, {"duration": 100, "endDate": "1998-01-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "TComO1JG", "quantity": 23, "sku": "dlI5O83t"}, {"duration": 51, "endDate": "1988-06-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "NWUKhVWG", "quantity": 71, "sku": "RWMJwiuo"}]}], "userIdExpression": "nIdD178u"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'lOpZZWL9' \
    --limit '83' \
    --offset '44' \
    --sortBy 'rewardCode,namespace:asc' \
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
    --rewardId 'fJwQaqF8' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'XyzxIkPt' \
    --body '{"description": "vUYLRcme", "eventTopic": "Xn0RZ7S3", "maxAwarded": 30, "maxAwardedPerUser": 2, "namespaceExpression": "ginpOmDt", "rewardCode": "YIThtlr5", "rewardConditions": [{"condition": "8ASlnhcU", "conditionName": "sj7OhkAe", "eventName": "dZu89uiu", "rewardItems": [{"duration": 84, "endDate": "1997-03-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "6Cqz9GRi", "quantity": 75, "sku": "mJRDWjXV"}, {"duration": 90, "endDate": "1972-05-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zRWnQu6Z", "quantity": 21, "sku": "S4eRXdmM"}, {"duration": 22, "endDate": "1981-10-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1bz18zIy", "quantity": 88, "sku": "A2mtDlxu"}]}, {"condition": "XwfPCnJa", "conditionName": "E1LZjtQs", "eventName": "8hpsNXXi", "rewardItems": [{"duration": 4, "endDate": "1995-06-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "PEHeRDVH", "quantity": 18, "sku": "CUuy1aDg"}, {"duration": 33, "endDate": "1988-04-25T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vs6yCDTv", "quantity": 62, "sku": "6RbPAPjn"}, {"duration": 6, "endDate": "1981-01-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "eHxWWi28", "quantity": 9, "sku": "lIOfSAct"}]}, {"condition": "GZYxD8t3", "conditionName": "m9Bbnpmb", "eventName": "uxH8GER3", "rewardItems": [{"duration": 93, "endDate": "1982-06-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "VWxLGNRe", "quantity": 31, "sku": "96fFmri5"}, {"duration": 59, "endDate": "1999-10-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1x5eT5xp", "quantity": 70, "sku": "SpLltzos"}, {"duration": 76, "endDate": "1980-10-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "iBVGOGSG", "quantity": 16, "sku": "u5uhKtm3"}]}], "userIdExpression": "ytma1HZs"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'pXAfqVSF' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'STZ5B270' \
    --body '{"payload": {"c1ccdYVT": {}, "g60nN9gY": {}, "6qmABP7H": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'buBvLpOU' \
    --body '{"conditionName": "Qc8vGIYV", "userId": "6WF8J3BZ"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '2ClEYCmt' \
    --limit '23' \
    --offset '82' \
    --start '1Gwn301C' \
    --storeId 'MDpnQ9Hs' \
    --viewId 'yt350z67' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '6VyPWhLH' \
    --body '{"active": true, "displayOrder": 4, "endDate": "1980-02-09T00:00:00Z", "ext": {"CQcDECoY": {}, "Ll9whYyj": {}, "5sEFS0dd": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 28, "itemCount": 80, "rule": "SEQUENCE"}, "items": [{"id": "DcEN2T4q", "sku": "XUtbluBO"}, {"id": "E8GzkZZP", "sku": "Hljiwj44"}, {"id": "BPcdkmB8", "sku": "eAONnujG"}], "localizations": {"lgH7Qt0H": {"description": "AGy16Igr", "localExt": {"snCxk1g8": {}, "sFoYHJx5": {}, "XT4EpCvQ": {}}, "longDescription": "kuNytzsp", "title": "Zb6dW8tH"}, "cEfs9Etx": {"description": "wAOBbjkU", "localExt": {"9hAlsJMB": {}, "qbaKbo85": {}, "XckXE3ek": {}}, "longDescription": "LcymQ0Zu", "title": "7sfRQPtg"}, "wiH38gSJ": {"description": "auUzdnWD", "localExt": {"qCuGsinu": {}, "ZysJObpG": {}, "nhhMOZc3": {}}, "longDescription": "QH4FS7os", "title": "rsrq9wHw"}}, "name": "ndGhAebO", "rotationType": "CUSTOM", "startDate": "1985-08-06T00:00:00Z", "viewId": "l3Po0RLu"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cyn7OWuI' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'nE8TXLbg' \
    --storeId 'jx9eOVZQ' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'cccFCFaX' \
    --storeId 'ax7YTi9z' \
    --body '{"active": true, "displayOrder": 24, "endDate": "1981-10-04T00:00:00Z", "ext": {"SbxWHzk5": {}, "2hPRQVu9": {}, "ZGWaYzGb": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 37, "itemCount": 4, "rule": "SEQUENCE"}, "items": [{"id": "Lc3wXPUg", "sku": "SlLDq0cH"}, {"id": "tWOBHdBy", "sku": "oa9JUrtM"}, {"id": "V2kQexkU", "sku": "q3YOV1W3"}], "localizations": {"2qN6bfdw": {"description": "qkapcCr1", "localExt": {"pgIjy2Ro": {}, "2A8gijsr": {}, "5Jh6p6bR": {}}, "longDescription": "mSTN7rkm", "title": "KLwl3pXl"}, "KMynVinJ": {"description": "j9c292ng", "localExt": {"HKV9k2Ii": {}, "9P5bEFGV": {}, "z2LelX9W": {}}, "longDescription": "8BkeejZB", "title": "ViN1X6wA"}, "nDMbfo51": {"description": "bbiKtnpb", "localExt": {"DbOzSeKR": {}, "M6BgQBsG": {}, "MC4DeCX3": {}}, "longDescription": "muvbTJzR", "title": "mkII8aeP"}}, "name": "TNL5xCf4", "rotationType": "FIXED_PERIOD", "startDate": "1982-06-07T00:00:00Z", "viewId": "BhckLAh2"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'U3y6QDV7' \
    --storeId 'iQ8CLB1K' \
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
    --body '{"defaultLanguage": "hMiRmJJZ", "defaultRegion": "o7m9IkoI", "description": "KYwWdf28", "supportedLanguages": ["rMRWJByJ", "IG0H5og8", "WMt03buo"], "supportedRegions": ["wkataK9h", "vDHwakGR", "RUA5BJe8"], "title": "7CGB314U"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 ImportStore
eval_tap 0 186 'ImportStore # SKIP deprecated' test.out

#- 187 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 187 'GetPublishedStore' test.out

#- 188 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'DeletePublishedStore' test.out

#- 189 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'GetPublishedStoreBackup' test.out

#- 190 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'RollbackPublishedStore' test.out

#- 191 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '712wQ6pQ' \
    > test.out 2>&1
eval_tap $? 191 'GetStore' test.out

#- 192 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jcoMp9h5' \
    --body '{"defaultLanguage": "WWGNQPRs", "defaultRegion": "83LEbKnO", "description": "0v08XIZQ", "supportedLanguages": ["U0RxbHo5", "MgkqUn0n", "faGMoYqj"], "supportedRegions": ["d2Hw8Scd", "45YGXd9L", "bLhtB0iI"], "title": "bIEriLrQ"}' \
    > test.out 2>&1
eval_tap $? 192 'UpdateStore' test.out

#- 193 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '0ZeEKHnB' \
    > test.out 2>&1
eval_tap $? 193 'DeleteStore' test.out

#- 194 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '9iz3ykaA' \
    --action 'DELETE' \
    --itemSku 'OhhEQf3I' \
    --itemType 'INGAMEITEM' \
    --limit '5' \
    --offset '12' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt:asc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'JCsEgfKo' \
    --updatedAtStart 'RLfjTcaU' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 194 'QueryChanges' test.out

#- 195 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '09DWIejc' \
    > test.out 2>&1
eval_tap $? 195 'PublishAll' test.out

#- 196 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uHZAixNk' \
    > test.out 2>&1
eval_tap $? 196 'PublishSelected' test.out

#- 197 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kt2XDhgS' \
    > test.out 2>&1
eval_tap $? 197 'SelectAllRecords' test.out

#- 198 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '94YsOcS2' \
    --action 'CREATE' \
    --itemSku 'jTQLWibP' \
    --itemType 'SUBSCRIPTION' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd '3XXY6BEk' \
    --updatedAtStart 'cPCjAIfL' \
    > test.out 2>&1
eval_tap $? 198 'SelectAllRecordsByCriteria' test.out

#- 199 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kwcsVV4D' \
    --action 'DELETE' \
    --itemSku 'yqmqSai9' \
    --itemType 'APP' \
    --type 'ITEM' \
    --updatedAtEnd 'wOnnqSt7' \
    --updatedAtStart 'RT8xjADT' \
    > test.out 2>&1
eval_tap $? 199 'GetStatistic' test.out

#- 200 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Hhj0EBkQ' \
    > test.out 2>&1
eval_tap $? 200 'UnselectAllRecords' test.out

#- 201 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '5JPmOYOB' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6EHOGqrp' \
    > test.out 2>&1
eval_tap $? 201 'SelectRecord' test.out

#- 202 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'bj6OPZSC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WNoJZ6IJ' \
    > test.out 2>&1
eval_tap $? 202 'UnselectRecord' test.out

#- 203 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bw1Fjadl' \
    --targetStoreId 'CSNPOy8F' \
    > test.out 2>&1
eval_tap $? 203 'CloneStore' test.out

#- 204 ExportStore
eval_tap 0 204 'ExportStore # SKIP deprecated' test.out

#- 205 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'o68HgQHk' \
    --limit '3' \
    --offset '100' \
    --sku 'ueYcrW0N' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    --userId 'lbP9uY6H' \
    > test.out 2>&1
eval_tap $? 205 'QuerySubscriptions' test.out

#- 206 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OZGqM3In' \
    > test.out 2>&1
eval_tap $? 206 'RecurringChargeSubscription' test.out

#- 207 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'H27VCFAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 207 'GetTicketDynamic' test.out

#- 208 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '0gUp3Trm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "iEh9qs1M"}' \
    > test.out 2>&1
eval_tap $? 208 'DecreaseTicketSale' test.out

#- 209 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '53iu0RVf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetTicketBoothID' test.out

#- 210 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'hySifLOp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 10, "orderNo": "Loz1NHpP"}' \
    > test.out 2>&1
eval_tap $? 210 'IncreaseTicketSale' test.out

#- 211 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 12, "currencyCode": "MY7V8ldf", "expireAt": "1974-10-13T00:00:00Z"}, "debitPayload": {"count": 78, "currencyCode": "Dpy17oXH", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 3, "entitlementOrigin": "Xbox", "itemIdentity": "D2BmuAvJ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "FEyPOqtC"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 62, "currencyCode": "njLhwN84", "expireAt": "1976-12-08T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "4wwx2bik", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 80, "entitlementOrigin": "Oculus", "itemIdentity": "xFREXOZX", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 22, "entitlementId": "ehylZcaE"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 10, "currencyCode": "G4UELa9o", "expireAt": "1996-04-27T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "NpT9R4nE", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 10, "entitlementOrigin": "Other", "itemIdentity": "Cf8x0qJ9", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "EXPTF0BQ"}, "type": "DEBIT_WALLET"}], "userId": "8Wp6Dl0m"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 27, "currencyCode": "Ga63QrY7", "expireAt": "1976-10-16T00:00:00Z"}, "debitPayload": {"count": 17, "currencyCode": "Lsg8KcXL", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 50, "entitlementOrigin": "Steam", "itemIdentity": "At4ND55g", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 27, "entitlementId": "RZgEqPf0"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 15, "currencyCode": "sM3EwYyb", "expireAt": "1974-01-06T00:00:00Z"}, "debitPayload": {"count": 77, "currencyCode": "iAAYmpM2", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 28, "entitlementOrigin": "Oculus", "itemIdentity": "2vOkTrSM", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 87, "entitlementId": "pSj1beSp"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 67, "currencyCode": "EEscQ6td", "expireAt": "1979-05-08T00:00:00Z"}, "debitPayload": {"count": 35, "currencyCode": "lvJTRh4J", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 100, "entitlementOrigin": "Twitch", "itemIdentity": "AaY4I0TS", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 50, "entitlementId": "ZZiMqPfI"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Vk2XwPrE"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 22, "currencyCode": "TMy7o62v", "expireAt": "1979-11-02T00:00:00Z"}, "debitPayload": {"count": 46, "currencyCode": "e3MKHoY0", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 36, "entitlementOrigin": "GooglePlay", "itemIdentity": "pwTIrFym", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 96, "entitlementId": "j0ys3X6D"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 96, "currencyCode": "4r5a6L0S", "expireAt": "1985-12-29T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "SFVw9PHA", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 94, "entitlementOrigin": "Twitch", "itemIdentity": "IJscMyFC", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "uTmVBvUc"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 8, "currencyCode": "eqlSdygi", "expireAt": "1998-07-14T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "FLByGeDC", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 68, "entitlementOrigin": "Playstation", "itemIdentity": "JR6BTObL", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "tg76a5fG"}, "type": "FULFILL_ITEM"}], "userId": "6FN3xib9"}], "metadata": {"yR9G7C8v": {}, "5QLqr3qa": {}, "gEfr7Xhc": {}}, "needPreCheck": true, "transactionId": "qR3ABj94", "type": "f0D548Kt"}' \
    > test.out 2>&1
eval_tap $? 211 'Commit' test.out

#- 212 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '51' \
    --status 'SUCCESS' \
    --type '9KU3v9yz' \
    --userId 'fE5rds9X' \
    > test.out 2>&1
eval_tap $? 212 'GetTradeHistoryByCriteria' test.out

#- 213 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'BWUH5Hrj' \
    > test.out 2>&1
eval_tap $? 213 'GetTradeHistoryByTransactionId' test.out

#- 214 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'h7abYsHr' \
    --body '{"achievements": [{"id": "iPXuQrOs", "value": 98}, {"id": "ejBIbV7j", "value": 52}, {"id": "Cu9zcGhL", "value": 40}], "steamUserId": "QR5i1V1F"}' \
    > test.out 2>&1
eval_tap $? 214 'UnlockSteamUserAchievement' test.out

#- 215 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Df0Aq8No' \
    --xboxUserId '0FNV9xjg' \
    > test.out 2>&1
eval_tap $? 215 'GetXblUserAchievements' test.out

#- 216 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '29DvLt1i' \
    --body '{"achievements": [{"id": "I3hRTNtE", "percentComplete": 46}, {"id": "mAQdlgRG", "percentComplete": 42}, {"id": "qtSiFena", "percentComplete": 49}], "serviceConfigId": "pnduHkGS", "titleId": "ChE9EX7p", "xboxUserId": "PLzdn53v"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateXblUserAchievement' test.out

#- 217 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'mzbqWaHt' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeCampaign' test.out

#- 218 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ItTJKptT' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizeEntitlement' test.out

#- 219 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'NUgdydnZ' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeFulfillment' test.out

#- 220 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXb8YUHO' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeIntegration' test.out

#- 221 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ERjymarj' \
    > test.out 2>&1
eval_tap $? 221 'AnonymizeOrder' test.out

#- 222 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZL65tt6' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizePayment' test.out

#- 223 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbScr33o' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeRevocation' test.out

#- 224 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'aOYKYMZx' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeSubscription' test.out

#- 225 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZdqND4k' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeWallet' test.out

#- 226 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '1Fywn4C3' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 226 'GetUserDLCByPlatform' test.out

#- 227 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'LawZZ1dQ' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 227 'GetUserDLC' test.out

#- 228 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQRtzOzx' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'YwWnFoLa' \
    --features 'DFn9VWwd,QlwpXWUY,p4lJhxds' \
    --fuzzyMatchName  \
    --itemId 'GG280PRT,SRErYpgN,PLVlcpyj' \
    --limit '52' \
    --offset '38' \
    --origin 'System' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserEntitlements' test.out

#- 229 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '95blVwqd' \
    --body '[{"endDate": "1995-03-27T00:00:00Z", "grantedCode": "R2mMYh05", "itemId": "0Y4xVNQ1", "itemNamespace": "amHsg41x", "language": "Uyj_isJJ_Tk", "origin": "Steam", "quantity": 82, "region": "djXIuG68", "source": "PROMOTION", "startDate": "1979-12-23T00:00:00Z", "storeId": "EUe6gviO"}, {"endDate": "1985-03-22T00:00:00Z", "grantedCode": "kDqOQDIv", "itemId": "JbG3zb7F", "itemNamespace": "fOl8bpFi", "language": "zF_DxQD", "origin": "Epic", "quantity": 41, "region": "Bi5GiU4a", "source": "OTHER", "startDate": "1989-04-08T00:00:00Z", "storeId": "iQP6AUdF"}, {"endDate": "1993-11-30T00:00:00Z", "grantedCode": "S2lyxeG4", "itemId": "QUuevpkS", "itemNamespace": "tkcQFnTt", "language": "nJcL_xZSE", "origin": "Epic", "quantity": 67, "region": "CnBlmSqP", "source": "PROMOTION", "startDate": "1987-10-17T00:00:00Z", "storeId": "79xOnsEm"}]' \
    > test.out 2>&1
eval_tap $? 229 'GrantUserEntitlement' test.out

#- 230 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zpqRTg1c' \
    --activeOnly  \
    --appId 'mGdy0fTq' \
    > test.out 2>&1
eval_tap $? 230 'GetUserAppEntitlementByAppId' test.out

#- 231 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '0wlaIBRK' \
    --activeOnly  \
    --limit '23' \
    --offset '13' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserEntitlementsByAppType' test.out

#- 232 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXzxg1Th' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'GpAkrHOn' \
    --itemId 'n5QG5Mcx' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementByItemId' test.out

#- 233 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'p75gMau1' \
    --ids 'VKLUApiF,zPPr49B9,eoK9UGgP' \
    --platform 'gM9jhjHx' \
    > test.out 2>&1
eval_tap $? 233 'GetUserActiveEntitlementsByItemIds' test.out

#- 234 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUp1CXi2' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform '4GTGNNJE' \
    --sku 'RcJLmV61' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementBySku' test.out

#- 235 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'O1F65Sai' \
    --appIds 'CTFu8HPg,WPdxkck0,0RHislh6' \
    --itemIds '6rW9rIHu,k2JNuXYj,uexG0Fh9' \
    --platform 'P4PCXUJm' \
    --skus '1kxXJryy,Qao8Dep7,p5PUofTv' \
    > test.out 2>&1
eval_tap $? 235 'ExistsAnyUserActiveEntitlement' test.out

#- 236 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'OhOOCf3C' \
    --platform 'EMBzDVH2' \
    --itemIds 'uZFz4tB9,8SYyUjNb,2W0cE3vs' \
    > test.out 2>&1
eval_tap $? 236 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 237 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmupfBmE' \
    --appId 'baO9ly1b' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 238 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDhqtNUC' \
    --entitlementClazz 'APP' \
    --platform 'MTwVI0Al' \
    --itemId 'Md6mfVBR' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlementOwnershipByItemId' test.out

#- 239 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'gScxdtVQ' \
    --ids 'NvIvOloT,p7g0qWbC,Afgueuf7' \
    --platform '44ABqJP9' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementOwnershipByItemIds' test.out

#- 240 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRZZiRtM' \
    --entitlementClazz 'APP' \
    --platform 'fIQxr7Ao' \
    --sku 'ryV0Jwuh' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementOwnershipBySku' test.out

#- 241 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rkFRCQef' \
    > test.out 2>&1
eval_tap $? 241 'RevokeAllEntitlements' test.out

#- 242 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TEr8gj81' \
    --entitlementIds '1KuFvxHE' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUserEntitlements' test.out

#- 243 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'GXaMQkwV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wpeLSl5f' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlement' test.out

#- 244 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'PdjKs54q' \
    --namespace "$AB_NAMESPACE" \
    --userId '2Hj9Hlgy' \
    --body '{"endDate": "1974-02-06T00:00:00Z", "nullFieldList": ["Fe06YhO7", "OPF1NO0H", "Ks3Ie8Ez"], "origin": "Playstation", "reason": "RpzL9h8r", "startDate": "1991-11-21T00:00:00Z", "status": "ACTIVE", "useCount": 91}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateUserEntitlement' test.out

#- 245 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'k1BBKLid' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EehleP7V' \
    --body '{"options": ["F8wnPHui", "Cr7DGYMj", "3EdQ7NZe"], "platform": "ex1WeLrx", "requestId": "nUYbQXKg", "useCount": 7}' \
    > test.out 2>&1
eval_tap $? 245 'ConsumeUserEntitlement' test.out

#- 246 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'HFia17sp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsxXDQMW' \
    > test.out 2>&1
eval_tap $? 246 'DisableUserEntitlement' test.out

#- 247 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'vxfgs0lN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EE7qfNQD' \
    > test.out 2>&1
eval_tap $? 247 'EnableUserEntitlement' test.out

#- 248 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'SWc3rP5r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h8LqGibP' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementHistories' test.out

#- 249 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'pxj3XSKW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i175If39' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlement' test.out

#- 250 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'w2warSmu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CBzpe6Lw' \
    --body '{"reason": "U1y68tBv", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 250 'RevokeUserEntitlementByUseCount' test.out

#- 251 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'scVyPcdO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'liAH61w0' \
    --quantity '37' \
    > test.out 2>&1
eval_tap $? 251 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 252 RevokeUseCount
eval_tap 0 252 'RevokeUseCount # SKIP deprecated' test.out

#- 253 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'B3i4AciR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eIuWqvqt' \
    --body '{"platform": "afNXbURw", "requestId": "d74gEHsb", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 253 'SellUserEntitlement' test.out

#- 254 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ae8cIJ90' \
    --body '{"duration": 5, "endDate": "1973-09-14T00:00:00Z", "entitlementOrigin": "System", "itemId": "ukcjCrMO", "itemSku": "qBTM18YF", "language": "ADvRNEu1", "metadata": {"XXyT6pkD": {}, "n0T4EEm0": {}, "2xsdosql": {}}, "order": {"currency": {"currencyCode": "nMNh7cCp", "currencySymbol": "p3quhuW5", "currencyType": "VIRTUAL", "decimals": 25, "namespace": "JQzBMUFH"}, "ext": {"OKefpNqe": {}, "9p4hqRXC": {}, "uGG3yZ80": {}}, "free": true}, "orderNo": "wobDuk2K", "origin": "Oculus", "overrideBundleItemQty": {"t3PkuueZ": 80, "GnQedWTE": 28, "f1evJxnG": 29}, "quantity": 44, "region": "PgrKiWp9", "source": "SELL_BACK", "startDate": "1972-03-24T00:00:00Z", "storeId": "0hhQ0c7G"}' \
    > test.out 2>&1
eval_tap $? 254 'FulfillItem' test.out

#- 255 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'q7c6gG9c' \
    --body '{"code": "BwkduNvz", "language": "coC-SJQS-990", "region": "4IXlGdJl"}' \
    > test.out 2>&1
eval_tap $? 255 'RedeemCode' test.out

#- 256 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cTYolYLi' \
    --body '{"itemId": "7NVpr3VO", "itemSku": "je1wXsgO", "quantity": 65}' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckFulfillItem' test.out

#- 257 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'amWKe5LP' \
    --body '{"entitlementOrigin": "Playstation", "metadata": {"22uZG9Tw": {}, "zMyOMABI": {}, "tqHfy8tx": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "SWxEdomC", "namespace": "qCbS2rL8"}, "item": {"itemId": "d4jk8cCa", "itemSku": "GubLJiRK", "itemType": "xuvMPmjr"}, "quantity": 77, "type": "CURRENCY"}, {"currency": {"currencyCode": "2crSde0n", "namespace": "aEO49lOD"}, "item": {"itemId": "Pz3MLpFT", "itemSku": "U65oUA3A", "itemType": "QI0W9cRs"}, "quantity": 71, "type": "CURRENCY"}, {"currency": {"currencyCode": "DGXN857w", "namespace": "xqN7SCz5"}, "item": {"itemId": "QBe9GymC", "itemSku": "FjBKLUsV", "itemType": "RiDDMAGN"}, "quantity": 52, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "g8V1ncNQ"}' \
    > test.out 2>&1
eval_tap $? 257 'FulfillRewards' test.out

#- 258 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3TYdzYiz' \
    --endTime 'pWU27i07' \
    --limit '31' \
    --offset '75' \
    --productId 'b8IcS7kx' \
    --startTime 'HEThvwEh' \
    --status 'FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserIAPOrders' test.out

#- 259 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BXrrqwdV' \
    > test.out 2>&1
eval_tap $? 259 'QueryAllUserIAPOrders' test.out

#- 260 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '9wwYysQ6' \
    --endTime 'tVPIbLjr' \
    --limit '13' \
    --offset '60' \
    --startTime '59BTAXzz' \
    --status 'SUCCESS' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserIAPConsumeHistory' test.out

#- 261 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'duZ84InB' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XX", "productId": "uJMGurbK", "region": "x79Ipv7w", "transactionId": "jctKoN38", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 261 'MockFulfillIAPItem' test.out

#- 262 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'P1x31QhP' \
    --itemId 'e5Ht4Aci' \
    --limit '79' \
    --offset '59' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 262 'QueryUserOrders' test.out

#- 263 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIZ6Chkr' \
    --body '{"currencyCode": "QIfRdAxa", "currencyNamespace": "OH5g0fMf", "discountedPrice": 19, "ext": {"MasB8YRv": {}, "79HjAszX": {}, "FIG5NMmq": {}}, "itemId": "qsBSjEXH", "language": "1nRsmaTu", "options": {"skipPriceValidation": true}, "platform": "Oculus", "price": 26, "quantity": 49, "region": "yV5e1Rm9", "returnUrl": "6gH8inzs", "sandbox": true, "sectionId": "LMplOMxq"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminCreateUserOrder' test.out

#- 264 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFVxrM66' \
    --itemId 'LWInnon0' \
    > test.out 2>&1
eval_tap $? 264 'CountOfPurchasedItem' test.out

#- 265 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'u2sqMdjq' \
    --userId 'SJ9LPwYe' \
    > test.out 2>&1
eval_tap $? 265 'GetUserOrder' test.out

#- 266 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'moyV5hXn' \
    --userId 'm9EOwsNL' \
    --body '{"status": "CHARGEBACK", "statusReason": "MW380uTW"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateUserOrderStatus' test.out

#- 267 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'V6V0Payc' \
    --userId 'IbyCwjHT' \
    > test.out 2>&1
eval_tap $? 267 'FulfillUserOrder' test.out

#- 268 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VbOYCmbH' \
    --userId 'kAYe6US0' \
    > test.out 2>&1
eval_tap $? 268 'GetUserOrderGrant' test.out

#- 269 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tNuRg7AD' \
    --userId 'aptvIl87' \
    > test.out 2>&1
eval_tap $? 269 'GetUserOrderHistories' test.out

#- 270 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Br6wi1V6' \
    --userId 'LprDiGOe' \
    --body '{"additionalData": {"cardSummary": "0RsAiuaF"}, "authorisedTime": "1994-09-01T00:00:00Z", "chargebackReversedTime": "1992-01-04T00:00:00Z", "chargebackTime": "1984-05-04T00:00:00Z", "chargedTime": "1990-12-07T00:00:00Z", "createdTime": "1994-11-13T00:00:00Z", "currency": {"currencyCode": "EPA9GCu6", "currencySymbol": "fZdIN6Mw", "currencyType": "VIRTUAL", "decimals": 5, "namespace": "Rvijv9eB"}, "customParameters": {"SEwxg9iA": {}, "PD1gcPER": {}, "TBvJBERC": {}}, "extOrderNo": "OTrLjfSV", "extTxId": "ykmFgudw", "extUserId": "Bu8ZO6LJ", "issuedAt": "1971-03-22T00:00:00Z", "metadata": {"Okg6Sxzc": "eMlU14qP", "DDGZlS38": "xPIe3dUU", "P0Vxotk9": "DzXTaBTC"}, "namespace": "YNsnR2oR", "nonceStr": "7tRQPbeo", "paymentMethod": "VfZF00k0", "paymentMethodFee": 63, "paymentOrderNo": "yG0kcpOh", "paymentProvider": "WXPAY", "paymentProviderFee": 54, "paymentStationUrl": "6JZ76sCd", "price": 66, "refundedTime": "1999-05-25T00:00:00Z", "salesTax": 1, "sandbox": true, "sku": "HZRlVqpI", "status": "REFUND_FAILED", "statusReason": "pyc4GcJY", "subscriptionId": "ycJoUf9w", "subtotalPrice": 64, "targetNamespace": "tVmMUZrW", "targetUserId": "VDuJ1rtm", "tax": 30, "totalPrice": 95, "totalTax": 99, "txEndTime": "1988-09-21T00:00:00Z", "type": "GJrhPl3S", "userId": "awvckXdy", "vat": 19}' \
    > test.out 2>&1
eval_tap $? 270 'ProcessUserOrderNotification' test.out

#- 271 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Y7Kq7k8p' \
    --userId '2lIPmOLb' \
    > test.out 2>&1
eval_tap $? 271 'DownloadUserOrderReceipt' test.out

#- 272 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '45ZUhbPu' \
    --body '{"currencyCode": "FwsrS2zN", "currencyNamespace": "mHkYRAaw", "customParameters": {"p97oJmLi": {}, "c2EzQ0hf": {}, "n2K4m8iS": {}}, "description": "48bdVvyo", "extOrderNo": "h8CE6V0X", "extUserId": "ydJ71FVj", "itemType": "APP", "language": "eT_ToEW", "metadata": {"kGAfHidt": "sLnnsSHI", "8I86g2CX": "v0H1XOeV", "z7nkBAve": "6EI6XH2G"}, "notifyUrl": "cQasyCzF", "omitNotification": false, "platform": "cFF7cdp9", "price": 29, "recurringPaymentOrderNo": "sNXXmZHS", "region": "FWtXi82A", "returnUrl": "aiIdmlcT", "sandbox": false, "sku": "kmRRVp1N", "subscriptionId": "WBuiOFQg", "title": "lj5Ar0Ad"}' \
    > test.out 2>&1
eval_tap $? 272 'CreateUserPaymentOrder' test.out

#- 273 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Xd7i1ha6' \
    --userId 'L6WhaSW2' \
    --body '{"description": "57Pzn3NN"}' \
    > test.out 2>&1
eval_tap $? 273 'RefundUserPaymentOrder' test.out

#- 274 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gqzev5ST' \
    --body '{"code": "LHjt6dmb", "orderNo": "C93Pma5o"}' \
    > test.out 2>&1
eval_tap $? 274 'ApplyUserRedemption' test.out

#- 275 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'zf4Pzh0H' \
    --body '{"meta": {"VN0KTDCN": {}, "FeeJB7wc": {}, "rBuk1sTZ": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "BLFPZ31X", "namespace": "2MQLiQ5H"}, "entitlement": {"entitlementId": "5C1oA98g"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "20BkeN9e", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 82, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "fQGsg80q", "namespace": "Z9r4eDC7"}, "entitlement": {"entitlementId": "Ojdm1Yhn"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "L78WvHwG", "itemIdentityType": "ITEM_SKU", "origin": "Other"}, "quantity": 27, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "x1meJBXZ", "namespace": "sBLNU8ZS"}, "entitlement": {"entitlementId": "oMA0zzzo"}, "item": {"entitlementOrigin": "System", "itemIdentity": "Q6pwBQ85", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 37, "type": "ITEM"}], "source": "IAP", "transactionId": "u7AjTri4"}' \
    > test.out 2>&1
eval_tap $? 275 'DoRevocation' test.out

#- 276 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vxaen6Z1' \
    --body '{"gameSessionId": "SGwuo1nq", "payload": {"p1INmw6F": {}, "vUpw1nwk": {}, "MQejGzIc": {}}, "scid": "lsurWuX9", "sessionTemplateName": "y8BQ9wHq"}' \
    > test.out 2>&1
eval_tap $? 276 'RegisterXblSessions' test.out

#- 277 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'lhdoPeHH' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'tmQLh9BI' \
    --limit '22' \
    --offset '37' \
    --sku 'FTAquffg' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserSubscriptions' test.out

#- 278 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2C34SWm' \
    --excludeSystem  \
    --limit '14' \
    --offset '1' \
    --subscriptionId '4lSR48Qs' \
    > test.out 2>&1
eval_tap $? 278 'GetUserSubscriptionActivities' test.out

#- 279 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'x9qtfmk4' \
    --body '{"grantDays": 88, "itemId": "taJHG25T", "language": "TTa1Vvjs", "reason": "l0gRQ1eC", "region": "EZV7nIXn", "source": "mLpZatzd"}' \
    > test.out 2>&1
eval_tap $? 279 'PlatformSubscribeSubscription' test.out

#- 280 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '8qutdasZ' \
    --itemId 'BPTYRVQh' \
    > test.out 2>&1
eval_tap $? 280 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 281 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6Z9ctFrL' \
    --userId 'm3sh5Hqo' \
    > test.out 2>&1
eval_tap $? 281 'GetUserSubscription' test.out

#- 282 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DaEhhZnj' \
    --userId '4Jdp4iHN' \
    > test.out 2>&1
eval_tap $? 282 'DeleteUserSubscription' test.out

#- 283 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VYaQGhjH' \
    --userId 'YsqaPr8f' \
    --force  \
    --body '{"immediate": false, "reason": "Vge4Jogp"}' \
    > test.out 2>&1
eval_tap $? 283 'CancelSubscription' test.out

#- 284 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qOOpV7VE' \
    --userId 'SMaXXmTk' \
    --body '{"grantDays": 40, "reason": "bogKpCPX"}' \
    > test.out 2>&1
eval_tap $? 284 'GrantDaysToSubscription' test.out

#- 285 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YadHjpBz' \
    --userId '8FbIOyca' \
    --excludeFree  \
    --limit '39' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionBillingHistories' test.out

#- 286 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WhKzDecq' \
    --userId 'jV7xVIJ9' \
    --body '{"additionalData": {"cardSummary": "kJGTJtR4"}, "authorisedTime": "1971-12-26T00:00:00Z", "chargebackReversedTime": "1971-06-25T00:00:00Z", "chargebackTime": "1975-02-27T00:00:00Z", "chargedTime": "1993-12-30T00:00:00Z", "createdTime": "1994-10-09T00:00:00Z", "currency": {"currencyCode": "glJgFqjZ", "currencySymbol": "UyAb4uqt", "currencyType": "REAL", "decimals": 61, "namespace": "S1Nk2bxW"}, "customParameters": {"aeN7HCBX": {}, "Kyh2f11D": {}, "031HzeJg": {}}, "extOrderNo": "P42HZfxg", "extTxId": "AoccUo02", "extUserId": "BmQtPbmc", "issuedAt": "1995-07-07T00:00:00Z", "metadata": {"6j0CCymD": "K66PXLcV", "nUVM32f8": "ZQRwwUkX", "U0IuakBz": "6tOQwFSV"}, "namespace": "iGIfYoru", "nonceStr": "nIj1T3CN", "paymentMethod": "jVng6SpI", "paymentMethodFee": 6, "paymentOrderNo": "dOgzZxP6", "paymentProvider": "STRIPE", "paymentProviderFee": 81, "paymentStationUrl": "KOb53PKy", "price": 26, "refundedTime": "1979-06-19T00:00:00Z", "salesTax": 95, "sandbox": true, "sku": "396TU3EJ", "status": "CHARGEBACK", "statusReason": "96mty3Qr", "subscriptionId": "JYMRXh9J", "subtotalPrice": 62, "targetNamespace": "kmXUjwwd", "targetUserId": "qQJWDjuH", "tax": 10, "totalPrice": 23, "totalTax": 17, "txEndTime": "1984-01-31T00:00:00Z", "type": "tbv1tBab", "userId": "XbNgryKr", "vat": 46}' \
    > test.out 2>&1
eval_tap $? 286 'ProcessUserSubscriptionNotification' test.out

#- 287 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'xq57MiHy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SObOzDEp' \
    --body '{"count": 96, "orderNo": "dybhPC0q"}' \
    > test.out 2>&1
eval_tap $? 287 'AcquireUserTicket' test.out

#- 288 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fia3rXOt' \
    > test.out 2>&1
eval_tap $? 288 'QueryUserCurrencyWallets' test.out

#- 289 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'OTobSl3I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NNNdYgtp' \
    --body '{"allowOverdraft": false, "amount": 73, "balanceOrigin": "Oculus", "balanceSource": "TRADE", "metadata": {"SFpOXXep": {}, "qJwtSum7": {}, "5eQ1DoJ0": {}}, "reason": "LLVaduOq"}' \
    > test.out 2>&1
eval_tap $? 289 'DebitUserWalletByCurrencyCode' test.out

#- 290 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'stY6iyAu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O305ovbI' \
    --limit '30' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 290 'ListUserCurrencyTransactions' test.out

#- 291 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'GaCZmVR6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VoEZZxyy' \
    --request '{"amount": 87, "debitBalanceSource": "TRADE", "metadata": {"9dxugdod": {}, "y7LEGit5": {}, "cHur3ors": {}}, "reason": "SRMP4Aoq", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 291 'CheckBalance' test.out

#- 292 CheckWallet
eval_tap 0 292 'CheckWallet # SKIP deprecated' test.out

#- 293 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'XMyY2dhm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MeptpZOY' \
    --body '{"amount": 78, "expireAt": "1998-08-18T00:00:00Z", "metadata": {"gSYix1Kt": {}, "NOYlST1X": {}, "O04ICusE": {}}, "origin": "Nintendo", "reason": "ORguuyRl", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 293 'CreditUserWallet' test.out

#- 294 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'SgxMHjB2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nvnx76K6' \
    --request '{"amount": 94, "debitBalanceSource": "PAYMENT", "metadata": {"GVjwHtLY": {}, "KBJqQ4mr": {}, "KkO4xt8O": {}}, "reason": "pciVn5pF", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitByWalletPlatform' test.out

#- 295 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'GIc2dNmX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4tuJrul' \
    --body '{"amount": 5, "metadata": {"goBgIZyU": {}, "dApdpOfx": {}, "YXPF6awG": {}}, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 295 'PayWithUserWallet' test.out

#- 296 GetUserWallet
eval_tap 0 296 'GetUserWallet # SKIP deprecated' test.out

#- 297 DebitUserWallet
eval_tap 0 297 'DebitUserWallet # SKIP deprecated' test.out

#- 298 DisableUserWallet
eval_tap 0 298 'DisableUserWallet # SKIP deprecated' test.out

#- 299 EnableUserWallet
eval_tap 0 299 'EnableUserWallet # SKIP deprecated' test.out

#- 300 ListUserWalletTransactions
eval_tap 0 300 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 301 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JgUmtLbv' \
    > test.out 2>&1
eval_tap $? 301 'ListViews' test.out

#- 302 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '5Uj8Un6F' \
    --body '{"displayOrder": 19, "localizations": {"72Ud7d5L": {"description": "mGveKNke", "localExt": {"jenuwfDi": {}, "rT3ENjVB": {}, "C6kYRppU": {}}, "longDescription": "1dLMnFnH", "title": "Qu88btSd"}, "YhCDeJtQ": {"description": "iPlEnl1M", "localExt": {"M7YAJkMs": {}, "DxJ1VmIq": {}, "Lhb8Nkmx": {}}, "longDescription": "FCCtnc4p", "title": "kuDMOLtL"}, "hPnAbG0u": {"description": "L1HGRIFP", "localExt": {"PucAQGbq": {}, "uEylm30n": {}, "wLEdRfCO": {}}, "longDescription": "z9mY3TLy", "title": "PMXMpAJL"}}, "name": "T7q2Qfdd"}' \
    > test.out 2>&1
eval_tap $? 302 'CreateView' test.out

#- 303 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '4HX8KL5F' \
    --storeId 'iEOJdhcz' \
    > test.out 2>&1
eval_tap $? 303 'GetView' test.out

#- 304 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'jvgW7yo4' \
    --storeId 'USXBEhYc' \
    --body '{"displayOrder": 22, "localizations": {"i8lyemlG": {"description": "U1PrlRrx", "localExt": {"nX1b6kW3": {}, "yk6GbAv3": {}, "3enBtzTU": {}}, "longDescription": "d6h2M9Ew", "title": "ZhLtHcOw"}, "wdU1QjF9": {"description": "a3m7Gt1s", "localExt": {"O8rk56TD": {}, "YBLiGsvf": {}, "2B0bmYr2": {}}, "longDescription": "trAksi5I", "title": "Qpk85aCa"}, "VS3lyQoi": {"description": "h9Y6QTnL", "localExt": {"kcxtaHAh": {}, "pY1ijHie": {}, "Lct1yh3l": {}}, "longDescription": "ZUWjdt3Q", "title": "PS1twW6F"}}, "name": "ZviijnrT"}' \
    > test.out 2>&1
eval_tap $? 304 'UpdateView' test.out

#- 305 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'O7kwUMGb' \
    --storeId 'n0UC6JFn' \
    > test.out 2>&1
eval_tap $? 305 'DeleteView' test.out

#- 306 QueryWallets
eval_tap 0 306 'QueryWallets # SKIP deprecated' test.out

#- 307 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 31, "expireAt": "1988-02-09T00:00:00Z", "metadata": {"eqjzCJ9D": {}, "3Hp5hSiZ": {}, "KVEVmp9c": {}}, "origin": "Other", "reason": "H65luSn9", "source": "PROMOTION"}, "currencyCode": "at7B8Vvj", "userIds": ["Iov2TFvi", "UGWIt1KP", "wGKklC6V"]}, {"creditRequest": {"amount": 46, "expireAt": "1986-03-01T00:00:00Z", "metadata": {"2XzJxa0c": {}, "EUPgbXRB": {}, "oU34IMfA": {}}, "origin": "GooglePlay", "reason": "DLSQjk4U", "source": "SELL_BACK"}, "currencyCode": "1BRouM4w", "userIds": ["QFIngwO8", "04fzV2bv", "Uw2f8bkW"]}, {"creditRequest": {"amount": 94, "expireAt": "1974-07-20T00:00:00Z", "metadata": {"QkIHQW4F": {}, "h09tB8Fa": {}, "3Pw0pUy3": {}}, "origin": "Nintendo", "reason": "eJFpled0", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "wCxkr4oK", "userIds": ["glTDCtTE", "0wxqeRwM", "8bfUOTHD"]}]' \
    > test.out 2>&1
eval_tap $? 307 'BulkCredit' test.out

#- 308 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "ZgsRltRq", "request": {"allowOverdraft": false, "amount": 57, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"ZTCvsOTz": {}, "3lMYbtbG": {}, "k39287Zc": {}}, "reason": "VGMHJpEJ"}, "userIds": ["s5BJ05L1", "0DTTbhl0", "3l3Jsjc1"]}, {"currencyCode": "GrSYzE05", "request": {"allowOverdraft": false, "amount": 81, "balanceOrigin": "Epic", "balanceSource": "TRADE", "metadata": {"bu0OPWcU": {}, "q8iKb62g": {}, "jgZdK2Nc": {}}, "reason": "duIVGzv8"}, "userIds": ["2ymWW425", "dU2WRMPy", "JCduhblp"]}, {"currencyCode": "uDOqFNMf", "request": {"allowOverdraft": false, "amount": 77, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"OCO8NtAb": {}, "VCrrhUGq": {}, "RFJrkJED": {}}, "reason": "GElQGwki"}, "userIds": ["CwxG6J4b", "RmhHJ3e6", "VuwnUZh4"]}]' \
    > test.out 2>&1
eval_tap $? 308 'BulkDebit' test.out

#- 309 GetWallet
eval_tap 0 309 'GetWallet # SKIP deprecated' test.out

#- 310 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'dZ7hm0oJ' \
    --end 'L8faRSjB' \
    --start 'Fkxxf9Qg' \
    > test.out 2>&1
eval_tap $? 310 'SyncOrders' test.out

#- 311 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["nqk42xjH", "Qn6ccWdV", "oRz2R9xi"], "apiKey": "vbD7FUNW", "authoriseAsCapture": false, "blockedPaymentMethods": ["GveZH8Hm", "rjnM20kn", "FU2lHKxs"], "clientKey": "ctxuLjHM", "dropInSettings": "xK7kzUvZ", "liveEndpointUrlPrefix": "NIDx237Z", "merchantAccount": "OQRMqZQ2", "notificationHmacKey": "4EaGxYiM", "notificationPassword": "GkfOk9JI", "notificationUsername": "Ww8e4znb", "returnUrl": "soTAkH6B", "settings": "Shg7HXNa"}' \
    > test.out 2>&1
eval_tap $? 311 'TestAdyenConfig' test.out

#- 312 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "6IvnQBfO", "privateKey": "zgdv2o2B", "publicKey": "F41JDdhC", "returnUrl": "95789oW1"}' \
    > test.out 2>&1
eval_tap $? 312 'TestAliPayConfig' test.out

#- 313 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "Af6TxtBl", "secretKey": "rG9yRM1t"}' \
    > test.out 2>&1
eval_tap $? 313 'TestCheckoutConfig' test.out

#- 314 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '1tcO6eNf' \
    > test.out 2>&1
eval_tap $? 314 'DebugMatchedPaymentMerchantConfig' test.out

#- 315 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "yWixRrKU", "clientSecret": "jp9g10wA", "returnUrl": "6cdw4X11", "webHookId": "uyIG93ix"}' \
    > test.out 2>&1
eval_tap $? 315 'TestPayPalConfig' test.out

#- 316 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["iCCvxWZh", "HJKq7GJO", "CJvHGlEo"], "publishableKey": "mKbtFgNs", "secretKey": "PYxwCeUA", "webhookSecret": "gotbh4Em"}' \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfig' test.out

#- 317 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "jlvUR1Dg", "key": "3KN7oCZT", "mchid": "ov5ad7hU", "returnUrl": "qRGMnfNm"}' \
    > test.out 2>&1
eval_tap $? 317 'TestWxPayConfig' test.out

#- 318 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "OqfTuiyy", "flowCompletionUrl": "K4Chpmqx", "merchantId": 95, "projectId": 36, "projectSecretKey": "CaS2zoEk"}' \
    > test.out 2>&1
eval_tap $? 318 'TestXsollaConfig' test.out

#- 319 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'IBzTbZFk' \
    > test.out 2>&1
eval_tap $? 319 'GetPaymentMerchantConfig' test.out

#- 320 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'vhQCbfiE' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["a8GYPJDd", "kr4jNHWK", "06eAita5"], "apiKey": "tf36wl3X", "authoriseAsCapture": true, "blockedPaymentMethods": ["clVB3bxZ", "KiSIGqWH", "8y49dy3g"], "clientKey": "uXuyQi7z", "dropInSettings": "4DDu1SD3", "liveEndpointUrlPrefix": "1Ta5YOS5", "merchantAccount": "YRMUNujs", "notificationHmacKey": "Ka0SS71t", "notificationPassword": "o3pOs41l", "notificationUsername": "ajBHNuaX", "returnUrl": "RlIG31zk", "settings": "jJMbCqsg"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateAdyenConfig' test.out

#- 321 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'DNv2wyvC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 321 'TestAdyenConfigById' test.out

#- 322 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'zKnwHiwV' \
    --sandbox  \
    --validate  \
    --body '{"appId": "QRxWADk2", "privateKey": "JmVAzAKm", "publicKey": "yZAj5tHh", "returnUrl": "m5m1R4Gn"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateAliPayConfig' test.out

#- 323 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'WbiDO2we' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 323 'TestAliPayConfigById' test.out

#- 324 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'UfTmLDr4' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "ZSekUMlO", "secretKey": "ulJeMJdc"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateCheckoutConfig' test.out

#- 325 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'eGGutAVY' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfigById' test.out

#- 326 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'gG02CcUb' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "KownZu12", "clientSecret": "IXSJwmYu", "returnUrl": "j6aSJDOF", "webHookId": "pJXcLDnT"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePayPalConfig' test.out

#- 327 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'aBXHX0eZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 327 'TestPayPalConfigById' test.out

#- 328 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'bWkUlrGS' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["fATNhR2G", "d067VrED", "yS1WNjCT"], "publishableKey": "uvQRwfNg", "secretKey": "JcFxoTgK", "webhookSecret": "TUO9DSMd"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateStripeConfig' test.out

#- 329 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'DLZCjeR7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfigById' test.out

#- 330 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'R4m9mddI' \
    --validate  \
    --body '{"appId": "SY3WyNq4", "key": "NkLUODiM", "mchid": "ZXCUoqoT", "returnUrl": "dYBy8ZDr"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateWxPayConfig' test.out

#- 331 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'Xl4ZGw8R' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 331 'UpdateWxPayConfigCert' test.out

#- 332 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'xtYBWYRb' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfigById' test.out

#- 333 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'gIdptZj3' \
    --validate  \
    --body '{"apiKey": "pKsNNRef", "flowCompletionUrl": "5RyEQ32I", "merchantId": 53, "projectId": 2, "projectSecretKey": "gSwJQ89M"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateXsollaConfig' test.out

#- 334 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '54Fj8t4E' \
    > test.out 2>&1
eval_tap $? 334 'TestXsollaConfigById' test.out

#- 335 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'fVFXTm0R' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateXsollaUIConfig' test.out

#- 336 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '74' \
    --namespace "$AB_NAMESPACE" \
    --offset '75' \
    --region 'HkOJW5JS' \
    > test.out 2>&1
eval_tap $? 336 'QueryPaymentProviderConfig' test.out

#- 337 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "2f6FNnh1", "region": "Youvyqv8", "sandboxTaxJarApiToken": "X0VF5TU9", "specials": ["XSOLLA", "CHECKOUT", "WXPAY"], "taxJarApiToken": "8Hd9VVQ0", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 337 'CreatePaymentProviderConfig' test.out

#- 338 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 338 'GetAggregatePaymentProviders' test.out

#- 339 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'JOOcbxoz' \
    > test.out 2>&1
eval_tap $? 339 'DebugMatchedPaymentProviderConfig' test.out

#- 340 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 340 'GetSpecialPaymentProviders' test.out

#- 341 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'qLlkrPY4' \
    --body '{"aggregate": "ADYEN", "namespace": "ePAXJ8Fk", "region": "8WJgPAv8", "sandboxTaxJarApiToken": "XYjdpxUF", "specials": ["WXPAY", "XSOLLA", "PAYPAL"], "taxJarApiToken": "ZKitR0jB", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePaymentProviderConfig' test.out

#- 342 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '1PzEiHmK' \
    > test.out 2>&1
eval_tap $? 342 'DeletePaymentProviderConfig' test.out

#- 343 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 343 'GetPaymentTaxConfig' test.out

#- 344 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "FC7J6Lrq", "taxJarApiToken": "kaeYILEE", "taxJarEnabled": true, "taxJarProductCodesMapping": {"ud6ZOfrb": "hPhGS9Ws", "G1odxyUr": "t15JlfXN", "zccRSntX": "P9C8ELpL"}}' \
    > test.out 2>&1
eval_tap $? 344 'UpdatePaymentTaxConfig' test.out

#- 345 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'gHClgx1U' \
    --end 'R2MMb7Vs' \
    --start 'vopkrm4M' \
    > test.out 2>&1
eval_tap $? 345 'SyncPaymentOrders' test.out

#- 346 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '2F9jLIE0' \
    --storeId '4tFqXP0s' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetRootCategories' test.out

#- 347 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'TNdrIknu' \
    --storeId 'oVacGsok' \
    > test.out 2>&1
eval_tap $? 347 'DownloadCategories' test.out

#- 348 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'EhOX0Ub5' \
    --namespace "$AB_NAMESPACE" \
    --language '83WS2bbf' \
    --storeId 'BNLurMZs' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetCategory' test.out

#- 349 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'L1s8j3Eg' \
    --namespace "$AB_NAMESPACE" \
    --language 'LmMSOr8m' \
    --storeId 'EWGfEjQW' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetChildCategories' test.out

#- 350 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'uPt1oel7' \
    --namespace "$AB_NAMESPACE" \
    --language 'Hzk9pfwo' \
    --storeId 'ZUprlQdK' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetDescendantCategories' test.out

#- 351 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 351 'PublicListCurrencies' test.out

#- 352 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 352 'GeDLCDurableRewardShortMap' test.out

#- 353 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 353 'GetIAPItemMapping' test.out

#- 354 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'rSo8d5BV' \
    --region 'XKdiY0k1' \
    --storeId 'BESD4Jb2' \
    --appId 'T7h07FI9' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetItemByAppId' test.out

#- 355 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'QwvvxL02' \
    --categoryPath 'PiL9szNU' \
    --features 'rs7BjHZ9' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'vYShCYf7' \
    --limit '5' \
    --offset '52' \
    --region 'HylXKEnr' \
    --sortBy 'name:asc,displayOrder:asc' \
    --storeId '3j7qLLx8' \
    --tags '3d76BJRW' \
    > test.out 2>&1
eval_tap $? 355 'PublicQueryItems' test.out

#- 356 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'bKmxGIZY' \
    --region 'hSzfBNRA' \
    --storeId 'TsOBtcz7' \
    --sku 'RNvDjmJ5' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetItemBySku' test.out

#- 357 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'Id7ZfAxJ' \
    --storeId 'Xy8Xl5FE' \
    --itemIds 'gZ8u48rA' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetEstimatedPrice' test.out

#- 358 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'PBWF9d77' \
    --region 'UQn8x2eQ' \
    --storeId 'qYf9rTv4' \
    --itemIds 'TzqDRDn0' \
    > test.out 2>&1
eval_tap $? 358 'PublicBulkGetItems' test.out

#- 359 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["ScRfE3aV", "bSGyhrpw", "yBNQ5Qhj"]}' \
    > test.out 2>&1
eval_tap $? 359 'PublicValidateItemPurchaseCondition' test.out

#- 360 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'EXTENSION' \
    --limit '95' \
    --offset '12' \
    --region 'gPYlJDH0' \
    --storeId 'fzEsyADE' \
    --keyword '49FefMdG' \
    --language 'Y8yI8Eom' \
    > test.out 2>&1
eval_tap $? 360 'PublicSearchItems' test.out

#- 361 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'gZuufTYP' \
    --namespace "$AB_NAMESPACE" \
    --language 'jxgAqhbU' \
    --region 'K4QZQbHc' \
    --storeId 'wnQLdJUB' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetApp' test.out

#- 362 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'ltomQsyW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemDynamicData' test.out

#- 363 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '4DP7XJGH' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'ZncrbGVx' \
    --populateBundle  \
    --region 'tMEkNjlJ' \
    --storeId 'A1hjSXg4' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItem' test.out

#- 364 GetPaymentCustomization
eval_tap 0 364 'GetPaymentCustomization # SKIP deprecated' test.out

#- 365 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "NQs5oMoX", "paymentProvider": "ALIPAY", "returnUrl": "3N3FafPI", "ui": "TfZ3UfM1", "zipCode": "UQOpApRT"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentUrl' test.out

#- 366 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TERj3WVV' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetPaymentMethods' test.out

#- 367 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XasmD59P' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetUnpaidPaymentOrder' test.out

#- 368 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DQTsq5BC' \
    --paymentProvider 'WALLET' \
    --zipCode 'lXHaEpmP' \
    --body '{"token": "8S3se3Uo"}' \
    > test.out 2>&1
eval_tap $? 368 'Pay' test.out

#- 369 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 's4Rhy7m8' \
    > test.out 2>&1
eval_tap $? 369 'PublicCheckPaymentOrderPaidStatus' test.out

#- 370 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 't9b89kdk' \
    > test.out 2>&1
eval_tap $? 370 'GetPaymentPublicConfig' test.out

#- 371 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'EKbvxXim' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetQRCode' test.out

#- 372 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'NtlPfC5L' \
    --foreinginvoice 'lbNGLMiU' \
    --invoiceId 'XYVBPzTT' \
    --payload 'IM5whsnK' \
    --redirectResult '0R0qH3ln' \
    --resultCode 'cyaiiSl0' \
    --sessionId 'Vo2X4zf7' \
    --status '20X8Wxg2' \
    --token 'mhwZtJH5' \
    --type '2bySE1Sd' \
    --userId 'YZWaQr5W' \
    --orderNo 'edT6ExW0' \
    --paymentOrderNo 'ZLxsY0ot' \
    --paymentProvider 'WALLET' \
    --returnUrl 'M8f62dFG' \
    > test.out 2>&1
eval_tap $? 372 'PublicNormalizePaymentReturnUrl' test.out

#- 373 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'pRqCQjaa' \
    --paymentOrderNo '1m14bHL9' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 373 'GetPaymentTaxValue' test.out

#- 374 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'YNrSPFJI' \
    > test.out 2>&1
eval_tap $? 374 'GetRewardByCode' test.out

#- 375 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'OSW1jTxo' \
    --limit '7' \
    --offset '29' \
    --sortBy 'namespace,namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 375 'QueryRewards1' test.out

#- 376 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'H734huCT' \
    > test.out 2>&1
eval_tap $? 376 'GetReward1' test.out

#- 377 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicListStores' test.out

#- 378 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'wseIBlWS,blt4A47u,kBzNgRDj' \
    --itemIds '66WgMktg,IEOqNxLe,p9hoG4Ph' \
    --skus 'iUQIEQBB,B40a3j0p,gU1mjwNG' \
    > test.out 2>&1
eval_tap $? 378 'PublicExistsAnyMyActiveEntitlement' test.out

#- 379 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'olNq4lPo' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 380 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'UfowC6uN' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 381 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'qYWpiIlo' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 382 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'HBr3Yw60,2g7LH7PS,R3dnHWXx' \
    --itemIds 'qmHftvWa,fIz2DypZ,zDDkssT1' \
    --skus '3WxB7xkx,mHCNAoPF,JyDjuEHP' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetEntitlementOwnershipToken' test.out

#- 383 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "a5rrBLbn", "language": "wOh-392", "region": "tTxW9LT3"}' \
    > test.out 2>&1
eval_tap $? 383 'SyncTwitchDropsEntitlement' test.out

#- 384 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'olqYzapw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyWallet' test.out

#- 385 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fikYgWtp' \
    --body '{"epicGamesJwtToken": "upX5eGOC"}' \
    > test.out 2>&1
eval_tap $? 385 'SyncEpicGameDLC' test.out

#- 386 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'K0m2bI33' \
    > test.out 2>&1
eval_tap $? 386 'SyncOculusDLC' test.out

#- 387 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '4SQqyRO8' \
    --body '{"serviceLabel": 21}' \
    > test.out 2>&1
eval_tap $? 387 'PublicSyncPsnDlcInventory' test.out

#- 388 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2T2kRSp' \
    --body '{"serviceLabels": [96, 28, 93]}' \
    > test.out 2>&1
eval_tap $? 388 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 389 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yk7LCqF2' \
    --body '{"appId": "L39msQsu", "steamId": "JefDAG8R"}' \
    > test.out 2>&1
eval_tap $? 389 'SyncSteamDLC' test.out

#- 390 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'nekmFpPy' \
    --body '{"xstsToken": "tYxFyHPH"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncXboxDLC' test.out

#- 391 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '9UwjtBUx' \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'K92ULpTu' \
    --features 'CJ4cN8RK,8DdVPFC2,dxmSAGGg' \
    --itemId 'I2jZJvar,XUOO0rzx,9QYop0Zo' \
    --limit '15' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 391 'PublicQueryUserEntitlements' test.out

#- 392 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BKR1ZJig' \
    --appId 'Mxnguk39' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetUserAppEntitlementByAppId' test.out

#- 393 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'obLz8II8' \
    --limit '50' \
    --offset '20' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 393 'PublicQueryUserEntitlementsByAppType' test.out

#- 394 PublicGetUserEntitlementByItemId
eval_tap 0 394 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 395 PublicGetUserEntitlementBySku
eval_tap 0 395 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 396 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HIBUbhv5' \
    --appIds 'nzO0GGeL,V3Suvkx7,i5RV7BgI' \
    --itemIds 'Co1VE5XI,ClEMLqgu,MjJ9SzP3' \
    --skus 'LOEHWIGf,wPlf2lie,eBRWZDQv' \
    > test.out 2>&1
eval_tap $? 396 'PublicExistsAnyUserActiveEntitlement' test.out

#- 397 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8qeOiS7' \
    --appId '8jVj4iAS' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 398 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ENPrb6iw' \
    --entitlementClazz 'CODE' \
    --itemId '0vJS3eD0' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 399 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJZkp0eg' \
    --ids 'NhMPwYBl,5r07TqVG,sC0bLJH9' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 400 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'dZf6RmXr' \
    --entitlementClazz 'CODE' \
    --sku 'Jh1ews8A' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 401 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '9MzHfqKW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zBsBMXOe' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlement' test.out

#- 402 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'abr0z2n6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIpBSyWL' \
    --body '{"options": ["IlyBIyUR", "6wtpWssO", "38MVxX49"], "requestId": "56r2RX1q", "useCount": 31}' \
    > test.out 2>&1
eval_tap $? 402 'PublicConsumeUserEntitlement' test.out

#- 403 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId '6zALLgMu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'km3BmNgw' \
    --body '{"requestId": "SgJBujMe", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSellUserEntitlement' test.out

#- 404 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '1owUOdXL' \
    --body '{"code": "NTQL3Wa3", "language": "qCo_mxJy_229", "region": "3IR5IzA8"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicRedeemCode' test.out

#- 405 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvEg4Pm9' \
    --body '{"excludeOldTransactions": false, "language": "WIZW_432", "productId": "XTEW9Qhy", "receiptData": "jgMQPJDH", "region": "UZbf4BXs", "transactionId": "Ivf3m8rZ"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicFulfillAppleIAPItem' test.out

#- 406 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'F0bp6Xyz' \
    --body '{"epicGamesJwtToken": "IEKuaUZH"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncEpicGamesInventory' test.out

#- 407 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OpKjBGA3' \
    --body '{"autoAck": true, "language": "gRU-meMO", "orderId": "GdfDqai1", "packageName": "fClcNSOE", "productId": "kCehIQ9E", "purchaseTime": 85, "purchaseToken": "aq3gdMwb", "region": "fuOd6XzH"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicFulfillGoogleIAPItem' test.out

#- 408 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'whDNSmEn' \
    > test.out 2>&1
eval_tap $? 408 'SyncOculusConsumableEntitlements' test.out

#- 409 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'pFcigGfY' \
    --body '{"currencyCode": "0Bf3nWe7", "price": 0.07604182511429991, "productId": "T1CzrNR6", "serviceLabel": 81}' \
    > test.out 2>&1
eval_tap $? 409 'PublicReconcilePlayStationStore' test.out

#- 410 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'qAJBib9j' \
    --body '{"currencyCode": "veiTUbnF", "price": 0.3597419648704331, "productId": "YvN4NIyi", "serviceLabels": [81, 75, 86]}' \
    > test.out 2>&1
eval_tap $? 410 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 411 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'O1fNbZMJ' \
    --body '{"appId": "8E3TXtAs", "currencyCode": "5xtDr9F8", "language": "Iiv", "price": 0.45941269034440346, "productId": "gRkdEo21", "region": "UwJcYr1T", "steamId": "hrWv1MDO"}' \
    > test.out 2>&1
eval_tap $? 411 'SyncSteamInventory' test.out

#- 412 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8jJl74o' \
    --body '{"gameId": "WZs5XZfY", "language": "BF-pqrV", "region": "BoSaxPtU"}' \
    > test.out 2>&1
eval_tap $? 412 'SyncTwitchDropsEntitlement1' test.out

#- 413 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'E9UKvADy' \
    --body '{"currencyCode": "1S4woBIL", "price": 0.12298636778916139, "productId": "DVDDgOND", "xstsToken": "CyUOFA3g"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncXboxInventory' test.out

#- 414 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FsxLGYw4' \
    --itemId 'iajBEB2b' \
    --limit '88' \
    --offset '65' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 414 'PublicQueryUserOrders' test.out

#- 415 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'W5RQhVV2' \
    --body '{"currencyCode": "4RVuta0p", "discountedPrice": 83, "ext": {"y0ad8sUV": {}, "pYS816qy": {}, "DqYgGuRn": {}}, "itemId": "IYWD2eFL", "language": "uWHL-QBBk", "price": 49, "quantity": 75, "region": "s8bLoIsi", "returnUrl": "ACmZJ5sP", "sectionId": "JiAkM84o"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCreateUserOrder' test.out

#- 416 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WYhZD9gC' \
    --userId 'qiprrmQN' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserOrder' test.out

#- 417 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UzeWEroS' \
    --userId 'kf6kPUop' \
    > test.out 2>&1
eval_tap $? 417 'PublicCancelUserOrder' test.out

#- 418 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mKtYWtTw' \
    --userId '6XWR6iYe' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserOrderHistories' test.out

#- 419 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bbyRfL8e' \
    --userId 'ztdCCM7r' \
    > test.out 2>&1
eval_tap $? 419 'PublicDownloadUserOrderReceipt' test.out

#- 420 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '9QBMLfGU' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentAccounts' test.out

#- 421 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'KnwSBCFu' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'vzbf7y2Z' \
    > test.out 2>&1
eval_tap $? 421 'PublicDeletePaymentAccount' test.out

#- 422 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'APtIRTZL' \
    --autoCalcEstimatedPrice  \
    --language 'ME2mv7IB' \
    --region 'Qze4JEJs' \
    --storeId 'WZhJPLGo' \
    --viewId 'EYaHdiW6' \
    > test.out 2>&1
eval_tap $? 422 'PublicListActiveSections' test.out

#- 423 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'TK4GLfHr' \
    --chargeStatus 'NEVER' \
    --itemId 't4EY1uqs' \
    --limit '95' \
    --offset '35' \
    --sku 'FIdF2ySY' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserSubscriptions' test.out

#- 424 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'GjNlvzP2' \
    --body '{"currencyCode": "O5ubOt0c", "itemId": "xXvo4Par", "language": "fy", "region": "V9DixHXV", "returnUrl": "nDaLKqx9", "source": "yH5ujIV0"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicSubscribeSubscription' test.out

#- 425 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZdbgK29T' \
    --itemId 'sKmgF86D' \
    > test.out 2>&1
eval_tap $? 425 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 426 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ceb9qFtN' \
    --userId 'bnQ7voMD' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserSubscription' test.out

#- 427 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iY5fWAlv' \
    --userId 'pI8mNKGP' \
    > test.out 2>&1
eval_tap $? 427 'PublicChangeSubscriptionBillingAccount' test.out

#- 428 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kCICkWvG' \
    --userId 'tnHDjyEt' \
    --body '{"immediate": true, "reason": "XYCxkura"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicCancelSubscription' test.out

#- 429 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'm0j5Tisw' \
    --userId 'hsYoLUwa' \
    --excludeFree  \
    --limit '55' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserSubscriptionBillingHistories' test.out

#- 430 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'epy6NjVK' \
    --language 'Z9mhalxQ' \
    --storeId 'uTNVqHBF' \
    > test.out 2>&1
eval_tap $? 430 'PublicListViews' test.out

#- 431 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '25JQoef8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KToW2TjG' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetWallet' test.out

#- 432 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'tyDtAXLE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BiagsyJj' \
    --limit '43' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 432 'PublicListUserWalletTransactions' test.out

#- 433 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'rBDkkbgm' \
    --baseAppId 'kQl2TuYM' \
    --categoryPath 'Tnj5ViJp' \
    --features 'OcKbB0sq' \
    --includeSubCategoryItem  \
    --itemName 'wS6lhokv' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS' \
    --limit '48' \
    --offset '55' \
    --region 'aBb1E6Xf' \
    --sectionExclusive  \
    --sortBy 'name,displayOrder,updatedAt:desc' \
    --storeId 'g0zVEEWL' \
    --tags 'ofwYS2Rz' \
    --targetNamespace 'JViSsnOX' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 433 'QueryItems1' test.out

#- 434 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PqQ7DbH5' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 434 'ImportStore1' test.out

#- 435 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XkwbatTz' \
    --body '{"itemIds": ["Jte2sO2M", "RYxGYcPo", "VfhpzRML"]}' \
    > test.out 2>&1
eval_tap $? 435 'ExportStore1' test.out

#- 436 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FLjv0NYN' \
    --body '{"entitlementOrigin": "Nintendo", "metadata": {"fqKSvQX8": {}, "OyQ3XgCI": {}, "MEaMI48X": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "8pVl5Aqx", "namespace": "XSUp5qaA"}, "item": {"itemId": "lUEh2NWz", "itemSku": "GJ7mC7Nc", "itemType": "auAGLKE5"}, "quantity": 22, "type": "CURRENCY"}, {"currency": {"currencyCode": "w90cgCXC", "namespace": "iy2dgH0H"}, "item": {"itemId": "WHkiRcxT", "itemSku": "u66KUhKp", "itemType": "4oDBksq6"}, "quantity": 58, "type": "ITEM"}, {"currency": {"currencyCode": "WsxW6x4N", "namespace": "JEI1o7P9"}, "item": {"itemId": "VI5O0nzk", "itemSku": "Cmm82ld2", "itemType": "yNNPc1dF"}, "quantity": 81, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "f359xhoD"}' \
    > test.out 2>&1
eval_tap $? 436 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
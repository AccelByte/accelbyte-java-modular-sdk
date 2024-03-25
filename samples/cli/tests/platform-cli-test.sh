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
echo "1..445"

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
    --id 'pIsfOUXH' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'WQwuJWQn' \
    --body '{"grantDays": "IYU1myqq"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'D9C9XrIv' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'hF0oVD9c' \
    --body '{"grantDays": "hTHh6bke"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "ooU2ZT1j", "dryRun": true, "fulfillmentUrl": "1gbZA5HG", "itemType": "EXTENSION", "purchaseConditionUrl": "TijYGORy"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'iNePcEb9' \
    --itemType 'INGAMEITEM' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '47GCbBky' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'NTbH9N6S' \
    --body '{"clazz": "VdsSbyg3", "dryRun": false, "fulfillmentUrl": "tOem3NKr", "purchaseConditionUrl": "WBBDL4h6"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'UfRy2uWn' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --name '4DqtvQcr' \
    --offset '60' \
    --tag '8BAPNLyx' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "KmTP5HpD", "items": [{"extraSubscriptionDays": 36, "itemId": "nmjluFbJ", "itemName": "wWrziRy8", "quantity": 22}, {"extraSubscriptionDays": 72, "itemId": "b8Fn1ZUG", "itemName": "OhzkxNlE", "quantity": 31}, {"extraSubscriptionDays": 44, "itemId": "vrNTI9Dl", "itemName": "37BHmIm0", "quantity": 3}], "maxRedeemCountPerCampaignPerUser": 75, "maxRedeemCountPerCode": 32, "maxRedeemCountPerCodePerUser": 21, "maxSaleCount": 73, "name": "Jk5bVXIA", "redeemEnd": "1991-04-16T00:00:00Z", "redeemStart": "1989-08-22T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["B4tQmr7z", "HVjQdxqj", "ZpmNhXEJ"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '64g7ozcO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '2P7yxOu0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZWVfimug", "items": [{"extraSubscriptionDays": 35, "itemId": "BuyY4Wij", "itemName": "CByllVAQ", "quantity": 76}, {"extraSubscriptionDays": 84, "itemId": "44xqGH0s", "itemName": "qhLoV5jj", "quantity": 33}, {"extraSubscriptionDays": 6, "itemId": "qUV5HYDU", "itemName": "Ud2JVd8w", "quantity": 37}], "maxRedeemCountPerCampaignPerUser": 18, "maxRedeemCountPerCode": 54, "maxRedeemCountPerCodePerUser": 2, "maxSaleCount": 68, "name": "gdQ31m9i", "redeemEnd": "1971-03-20T00:00:00Z", "redeemStart": "1982-02-16T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["81SUEhce", "U24P2Nqh", "v30zwK6d"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'ybjERWd6' \
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
    --body '{"appConfig": {"appName": "FtR1pzZj"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "58SChPsB"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "mnPIcADh"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "rXQDbGfp"}, "extendType": "CUSTOM"}' \
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
    --storeId '7ZTrfewV' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lz9CsLSU' \
    --body '{"categoryPath": "wBQivZ7R", "localizationDisplayNames": {"Niv8oVKc": "cXQXHl8v", "IeqFMV8N": "qdBSce3m", "2wChDNSk": "DOfAJEFe"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L7KSjAbU' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'KmkVdJeW' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9Fc21M7O' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'ohjWJjQr' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9z4t9Den' \
    --body '{"localizationDisplayNames": {"nMdrdaG8": "2aMeS33h", "gXTYMyRD": "bBIGxvUG", "R2wKVl1f": "ao2yonud"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'nrg05icY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BqXR66NV' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'tUY7dA7m' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2FFgQT7a' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'lXD6WpCI' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9oHUwRsb' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'W5RoZGSh' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '39' \
    --code 'hkhi7QzQ' \
    --limit '34' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'dEpe4FEc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 62}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '9Ts7tdDJ' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '36' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'ClfgyPXk' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '59' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '3O2gip0K' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '41' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'AeDvLVKC' \
    --namespace "$AB_NAMESPACE" \
    --code 'P5oXn7vB' \
    --limit '0' \
    --offset '81' \
    --userId 'ZEUYVGGE' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'TBHS91T1' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'L1Bymg4R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'fHPnjh63' \
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
    --body '{"currencyCode": "085RryZB", "currencySymbol": "OtbbENqT", "currencyType": "VIRTUAL", "decimals": 63, "localizationDescriptions": {"P8Cf4bpZ": "eV5wxHDc", "LjXneTKI": "lUgG7kz9", "M6MY7jcg": "0rBXTRxA"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'KYACqELY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"lfyLJBtw": "SKV4kIAP", "qItoDx3O": "nuwpknrc", "222fLVKO": "KE0YBroc"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'hdQHaBov' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'j3rf2fNO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'J99FVQmu' \
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
    --body '{"data": [{"id": "fFd3PcOn", "rewards": [{"currency": {"currencyCode": "qH7JdATa", "namespace": "dino5qKz"}, "item": {"itemId": "HTjtvMsM", "itemSku": "bjdtQTjZ", "itemType": "Q0Uj7CFb"}, "quantity": 76, "type": "CURRENCY"}, {"currency": {"currencyCode": "O3ch6WZx", "namespace": "WL1X8rXi"}, "item": {"itemId": "D9wuA2A8", "itemSku": "JSEndixS", "itemType": "ASQzApvY"}, "quantity": 34, "type": "CURRENCY"}, {"currency": {"currencyCode": "Sp4azvNF", "namespace": "qfCascoY"}, "item": {"itemId": "tFCKRXRn", "itemSku": "kKEJ6vRP", "itemType": "NDseiKEl"}, "quantity": 93, "type": "CURRENCY"}]}, {"id": "VRN7AmSq", "rewards": [{"currency": {"currencyCode": "Zf8zgwrV", "namespace": "7zHbfk1j"}, "item": {"itemId": "ziFPPb89", "itemSku": "2rpgGN7x", "itemType": "IVLCKHho"}, "quantity": 74, "type": "ITEM"}, {"currency": {"currencyCode": "MyRvewuC", "namespace": "lE3M8Mte"}, "item": {"itemId": "Pq3nRY2R", "itemSku": "EMH2Yvfw", "itemType": "mwjPCkfG"}, "quantity": 20, "type": "ITEM"}, {"currency": {"currencyCode": "UzwNKNX7", "namespace": "Jc0gPSMX"}, "item": {"itemId": "0ZE24UVJ", "itemSku": "xXQLCEYx", "itemType": "2L6E2R7i"}, "quantity": 98, "type": "CURRENCY"}]}, {"id": "hEmu0mSS", "rewards": [{"currency": {"currencyCode": "h7yUdMfb", "namespace": "ySvVhNQI"}, "item": {"itemId": "4F6YTSuL", "itemSku": "qNJ8GhBn", "itemType": "XY3RBo1L"}, "quantity": 6, "type": "ITEM"}, {"currency": {"currencyCode": "oZZoijX8", "namespace": "Sw9uTwnj"}, "item": {"itemId": "BWgF0wpd", "itemSku": "gur6y8yM", "itemType": "VQvo6r9l"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "bEuFExmx", "namespace": "Yynzp6uT"}, "item": {"itemId": "gUZcwUY2", "itemSku": "d7ApzgFh", "itemType": "JrEX6zQG"}, "quantity": 69, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "OCULUS", "platformDlcIdMap": {"SpJD5n0K": "oBICcPIb", "BUiQ9MqK": "doLPiHWf", "WYQE3uNQ": "GMNLkBeX"}}, {"platform": "XBOX", "platformDlcIdMap": {"FaR9HNIB": "MFAeFqPd", "3PioLHV8": "bikgEM1x", "H5NJmmYl": "zJtnEeq1"}}, {"platform": "XBOX", "platformDlcIdMap": {"e7mv3QD9": "NBhLtGUq", "sXhvENUh": "OjnrUypp", "0L7GPTrg": "FmSWfF1g"}}]}' \
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
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'tZjdVBbI' \
    --itemId 'hZ81XHA7,VmlANcS1,5138Le73' \
    --limit '53' \
    --offset '30' \
    --origin 'Epic' \
    --userId 'J7XYfgMn' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '28k6GB20,qVAR46j1,C0CjaAcR' \
    --limit '44' \
    --offset '62' \
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
    --body '{"entitlementGrantList": [{"collectionId": "GvNTDLDa", "endDate": "1988-03-07T00:00:00Z", "grantedCode": "6AbWQeIE", "itemId": "B4vg8ecL", "itemNamespace": "Evpa4usV", "language": "CSR-yaca", "origin": "Playstation", "quantity": 24, "region": "FvaIqFu7", "source": "PROMOTION", "startDate": "1977-11-01T00:00:00Z", "storeId": "oJ2la3Zi"}, {"collectionId": "Cui0Gqqj", "endDate": "1977-11-19T00:00:00Z", "grantedCode": "J3KhW4vM", "itemId": "0FTtud0i", "itemNamespace": "hJSAPEBz", "language": "kExs", "origin": "Oculus", "quantity": 92, "region": "KRSxgv2O", "source": "PROMOTION", "startDate": "1973-07-08T00:00:00Z", "storeId": "yRZKYYND"}, {"collectionId": "LjU6Py2q", "endDate": "1982-08-17T00:00:00Z", "grantedCode": "XoBHGCLG", "itemId": "A7yLmadI", "itemNamespace": "4SmOGC5n", "language": "nt-BfmI_vU", "origin": "Twitch", "quantity": 76, "region": "yseXTVW9", "source": "REWARD", "startDate": "1979-09-04T00:00:00Z", "storeId": "1CR51sAg"}], "userIds": ["Mzjejd2H", "C5RyI0WX", "I8RXfzDf"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["fwxgN3pj", "zDEAwMzb", "u7Nl5GE9"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 't7OFwVw1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '96' \
    --status 'FAIL' \
    --userId 'VJnvja9U' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oKvOccEi' \
    --eventType 'OTHER' \
    --externalOrderId '0nFi0V3M' \
    --limit '89' \
    --offset '50' \
    --startTime 'hJzAOWP8' \
    --status 'IGNORED' \
    --userId 'EnQiizs5' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "InBkRFkU", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 8, "clientTransactionId": "uFG0AggP"}, {"amountConsumed": 3, "clientTransactionId": "a69Iahka"}, {"amountConsumed": 62, "clientTransactionId": "GOLuyWWP"}], "entitlementId": "H9gUndmn", "usageCount": 44}, {"clientTransaction": [{"amountConsumed": 5, "clientTransactionId": "JFAQyolG"}, {"amountConsumed": 42, "clientTransactionId": "7gvbInMT"}, {"amountConsumed": 99, "clientTransactionId": "vBmtUZNn"}], "entitlementId": "SlGZEyYy", "usageCount": 26}, {"clientTransaction": [{"amountConsumed": 9, "clientTransactionId": "Pjg1OcCQ"}, {"amountConsumed": 38, "clientTransactionId": "SKd1qBIm"}, {"amountConsumed": 58, "clientTransactionId": "oTQQNSkK"}], "entitlementId": "fvI7173S", "usageCount": 77}], "purpose": "uiSWjopg"}, "originalTitleName": "X05AmUPO", "paymentProductSKU": "0IQ2i3M0", "purchaseDate": "Zq2dTKmI", "sourceOrderItemId": "lnmXwZ23", "titleName": "X6VaxOPO"}, "eventDomain": "1MaTz5yn", "eventSource": "885u2jKU", "eventType": "cdRpiK31", "eventVersion": 36, "id": "HUVgG7r0", "timestamp": "E5nycmOD"}' \
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
    --body '{"bundleId": "jMmZVfdE", "password": "HP9ibBUi"}' \
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
    --body '{"sandboxId": "vRJ2hZDb"}' \
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
    --body '{"applicationName": "vOPll6WI", "serviceAccountId": "bH83CubE"}' \
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
    --body '{"data": [{"itemIdentity": "ny1oZFdY", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"6LQS9nFx": "UYM6GzTN", "WuaAmFsl": "CdYeT5C9", "qt14wVKU": "dfecSqh1"}}, {"itemIdentity": "2jaqu0CN", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"kcnEr568": "5EnXbLgY", "0vTUhwqP": "00dMKlhY", "vj5J2gjP": "UvNKZaw9"}}, {"itemIdentity": "a861xWFx", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"1hVNeBDo": "63B5j7L7", "zQB7pFyR": "UidmwJuy", "kd70KIaU": "ciM6832k"}}]}' \
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
    --body '{"appId": "CCEJGOgA", "appSecret": "kyHkfyJI"}' \
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
    --body '{"backOfficeServerClientId": "GMJS8mNz", "backOfficeServerClientSecret": "dXr176cY", "enableStreamJob": true, "environment": "qWczkpOE", "streamName": "pK21oVTH", "streamPartnerName": "qMiEtx3z"}' \
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
    --body '{"backOfficeServerClientId": "UnQBPQEe", "backOfficeServerClientSecret": "m7cFv18t", "enableStreamJob": true, "environment": "i1ZoCJaL", "streamName": "ew83gb3h", "streamPartnerName": "RzMrJlGp"}' \
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
    --body '{"appId": "Xfs8zFzE", "publisherAuthenticationKey": "wA5wnDco"}' \
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
    --body '{"clientId": "XLyKVi84", "clientSecret": "aI2kKMxV", "organizationId": "Um71lTLf"}' \
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
    --body '{"relyingPartyCert": "uPUtiy38"}' \
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
    --password 'F4ppzbKp' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'edWRraWe' \
    --itemId 'K1zSIQ5Q' \
    --itemType 'APP' \
    --endTime 'dqagpGbC' \
    --startTime 'JqPEHV91' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'MLjc5cJV' \
    --itemId 'uki0mP7j' \
    --itemType 'EXTENSION' \
    --endTime '6AhERSOy' \
    --startTime 'afkk8ZKY' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jYScyYOv' \
    --body '{"categoryPath": "hBj9fzSb", "targetItemId": "2p9S3B3W", "targetNamespace": "XVgyRGM5"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nVLNIGdH' \
    --body '{"appId": "jIndCFWt", "appType": "DEMO", "baseAppId": "1md0hwOJ", "boothName": "0XXMDU9A", "categoryPath": "gHn4qxFc", "clazz": "vfNrxp2L", "displayOrder": 65, "entitlementType": "CONSUMABLE", "ext": {"9TSae6Zr": {}, "YCGmJ8MV": {}, "ZdDhWdL2": {}}, "features": ["kM92wWWz", "C8CuZSos", "b7iAa229"], "flexible": false, "images": [{"as": "jQ1fnZv7", "caption": "tostjyiC", "height": 74, "imageUrl": "Jm82TZub", "smallImageUrl": "Ng48FFhS", "width": 79}, {"as": "Ig7omyxm", "caption": "cfL8894C", "height": 3, "imageUrl": "Vk0DrEvx", "smallImageUrl": "IPE8adTt", "width": 47}, {"as": "nt7MkjCD", "caption": "voQTeP5G", "height": 21, "imageUrl": "CE9mjPEC", "smallImageUrl": "j9YHmyGg", "width": 10}], "inventoryConfig": {"customAttributes": {"s5OyAIzh": {}, "bhUTFP0V": {}, "7xWeYIEK": {}}, "serverCustomAttributes": {"ASPaE6HX": {}, "xFz6WSVV": {}, "AhTl3kHj": {}}, "slotUsed": 47}, "itemIds": ["aUPlICgz", "q3Et6l1W", "hc5fCToL"], "itemQty": {"WjWBPjLZ": 29, "6nUcldqY": 45, "rpqEwZhU": 35}, "itemType": "LOOTBOX", "listable": false, "localizations": {"UmNjtqm4": {"description": "IXSSSpWK", "localExt": {"3UvdhS1x": {}, "STHNLAf6": {}, "HuXucFLc": {}}, "longDescription": "KIQZZ6Qw", "title": "X9PG58Az"}, "n3BvbIzC": {"description": "apeRTPz3", "localExt": {"ajGHm8MA": {}, "7rFPUCT0": {}, "6hpjlc4h": {}}, "longDescription": "dzasKxiC", "title": "bqekSznL"}, "RkpLIZ5H": {"description": "nYYZ1aaB", "localExt": {"hp44njeZ": {}, "QElM1p17": {}, "kPUZeCdI": {}}, "longDescription": "GvEdCvSE", "title": "JxA5mWQ2"}}, "lootBoxConfig": {"rewardCount": 87, "rewards": [{"lootBoxItems": [{"count": 75, "duration": 77, "endDate": "1975-05-06T00:00:00Z", "itemId": "xGllVCl7", "itemSku": "fcN80LqS", "itemType": "vtzfdGCU"}, {"count": 63, "duration": 51, "endDate": "1992-04-19T00:00:00Z", "itemId": "ahuHlkuQ", "itemSku": "34CoukL3", "itemType": "ThY3eheZ"}, {"count": 56, "duration": 68, "endDate": "1972-08-03T00:00:00Z", "itemId": "PLSMYce0", "itemSku": "NtmGOGbR", "itemType": "MkguF0ye"}], "name": "HfGJd5xE", "odds": 0.6377364574977641, "type": "REWARD_GROUP", "weight": 74}, {"lootBoxItems": [{"count": 44, "duration": 18, "endDate": "1986-02-23T00:00:00Z", "itemId": "1ejT71tg", "itemSku": "0JqEqfT4", "itemType": "TbiMhZsT"}, {"count": 11, "duration": 74, "endDate": "1975-09-25T00:00:00Z", "itemId": "m89uMaD2", "itemSku": "Cirl7sfV", "itemType": "giZZZfFJ"}, {"count": 41, "duration": 51, "endDate": "1984-02-03T00:00:00Z", "itemId": "RzCmiFer", "itemSku": "4Bq6jxIc", "itemType": "FySwUv6W"}], "name": "tcTQyDvX", "odds": 0.1337230420329144, "type": "REWARD", "weight": 71}, {"lootBoxItems": [{"count": 27, "duration": 89, "endDate": "1994-11-01T00:00:00Z", "itemId": "ybIcR8U4", "itemSku": "gIpwrGT1", "itemType": "PJmgWfy9"}, {"count": 74, "duration": 70, "endDate": "1982-10-28T00:00:00Z", "itemId": "LGl1hFvB", "itemSku": "sC9kKvpM", "itemType": "HjfHOdyz"}, {"count": 23, "duration": 81, "endDate": "1978-01-28T00:00:00Z", "itemId": "K8iGpmIC", "itemSku": "sHC0iTiE", "itemType": "ewbfVKDL"}], "name": "yYBgs3Ii", "odds": 0.9842570795193252, "type": "REWARD_GROUP", "weight": 81}], "rollFunction": "CUSTOM"}, "maxCount": 98, "maxCountPerUser": 34, "name": "8zcXkNAT", "optionBoxConfig": {"boxItems": [{"count": 81, "duration": 100, "endDate": "1982-08-31T00:00:00Z", "itemId": "C11OIPhr", "itemSku": "Pfw6WQGU", "itemType": "MqeqdyaQ"}, {"count": 87, "duration": 50, "endDate": "1995-10-02T00:00:00Z", "itemId": "P9cepZmL", "itemSku": "svGQgyMd", "itemType": "otFFK8ta"}, {"count": 84, "duration": 98, "endDate": "1983-02-05T00:00:00Z", "itemId": "DLHzpfpK", "itemSku": "wzMKivOP", "itemType": "EbnGFXi9"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 90, "fixedTrialCycles": 9, "graceDays": 8}, "regionData": {"FYRD9KW8": [{"currencyCode": "zAvp6SoR", "currencyNamespace": "JOumScsk", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1972-09-12T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1981-09-05T00:00:00Z", "expireAt": "1975-08-18T00:00:00Z", "price": 75, "purchaseAt": "1982-11-30T00:00:00Z", "trialPrice": 78}, {"currencyCode": "uaGnRF2J", "currencyNamespace": "zcIyHBQ0", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1990-11-06T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1978-02-11T00:00:00Z", "expireAt": "1982-08-30T00:00:00Z", "price": 5, "purchaseAt": "1992-04-09T00:00:00Z", "trialPrice": 53}, {"currencyCode": "tGF468Y9", "currencyNamespace": "iZjISSgA", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1977-01-29T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1997-08-02T00:00:00Z", "expireAt": "1980-11-16T00:00:00Z", "price": 49, "purchaseAt": "1987-01-25T00:00:00Z", "trialPrice": 67}], "Z1EpJtIH": [{"currencyCode": "qLsGwnmt", "currencyNamespace": "uOnkgZwe", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1983-09-28T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1998-02-23T00:00:00Z", "expireAt": "1980-02-05T00:00:00Z", "price": 69, "purchaseAt": "1997-09-23T00:00:00Z", "trialPrice": 47}, {"currencyCode": "gTLV33PL", "currencyNamespace": "zZTTW2sZ", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1988-05-29T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1974-11-09T00:00:00Z", "expireAt": "1980-01-23T00:00:00Z", "price": 27, "purchaseAt": "1988-02-21T00:00:00Z", "trialPrice": 18}, {"currencyCode": "zoRbVMwk", "currencyNamespace": "iagEhamn", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1993-05-01T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1985-03-13T00:00:00Z", "expireAt": "1995-11-01T00:00:00Z", "price": 19, "purchaseAt": "1989-02-24T00:00:00Z", "trialPrice": 93}], "ngs6SlWt": [{"currencyCode": "zzrrc4HL", "currencyNamespace": "r3fyKEEv", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1979-03-13T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1980-07-26T00:00:00Z", "expireAt": "1974-11-26T00:00:00Z", "price": 85, "purchaseAt": "1986-02-14T00:00:00Z", "trialPrice": 82}, {"currencyCode": "FoWPDLBf", "currencyNamespace": "4vY7fG1P", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1972-06-26T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-08-16T00:00:00Z", "expireAt": "1991-09-17T00:00:00Z", "price": 60, "purchaseAt": "1991-01-19T00:00:00Z", "trialPrice": 65}, {"currencyCode": "3ccnZShK", "currencyNamespace": "X5w21oZn", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1980-03-30T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1988-11-05T00:00:00Z", "expireAt": "1977-06-05T00:00:00Z", "price": 53, "purchaseAt": "1979-02-15T00:00:00Z", "trialPrice": 14}]}, "saleConfig": {"currencyCode": "6QeZmeUL", "price": 42}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "Ds7ezatc", "stackable": true, "status": "INACTIVE", "tags": ["uxi8WhqT", "oqJ8Cx59", "rx4aw9am"], "targetCurrencyCode": "WC7pXb6d", "targetNamespace": "4fyuX53P", "thumbnailUrl": "8L3wqwBD", "useCount": 15}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2lZ91iO4' \
    --appId 'Rndkw9Zw' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'g7kKC8bO' \
    --baseAppId 'YXoHsKCf' \
    --categoryPath 'QF2tPOxD' \
    --features 'xNvMUt5W' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '71' \
    --offset '1' \
    --region 'KqpUX1FG' \
    --sortBy 'displayOrder,displayOrder:asc' \
    --storeId '2W4l90Up' \
    --tags 'H3OSCRRh' \
    --targetNamespace 'TulxDnrr' \
    > test.out 2>&1
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'M16kpvYi,MZHTGI26,Kr30CAmf' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'iM338ubU' \
    --itemIds 'hlyM3mdc' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EtsBLqkA' \
    --sku '5j5KFpux' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'uvol9tsM' \
    --populateBundle  \
    --region 'JGwbwWOC' \
    --storeId 'kp09DCvI' \
    --sku 'bnXoiPll' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'lpYfDNlR' \
    --region 'WnF3F5Z3' \
    --storeId 'OnLDlE77' \
    --itemIds 'FIYPafyO' \
    --userId 'h0F4wBZD' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QhAGQxJt' \
    --sku '3Z23YXV0' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'UQlibKiV,qCx2gpdU,9nNqK2UM' \
    --storeId '4MYVxRRR' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '054LyRp4' \
    --region 'D8kxBmFA' \
    --storeId 'n6PPhaEA' \
    --itemIds 'vHRogZwr' \
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
    --platform 'zw36kAXX' \
    --userId 's6kGiI5M' \
    --body '{"itemIds": ["X30AN305", "ZKz3ul5P", "dp3ccMhO"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gzJQo4oS' \
    --body '{"changes": [{"itemIdentities": ["r50Up7E6", "6BEx3WM9", "aOayScKT"], "itemIdentityType": "ITEM_SKU", "regionData": {"N1SFE6FZ": [{"currencyCode": "ZYd692vH", "currencyNamespace": "ttCG4OPN", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1988-09-26T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1998-12-23T00:00:00Z", "discountedPrice": 36, "expireAt": "1981-06-20T00:00:00Z", "price": 36, "purchaseAt": "1994-05-02T00:00:00Z", "trialPrice": 88}, {"currencyCode": "NwgJ8RDx", "currencyNamespace": "YZ1QPa3P", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1973-05-16T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1979-01-14T00:00:00Z", "discountedPrice": 5, "expireAt": "1981-01-11T00:00:00Z", "price": 26, "purchaseAt": "1972-07-05T00:00:00Z", "trialPrice": 15}, {"currencyCode": "bg0lCnAF", "currencyNamespace": "G2k3hh8O", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1999-08-25T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1978-10-04T00:00:00Z", "discountedPrice": 43, "expireAt": "1985-06-01T00:00:00Z", "price": 78, "purchaseAt": "1978-10-07T00:00:00Z", "trialPrice": 48}], "H7Eko6Lj": [{"currencyCode": "gXtJmoXq", "currencyNamespace": "a51vSjEl", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1986-10-25T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1985-03-23T00:00:00Z", "discountedPrice": 98, "expireAt": "1990-10-26T00:00:00Z", "price": 68, "purchaseAt": "1991-04-14T00:00:00Z", "trialPrice": 52}, {"currencyCode": "051LI9TO", "currencyNamespace": "iNDIK0h9", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1976-06-28T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1980-10-28T00:00:00Z", "discountedPrice": 71, "expireAt": "1988-11-26T00:00:00Z", "price": 91, "purchaseAt": "1977-12-15T00:00:00Z", "trialPrice": 47}, {"currencyCode": "eVR82Jwc", "currencyNamespace": "tLwK8vGa", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1982-03-30T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1988-09-10T00:00:00Z", "discountedPrice": 67, "expireAt": "1986-08-08T00:00:00Z", "price": 20, "purchaseAt": "1994-12-16T00:00:00Z", "trialPrice": 69}], "btFuA8mC": [{"currencyCode": "dxhrsySJ", "currencyNamespace": "q73p4bNA", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1996-03-09T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1971-11-19T00:00:00Z", "discountedPrice": 27, "expireAt": "1976-12-29T00:00:00Z", "price": 54, "purchaseAt": "1987-10-09T00:00:00Z", "trialPrice": 54}, {"currencyCode": "m3IgccYV", "currencyNamespace": "zhfCEmL7", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1998-06-18T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1991-06-09T00:00:00Z", "discountedPrice": 1, "expireAt": "1990-08-14T00:00:00Z", "price": 11, "purchaseAt": "1987-12-27T00:00:00Z", "trialPrice": 10}, {"currencyCode": "svvymODA", "currencyNamespace": "6teupsjJ", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1976-12-26T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1992-10-26T00:00:00Z", "discountedPrice": 3, "expireAt": "1987-09-08T00:00:00Z", "price": 32, "purchaseAt": "1997-09-01T00:00:00Z", "trialPrice": 39}]}}, {"itemIdentities": ["fEV6xiRR", "OtZbUXOb", "IDVIyc8v"], "itemIdentityType": "ITEM_ID", "regionData": {"lCaaFY2f": [{"currencyCode": "5qUDYmsN", "currencyNamespace": "7rNIOkob", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1974-09-11T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1996-11-28T00:00:00Z", "discountedPrice": 57, "expireAt": "1993-07-12T00:00:00Z", "price": 14, "purchaseAt": "1995-03-12T00:00:00Z", "trialPrice": 95}, {"currencyCode": "YOnvYwib", "currencyNamespace": "SARQihne", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1975-12-06T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1972-07-11T00:00:00Z", "discountedPrice": 91, "expireAt": "1976-06-15T00:00:00Z", "price": 37, "purchaseAt": "1982-02-14T00:00:00Z", "trialPrice": 83}, {"currencyCode": "PYPHoKXQ", "currencyNamespace": "CTrh7cLn", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1979-05-18T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1997-04-13T00:00:00Z", "discountedPrice": 8, "expireAt": "1997-03-08T00:00:00Z", "price": 57, "purchaseAt": "1989-06-24T00:00:00Z", "trialPrice": 98}], "obz1VIhY": [{"currencyCode": "aT7SnGVl", "currencyNamespace": "2eXe0ydo", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1985-02-19T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1995-03-06T00:00:00Z", "discountedPrice": 21, "expireAt": "1995-10-28T00:00:00Z", "price": 54, "purchaseAt": "1975-01-04T00:00:00Z", "trialPrice": 2}, {"currencyCode": "Shkh4gow", "currencyNamespace": "7XK3x6kr", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1994-06-07T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1994-03-10T00:00:00Z", "discountedPrice": 57, "expireAt": "1989-09-16T00:00:00Z", "price": 92, "purchaseAt": "1995-09-11T00:00:00Z", "trialPrice": 92}, {"currencyCode": "9dOlfogA", "currencyNamespace": "jHWK7K86", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1988-11-13T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1988-06-02T00:00:00Z", "discountedPrice": 55, "expireAt": "1988-12-28T00:00:00Z", "price": 53, "purchaseAt": "1984-03-26T00:00:00Z", "trialPrice": 47}], "6SUqrriV": [{"currencyCode": "4DwluoUC", "currencyNamespace": "yjK1F90k", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1986-05-26T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-07-29T00:00:00Z", "discountedPrice": 17, "expireAt": "1975-12-11T00:00:00Z", "price": 68, "purchaseAt": "1991-01-03T00:00:00Z", "trialPrice": 18}, {"currencyCode": "rCHbqc6q", "currencyNamespace": "wS3YuC7a", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1975-11-22T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1986-09-24T00:00:00Z", "discountedPrice": 35, "expireAt": "1984-01-18T00:00:00Z", "price": 32, "purchaseAt": "1993-08-05T00:00:00Z", "trialPrice": 74}, {"currencyCode": "TeGcCTXo", "currencyNamespace": "ky4JXx9s", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1994-04-26T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1985-12-28T00:00:00Z", "discountedPrice": 29, "expireAt": "1995-11-30T00:00:00Z", "price": 11, "purchaseAt": "1982-08-03T00:00:00Z", "trialPrice": 31}]}}, {"itemIdentities": ["fmLxb2Wp", "Y11ahHoX", "76STAatK"], "itemIdentityType": "ITEM_ID", "regionData": {"azoDVq45": [{"currencyCode": "LzVK85v1", "currencyNamespace": "DYNzcBW9", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1987-01-16T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1997-11-19T00:00:00Z", "discountedPrice": 71, "expireAt": "1991-11-25T00:00:00Z", "price": 19, "purchaseAt": "1996-03-15T00:00:00Z", "trialPrice": 98}, {"currencyCode": "hVgeZF1C", "currencyNamespace": "nCo4WNyM", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1982-11-16T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1977-06-08T00:00:00Z", "discountedPrice": 40, "expireAt": "1982-02-07T00:00:00Z", "price": 31, "purchaseAt": "1993-12-19T00:00:00Z", "trialPrice": 31}, {"currencyCode": "Ok2vs6TB", "currencyNamespace": "SFmW10Ej", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1990-04-07T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1971-06-23T00:00:00Z", "discountedPrice": 73, "expireAt": "1976-04-22T00:00:00Z", "price": 94, "purchaseAt": "1993-08-01T00:00:00Z", "trialPrice": 53}], "FYWpiXbK": [{"currencyCode": "xBGwSc9D", "currencyNamespace": "hVRioChy", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1981-09-27T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1996-04-28T00:00:00Z", "discountedPrice": 45, "expireAt": "1984-01-12T00:00:00Z", "price": 19, "purchaseAt": "1999-09-27T00:00:00Z", "trialPrice": 73}, {"currencyCode": "rQDiK90K", "currencyNamespace": "O6Kqkzbs", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1984-02-09T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1992-10-04T00:00:00Z", "discountedPrice": 31, "expireAt": "1975-11-18T00:00:00Z", "price": 29, "purchaseAt": "1981-02-26T00:00:00Z", "trialPrice": 41}, {"currencyCode": "07kZCRuX", "currencyNamespace": "CKCTFgQk", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1981-11-21T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1973-10-26T00:00:00Z", "discountedPrice": 81, "expireAt": "1993-02-05T00:00:00Z", "price": 4, "purchaseAt": "1979-11-22T00:00:00Z", "trialPrice": 29}], "e2IdPBFt": [{"currencyCode": "jhXS2h1m", "currencyNamespace": "piKlLUsN", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1982-05-08T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1996-12-03T00:00:00Z", "discountedPrice": 15, "expireAt": "1995-04-15T00:00:00Z", "price": 9, "purchaseAt": "1982-04-05T00:00:00Z", "trialPrice": 91}, {"currencyCode": "7Jpe8Fkg", "currencyNamespace": "MBgduxuA", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1982-06-21T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1977-12-01T00:00:00Z", "discountedPrice": 22, "expireAt": "1991-09-19T00:00:00Z", "price": 54, "purchaseAt": "1985-01-07T00:00:00Z", "trialPrice": 55}, {"currencyCode": "ZjVLE9nA", "currencyNamespace": "BUafs0jZ", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1998-08-27T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1997-01-21T00:00:00Z", "discountedPrice": 14, "expireAt": "1985-10-20T00:00:00Z", "price": 17, "purchaseAt": "1971-08-04T00:00:00Z", "trialPrice": 7}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SUBSCRIPTION' \
    --limit '18' \
    --offset '33' \
    --sortBy 'enKdFFqS' \
    --storeId 'znzSoiEM' \
    --keyword '9SzXHG4E' \
    --language 'YY3tQE3p' \
    > test.out 2>&1
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '62' \
    --offset '8' \
    --sortBy 'createdAt,updatedAt' \
    --storeId 'kTPZ78Zi' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'DMTZjIdr' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0eig16CN' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'WJTWb062' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RBrPTqDE' \
    --body '{"appId": "VIFB8MeH", "appType": "GAME", "baseAppId": "odxSZEz3", "boothName": "NnMnJrVg", "categoryPath": "X2RlW7ii", "clazz": "tbm2RBKa", "displayOrder": 19, "entitlementType": "DURABLE", "ext": {"52gTPT4h": {}, "PbGcSRNs": {}, "GjNPxsSk": {}}, "features": ["HFlSxzfn", "oPKN0p6Z", "KzCruCYx"], "flexible": false, "images": [{"as": "bhjxZDEH", "caption": "5oosp68e", "height": 7, "imageUrl": "foDJJPbZ", "smallImageUrl": "Lbil6lKW", "width": 94}, {"as": "AIdiNX9U", "caption": "9aDb2xnN", "height": 49, "imageUrl": "ZmhECRXI", "smallImageUrl": "tcDMBf2w", "width": 29}, {"as": "80KVAMZY", "caption": "NphthTHi", "height": 11, "imageUrl": "yyrhOkuI", "smallImageUrl": "4kxiozJ6", "width": 71}], "inventoryConfig": {"customAttributes": {"Y0KFondS": {}, "sxRf2kAo": {}, "PM6p7pIM": {}}, "serverCustomAttributes": {"DIzOI9WD": {}, "RiLDpPe5": {}, "0hnryjSj": {}}, "slotUsed": 52}, "itemIds": ["xSFCKUFu", "D3nIjLmX", "yjarbG3Q"], "itemQty": {"0NAExQYG": 86, "X2Q4Kx29": 66, "fGYEuc5D": 16}, "itemType": "LOOTBOX", "listable": false, "localizations": {"mK69mpbO": {"description": "rbWfnQhf", "localExt": {"Zouz4S0F": {}, "RcwOGqE8": {}, "snS4nMtj": {}}, "longDescription": "BcGEcME1", "title": "QvOrTswd"}, "bcNJeg1N": {"description": "x9cNXu5i", "localExt": {"YFgjkxzy": {}, "QhomcxVs": {}, "WHSmaQPm": {}}, "longDescription": "sspFRPXA", "title": "ZPiHQ9pD"}, "YMiiR896": {"description": "yNAlev7Q", "localExt": {"xQYVKrAb": {}, "Cb3KNxHJ": {}, "q672bYni": {}}, "longDescription": "7eYTTkdB", "title": "VKQtO09W"}}, "lootBoxConfig": {"rewardCount": 99, "rewards": [{"lootBoxItems": [{"count": 0, "duration": 18, "endDate": "1997-07-21T00:00:00Z", "itemId": "W815xPVU", "itemSku": "xl0OqiHI", "itemType": "3fXOTU2F"}, {"count": 38, "duration": 1, "endDate": "1974-05-27T00:00:00Z", "itemId": "BJMC5XOc", "itemSku": "di7ltnyX", "itemType": "RgbmXgdw"}, {"count": 77, "duration": 21, "endDate": "1989-07-04T00:00:00Z", "itemId": "iAge6Z4W", "itemSku": "EwHdRizg", "itemType": "SmqfPkoL"}], "name": "PtVQlgsf", "odds": 0.9011262288130008, "type": "REWARD_GROUP", "weight": 1}, {"lootBoxItems": [{"count": 0, "duration": 74, "endDate": "1986-12-19T00:00:00Z", "itemId": "shzRBhai", "itemSku": "XwxbVXes", "itemType": "FbyqVH4w"}, {"count": 93, "duration": 99, "endDate": "1977-01-30T00:00:00Z", "itemId": "hEUmwO2u", "itemSku": "slQC5Jhy", "itemType": "UzBKWSK3"}, {"count": 16, "duration": 72, "endDate": "1986-02-19T00:00:00Z", "itemId": "3LGT9XoO", "itemSku": "uL0ZfIGY", "itemType": "tMroUSAF"}], "name": "fD1B9g2r", "odds": 0.6697032046593043, "type": "REWARD", "weight": 60}, {"lootBoxItems": [{"count": 74, "duration": 65, "endDate": "1984-09-04T00:00:00Z", "itemId": "nWs7PbJJ", "itemSku": "4QugXhNr", "itemType": "NTEzatBs"}, {"count": 44, "duration": 64, "endDate": "1978-10-30T00:00:00Z", "itemId": "o6Lb6lzH", "itemSku": "xhyQd23o", "itemType": "tcTFV7ru"}, {"count": 87, "duration": 27, "endDate": "1979-05-17T00:00:00Z", "itemId": "Ju4fInAF", "itemSku": "NeevRrRZ", "itemType": "t5WCiHAb"}], "name": "YsucGa8I", "odds": 0.5210901866116868, "type": "REWARD", "weight": 79}], "rollFunction": "DEFAULT"}, "maxCount": 92, "maxCountPerUser": 97, "name": "UUBTq22a", "optionBoxConfig": {"boxItems": [{"count": 59, "duration": 36, "endDate": "1977-02-26T00:00:00Z", "itemId": "Ad04saqu", "itemSku": "bH70YIhw", "itemType": "upuEe93E"}, {"count": 90, "duration": 49, "endDate": "1983-03-14T00:00:00Z", "itemId": "trIHOKqM", "itemSku": "MSEfTLmL", "itemType": "qxUbrRFk"}, {"count": 53, "duration": 8, "endDate": "1987-03-04T00:00:00Z", "itemId": "924wRtb9", "itemSku": "YnAlPhWc", "itemType": "ucDwDL8C"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 87, "fixedTrialCycles": 84, "graceDays": 70}, "regionData": {"8C01u1r4": [{"currencyCode": "j4tSlPKg", "currencyNamespace": "AMQxLFb3", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1984-12-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1988-01-18T00:00:00Z", "expireAt": "1977-01-14T00:00:00Z", "price": 58, "purchaseAt": "1995-04-24T00:00:00Z", "trialPrice": 13}, {"currencyCode": "WVtqM9hm", "currencyNamespace": "dkrevb4Z", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1971-08-17T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1989-04-09T00:00:00Z", "expireAt": "1986-08-13T00:00:00Z", "price": 17, "purchaseAt": "1973-06-28T00:00:00Z", "trialPrice": 17}, {"currencyCode": "bhVdQRaB", "currencyNamespace": "PbCldSW0", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1997-01-13T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1990-11-13T00:00:00Z", "expireAt": "1998-01-13T00:00:00Z", "price": 20, "purchaseAt": "1997-09-14T00:00:00Z", "trialPrice": 86}], "SvungNfl": [{"currencyCode": "QTJZbhkc", "currencyNamespace": "JcUn67PH", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1997-06-21T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1987-09-09T00:00:00Z", "expireAt": "1974-11-16T00:00:00Z", "price": 15, "purchaseAt": "1979-08-11T00:00:00Z", "trialPrice": 59}, {"currencyCode": "KLoCA2M1", "currencyNamespace": "9AeD6LmI", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1998-08-08T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1973-05-28T00:00:00Z", "expireAt": "1981-07-03T00:00:00Z", "price": 64, "purchaseAt": "1971-11-09T00:00:00Z", "trialPrice": 80}, {"currencyCode": "QKQwrTyH", "currencyNamespace": "nuGzHYxL", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1982-05-03T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1977-02-01T00:00:00Z", "expireAt": "1987-06-04T00:00:00Z", "price": 19, "purchaseAt": "1989-12-15T00:00:00Z", "trialPrice": 17}], "zVdlRJgi": [{"currencyCode": "WmuwYeMS", "currencyNamespace": "zSAPZ4v9", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1987-05-18T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1974-02-09T00:00:00Z", "expireAt": "1982-01-04T00:00:00Z", "price": 3, "purchaseAt": "1982-06-15T00:00:00Z", "trialPrice": 22}, {"currencyCode": "GYNRVFzE", "currencyNamespace": "EIZcP1At", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1982-02-14T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1975-05-12T00:00:00Z", "expireAt": "1998-09-08T00:00:00Z", "price": 32, "purchaseAt": "1996-05-30T00:00:00Z", "trialPrice": 30}, {"currencyCode": "kXXOCutP", "currencyNamespace": "YZ5dVAwg", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1977-09-19T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1990-06-01T00:00:00Z", "expireAt": "1984-02-22T00:00:00Z", "price": 55, "purchaseAt": "1972-05-18T00:00:00Z", "trialPrice": 31}]}, "saleConfig": {"currencyCode": "vZyUEML2", "price": 18}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "kvAQkbw2", "stackable": false, "status": "ACTIVE", "tags": ["MeywpDWE", "fFoMfUdV", "HlkFQfHy"], "targetCurrencyCode": "qh4mD9DH", "targetNamespace": "UtaFQFem", "thumbnailUrl": "lKLCQoEB", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'fLL5JXOe' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'w9GRlQSi' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'cu0RLbyN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 77, "orderNo": "v8J3qAaE"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'qSju9VSR' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mVrePXFu' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'WOXL2YL9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZTFjUKRC' \
    --body '{"carousel": [{"alt": "CYrHBAyb", "previewUrl": "PhkZV8Iy", "thumbnailUrl": "199CyhSy", "type": "image", "url": "JFpgd1kM", "videoSource": "youtube"}, {"alt": "lbyJbsa3", "previewUrl": "0DBXbMyl", "thumbnailUrl": "HZP1JMC2", "type": "video", "url": "cyrvo5vG", "videoSource": "youtube"}, {"alt": "LVI9YKH6", "previewUrl": "bziU15Dv", "thumbnailUrl": "2UBHEqqT", "type": "video", "url": "8KNEAtME", "videoSource": "youtube"}], "developer": "tQf9aUfn", "forumUrl": "sPVOa5fh", "genres": ["Casual", "Casual", "RPG"], "localizations": {"4U27H0Bl": {"announcement": "RPzoC5l3", "slogan": "pBNYiVe2"}, "Rb8sFPEC": {"announcement": "1Z4Hf78W", "slogan": "MJq0N1RA"}, "oeqKVyOJ": {"announcement": "jFOFpiCV", "slogan": "fwJUnN79"}}, "platformRequirements": {"0WegeGgj": [{"additionals": "SKwlgLwf", "directXVersion": "v1800pCc", "diskSpace": "wDSiZPDj", "graphics": "Kglv3quz", "label": "YKkJA3Mq", "osVersion": "XvH7t2xp", "processor": "JH1aFqLn", "ram": "TJXCu9XO", "soundCard": "ATfZ9YyR"}, {"additionals": "K3ZH37eD", "directXVersion": "2UpqE9kH", "diskSpace": "OVp9W10W", "graphics": "NRJDfN4E", "label": "kYCOanWF", "osVersion": "srCHpQOe", "processor": "3VTQc6RY", "ram": "Mz0lwl4i", "soundCard": "R1qkJJOd"}, {"additionals": "DgH91rFn", "directXVersion": "v55BsI1d", "diskSpace": "Yhgnuhem", "graphics": "dyaXc4Dn", "label": "gSYCB3rR", "osVersion": "mORYxj8t", "processor": "QUfDSowq", "ram": "sptxe8pv", "soundCard": "N5y1dkLQ"}], "H68mxunQ": [{"additionals": "gc51SAWh", "directXVersion": "epNuxC9D", "diskSpace": "FDw1cmnw", "graphics": "GnkUFQnw", "label": "HaFE1QS9", "osVersion": "WND7Tli9", "processor": "pkg8yEVr", "ram": "ieQ8LkY6", "soundCard": "gIa8P8tV"}, {"additionals": "eN2uixAu", "directXVersion": "uWQpCum1", "diskSpace": "9qMpUiMf", "graphics": "7gN09zAk", "label": "NvU3Pvsy", "osVersion": "1FQpqsBX", "processor": "EQU7Al3w", "ram": "eYFvMC3d", "soundCard": "j03ndWhg"}, {"additionals": "RrOfXuoW", "directXVersion": "xTbf4gKI", "diskSpace": "1Di67YCx", "graphics": "XiyfHgmS", "label": "wUAHSwo7", "osVersion": "R4J1x6ue", "processor": "RH7copAz", "ram": "sKwh8F7T", "soundCard": "BqamC4xL"}], "tVZjzqJ1": [{"additionals": "QtbLYefe", "directXVersion": "1U5b6Otk", "diskSpace": "BgYId6wA", "graphics": "2gfExlxs", "label": "dNtjLeq2", "osVersion": "wZkTUljo", "processor": "7Owx7DID", "ram": "UACypJtV", "soundCard": "VilIJtE6"}, {"additionals": "VyDzhOne", "directXVersion": "q9Uwlygk", "diskSpace": "EXTr2F8J", "graphics": "RHDGa5wQ", "label": "qfY4Qxv1", "osVersion": "Z72y2ZK2", "processor": "dOxuoQul", "ram": "JhxPMHa0", "soundCard": "oy8KOAsl"}, {"additionals": "9EBCEkC0", "directXVersion": "SOC2zPdj", "diskSpace": "7KZyi01X", "graphics": "BZ7hlyJy", "label": "ADnP95q3", "osVersion": "YzRqqwDA", "processor": "E3OTqWV4", "ram": "VeLtZ9oA", "soundCard": "MEa9eQIU"}]}, "platforms": ["MacOS", "Windows", "Linux"], "players": ["Multi", "Single", "Single"], "primaryGenre": "Action", "publisher": "YnSSmQdo", "releaseDate": "1972-06-16T00:00:00Z", "websiteUrl": "EtqTSA1n"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'VhaxIs7V' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JCRUAoJe' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'FsPX8qn3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'sJNs8XDY' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0DBL9kK5' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'TDod9XLA' \
    --itemId 'HsjMaE61' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XzM7LDzi' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'TUlOnwXJ' \
    --itemId 'XUEGvxuF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kj0llwiV' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'GxKv9cms' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Xl07JVMz' \
    --populateBundle  \
    --region 'tMb158Mt' \
    --storeId 'DFyUT46s' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'E2MrXpEk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R6LNyGjk' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 77, "comparison": "isGreaterThanOrEqual", "name": "AYKhC7cM", "predicateType": "EntitlementPredicate", "value": "ABB3gnRi", "values": ["yYLMPtCk", "GJ1dVgW3", "qZuuXD3l"]}, {"anyOf": 55, "comparison": "includes", "name": "UuYinRhq", "predicateType": "SeasonPassPredicate", "value": "BSuJoNiU", "values": ["B5mEbDfo", "WlZZWc75", "yTa6iHWa"]}, {"anyOf": 15, "comparison": "isLessThanOrEqual", "name": "eOGkEwRO", "predicateType": "EntitlementPredicate", "value": "dTXbeH9w", "values": ["8diV66QJ", "bq3Xh9kq", "4zr15Hke"]}]}, {"operator": "and", "predicates": [{"anyOf": 13, "comparison": "is", "name": "r2qUbJYF", "predicateType": "SeasonTierPredicate", "value": "EsypCEiq", "values": ["KSJ8JynB", "ZyIMAj0h", "6GwTImWr"]}, {"anyOf": 6, "comparison": "isLessThan", "name": "oiaZ9vva", "predicateType": "SeasonTierPredicate", "value": "IEO9Funn", "values": ["Zt7AdIej", "ZoofzUn4", "2Vi4oYSc"]}, {"anyOf": 36, "comparison": "isNot", "name": "T2I3cIZu", "predicateType": "SeasonPassPredicate", "value": "VgSmEzXv", "values": ["7ooeksrj", "WQ339pop", "F5fyuqs9"]}]}, {"operator": "and", "predicates": [{"anyOf": 20, "comparison": "isGreaterThanOrEqual", "name": "7XizsTXh", "predicateType": "EntitlementPredicate", "value": "DqILHcgE", "values": ["ctlt7BJk", "8a8fQ1wi", "LrObksuH"]}, {"anyOf": 34, "comparison": "excludes", "name": "vNABEwvL", "predicateType": "SeasonPassPredicate", "value": "RXgCIaYC", "values": ["xiWagInt", "XPUgueH1", "yhwoxJp2"]}, {"anyOf": 77, "comparison": "isGreaterThan", "name": "K7vOwNdP", "predicateType": "EntitlementPredicate", "value": "gFmzvJPl", "values": ["Tqzzcz0u", "MSimAXG6", "MCN0tdLX"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'pMZeWyfY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "6Oc7SP5f"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --name 'CMjHcqkp' \
    --offset '99' \
    --tag 'jLSPz9q6' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Xfp0vLMC", "name": "0ZUU2Jz4", "status": "ACTIVE", "tags": ["aUlcZw0u", "j8WY2GXe", "Qil6DbTE"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'j1jbw2Jm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'uqdd0VX6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "soIoypdK", "name": "M1vpQPZr", "status": "INACTIVE", "tags": ["av2YAGS2", "6GaBgO0y", "JHtt3cuU"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '3hLMhQwD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'NBUFmx7B' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '82' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'WC1t1BDq' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'vGBQEGFT' \
    --limit '55' \
    --offset '89' \
    --orderNos 'qk69U0Qo,TJ41Ly4S,ZtvP3OVc' \
    --sortBy '4PFRIUrA' \
    --startTime 'uCqnyD9I' \
    --status 'CHARGED' \
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
    --orderNo 'zFQTNYZP' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XFyytFfN' \
    --body '{"description": "lTuZPJ39"}' \
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
    --body '{"dryRun": false, "notifyUrl": "BPb0fsc2", "privateKey": "gzKLOUbE"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'PbZammTv' \
    --externalId 'qjMPwpE3' \
    --limit '72' \
    --notificationSource 'ADYEN' \
    --notificationType 'fUfNU6v8' \
    --offset '95' \
    --paymentOrderNo 'R458BiUy' \
    --startDate 'IT9pSo0n' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '1EqZeAsc' \
    --limit '88' \
    --offset '44' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "8Fjguo48", "currencyNamespace": "dLclEfww", "customParameters": {"6dLcXJiq": {}, "DzqFYHSq": {}, "GMPKxgRl": {}}, "description": "oDEu6p9l", "extOrderNo": "blWtbhyA", "extUserId": "4fbGWYF2", "itemType": "CODE", "language": "yN", "metadata": {"2vkA7Ne9": "QDolrDfs", "S4Mt74bo": "8m2HpxYW", "uurU90RZ": "iIQyITTs"}, "notifyUrl": "sUrVGrG5", "omitNotification": true, "platform": "vRrbjGa1", "price": 0, "recurringPaymentOrderNo": "ycXy01jB", "region": "f9IMYuAU", "returnUrl": "b9H13s7x", "sandbox": true, "sku": "QKOIe7Ul", "subscriptionId": "2pskEyPS", "targetNamespace": "BEeS0pWo", "targetUserId": "Rcw0mskO", "title": "g4N9102q"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '0eQ77ELh' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6aRY7O78' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XXWO7ls7' \
    --body '{"extTxId": "ajYVjCjc", "paymentMethod": "1rHyrJbO", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RxzBeBpN' \
    --body '{"description": "YIaCQzn3"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IhPSG15I' \
    --body '{"amount": 42, "currencyCode": "VrydMyVm", "notifyType": "REFUND", "paymentProvider": "STRIPE", "salesTax": 7, "vat": 43}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xHxdnFc3' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "System", "Playstation"]}' \
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
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["Xbox", "IOS", "Twitch"]}' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
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
    --endTime 'OUO7myEJ' \
    --limit '5' \
    --offset '39' \
    --source 'DLC' \
    --startTime 'ERJ3zApx' \
    --status 'SUCCESS' \
    --transactionId 'Zj7WHBJq' \
    --userId 'XHX8jA2H' \
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
    --body '{"appConfig": {"appName": "RabpltEU"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "BpPJa0lU"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "7n5lkCbd", "eventTopic": "88UY3kBo", "maxAwarded": 70, "maxAwardedPerUser": 65, "namespaceExpression": "DYH1Sj8h", "rewardCode": "zwNHCQ19", "rewardConditions": [{"condition": "8jI8OzPN", "conditionName": "VwhI3JBa", "eventName": "vpMSyLxb", "rewardItems": [{"duration": 25, "endDate": "1986-10-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "xzJIK3fh", "quantity": 69, "sku": "2Mbnk7ps"}, {"duration": 16, "endDate": "1988-04-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "VRgZ0PWf", "quantity": 44, "sku": "PlMw0WZh"}, {"duration": 12, "endDate": "1983-02-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KbPwW5Oj", "quantity": 52, "sku": "tnoa8NNy"}]}, {"condition": "2SCIB3jI", "conditionName": "q8seQIul", "eventName": "25BPPXiL", "rewardItems": [{"duration": 27, "endDate": "1994-02-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Qbfv6Yvu", "quantity": 71, "sku": "dUus8kjs"}, {"duration": 45, "endDate": "1993-04-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "qWP5wXME", "quantity": 28, "sku": "cYaMNVwD"}, {"duration": 51, "endDate": "1990-01-31T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NqjszsHW", "quantity": 47, "sku": "ISglR0B4"}]}, {"condition": "N128Qecx", "conditionName": "gXVxZLBO", "eventName": "ToJvFf2F", "rewardItems": [{"duration": 82, "endDate": "1992-07-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0YQqr5sD", "quantity": 94, "sku": "jX6aa6fz"}, {"duration": 89, "endDate": "1988-04-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "3nE7yqlf", "quantity": 59, "sku": "0VQMhGk9"}, {"duration": 95, "endDate": "1995-08-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "rNRCLGve", "quantity": 26, "sku": "eQMzJR7k"}]}], "userIdExpression": "Awa9uWVU"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'IlKq55OH' \
    --limit '35' \
    --offset '97' \
    --sortBy 'rewardCode' \
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
    --rewardId 'wHqJZpdc' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'npmnOkKm' \
    --body '{"description": "lWI32IOp", "eventTopic": "VqjQ11Td", "maxAwarded": 89, "maxAwardedPerUser": 2, "namespaceExpression": "AwjBa5fh", "rewardCode": "mBwEMIDN", "rewardConditions": [{"condition": "A6UrLyBf", "conditionName": "5K7oOO0K", "eventName": "GJ9H6JFU", "rewardItems": [{"duration": 89, "endDate": "1997-02-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jyVN5H6d", "quantity": 12, "sku": "uuNkLqMc"}, {"duration": 89, "endDate": "1983-09-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "600DQC7H", "quantity": 83, "sku": "UYK0yzwU"}, {"duration": 11, "endDate": "1994-09-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "4IHkHxUW", "quantity": 36, "sku": "uLdn4OiC"}]}, {"condition": "AfuWFZc2", "conditionName": "B4QB64p6", "eventName": "Jaqgj3d6", "rewardItems": [{"duration": 3, "endDate": "1983-01-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "i7S316ok", "quantity": 62, "sku": "6XurTO16"}, {"duration": 11, "endDate": "1984-07-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "3oU2fWIs", "quantity": 3, "sku": "ys7pY8h9"}, {"duration": 69, "endDate": "1977-09-18T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Q56vFtIn", "quantity": 58, "sku": "aizHPkbw"}]}, {"condition": "fYEvtY46", "conditionName": "BPxLWIQE", "eventName": "dw5aKkTJ", "rewardItems": [{"duration": 98, "endDate": "1992-11-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iHLk7Hyx", "quantity": 32, "sku": "xnxpl3rD"}, {"duration": 3, "endDate": "1991-01-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0unq96L7", "quantity": 9, "sku": "lFx6imk9"}, {"duration": 42, "endDate": "1983-11-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "PevHgNHq", "quantity": 92, "sku": "jBNBbmmq"}]}], "userIdExpression": "bZFLmQzm"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'n71cG1HR' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yyCj4P24' \
    --body '{"payload": {"vLS4rE2O": {}, "Unlhyafd": {}, "Oz8LhYsM": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5VWuMaLb' \
    --body '{"conditionName": "meRSBZc6", "userId": "pWlU1elC"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'Qz9Ltabs' \
    --limit '18' \
    --offset '40' \
    --start 'mqCeBiMz' \
    --storeId 'Qp8Xo0LF' \
    --viewId 'jRPSRU4a' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PWgtrysR' \
    --body '{"active": true, "displayOrder": 17, "endDate": "1996-09-05T00:00:00Z", "ext": {"lkFclgvZ": {}, "zewB03z9": {}, "3ImgNxNt": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 60, "itemCount": 48, "rule": "SEQUENCE"}, "items": [{"id": "VlbLvU8K", "sku": "YNCDgfjh"}, {"id": "8BC9Mrzt", "sku": "EbrcJkIU"}, {"id": "LihC2pbl", "sku": "NWWsJ8Xo"}], "localizations": {"xlgzkn7S": {"description": "jIgReMBp", "localExt": {"rb2eMIQp": {}, "5fFndlOY": {}, "WYfPNaqn": {}}, "longDescription": "EYerGdCm", "title": "tzQcWVls"}, "urHpYf9d": {"description": "gHY9bBl9", "localExt": {"hJ6tTQ6e": {}, "VzqvUglw": {}, "MKu8l1PU": {}}, "longDescription": "kYx7D4z2", "title": "sZ8m0iKw"}, "5irKGqRa": {"description": "GyN538pn", "localExt": {"biJhZRD0": {}, "vfSClzQw": {}, "Jv7lWNdD": {}}, "longDescription": "Opw4yWax", "title": "yJCAnywM"}}, "name": "EyJPodBR", "rotationType": "CUSTOM", "startDate": "1974-10-03T00:00:00Z", "viewId": "0EuitAI4"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TIdGM4fK' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'RCGymwv6' \
    --storeId 'HVmofET2' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'bpYkJdOQ' \
    --storeId 'N0vBwCBs' \
    --body '{"active": true, "displayOrder": 83, "endDate": "1987-12-29T00:00:00Z", "ext": {"y6FWoCMV": {}, "T8mwG4ff": {}, "7QaJPkvV": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 32, "itemCount": 3, "rule": "SEQUENCE"}, "items": [{"id": "3IH1agli", "sku": "DZfnk7ZR"}, {"id": "F0WKKgcR", "sku": "o9E8Pb0n"}, {"id": "UnDTsmtS", "sku": "HURkneGE"}], "localizations": {"lmnIriWD": {"description": "tEGbs2BZ", "localExt": {"oHiT92u7": {}, "sPFxB5he": {}, "BmiIqE68": {}}, "longDescription": "7WkokkR6", "title": "EqRHWayF"}, "egdQeWir": {"description": "ZkFrrxGQ", "localExt": {"2LRaAVj0": {}, "LEMLLG2H": {}, "WepA450w": {}}, "longDescription": "2wDI80NK", "title": "Tp6wkFG3"}, "VjDt03SE": {"description": "OfBK6xPK", "localExt": {"UqZMOlez": {}, "q224NECT": {}, "KvFakxIo": {}}, "longDescription": "WRwrAKVM", "title": "49f9TV4E"}}, "name": "ytthuN02", "rotationType": "CUSTOM", "startDate": "1983-01-10T00:00:00Z", "viewId": "2rhnw9HP"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'gALLRWpp' \
    --storeId 'dyhhdqcM' \
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
    --body '{"defaultLanguage": "eb02P0Kt", "defaultRegion": "OTkioKHz", "description": "46uwt7vZ", "supportedLanguages": ["xOavwk2D", "ChDfWB8O", "0E9SCd9H"], "supportedRegions": ["Ab3d0Q2m", "pH5MXeHL", "0R9F2qLc"], "title": "wHEtk629"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'SECTION' \
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
    --body '{"catalogType": "APP", "fieldsToBeIncluded": ["JxkxjV9U", "jvA3BW5m", "qjvGrWfw"], "idsToBeExported": ["1egprtRu", "WJZZs4Ec", "nGdp2p7A"], "storeId": "JMQvCEKv"}' \
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
    --storeId 'U5BrjDou' \
    > test.out 2>&1
eval_tap $? 194 'GetStore' test.out

#- 195 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lBYrPyFR' \
    --body '{"defaultLanguage": "bPKcmR3N", "defaultRegion": "24orfwVW", "description": "inKTDqNw", "supportedLanguages": ["tu4zi2hT", "OVoFXmvA", "iqb4Fuyn"], "supportedRegions": ["Pow7m3e6", "74Vw1SX7", "B995WFSW"], "title": "Xg3l487A"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateStore' test.out

#- 196 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 's32fFwgi' \
    > test.out 2>&1
eval_tap $? 196 'DeleteStore' test.out

#- 197 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BJelV57O' \
    --action 'DELETE' \
    --itemSku '8rmuE4xL' \
    --itemType 'MEDIA' \
    --limit '58' \
    --offset '28' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd '7HceDY9t' \
    --updatedAtStart 'PDiufrSv' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 197 'QueryChanges' test.out

#- 198 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EtNilr5i' \
    > test.out 2>&1
eval_tap $? 198 'PublishAll' test.out

#- 199 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId '2GhRws9a' \
    > test.out 2>&1
eval_tap $? 199 'PublishSelected' test.out

#- 200 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '9hl96Vsu' \
    > test.out 2>&1
eval_tap $? 200 'SelectAllRecords' test.out

#- 201 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '3amNfD82' \
    --action 'CREATE' \
    --itemSku '9LgYynQK' \
    --itemType 'SUBSCRIPTION' \
    --selected  \
    --type 'STORE' \
    --updatedAtEnd 'RpmRhKiq' \
    --updatedAtStart '7cE3EfGY' \
    > test.out 2>&1
eval_tap $? 201 'SelectAllRecordsByCriteria' test.out

#- 202 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DO6aWH1g' \
    --action 'UPDATE' \
    --itemSku 'k6bB3CL1' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd 'k0YtHsPz' \
    --updatedAtStart 'COSecCuQ' \
    > test.out 2>&1
eval_tap $? 202 'GetStatistic' test.out

#- 203 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GzEp7Fhk' \
    > test.out 2>&1
eval_tap $? 203 'UnselectAllRecords' test.out

#- 204 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'W0UdbSP7' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5qKmEdAE' \
    > test.out 2>&1
eval_tap $? 204 'SelectRecord' test.out

#- 205 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'UhhboQwp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M3s7rCsl' \
    > test.out 2>&1
eval_tap $? 205 'UnselectRecord' test.out

#- 206 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RCnLjyFh' \
    --targetStoreId 'Ad2osL04' \
    > test.out 2>&1
eval_tap $? 206 'CloneStore' test.out

#- 207 ExportStore
eval_tap 0 207 'ExportStore # SKIP deprecated' test.out

#- 208 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aS8chrzE' \
    --end '6MaJvn3L' \
    --limit '83' \
    --offset '37' \
    --sortBy 'YiHak1GM' \
    --start 'JDJ7gr9b' \
    --success  \
    > test.out 2>&1
eval_tap $? 208 'QueryImportHistory' test.out

#- 209 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sSQh0esb' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'vi7nTWNt' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 209 'ImportStoreByCSV' test.out

#- 210 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '2QDMqMsv' \
    --limit '23' \
    --offset '66' \
    --sku 'aOfSlp0B' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId '43jcw4ac' \
    > test.out 2>&1
eval_tap $? 210 'QuerySubscriptions' test.out

#- 211 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6RUo7TTT' \
    > test.out 2>&1
eval_tap $? 211 'RecurringChargeSubscription' test.out

#- 212 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '36Cuh1dx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'GetTicketDynamic' test.out

#- 213 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Un5wqAc7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "tNdI86VZ"}' \
    > test.out 2>&1
eval_tap $? 213 'DecreaseTicketSale' test.out

#- 214 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'wm06ro76' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketBoothID' test.out

#- 215 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '9ynxOBP7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 26, "orderNo": "SBrqXYnJ"}' \
    > test.out 2>&1
eval_tap $? 215 'IncreaseTicketSale' test.out

#- 216 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 75, "currencyCode": "KypJOfL0", "expireAt": "1974-12-11T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "W8HLbzLt", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 60, "entitlementCollectionId": "7Ar6cVk1", "entitlementOrigin": "Twitch", "itemIdentity": "HoqcBWfG", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 84, "entitlementId": "to9wdx4Q"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 94, "currencyCode": "9mHVDeC3", "expireAt": "1986-08-01T00:00:00Z"}, "debitPayload": {"count": 29, "currencyCode": "4LOOqL5A", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 67, "entitlementCollectionId": "HYSlyj7n", "entitlementOrigin": "Nintendo", "itemIdentity": "MAuVRvqC", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 79, "entitlementId": "7DW79xU2"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 20, "currencyCode": "Y0XgldMb", "expireAt": "1974-09-24T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "qX8bYqDz", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 27, "entitlementCollectionId": "tk7dS1xu", "entitlementOrigin": "Epic", "itemIdentity": "zfO5GllN", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 58, "entitlementId": "mk4Jh8Hm"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "g8ECQ2ko"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 33, "currencyCode": "EMm05A8D", "expireAt": "1974-02-03T00:00:00Z"}, "debitPayload": {"count": 79, "currencyCode": "0d6xSX2z", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 61, "entitlementCollectionId": "SR16q975", "entitlementOrigin": "GooglePlay", "itemIdentity": "BrOxo0FT", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "lz4c3JZU"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 96, "currencyCode": "OiVmSvcS", "expireAt": "1976-03-26T00:00:00Z"}, "debitPayload": {"count": 32, "currencyCode": "kvpHToMX", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "4dISvR8x", "entitlementOrigin": "IOS", "itemIdentity": "JrTfHB0a", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 35, "entitlementId": "evigNzZg"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 45, "currencyCode": "N1hBFGzx", "expireAt": "1973-01-30T00:00:00Z"}, "debitPayload": {"count": 79, "currencyCode": "qNvpoq3T", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 48, "entitlementCollectionId": "2YrAOUpf", "entitlementOrigin": "Other", "itemIdentity": "aZlJKGQn", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 21, "entitlementId": "YEAwAvjd"}, "type": "DEBIT_WALLET"}], "userId": "5q9kBZcI"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 35, "currencyCode": "3oIX5eVS", "expireAt": "1972-06-13T00:00:00Z"}, "debitPayload": {"count": 17, "currencyCode": "IqM7Co0B", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 16, "entitlementCollectionId": "N9IGfFbl", "entitlementOrigin": "Steam", "itemIdentity": "A1ddxPlm", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 26, "entitlementId": "OCC4ytYB"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 37, "currencyCode": "vExI8aVF", "expireAt": "1995-11-14T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "cVltDmqs", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 33, "entitlementCollectionId": "cCWrRQdT", "entitlementOrigin": "Playstation", "itemIdentity": "5iPk0Wpk", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 82, "entitlementId": "4g1W6XJb"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 66, "currencyCode": "s3gsJ0oK", "expireAt": "1992-07-06T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "dqRcfXa3", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 31, "entitlementCollectionId": "P8G6GkjG", "entitlementOrigin": "IOS", "itemIdentity": "y8RwmnVf", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "HmuPejyI"}, "type": "DEBIT_WALLET"}], "userId": "50ZphAN5"}], "metadata": {"WiHEF219": {}, "1NuRNo9t": {}, "49SW7Wbv": {}}, "needPreCheck": false, "transactionId": "TAXVQrCR", "type": "e9sYr21g"}' \
    > test.out 2>&1
eval_tap $? 216 'Commit' test.out

#- 217 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '6' \
    --status 'FAILED' \
    --type 'KkjbKXzy' \
    --userId 'inx65sWd' \
    > test.out 2>&1
eval_tap $? 217 'GetTradeHistoryByCriteria' test.out

#- 218 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'aD9wV5dJ' \
    > test.out 2>&1
eval_tap $? 218 'GetTradeHistoryByTransactionId' test.out

#- 219 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ0GHJbe' \
    --body '{"achievements": [{"id": "J7MKV6Aj", "value": 85}, {"id": "ltn8VGkk", "value": 56}, {"id": "M8lkLRrU", "value": 73}], "steamUserId": "gEcJngbs"}' \
    > test.out 2>&1
eval_tap $? 219 'UnlockSteamUserAchievement' test.out

#- 220 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmxPLx4J' \
    --xboxUserId 'BpauVCuj' \
    > test.out 2>&1
eval_tap $? 220 'GetXblUserAchievements' test.out

#- 221 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8wx9Xni' \
    --body '{"achievements": [{"id": "25hp9HDG", "percentComplete": 72}, {"id": "IEx1mT0D", "percentComplete": 43}, {"id": "IyqXF1RP", "percentComplete": 16}], "serviceConfigId": "OmRItUvk", "titleId": "GfnaasEq", "xboxUserId": "ShDdbrpT"}' \
    > test.out 2>&1
eval_tap $? 221 'UpdateXblUserAchievement' test.out

#- 222 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUYiV4K9' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizeCampaign' test.out

#- 223 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vvd3Zu2K' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeEntitlement' test.out

#- 224 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'u0QdEnbA' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeFulfillment' test.out

#- 225 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'fOC6I774' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeIntegration' test.out

#- 226 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'G9QV3CVF' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeOrder' test.out

#- 227 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '9D3M2TvU' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizePayment' test.out

#- 228 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'wZICKfxo' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeRevocation' test.out

#- 229 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'rErDo0dU' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeSubscription' test.out

#- 230 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5Iz1LU3' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeWallet' test.out

#- 231 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'qRkXUc8T' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 231 'GetUserDLCByPlatform' test.out

#- 232 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChMK0Sk9' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 232 'GetUserDLC' test.out

#- 233 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zR1x1vvj' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId '8rZaiSjz' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'kuUyPtgh' \
    --features 'ibrQiN46,3CXZssfT,4JefqXlr' \
    --fuzzyMatchName  \
    --itemId 'YpwVoxQ2,pVAODqMo,V8ldoaVS' \
    --limit '37' \
    --offset '12' \
    --origin 'System' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserEntitlements' test.out

#- 234 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NbE6n27v' \
    --body '[{"collectionId": "n0j7FIH3", "endDate": "1979-10-23T00:00:00Z", "grantedCode": "usa7Ogjw", "itemId": "eIB4whoE", "itemNamespace": "myclG98W", "language": "fHPH", "origin": "Steam", "quantity": 51, "region": "PLZetrik", "source": "IAP", "startDate": "1984-10-20T00:00:00Z", "storeId": "NcJIgOn7"}, {"collectionId": "nt76YCYl", "endDate": "1971-10-26T00:00:00Z", "grantedCode": "qyvSi53d", "itemId": "5m14sHz4", "itemNamespace": "JujFhZTt", "language": "fQIx-GfdF_523", "origin": "Oculus", "quantity": 69, "region": "OqZPV9LE", "source": "REFERRAL_BONUS", "startDate": "1980-10-28T00:00:00Z", "storeId": "EHhs4L7B"}, {"collectionId": "0ESCU063", "endDate": "1992-05-01T00:00:00Z", "grantedCode": "g1EjQeAE", "itemId": "e0z9cCtv", "itemNamespace": "TLvjpBCI", "language": "vcy", "origin": "Playstation", "quantity": 38, "region": "B3ArcnLl", "source": "REFERRAL_BONUS", "startDate": "1981-08-27T00:00:00Z", "storeId": "MU7vjwkg"}]' \
    > test.out 2>&1
eval_tap $? 234 'GrantUserEntitlement' test.out

#- 235 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kP7becXd' \
    --activeOnly  \
    --appId 'dgHncGz9' \
    > test.out 2>&1
eval_tap $? 235 'GetUserAppEntitlementByAppId' test.out

#- 236 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'lYTCw3sx' \
    --activeOnly  \
    --limit '100' \
    --offset '89' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserEntitlementsByAppType' test.out

#- 237 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'feE3vXZJ' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'qF4vqVhK' \
    --itemId 'WVa9BFMd' \
    > test.out 2>&1
eval_tap $? 237 'GetUserEntitlementByItemId' test.out

#- 238 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyKJEmsA' \
    --ids 'uubFwFjm,urwgNsh4,bN4pqrFu' \
    --platform 'eFGoYgWM' \
    > test.out 2>&1
eval_tap $? 238 'GetUserActiveEntitlementsByItemIds' test.out

#- 239 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'w1nkYWPX' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'Nis6Tcfo' \
    --sku '0PrZRgEt' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementBySku' test.out

#- 240 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'wsR8xPZA' \
    --appIds 'ZlPTxtx5,GbSNZmv4,YYlvvWjm' \
    --itemIds 'kEsznmZB,E2zeDDBf,XObosWx7' \
    --platform 'lvpc8tLH' \
    --skus 'KdRvYQky,r48ITEcT,18xdMrA6' \
    > test.out 2>&1
eval_tap $? 240 'ExistsAnyUserActiveEntitlement' test.out

#- 241 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '76WE6yGq' \
    --platform 'mxyXYNZS' \
    --itemIds 'LA0UKsTS,Ewp7TPLh,1Qc2bNxa' \
    > test.out 2>&1
eval_tap $? 241 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 242 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LgxB4ZEG' \
    --appId 'ogTmnwkb' \
    > test.out 2>&1
eval_tap $? 242 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 243 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ftBQ9ShD' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'qS8SVCvI' \
    --itemId 'BDj46y0q' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementOwnershipByItemId' test.out

#- 244 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TPIK7nhC' \
    --ids 'UmcdjS2c,DKyFHgL9,dwlu8h54' \
    --platform 'MFlp4j0L' \
    > test.out 2>&1
eval_tap $? 244 'GetUserEntitlementOwnershipByItemIds' test.out

#- 245 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'FLi7969M' \
    --entitlementClazz 'APP' \
    --platform 'OeffLwzq' \
    --sku 'BBbLc5MU' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipBySku' test.out

#- 246 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5i3qECE' \
    > test.out 2>&1
eval_tap $? 246 'RevokeAllEntitlements' test.out

#- 247 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpZ5qUza' \
    --entitlementIds 'nIF0lv3b' \
    > test.out 2>&1
eval_tap $? 247 'RevokeUserEntitlements' test.out

#- 248 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'SSIHzKkY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H8PHKvcg' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlement' test.out

#- 249 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'rdUVf1lH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l2Frg33O' \
    --body '{"collectionId": "SuzLpQBY", "endDate": "1984-09-25T00:00:00Z", "nullFieldList": ["wpcAq8Z3", "IHQF68r0", "y2feShlA"], "origin": "Nintendo", "reason": "39H0lwuM", "startDate": "1995-05-06T00:00:00Z", "status": "CONSUMED", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateUserEntitlement' test.out

#- 250 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'qAcbNSpm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eZLHTgTy' \
    --body '{"options": ["6nVs0u02", "WNgJPS6I", "spkWXE8L"], "platform": "RRceKgsL", "requestId": "j2AIsFbx", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 250 'ConsumeUserEntitlement' test.out

#- 251 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'F5nbaQnc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V2yomKXZ' \
    > test.out 2>&1
eval_tap $? 251 'DisableUserEntitlement' test.out

#- 252 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'bQ4zGG6l' \
    --namespace "$AB_NAMESPACE" \
    --userId '8q9y8pgU' \
    > test.out 2>&1
eval_tap $? 252 'EnableUserEntitlement' test.out

#- 253 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'yXfXHIqu' \
    --namespace "$AB_NAMESPACE" \
    --userId '14GSHkxo' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementHistories' test.out

#- 254 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '40AWHz3p' \
    --namespace "$AB_NAMESPACE" \
    --userId '4AbuQpdr' \
    > test.out 2>&1
eval_tap $? 254 'RevokeUserEntitlement' test.out

#- 255 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '1PP628TB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgD15GNb' \
    --body '{"reason": "LN9AVqcy", "useCount": 30}' \
    > test.out 2>&1
eval_tap $? 255 'RevokeUserEntitlementByUseCount' test.out

#- 256 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'eX86UBDj' \
    --namespace "$AB_NAMESPACE" \
    --userId '1CBApguG' \
    --quantity '22' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 257 RevokeUseCount
eval_tap 0 257 'RevokeUseCount # SKIP deprecated' test.out

#- 258 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '66sME2XM' \
    --namespace "$AB_NAMESPACE" \
    --userId '0oPNXhxS' \
    --body '{"platform": "vRb2yrup", "requestId": "bGh3ieYF", "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 258 'SellUserEntitlement' test.out

#- 259 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kc9LpUxh' \
    --body '{"duration": 87, "endDate": "1974-10-09T00:00:00Z", "entitlementCollectionId": "cBSsidjX", "entitlementOrigin": "Xbox", "itemId": "SsHXjS69", "itemSku": "uqYx6oBc", "language": "l1suxvRS", "metadata": {"zkgqXfcC": {}, "vFgLX1yU": {}, "eQA1hsrH": {}}, "order": {"currency": {"currencyCode": "ZfFrCM24", "currencySymbol": "Fu3vS0tf", "currencyType": "VIRTUAL", "decimals": 50, "namespace": "dDL5CbjR"}, "ext": {"2ebvDSx2": {}, "383MkHD6": {}, "cPhOhEyx": {}}, "free": true}, "orderNo": "YRS0bs8i", "origin": "Playstation", "overrideBundleItemQty": {"aLe9TfrG": 5, "sgxCMpEa": 70, "QSE9WKnA": 88}, "quantity": 87, "region": "lj8qOPqO", "source": "REWARD", "startDate": "1998-04-23T00:00:00Z", "storeId": "xySYjAfw"}' \
    > test.out 2>&1
eval_tap $? 259 'FulfillItem' test.out

#- 260 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'I5cnedvR' \
    --body '{"code": "uJW1VNvu", "language": "Xxl_XqzI", "region": "zmc59cSb"}' \
    > test.out 2>&1
eval_tap $? 260 'RedeemCode' test.out

#- 261 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hX3YFW8l' \
    --body '{"itemId": "2v55I3eH", "itemSku": "QsaSPShm", "quantity": 67}' \
    > test.out 2>&1
eval_tap $? 261 'PreCheckFulfillItem' test.out

#- 262 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '346zOvMG' \
    --body '{"entitlementCollectionId": "zdW4mM3j", "entitlementOrigin": "Oculus", "metadata": {"JraX9QW0": {}, "f5hGAdon": {}, "mfNRL4Jb": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "G7M6yntn", "namespace": "xOoAoMno"}, "item": {"itemId": "d6O3r7xK", "itemSku": "R59I3yNl", "itemType": "sFAK8Ejb"}, "quantity": 57, "type": "ITEM"}, {"currency": {"currencyCode": "zjb55HxX", "namespace": "yKq5mrjC"}, "item": {"itemId": "3bk2pY7E", "itemSku": "Ha86G3XF", "itemType": "S5WgLCOr"}, "quantity": 98, "type": "CURRENCY"}, {"currency": {"currencyCode": "CXpl48Oc", "namespace": "nPOhutbp"}, "item": {"itemId": "LZKxAKbb", "itemSku": "JBhNVKpe", "itemType": "IqOryDMG"}, "quantity": 62, "type": "ITEM"}], "source": "EXPIRATION", "transactionId": "9DmyksUG"}' \
    > test.out 2>&1
eval_tap $? 262 'FulfillRewards' test.out

#- 263 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Px72LuK7' \
    --endTime '0v3sKcRL' \
    --limit '43' \
    --offset '30' \
    --productId 'vxl0lcGf' \
    --startTime 'iu0F7DYu' \
    --status 'VERIFIED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserIAPOrders' test.out

#- 264 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrRXQk9q' \
    > test.out 2>&1
eval_tap $? 264 'QueryAllUserIAPOrders' test.out

#- 265 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rkY0Aj0e' \
    --endTime 'cbsRSUsm' \
    --limit '69' \
    --offset '77' \
    --startTime 'VcLTqqKM' \
    --status 'FAIL' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPConsumeHistory' test.out

#- 266 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3nkKIHrL' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Oal_jhJM-WF", "productId": "W3vBjCbk", "region": "928wLIdn", "transactionId": "JfUlkyoF", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 266 'MockFulfillIAPItem' test.out

#- 267 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'dw9Rt170' \
    --itemId '5w6J5agZ' \
    --limit '39' \
    --offset '61' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserOrders' test.out

#- 268 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '7uiQn6Pb' \
    --body '{"currencyCode": "bJCGqc67", "currencyNamespace": "RP2TNRoy", "discountedPrice": 100, "entitlementPlatform": "Xbox", "ext": {"MhTRUqhl": {}, "zuihnqcw": {}, "IXu35qS7": {}}, "itemId": "cgzgTz4x", "language": "ZTkdjjjJ", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 72, "quantity": 81, "region": "rkjQYAtD", "returnUrl": "e8NNABnF", "sandbox": false, "sectionId": "EzlALMki"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminCreateUserOrder' test.out

#- 269 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWKAwgl1' \
    --itemId 'coqJGjgC' \
    > test.out 2>&1
eval_tap $? 269 'CountOfPurchasedItem' test.out

#- 270 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hzqReEyw' \
    --userId 'IVsvPZvO' \
    > test.out 2>&1
eval_tap $? 270 'GetUserOrder' test.out

#- 271 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bpxuqPMk' \
    --userId 'DQXEUZ0t' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "ShOxyP7j"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserOrderStatus' test.out

#- 272 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HAfSeJHj' \
    --userId 'Ykmzb3A7' \
    > test.out 2>&1
eval_tap $? 272 'FulfillUserOrder' test.out

#- 273 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8JfOKtoU' \
    --userId 'XTCvGzsT' \
    > test.out 2>&1
eval_tap $? 273 'GetUserOrderGrant' test.out

#- 274 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Gxte6jky' \
    --userId 'V06nJqm8' \
    > test.out 2>&1
eval_tap $? 274 'GetUserOrderHistories' test.out

#- 275 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iZ9ExNe3' \
    --userId 'VA4kM2cu' \
    --body '{"additionalData": {"cardSummary": "SWlgvAzt"}, "authorisedTime": "1993-08-19T00:00:00Z", "chargebackReversedTime": "1988-03-13T00:00:00Z", "chargebackTime": "1990-11-10T00:00:00Z", "chargedTime": "1971-02-11T00:00:00Z", "createdTime": "1985-07-04T00:00:00Z", "currency": {"currencyCode": "Nyip4RGG", "currencySymbol": "SHoCDcxm", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "ahSxPFNz"}, "customParameters": {"Ea1S6QeV": {}, "YE3RNR5N": {}, "PnVagH2l": {}}, "extOrderNo": "QdvlQVob", "extTxId": "QFM44XSV", "extUserId": "gT6fU18I", "issuedAt": "1971-12-15T00:00:00Z", "metadata": {"Adaf2kDl": "1HXY8SCI", "YTqb7eyM": "drSh3WxA", "n3cLxdmI": "XVmBCJ6e"}, "namespace": "lVGh4tbS", "nonceStr": "euh3kMtL", "paymentMethod": "9x1m9CRZ", "paymentMethodFee": 94, "paymentOrderNo": "t02nuq1x", "paymentProvider": "ALIPAY", "paymentProviderFee": 96, "paymentStationUrl": "5NCxQOtb", "price": 53, "refundedTime": "1980-10-03T00:00:00Z", "salesTax": 81, "sandbox": false, "sku": "VjS1qvwE", "status": "REFUNDED", "statusReason": "JAtnCtdP", "subscriptionId": "VKf2d1xx", "subtotalPrice": 61, "targetNamespace": "BM7WKfs0", "targetUserId": "mVjTARij", "tax": 58, "totalPrice": 71, "totalTax": 33, "txEndTime": "1974-11-19T00:00:00Z", "type": "xta7EJbC", "userId": "mU36A2Yy", "vat": 36}' \
    > test.out 2>&1
eval_tap $? 275 'ProcessUserOrderNotification' test.out

#- 276 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nLyOFRxa' \
    --userId 'F9BFRQ3E' \
    > test.out 2>&1
eval_tap $? 276 'DownloadUserOrderReceipt' test.out

#- 277 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYmnaAN9' \
    --body '{"currencyCode": "3FvVliFJ", "currencyNamespace": "4L0j4BDO", "customParameters": {"JTf7NZNL": {}, "2qQ0rqrk": {}, "9TvRTQv9": {}}, "description": "JDout5SC", "extOrderNo": "iJIlETNU", "extUserId": "nQ1FkU6i", "itemType": "COINS", "language": "LWy-213", "metadata": {"ghVshWHo": "sASV3hDi", "SGgpUEFg": "elDCzNxj", "S8nrLHWH": "quDQ9Gui"}, "notifyUrl": "BlWv4d54", "omitNotification": true, "platform": "XH6xRkvX", "price": 55, "recurringPaymentOrderNo": "VTugLMIf", "region": "Tbr8ZIzp", "returnUrl": "v3eBbREM", "sandbox": false, "sku": "PCh9RYHc", "subscriptionId": "JcOkoWUJ", "title": "SvnpfBsm"}' \
    > test.out 2>&1
eval_tap $? 277 'CreateUserPaymentOrder' test.out

#- 278 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Nmlljk9T' \
    --userId 'OBzZY7uZ' \
    --body '{"description": "QkEKPrLK"}' \
    > test.out 2>&1
eval_tap $? 278 'RefundUserPaymentOrder' test.out

#- 279 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qa4u6sni' \
    --body '{"code": "wNK0siEe", "orderNo": "G1pVndYj"}' \
    > test.out 2>&1
eval_tap $? 279 'ApplyUserRedemption' test.out

#- 280 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '7BiG15AS' \
    --body '{"meta": {"bn1CkYVK": {}, "68Eq2pLL": {}, "1UVl9RWC": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Steam", "currencyCode": "rDAvXkv1", "namespace": "qHsZHbhk"}, "entitlement": {"entitlementId": "ZpyttzUw"}, "item": {"entitlementOrigin": "System", "itemIdentity": "drQSTTmC", "itemIdentityType": "ITEM_SKU", "origin": "Nintendo"}, "quantity": 77, "type": "ITEM"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "5xSER1sC", "namespace": "0Qeuu66B"}, "entitlement": {"entitlementId": "Ct8d98tW"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "YZ52yf45", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 63, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "System", "currencyCode": "wCi5buDC", "namespace": "9HYGfK2Y"}, "entitlement": {"entitlementId": "vnsLW4nh"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "fc5sDJ28", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 18, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "96LUXnXV"}' \
    > test.out 2>&1
eval_tap $? 280 'DoRevocation' test.out

#- 281 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'THOofdiU' \
    --body '{"gameSessionId": "LGiatesj", "payload": {"4l2WeucX": {}, "qwYaF4pd": {}, "Dumb21ew": {}}, "scid": "T5iB1yAm", "sessionTemplateName": "rIrQYkgS"}' \
    > test.out 2>&1
eval_tap $? 281 'RegisterXblSessions' test.out

#- 282 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'joD2ENnG' \
    --chargeStatus 'CHARGED' \
    --itemId 'SCvoBJQ5' \
    --limit '48' \
    --offset '63' \
    --sku 'VRhKuD3R' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 282 'QueryUserSubscriptions' test.out

#- 283 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdiVMfbh' \
    --excludeSystem  \
    --limit '37' \
    --offset '83' \
    --subscriptionId 'W5Gwy44s' \
    > test.out 2>&1
eval_tap $? 283 'GetUserSubscriptionActivities' test.out

#- 284 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgGVipk4' \
    --body '{"grantDays": 56, "itemId": "Lys4f2GD", "language": "zAgtRwkS", "reason": "msIe90L8", "region": "nCHBpmk6", "source": "E2Qj5wwT"}' \
    > test.out 2>&1
eval_tap $? 284 'PlatformSubscribeSubscription' test.out

#- 285 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UW0w0Auo' \
    --itemId 'kOltHkKK' \
    > test.out 2>&1
eval_tap $? 285 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 286 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zxLzU0Nn' \
    --userId 'EsOzi0Ms' \
    > test.out 2>&1
eval_tap $? 286 'GetUserSubscription' test.out

#- 287 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lJky6cd4' \
    --userId 'Gc4n01mg' \
    > test.out 2>&1
eval_tap $? 287 'DeleteUserSubscription' test.out

#- 288 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AfrZnMMg' \
    --userId 'R1Yhmx4n' \
    --force  \
    --body '{"immediate": true, "reason": "SdQh2XWs"}' \
    > test.out 2>&1
eval_tap $? 288 'CancelSubscription' test.out

#- 289 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NmjR8i5O' \
    --userId '3BoRngAD' \
    --body '{"grantDays": 78, "reason": "9rxaTthW"}' \
    > test.out 2>&1
eval_tap $? 289 'GrantDaysToSubscription' test.out

#- 290 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ho4dOGtd' \
    --userId 'z0SKqPff' \
    --excludeFree  \
    --limit '69' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionBillingHistories' test.out

#- 291 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LWhmccaa' \
    --userId 'XTYwgQMK' \
    --body '{"additionalData": {"cardSummary": "LoTOzIgs"}, "authorisedTime": "1990-08-27T00:00:00Z", "chargebackReversedTime": "1987-10-20T00:00:00Z", "chargebackTime": "1971-01-31T00:00:00Z", "chargedTime": "1971-09-23T00:00:00Z", "createdTime": "1975-08-01T00:00:00Z", "currency": {"currencyCode": "SKbmjF0r", "currencySymbol": "2X4nXOyH", "currencyType": "VIRTUAL", "decimals": 19, "namespace": "ggp1OEqg"}, "customParameters": {"69LWsaGa": {}, "AQoYZWuS": {}, "OwJ8Q96c": {}}, "extOrderNo": "wLCEOJbd", "extTxId": "1sT0AgKb", "extUserId": "txodBAS5", "issuedAt": "1979-02-13T00:00:00Z", "metadata": {"RGGXP38P": "6f6dYIq4", "QpBrty1s": "ekFyOQwd", "WKWIiVF7": "t4QjklQk"}, "namespace": "GobRhkod", "nonceStr": "detjqTtT", "paymentMethod": "EprXc7C4", "paymentMethodFee": 53, "paymentOrderNo": "xzW4oAWa", "paymentProvider": "XSOLLA", "paymentProviderFee": 59, "paymentStationUrl": "5lYMBq8K", "price": 49, "refundedTime": "1986-07-23T00:00:00Z", "salesTax": 23, "sandbox": false, "sku": "XxHr4pd4", "status": "AUTHORISED", "statusReason": "RmRBMKkk", "subscriptionId": "onzyKqfV", "subtotalPrice": 1, "targetNamespace": "bNTKW2dt", "targetUserId": "K52gmeP5", "tax": 52, "totalPrice": 76, "totalTax": 93, "txEndTime": "1977-11-27T00:00:00Z", "type": "Tz3LuIH6", "userId": "09SO1KqF", "vat": 97}' \
    > test.out 2>&1
eval_tap $? 291 'ProcessUserSubscriptionNotification' test.out

#- 292 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'yqDnHdma' \
    --namespace "$AB_NAMESPACE" \
    --userId '9m1GlSqh' \
    --body '{"count": 65, "orderNo": "SfPMJC4B"}' \
    > test.out 2>&1
eval_tap $? 292 'AcquireUserTicket' test.out

#- 293 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '5h8V0V3F' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserCurrencyWallets' test.out

#- 294 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'yQizN3Zy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c43YnwYy' \
    --body '{"allowOverdraft": false, "amount": 90, "balanceOrigin": "Other", "balanceSource": "TRADE", "metadata": {"OXytn7fm": {}, "Pnlqaurk": {}, "xV3DaZ1n": {}}, "reason": "uKDv8ur9"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitUserWalletByCurrencyCode' test.out

#- 295 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'fIjPMsF3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1WE4jjp' \
    --limit '61' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 295 'ListUserCurrencyTransactions' test.out

#- 296 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'I5Odwfg2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbRDJlK6' \
    --request '{"amount": 62, "debitBalanceSource": "TRADE", "metadata": {"skE97PI3": {}, "erZNT5QG": {}, "KeDhKyKm": {}}, "reason": "aPxtP8Cm", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 296 'CheckBalance' test.out

#- 297 CheckWallet
eval_tap 0 297 'CheckWallet # SKIP deprecated' test.out

#- 298 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'msu72Ges' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NlLWUTHZ' \
    --body '{"amount": 6, "expireAt": "1977-11-02T00:00:00Z", "metadata": {"Y3hX5tIP": {}, "ynhJ5YWb": {}, "ulYpcMJt": {}}, "origin": "Other", "reason": "XXJMPa99", "source": "IAP_CHARGEBACK_REVERSED"}' \
    > test.out 2>&1
eval_tap $? 298 'CreditUserWallet' test.out

#- 299 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'SeodjYUO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oMaEZArl' \
    --request '{"amount": 97, "debitBalanceSource": "OTHER", "metadata": {"q2OZsAI8": {}, "TtWreosH": {}, "fHD38sgP": {}}, "reason": "tpvmZfpv", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 299 'DebitByWalletPlatform' test.out

#- 300 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'pH7KJCcK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9OTrL2b' \
    --body '{"amount": 5, "metadata": {"aHVRb0Il": {}, "R6e0msMB": {}, "EcM5HjuR": {}}, "walletPlatform": "Steam"}' \
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
    --storeId '3LDVWfL2' \
    > test.out 2>&1
eval_tap $? 306 'ListViews' test.out

#- 307 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lNNBzdD1' \
    --body '{"displayOrder": 43, "localizations": {"Y2dyuNrR": {"description": "jiY8ZdD5", "localExt": {"GTiJPNLV": {}, "ISxXHSSA": {}, "HUfwV6BK": {}}, "longDescription": "dWNCgMdY", "title": "W7J1PkoV"}, "SXpxL5Id": {"description": "hq1Syl6n", "localExt": {"vzoGKYyx": {}, "iz0CR1C9": {}, "MLYVOgP6": {}}, "longDescription": "pwj0e2nq", "title": "QrXkz0Gq"}, "qZx8Vakg": {"description": "5utGQID2", "localExt": {"sjC6DUcN": {}, "654oEKgo": {}, "7jP9z3e7": {}}, "longDescription": "IU61sElH", "title": "abaxiUkP"}}, "name": "rPPGW7CN"}' \
    > test.out 2>&1
eval_tap $? 307 'CreateView' test.out

#- 308 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'oz3JvhcI' \
    --storeId 'wxr4kJpg' \
    > test.out 2>&1
eval_tap $? 308 'GetView' test.out

#- 309 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'cXDTL2Pw' \
    --storeId '86YmlKDb' \
    --body '{"displayOrder": 52, "localizations": {"W96kUtWw": {"description": "zMOUrmg2", "localExt": {"ZZqJwocO": {}, "58muHZwZ": {}, "oxye10oC": {}}, "longDescription": "xD5jKvI7", "title": "OvonMr25"}, "PxHtOSbz": {"description": "sHqSjxq0", "localExt": {"57t9XD5n": {}, "DUOoJpLE": {}, "vwzBg8s7": {}}, "longDescription": "9f33zwqu", "title": "zAxyx66i"}, "gKDBL2Xm": {"description": "kGdaE50x", "localExt": {"AuoQNDhF": {}, "72xtUcJS": {}, "QnN2KgXz": {}}, "longDescription": "Bobrjlrm", "title": "QsDnuI2m"}}, "name": "4PM7UT6C"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateView' test.out

#- 310 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'R3a4rIW2' \
    --storeId 'DS4DbJrr' \
    > test.out 2>&1
eval_tap $? 310 'DeleteView' test.out

#- 311 QueryWallets
eval_tap 0 311 'QueryWallets # SKIP deprecated' test.out

#- 312 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 2, "expireAt": "1978-01-07T00:00:00Z", "metadata": {"VcSCBwoR": {}, "RUExpObT": {}, "p8Uu5RdZ": {}}, "origin": "Xbox", "reason": "a2DUyOg1", "source": "PURCHASE"}, "currencyCode": "5fsh3MDV", "userIds": ["mVnwG54A", "o7L1CTm2", "gJvDYN4J"]}, {"creditRequest": {"amount": 98, "expireAt": "1974-02-13T00:00:00Z", "metadata": {"45EmK5wa": {}, "TX2gy0Cj": {}, "qSfOhDYy": {}}, "origin": "System", "reason": "i62nShZr", "source": "PROMOTION"}, "currencyCode": "qabjYH74", "userIds": ["mEhJkf49", "HG4L6q1F", "C9V13AEl"]}, {"creditRequest": {"amount": 88, "expireAt": "1992-04-28T00:00:00Z", "metadata": {"Z2OUUqMI": {}, "9SnuKRoV": {}, "odOh8usG": {}}, "origin": "Steam", "reason": "e26vfAT6", "source": "REFUND"}, "currencyCode": "IMrcczOH", "userIds": ["EpJUZfd9", "Vk9NBQ02", "NdSzTpSc"]}]' \
    > test.out 2>&1
eval_tap $? 312 'BulkCredit' test.out

#- 313 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "olsshWXP", "request": {"allowOverdraft": false, "amount": 29, "balanceOrigin": "IOS", "balanceSource": "OTHER", "metadata": {"YbWsr05v": {}, "UHi6JBgL": {}, "MfotxV8b": {}}, "reason": "TTfqar80"}, "userIds": ["TU8YhdlA", "MOaWYWl5", "7wctdsYl"]}, {"currencyCode": "Sf5eSjW7", "request": {"allowOverdraft": true, "amount": 7, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"lhEaz71v": {}, "8419rYp9": {}, "LBlKLcv5": {}}, "reason": "eAxMpWQk"}, "userIds": ["EdH1D980", "TM590Dwv", "GGfeg7ko"]}, {"currencyCode": "YU0kFtPU", "request": {"allowOverdraft": false, "amount": 31, "balanceOrigin": "Xbox", "balanceSource": "DLC_REVOCATION", "metadata": {"jF7nTWFY": {}, "TnY4upmq": {}, "kzmzZqZo": {}}, "reason": "v6ekJpd8"}, "userIds": ["sgLqEvhN", "8UOpB39A", "Yt82OAwa"]}]' \
    > test.out 2>&1
eval_tap $? 313 'BulkDebit' test.out

#- 314 GetWallet
eval_tap 0 314 'GetWallet # SKIP deprecated' test.out

#- 315 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'vJzLX6xd' \
    --end 'vYHqizfk' \
    --start 'K6a2iPLX' \
    > test.out 2>&1
eval_tap $? 315 'SyncOrders' test.out

#- 316 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["OxwMqijm", "6ZDWU0Ww", "kRYyT5m8"], "apiKey": "HvtrCOlD", "authoriseAsCapture": true, "blockedPaymentMethods": ["2YJTkD0I", "NaoNti12", "nftmCMHf"], "clientKey": "YW2DSq5p", "dropInSettings": "IH2Y2LoH", "liveEndpointUrlPrefix": "c07suNZP", "merchantAccount": "befGVIPM", "notificationHmacKey": "z7tfP2z7", "notificationPassword": "2JPHJlZP", "notificationUsername": "4smElDdH", "returnUrl": "77ydcivK", "settings": "1hpycYiQ"}' \
    > test.out 2>&1
eval_tap $? 316 'TestAdyenConfig' test.out

#- 317 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "cqxNai7E", "privateKey": "Co4h2coi", "publicKey": "067gaJXl", "returnUrl": "zPqSw9v8"}' \
    > test.out 2>&1
eval_tap $? 317 'TestAliPayConfig' test.out

#- 318 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "yicQcKxQ", "secretKey": "IGSo7tx5"}' \
    > test.out 2>&1
eval_tap $? 318 'TestCheckoutConfig' test.out

#- 319 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'whKY0hR8' \
    > test.out 2>&1
eval_tap $? 319 'DebugMatchedPaymentMerchantConfig' test.out

#- 320 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "Q05KAzmz", "clientSecret": "exnvwNW6", "returnUrl": "7NdpyfHT", "webHookId": "1nKbVEzW"}' \
    > test.out 2>&1
eval_tap $? 320 'TestPayPalConfig' test.out

#- 321 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["fNiAhtVG", "W4aUPK10", "yH2OgUge"], "publishableKey": "pg9rKAdr", "secretKey": "5EAN0A86", "webhookSecret": "R4IOcxOQ"}' \
    > test.out 2>&1
eval_tap $? 321 'TestStripeConfig' test.out

#- 322 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "NVM159KD", "key": "wDnM5ErQ", "mchid": "y8wIKif8", "returnUrl": "npvhPvhH"}' \
    > test.out 2>&1
eval_tap $? 322 'TestWxPayConfig' test.out

#- 323 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "nt9Wc0Rc", "flowCompletionUrl": "6akiNwpb", "merchantId": 86, "projectId": 12, "projectSecretKey": "P3ffJhwk"}' \
    > test.out 2>&1
eval_tap $? 323 'TestXsollaConfig' test.out

#- 324 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'atVhLcZf' \
    > test.out 2>&1
eval_tap $? 324 'GetPaymentMerchantConfig' test.out

#- 325 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'pe9q8fGL' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["ahTvrfgH", "9UOqCs93", "puR7Qm2M"], "apiKey": "o0jXHY6W", "authoriseAsCapture": false, "blockedPaymentMethods": ["tpMkZHKn", "HJ4a3OtW", "Hs01RmXV"], "clientKey": "PEa1V0YF", "dropInSettings": "AluJuY1j", "liveEndpointUrlPrefix": "eABsMJyD", "merchantAccount": "2OfP33nc", "notificationHmacKey": "ee3lbHsA", "notificationPassword": "QtvjbKUI", "notificationUsername": "aqPj754M", "returnUrl": "AHJT6bzF", "settings": "iJRIPcqe"}' \
    > test.out 2>&1
eval_tap $? 325 'UpdateAdyenConfig' test.out

#- 326 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'LKHNIumf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 326 'TestAdyenConfigById' test.out

#- 327 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'D85lNvKd' \
    --sandbox  \
    --validate  \
    --body '{"appId": "bi7b3Lut", "privateKey": "4FfczwdF", "publicKey": "joNbFGA9", "returnUrl": "3fc7BAoK"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAliPayConfig' test.out

#- 328 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'NlATf58m' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAliPayConfigById' test.out

#- 329 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'MtbsuWio' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "CDEScOJ1", "secretKey": "NHQxAy3t"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateCheckoutConfig' test.out

#- 330 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'B0Hgy6rQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestCheckoutConfigById' test.out

#- 331 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'P7yg85WU' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "ZY1hgik9", "clientSecret": "mMKk1syE", "returnUrl": "dpQHbqBX", "webHookId": "k4GBbME3"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdatePayPalConfig' test.out

#- 332 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'GO9CQIZS' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestPayPalConfigById' test.out

#- 333 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'B6yefwXD' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["o5NSsJvl", "9YmdNIc5", "CMJrsqsp"], "publishableKey": "PJFpS8ru", "secretKey": "UpT7m6gm", "webhookSecret": "YHn1VsOU"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateStripeConfig' test.out

#- 334 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '8qNDDFoN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestStripeConfigById' test.out

#- 335 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'pDbDIaHq' \
    --validate  \
    --body '{"appId": "VrbswRZS", "key": "LySkDygB", "mchid": "CCS71yg0", "returnUrl": "z8r1tDmi"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateWxPayConfig' test.out

#- 336 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '4oRwLTn9' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 336 'UpdateWxPayConfigCert' test.out

#- 337 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'WQPYeR9Y' \
    > test.out 2>&1
eval_tap $? 337 'TestWxPayConfigById' test.out

#- 338 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'WS4V1yCK' \
    --validate  \
    --body '{"apiKey": "eLRNNSxe", "flowCompletionUrl": "IqFl3Xtq", "merchantId": 22, "projectId": 44, "projectSecretKey": "n7EcDKoO"}' \
    > test.out 2>&1
eval_tap $? 338 'UpdateXsollaConfig' test.out

#- 339 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'iwL495iE' \
    > test.out 2>&1
eval_tap $? 339 'TestXsollaConfigById' test.out

#- 340 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 't9zQaWyt' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaUIConfig' test.out

#- 341 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '96' \
    --namespace "$AB_NAMESPACE" \
    --offset '75' \
    --region 'jK1Sfisf' \
    > test.out 2>&1
eval_tap $? 341 'QueryPaymentProviderConfig' test.out

#- 342 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "spEzJtzI", "region": "Vfvz92Qk", "sandboxTaxJarApiToken": "J23yICkk", "specials": ["CHECKOUT", "WALLET", "CHECKOUT"], "taxJarApiToken": "SSG2pQEa", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 342 'CreatePaymentProviderConfig' test.out

#- 343 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 343 'GetAggregatePaymentProviders' test.out

#- 344 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '7OiltwPP' \
    > test.out 2>&1
eval_tap $? 344 'DebugMatchedPaymentProviderConfig' test.out

#- 345 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetSpecialPaymentProviders' test.out

#- 346 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'HhgPHnJH' \
    --body '{"aggregate": "XSOLLA", "namespace": "WRDsRzNH", "region": "k9fqSTU4", "sandboxTaxJarApiToken": "U2FwtJTD", "specials": ["XSOLLA", "ADYEN", "WXPAY"], "taxJarApiToken": "UMcBqK3d", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 346 'UpdatePaymentProviderConfig' test.out

#- 347 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'YF4FuL94' \
    > test.out 2>&1
eval_tap $? 347 'DeletePaymentProviderConfig' test.out

#- 348 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 348 'GetPaymentTaxConfig' test.out

#- 349 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "aUErtyOb", "taxJarApiToken": "KOw8WPkK", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Yh2OfWPM": "7XZOhfh1", "knHiBPE8": "7IeHB66a", "gaMIa24n": "uHoZhrc8"}}' \
    > test.out 2>&1
eval_tap $? 349 'UpdatePaymentTaxConfig' test.out

#- 350 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'b1Jk3GYr' \
    --end 'J1PxqP8l' \
    --start '8iIUE7ZE' \
    > test.out 2>&1
eval_tap $? 350 'SyncPaymentOrders' test.out

#- 351 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'MPv04Yy1' \
    --storeId 'EVka3B47' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetRootCategories' test.out

#- 352 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'erVjCHJc' \
    --storeId 'rsvWNGr0' \
    > test.out 2>&1
eval_tap $? 352 'DownloadCategories' test.out

#- 353 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'qSuD3n1p' \
    --namespace "$AB_NAMESPACE" \
    --language 'DlBzVfGI' \
    --storeId 'SSMwoh7h' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetCategory' test.out

#- 354 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'wShsgEz6' \
    --namespace "$AB_NAMESPACE" \
    --language 'SlUgKBKa' \
    --storeId 'wj0FUFIJ' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetChildCategories' test.out

#- 355 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Xt9XHMkP' \
    --namespace "$AB_NAMESPACE" \
    --language '4hEp0DHW' \
    --storeId 'wnP7Lblo' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetDescendantCategories' test.out

#- 356 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 356 'PublicListCurrencies' test.out

#- 357 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'XBOX' \
    > test.out 2>&1
eval_tap $? 357 'GeDLCDurableRewardShortMap' test.out

#- 358 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 358 'GetIAPItemMapping' test.out

#- 359 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '7H6YbfQS' \
    --region 'yApAnQBs' \
    --storeId '73clS3Z9' \
    --appId 'hw3io99K' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetItemByAppId' test.out

#- 360 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'MJVP0BYC' \
    --categoryPath '9cTBzsqI' \
    --features 'LafqLWTb' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --language '6m1bV7Et' \
    --limit '30' \
    --offset '38' \
    --region 'CGiKnxSc' \
    --sortBy 'name:desc,createdAt:asc,displayOrder' \
    --storeId 'PXDOyI0L' \
    --tags 'jran5utx' \
    > test.out 2>&1
eval_tap $? 360 'PublicQueryItems' test.out

#- 361 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Pqmbx7EF' \
    --region 'TvNePpK7' \
    --storeId '617HXWhi' \
    --sku '9bgrJe7p' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemBySku' test.out

#- 362 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'HlaFckA7' \
    --storeId '56BX1ZCW' \
    --itemIds 'qHTgzQWK' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetEstimatedPrice' test.out

#- 363 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'auQFwfWT' \
    --region 'aJHDSEXP' \
    --storeId '9o9DZ8ry' \
    --itemIds 'zlDe3YZ1' \
    > test.out 2>&1
eval_tap $? 363 'PublicBulkGetItems' test.out

#- 364 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["QZcxHmQW", "BM3so3Gg", "gu1tQaAU"]}' \
    > test.out 2>&1
eval_tap $? 364 'PublicValidateItemPurchaseCondition' test.out

#- 365 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'EXTENSION' \
    --limit '100' \
    --offset '57' \
    --region 'OpW9foOW' \
    --storeId 'dCx8CX3g' \
    --keyword 'Td8VpcbT' \
    --language '1rYCBHCf' \
    > test.out 2>&1
eval_tap $? 365 'PublicSearchItems' test.out

#- 366 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'K4dwLCad' \
    --namespace "$AB_NAMESPACE" \
    --language 'SkBWcyIT' \
    --region 'PxEgihR3' \
    --storeId 'zTxDeIYV' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetApp' test.out

#- 367 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'BsPXvndA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 367 'PublicGetItemDynamicData' test.out

#- 368 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'w4qGuCJR' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'cw6ESXKP' \
    --populateBundle  \
    --region 'gSIvPUf3' \
    --storeId 'KKaMQ4vO' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetItem' test.out

#- 369 GetPaymentCustomization
eval_tap 0 369 'GetPaymentCustomization # SKIP deprecated' test.out

#- 370 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "rdUFYf5n", "paymentProvider": "XSOLLA", "returnUrl": "VLnoNtFD", "ui": "ACGMuotP", "zipCode": "kPrbnlt5"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetPaymentUrl' test.out

#- 371 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mzT7uQ31' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetPaymentMethods' test.out

#- 372 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yY48qbgt' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetUnpaidPaymentOrder' test.out

#- 373 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'X1wdu95a' \
    --paymentProvider 'ADYEN' \
    --zipCode 'gbrMbWXi' \
    --body '{"token": "O3NYxjpt"}' \
    > test.out 2>&1
eval_tap $? 373 'Pay' test.out

#- 374 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'y6CiLnth' \
    > test.out 2>&1
eval_tap $? 374 'PublicCheckPaymentOrderPaidStatus' test.out

#- 375 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'hxGG8RFf' \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentPublicConfig' test.out

#- 376 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '77PM25Jv' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetQRCode' test.out

#- 377 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'VKA1ruWZ' \
    --foreinginvoice 'WT0OGQHW' \
    --invoiceId 'KHsFKjvS' \
    --payload '7SZ7ub3G' \
    --redirectResult 'NekXmeSp' \
    --resultCode 'IKlDMXpY' \
    --sessionId 'l6kTCuuu' \
    --status 'TMiWSnH2' \
    --token 'sENpS4p1' \
    --type 'TdwPpRDo' \
    --userId '4Y1BFxkH' \
    --orderNo 'bXvdGm6b' \
    --paymentOrderNo 'bhNsaArW' \
    --paymentProvider 'STRIPE' \
    --returnUrl '6jHHd5US' \
    > test.out 2>&1
eval_tap $? 377 'PublicNormalizePaymentReturnUrl' test.out

#- 378 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'l2TbLGNo' \
    --paymentOrderNo 'YSgJYHHl' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 378 'GetPaymentTaxValue' test.out

#- 379 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'GqEntNl6' \
    > test.out 2>&1
eval_tap $? 379 'GetRewardByCode' test.out

#- 380 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ZXZRifrT' \
    --limit '4' \
    --offset '43' \
    --sortBy 'rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 380 'QueryRewards1' test.out

#- 381 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sORLxZtD' \
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
    --appIds 'lBpRt1bQ,W8kMtNfa,mv8FJTMp' \
    --itemIds 'Tx12ZTqE,5DWsOBFI,SQaDpfAD' \
    --skus 'n4djYQzb,RVFuSqib,gfgpmHqg' \
    > test.out 2>&1
eval_tap $? 383 'PublicExistsAnyMyActiveEntitlement' test.out

#- 384 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'G3adSDrp' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 385 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'qSC7s04j' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 386 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku '4r0ZF66t' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 387 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'gGHgMeNc,BYLpplLe,Il2ISzsN' \
    --itemIds 'hODIgTxZ,3gMR3Z7c,CkJRR6rN' \
    --skus 'sMI8L1Iy,RVIOoQU5,lLiWeRjc' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetEntitlementOwnershipToken' test.out

#- 388 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "y9z3pmxi", "language": "JfFz-RjIv", "region": "fDiwicbP"}' \
    > test.out 2>&1
eval_tap $? 388 'SyncTwitchDropsEntitlement' test.out

#- 389 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'VyPozkJc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicGetMyWallet' test.out

#- 390 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFslfWNg' \
    --body '{"epicGamesJwtToken": "goEMjCDZ"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncEpicGameDLC' test.out

#- 391 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1AS4VB8' \
    > test.out 2>&1
eval_tap $? 391 'SyncOculusDLC' test.out

#- 392 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '4bEqqTlO' \
    --body '{"serviceLabel": 63}' \
    > test.out 2>&1
eval_tap $? 392 'PublicSyncPsnDlcInventory' test.out

#- 393 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'KThLTNZO' \
    --body '{"serviceLabels": [65, 82, 28]}' \
    > test.out 2>&1
eval_tap $? 393 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 394 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'IOfwtNze' \
    --body '{"appId": "MOxya1o0", "steamId": "Ark351se"}' \
    > test.out 2>&1
eval_tap $? 394 'SyncSteamDLC' test.out

#- 395 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'FOM3i0gD' \
    --body '{"xstsToken": "14iopX2C"}' \
    > test.out 2>&1
eval_tap $? 395 'SyncXboxDLC' test.out

#- 396 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'fr4ZatkF' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '0Fc3qNSr' \
    --features 'AQ8HBhKt,UKqgEAh4,WaCisqqb' \
    --itemId 'nuTa9Ypi,EzylNXbX,NFO6tQzv' \
    --limit '18' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 396 'PublicQueryUserEntitlements' test.out

#- 397 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZrnqlJZJ' \
    --appId 'zL9Azekl' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementByAppId' test.out

#- 398 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '29Idb4Vd' \
    --limit '22' \
    --offset '43' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlementsByAppType' test.out

#- 399 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DBqeS9i0' \
    --availablePlatformOnly  \
    --ids '2xSzyByY,dqlngZoY,1KJTH6tN' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementsByIds' test.out

#- 400 PublicGetUserEntitlementByItemId
eval_tap 0 400 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 401 PublicGetUserEntitlementBySku
eval_tap 0 401 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 402 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '7q7HtECb' \
    --endDate 'rUXxt1os' \
    --entitlementClazz 'OPTIONBOX' \
    --limit '36' \
    --offset '42' \
    --startDate 'tXAXaeaY' \
    > test.out 2>&1
eval_tap $? 402 'PublicUserEntitlementHistory' test.out

#- 403 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPQXNek9' \
    --appIds 'dtntU8Cs,2qcmuj9P,6qOUAIMf' \
    --itemIds 'UJV5ozrq,tdAidpEr,JoEwhMyT' \
    --skus 'cvvh9Sol,b7e3Lk4O,ANMPjtRT' \
    > test.out 2>&1
eval_tap $? 403 'PublicExistsAnyUserActiveEntitlement' test.out

#- 404 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'muDyySJC' \
    --appId 'IqfZMlxu' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 405 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmbTUHxS' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'k6O7M9jE' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 406 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCMOM6zo' \
    --ids 'vUslKYnk,dpQ4FMsr,xwu3CnDr' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 407 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBAxbD8F' \
    --entitlementClazz 'APP' \
    --sku '9ZuJPp7e' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 408 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '8M5Qq1xL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'leSJgoxA' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlement' test.out

#- 409 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'sOImvsKU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eso3oYIA' \
    --body '{"options": ["H4T8284D", "Ed8MMN9H", "SSuE3J7g"], "requestId": "YJklbO58", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 409 'PublicConsumeUserEntitlement' test.out

#- 410 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'mTviZL1k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybFmJuWu' \
    --body '{"requestId": "IlXnrneh", "useCount": 13}' \
    > test.out 2>&1
eval_tap $? 410 'PublicSellUserEntitlement' test.out

#- 411 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'GO8osgej' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOGrT8zQ' \
    --body '{"useCount": 92}' \
    > test.out 2>&1
eval_tap $? 411 'PublicSplitUserEntitlement' test.out

#- 412 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'EfJZKMbt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qmcbRWbC' \
    --body '{"entitlementId": "ABWZ3GdC", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 412 'PublicTransferUserEntitlement' test.out

#- 413 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '2leOpRr9' \
    --body '{"code": "W3eT3jQZ", "language": "MuQN", "region": "SKchTH79"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicRedeemCode' test.out

#- 414 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GrzJkmo8' \
    --body '{"excludeOldTransactions": false, "language": "SAMv-dr", "productId": "UNwuI2qM", "receiptData": "RIOdYar4", "region": "l2bAN09H", "transactionId": "GXjcF5gN"}' \
    > test.out 2>&1
eval_tap $? 414 'PublicFulfillAppleIAPItem' test.out

#- 415 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAtgUdUj' \
    --body '{"epicGamesJwtToken": "WJotq5lt"}' \
    > test.out 2>&1
eval_tap $? 415 'SyncEpicGamesInventory' test.out

#- 416 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6aLjJULR' \
    --body '{"autoAck": true, "language": "YNvg_zB", "orderId": "YatYv7QM", "packageName": "zWxa272k", "productId": "M4I0IAYH", "purchaseTime": 58, "purchaseToken": "gkBGWWlo", "region": "6WMJHx65"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicFulfillGoogleIAPItem' test.out

#- 417 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIPY7oFf' \
    > test.out 2>&1
eval_tap $? 417 'SyncOculusConsumableEntitlements' test.out

#- 418 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'r7KJyWCU' \
    --body '{"currencyCode": "YSAvxeCo", "price": 0.20111307010222357, "productId": "QtiZgQii", "serviceLabel": 24}' \
    > test.out 2>&1
eval_tap $? 418 'PublicReconcilePlayStationStore' test.out

#- 419 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0NnMGCf' \
    --body '{"currencyCode": "vwU2zvNV", "price": 0.03783208798917015, "productId": "nXFthCuo", "serviceLabels": [88, 76, 87]}' \
    > test.out 2>&1
eval_tap $? 419 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 420 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vADJzFYw' \
    --body '{"appId": "mwmeE4qB", "currencyCode": "mz4lVCnT", "language": "FK-tquA", "price": 0.11012644141552763, "productId": "9EqVxxk2", "region": "x7grmPKX", "steamId": "xTXHgCqx"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncSteamInventory' test.out

#- 421 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GTFcMfmj' \
    --body '{"gameId": "YkCdfh8o", "language": "FB_458", "region": "gDl4Dvhj"}' \
    > test.out 2>&1
eval_tap $? 421 'SyncTwitchDropsEntitlement1' test.out

#- 422 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'o86vLUeR' \
    --body '{"currencyCode": "XCOpF5vN", "price": 0.234095907488025, "productId": "QhhK3RHi", "xstsToken": "mnHyVABV"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncXboxInventory' test.out

#- 423 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'tt6twcHB' \
    --itemId 'sZyHYGXp' \
    --limit '91' \
    --offset '86' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserOrders' test.out

#- 424 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BNiUMe6F' \
    --body '{"currencyCode": "HF36ONet", "discountedPrice": 97, "ext": {"ZLnfaW5C": {}, "R0vUjAe3": {}, "vBFgLeFv": {}}, "itemId": "9cEmqOWD", "language": "uzR-180", "price": 66, "quantity": 21, "region": "WvcpWQ8Z", "returnUrl": "r7mGgZCz", "sectionId": "koc5kO2Q"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicCreateUserOrder' test.out

#- 425 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ua3n339j' \
    --userId 'q3x7o28I' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserOrder' test.out

#- 426 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xIgRhnGu' \
    --userId 'yHR1PCir' \
    > test.out 2>&1
eval_tap $? 426 'PublicCancelUserOrder' test.out

#- 427 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RThURAGN' \
    --userId 'gscPNXP9' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserOrderHistories' test.out

#- 428 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7BeIdz28' \
    --userId 'qzCubrZk' \
    > test.out 2>&1
eval_tap $? 428 'PublicDownloadUserOrderReceipt' test.out

#- 429 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'VOAcNEEj' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetPaymentAccounts' test.out

#- 430 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ExYhKzrr' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'nbf2k6Jp' \
    > test.out 2>&1
eval_tap $? 430 'PublicDeletePaymentAccount' test.out

#- 431 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'VrIJrv2v' \
    --autoCalcEstimatedPrice  \
    --language 'sUbCnG4a' \
    --region 'FYMIJ3nc' \
    --storeId 'cWpMG4KS' \
    --viewId 'LUPrccka' \
    > test.out 2>&1
eval_tap $? 431 'PublicListActiveSections' test.out

#- 432 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'iFxz4Y5S' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'MzUnRoMF' \
    --limit '33' \
    --offset '78' \
    --sku 'HhgwzGga' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 432 'PublicQueryUserSubscriptions' test.out

#- 433 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'au2N7qB0' \
    --body '{"currencyCode": "G3njnBWK", "itemId": "i0oyYATZ", "language": "Zk_HMLd_AQ", "region": "3Vf20kxy", "returnUrl": "aaORqtlT", "source": "HRhSS5vw"}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSubscribeSubscription' test.out

#- 434 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XbhSioYQ' \
    --itemId 'cLsfrAMU' \
    > test.out 2>&1
eval_tap $? 434 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 435 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7hWq87oS' \
    --userId '707GTRrj' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserSubscription' test.out

#- 436 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jKJdobcp' \
    --userId 'WlXU81y1' \
    > test.out 2>&1
eval_tap $? 436 'PublicChangeSubscriptionBillingAccount' test.out

#- 437 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DKDDG05v' \
    --userId '4RfYZoH4' \
    --body '{"immediate": false, "reason": "byfIqdoQ"}' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelSubscription' test.out

#- 438 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8i8upXLv' \
    --userId 'uEg9eodE' \
    --excludeFree  \
    --limit '11' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserSubscriptionBillingHistories' test.out

#- 439 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQEfIlYG' \
    --language '5usRg0BW' \
    --storeId 'GQ5PeFsI' \
    > test.out 2>&1
eval_tap $? 439 'PublicListViews' test.out

#- 440 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'v0Sf2RBn' \
    --namespace "$AB_NAMESPACE" \
    --userId '6sjLaItj' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetWallet' test.out

#- 441 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'aPsfXs8r' \
    --namespace "$AB_NAMESPACE" \
    --userId '6BQrgmiu' \
    --limit '96' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 441 'PublicListUserWalletTransactions' test.out

#- 442 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'g54w7JIY' \
    --baseAppId 'Zc99G4SK' \
    --categoryPath 'kBdo0rUP' \
    --features 'CV3dsBnw' \
    --includeSubCategoryItem  \
    --itemName 'pBq3o6YI' \
    --itemStatus 'ACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '88' \
    --offset '73' \
    --region 'EnYbXd9s' \
    --sectionExclusive  \
    --sortBy 'updatedAt:asc,name:asc,createdAt:desc' \
    --storeId 'O0F5zDLy' \
    --tags 'MBcdyW4q' \
    --targetNamespace 'txSZ7vel' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 442 'QueryItems1' test.out

#- 443 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OGSN3CRm' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 443 'ImportStore1' test.out

#- 444 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p7bueywY' \
    --body '{"itemIds": ["iQC1Lgfv", "SrfoDl2M", "w5BlwgpI"]}' \
    > test.out 2>&1
eval_tap $? 444 'ExportStore1' test.out

#- 445 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '93zRDLrf' \
    --body '{"entitlementCollectionId": "NdxlaiKl", "entitlementOrigin": "Steam", "metadata": {"AnNLCAu9": {}, "oK8yA1lr": {}, "nfntgyE4": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "CXQp074v", "namespace": "YpMscVlB"}, "item": {"itemId": "UFTJIJVn", "itemSku": "AbVgN9YW", "itemType": "qESNS4PT"}, "quantity": 16, "type": "CURRENCY"}, {"currency": {"currencyCode": "3TYzqQec", "namespace": "gqVxgm6W"}, "item": {"itemId": "8mmFd7P6", "itemSku": "CLr34dNr", "itemType": "Ci97cy0J"}, "quantity": 68, "type": "CURRENCY"}, {"currency": {"currencyCode": "BbyyeLT7", "namespace": "F5kGBl2b"}, "item": {"itemId": "e4xdxCFn", "itemSku": "d1DPru9S", "itemType": "NqmDL8Mi"}, "quantity": 41, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "q1VW1toS"}' \
    > test.out 2>&1
eval_tap $? 445 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
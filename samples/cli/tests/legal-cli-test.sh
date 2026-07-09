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
echo "1..75"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oihoc3A2' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "0RlCIYIJ", "policyId": "Y005pxHc", "policyVersionId": "UQbedDXU"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "8HMjIPh6", "policyId": "IvUFEbpz", "policyVersionId": "UULCPm0T"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "3OHyK2o1", "policyId": "4f0Cicnq", "policyVersionId": "QjkuoWmi"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 OldRetrieveAcceptedAgreements
eval_tap 0 3 'OldRetrieveAcceptedAgreements # SKIP deprecated' test.out

#- 4 OldRetrieveAllUsersByPolicyVersion
eval_tap 0 4 'OldRetrieveAllUsersByPolicyVersion # SKIP deprecated' test.out

#- 5 RetrieveAllLegalPolicies
eval_tap 0 5 'RetrieveAllLegalPolicies # SKIP deprecated' test.out

#- 6 OldCreatePolicy
eval_tap 0 6 'OldCreatePolicy # SKIP deprecated' test.out

#- 7 OldRetrieveSinglePolicy
eval_tap 0 7 'OldRetrieveSinglePolicy # SKIP deprecated' test.out

#- 8 OldPartialUpdatePolicy
eval_tap 0 8 'OldPartialUpdatePolicy # SKIP deprecated' test.out

#- 9 OldRetrievePolicyCountry
eval_tap 0 9 'OldRetrievePolicyCountry # SKIP deprecated' test.out

#- 10 OldRetrieveLocalizedPolicyVersions
eval_tap 0 10 'OldRetrieveLocalizedPolicyVersions # SKIP deprecated' test.out

#- 11 OldCreateLocalizedPolicyVersion
eval_tap 0 11 'OldCreateLocalizedPolicyVersion # SKIP deprecated' test.out

#- 12 OldRetrieveSingleLocalizedPolicyVersion
eval_tap 0 12 'OldRetrieveSingleLocalizedPolicyVersion # SKIP deprecated' test.out

#- 13 OldUpdateLocalizedPolicyVersion
eval_tap 0 13 'OldUpdateLocalizedPolicyVersion # SKIP deprecated' test.out

#- 14 OldRequestPresignedURL
eval_tap 0 14 'OldRequestPresignedURL # SKIP deprecated' test.out

#- 15 OldSetDefaultLocalizedPolicy
eval_tap 0 15 'OldSetDefaultLocalizedPolicy # SKIP deprecated' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["SpIwIpVt", "jGcjixAD", "fCANYYfw"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --namespace "$AB_NAMESPACE" \
    --userId 'CRqUtUb1' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements' test.out

#- 18 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'E1SozeDn' \
    --limit '48' \
    --offset '88' \
    --policyVersionId 'Vm0phMPW' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'YxGfLJDS' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'UufrAsa3' \
    --policyVersionId 'h6YAQ5lM' \
    --start '1jrUVRGu' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '61' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["S8JRwzdc", "QSwJJkRu", "TAyV9Bsj"], "affectedCountries": ["RYVfVF6r", "52HnhesN", "8uWTBxIp"], "basePolicyName": "znFovp7I", "countryGroupName": "GSqMiojX", "countryType": "COUNTRY", "description": "BWHnjqze", "isHidden": true, "isHiddenPublic": false, "tags": ["t4rWrt9u", "O8lGMTA8", "rtUDKj9a"], "typeId": "1vdL6th5"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'hAMujD8m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId '1QFvlpNX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'tjkbcCpC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["DlS3AYNT", "TElW62wb", "XQuwOyHd"], "affectedCountries": ["6hNITQ6u", "ZOUGq3rP", "gk3OixhW"], "basePolicyName": "c6GJyCYC", "countryGroupName": "R08TfrlX", "countryType": "COUNTRY", "description": "owSrsnxv", "isHidden": true, "isHiddenPublic": true, "tags": ["thlchL0e", "64V6PfT9", "iHbRtJxG"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'uXFY8ZkQ' \
    --countryCode '1DNTfiQ6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'ZVL590sF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'GTHHlu9L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["DW5qRSDR", "AYkddG1b", "1U2M27Wz"], "countryCode": "COIXUl2d", "countryGroupName": "MHiQD9VX", "countryType": "COUNTRY", "description": "BSG7yIND", "isDefaultSelection": false, "isMandatory": true, "policyName": "uT0pzXtn", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId '2GIZtqBL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'AjTbDnSt' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'cAsfusvw' \
    --body '{"contentType": "7Ztvpuag", "description": "bBhAX2de", "localeCode": "Ln9NvFoY"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'mCxxwbaE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'g7zRcB6v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "OZc23F6g", "attachmentLocation": "8d3e44xg", "attachmentVersionIdentifier": "cuPV4Yyg", "contentType": "WCIeR5K0", "description": "jJau2Xlr"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'iCjkWAIE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "rsZnmlCl", "contentType": "RTs04U9W"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'ID1CAqUp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'VmZ1EFRC' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'IYqtcaYw' \
    --body '{"description": "YKXEHSoW", "displayVersion": "nlNs3Q8v", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '5oBXy4b0' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'p0A3n7tO' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'SzjZmVKI' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'nWpnvL3J' \
    --body '{"countries": ["mQM8D3pr", "3642VLTb", "DV7DXyUv"], "countryGroupName": "mUAT4dvp", "description": "dsO68NNS", "isDefaultOpted": true, "isMandatory": true, "policyName": "66sjJKlc", "readableId": "vcE91des", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'r1fQKhqt' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId '8Me4vpGO' \
    --versionId 'sQfSmL4t' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'TautxmrY' \
    --body '{"description": "JTC1SlIW", "displayVersion": "NTMcuEym", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '6' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQE4Jobv' \
    --publisherUserId '78JUnaip' \
    --clientId 'vljpzdE9' \
    --countryCode 'UeOPB2xd' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "zpucYGjQ", "policyId": "8SIBesMs", "policyVersionId": "kpXALZ41"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "f3l6e9yF", "policyId": "Vvk6FGn7", "policyVersionId": "4nI23CxG"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "pbBPiLpC", "policyId": "Sn6OPgdA", "policyVersionId": "gnQf8qW1"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPGazTwZ' \
    --publisherUserId 'yd1QmlVe' \
    --clientId 'I2WHE2s8' \
    --countryCode 'iEYNvBPm' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
eval_tap 0 48 'RetrievePolicies # SKIP deprecated' test.out

#- 49 OldUpdatePolicyVersion
eval_tap 0 49 'OldUpdatePolicyVersion # SKIP deprecated' test.out

#- 50 OldPublishPolicyVersion
eval_tap 0 50 'OldPublishPolicyVersion # SKIP deprecated' test.out

#- 51 OldUpdatePolicy
eval_tap 0 51 'OldUpdatePolicy # SKIP deprecated' test.out

#- 52 OldSetDefaultPolicy
eval_tap 0 52 'OldSetDefaultPolicy # SKIP deprecated' test.out

#- 53 OldRetrieveSinglePolicyVersion
eval_tap 0 53 'OldRetrieveSinglePolicyVersion # SKIP deprecated' test.out

#- 54 OldCreatePolicyVersion
eval_tap 0 54 'OldCreatePolicyVersion # SKIP deprecated' test.out

#- 55 OldRetrieveAllPolicyTypes
eval_tap 0 55 'OldRetrieveAllPolicyTypes # SKIP deprecated' test.out

#- 56 GetUserInfoStatus
eval_tap 0 56 'GetUserInfoStatus # SKIP deprecated' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'oTgt6Iyt' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "ANPlMt2r", "policyId": "V5tlKdZD", "policyVersionId": "fuYbQdQf"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "bGGEeYal", "policyId": "kuE1DT1x", "policyVersionId": "qG4ls7NY"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "9EDLvX1n", "policyId": "yTDOOHAf", "policyVersionId": "TFqzWuU4"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'HQgIEeEB' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "KYONUisq", "policyId": "wSHNrz8e", "policyVersionId": "gp1bvPZJ"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "pTkh7Lpv", "policyId": "LriEEm7l", "policyVersionId": "AESqdNIR"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "zzYmLFKR", "policyId": "lcsCvP11", "policyVersionId": "iD7AaT5h"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkAcceptVersionedPolicy' test.out

#- 64 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 64 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 65 PublicIndirectBulkAcceptVersionedPolicy
eval_tap 0 65 'PublicIndirectBulkAcceptVersionedPolicy # SKIP deprecated' test.out

#- 66 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'RetrieveEligibilitiesPublic' test.out

#- 67 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'WGAkfCxc' \
    --countryCode '3tqa4yrw' \
    --namespace "$AB_NAMESPACE" \
    --userId '2kSkw5Yq' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '2afkERbA' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'BgPHBluJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'OLD7FCqK' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags '85HJvxvT' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'dEqRxV0Y' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'EJfpSlI4' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'UCETtvO3' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'wMmBHDHt' \
    --namespace "$AB_NAMESPACE" \
    --clientId 'HAvE88He' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
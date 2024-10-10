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
echo "1..67"

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
    --userId 'FoE9A4aJ' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "8cN3141U", "policyId": "LYYh4mAm", "policyVersionId": "pfNk9C29"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "rSMIqA5b", "policyId": "KglOAzIc", "policyVersionId": "78FZGsGI"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "NEJY6DSp", "policyId": "krFblwI4", "policyVersionId": "JyGYD6TZ"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'BM4QwQo3' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'JJ6SjQO6' \
    --limit '99' \
    --offset '33' \
    --policyVersionId 'Iqqr9Ygd' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["re8F7vY4", "3jzTyYU6", "jQ4u5Gt4"], "affectedCountries": ["CuTbt8LP", "kIgxQ20Y", "wseihhS2"], "basePolicyName": "QZKsuEfN", "description": "ZLlcbwJ1", "isHidden": true, "isHiddenPublic": false, "namespace": "A4nzDb9y", "tags": ["7Cug38iC", "LgVFA9Ep", "TidaRV7C"], "typeId": "fUcBzNr7"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'H260KeEz' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'kg4dx3KE' \
    --body '{"affectedClientIds": ["kppGvTXr", "lhJFQnT9", "rhZjWmz9"], "affectedCountries": ["GrEugwdi", "LFp7x6oK", "uWwR4H1s"], "basePolicyName": "buRmycRc", "description": "5ClAT1I4", "isHidden": true, "isHiddenPublic": true, "namespace": "cktXqwUL", "tags": ["TJ4uxR7U", "bG9zgjJP", "bcj1MeQn"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'x2KfNJ9O' \
    --countryCode 'fjiH1XwT' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId '6WOpIl1J' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'MO6La76Z' \
    --body '{"contentType": "m1adGnNT", "description": "XayakZK4", "localeCode": "5hvL5p5c"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'MBKltChN' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'sxgMmPSz' \
    --body '{"attachmentChecksum": "eA2isjyI", "attachmentLocation": "7IjVtLeN", "attachmentVersionIdentifier": "AVqfA0Lp", "contentType": "uTVsyydn", "description": "tU49NzHs"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'Ftodyo3k' \
    --body '{"contentMD5": "fMyTVKXF", "contentType": "GDpAJQe9"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId '9nvkH8AB' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["XDbHbd6z", "sHjwf5Hg", "bPgai8zZ"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9Wb97RQ' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'NS1FoHHw' \
    --limit '86' \
    --offset '43' \
    --policyVersionId 'HiwwyATX' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'aVSF5Pjl' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end '11DTLrak' \
    --policyVersionId 'vU5MUlTU' \
    --start 'Rb6XHBAR' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy1
./ng net.accelbyte.sdk.cli.Main legal createPolicy1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["pXHuYwI5", "pNIaHAgw", "5wyvU1Zx"], "affectedCountries": ["yYs31r0E", "6JnluP5f", "ddLDtFZ4"], "basePolicyName": "ALwmlWz7", "description": "iJKguxs2", "isHidden": false, "isHiddenPublic": true, "tags": ["7NYpPmri", "Brt73omV", "Nlacfw8w"], "typeId": "LPomjQIQ"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy1' test.out

#- 23 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'P7oCl2hu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy1' test.out

#- 24 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'SS23fQb4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["T9ff75Aq", "3w5pjpCa", "lAiutlpz"], "affectedCountries": ["MtVL2gHZ", "zuMrfDlk", "dMH4ctuQ"], "basePolicyName": "PFyc9mbi", "description": "EEfymM4X", "isHidden": true, "isHiddenPublic": true, "tags": ["urUuiV8O", "yWJTTBhM", "1ZsNaprV"]}' \
    > test.out 2>&1
eval_tap $? 24 'PartialUpdatePolicy1' test.out

#- 25 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'gm5vKZOI' \
    --countryCode 'Fs6kHgfM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'RetrievePolicyCountry1' test.out

#- 26 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'h8GZnhWV' \
    > test.out 2>&1
eval_tap $? 26 'RetrieveLocalizedPolicyVersions1' test.out

#- 27 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'K6mzDHl5' \
    --body '{"contentType": "ZS5F5Cnj", "description": "JHmDMACu", "localeCode": "v7TkjJjo"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateLocalizedPolicyVersion1' test.out

#- 28 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'YIMsC6jA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 29 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'I167WaDV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "zElhVq1I", "attachmentLocation": "ThGzGKtx", "attachmentVersionIdentifier": "6evBvIDA", "contentType": "VTUUrVFr", "description": "cqZ18z02"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateLocalizedPolicyVersion1' test.out

#- 30 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'n19GD1A8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "F9CyueC5", "contentType": "9OU3yTf0"}' \
    > test.out 2>&1
eval_tap $? 30 'RequestPresignedURL1' test.out

#- 31 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'vU9q8qHE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'SetDefaultPolicy1' test.out

#- 32 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'e2cNTwUG' \
    --body '{"description": "BTx43Tn5", "displayVersion": "HCDTqn1h", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePolicyVersion1' test.out

#- 33 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'f5SyvnKr' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 33 'PublishPolicyVersion1' test.out

#- 34 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'fxz9dELG' \
    --body '{"description": "gvA0X7Ic", "isDefaultOpted": true, "isMandatory": false, "policyName": "JxsjY1X6", "readableId": "6ispfNaK", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePolicy1' test.out

#- 35 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId '4Bvoqev5' \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultPolicy3' test.out

#- 36 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId '4tjwlviy' \
    --versionId 'GjLh5xtW' \
    > test.out 2>&1
eval_tap $? 36 'RetrieveSinglePolicyVersion1' test.out

#- 37 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'a5M6gA91' \
    --body '{"description": "eSxx6v81", "displayVersion": "gpFT05ub", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'CreatePolicyVersion1' test.out

#- 38 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '34' \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveAllPolicyTypes1' test.out

#- 39 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId '7XQ0L5Kx' \
    --publisherUserId 'Prsdc6Ej' \
    --clientId 'cM98veQT' \
    --countryCode 'qyFLAyLI' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "KWQQGlKC", "policyId": "CkSQQBcK", "policyVersionId": "XPO2KBtq"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "pHXocZAS", "policyId": "sN9JC6OZ", "policyVersionId": "eAgJvbtV"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "CHzo6WkU", "policyId": "fKA2Ljzo", "policyVersionId": "qkK5o6Sy"}]' \
    > test.out 2>&1
eval_tap $? 39 'IndirectBulkAcceptVersionedPolicy' test.out

#- 40 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHiOGOQh' \
    --publisherUserId 'IbGeoywn' \
    --clientId 'VPVqwgoa' \
    --countryCode 'krX0fMWH' \
    > test.out 2>&1
eval_tap $? 40 'AdminRetrieveEligibilities' test.out

#- 41 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'd9or2M4W' \
    > test.out 2>&1
eval_tap $? 41 'RetrievePolicies' test.out

#- 42 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'gbHFS0C4' \
    --body '{"description": "gAPXY2n9", "displayVersion": "lzxmk9rE", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePolicyVersion' test.out

#- 43 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'jvUoNVM4' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 43 'PublishPolicyVersion' test.out

#- 44 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'jIoNHquE' \
    --body '{"description": "nNeFoT7G", "isDefaultOpted": true, "isMandatory": false, "policyName": "XXw0JGnv", "readableId": "tDUvovKq", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 44 'UpdatePolicy' test.out

#- 45 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId '6EfdMxMt' \
    > test.out 2>&1
eval_tap $? 45 'SetDefaultPolicy2' test.out

#- 46 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'lHQwo5r9' \
    --versionId 'HU9ywKTW' \
    > test.out 2>&1
eval_tap $? 46 'RetrieveSinglePolicyVersion' test.out

#- 47 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'AzYGgZyu' \
    --body '{"description": "4jVTmI3g", "displayVersion": "V9BYBVEH", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 47 'CreatePolicyVersion' test.out

#- 48 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '72' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 48 'RetrieveAllPolicyTypes' test.out

#- 49 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'qUH6t2kq' \
    > test.out 2>&1
eval_tap $? 49 'GetUserInfoStatus' test.out

#- 50 SyncUserInfo
eval_tap 0 50 'SyncUserInfo # SKIP deprecated' test.out

#- 51 InvalidateUserInfoCache
eval_tap 0 51 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 52 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'wWiOsAsa' \
    > test.out 2>&1
eval_tap $? 52 'AnonymizeUserAgreement' test.out

#- 53 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "EeiZwW4c", "policyId": "ClU6bAKh", "policyVersionId": "GXnkAsbi"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "btSTyhaW", "policyId": "fuN5ggjH", "policyVersionId": "7xhmXPtk"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "5884V5hr", "policyId": "3md38dRC", "policyVersionId": "OFEjKAT4"}]' \
    > test.out 2>&1
eval_tap $? 53 'ChangePreferenceConsent1' test.out

#- 54 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'hdhonwut' \
    > test.out 2>&1
eval_tap $? 54 'AcceptVersionedPolicy' test.out

#- 55 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 55 'RetrieveAgreementsPublic' test.out

#- 56 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "VxleVE7O", "policyId": "x6UjxyIC", "policyVersionId": "mu32tust"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Ygv4XbYs", "policyId": "KQ4SFrLr", "policyVersionId": "fDZyoUh2"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "UXgYX7Jh", "policyId": "QNvizVxi", "policyVersionId": "bLUaRdIV"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkAcceptVersionedPolicy' test.out

#- 57 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 57 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 58 IndirectBulkAcceptVersionedPolicy1
eval_tap 0 58 'IndirectBulkAcceptVersionedPolicy1 # SKIP deprecated' test.out

#- 59 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'RetrieveEligibilitiesPublic' test.out

#- 60 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'uGX46p34' \
    --countryCode 'QPdo5v9t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1YhEoWs' \
    > test.out 2>&1
eval_tap $? 60 'RetrieveEligibilitiesPublicIndirect' test.out

#- 61 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'L0RDdvGB' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 62 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'a9WO0Ftq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 63 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 63 'RetrieveCountryListWithPolicies' test.out

#- 64 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'QCVvM9sv' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '2XokG6zE' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 64 'RetrieveLatestPolicies' test.out

#- 65 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'uY8ENnC8' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 65 'RetrieveLatestPoliciesPublic' test.out

#- 66 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'h4p13WHq' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'ybsD9GSg' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 66 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 67 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 67 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
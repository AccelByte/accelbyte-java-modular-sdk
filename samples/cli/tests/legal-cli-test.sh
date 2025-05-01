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
    --userId '2hy86dqG' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ORzz6hYi", "policyId": "bXqBlMux", "policyVersionId": "L2BROsxT"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "FsZIsxpf", "policyId": "RnANfF9e", "policyVersionId": "zhGTcKSS"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "UZUXqwe3", "policyId": "gIAXygP8", "policyVersionId": "fKvBbLK5"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId '6kFoNpfb' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword '6NwZdo6c' \
    --limit '95' \
    --offset '76' \
    --policyVersionId 'HIuVLrbG' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["NAO7XReP", "CVUq7Adt", "c3eODy1e"], "affectedCountries": ["UaKuI7z3", "DQ9QlSLc", "OgVflut5"], "basePolicyName": "FBref4V5", "countryGroupName": "ppPYxE3k", "countryType": "COUNTRY_GROUP", "description": "g8MmGs1e", "isHidden": false, "isHiddenPublic": false, "namespace": "WhJvkGnj", "tags": ["QlVLTJT4", "z2x6WOcV", "Q39rrLq5"], "typeId": "wFabaPuC"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'borsSdMQ' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'fEtDACmP' \
    --body '{"affectedClientIds": ["FVi98JYi", "9Iy6Szir", "E7veIjhx"], "affectedCountries": ["EKiFXACe", "QeyhIupp", "49QHemEA"], "basePolicyName": "l6COjntQ", "countryGroupName": "pgNDBKfg", "countryType": "COUNTRY_GROUP", "description": "xZKIGAI6", "isHidden": true, "isHiddenPublic": true, "namespace": "AtEQcR98", "tags": ["GuF6RbBh", "rU3Tcbyy", "m63rdywR"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 's0swmadP' \
    --countryCode 'IJSSCLF4' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'IOaInLSz' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'Z65C24Td' \
    --body '{"contentType": "SOsrdEgc", "description": "EXnK7KbH", "localeCode": "sQwGwqY3"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'PXmQeQWm' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId '0I4CYmpe' \
    --body '{"attachmentChecksum": "C3zgpcCL", "attachmentLocation": "WwvFCBd0", "attachmentVersionIdentifier": "wfPj0EJs", "contentType": "uhAOKVMO", "description": "PZ7oPXi9"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId '5caxJp4d' \
    --body '{"contentMD5": "H1JEDyWA", "contentType": "T0scfMeI"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'jWw0RuCs' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": true, "userIds": ["1UKJLDHm", "k6tekYFp", "is8nyuML"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdaYBArr' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'Tyo2qA4n' \
    --limit '23' \
    --offset '10' \
    --policyVersionId 'Zx4McQjR' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'Z3D9kZRM' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'Pa7FyHqr' \
    --policyVersionId 'zZAdgvnA' \
    --start 'bUSRgpiB' \
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
    --body '{"affectedClientIds": ["e2zfT2Ck", "GWGEuDaD", "iGUbCx0F"], "affectedCountries": ["Iq2nrh04", "clUniwDJ", "TP3DN7ML"], "basePolicyName": "LT2OhCx1", "countryGroupName": "kzI0270n", "countryType": "COUNTRY", "description": "1ZiQEc2i", "isHidden": true, "isHiddenPublic": true, "tags": ["9CnTjepL", "dYdUMm3S", "NEkvggnz"], "typeId": "pJqy2Mi9"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy1' test.out

#- 23 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId '2N1zOm7T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy1' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'eSQa8wj5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'kZtY4fjt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["BY4cMN7G", "AXpVq5yH", "elRheeRS"], "affectedCountries": ["ONcPstiL", "b9Z9LT5C", "yruBFq4z"], "basePolicyName": "8preGzZo", "countryGroupName": "bvPAd1lw", "countryType": "COUNTRY_GROUP", "description": "Fk4nQYQS", "isHidden": false, "isHiddenPublic": false, "tags": ["JcJ9zPAQ", "dz78WMDv", "KgutbtUN"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy1' test.out

#- 26 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'TijXJcX1' \
    --countryCode 'MDykRHXC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry1' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'BdbHOvBN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'uIeGJUq6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["lk0C9M2t", "VrIyO0mL", "Utl19VWN"], "countryCode": "RQ2TRDLP", "countryGroupName": "CU5IZr8i", "countryType": "COUNTRY_GROUP", "description": "tPcBtAYF", "isDefaultSelection": false, "isMandatory": false, "policyName": "xtI9lWBP", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId 'h8t2fv01' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'ynmV4VPQ' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions1' test.out

#- 31 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'plymKL4M' \
    --body '{"contentType": "7U89iPYJ", "description": "BX6YkSly", "localeCode": "DdElnQKn"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion1' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'vZvXAh1s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 33 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'E1jjfLTO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "2cgsqdqs", "attachmentLocation": "MjGT31qw", "attachmentVersionIdentifier": "X7FDCkTt", "contentType": "4di5LMQV", "description": "wdpf2RZ0"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion1' test.out

#- 34 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'hPVDfweS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "3qrqsdVf", "contentType": "S1jebaer"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL1' test.out

#- 35 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'iosHq1kH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultPolicy1' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '9H2drhsh' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'DPMco43K' \
    --body '{"description": "25IBqEc9", "displayVersion": "7lNXaxbO", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion1' test.out

#- 38 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'NPRxLy77' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion1' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'VIFfkciQ' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId '8IZTRTMJ' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'BXr83rGe' \
    --body '{"countries": ["nFsnUy5E", "GFaBfskI", "GnhJDg5l"], "countryGroupName": "juaLUmzv", "description": "X7c3dYmU", "isDefaultOpted": false, "isMandatory": true, "policyName": "4XbdndUg", "readableId": "eACyXDg0", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy1' test.out

#- 42 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'F84ediIx' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy3' test.out

#- 43 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Lu7AKkOn' \
    --versionId '1KSezlkw' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion1' test.out

#- 44 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'jV1Gzwwb' \
    --body '{"description": "5G2qQ3kW", "displayVersion": "F7GRDWxY", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion1' test.out

#- 45 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '36' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes1' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'uDBqiiwt' \
    --publisherUserId '3b7Xwq9U' \
    --clientId 'DAXIBzit' \
    --countryCode 'fqHcWXls' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Tklx0vco", "policyId": "QmGHw5eE", "policyVersionId": "T70K7Wpg"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "VPGLCRJC", "policyId": "zLKfIQmS", "policyVersionId": "W4tad3TT"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "A2hjiJKJ", "policyId": "vwCQaQcd", "policyVersionId": "tixt3bOc"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKOzhjOK' \
    --publisherUserId '89zb0ayy' \
    --clientId 'fxVNuYBb' \
    --countryCode '2E7cppAr' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'BLF3cbbW' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'cBPHL1qx' \
    --body '{"description": "2DMgZdb4", "displayVersion": "5uDGQV13", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePolicyVersion' test.out

#- 50 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'SnkKWByr' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'PublishPolicyVersion' test.out

#- 51 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'J3kQBchl' \
    --body '{"countries": ["tR0lJgvL", "0oIfz5pj", "MMHEsYH8"], "countryGroupName": "q2N5ILLT", "description": "HPcMAhma", "isDefaultOpted": true, "isMandatory": true, "policyName": "x6XKryZK", "readableId": "yYJFmbDn", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePolicy' test.out

#- 52 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'SIplgyIo' \
    > test.out 2>&1
eval_tap $? 52 'SetDefaultPolicy2' test.out

#- 53 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'cLfYpSeD' \
    --versionId 'XjUtwGcI' \
    > test.out 2>&1
eval_tap $? 53 'RetrieveSinglePolicyVersion' test.out

#- 54 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'Cwwa9BVM' \
    --body '{"description": "bJTKF4pN", "displayVersion": "lTTjq2Et", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 54 'CreatePolicyVersion' test.out

#- 55 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '24' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 55 'RetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'ZX1AxaaS' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'WfsIiXl1' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "FtYGSNBH", "policyId": "Y66rOCuY", "policyVersionId": "YsfHelcx"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "jrsehHdf", "policyId": "LPYi6Pao", "policyVersionId": "99SXgr3l"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "RNO5fqIE", "policyId": "nLGvKp4W", "policyVersionId": "Y8icVn1L"}]' \
    > test.out 2>&1
eval_tap $? 60 'ChangePreferenceConsent1' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'EpXu67vF' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "eOZfpRvv", "policyId": "KA2FyAUq", "policyVersionId": "8Qp0ys8e"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "yfehoKT9", "policyId": "VK7znK6e", "policyVersionId": "OaIOR6z4"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "eNqxWB0p", "policyId": "A8jgS48d", "policyVersionId": "KWmzYpUP"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkAcceptVersionedPolicy' test.out

#- 64 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 64 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 65 IndirectBulkAcceptVersionedPolicy1
eval_tap 0 65 'IndirectBulkAcceptVersionedPolicy1 # SKIP deprecated' test.out

#- 66 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'RetrieveEligibilitiesPublic' test.out

#- 67 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'fsy1X2sw' \
    --countryCode '8JonYt2N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BkLbLl9s' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId '7AKh9QaG' \
    > test.out 2>&1
eval_tap $? 68 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 69 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'SQRMzfGR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'fYb23JYF' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '3Egi5ZDk' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags '4Z1Zc1hq' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'XFOOv0v3' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '21H5ijQ3' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic1
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic1 \
    --countryCode '9vm30Xc0' \
    --namespace "$AB_NAMESPACE" \
    --clientId '8loZobEJ' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
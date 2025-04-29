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
    --userId 'bYhjDaam' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "zwgrqSoQ", "policyId": "95mr7mQd", "policyVersionId": "KVEUWNbd"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "6iJmro43", "policyId": "KRC3xyCL", "policyVersionId": "y2ZbRvHW"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "frLGcbal", "policyId": "CpjQ3WE7", "policyVersionId": "QO3VnzMX"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'srtJqv4q' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'POGlzyvf' \
    --limit '61' \
    --offset '32' \
    --policyVersionId 'vMSdwDSx' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["SH51wevG", "NPH6GO4Q", "aT7pOdAk"], "affectedCountries": ["0j5uZ6no", "URCHGoiy", "THLmHAbe"], "basePolicyName": "xcomsJ1C", "countryGroupName": "rxq68pAQ", "countryType": "COUNTRY_GROUP", "description": "gLUS9UKJ", "isHidden": false, "isHiddenPublic": true, "namespace": "oKf1q6FI", "tags": ["9gLeLgCC", "8eJl47RX", "r44EbdLu"], "typeId": "q667bOzB"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'kUv90bBd' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'XlzzkYi5' \
    --body '{"affectedClientIds": ["1H7PPk0f", "6c2DXDQv", "jhaqMXna"], "affectedCountries": ["ORFiX3KW", "33CdckMh", "f41mFby9"], "basePolicyName": "4u9kEf5T", "countryGroupName": "5PcwdaIa", "countryType": "COUNTRY", "description": "amH2jXQo", "isHidden": true, "isHiddenPublic": false, "namespace": "L9ekkHRY", "tags": ["lsS5uA0V", "ERBr2uP9", "1yVz0QYk"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'NvN8nh13' \
    --countryCode 'SsUEIkAq' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'dwydZLFw' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'ElNiEBgG' \
    --body '{"contentType": "xeAEXhpH", "description": "8dQSCUxk", "localeCode": "r9VVcypn"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'rqlvtJ7V' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'wgLbySkc' \
    --body '{"attachmentChecksum": "I8zmNwdz", "attachmentLocation": "fFSAyHig", "attachmentVersionIdentifier": "FS5QN2Zq", "contentType": "podBjGBA", "description": "9u9erdGx"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'tyLiFYHX' \
    --body '{"contentMD5": "MhFOEUmD", "contentType": "uuetYytV"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'zwftpUhn' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["spJRV9J2", "iZQ9aOjc", "fkonz60E"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHjQ0ve2' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'BLYgEhQ4' \
    --limit '37' \
    --offset '36' \
    --policyVersionId '29am8tnZ' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'GNK0H00I' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'wmOHJRHI' \
    --policyVersionId 'jImQ01c9' \
    --start 'E98Sj1mF' \
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
    --body '{"affectedClientIds": ["JDpkA2Q0", "SsNc7QbO", "rZRa6y2B"], "affectedCountries": ["vprQRcFO", "2oWjWugl", "Z5t0XIQq"], "basePolicyName": "ZvA6jcR2", "countryGroupName": "lxVb0Hvs", "countryType": "COUNTRY_GROUP", "description": "IiyVnmCA", "isHidden": true, "isHiddenPublic": false, "tags": ["ODnUdMw6", "Cr0iSwkJ", "aHcWKKwE"], "typeId": "j6R2XPuS"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy1' test.out

#- 23 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'cbZkxnTm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy1' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'CvAxzsTR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'RrMvfHlS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["GVZqSdpJ", "oXTN4WFN", "vKTWbVrq"], "affectedCountries": ["Be3IdXdC", "TEllIIYg", "rwmoD7xm"], "basePolicyName": "TJZfFMhW", "countryGroupName": "xWAkovvO", "countryType": "COUNTRY_GROUP", "description": "DvDbkVpJ", "isHidden": true, "isHiddenPublic": false, "tags": ["KDNIJS4U", "jUILUHD1", "g6i7ZZUn"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy1' test.out

#- 26 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'Bec6RHXG' \
    --countryCode 'gEEvg6uQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry1' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'RKePD1SR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'd8MbEwuB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["um8BWJJy", "NNJR50Rt", "Gy60NJGl"], "countryCode": "9HVkHDIq", "countryGroupName": "JS1lFye5", "countryType": "COUNTRY_GROUP", "description": "iHL7cFNZ", "isDefaultSelection": true, "isMandatory": true, "policyName": "ukPmBJbE", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId '9d9uSQUr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'AEZRTjtf' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions1' test.out

#- 31 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'xaTQ5hVX' \
    --body '{"contentType": "B5tGTmPY", "description": "MvcDls3x", "localeCode": "dpgsshKr"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion1' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'o9Y6gece' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 33 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'QobdncBc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "f8zJjVEI", "attachmentLocation": "a1m4vfsp", "attachmentVersionIdentifier": "VuuMlSca", "contentType": "1NGCvtVP", "description": "2X6AYZFD"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion1' test.out

#- 34 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'EE1NIU7N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "MSFl9Bo4", "contentType": "yCJnNnSe"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL1' test.out

#- 35 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'etpSw7lF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultPolicy1' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'QleuFnTp' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'nilPnnKk' \
    --body '{"description": "LHH21fc4", "displayVersion": "kryZYUUA", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion1' test.out

#- 38 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '2loHsZjb' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion1' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'wFknkQFC' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'dUD0hGJ3' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'GHVxcB1q' \
    --body '{"countries": ["ggFg3GsP", "GGuynqgf", "jTIitD9P"], "countryGroupName": "KvEfTdla", "description": "DvqlJuhV", "isDefaultOpted": true, "isMandatory": true, "policyName": "0SffsKRu", "readableId": "y5snjCNJ", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy1' test.out

#- 42 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'z8idmvEy' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy3' test.out

#- 43 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'VfusdeHl' \
    --versionId 'zxmVa83j' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion1' test.out

#- 44 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId '3sOfoYGJ' \
    --body '{"description": "ytTYNYh5", "displayVersion": "CSCZlFWt", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion1' test.out

#- 45 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '7' \
    --limit '68' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes1' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHJlNMgd' \
    --publisherUserId 'pEj4occw' \
    --clientId '9xbrhshh' \
    --countryCode 'VC2Oq4gk' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "OnH89M7n", "policyId": "kVpBoMpN", "policyVersionId": "boyl5bjr"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Y08IKG5I", "policyId": "SIBGPTmi", "policyVersionId": "R6twL7iO"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "ARnfy0Q5", "policyId": "TK2HwsBA", "policyVersionId": "bEaDgvfY"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId '1FFzEKFg' \
    --publisherUserId '7J8Czfrg' \
    --clientId 'G0ELc5Hk' \
    --countryCode '7kdTmodH' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'YNfVBwIF' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'XmFxRDpi' \
    --body '{"description": "SjqGm0Dl", "displayVersion": "bWOqOviX", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePolicyVersion' test.out

#- 50 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'hNOniNq1' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'PublishPolicyVersion' test.out

#- 51 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'JsMiyMDq' \
    --body '{"countries": ["eKfqLrLW", "pHUrN2Tc", "gspgvmno"], "countryGroupName": "LknD5G5L", "description": "gvenL558", "isDefaultOpted": false, "isMandatory": false, "policyName": "AtKNixjP", "readableId": "lvrygZPw", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePolicy' test.out

#- 52 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'L3wDaQUr' \
    > test.out 2>&1
eval_tap $? 52 'SetDefaultPolicy2' test.out

#- 53 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'YmKJEr1z' \
    --versionId 'To97nvS9' \
    > test.out 2>&1
eval_tap $? 53 'RetrieveSinglePolicyVersion' test.out

#- 54 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId '78u7tJMl' \
    --body '{"description": "3QvK343O", "displayVersion": "OPyk6liI", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 54 'CreatePolicyVersion' test.out

#- 55 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '53' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 55 'RetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'hLZGbQr7' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'kfWFUsqr' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "YfSVf0Yv", "policyId": "rL2vMom7", "policyVersionId": "tE7FcrDl"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "4AfMnAAV", "policyId": "3kQqNJt5", "policyVersionId": "i7SKPMt8"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "H4xlNhZX", "policyId": "MJHN8SrT", "policyVersionId": "FvAapUOl"}]' \
    > test.out 2>&1
eval_tap $? 60 'ChangePreferenceConsent1' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'EiovQtSv' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "xV4za9Nv", "policyId": "LgDsA18i", "policyVersionId": "fO1XfrZu"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "a71Y6sUE", "policyId": "NkwNbTvz", "policyVersionId": "7k4x3V96"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "otssLZQJ", "policyId": "QASTiwNO", "policyVersionId": "xnozQlO8"}]' \
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
    --clientId 'yy12YGnb' \
    --countryCode 'GbvOpOLK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'smKra3oe' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'dt7KB7r7' \
    > test.out 2>&1
eval_tap $? 68 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 69 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId '7ujAKCA1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'w1VG6ypv' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'FVZGtW0g' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'lyWpvYiy' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'jzaOdNRQ' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'rpw9nLBC' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic1
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic1 \
    --countryCode 'BBr2UcBP' \
    --namespace "$AB_NAMESPACE" \
    --clientId 'X0eDmbtL' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
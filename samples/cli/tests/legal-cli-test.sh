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
    --userId 'UPHlVkEa' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "li29kTSJ", "policyId": "MXAeaBGq", "policyVersionId": "snKzIW3q"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "oNRK6nar", "policyId": "WZWuiD2i", "policyVersionId": "4DfhVhN6"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GJzfUS8G", "policyId": "lMcU9ED7", "policyVersionId": "A3WcYRti"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 OldRetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAcceptedAgreements \
    --userId 'EWVSl6rK' \
    > test.out 2>&1
eval_tap $? 3 'OldRetrieveAcceptedAgreements' test.out

#- 4 OldRetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllUsersByPolicyVersion \
    --keyword 'ggFWyJyA' \
    --limit '32' \
    --offset '60' \
    --policyVersionId '07EuFmH4' \
    > test.out 2>&1
eval_tap $? 4 'OldRetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 OldCreatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicy \
    --body '{"affectedClientIds": ["FDJzX4Gh", "EzwbPs2B", "Bj28RT5L"], "affectedCountries": ["uRzvY0oC", "WsePR84h", "MoBwOZ0M"], "basePolicyName": "qDsDqicJ", "countryGroupName": "MbbiTca0", "countryType": "COUNTRY_GROUP", "description": "OBoyTngN", "isHidden": true, "isHiddenPublic": false, "namespace": "xSriGFqe", "tags": ["mmhu4Qnr", "Ntw9BPWF", "igTeCt6k"], "typeId": "NTRKf2AO"}' \
    > test.out 2>&1
eval_tap $? 6 'OldCreatePolicy' test.out

#- 7 OldRetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicy \
    --basePolicyId 'q2i8RqsK' \
    > test.out 2>&1
eval_tap $? 7 'OldRetrieveSinglePolicy' test.out

#- 8 OldPartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldPartialUpdatePolicy \
    --basePolicyId 'ETij3CAC' \
    --body '{"affectedClientIds": ["XLej9CdT", "nvsWW2M5", "Ik7rc8bu"], "affectedCountries": ["V2PrhvGO", "4vwMK1t2", "45DtSccx"], "basePolicyName": "ln4qyUjc", "countryGroupName": "B18TVAtB", "countryType": "COUNTRY_GROUP", "description": "ajgpLmgW", "isHidden": true, "isHiddenPublic": true, "namespace": "hZMEAftx", "tags": ["1ms3oY9v", "uVwejpFT", "9BVkLAGV"]}' \
    > test.out 2>&1
eval_tap $? 8 'OldPartialUpdatePolicy' test.out

#- 9 OldRetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal oldRetrievePolicyCountry \
    --basePolicyId 'nVXffXWM' \
    --countryCode 'taERG3MA' \
    > test.out 2>&1
eval_tap $? 9 'OldRetrievePolicyCountry' test.out

#- 10 OldRetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLocalizedPolicyVersions \
    --policyVersionId 'YVlsRxhG' \
    > test.out 2>&1
eval_tap $? 10 'OldRetrieveLocalizedPolicyVersions' test.out

#- 11 OldCreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreateLocalizedPolicyVersion \
    --policyVersionId 'cWlqwmY3' \
    --body '{"contentType": "cXxQa9wR", "description": "RVpPCer9", "localeCode": "PtyYGPjw"}' \
    > test.out 2>&1
eval_tap $? 11 'OldCreateLocalizedPolicyVersion' test.out

#- 12 OldRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '0XK9opk2' \
    > test.out 2>&1
eval_tap $? 12 'OldRetrieveSingleLocalizedPolicyVersion' test.out

#- 13 OldUpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'klcZwZqM' \
    --body '{"attachmentChecksum": "7FapajFu", "attachmentLocation": "8ixjgy5H", "attachmentVersionIdentifier": "rVCKWgAu", "contentType": "DdpnqFc8", "description": "Iflcfa2Z"}' \
    > test.out 2>&1
eval_tap $? 13 'OldUpdateLocalizedPolicyVersion' test.out

#- 14 OldRequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal oldRequestPresignedURL \
    --localizedPolicyVersionId 'QQV5fFJg' \
    --body '{"contentMD5": "3pcMtDFS", "contentType": "ydBiM465"}' \
    > test.out 2>&1
eval_tap $? 14 'OldRequestPresignedURL' test.out

#- 15 OldSetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'UR6qqQPn' \
    > test.out 2>&1
eval_tap $? 15 'OldSetDefaultLocalizedPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": true, "userIds": ["ywhRdsKf", "X1PrQwdQ", "zupna562"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --namespace "$AB_NAMESPACE" \
    --userId '7m0qCYy3' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements' test.out

#- 18 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'R8lTAwu7' \
    --limit '38' \
    --offset '0' \
    --policyVersionId 'hN6YTacn' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId '2Q71FRBD' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'WfXU1muF' \
    --policyVersionId 'HVPjINku' \
    --start 'BmrPVGyd' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["DGUxyIuU", "hsw7CcOH", "JM1gWwza"], "affectedCountries": ["9tfdZciv", "n1WTtFS5", "22MmvsJn"], "basePolicyName": "hQm8Nyc0", "countryGroupName": "duQkV0Aa", "countryType": "COUNTRY_GROUP", "description": "4rVB1GzF", "isHidden": false, "isHiddenPublic": true, "tags": ["oyACJhzz", "l8QVUK9P", "uTonjZes"], "typeId": "wkV4RrJz"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'N4s4dZ0H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'h3CjsMam' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'CvVkr3A2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["B2Mr46YQ", "g5KzGKsq", "o9AYz0IN"], "affectedCountries": ["wwy7U9UM", "YB4pqyiX", "9oZXSjPP"], "basePolicyName": "BPPntpQ9", "countryGroupName": "3iUvi9iC", "countryType": "COUNTRY_GROUP", "description": "OytWML4B", "isHidden": false, "isHiddenPublic": false, "tags": ["bAeftTHm", "HJyVb5m7", "pB35cVSJ"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId '3nlfJmjs' \
    --countryCode 'JGDp1hPq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'g1rUXqCM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'C1LGe0II' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["GkxBXTDn", "MuVfNeeq", "8R0zwLrs"], "countryCode": "JwOlNsfQ", "countryGroupName": "PxlU5lbU", "countryType": "COUNTRY", "description": "zEcKg5AC", "isDefaultSelection": true, "isMandatory": false, "policyName": "tyaOGu9v", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId 'JHols5w0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'frqQA6rp' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'eM6qW0WW' \
    --body '{"contentType": "eEsK2OjS", "description": "moyEwy23", "localeCode": "wXttqN6y"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '4KS9xQ1P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'tm33e1RR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "ExSKwnIU", "attachmentLocation": "M8yE9BsO", "attachmentVersionIdentifier": "CkTgs25i", "contentType": "yZHyUKlP", "description": "CLqVpIs1"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'TB7jt48H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "OTH6kjx2", "contentType": "8ye4mKvC"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'E0K81SrZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'WFrY4NZd' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'LqAJRzdu' \
    --body '{"description": "13R0GOrk", "displayVersion": "j8vqzZ5a", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'wLZOxlQa' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'nYi0PWPZ' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId '4Z0LxfL1' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'VstbFzFS' \
    --body '{"countries": ["yZz1zlqH", "Imyvgpp4", "7Cur8qVi"], "countryGroupName": "zjVddagM", "description": "wOlQf3hS", "isDefaultOpted": true, "isMandatory": false, "policyName": "JOAadmKT", "readableId": "288mJsdB", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId '1ts5uZwr' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'iABsWodJ' \
    --versionId 'oSPzQ6GN' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'PgDKvY0o' \
    --body '{"description": "KUmZ0qzI", "displayVersion": "ywqQMSR6", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '92' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId '839vG0uY' \
    --publisherUserId 'aOSShUxb' \
    --clientId 'cChss9Os' \
    --countryCode 'TAOcRv7X' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "mPl9TQGX", "policyId": "uM9uqlfk", "policyVersionId": "1ejvQqti"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "lr5LQw42", "policyId": "cmz3j7SS", "policyVersionId": "wbJezuF5"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "pjZZZpbH", "policyId": "Us51H1i4", "policyVersionId": "BYaTYeeu"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ziRpkolC' \
    --publisherUserId 'O9jnPr9q' \
    --clientId 'AZHW4RlY' \
    --countryCode 'DyHRcYjl' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode '4f7pXl51' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 OldUpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicyVersion \
    --policyVersionId 'vAwknjnZ' \
    --body '{"description": "FmTzKVu8", "displayVersion": "KlUjYk6W", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 49 'OldUpdatePolicyVersion' test.out

#- 50 OldPublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublishPolicyVersion \
    --policyVersionId 'dKCt4ZOD' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'OldPublishPolicyVersion' test.out

#- 51 OldUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicy \
    --policyId 'GVuyvnoy' \
    --body '{"countries": ["LUjDJ9pE", "BI3hgCCJ", "NwulGpu6"], "countryGroupName": "PWFD6Kju", "description": "Ql8aaFVC", "isDefaultOpted": false, "isMandatory": false, "policyName": "jeWXhR6X", "readableId": "BCN3gLAB", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 51 'OldUpdatePolicy' test.out

#- 52 OldSetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultPolicy \
    --policyId 'WStLT3xT' \
    > test.out 2>&1
eval_tap $? 52 'OldSetDefaultPolicy' test.out

#- 53 OldRetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicyVersion \
    --policyId 'TmVHiofa' \
    --versionId 'pLBYy2oC' \
    > test.out 2>&1
eval_tap $? 53 'OldRetrieveSinglePolicyVersion' test.out

#- 54 OldCreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicyVersion \
    --policyId 'Wzag1tGU' \
    --body '{"description": "wh4vqjVX", "displayVersion": "rhoPP2f3", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 54 'OldCreatePolicyVersion' test.out

#- 55 OldRetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllPolicyTypes \
    --offset '58' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 55 'OldRetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'hbxYX4yV' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'uEnsCRgg' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "cfK3E032", "policyId": "72XdaMLn", "policyVersionId": "UQleH2QQ"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "SL9pGVBt", "policyId": "9Qx3GZ8A", "policyVersionId": "CbinxaZP"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "mgC9ibGz", "policyId": "WvF7Hyyn", "policyVersionId": "QdlSJ2o0"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'AZALMG30' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GVq0h17m", "policyId": "bFD2yyiW", "policyVersionId": "szybOZek"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "JfNfyGQF", "policyId": "IX3HaSAM", "policyVersionId": "vtkSoH5T"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "0M9eDFXz", "policyId": "jgT7bRhS", "policyVersionId": "QkvkKS75"}]' \
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
    --clientId '09SKtw2l' \
    --countryCode 'Om4dDMxk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l1j4S1ti' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'c4m1ZGYG' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'Iy1bEsu0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'icfUGARQ' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'zalycxCb' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '0Pvb6mAz' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'G2TVhuu0' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'IxTioFVV' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'xeBWqCVc' \
    --namespace "$AB_NAMESPACE" \
    --clientId 'lCrZRPY5' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
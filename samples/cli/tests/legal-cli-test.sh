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
    --userId 'tnBeRpOk' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "oPkiWp0r", "policyId": "FCRaxMpj", "policyVersionId": "9N2C5LyZ"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "bY3QJzOg", "policyId": "vOfRRSSP", "policyVersionId": "A9eL430P"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GUAyBcKV", "policyId": "uYolzVF8", "policyVersionId": "5H99v0Al"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 OldRetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAcceptedAgreements \
    --userId 'SWwrrqOc' \
    > test.out 2>&1
eval_tap $? 3 'OldRetrieveAcceptedAgreements' test.out

#- 4 OldRetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllUsersByPolicyVersion \
    --keyword 'ny7BcD5i' \
    --limit '34' \
    --offset '32' \
    --policyVersionId 'Ct8ehVk9' \
    > test.out 2>&1
eval_tap $? 4 'OldRetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 OldCreatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicy \
    --body '{"affectedClientIds": ["PuCCU67A", "ApOEeVSw", "DW8n4cOe"], "affectedCountries": ["tMRwv2w2", "nHkRlXVg", "VB5LiVhj"], "basePolicyName": "aeIJ6Ibm", "countryGroupName": "ZRtKPmyN", "countryType": "COUNTRY_GROUP", "description": "9nciTO8p", "isHidden": true, "isHiddenPublic": true, "namespace": "yCKfLsWG", "tags": ["MqN5DZ6M", "KNWxWIvS", "OqtMKtGI"], "typeId": "FIdUlSQV"}' \
    > test.out 2>&1
eval_tap $? 6 'OldCreatePolicy' test.out

#- 7 OldRetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicy \
    --basePolicyId 'ClmiSH9w' \
    > test.out 2>&1
eval_tap $? 7 'OldRetrieveSinglePolicy' test.out

#- 8 OldPartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldPartialUpdatePolicy \
    --basePolicyId 'rcs6LmOP' \
    --body '{"affectedClientIds": ["RT77k3PA", "YKXkWr0p", "489dN7i9"], "affectedCountries": ["2CMgIyg3", "vwbTEofu", "8qtWJlML"], "basePolicyName": "UL7LOR0Y", "countryGroupName": "UOCUWrOS", "countryType": "COUNTRY", "description": "wqKyN6id", "isHidden": false, "isHiddenPublic": false, "namespace": "ENXG2UPp", "tags": ["Kw50WtML", "6P7Nfpg4", "33VDn1Wy"]}' \
    > test.out 2>&1
eval_tap $? 8 'OldPartialUpdatePolicy' test.out

#- 9 OldRetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal oldRetrievePolicyCountry \
    --basePolicyId '0tPNIi3F' \
    --countryCode 'gOFGC2SR' \
    > test.out 2>&1
eval_tap $? 9 'OldRetrievePolicyCountry' test.out

#- 10 OldRetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLocalizedPolicyVersions \
    --policyVersionId 'WaVGp7Cr' \
    > test.out 2>&1
eval_tap $? 10 'OldRetrieveLocalizedPolicyVersions' test.out

#- 11 OldCreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreateLocalizedPolicyVersion \
    --policyVersionId 'Ig9cLbQU' \
    --body '{"contentType": "86SWE2xG", "description": "gRQJiNCo", "localeCode": "adRkSwb1"}' \
    > test.out 2>&1
eval_tap $? 11 'OldCreateLocalizedPolicyVersion' test.out

#- 12 OldRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'OmaK0F6B' \
    > test.out 2>&1
eval_tap $? 12 'OldRetrieveSingleLocalizedPolicyVersion' test.out

#- 13 OldUpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'yBebKopm' \
    --body '{"attachmentChecksum": "zK0iLNNS", "attachmentLocation": "uMJpQiOr", "attachmentVersionIdentifier": "QBX58fPo", "contentType": "97OUHAHF", "description": "yXBtIPPM"}' \
    > test.out 2>&1
eval_tap $? 13 'OldUpdateLocalizedPolicyVersion' test.out

#- 14 OldRequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal oldRequestPresignedURL \
    --localizedPolicyVersionId 'wsVmF0hz' \
    --body '{"contentMD5": "jW57isHO", "contentType": "NXd223EX"}' \
    > test.out 2>&1
eval_tap $? 14 'OldRequestPresignedURL' test.out

#- 15 OldSetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'sz15Ecwi' \
    > test.out 2>&1
eval_tap $? 15 'OldSetDefaultLocalizedPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["n5ZUsCz9", "7VFKBM2x", "G0bWft2U"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSibL4de' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements' test.out

#- 18 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'dYKI4dVP' \
    --limit '93' \
    --offset '42' \
    --policyVersionId 'Amy5qmZQ' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'j9wcPeW4' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'ygvbpHym' \
    --policyVersionId 'QxfPORW7' \
    --start '6IQ2EeXR' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '25' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["ZeMZ7wrG", "Jbn2TqKt", "SPMC46Gy"], "affectedCountries": ["8qViZoM6", "NbWqjwak", "RCjTi8fW"], "basePolicyName": "kr3SU9EA", "countryGroupName": "nJj7kOM1", "countryType": "COUNTRY", "description": "1d3F947a", "isHidden": false, "isHiddenPublic": false, "tags": ["NmqiVPBT", "qZDEHlyu", "trUpsLW8"], "typeId": "f8IvrcjO"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId '1eH7LGIg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'rkLJXKHg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'sBywJHVU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["QoaHIGWa", "t3m3quXs", "bFSmwm4R"], "affectedCountries": ["OnRdGYJy", "X0pBlo2Z", "MmCfgF51"], "basePolicyName": "HKCLsAi4", "countryGroupName": "FxRL9DDM", "countryType": "COUNTRY", "description": "zGyfCswm", "isHidden": true, "isHiddenPublic": false, "tags": ["ta35sujc", "rZkxlcZm", "ioqPTnVK"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'zOeUSEaB' \
    --countryCode 'OiVfmnZL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'jPSEUfzC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'q2ytqNh4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["fN0NJmBA", "XL4NhBzt", "PudmsBPg"], "countryCode": "fega56Hh", "countryGroupName": "k79Ilq4Z", "countryType": "COUNTRY", "description": "INeBrFVD", "isDefaultSelection": false, "isMandatory": true, "policyName": "ge0YzjaH", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId '3ybqt8yc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'RQPdBMwo' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '9HwvWCt4' \
    --body '{"contentType": "HyHO8ens", "description": "h3p14Pd3", "localeCode": "aC3RLpBA"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'jPWiXDhD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'BBbsn3FR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "p2VD8c67", "attachmentLocation": "NcUhXhUQ", "attachmentVersionIdentifier": "prsRlDgv", "contentType": "3GZZcEUX", "description": "6UQa2272"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'X8klx9IZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "UXGG6axl", "contentType": "bIMd31kD"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'cdqQUWI0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'ATml86az' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'AhWTIDD3' \
    --body '{"description": "y9JIoLwO", "displayVersion": "I2Vl2orZ", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '6poJoQYg' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'nuQPF20a' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'xN9bNYxE' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'KnpWUEIr' \
    --body '{"countries": ["kLFzRoBL", "qjX0Ko8W", "LmZvEFCj"], "countryGroupName": "DK5bNnHX", "description": "zrFztr1D", "isDefaultOpted": false, "isMandatory": false, "policyName": "0F91sQ91", "readableId": "1CO1Q4Xs", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Owq1e96i' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId '5llEyAF3' \
    --versionId 'M16dhPgd' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'H5eGJlhk' \
    --body '{"description": "Kx5jJVzM", "displayVersion": "8B9RK0AC", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '38' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId '0iHRNDhP' \
    --publisherUserId 'TDaORrmC' \
    --clientId 'VWsYYbCm' \
    --countryCode 'LP86nJa6' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "TwHkq7lG", "policyId": "NIUsaSJV", "policyVersionId": "ur2mmk5F"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "QDug5gQm", "policyId": "clJgu0tE", "policyVersionId": "vTtaZNPm"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "f9UPgpTE", "policyId": "NHuOV3ce", "policyVersionId": "KL7ux1ix"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2YbAZ3W' \
    --publisherUserId 'V99Ejoaz' \
    --clientId 'NU5g2fng' \
    --countryCode 'ZTrnQ7Ry' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'b3wWO9tk' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 OldUpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicyVersion \
    --policyVersionId 'wiz0XJ80' \
    --body '{"description": "lfP89Lhh", "displayVersion": "1lI6S1cu", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 49 'OldUpdatePolicyVersion' test.out

#- 50 OldPublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublishPolicyVersion \
    --policyVersionId 'XcH0NXOk' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'OldPublishPolicyVersion' test.out

#- 51 OldUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicy \
    --policyId '0ZVgEgaw' \
    --body '{"countries": ["vnugkOmM", "hEyywFug", "IlNUyTlp"], "countryGroupName": "RTBrnO7V", "description": "XjGdc8JN", "isDefaultOpted": false, "isMandatory": false, "policyName": "02ESThIt", "readableId": "kFJqPCga", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 51 'OldUpdatePolicy' test.out

#- 52 OldSetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultPolicy \
    --policyId '4okoV7Q8' \
    > test.out 2>&1
eval_tap $? 52 'OldSetDefaultPolicy' test.out

#- 53 OldRetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicyVersion \
    --policyId 'TmFvFlM7' \
    --versionId 'uYakHFzN' \
    > test.out 2>&1
eval_tap $? 53 'OldRetrieveSinglePolicyVersion' test.out

#- 54 OldCreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicyVersion \
    --policyId 'cjjxXEIt' \
    --body '{"description": "DHKUv0Px", "displayVersion": "yk7Gfsv9", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 54 'OldCreatePolicyVersion' test.out

#- 55 OldRetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllPolicyTypes \
    --offset '70' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 55 'OldRetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'RdbnIwKm' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'aU5PguRv' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "841IhEKs", "policyId": "5BkzezCP", "policyVersionId": "n4m1Tu09"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "jCIrLFwF", "policyId": "jWvmQ3mJ", "policyVersionId": "rPbbPKh2"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "mKvZcrN6", "policyId": "s2uMcK0R", "policyVersionId": "hyM3NEmW"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'sWkmEuaQ' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "GZkiNl78", "policyId": "TmavnzvG", "policyVersionId": "2K7uU0v5"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "4T1naVUC", "policyId": "7bR07JYZ", "policyVersionId": "wXdcqITO"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "mxTR4RYI", "policyId": "ItJUAnbr", "policyVersionId": "yx7jZ46o"}]' \
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
    --clientId 'NIe3g9z4' \
    --countryCode '3fppJ1ds' \
    --namespace "$AB_NAMESPACE" \
    --userId '5aKBntxi' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '79sawS5p' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'Vk4Xf9g1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'kJIXJXuh' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'ZNyKrdW4' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '1Q3yr9iO' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'usBLsHEb' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'nlhbxqil' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'RSOw5gan' \
    --namespace "$AB_NAMESPACE" \
    --clientId 'p9vYyc3m' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
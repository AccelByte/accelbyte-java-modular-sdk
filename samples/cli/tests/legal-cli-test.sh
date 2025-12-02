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
    --userId '7ryj6qF7' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "aPx4nyKg", "policyId": "KsdbqWnJ", "policyVersionId": "ktOrrgQ3"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "kyF1cfEl", "policyId": "ZvzFCZP4", "policyVersionId": "3yYgJ0zY"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "C13mtZvd", "policyId": "49qLZXvo", "policyVersionId": "lMSLBmlM"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 OldRetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAcceptedAgreements \
    --userId 'HTKKAQd9' \
    > test.out 2>&1
eval_tap $? 3 'OldRetrieveAcceptedAgreements' test.out

#- 4 OldRetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllUsersByPolicyVersion \
    --keyword '8Yg2T6dF' \
    --limit '14' \
    --offset '44' \
    --policyVersionId '1DiukMXv' \
    > test.out 2>&1
eval_tap $? 4 'OldRetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 OldCreatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicy \
    --body '{"affectedClientIds": ["aeReVAO8", "aw1YaJd5", "sLB1dPso"], "affectedCountries": ["Xe6WHGsx", "HeDGxp3c", "mY5K1pFZ"], "basePolicyName": "zP6Law1o", "countryGroupName": "3DJcQtdf", "countryType": "COUNTRY_GROUP", "description": "YjzMXJJB", "isHidden": true, "isHiddenPublic": true, "namespace": "P2twhYim", "tags": ["pswzeCn5", "hca1ytA5", "xbiLYoqi"], "typeId": "VCYLq4H3"}' \
    > test.out 2>&1
eval_tap $? 6 'OldCreatePolicy' test.out

#- 7 OldRetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicy \
    --basePolicyId 'ziJ387ti' \
    > test.out 2>&1
eval_tap $? 7 'OldRetrieveSinglePolicy' test.out

#- 8 OldPartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldPartialUpdatePolicy \
    --basePolicyId 'PVw5kwbJ' \
    --body '{"affectedClientIds": ["KqG3r311", "d8uU4YGk", "E0pB3IJF"], "affectedCountries": ["UztHbHQy", "hodIa3QK", "D4PY2nx5"], "basePolicyName": "g5hiwOO7", "countryGroupName": "8izXSngO", "countryType": "COUNTRY", "description": "HLF5PJ4g", "isHidden": true, "isHiddenPublic": false, "namespace": "VPYUVd4v", "tags": ["elXgUDfy", "i0rBaqW6", "Rv6d1uEA"]}' \
    > test.out 2>&1
eval_tap $? 8 'OldPartialUpdatePolicy' test.out

#- 9 OldRetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal oldRetrievePolicyCountry \
    --basePolicyId 't6h8MI5r' \
    --countryCode 'i2x7ADbB' \
    > test.out 2>&1
eval_tap $? 9 'OldRetrievePolicyCountry' test.out

#- 10 OldRetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLocalizedPolicyVersions \
    --policyVersionId 'VJQix31Q' \
    > test.out 2>&1
eval_tap $? 10 'OldRetrieveLocalizedPolicyVersions' test.out

#- 11 OldCreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreateLocalizedPolicyVersion \
    --policyVersionId 'xIVK7gsX' \
    --body '{"contentType": "rtaPwmnb", "description": "dVclE6ZA", "localeCode": "ptAPxsba"}' \
    > test.out 2>&1
eval_tap $? 11 'OldCreateLocalizedPolicyVersion' test.out

#- 12 OldRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'zbQU4fMx' \
    > test.out 2>&1
eval_tap $? 12 'OldRetrieveSingleLocalizedPolicyVersion' test.out

#- 13 OldUpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'UrX0B4KE' \
    --body '{"attachmentChecksum": "ZwmQl7eU", "attachmentLocation": "zyaNzf4d", "attachmentVersionIdentifier": "qitGjgH3", "contentType": "u3spjuI0", "description": "gDHyzhrX"}' \
    > test.out 2>&1
eval_tap $? 13 'OldUpdateLocalizedPolicyVersion' test.out

#- 14 OldRequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal oldRequestPresignedURL \
    --localizedPolicyVersionId 'isr0MmOk' \
    --body '{"contentMD5": "Z7D86Mrn", "contentType": "IGcpp8kD"}' \
    > test.out 2>&1
eval_tap $? 14 'OldRequestPresignedURL' test.out

#- 15 OldSetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'P1MeEhWD' \
    > test.out 2>&1
eval_tap $? 15 'OldSetDefaultLocalizedPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": true, "userIds": ["W4ctBEXm", "g1ldNKtX", "wI6RI1sL"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pz2YJNFw' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements' test.out

#- 18 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'qZ2LHdJK' \
    --limit '82' \
    --offset '64' \
    --policyVersionId 'LE2QBJRg' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'KxhQYIgz' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'hIY7VU2u' \
    --policyVersionId 'hs2kKemN' \
    --start '0F10EZrU' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '73' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["9skHd0x0", "4PrMmgyw", "7QG9oa5q"], "affectedCountries": ["kwi05IBb", "D7sZbeyV", "LcBXz37E"], "basePolicyName": "yK7iZYPI", "countryGroupName": "xvgl5ogo", "countryType": "COUNTRY", "description": "HS0B8yfK", "isHidden": false, "isHiddenPublic": false, "tags": ["RrRTFD1k", "lW0x43yI", "bysUU44k"], "typeId": "e4VTOqLl"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'ZrY8Un6q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'orB4DDBB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'y4qb0B6c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["mmsbfLty", "xsHfsPCh", "53UXKGy3"], "affectedCountries": ["ZxBItD9B", "gvj96C5b", "hTNTOITQ"], "basePolicyName": "wEDYfp63", "countryGroupName": "l5wUqmii", "countryType": "COUNTRY_GROUP", "description": "Mta7AFkU", "isHidden": false, "isHiddenPublic": false, "tags": ["TLop4EXA", "0dAsVHdu", "6LrXBmKH"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'seDnogmm' \
    --countryCode 'nzxyCS4s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'a9uId3vm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'mqehUur4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["ve85bZlL", "0XeaVdl8", "TkxAR2st"], "countryCode": "pFMTECQZ", "countryGroupName": "wBXGrhOh", "countryType": "COUNTRY", "description": "UTHu6Wwz", "isDefaultSelection": true, "isMandatory": false, "policyName": "0ny99Vyt", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId 'vahvuH2z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'uwbRcBHG' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'IvEwwXVu' \
    --body '{"contentType": "SwkgzGT4", "description": "dCQDUBq8", "localeCode": "4jbalv2E"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '5k2YTiqG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'JVXBQu8R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "mPLbb2BH", "attachmentLocation": "UJ0oriDI", "attachmentVersionIdentifier": "JT2VfsoL", "contentType": "zDw128Vi", "description": "H1H68OF2"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'WMq21GHP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "KsoVfYae", "contentType": "uZm0MZKE"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'rEb8dMhU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'O9NeCpSI' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'ufQjuLza' \
    --body '{"description": "JBXbxW4g", "displayVersion": "aRTyUstg", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'W9Hieddx' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'feQDS3hS' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId '4rjeuIBi' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'ij9BLBzY' \
    --body '{"countries": ["JNlaJJZP", "CflFTzL4", "NJ9vVBxB"], "countryGroupName": "gUml3hiY", "description": "J0PHbjiG", "isDefaultOpted": true, "isMandatory": true, "policyName": "woGqyBDU", "readableId": "3lzUX4K5", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'xxvraQzU' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'ztDsdRlP' \
    --versionId '0YvsgO04' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'bwS97wul' \
    --body '{"description": "edPzWHlf", "displayVersion": "LZYYQ4mq", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '80' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'C8rzFnwh' \
    --publisherUserId 'VqSrgOb7' \
    --clientId 'srFMmDYK' \
    --countryCode 'jJLa84EM' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "jKcfJrTn", "policyId": "GbrLuDkt", "policyVersionId": "ILTp0UjG"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "pt9E39T2", "policyId": "8pBgQSzF", "policyVersionId": "EEqFSqzc"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "rIEFxCjD", "policyId": "SSxBiXFT", "policyVersionId": "4wA0X8Rz"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'JmMC4nBp' \
    --publisherUserId 'o6UsRZ0A' \
    --clientId 'M7CeP7PZ' \
    --countryCode 'woHVoqNQ' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'XXYWQCJo' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 OldUpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicyVersion \
    --policyVersionId 'Af8WfV3i' \
    --body '{"description": "Z7WnZBHW", "displayVersion": "NyUq0Kpa", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 49 'OldUpdatePolicyVersion' test.out

#- 50 OldPublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublishPolicyVersion \
    --policyVersionId 'GBBsNB5g' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'OldPublishPolicyVersion' test.out

#- 51 OldUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicy \
    --policyId 'bsMct49f' \
    --body '{"countries": ["UHxKLBpQ", "k9pneUuN", "q6reLWTN"], "countryGroupName": "3EfwGQ2D", "description": "HvhYPzJh", "isDefaultOpted": false, "isMandatory": true, "policyName": "AaI8NfYO", "readableId": "lrr3ICcI", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 51 'OldUpdatePolicy' test.out

#- 52 OldSetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultPolicy \
    --policyId 'shoEKW04' \
    > test.out 2>&1
eval_tap $? 52 'OldSetDefaultPolicy' test.out

#- 53 OldRetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicyVersion \
    --policyId 'r0E7Kh6l' \
    --versionId '5VaUIwQ3' \
    > test.out 2>&1
eval_tap $? 53 'OldRetrieveSinglePolicyVersion' test.out

#- 54 OldCreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicyVersion \
    --policyId 'AglGBVwM' \
    --body '{"description": "sIW8kLMc", "displayVersion": "QOv3aEuP", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 54 'OldCreatePolicyVersion' test.out

#- 55 OldRetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllPolicyTypes \
    --offset '47' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 55 'OldRetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'vWWuf2oR' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId '8WwJ4003' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Kt2DKjCb", "policyId": "b0ofodIx", "policyVersionId": "hlXvsdvQ"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "CXBB9bFG", "policyId": "LIPhLZ4m", "policyVersionId": "uK4RbXPB"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "IBMamfa8", "policyId": "sJSqgeoZ", "policyVersionId": "pfEFWBWo"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId '0QXQ7xik' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ZYEnN4ab", "policyId": "JdE8G7CS", "policyVersionId": "4BWtQt44"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "MlpVjw42", "policyId": "Lhb7ICgJ", "policyVersionId": "GnZpexdQ"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "aSDmCXyf", "policyId": "6E7XqCBe", "policyVersionId": "QkAYV7wz"}]' \
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
    --clientId 'kWUfwIwZ' \
    --countryCode 'EaLhfe4A' \
    --namespace "$AB_NAMESPACE" \
    --userId '2Dvh6Pu1' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '8Wz8FYcH' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'TKkkxdKK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'FCoCoCh3' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'GFsOCF7T' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'fHkMHIak' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'cGUOfrT2' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'Vr6O0HKg' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'yUjx44ri' \
    --namespace "$AB_NAMESPACE" \
    --clientId 'drOopAIA' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
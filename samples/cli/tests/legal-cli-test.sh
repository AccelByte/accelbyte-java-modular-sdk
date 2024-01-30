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
echo "1..64"

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
    --userId 'TDUSKDNV' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "d2Fs0719", "policyId": "bbTggIOO", "policyVersionId": "LEnNPj3P"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "r03PARGW", "policyId": "XNDSRbOo", "policyVersionId": "TUnHCb4J"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "suKzIkn1", "policyId": "ksbD41r8", "policyVersionId": "u5IdmgE0"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId '8dwwUuzV' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'vCcYxTBj' \
    --limit '71' \
    --offset '100' \
    --policyVersionId 'EvSn7qGA' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["meLAW0VN", "uv0eLbq1", "ZvzbecYk"], "affectedCountries": ["AhxfL4SL", "NyuYusUG", "v4W0Udqm"], "basePolicyName": "VPkptIuz", "description": "19JVlgiO", "namespace": "6z9WgeD6", "tags": ["HQb19hlb", "fEafYsPQ", "sVVys7z9"], "typeId": "MeDxLyu4"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'KbDv5sVk' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'DW6HEXnS' \
    --body '{"affectedClientIds": ["xN3r4ZkE", "1mc2KSp5", "TA3PX6g6"], "affectedCountries": ["4maIZ4JO", "ZtG2nWUH", "9OfytPd5"], "basePolicyName": "ChYVa2UL", "description": "fSDYTtAD", "namespace": "9svP2Nkc", "tags": ["IE7JLYZm", "Qwgu1xR9", "XSNkrUpR"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'DDMk6E8p' \
    --countryCode 'YN2L3Wkj' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'TrMj8Baq' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'WwfAvzkY' \
    --body '{"contentType": "EM2cMSJc", "description": "4g2tteKn", "localeCode": "lrLaw116"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'XF3Py5DA' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'kOKHTygy' \
    --body '{"attachmentChecksum": "2R4GHzHq", "attachmentLocation": "GFBDJeUn", "attachmentVersionIdentifier": "3GU6GPSU", "contentType": "qVP9baRl", "description": "tM0mPY6a"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'lrkLX4Lc' \
    --body '{"contentMD5": "tSSGrElm", "contentType": "tAHUIZcp"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'uIxWIQFa' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["fc2QEDU6", "PhtFkclx", "brjL2xZ2"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId '77fksaTt' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'VnXc7kaQ' \
    --limit '91' \
    --offset '77' \
    --policyVersionId 'wDr0CMsi' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 20 CreatePolicy1
./ng net.accelbyte.sdk.cli.Main legal createPolicy1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["ZZyFmjlz", "4tbJ7Ryj", "EJQNRaod"], "affectedCountries": ["R6NxTmYe", "3FLlHzIN", "2yrLpg91"], "basePolicyName": "y9gGDwvR", "description": "3BH6lFfJ", "tags": ["bl7zSU9q", "c4OXKp5i", "Ux0OvO9u"], "typeId": "4VqdQYY8"}' \
    > test.out 2>&1
eval_tap $? 20 'CreatePolicy1' test.out

#- 21 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId '9JxGG1RN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'RetrieveSinglePolicy1' test.out

#- 22 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'nwtEEDwV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["4AKGWJfb", "uLv4qYKz", "59w9GPm5"], "affectedCountries": ["gGBuZMGX", "XFnPiV2V", "ZaUxvwx4"], "basePolicyName": "isod6NIB", "description": "KYAcVnBX", "tags": ["HR6bjyRt", "ANzORNXs", "JYAXZ4LI"]}' \
    > test.out 2>&1
eval_tap $? 22 'PartialUpdatePolicy1' test.out

#- 23 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'P8hCdM3m' \
    --countryCode '0bAA2CFc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrievePolicyCountry1' test.out

#- 24 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'NrhXddW4' \
    > test.out 2>&1
eval_tap $? 24 'RetrieveLocalizedPolicyVersions1' test.out

#- 25 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'dLIpgC3D' \
    --body '{"contentType": "nfQpRjI6", "description": "qftjDzE8", "localeCode": "skIyK5Zt"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateLocalizedPolicyVersion1' test.out

#- 26 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'Wgiqdlko' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 27 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'WHHGWSYN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "1KnfpVEP", "attachmentLocation": "ZfexHip7", "attachmentVersionIdentifier": "NXnAAAt9", "contentType": "dDU4MO9A", "description": "0sSscJqy"}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateLocalizedPolicyVersion1' test.out

#- 28 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'xzjZXm0a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "K8aSdlyv", "contentType": "B64wtjqs"}' \
    > test.out 2>&1
eval_tap $? 28 'RequestPresignedURL1' test.out

#- 29 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'zI1qfd6A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'SetDefaultPolicy1' test.out

#- 30 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'zIvPmbtp' \
    --body '{"description": "CRYxPA5Z", "displayVersion": "nz6J7Pcs", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 30 'UpdatePolicyVersion1' test.out

#- 31 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'vh28vipW' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 31 'PublishPolicyVersion1' test.out

#- 32 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'lAdB4fXC' \
    --body '{"description": "SpBJtXDO", "isDefaultOpted": false, "isMandatory": true, "policyName": "fcANK0NW", "readableId": "6wJxuZgu", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePolicy1' test.out

#- 33 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'fNJPHSdy' \
    > test.out 2>&1
eval_tap $? 33 'SetDefaultPolicy3' test.out

#- 34 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Yti3Ak9s' \
    --versionId 'crqMI7Kd' \
    > test.out 2>&1
eval_tap $? 34 'RetrieveSinglePolicyVersion1' test.out

#- 35 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'cA8k0LhX' \
    --body '{"description": "eYuJCtLM", "displayVersion": "mUbYm01E", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 35 'CreatePolicyVersion1' test.out

#- 36 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '28' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 36 'RetrieveAllPolicyTypes1' test.out

#- 37 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZG6ppmDb' \
    --publisherUserId 'CSn8OjbL' \
    --clientId 'dNB8uUh4' \
    --countryCode 'OHxYXYnK' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "W5AXbx5A", "policyId": "ZQot2HXS", "policyVersionId": "QHwVYo4G"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "vSFGZ29g", "policyId": "Ee6gTyrS", "policyVersionId": "rOqWewYh"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "ES9oasD4", "policyId": "qu0XmbMh", "policyVersionId": "eQLiq0a0"}]' \
    > test.out 2>&1
eval_tap $? 37 'IndirectBulkAcceptVersionedPolicy' test.out

#- 38 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId '3AjRENg3' \
    --publisherUserId '8vQAGYiP' \
    --clientId 'dkTskYN5' \
    --countryCode '6IGqab6t' \
    > test.out 2>&1
eval_tap $? 38 'AdminRetrieveEligibilities' test.out

#- 39 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'TkBBUvI3' \
    > test.out 2>&1
eval_tap $? 39 'RetrievePolicies' test.out

#- 40 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'nzQSzk4X' \
    --body '{"description": "jvpNpv5j", "displayVersion": "DvkPTr8X", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePolicyVersion' test.out

#- 41 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'FPNBxy0o' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 41 'PublishPolicyVersion' test.out

#- 42 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'yIHDxC11' \
    --body '{"description": "xZ9sCk2i", "isDefaultOpted": true, "isMandatory": false, "policyName": "ZoOwbmAG", "readableId": "X5v2CCL2", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePolicy' test.out

#- 43 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'mSpCHJhE' \
    > test.out 2>&1
eval_tap $? 43 'SetDefaultPolicy2' test.out

#- 44 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'WvY7EhPf' \
    --versionId 'K326Cgkt' \
    > test.out 2>&1
eval_tap $? 44 'RetrieveSinglePolicyVersion' test.out

#- 45 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'FJToDrTM' \
    --body '{"description": "7sKn2vzE", "displayVersion": "HbTtW8Kt", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 45 'CreatePolicyVersion' test.out

#- 46 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '90' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 46 'RetrieveAllPolicyTypes' test.out

#- 47 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'tndpwWPg' \
    > test.out 2>&1
eval_tap $? 47 'GetUserInfoStatus' test.out

#- 48 SyncUserInfo
eval_tap 0 48 'SyncUserInfo # SKIP deprecated' test.out

#- 49 InvalidateUserInfoCache
eval_tap 0 49 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 50 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'b1wsYzmQ' \
    > test.out 2>&1
eval_tap $? 50 'AnonymizeUserAgreement' test.out

#- 51 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "50dQSQZo", "policyId": "AAAUxWoR", "policyVersionId": "A7EDoDDT"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "sLBNUOi1", "policyId": "Msf8OiD3", "policyVersionId": "GaLxEeky"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "m10ZuXW9", "policyId": "8X1jEzP0", "policyVersionId": "9AQr9doc"}]' \
    > test.out 2>&1
eval_tap $? 51 'ChangePreferenceConsent1' test.out

#- 52 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'YRdu7gUD' \
    > test.out 2>&1
eval_tap $? 52 'AcceptVersionedPolicy' test.out

#- 53 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 53 'RetrieveAgreementsPublic' test.out

#- 54 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "f3nocY3O", "policyId": "TPYW3f3M", "policyVersionId": "fw2l6Wya"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "gUplZkqy", "policyId": "r5xtySlq", "policyVersionId": "UhhGgnFQ"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "qRqWvFYP", "policyId": "nOjRfSdm", "policyVersionId": "c5O6apM6"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkAcceptVersionedPolicy' test.out

#- 55 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 55 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 56 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'HXvTiUPP' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "dB4J2mB6", "policyId": "6APxIo78", "policyVersionId": "ovocBDNM"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "pAq8CsCh", "policyId": "wBboCjEo", "policyVersionId": "MhSvzMgM"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "3BVODbH3", "policyId": "xG3Oey4F", "policyVersionId": "J6DppFyl"}]' \
    > test.out 2>&1
eval_tap $? 56 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 57 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'RetrieveEligibilitiesPublic' test.out

#- 58 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'QZyWrxMt' \
    --countryCode 'JSwzdSqy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqxWGUfS' \
    > test.out 2>&1
eval_tap $? 58 'RetrieveEligibilitiesPublicIndirect' test.out

#- 59 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'B0DcZ9IB' \
    > test.out 2>&1
eval_tap $? 59 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 60 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'r7K8r2Qw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 61 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode '7tu0XA7Z' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'oYaMRFp0' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveLatestPolicies' test.out

#- 62 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'zFv7HAj9' \
    > test.out 2>&1
eval_tap $? 62 'RetrieveLatestPoliciesPublic' test.out

#- 63 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'NwznsFZW' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'x8vvFWHb' \
    > test.out 2>&1
eval_tap $? 63 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 64 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 64 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
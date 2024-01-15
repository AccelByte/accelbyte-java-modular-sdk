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
echo "1..27"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetListDeletionDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListDeletionDataRequest \
    --namespace "$AB_NAMESPACE" \
    --after '0PSoZnP1' \
    --before 'Lj5lyMVM' \
    --limit '22' \
    --offset '45' \
    --requestDate 'oYpKJeaI' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetListDeletionDataRequest' test.out

#- 3 GetAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr getAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetAdminEmailConfiguration' test.out

#- 4 UpdateAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr updateAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["bfiRY9jg", "BE3VX467", "ZIkimuka"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["Nn1nJlBr", "X8eBFCjx", "aYgxUAua"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'Mvvv4HdM,EMLgCDGJ,OLaWvuHK' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '20' \
    --requestDate 'NJ6UZcLg' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetListPersonalDataRequest' test.out

#- 8 AdminGetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminGetServicesConfiguration' test.out

#- 9 AdminUpdateServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdateServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "niyyyEw2", "namespace": "ECvMgZsW"}, "id": "VzSbuc4s", "serviceConfig": {"protocol": "GRPC", "url": "RhOf1IZx"}, "type": "EXTEND"}, {"extendConfig": {"appName": "ITfEY2Ii", "namespace": "FhynBmNT"}, "id": "ayLDvsfR", "serviceConfig": {"protocol": "GRPC", "url": "LSk7AFS6"}, "type": "SERVICE"}, {"extendConfig": {"appName": "UddQOINg", "namespace": "iy0tpBYO"}, "id": "5DUwoFXr", "serviceConfig": {"protocol": "GRPC", "url": "iwhDZoKW"}, "type": "SERVICE"}]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateServicesConfiguration' test.out

#- 10 AdminResetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminResetServicesConfiguration' test.out

#- 11 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqMv3X1K' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetUserAccountDeletionRequest' test.out

#- 12 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '7nbJQLAt' \
    > test.out 2>&1
eval_tap $? 12 'AdminSubmitUserAccountDeletionRequest' test.out

#- 13 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '5Br05wVd' \
    > test.out 2>&1
eval_tap $? 13 'AdminCancelUserAccountDeletionRequest' test.out

#- 14 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAf5p52B' \
    --limit '24' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetUserPersonalDataRequests' test.out

#- 15 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'rcTivo5w' \
    --password 'rXfd3dvK' \
    > test.out 2>&1
eval_tap $? 15 'AdminRequestDataRetrieval' test.out

#- 16 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'Ff8RnjBj' \
    --userId 'pqkGV6Lx' \
    > test.out 2>&1
eval_tap $? 16 'AdminCancelUserPersonalDataRequest' test.out

#- 17 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'jr2IvxGD' \
    --userId 'xVxwfTpS' \
    --password 'AeMb2W9W' \
    > test.out 2>&1
eval_tap $? 17 'AdminGeneratePersonalDataURL' test.out

#- 18 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ai9JYVzG' \
    --password 'kvyju7bi' \
    > test.out 2>&1
eval_tap $? 18 'PublicSubmitUserAccountDeletionRequest' test.out

#- 19 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'CyYKcbmg' \
    > test.out 2>&1
eval_tap $? 19 'PublicCancelUserAccountDeletionRequest' test.out

#- 20 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8TsKirr' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserAccountDeletionStatus' test.out

#- 21 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'JnCOlPeS' \
    --limit '49' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserPersonalDataRequests' test.out

#- 22 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvH1Ssef' \
    --password 'kpcC9vUo' \
    > test.out 2>&1
eval_tap $? 22 'PublicRequestDataRetrieval' test.out

#- 23 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate '9nT0jhDy' \
    --userId 'xU61H5l1' \
    > test.out 2>&1
eval_tap $? 23 'PublicCancelUserPersonalDataRequest' test.out

#- 24 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'wLS08RCQ' \
    --userId '2VYRy31G' \
    --password 'uVQxz9ph' \
    > test.out 2>&1
eval_tap $? 24 'PublicGeneratePersonalDataURL' test.out

#- 25 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'mWFPEn0h' \
    --platformToken '7VhPdj4G' \
    > test.out 2>&1
eval_tap $? 25 'PublicSubmitMyAccountDeletionRequest' test.out

#- 26 PublicCancelMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelMyAccountDeletionRequest \
    > test.out 2>&1
eval_tap $? 26 'PublicCancelMyAccountDeletionRequest' test.out

#- 27 PublicGetMyAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetMyAccountDeletionStatus \
    > test.out 2>&1
eval_tap $? 27 'PublicGetMyAccountDeletionStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
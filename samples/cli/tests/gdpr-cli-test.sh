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
echo "1..43"

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
    --after 'NnVxwBC7' \
    --before '00weNoUG' \
    --limit '89' \
    --offset '50' \
    --requestDate 'to7HprHA' \
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
    --body '["MR87fpBz", "3QLRwnJt", "Wdv3bDOv"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["7qcokTp9", "RdkNUCtu", "V3qKu5vS"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'ukusCDrs,80sETyMK,6GGYz9TW' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetPlatformAccountClosureClients
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClients \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetPlatformAccountClosureClients' test.out

#- 8 AdminValidateXboxBPCertFile
./ng net.accelbyte.sdk.cli.Main gdpr adminValidateXboxBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --body '{"bpCert": "nhBWWNXz", "password": "Lim4x7W8"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminValidateXboxBPCertFile' test.out

#- 9 AdminGetPlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'NFRbKGHc' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetPlatformAccountClosureClient' test.out

#- 10 AdminUpdatePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'LPlvY9v0' \
    --body '{"bpCert": "Dkjt1AKd", "bpCertFileName": "3EwSuIiL", "clientId": "WYcWRJA9", "password": "S0SM0nLo", "publisherKey": "vI3zb1rL", "sandboxId": "KGmaEhMl", "secret": "VFGT0lVa"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdatePlatformAccountClosureClient' test.out

#- 11 AdminDeletePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminDeletePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'ULfqMj9C' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeletePlatformAccountClosureClient' test.out

#- 12 AdminMockPlatformAccountClosureData
./ng net.accelbyte.sdk.cli.Main gdpr adminMockPlatformAccountClosureData \
    --namespace "$AB_NAMESPACE" \
    --platform '2iK1hzCj' \
    --body '{"platformUserId": "0jjPaM0V", "sandbox": "3PUGGPtJ", "startImmediately": false}' \
    > test.out 2>&1
eval_tap $? 12 'AdminMockPlatformAccountClosureData' test.out

#- 13 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '96' \
    --requestDate 'RWeoxBwj' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetListPersonalDataRequest' test.out

#- 14 AdminGetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetServicesConfiguration' test.out

#- 15 AdminUpdateServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdateServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "3vQC4v4Y", "namespace": "z3PHU1BZ"}, "id": "JEjlIxpg", "package": "ZFKkDHDX", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "800eI0G2"}, "type": "SERVICE"}, {"extendConfig": {"appName": "8R8jh01D", "namespace": "yZPI9aDn"}, "id": "Z9c19RxQ", "package": "AWMHaalg", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "3zxkQwtB"}, "type": "EXTEND"}, {"extendConfig": {"appName": "jgheJ009", "namespace": "4borXE24"}, "id": "qqsAODLa", "package": "DqhG4s5z", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "91lgVJOt"}, "type": "SERVICE"}]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminUpdateServicesConfiguration' test.out

#- 16 AdminResetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminResetServicesConfiguration' test.out

#- 17 AdminGetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlatformAccountClosureServicesConfiguration' test.out

#- 18 AdminUpdatePlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "9g10wrwB", "namespace": "os9Qqz1O"}, "id": "fHOhoCHM", "package": "JousulmM", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "W9RAQM41"}, "type": "EXTEND"}, {"extendConfig": {"appName": "fuXjPgaU", "namespace": "GvjYKXIO"}, "id": "0GzGYFC0", "package": "TaQ4X7nR", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "CakirNhw"}, "type": "EXTEND"}, {"extendConfig": {"appName": "5hPsGRtt", "namespace": "CUxsGpqb"}, "id": "vY9lQexh", "package": "ZP6rALNn", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "nuYyCskI"}, "type": "EXTEND"}]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdatePlatformAccountClosureServicesConfiguration' test.out

#- 19 AdminResetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminResetPlatformAccountClosureServicesConfiguration' test.out

#- 20 AdminGetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '48' \
    --platform 'x0nCut99' \
    --userId 'TRjNTfP7' \
    > test.out 2>&1
eval_tap $? 20 'AdminGetUserPlatformAccountClosureHistories' test.out

#- 21 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '4KxmIgFt' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserAccountDeletionRequest' test.out

#- 22 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'T2JpiVfz' \
    > test.out 2>&1
eval_tap $? 22 'AdminSubmitUserAccountDeletionRequest' test.out

#- 23 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'RDzTVvw0' \
    > test.out 2>&1
eval_tap $? 23 'AdminCancelUserAccountDeletionRequest' test.out

#- 24 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'pi5uPqMf' \
    --limit '40' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserPersonalDataRequests' test.out

#- 25 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId '1Wdmz1ZB' \
    --password 'dbcODOeH' \
    > test.out 2>&1
eval_tap $? 25 'AdminRequestDataRetrieval' test.out

#- 26 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'UGAze0cJ' \
    --userId 'UcGzpHgz' \
    > test.out 2>&1
eval_tap $? 26 'AdminCancelUserPersonalDataRequest' test.out

#- 27 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'LqkEGPky' \
    --userId 'FVgZe25q' \
    --password 'LgPInTtV' \
    > test.out 2>&1
eval_tap $? 27 'AdminGeneratePersonalDataURL' test.out

#- 28 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '6KZdolbB' \
    --languageTag 'wmbBue5D' \
    --password 'z97oSirA' \
    > test.out 2>&1
eval_tap $? 28 'PublicSubmitUserAccountDeletionRequest' test.out

#- 29 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJbGZqSY' \
    > test.out 2>&1
eval_tap $? 29 'PublicCancelUserAccountDeletionRequest' test.out

#- 30 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eskhpr7R' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetUserAccountDeletionStatus' test.out

#- 31 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'WdrEidw9' \
    --limit '61' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserPersonalDataRequests' test.out

#- 32 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'N0dWz341' \
    --languageTag 'mw91KDQ6' \
    --password 'KKHzDtYS' \
    > test.out 2>&1
eval_tap $? 32 'PublicRequestDataRetrieval' test.out

#- 33 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'wDxld4fp' \
    --userId 'Vkcw9SVG' \
    > test.out 2>&1
eval_tap $? 33 'PublicCancelUserPersonalDataRequest' test.out

#- 34 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'zwwoYrmB' \
    --userId 'RMAvLCqT' \
    --password 'f6OpRCFN' \
    > test.out 2>&1
eval_tap $? 34 'PublicGeneratePersonalDataURL' test.out

#- 35 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'sl5RFnzC' \
    --platformToken 'ySIv6fV8' \
    > test.out 2>&1
eval_tap $? 35 'PublicSubmitMyAccountDeletionRequest' test.out

#- 36 PublicCancelMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelMyAccountDeletionRequest \
    > test.out 2>&1
eval_tap $? 36 'PublicCancelMyAccountDeletionRequest' test.out

#- 37 PublicGetMyAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetMyAccountDeletionStatus \
    > test.out 2>&1
eval_tap $? 37 'PublicGetMyAccountDeletionStatus' test.out

#- 38 S2SGetListFinishedAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'fPMn709w' \
    --start 'vr64kqTr' \
    > test.out 2>&1
eval_tap $? 38 'S2SGetListFinishedAccountDeletionRequest' test.out

#- 39 S2SGetListFinishedPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'jN1DrNPu' \
    --start 'd1icVjtG' \
    > test.out 2>&1
eval_tap $? 39 'S2SGetListFinishedPersonalDataRequest' test.out

#- 40 S2SGetDataRequestByRequestID
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetDataRequestByRequestID \
    --namespace "$AB_NAMESPACE" \
    --requestId 'ecfz1S6f' \
    > test.out 2>&1
eval_tap $? 40 'S2SGetDataRequestByRequestID' test.out

#- 41 S2SSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'xDWAi5fn' \
    > test.out 2>&1
eval_tap $? 41 'S2SSubmitUserAccountDeletionRequest' test.out

#- 42 S2SRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr s2sRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'MpsB5ERh' \
    > test.out 2>&1
eval_tap $? 42 'S2SRequestDataRetrieval' test.out

#- 43 S2SGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr s2sGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'sqoaamKo' \
    --userId 'nVHnIxHY' \
    > test.out 2>&1
eval_tap $? 43 'S2SGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..49"

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
    --after 'KtXTIebe' \
    --before 'RbFnuwM8' \
    --limit '45' \
    --offset '4' \
    --requestDate 'TdLwuPFO' \
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
    --body '["SDf7WdS3", "R8iu67rv", "6OgbhADp"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["JqJCAMSO", "uaY2SOm4", "TFgF5EZI"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'cA91wE9z,l0sB0Uul,vNQ4ZSz5' \
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
    --body '{"bpCert": "89TQk1HH", "password": "z0Khi08U"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminValidateXboxBPCertFile' test.out

#- 9 AdminGetPlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'PYDw4VwL' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetPlatformAccountClosureClient' test.out

#- 10 AdminUpdatePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'KTTwR7zK' \
    --body '{"bpCert": "G0oDoI8R", "bpCertFileName": "0kBcw4t0", "clientId": "FCYiXrWs", "password": "KfTa8DZ8", "publisherKey": "XoA7V7RO", "sandboxId": "Uq0mTPfn", "secret": "oYoojN5E"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdatePlatformAccountClosureClient' test.out

#- 11 AdminDeletePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminDeletePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'FOQu6qdi' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeletePlatformAccountClosureClient' test.out

#- 12 AdminMockPlatformAccountClosureData
./ng net.accelbyte.sdk.cli.Main gdpr adminMockPlatformAccountClosureData \
    --namespace "$AB_NAMESPACE" \
    --platform 'ddbYMFUv' \
    --body '{"platformUserId": "FGOfW1x1", "sandbox": "OgV15VoR", "startImmediately": false}' \
    > test.out 2>&1
eval_tap $? 12 'AdminMockPlatformAccountClosureData' test.out

#- 13 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '54' \
    --requestDate 'qO6ULvRn' \
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
    --body '{"services": [{"extendConfig": {"appName": "OZj0do7n", "namespace": "ChXggRa0"}, "id": "uU5sGjvt", "package": "uKX2uVwI", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "dmR2Uxw5"}, "type": "EXTEND"}, {"extendConfig": {"appName": "CMUTmd1r", "namespace": "9TuRLLk8"}, "id": "18sYE4Ep", "package": "USebJnin", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "Q4CFnxHE"}, "type": "EXTEND"}, {"extendConfig": {"appName": "tGjUjnYr", "namespace": "OfIR7M1C"}, "id": "9QNK8ieD", "package": "CjakZzOR", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "IuX6m4oA"}, "type": "EXTEND"}]}' \
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
    --body '{"services": [{"extendConfig": {"appName": "jLgXHPj7", "namespace": "rEekVvTX"}, "id": "XKATEpCj", "package": "9RcHnzRV", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "B4xu9lVU"}, "type": "SERVICE"}, {"extendConfig": {"appName": "NDrxxoXv", "namespace": "5ugZET8f"}, "id": "lgLG8MRP", "package": "tDJ7D70M", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "ENYQQAGv"}, "type": "EXTEND"}, {"extendConfig": {"appName": "U6uJ5zEo", "namespace": "DoSsokZG"}, "id": "wsh6sQzi", "package": "DWqhCyRL", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "TJKpsbXj"}, "type": "EXTEND"}]}' \
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
    --limit '61' \
    --offset '48' \
    --platform '4vP3tJ4x' \
    --userId '48jYiT8Y' \
    > test.out 2>&1
eval_tap $? 20 'AdminGetUserPlatformAccountClosureHistories' test.out

#- 21 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYoGxwqH' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserAccountDeletionRequest' test.out

#- 22 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6Tm9p2u' \
    > test.out 2>&1
eval_tap $? 22 'AdminSubmitUserAccountDeletionRequest' test.out

#- 23 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'ivJng2Qk' \
    > test.out 2>&1
eval_tap $? 23 'AdminCancelUserAccountDeletionRequest' test.out

#- 24 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'idCjoZyO' \
    --limit '34' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserPersonalDataRequests' test.out

#- 25 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wx0OyoNu' \
    --password 'MbbG5rNs' \
    > test.out 2>&1
eval_tap $? 25 'AdminRequestDataRetrieval' test.out

#- 26 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'lS8SEPze' \
    --userId '6AxnJt6g' \
    > test.out 2>&1
eval_tap $? 26 'AdminCancelUserPersonalDataRequest' test.out

#- 27 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'GZ3KbaZ4' \
    --userId 'ImW01Ic3' \
    --password 'sMqOUYx8' \
    > test.out 2>&1
eval_tap $? 27 'AdminGeneratePersonalDataURL' test.out

#- 28 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'sq5SgjWN' \
    --languageTag 'tCV0xnzc' \
    --password '8uSr5Ofv' \
    > test.out 2>&1
eval_tap $? 28 'PublicSubmitUserAccountDeletionRequest' test.out

#- 29 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKdU6DGI' \
    > test.out 2>&1
eval_tap $? 29 'PublicCancelUserAccountDeletionRequest' test.out

#- 30 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'fxaA2MOz' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetUserAccountDeletionStatus' test.out

#- 31 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'EBx7w6dp' \
    --limit '86' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserPersonalDataRequests' test.out

#- 32 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZrJP4PvM' \
    --languageTag 'XMT9j70L' \
    --password '9eUcwJBP' \
    > test.out 2>&1
eval_tap $? 32 'PublicRequestDataRetrieval' test.out

#- 33 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate '73pB2w17' \
    --userId 'OHXXGyXq' \
    > test.out 2>&1
eval_tap $? 33 'PublicCancelUserPersonalDataRequest' test.out

#- 34 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate '4FytyCFp' \
    --userId '9ty1ZSHk' \
    --password 'zd7vC3xM' \
    > test.out 2>&1
eval_tap $? 34 'PublicGeneratePersonalDataURL' test.out

#- 35 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'FIwpc67A' \
    --platformToken 'IonE1cEI' \
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

#- 38 PublicSubmitMyHeadlessDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyHeadlessDeletionRequest \
    > test.out 2>&1
eval_tap $? 38 'PublicSubmitMyHeadlessDeletionRequest' test.out

#- 39 PublicSubmitMyHeadlessPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyHeadlessPersonalDataRequest \
    --email 'rkfF3Fes' \
    --languageTag 'nlho6GrK' \
    > test.out 2>&1
eval_tap $? 39 'PublicSubmitMyHeadlessPersonalDataRequest' test.out

#- 40 PublicGenerateMyHeadlessPersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGenerateMyHeadlessPersonalDataURL \
    --requestDate 'CiNT2iDv' \
    > test.out 2>&1
eval_tap $? 40 'PublicGenerateMyHeadlessPersonalDataURL' test.out

#- 41 PublicGetMyPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetMyPersonalDataRequests \
    > test.out 2>&1
eval_tap $? 41 'PublicGetMyPersonalDataRequests' test.out

#- 42 PublicSubmitMyPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyPersonalDataRequest \
    --email 'a2YDd0Zg' \
    --languageTag '0hNpWDKQ' \
    --platformId 'zUsb22BF' \
    --platformToken 'qgwaYyR5' \
    > test.out 2>&1
eval_tap $? 42 'PublicSubmitMyPersonalDataRequest' test.out

#- 43 PublicCancelMyPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelMyPersonalDataRequest \
    --requestDate 'aL6QmXz2' \
    > test.out 2>&1
eval_tap $? 43 'PublicCancelMyPersonalDataRequest' test.out

#- 44 S2SGetListFinishedAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'TxSZIQr5' \
    --start 'YAKLh8UI' \
    > test.out 2>&1
eval_tap $? 44 'S2SGetListFinishedAccountDeletionRequest' test.out

#- 45 S2SGetListFinishedPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'pG4a4agW' \
    --start 'qcYpqoII' \
    > test.out 2>&1
eval_tap $? 45 'S2SGetListFinishedPersonalDataRequest' test.out

#- 46 S2SGetDataRequestByRequestID
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetDataRequestByRequestID \
    --namespace "$AB_NAMESPACE" \
    --requestId '2mbakAXY' \
    > test.out 2>&1
eval_tap $? 46 'S2SGetDataRequestByRequestID' test.out

#- 47 S2SSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '1xQNlKrd' \
    > test.out 2>&1
eval_tap $? 47 'S2SSubmitUserAccountDeletionRequest' test.out

#- 48 S2SRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr s2sRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCuHhS07' \
    > test.out 2>&1
eval_tap $? 48 'S2SRequestDataRetrieval' test.out

#- 49 S2SGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr s2sGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'PWh4Csf3' \
    --userId 'RP0ULMn1' \
    > test.out 2>&1
eval_tap $? 49 'S2SGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
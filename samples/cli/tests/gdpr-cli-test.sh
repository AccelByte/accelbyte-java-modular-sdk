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
echo "1..39"

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
    --after 's2cxKcZg' \
    --before 'w61RFEUJ' \
    --limit '93' \
    --offset '52' \
    --requestDate 'c0rwKrwc' \
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
    --body '["aeuWV6P7", "Yhx2LX2e", "iYtDJK0F"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["JwVpenez", "GJYfZTuq", "2SF4Z027"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'Z1sKZQpW,4ZiE3GC4,xMe3NNfI' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetPlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'GzybMc1t' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetPlatformAccountClosureClient' test.out

#- 8 AdminUpdatePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform '5STu6XE9' \
    --body '{"clientId": "OGe2QqAS", "secret": "kTJ6R4JB"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminUpdatePlatformAccountClosureClient' test.out

#- 9 AdminDeletePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminDeletePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'QQBPyqvO' \
    > test.out 2>&1
eval_tap $? 9 'AdminDeletePlatformAccountClosureClient' test.out

#- 10 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '60' \
    --requestDate '7ULRXvbN' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetListPersonalDataRequest' test.out

#- 11 AdminGetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetServicesConfiguration' test.out

#- 12 AdminUpdateServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdateServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "CcRYalnC", "namespace": "zHdyEmvd"}, "id": "7XIYa5y3", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "cOPCntW8"}, "type": "EXTEND"}, {"extendConfig": {"appName": "r13vVizQ", "namespace": "JpaX7GFX"}, "id": "LRXHNQAQ", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "CWs90bfU"}, "type": "SERVICE"}, {"extendConfig": {"appName": "wiYI2Ib5", "namespace": "sDKquiB6"}, "id": "ghrAuwnz", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "37nNZFML"}, "type": "SERVICE"}]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateServicesConfiguration' test.out

#- 13 AdminResetServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminResetServicesConfiguration' test.out

#- 14 AdminGetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetPlatformAccountClosureServicesConfiguration' test.out

#- 15 AdminUpdatePlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"services": [{"extendConfig": {"appName": "KwOkZ0XE", "namespace": "hDC9TlsS"}, "id": "HZIghWBi", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "bX220Zxp"}, "type": "EXTEND"}, {"extendConfig": {"appName": "yCKC4MFU", "namespace": "Q3OgtTtJ"}, "id": "UJWUN77l", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "dngKnIZd"}, "type": "EXTEND"}, {"extendConfig": {"appName": "5ivo7QsX", "namespace": "IJZzAs8q"}, "id": "haVP0dus", "serviceConfig": {"protocol": "GRPC", "skipAck": true, "url": "ixV52VMV"}, "type": "EXTEND"}]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminUpdatePlatformAccountClosureServicesConfiguration' test.out

#- 16 AdminResetPlatformAccountClosureServicesConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr adminResetPlatformAccountClosureServicesConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminResetPlatformAccountClosureServicesConfiguration' test.out

#- 17 AdminGetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '99' \
    --platform '9mHg2Iim' \
    --userId '48M6u6T5' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetUserPlatformAccountClosureHistories' test.out

#- 18 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tp5pxOpx' \
    > test.out 2>&1
eval_tap $? 18 'AdminGetUserAccountDeletionRequest' test.out

#- 19 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRK6T6fX' \
    > test.out 2>&1
eval_tap $? 19 'AdminSubmitUserAccountDeletionRequest' test.out

#- 20 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmScsCo2' \
    > test.out 2>&1
eval_tap $? 20 'AdminCancelUserAccountDeletionRequest' test.out

#- 21 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'LqBmvWnU' \
    --limit '5' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserPersonalDataRequests' test.out

#- 22 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'pmVLwdzh' \
    --password 'svcT1FBd' \
    > test.out 2>&1
eval_tap $? 22 'AdminRequestDataRetrieval' test.out

#- 23 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'V3ndOuFV' \
    --userId 'n7MSmkg8' \
    > test.out 2>&1
eval_tap $? 23 'AdminCancelUserPersonalDataRequest' test.out

#- 24 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'vcplcOo4' \
    --userId 'dDmPOMby' \
    --password 'ezWrgLdW' \
    > test.out 2>&1
eval_tap $? 24 'AdminGeneratePersonalDataURL' test.out

#- 25 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '9FZgngZI' \
    --languageTag 'WnOLrS1E' \
    --password 'QgaJkc1Q' \
    > test.out 2>&1
eval_tap $? 25 'PublicSubmitUserAccountDeletionRequest' test.out

#- 26 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'UkXziJ5e' \
    > test.out 2>&1
eval_tap $? 26 'PublicCancelUserAccountDeletionRequest' test.out

#- 27 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFk0aBu4' \
    > test.out 2>&1
eval_tap $? 27 'PublicGetUserAccountDeletionStatus' test.out

#- 28 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlGaRGEx' \
    --limit '72' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetUserPersonalDataRequests' test.out

#- 29 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'dhdASQ2g' \
    --languageTag 'dr5Jxg1C' \
    --password 'WEvLYxpX' \
    > test.out 2>&1
eval_tap $? 29 'PublicRequestDataRetrieval' test.out

#- 30 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'uZYhAW4Y' \
    --userId 'WAJOiY98' \
    > test.out 2>&1
eval_tap $? 30 'PublicCancelUserPersonalDataRequest' test.out

#- 31 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'ooxfQSZq' \
    --userId 'nQ1nYSNY' \
    --password '6YiQj772' \
    > test.out 2>&1
eval_tap $? 31 'PublicGeneratePersonalDataURL' test.out

#- 32 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'foy2wXHf' \
    --platformToken 'Xk0QoHOR' \
    > test.out 2>&1
eval_tap $? 32 'PublicSubmitMyAccountDeletionRequest' test.out

#- 33 PublicCancelMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelMyAccountDeletionRequest \
    > test.out 2>&1
eval_tap $? 33 'PublicCancelMyAccountDeletionRequest' test.out

#- 34 PublicGetMyAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetMyAccountDeletionStatus \
    > test.out 2>&1
eval_tap $? 34 'PublicGetMyAccountDeletionStatus' test.out

#- 35 S2SGetListFinishedAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'pSVAx4lu' \
    --start '8qiEk9zJ' \
    > test.out 2>&1
eval_tap $? 35 'S2SGetListFinishedAccountDeletionRequest' test.out

#- 36 S2SGetListFinishedPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --end 'krSXp3pe' \
    --start '9tm7J25P' \
    > test.out 2>&1
eval_tap $? 36 'S2SGetListFinishedPersonalDataRequest' test.out

#- 37 S2SSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '3e1gXmGh' \
    > test.out 2>&1
eval_tap $? 37 'S2SSubmitUserAccountDeletionRequest' test.out

#- 38 S2SRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr s2sRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'FzF6ym3p' \
    > test.out 2>&1
eval_tap $? 38 'S2SRequestDataRetrieval' test.out

#- 39 S2SGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr s2sGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'zbIWYjF9' \
    --userId 'omX3Ak1V' \
    > test.out 2>&1
eval_tap $? 39 'S2SGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
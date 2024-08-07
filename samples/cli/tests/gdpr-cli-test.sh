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
    --after 'bHD8tqui' \
    --before 'dNf0Vi86' \
    --limit '65' \
    --offset '76' \
    --requestDate 'VFJCicK4' \
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
    --body '["8UnygMVY", "3irckOnl", "6R2zZsZA"]' \
    > test.out 2>&1
eval_tap $? 4 'UpdateAdminEmailConfiguration' test.out

#- 5 SaveAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr saveAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '["5ptVhFdV", "czCvW8mC", "VpU5PM9w"]' \
    > test.out 2>&1
eval_tap $? 5 'SaveAdminEmailConfiguration' test.out

#- 6 DeleteAdminEmailConfiguration
./ng net.accelbyte.sdk.cli.Main gdpr deleteAdminEmailConfiguration \
    --namespace "$AB_NAMESPACE" \
    --emails 'nJGMvbV3,wrOMFJ3g,jcUml0lh' \
    > test.out 2>&1
eval_tap $? 6 'DeleteAdminEmailConfiguration' test.out

#- 7 AdminGetPlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminGetPlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform '0ZSQUice' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetPlatformAccountClosureClient' test.out

#- 8 AdminUpdatePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminUpdatePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'jgr5jm7h' \
    --body '{"clientId": "TkGpqXGN", "secret": "hOvl0g52"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminUpdatePlatformAccountClosureClient' test.out

#- 9 AdminDeletePlatformAccountClosureClient
./ng net.accelbyte.sdk.cli.Main gdpr adminDeletePlatformAccountClosureClient \
    --namespace "$AB_NAMESPACE" \
    --platform 'nJYqqij6' \
    > test.out 2>&1
eval_tap $? 9 'AdminDeletePlatformAccountClosureClient' test.out

#- 10 AdminGetListPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetListPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '85' \
    --requestDate 'jwWPf9ts' \
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
    --body '{"services": [{"extendConfig": {"appName": "3qlXNixz", "namespace": "vLzpP87j"}, "id": "L8wWhxVl", "serviceConfig": {"protocol": "GRPC", "skipAck": false, "url": "YLaODvpq"}, "type": "SERVICE"}, {"extendConfig": {"appName": "DttuQSgy", "namespace": "vTDrckvM"}, "id": "zeRai8rt", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "RApmw8Tq"}, "type": "SERVICE"}, {"extendConfig": {"appName": "FISXyjX2", "namespace": "C4RpruPg"}, "id": "SxTCKhRk", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "cdgUD0WI"}, "type": "EXTEND"}]}' \
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
    --body '{"services": [{"extendConfig": {"appName": "zFzCLS2T", "namespace": "cuwWP9XM"}, "id": "1iC2Xhd8", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "ymZY0pSa"}, "type": "EXTEND"}, {"extendConfig": {"appName": "EVSv7QrX", "namespace": "oHo2ICS1"}, "id": "4QWzLBFT", "serviceConfig": {"protocol": "EVENT", "skipAck": true, "url": "gizRYeSF"}, "type": "EXTEND"}, {"extendConfig": {"appName": "EYgqr8wH", "namespace": "LheVJDxe"}, "id": "3DkQxHaQ", "serviceConfig": {"protocol": "EVENT", "skipAck": false, "url": "DWP5cTcQ"}, "type": "SERVICE"}]}' \
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
    --limit '12' \
    --offset '86' \
    --platform 'R4KE7aQh' \
    --userId '6RuS2Cmf' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetUserPlatformAccountClosureHistories' test.out

#- 18 AdminGetUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'CgULi6xy' \
    > test.out 2>&1
eval_tap $? 18 'AdminGetUserAccountDeletionRequest' test.out

#- 19 AdminSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId '6EuMySjn' \
    > test.out 2>&1
eval_tap $? 19 'AdminSubmitUserAccountDeletionRequest' test.out

#- 20 AdminCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'zUjcxohj' \
    > test.out 2>&1
eval_tap $? 20 'AdminCancelUserAccountDeletionRequest' test.out

#- 21 AdminGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr adminGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'koffqhmO' \
    --limit '30' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserPersonalDataRequests' test.out

#- 22 AdminRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr adminRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'sb1o2TiW' \
    --password '60b39uwz' \
    > test.out 2>&1
eval_tap $? 22 'AdminRequestDataRetrieval' test.out

#- 23 AdminCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr adminCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate '3FTKtO75' \
    --userId 'Zcpu1QHH' \
    > test.out 2>&1
eval_tap $? 23 'AdminCancelUserPersonalDataRequest' test.out

#- 24 AdminGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr adminGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'sg4MtwvA' \
    --userId 'Ks90jHyX' \
    --password 'NQMZDYwl' \
    > test.out 2>&1
eval_tap $? 24 'AdminGeneratePersonalDataURL' test.out

#- 25 PublicSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'i9GvfvGM' \
    --languageTag 'hQB76EKs' \
    --password 'xH6VPHpd' \
    > test.out 2>&1
eval_tap $? 25 'PublicSubmitUserAccountDeletionRequest' test.out

#- 26 PublicCancelUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfzIYc9J' \
    > test.out 2>&1
eval_tap $? 26 'PublicCancelUserAccountDeletionRequest' test.out

#- 27 PublicGetUserAccountDeletionStatus
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserAccountDeletionStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'VZLyoGaK' \
    > test.out 2>&1
eval_tap $? 27 'PublicGetUserAccountDeletionStatus' test.out

#- 28 PublicGetUserPersonalDataRequests
./ng net.accelbyte.sdk.cli.Main gdpr publicGetUserPersonalDataRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcjsLss6' \
    --limit '0' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetUserPersonalDataRequests' test.out

#- 29 PublicRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr publicRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPedpdZd' \
    --languageTag 'M29L06Ke' \
    --password 'wrOYNhp8' \
    > test.out 2>&1
eval_tap $? 29 'PublicRequestDataRetrieval' test.out

#- 30 PublicCancelUserPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicCancelUserPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --requestDate '1XGvfqat' \
    --userId '5MO1sYi8' \
    > test.out 2>&1
eval_tap $? 30 'PublicCancelUserPersonalDataRequest' test.out

#- 31 PublicGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr publicGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate '62tRgNVO' \
    --userId 'hmzey04S' \
    --password 'DeGYPfX6' \
    > test.out 2>&1
eval_tap $? 31 'PublicGeneratePersonalDataURL' test.out

#- 32 PublicSubmitMyAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr publicSubmitMyAccountDeletionRequest \
    --platformId 'KH9qdaEM' \
    --platformToken '0g1HeDJ4' \
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
    --end 'O6gbCRx2' \
    --start '3UlpYPjy' \
    > test.out 2>&1
eval_tap $? 35 'S2SGetListFinishedAccountDeletionRequest' test.out

#- 36 S2SGetListFinishedPersonalDataRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace "$AB_NAMESPACE" \
    --end '9LRjtcYn' \
    --start 'i5qTtxBU' \
    > test.out 2>&1
eval_tap $? 36 'S2SGetListFinishedPersonalDataRequest' test.out

#- 37 S2SSubmitUserAccountDeletionRequest
./ng net.accelbyte.sdk.cli.Main gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace "$AB_NAMESPACE" \
    --userId 'lJx4wSY4' \
    > test.out 2>&1
eval_tap $? 37 'S2SSubmitUserAccountDeletionRequest' test.out

#- 38 S2SRequestDataRetrieval
./ng net.accelbyte.sdk.cli.Main gdpr s2sRequestDataRetrieval \
    --namespace "$AB_NAMESPACE" \
    --userId 'gcgyT7ZK' \
    > test.out 2>&1
eval_tap $? 38 'S2SRequestDataRetrieval' test.out

#- 39 S2SGeneratePersonalDataURL
./ng net.accelbyte.sdk.cli.Main gdpr s2sGeneratePersonalDataURL \
    --namespace "$AB_NAMESPACE" \
    --requestDate 'Wqh33Jg8' \
    --userId '2HRVFKsi' \
    > test.out 2>&1
eval_tap $? 39 'S2SGeneratePersonalDataURL' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
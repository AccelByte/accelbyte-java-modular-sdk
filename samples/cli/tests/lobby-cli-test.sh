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
echo "1..109"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetUserFriendsUpdated
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsUpdated \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserIncomingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 4 'GetUserIncomingFriendsWithTime' test.out

#- 5 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 5 'GetUserOutgoingFriends' test.out

#- 6 GetUserOutgoingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 6 'GetUserOutgoingFriendsWithTime' test.out

#- 7 GetUserFriendsWithPlatform
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsWithPlatform \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 7 'GetUserFriendsWithPlatform' test.out

#- 8 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "R5iCXFXo", "friendPublicId": "PKogYAAl"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "QFdX1m5q"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "r0BbLhgm"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "QDQEXzCt"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'b1d1htsb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "Fy2EpsfC"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'P43gq8yP' \
    --body '{"friendIds": ["tUhE3qW5", "HhrniZhe", "K8urU8WM"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 BulkDeleteFriends
./ng net.accelbyte.sdk.cli.Main lobby bulkDeleteFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'iLMEiUbt' \
    --body '{"friendIds": ["tgULZmgA", "uNlYUHvP", "SlgOBlT3"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkDeleteFriends' test.out

#- 16 SyncNativeFriends
./ng net.accelbyte.sdk.cli.Main lobby syncNativeFriends \
    --namespace "$AB_NAMESPACE" \
    --body '[{"isLogin": true, "platformId": "jx7yhfhw", "platformToken": "yQmHqoqV", "psnEnv": "oxPw8JGP"}, {"isLogin": true, "platformId": "jIORNIYa", "platformToken": "ohjCU8bo", "psnEnv": "fJHbB0OK"}, {"isLogin": true, "platformId": "8IdewXsA", "platformToken": "MYs58S5h", "psnEnv": "0aLW7OAT"}]' \
    > test.out 2>&1
eval_tap $? 16 'SyncNativeFriends' test.out

#- 17 SyncNativeBlockedUser
./ng net.accelbyte.sdk.cli.Main lobby syncNativeBlockedUser \
    --namespace "$AB_NAMESPACE" \
    --body '[{"platformId": "P3Vkgx4p", "psnEnv": "0BdCmsHn"}, {"platformId": "UU1EUhHm", "psnEnv": "unEvkuCa"}, {"platformId": "f3RAtOXn", "psnEnv": "sSAthVkX"}]' \
    > test.out 2>&1
eval_tap $? 17 'SyncNativeBlockedUser' test.out

#- 18 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 18 'AdminGetAllConfigV1' test.out

#- 19 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 19 'AdminGetLogConfig' test.out

#- 20 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main lobby adminPatchUpdateLogConfig \
    --body '{"logLevel": "info", "socketLogEnabled": true}' \
    > test.out 2>&1
eval_tap $? 20 'AdminPatchUpdateLogConfig' test.out

#- 21 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetConfigV1' test.out

#- 22 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 61, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 15, "chatRateLimitDuration": 95, "concurrentUsersLimit": 74, "disableInvitationOnJoinParty": false, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "tbY8l3KL", "generalRateLimitBurst": 77, "generalRateLimitDuration": 4, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 43, "maxFriendsLimit": 5, "maxPartyMember": 37, "profanityFilter": true, "readyConsentTimeout": 7, "unregisterDelay": 59}' \
    > test.out 2>&1
eval_tap $? 22 'AdminUpdateConfigV1' test.out

#- 23 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminExportConfigV1' test.out

#- 24 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 24 'AdminImportConfigV1' test.out

#- 25 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'xZ1jSCKm' \
    --friendId '1gwljHsF' \
    --friendIds 'tayCCmNH,o8IDrBWS,0ZsvoykV' \
    --limit '52' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 25 'GetListOfFriends' test.out

#- 26 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'rl2Bw37u' \
    --friendId 'PcvM0PwJ' \
    --limit '90' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 26 'GetIncomingFriendRequests' test.out

#- 27 AdminListFriendsOfFriends
./ng net.accelbyte.sdk.cli.Main lobby adminListFriendsOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'SOBo1xnK' \
    --friendId '6YuATTvW' \
    --limit '98' \
    --nopaging  \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 27 'AdminListFriendsOfFriends' test.out

#- 28 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2pnRVYr' \
    --limit '23' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 28 'GetOutgoingFriendRequests' test.out

#- 29 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 29 'AdminGetGlobalConfig' test.out

#- 30 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"GqfBhUSs": ["NotoWQMs", "4TrOSmag", "7B6EB6Ok"], "TGMtpJX9": ["koswbldc", "J4VeI3Xs", "TasdexGI"], "IEmLNyGO": ["I9W5uYvu", "5iKQr7Tr", "lc08wyfK"]}, "regionURLMapping": ["3nk5wgqN", "vLydyY1m", "RNfheV5U"], "testGameMode": "cHMizMAZ", "testRegionURLMapping": ["7dh1QB2r", "yNcAgzrN", "tktqaG3f"], "testTargetUserIDs": ["3iZlspwQ", "HcW3sQsa", "ksfrzKQk"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGlobalConfig' test.out

#- 31 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteGlobalConfig' test.out

#- 32 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "EbDiDSWJ", "topicName": "OpWsAP4P", "userIds": ["NLdZiHWm", "J8bdXOYC", "2gnMYgTX"]}' \
    > test.out 2>&1
eval_tap $? 32 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 33 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "A233ciII", "topicName": "W2DxAR58"}' \
    > test.out 2>&1
eval_tap $? 33 'SendUsersFreeformNotificationV1Admin' test.out

#- 34 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qQHssFSa' \
    --body '{"message": "NTQkjsBO", "topicName": "J7WRQ81O"}' \
    > test.out 2>&1
eval_tap $? 34 'SendPartyFreeformNotificationV1Admin' test.out

#- 35 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lpd8goxY' \
    --body '{"templateContext": {"y6dFIUNK": "f7yg4BIf", "e2WDZSDv": "YMIf403F", "pW0doyTP": "K4s9S36w"}, "templateLanguage": "lGzlrW0W", "templateSlug": "AQHFdTOi", "topicName": "VagCyGNw"}' \
    > test.out 2>&1
eval_tap $? 35 'SendPartyTemplatedNotificationV1Admin' test.out

#- 36 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetAllNotificationTemplatesV1Admin' test.out

#- 37 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "fCmb5f1f", "templateLanguage": "xAaEyIzt", "templateSlug": "QwwWUCUf"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNotificationTemplateV1Admin' test.out

#- 38 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"atwEecUu": "schOdJoR", "ZidHUwoj": "8wlnqKTR", "lpYs6tgc": "oA42RC6x"}, "templateLanguage": "QUhSWBL4", "templateSlug": "NSjnjFPm", "topicName": "BlNjY1B3"}' \
    > test.out 2>&1
eval_tap $? 38 'SendUsersTemplatedNotificationV1Admin' test.out

#- 39 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'Hs0OyXSN' \
    --after 'RjEeXHQd' \
    --before 'YgoyHMvT' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 39 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 40 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'Qf1rzSgn' \
    > test.out 2>&1
eval_tap $? 40 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 41 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'K9WeWbsp' \
    --templateSlug 'XpHod5A8' \
    > test.out 2>&1
eval_tap $? 41 'GetSingleTemplateLocalizationV1Admin' test.out

#- 42 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'HP2RSU9n' \
    --templateSlug 'PlS5llDH' \
    --body '{"templateContent": "Bfe1rfIw"}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateTemplateLocalizationV1Admin' test.out

#- 43 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Uw9xmgUp' \
    --templateSlug 'a4xD9oXl' \
    > test.out 2>&1
eval_tap $? 43 'DeleteTemplateLocalizationV1Admin' test.out

#- 44 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0yw3t4GE' \
    --templateSlug 'L1a51AFS' \
    > test.out 2>&1
eval_tap $? 44 'PublishTemplateLocalizationV1Admin' test.out

#- 45 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'yYaTVM0K' \
    --before '4PipHtvV' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 45 'GetAllNotificationTopicsV1Admin' test.out

#- 46 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FnsQAm76", "topicName": "9yFhJNIS"}' \
    > test.out 2>&1
eval_tap $? 46 'CreateNotificationTopicV1Admin' test.out

#- 47 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'hH56pvpH' \
    > test.out 2>&1
eval_tap $? 47 'GetNotificationTopicV1Admin' test.out

#- 48 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'm7hagUmi' \
    --body '{"description": "htzpzWSR"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateNotificationTopicV1Admin' test.out

#- 49 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'sR2yVV2k' \
    > test.out 2>&1
eval_tap $? 49 'DeleteNotificationTopicV1Admin' test.out

#- 50 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'akqTkWFd' \
    --body '{"message": "GCQq9si7", "topicName": "cgZgMd5s"}' \
    > test.out 2>&1
eval_tap $? 50 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 51 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ugvlz3rp' \
    --body '{"templateContext": {"HraRAmSN": "WGQrMVdD", "ygKoZu23": "kcflnS3L", "yo7LAcIf": "1ygHl1e0"}, "templateLanguage": "AKcYKbCt", "templateSlug": "GCMZvUg4", "topicName": "bUhAFYcc"}' \
    > test.out 2>&1
eval_tap $? 51 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 52 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I00VwXPw' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPartyDataV1' test.out

#- 53 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sBpMgpGK' \
    --body '{"custom_attribute": {"zTfSkTdj": {}, "LBmSbhCu": {}, "puYiVsZE": {}}, "updatedAt": 77}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdatePartyAttributesV1' test.out

#- 54 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fxDb8gpf' \
    --userId 'urOwqXm6' \
    > test.out 2>&1
eval_tap $? 54 'AdminJoinPartyV1' test.out

#- 55 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBPIHRTa' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetUserPartyV1' test.out

#- 56 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'AdminGetLobbyCCU' test.out

#- 57 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["2LXyc1Ic", "fLTzNLEP", "g33TmX8S"]}' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 58 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'whiu6gqf' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetAllPlayerSessionAttribute' test.out

#- 59 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '6ARDg5YD' \
    --body '{"attributes": {"2aMj4Afj": "gzkcwpRA", "QXucjOKk": "j0PVhjX7", "a92gOuSk": "0AA0XlnV"}}' \
    > test.out 2>&1
eval_tap $? 59 'AdminSetPlayerSessionAttribute' test.out

#- 60 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute '8NPzJdf5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOMtChJL' \
    > test.out 2>&1
eval_tap $? 60 'AdminGetPlayerSessionAttribute' test.out

#- 61 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Di1u86I8' \
    > test.out 2>&1
eval_tap $? 61 'AdminGetPlayerBlockedPlayersV1' test.out

#- 62 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0repx2l' \
    > test.out 2>&1
eval_tap $? 62 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 63 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzXiGaxD' \
    --body '{"listBlockedUserId": ["e9RRXPaT", "et1wniJn", "C3prLPHE"]}' \
    > test.out 2>&1
eval_tap $? 63 'AdminBulkBlockPlayersV1' test.out

#- 64 AdminBulkUnblockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkUnblockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NUsaF08W' \
    --body '{"listUnblockUserId": ["ru4j8Mmh", "scSMZ6sc", "dpLVKSno"]}' \
    > test.out 2>&1
eval_tap $? 64 'AdminBulkUnblockPlayersV1' test.out

#- 65 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "im7lBkox"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminDebugProfanityFilters' test.out

#- 66 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'dChHmGvP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetProfanityListFiltersV1' test.out

#- 67 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'smHmBYtq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "QoZyxhLv", "note": "xTYgB9nt"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminAddProfanityFilterIntoList' test.out

#- 68 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list '1VOUyTPk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "mjUt9tZt", "note": "dPLSKWOU"}, {"filter": "ro4mJQCc", "note": "dJA5z8y6"}, {"filter": "uVlo3wAU", "note": "8aTlnjqM"}]}' \
    > test.out 2>&1
eval_tap $? 68 'AdminAddProfanityFilters' test.out

#- 69 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'J5uoVTBs' \
    --namespace "$AB_NAMESPACE" \
    --body '[68, 30, 56]' \
    > test.out 2>&1
eval_tap $? 69 'AdminImportProfanityFiltersFromFile' test.out

#- 70 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'O9lAkAY4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "pZWF2hnM"}' \
    > test.out 2>&1
eval_tap $? 70 'AdminDeleteProfanityFilter' test.out

#- 71 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'AdminGetProfanityLists' test.out

#- 72 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": false, "name": "HnhPdqS4"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminCreateProfanityList' test.out

#- 73 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'bWzPyQvz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "DnSylcn5"}' \
    > test.out 2>&1
eval_tap $? 73 'AdminUpdateProfanityList' test.out

#- 74 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list '9zuUd8MG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'AdminDeleteProfanityList' test.out

#- 75 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'AdminGetProfanityRule' test.out

#- 76 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "ci5arfTz"}' \
    > test.out 2>&1
eval_tap $? 76 'AdminSetProfanityRuleForNamespace' test.out

#- 77 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "C9Gmi1Ao", "profanityLevel": "akq9MWBE"}' \
    > test.out 2>&1
eval_tap $? 77 'AdminVerifyMessageProfanityResponse' test.out

#- 78 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'AdminGetThirdPartyConfig' test.out

#- 79 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "rTGvNlBC"}' \
    > test.out 2>&1
eval_tap $? 79 'AdminUpdateThirdPartyConfig' test.out

#- 80 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "l9Ldg76d"}' \
    > test.out 2>&1
eval_tap $? 80 'AdminCreateThirdPartyConfig' test.out

#- 81 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'AdminDeleteThirdPartyConfig' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out

#- 83 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y68jaq9E' \
    > test.out 2>&1
eval_tap $? 83 'PublicGetPartyDataV1' test.out

#- 84 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eKpgTKEe' \
    --body '{"custom_attribute": {"P7ddAMte": {}, "3IeCmUM6": {}, "cuRmirXk": {}}, "updatedAt": 28}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdatePartyAttributesV1' test.out

#- 85 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xrm7eYmx' \
    --body '{"limit": 57}' \
    > test.out 2>&1
eval_tap $? 85 'PublicSetPartyLimitV1' test.out

#- 86 PublicPlayerBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicPlayerBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blockedUserId": "IejodDE2"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicPlayerBlockPlayersV1' test.out

#- 87 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'PublicGetPlayerBlockedPlayersV1' test.out

#- 88 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 89 PublicUnblockPlayerV1
./ng net.accelbyte.sdk.cli.Main lobby publicUnblockPlayerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "qTW72OXo"}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUnblockPlayerV1' test.out

#- 90 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'eTWDBN2k' \
    > test.out 2>&1
eval_tap $? 90 'UsersPresenceHandlerV1' test.out

#- 91 UsersPresenceHandlerV2
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV2 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --body '{"userIDs": ["kqWxnJRb", "LQSquNbP", "iaS6gS0b"]}' \
    > test.out 2>&1
eval_tap $? 91 'UsersPresenceHandlerV2' test.out

#- 92 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "iON9Hbuh", "topic": "lgSxNkx4"}' \
    > test.out 2>&1
eval_tap $? 92 'FreeFormNotification' test.out

#- 93 GetMyNotifications
./ng net.accelbyte.sdk.cli.Main lobby getMyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endTime '70' \
    --limit '38' \
    --offset '1' \
    --startTime '67' \
    > test.out 2>&1
eval_tap $? 93 'GetMyNotifications' test.out

#- 94 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"313FM2JD": "RKXswEOx", "Eo7bBYKo": "4OMUNiLz", "qj4mWoxr": "RjXFcL1X"}, "templateLanguage": "ygTsIgIC", "templateSlug": "tiAm2Y3h", "topic": "FxSrz6dS"}' \
    > test.out 2>&1
eval_tap $? 94 'NotificationWithTemplate' test.out

#- 95 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetGameTemplate' test.out

#- 96 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "fqu4JhdT", "templateLanguage": "2OF4yyVG", "templateSlug": "OHefgslw"}' \
    > test.out 2>&1
eval_tap $? 96 'CreateTemplate' test.out

#- 97 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'YUbvDe3I' \
    --after 's1ZBTacg' \
    --before 'VQwrE2ae' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 97 'GetSlugTemplate' test.out

#- 98 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'oVA1mZlU' \
    > test.out 2>&1
eval_tap $? 98 'DeleteTemplateSlug' test.out

#- 99 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'xF2LiQod' \
    --templateSlug 'nsX7zEmy' \
    > test.out 2>&1
eval_tap $? 99 'GetLocalizationTemplate' test.out

#- 100 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'kf4KklNr' \
    --templateSlug 'uzMN1rIf' \
    --body '{"templateContent": "ggz4Lyr9"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateLocalizationTemplate' test.out

#- 101 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'XQt3PsPY' \
    --templateSlug 'EJyqamrn' \
    > test.out 2>&1
eval_tap $? 101 'DeleteTemplateLocalization' test.out

#- 102 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '1SRgTBaR' \
    --templateSlug '6HGia1DI' \
    > test.out 2>&1
eval_tap $? 102 'PublishTemplate' test.out

#- 103 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'lYWxQNSn' \
    --before 'r4Z35plF' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 103 'GetTopicByNamespace' test.out

#- 104 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "U0fw5C9H", "topic": "8FMZwEoX"}' \
    > test.out 2>&1
eval_tap $? 104 'CreateTopic' test.out

#- 105 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'O8gOx2P4' \
    > test.out 2>&1
eval_tap $? 105 'GetTopicByTopicName' test.out

#- 106 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '52UHJrP8' \
    --body '{"description": "Dp8fv0en"}' \
    > test.out 2>&1
eval_tap $? 106 'UpdateTopicByTopicName' test.out

#- 107 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '71jyoFRg' \
    > test.out 2>&1
eval_tap $? 107 'DeleteTopicByTopicName' test.out

#- 108 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '3mPEuZht' \
    --body '{"message": "i3EfWYP6", "topic": "HKZKesYz"}' \
    > test.out 2>&1
eval_tap $? 108 'FreeFormNotificationByUserID' test.out

#- 109 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'aiSIWR7C' \
    --body '{"templateContext": {"g9GC8tep": "hVIcXE0j", "zDvhwhJz": "ztRYYWcZ", "h8IRtVnd": "8lMIE1YV"}, "templateLanguage": "fEyJlrwo", "templateSlug": "gcHOYQJa", "topic": "9OVeq00l"}' \
    > test.out 2>&1
eval_tap $? 109 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
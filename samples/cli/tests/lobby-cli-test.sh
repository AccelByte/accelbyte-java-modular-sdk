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
    --limit '87' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserIncomingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 4 'GetUserIncomingFriendsWithTime' test.out

#- 5 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 5 'GetUserOutgoingFriends' test.out

#- 6 GetUserOutgoingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 6 'GetUserOutgoingFriendsWithTime' test.out

#- 7 GetUserFriendsWithPlatform
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsWithPlatform \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 7 'GetUserFriendsWithPlatform' test.out

#- 8 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "ZsnSUrEC", "friendPublicId": "xqpc01RS"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "aRwxFe4L"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "9OEhSqAa"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "gvhQCmxW"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'C4qF3mcB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "5lrCiyJC"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'DCFsAswk' \
    --body '{"friendIds": ["UX42p9g7", "7AHHal5Z", "rsYEnoBB"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 BulkDeleteFriends
./ng net.accelbyte.sdk.cli.Main lobby bulkDeleteFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1qkAonG' \
    --body '{"friendIds": ["xe6ANcLv", "A9K3QTJZ", "O7JZv4GD"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkDeleteFriends' test.out

#- 16 SyncNativeFriends
./ng net.accelbyte.sdk.cli.Main lobby syncNativeFriends \
    --namespace "$AB_NAMESPACE" \
    --body '[{"isLogin": true, "platformId": "Q27qsc8y", "platformToken": "G4pYLatp", "psnEnv": "PLqd92jB"}, {"isLogin": true, "platformId": "R9SzqhLI", "platformToken": "JWGWSFkr", "psnEnv": "dCJGBe6m"}, {"isLogin": true, "platformId": "9jcgzH7y", "platformToken": "MzmZzwHm", "psnEnv": "CkRUdjLH"}]' \
    > test.out 2>&1
eval_tap $? 16 'SyncNativeFriends' test.out

#- 17 SyncNativeBlockedUser
./ng net.accelbyte.sdk.cli.Main lobby syncNativeBlockedUser \
    --namespace "$AB_NAMESPACE" \
    --body '[{"platformId": "dCKZ3XoW", "psnEnv": "UvhYXTaC"}, {"platformId": "v9Z5yevC", "psnEnv": "OXJyb7Qi"}, {"platformId": "GmkHnVJo", "psnEnv": "Y7h5uOAW"}]' \
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
    --body '{"logLevel": "debug", "logLevelDB": "trace", "slowQueryThreshold": 79, "socketLogEnabled": false}' \
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
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": true, "autoKickOnDisconnectDelay": 79, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 86, "chatRateLimitDuration": 94, "concurrentUsersLimit": 34, "disableInvitationOnJoinParty": true, "enableChat": false, "entitlementCheck": false, "entitlementItemID": "CUIWsNtZ", "generalRateLimitBurst": 87, "generalRateLimitDuration": 57, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 64, "maxFriendsLimit": 97, "maxPartyMember": 81, "profanityFilter": true, "readyConsentTimeout": 49, "unregisterDelay": 78}' \
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
    --userId 'JMVf0Q16' \
    --friendId 'kZEHxG0u' \
    --friendIds 'BNby0fZm,LURAfsR2,sGGcosfJ' \
    --limit '54' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 25 'GetListOfFriends' test.out

#- 26 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQHnlCtd' \
    --friendId 'ANAcHlqn' \
    --limit '97' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 26 'GetIncomingFriendRequests' test.out

#- 27 AdminListFriendsOfFriends
./ng net.accelbyte.sdk.cli.Main lobby adminListFriendsOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tqf1tXZg' \
    --friendId '56H3x6nQ' \
    --limit '91' \
    --nopaging  \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 27 'AdminListFriendsOfFriends' test.out

#- 28 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'RtWyvtC0' \
    --limit '69' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 28 'GetOutgoingFriendRequests' test.out

#- 29 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 29 'AdminGetGlobalConfig' test.out

#- 30 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"e0E6X9yg": ["7YAzFMgk", "Jm4rkY6E", "YRxP2N02"], "ur9ODSS2": ["tN5IuWoY", "wqq2FnEt", "p6Bygu5y"], "o5FoLtBp": ["5NSGwOkC", "W80SRYHD", "qy1in6XA"]}, "regionURLMapping": ["mbqmujPX", "kXVlp0Ed", "egvGklOG"], "testGameMode": "aVNg2fNq", "testRegionURLMapping": ["mZZymRHO", "ZExMpKja", "Tb7pTue7"], "testTargetUserIDs": ["qb06inn5", "2FD1t3QR", "OGTlbVBK"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGlobalConfig' test.out

#- 31 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteGlobalConfig' test.out

#- 32 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "Qyg9Fn5z", "topicName": "2oGAWIk6", "userIds": ["FjU73mqi", "HWkfWcao", "GSn5Dhih"]}' \
    > test.out 2>&1
eval_tap $? 32 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 33 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "cUlpCZxQ", "topicName": "k4RGaqSp"}' \
    > test.out 2>&1
eval_tap $? 33 'SendUsersFreeformNotificationV1Admin' test.out

#- 34 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'T89FqE1k' \
    --body '{"message": "CSLagoq9", "topicName": "rIOT1gug"}' \
    > test.out 2>&1
eval_tap $? 34 'SendPartyFreeformNotificationV1Admin' test.out

#- 35 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Dw1hhK0W' \
    --body '{"templateContext": {"1ZoUnn8g": "1t8q4Erd", "rqG1b6eH": "ncAlD1d4", "mW3OogfA": "4jU9wQap"}, "templateLanguage": "QLvgRIZH", "templateSlug": "AKFSE06G", "topicName": "Twx3rVyf"}' \
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
    --body '{"templateContent": "VJmzbd8l", "templateLanguage": "dpqqa0DZ", "templateSlug": "ib1gFlyt"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNotificationTemplateV1Admin' test.out

#- 38 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"LEfPaEe1": "BMcQem6O", "ZBfCUTWL": "KZcchRj9", "ZqICT4BL": "M0gMArb4"}, "templateLanguage": "8Q4edoox", "templateSlug": "6noXZj2I", "topicName": "2gOXKfM4"}' \
    > test.out 2>&1
eval_tap $? 38 'SendUsersTemplatedNotificationV1Admin' test.out

#- 39 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'GquIhkX3' \
    --after 'Zv2v4Tkn' \
    --before 'LkmHaNrc' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 39 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 40 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug '2EVCWeN0' \
    > test.out 2>&1
eval_tap $? 40 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 41 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'WYGBuPza' \
    --templateSlug 'lA0Q9xGc' \
    > test.out 2>&1
eval_tap $? 41 'GetSingleTemplateLocalizationV1Admin' test.out

#- 42 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'VybAbmZn' \
    --templateSlug 'oZNmgQKg' \
    --body '{"templateContent": "deH1La34"}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateTemplateLocalizationV1Admin' test.out

#- 43 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '8Y87dhJH' \
    --templateSlug 'of6UHzvf' \
    > test.out 2>&1
eval_tap $? 43 'DeleteTemplateLocalizationV1Admin' test.out

#- 44 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '5p76xLZw' \
    --templateSlug 'sTYN1JiI' \
    > test.out 2>&1
eval_tap $? 44 'PublishTemplateLocalizationV1Admin' test.out

#- 45 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after '9jkMwfNp' \
    --before 'X6otv8G4' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 45 'GetAllNotificationTopicsV1Admin' test.out

#- 46 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oCgpyNaF", "topicName": "cYtrGfP6"}' \
    > test.out 2>&1
eval_tap $? 46 'CreateNotificationTopicV1Admin' test.out

#- 47 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'kZ9QjJdX' \
    > test.out 2>&1
eval_tap $? 47 'GetNotificationTopicV1Admin' test.out

#- 48 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'iqu4CcVs' \
    --body '{"description": "M4wfDOSU"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateNotificationTopicV1Admin' test.out

#- 49 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'XCnslDqx' \
    > test.out 2>&1
eval_tap $? 49 'DeleteNotificationTopicV1Admin' test.out

#- 50 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'AW21zYNM' \
    --body '{"message": "2tFKhELr", "topicName": "534LBXYL"}' \
    > test.out 2>&1
eval_tap $? 50 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 51 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 's020ebNv' \
    --body '{"templateContext": {"CmVBBF7j": "cnb1qnhl", "cNBxL0ge": "6KxsrVRZ", "WzfhnjP6": "QOFRhPzQ"}, "templateLanguage": "EtLcLnR4", "templateSlug": "siYYOlaI", "topicName": "J5p6YVl4"}' \
    > test.out 2>&1
eval_tap $? 51 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 52 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WoApk5p1' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPartyDataV1' test.out

#- 53 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TcYdwi3b' \
    --body '{"custom_attribute": {"mRXSEht6": {}, "duLC8l6E": {}, "AvVJH0Md": {}}, "updatedAt": 16}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdatePartyAttributesV1' test.out

#- 54 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eZBHppA9' \
    --userId 'CUPFfuen' \
    > test.out 2>&1
eval_tap $? 54 'AdminJoinPartyV1' test.out

#- 55 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5TzPzZBb' \
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
    --body '{"listBlockedUserId": ["fk5BGU3H", "ak1jOt0K", "eJNpvBOu"]}' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 58 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'LvBmCW24' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetAllPlayerSessionAttribute' test.out

#- 59 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '0EFzqoLe' \
    --body '{"attributes": {"qQ7Cj6Lk": "MvgcphSH", "jAITttrO": "negw1kBj", "gUtGOHBE": "kE3s21oA"}}' \
    > test.out 2>&1
eval_tap $? 59 'AdminSetPlayerSessionAttribute' test.out

#- 60 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'EyPwUAYi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wAZ2hiSV' \
    > test.out 2>&1
eval_tap $? 60 'AdminGetPlayerSessionAttribute' test.out

#- 61 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ghn9YwxD' \
    > test.out 2>&1
eval_tap $? 61 'AdminGetPlayerBlockedPlayersV1' test.out

#- 62 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GftWsXYG' \
    > test.out 2>&1
eval_tap $? 62 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 63 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTH5uYAb' \
    --body '{"listBlockedUserId": ["10zbJjFx", "gDFqsK50", "L85ZaxY1"]}' \
    > test.out 2>&1
eval_tap $? 63 'AdminBulkBlockPlayersV1' test.out

#- 64 AdminBulkUnblockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkUnblockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fTYtXHza' \
    --body '{"listUnblockUserId": ["NOIsXC98", "XYiCaUz6", "cWDvIibL"]}' \
    > test.out 2>&1
eval_tap $? 64 'AdminBulkUnblockPlayersV1' test.out

#- 65 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "Gw2kdOTZ"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminDebugProfanityFilters' test.out

#- 66 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'XMx9eAQf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetProfanityListFiltersV1' test.out

#- 67 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'kCihRoeY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "e0gsnFus", "note": "ApTNPK46"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminAddProfanityFilterIntoList' test.out

#- 68 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'hYnrldfN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "Z591VTOF", "note": "9GYuwSiI"}, {"filter": "Zc26RwQ2", "note": "ndSrirMD"}, {"filter": "HHQ9N77U", "note": "iBTNFrR2"}]}' \
    > test.out 2>&1
eval_tap $? 68 'AdminAddProfanityFilters' test.out

#- 69 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'g9jl0hNi' \
    --namespace "$AB_NAMESPACE" \
    --body '[27, 37, 9]' \
    > test.out 2>&1
eval_tap $? 69 'AdminImportProfanityFiltersFromFile' test.out

#- 70 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'whoEW8be' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "SjpWhPgC"}' \
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
    --body '{"isEnabled": true, "isMandatory": false, "name": "DajvUJs3"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminCreateProfanityList' test.out

#- 73 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'ymG33KtO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "JKT8s5i7"}' \
    > test.out 2>&1
eval_tap $? 73 'AdminUpdateProfanityList' test.out

#- 74 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'U4oj3rwD' \
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
    --body '{"rule": "iuBO9G3u"}' \
    > test.out 2>&1
eval_tap $? 76 'AdminSetProfanityRuleForNamespace' test.out

#- 77 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "dQjN6fOW", "profanityLevel": "FeZoqot8"}' \
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
    --body '{"apiKey": "tskp9yPe"}' \
    > test.out 2>&1
eval_tap $? 79 'AdminUpdateThirdPartyConfig' test.out

#- 80 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "1RDNYDFV"}' \
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
    --partyId '75z3HrCN' \
    > test.out 2>&1
eval_tap $? 83 'PublicGetPartyDataV1' test.out

#- 84 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'egMkMi3q' \
    --body '{"custom_attribute": {"UNdbmghB": {}, "VTWvmteC": {}, "RX1EMI0s": {}}, "updatedAt": 48}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdatePartyAttributesV1' test.out

#- 85 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oDinH43V' \
    --body '{"limit": 11}' \
    > test.out 2>&1
eval_tap $? 85 'PublicSetPartyLimitV1' test.out

#- 86 PublicPlayerBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicPlayerBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blockedUserId": "ZsSlcrto"}' \
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
    --body '{"userId": "HY05demp"}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUnblockPlayerV1' test.out

#- 90 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'hpIuHWiT' \
    > test.out 2>&1
eval_tap $? 90 'UsersPresenceHandlerV1' test.out

#- 91 UsersPresenceHandlerV2
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV2 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --body '{"userIDs": ["GgqQ4at2", "MK39JwjV", "ktzN7IxV"]}' \
    > test.out 2>&1
eval_tap $? 91 'UsersPresenceHandlerV2' test.out

#- 92 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "TVnSp5Qa", "topic": "VB3XXzNp"}' \
    > test.out 2>&1
eval_tap $? 92 'FreeFormNotification' test.out

#- 93 GetMyNotifications
./ng net.accelbyte.sdk.cli.Main lobby getMyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endTime '12' \
    --limit '36' \
    --offset '35' \
    --startTime '70' \
    > test.out 2>&1
eval_tap $? 93 'GetMyNotifications' test.out

#- 94 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"6MXhFlUp": "yqp26ySo", "tkypNgkE": "AzzGnspu", "oC0wHEq6": "v55WMTe2"}, "templateLanguage": "dUYFJt4N", "templateSlug": "hSqrkmUZ", "topic": "qwrDHEHu"}' \
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
    --body '{"templateContent": "xYm0wYcU", "templateLanguage": "ex5H9eso", "templateSlug": "mbHXUGQN"}' \
    > test.out 2>&1
eval_tap $? 96 'CreateTemplate' test.out

#- 97 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'WBgjiOof' \
    --after 'JimRwhoy' \
    --before 'HRt0RKPQ' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 97 'GetSlugTemplate' test.out

#- 98 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'DvXpXGDI' \
    > test.out 2>&1
eval_tap $? 98 'DeleteTemplateSlug' test.out

#- 99 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'POUwh7QK' \
    --templateSlug 'D0KhH7hr' \
    > test.out 2>&1
eval_tap $? 99 'GetLocalizationTemplate' test.out

#- 100 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'XFAWDOky' \
    --templateSlug 'JPDXbiWX' \
    --body '{"templateContent": "w7wpOpfF"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateLocalizationTemplate' test.out

#- 101 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'x2CJdXsC' \
    --templateSlug 'uamN4KVb' \
    > test.out 2>&1
eval_tap $? 101 'DeleteTemplateLocalization' test.out

#- 102 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Q29pNywU' \
    --templateSlug 'wtwwlhlw' \
    > test.out 2>&1
eval_tap $? 102 'PublishTemplate' test.out

#- 103 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'hWJhLnd5' \
    --before 's8upYH37' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 103 'GetTopicByNamespace' test.out

#- 104 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "de1vGLxs", "topic": "GzjTkf5w"}' \
    > test.out 2>&1
eval_tap $? 104 'CreateTopic' test.out

#- 105 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '5MqmFj0C' \
    > test.out 2>&1
eval_tap $? 105 'GetTopicByTopicName' test.out

#- 106 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'sOwTBIZq' \
    --body '{"description": "6zJTKl7u"}' \
    > test.out 2>&1
eval_tap $? 106 'UpdateTopicByTopicName' test.out

#- 107 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'qSXwDCGe' \
    > test.out 2>&1
eval_tap $? 107 'DeleteTopicByTopicName' test.out

#- 108 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGqfWlCz' \
    --body '{"message": "d45w0gs5", "topic": "rKUNWg0W"}' \
    > test.out 2>&1
eval_tap $? 108 'FreeFormNotificationByUserID' test.out

#- 109 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'iAH7RimR' \
    --body '{"templateContext": {"uns57bk8": "k8s5jyUc", "jbqGVNyQ": "3rpSRufD", "9Nui4Xqt": "9aoTySmG"}, "templateLanguage": "Kb4zrlzN", "templateSlug": "8TPs6HmJ", "topic": "SCaySvT6"}' \
    > test.out 2>&1
eval_tap $? 109 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
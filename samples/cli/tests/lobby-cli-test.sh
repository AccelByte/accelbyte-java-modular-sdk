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
echo "1..100"

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
    --limit '35' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserIncomingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 4 'GetUserIncomingFriendsWithTime' test.out

#- 5 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 5 'GetUserOutgoingFriends' test.out

#- 6 GetUserOutgoingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 6 'GetUserOutgoingFriendsWithTime' test.out

#- 7 GetUserFriendsWithPlatform
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsWithPlatform \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 7 'GetUserFriendsWithPlatform' test.out

#- 8 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "2CPlaaMN", "friendPublicId": "NXuEzOGq"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "XywfVVWc"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "SqKWRWNK"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "bviHkJC2"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'wWlrgEMt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "tTk1jiSX"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'N63SoUEp' \
    --body '{"friendIds": ["JF19V0Ri", "vCOJqDFT", "PXqjptTP"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 BulkDeleteFriends
./ng net.accelbyte.sdk.cli.Main lobby bulkDeleteFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9dLt4eF' \
    --body '{"friendIds": ["dO9nKNyr", "cP3OQf7q", "6fxiihA1"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkDeleteFriends' test.out

#- 16 SyncNativeFriends
./ng net.accelbyte.sdk.cli.Main lobby syncNativeFriends \
    --namespace "$AB_NAMESPACE" \
    --body '[{"isLogin": true, "platformId": "pfQpr9F5", "platformToken": "tTsT7YVI", "psnEnv": "DcYkYgp3"}, {"isLogin": true, "platformId": "UEZGZosy", "platformToken": "mAGeMBeO", "psnEnv": "XOOOXuLO"}, {"isLogin": false, "platformId": "vq2wXIY4", "platformToken": "kXzw4buD", "psnEnv": "64xj8GGp"}]' \
    > test.out 2>&1
eval_tap $? 16 'SyncNativeFriends' test.out

#- 17 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigV1' test.out

#- 18 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigV1' test.out

#- 19 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": true, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": true, "autoKickOnDisconnectDelay": 31, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 99, "chatRateLimitDuration": 6, "concurrentUsersLimit": 11, "disableInvitationOnJoinParty": true, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "Hs2vII3L", "generalRateLimitBurst": 90, "generalRateLimitDuration": 50, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 10, "maxFriendsLimit": 40, "maxPartyMember": 98, "profanityFilter": true, "readyConsentTimeout": 94, "unregisterDelay": 27}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigV1' test.out

#- 20 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminExportConfigV1' test.out

#- 21 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'AdminImportConfigV1' test.out

#- 22 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'gpKxteic' \
    --friendId 'BUTiaQUH' \
    --limit '24' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 22 'GetListOfFriends' test.out

#- 23 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'MZxXeXP3' \
    --friendId 'P8IcuhV1' \
    --limit '35' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 23 'GetIncomingFriendRequests' test.out

#- 24 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'VpxZEwl9' \
    --limit '64' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 24 'GetOutgoingFriendRequests' test.out

#- 25 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 25 'AdminGetGlobalConfig' test.out

#- 26 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"nrIhzrC6": ["negbjLoD", "avXLlcGv", "GMVstNwf"], "nhQ4Hs6L": ["MXpzmFPw", "AMLchoMV", "eyqMwZm3"], "W7z8gHS0": ["Du20umHx", "Y5JRT84n", "HXHca0oy"]}, "regionURLMapping": ["oe5tBG1P", "srG2jqQX", "88knonYq"], "testGameMode": "J4DMKVIf", "testRegionURLMapping": ["rWLT8Eb2", "fRH2gJ5I", "nDzfHYfY"], "testTargetUserIDs": ["k5Vk4mbh", "L8irYyFt", "QlZu2RjT"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminUpdateGlobalConfig' test.out

#- 27 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteGlobalConfig' test.out

#- 28 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "fle1OnJQ", "topicName": "HEhPg2HI", "userIds": ["jJoR4ZLM", "Tsb59BfJ", "KUjmaUW6"]}' \
    > test.out 2>&1
eval_tap $? 28 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 29 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "pr0bygEv", "topicName": "cB12Yfj4"}' \
    > test.out 2>&1
eval_tap $? 29 'SendUsersFreeformNotificationV1Admin' test.out

#- 30 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FBKjBJTi' \
    --body '{"message": "IK1NbQ37", "topicName": "RLZI6oe2"}' \
    > test.out 2>&1
eval_tap $? 30 'SendPartyFreeformNotificationV1Admin' test.out

#- 31 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nskrOPbY' \
    --body '{"templateContext": {"95uDAgAO": "R0vOAoD0", "TNv6Toel": "f2daeeCE", "GHhcabxk": "CWQvcTEC"}, "templateLanguage": "yb8kBbsj", "templateSlug": "Zws2IVT3", "topicName": "TLAQOsVA"}' \
    > test.out 2>&1
eval_tap $? 31 'SendPartyTemplatedNotificationV1Admin' test.out

#- 32 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetAllNotificationTemplatesV1Admin' test.out

#- 33 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "aLtKu3Tr", "templateLanguage": "vzZpIo2P", "templateSlug": "mcrA5Miv"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateNotificationTemplateV1Admin' test.out

#- 34 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"n2ZMO3oM": "H34TlLN2", "fp2MLjbO": "BqNIlOSU", "abalmw1q": "9GStUKSf"}, "templateLanguage": "epaRSlCB", "templateSlug": "zGQUNVT7", "topicName": "k3jIPodv"}' \
    > test.out 2>&1
eval_tap $? 34 'SendUsersTemplatedNotificationV1Admin' test.out

#- 35 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'NiAnMXVs' \
    --after 'Mq5qVIXD' \
    --before 'FgKEqkB3' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 35 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 36 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'URPzNxzo' \
    > test.out 2>&1
eval_tap $? 36 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 37 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Hv1gO0pw' \
    --templateSlug 'SCeU6cQy' \
    > test.out 2>&1
eval_tap $? 37 'GetSingleTemplateLocalizationV1Admin' test.out

#- 38 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'lOrPBHjJ' \
    --templateSlug 'mxBVVtxe' \
    --body '{"templateContent": "91wlARko"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateTemplateLocalizationV1Admin' test.out

#- 39 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '5lVM73Mw' \
    --templateSlug 'WsoAqoms' \
    > test.out 2>&1
eval_tap $? 39 'DeleteTemplateLocalizationV1Admin' test.out

#- 40 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Zm19yHOE' \
    --templateSlug 'SXb8UUQM' \
    > test.out 2>&1
eval_tap $? 40 'PublishTemplateLocalizationV1Admin' test.out

#- 41 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'EKXiIqOo' \
    --before '7FUeGyx5' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 41 'GetAllNotificationTopicsV1Admin' test.out

#- 42 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wE5rvll4", "topicName": "cC631ySA"}' \
    > test.out 2>&1
eval_tap $? 42 'CreateNotificationTopicV1Admin' test.out

#- 43 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'bLb15rHd' \
    > test.out 2>&1
eval_tap $? 43 'GetNotificationTopicV1Admin' test.out

#- 44 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'rS0RFHeA' \
    --body '{"description": "NtKLaOYw"}' \
    > test.out 2>&1
eval_tap $? 44 'UpdateNotificationTopicV1Admin' test.out

#- 45 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'ZAJ0yvad' \
    > test.out 2>&1
eval_tap $? 45 'DeleteNotificationTopicV1Admin' test.out

#- 46 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'Silq9leF' \
    --body '{"message": "gu3cj16B", "topicName": "mkIrFJWz"}' \
    > test.out 2>&1
eval_tap $? 46 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 47 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId '4qloicVS' \
    --body '{"templateContext": {"jN0QcQXq": "tJjPvSmE", "eL5DgIHe": "j2sGhexB", "Yl6GQch3": "OhGkQWhS"}, "templateLanguage": "RyabgH27", "templateSlug": "Tqb4VKBu", "topicName": "IlwR2Vx1"}' \
    > test.out 2>&1
eval_tap $? 47 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 48 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'f0zqkLAL' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPartyDataV1' test.out

#- 49 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oLeVRhjf' \
    --body '{"custom_attribute": {"S5BNNxXP": {}, "09BO3Sak": {}, "1hqIVVte": {}}, "updatedAt": 15}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdatePartyAttributesV1' test.out

#- 50 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '3SAvzIN1' \
    --userId 'EAcPtxeu' \
    > test.out 2>&1
eval_tap $? 50 'AdminJoinPartyV1' test.out

#- 51 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hcvsbNYl' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetUserPartyV1' test.out

#- 52 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetLobbyCCU' test.out

#- 53 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["MKrr9Ftg", "fvOpw6W8", "lWkBYVXc"]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 54 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'kp1trN79' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetAllPlayerSessionAttribute' test.out

#- 55 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '7Nsi9b78' \
    --body '{"attributes": {"pM9pL1HE": "6KCk8RwU", "wGiKbN0h": "tOjKKO3Z", "mIw8pZhi": "38bnXnxi"}}' \
    > test.out 2>&1
eval_tap $? 55 'AdminSetPlayerSessionAttribute' test.out

#- 56 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'VLd0O55o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCqvaaXl' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerSessionAttribute' test.out

#- 57 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'blK0jvR7' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetPlayerBlockedPlayersV1' test.out

#- 58 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUoUzwQJ' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 59 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MAocIqzs' \
    --body '{"listBlockedUserId": ["SRvrZRWJ", "PFa2fMKr", "KHz3c7vP"]}' \
    > test.out 2>&1
eval_tap $? 59 'AdminBulkBlockPlayersV1' test.out

#- 60 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "PJcqdiis"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminDebugProfanityFilters' test.out

#- 61 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list '8KM1BZD0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminGetProfanityListFiltersV1' test.out

#- 62 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'HlfMb2vc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "S365qRJH", "note": "G5MaPdtR"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminAddProfanityFilterIntoList' test.out

#- 63 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'iI0h2BEp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "OwkqhTsZ", "note": "Sgz9bTuw"}, {"filter": "EcnsLVVX", "note": "ausSKQLn"}, {"filter": "ZQhidw2j", "note": "atzH4FBq"}]}' \
    > test.out 2>&1
eval_tap $? 63 'AdminAddProfanityFilters' test.out

#- 64 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'G42PbqDl' \
    --namespace "$AB_NAMESPACE" \
    --body '[15, 41, 78]' \
    > test.out 2>&1
eval_tap $? 64 'AdminImportProfanityFiltersFromFile' test.out

#- 65 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'gW9bPlUl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "x4iB79Dq"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminDeleteProfanityFilter' test.out

#- 66 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetProfanityLists' test.out

#- 67 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "name": "8Ayaz8tb"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminCreateProfanityList' test.out

#- 68 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'O9VRRBmA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "vvdDC5JP"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminUpdateProfanityList' test.out

#- 69 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'OBXBCxSP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'AdminDeleteProfanityList' test.out

#- 70 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'AdminGetProfanityRule' test.out

#- 71 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "TdyhJQ4t"}' \
    > test.out 2>&1
eval_tap $? 71 'AdminSetProfanityRuleForNamespace' test.out

#- 72 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "VTD3NxcL", "profanityLevel": "zKylw8yC"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminVerifyMessageProfanityResponse' test.out

#- 73 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'AdminGetThirdPartyConfig' test.out

#- 74 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "UQulY7yt"}' \
    > test.out 2>&1
eval_tap $? 74 'AdminUpdateThirdPartyConfig' test.out

#- 75 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "4hiiYvW1"}' \
    > test.out 2>&1
eval_tap $? 75 'AdminCreateThirdPartyConfig' test.out

#- 76 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'AdminDeleteThirdPartyConfig' test.out

#- 77 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 77 'PublicGetMessages' test.out

#- 78 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VOh7vkFm' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPartyDataV1' test.out

#- 79 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MfDA1gBe' \
    --body '{"custom_attribute": {"pNwq4aek": {}, "cSZb4WFK": {}, "V4JNrQJl": {}}, "updatedAt": 19}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdatePartyAttributesV1' test.out

#- 80 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'w5VrZBda' \
    --body '{"limit": 34}' \
    > test.out 2>&1
eval_tap $? 80 'PublicSetPartyLimitV1' test.out

#- 81 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicGetPlayerBlockedPlayersV1' test.out

#- 82 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 83 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds '1rcsjM8J' \
    > test.out 2>&1
eval_tap $? 83 'UsersPresenceHandlerV1' test.out

#- 84 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "9nowlFIx", "topic": "PC42gwBi"}' \
    > test.out 2>&1
eval_tap $? 84 'FreeFormNotification' test.out

#- 85 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"m4iQFBBD": "k6TZbF44", "EVnkz2f5": "3YJg683A", "JbTVC3Xe": "9X9kjzbm"}, "templateLanguage": "KfpUVVyy", "templateSlug": "smUeMFJo", "topic": "eTMxmKja"}' \
    > test.out 2>&1
eval_tap $? 85 'NotificationWithTemplate' test.out

#- 86 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'GetGameTemplate' test.out

#- 87 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "r6qSwwEV", "templateLanguage": "VKR5chG8", "templateSlug": "MjxyqMTR"}' \
    > test.out 2>&1
eval_tap $? 87 'CreateTemplate' test.out

#- 88 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug '1MVoQWmo' \
    --after '7b599P8j' \
    --before 'DAF3o5yG' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 88 'GetSlugTemplate' test.out

#- 89 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'MtYpAkly' \
    > test.out 2>&1
eval_tap $? 89 'DeleteTemplateSlug' test.out

#- 90 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'fPFo08Ix' \
    --templateSlug 'GEAGJZu6' \
    > test.out 2>&1
eval_tap $? 90 'GetLocalizationTemplate' test.out

#- 91 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ljgUU5UQ' \
    --templateSlug 'RrkGWJF4' \
    --body '{"templateContent": "4eJGejUw"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateLocalizationTemplate' test.out

#- 92 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'h1FBdWXs' \
    --templateSlug 'n6iaiGDY' \
    > test.out 2>&1
eval_tap $? 92 'DeleteTemplateLocalization' test.out

#- 93 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'jS7LYfsC' \
    --templateSlug 'rnxuKa0r' \
    > test.out 2>&1
eval_tap $? 93 'PublishTemplate' test.out

#- 94 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'Cgj7oXr7' \
    --before 'Q85zvrpp' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 94 'GetTopicByNamespace' test.out

#- 95 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "XLZTD50t", "topic": "3CD54aJz"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateTopic' test.out

#- 96 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'WvxtSelk' \
    > test.out 2>&1
eval_tap $? 96 'GetTopicByTopicName' test.out

#- 97 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'QPrdcjpW' \
    --body '{"description": "2CBLqxYn"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateTopicByTopicName' test.out

#- 98 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'lze32MMY' \
    > test.out 2>&1
eval_tap $? 98 'DeleteTopicByTopicName' test.out

#- 99 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'n8ESl7NR' \
    --body '{"message": "mtv8fr2N", "topic": "aAFaxC6j"}' \
    > test.out 2>&1
eval_tap $? 99 'FreeFormNotificationByUserID' test.out

#- 100 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'FtLlitH3' \
    --body '{"templateContext": {"50NogEH0": "HQwyCOGv", "Pgpdn7vi": "8lQvsHzd", "koHhu0gS": "9QSP8r1P"}, "templateLanguage": "Hzh3we1A", "templateSlug": "apGByDRp", "topic": "qka7oHS5"}' \
    > test.out 2>&1
eval_tap $? 100 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
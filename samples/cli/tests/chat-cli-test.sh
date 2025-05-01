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
echo "1..65"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminFilterChatMessage
./ng net.accelbyte.sdk.cli.Main chat adminFilterChatMessage \
    --namespace "$AB_NAMESPACE" \
    --detail  \
    --body '{"message": "rYDHNIPa", "timestamp": 47, "topicId": "L7nG87O0", "topicType": "GROUP", "userId": "CNpM2ea9"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminFilterChatMessage' test.out

#- 3 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'VIHISgfh,Os0U88kg,NQ9vYPQT' \
    --endCreatedAt '29' \
    --keyword 'DyyRdVHy' \
    --limit '38' \
    --offset '90' \
    --order 'tMISgoLm' \
    --senderUserId 'K985opS6' \
    --shardId 'DLYJgMna' \
    --startCreatedAt '89' \
    --topic 'GVdOmz0F,kBlHgplU,r7BSPB6v' \
    --unfiltered  \
    > test.out 2>&1
eval_tap $? 3 'AdminChatHistory' test.out

#- 4 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "NpGveb4h", "name": "ZAZgWuCQ"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateNamespaceTopic' test.out

#- 5 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '98' \
    --topicType 'JYOr5nCj' \
    > test.out 2>&1
eval_tap $? 5 'AdminTopicList' test.out

#- 6 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["zvwTVuFA", "0vLri523", "JVhQubhj"], "description": "ELceB5Dr", "isChannel": false, "isJoinable": true, "members": ["bnMWH0at", "BL4B52jJ", "FqRfpiz1"], "name": "1o7AgaPc", "shardLimit": 96, "type": "cxbjC57M"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminCreateTopic' test.out

#- 7 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '27' \
    --topicName 'v65V1bzw' \
    > test.out 2>&1
eval_tap $? 7 'AdminChannelTopicList' test.out

#- 8 AdminChannelTopicSummary
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicSummary \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminChannelTopicSummary' test.out

#- 9 AdminQueryTopicLog
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopicLog \
    --namespace "$AB_NAMESPACE" \
    --endCreatedAt '86' \
    --limit '72' \
    --offset '2' \
    --senderUserId 'HGxQOgyV' \
    --startCreatedAt '43' \
    --topicId 'NuVPSr3U' \
    --topicIds 'tKD1c8eB,WFDD4yaB,tl51thiY' \
    --userId 'BFX3nbZo' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryTopicLog' test.out

#- 10 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'iPsHjQTh' \
    --body '{"description": "XYX7KcjY", "isJoinable": false, "name": "XMVlPOJL"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateTopic' test.out

#- 11 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'ln6xLzF8' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteTopic' test.out

#- 12 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'ErfxjQGX' \
    --body '{"userIds": ["4MMBJDsS", "Ir54trw1", "uOb7OiQ1"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminBanTopicMembers' test.out

#- 13 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'MusAFE2E' \
    > test.out 2>&1
eval_tap $? 13 'AdminChannelTopicInfo' test.out

#- 14 AdminTopicChatHistory
eval_tap 0 14 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 15 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic '8SKAtoUW' \
    --body '{"message": "ASQJDcmt"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'fM0vAqKV' \
    --namespace "$AB_NAMESPACE" \
    --topic 'zuEOevO8' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'WuIE7chH' \
    --isBanned  \
    --isModerator  \
    --limit '2' \
    --offset '84' \
    --shardId '2kFTExn1' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'ZUMkSAbo' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '9nkxBg8f' \
    --body '{"userIds": ["JCLeUbYs", "0sAomNX5", "6asMgRuI"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'zz4gp6BC' \
    --userId 'RoJ2oq2R' \
    --body '{"isAdmin": true}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'VJj5Eofl' \
    --userId 'sd9tnCOy' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '74' \
    --offset '55' \
    --topic 'InodDgLk,WsqCLmsU,ULV17YSI' \
    --topicSubType 'PARTY' \
    --topicType 'PERSONAL' \
    --userId 'RWTKoDVQ' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'BKGMW2wA' \
    --includePastTopics  \
    --limit '76' \
    --offset '75' \
    --topicSubType 'SESSION' \
    --topicType 'GROUP' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryUsersTopic' test.out

#- 24 PublicGetMutedTopics
./ng net.accelbyte.sdk.cli.Main chat publicGetMutedTopics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'PublicGetMutedTopics' test.out

#- 25 PublicTopicList
./ng net.accelbyte.sdk.cli.Main chat publicTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '7' \
    --topicType 'uz4D7Slm' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'bNrMPxDW' \
    --body '{"userIDs": ["XvjNKqV2", "MwYpQ8P9", "AI9ToEug"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'i6ywmwHT' \
    --limit '9' \
    --order 'mj47R4Zz' \
    --startCreatedAt '55' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'R26bv2LL' \
    --namespace "$AB_NAMESPACE" \
    --topic 'a1792LSD' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic '5zeYxtBo' \
    --body '{"duration": 76, "userId": "TuhmpoX9"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'V8RofVTv' \
    --body '{"userIDs": ["G57yMBUt", "ZgJbSiKF", "KRzvOOv3"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'eKUsQatF' \
    --body '{"userId": "BYfVURzE"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicUnmuteUser' test.out

#- 32 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 32 'AdminGetAllConfigV1' test.out

#- 33 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main chat adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 33 'AdminGetLogConfig' test.out

#- 34 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main chat adminPatchUpdateLogConfig \
    --body '{"internalAccessLogEnabled": true, "logLevel": "trace", "logLevelDB": "fatal", "slowQueryThreshold": 51, "socketLogEnabled": false}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPatchUpdateLogConfig' test.out

#- 35 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminGetConfigV1' test.out

#- 36 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"chatRateLimitBurst": 95, "chatRateLimitDuration": 6, "concurrentUsersLimit": 47, "enableClanChat": false, "enableManualTopicCreation": false, "enablePmSendPlatformId": true, "enableProfanityFilter": true, "filterAppName": "A2kCUyen", "filterParam": "Yz22YYa9", "filterType": "aHuo56Up", "generalRateLimitBurst": 48, "generalRateLimitDuration": 86, "maxChatMessageLength": 82, "shardCapacityLimit": 17, "shardDefaultLimit": 90, "shardHardLimit": 23, "spamChatBurst": 1, "spamChatDuration": 84, "spamMuteDuration": 9}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateConfigV1' test.out

#- 37 ExportConfig
./ng net.accelbyte.sdk.cli.Main chat exportConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'ExportConfig' test.out

#- 38 ImportConfig
./ng net.accelbyte.sdk.cli.Main chat importConfig \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 38 'ImportConfig' test.out

#- 39 AdminGetInboxCategories
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'AdminGetInboxCategories' test.out

#- 40 AdminAddInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminAddInboxCategory \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 35, "hook": {"driver": "KUwZ5svR", "params": {"4aJotkcR": {}, "cWk0uVcB": {}, "qMxNqwvj": {}}}, "jsonSchema": {"weYQLpza": {}, "jDPxSH5C": {}, "qRK8iYsB": {}}, "name": "EeXv4wDO", "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category '3RD1QE13' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category '8KW2ZyXl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 12, "hook": {"driver": "98ZmCSv1", "params": {"RXPK0CcR": {}, "fhxItrVR": {}, "J0v8whEc": {}}}, "jsonSchema": {"hpWgyAAE": {}, "Hva7XejU": {}, "vBzKvBEj": {}}, "saveInbox": false, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'UVWEBpcU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'AdminGetCategorySchema' test.out

#- 44 AdminListKafkaTopic
./ng net.accelbyte.sdk.cli.Main chat adminListKafkaTopic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminListKafkaTopic' test.out

#- 45 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'I2CErawV' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteInboxMessage' test.out

#- 46 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '39' \
    --limit '62' \
    --messageId 'GRIQcXl7,GtHefft3,mnInfSfP' \
    --offset '31' \
    --order 'JV5FYuh7' \
    --scope 'NAMESPACE' \
    --startCreatedAt '4' \
    --status 'SENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 46 'AdminGetInboxMessages' test.out

#- 47 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "yvAoT4pk", "expiredAt": 14, "message": {"v8O747U2": {}, "a2nTOIBK": {}, "nomGtD56": {}}, "scope": "NAMESPACE", "status": "SENT", "userIds": ["opzSfZWB", "ibrT5rAQ", "4fV3Ct9c"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSaveInboxMessage' test.out

#- 48 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'EA3IqbET' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Kcs1c3K3", "zG3Q78c4", "BggzRvWj"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUnsendInboxMessage' test.out

#- 49 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'em9JQm4r' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '82' \
    --status 'UNREAD' \
    --userId 'Wgq2DrhC' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetInboxUsers' test.out

#- 50 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId '9Zio7XQG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 14, "message": {"opyGw1gk": {}, "7DL2l2k5": {}, "MNR5tDza": {}}, "scope": "USER", "userIds": ["iG2S41uE", "ZqMSV1CT", "sffFJVnu"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminUpdateInboxMessage' test.out

#- 51 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'mzOCZvPk' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 51 'AdminSendInboxMessage' test.out

#- 52 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'ZpvyYrJ0,cFcP3tM8,LIsHSgCX' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetInboxStats' test.out

#- 53 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'HGWpTolJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminGetChatSnapshot' test.out

#- 54 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'IL6fAFc8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteChatSnapshot' test.out

#- 55 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'EKyzxNJp' \
    --includeChildren  \
    --limit '32' \
    --offset '71' \
    --parentId 'VhQx0qXE' \
    --startWith 'AJHLfiPR' \
    --wordType 'ZY9FtrNQ' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityQuery' test.out

#- 56 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["LEiDIsPF", "Jo9dvXJl", "8rYPu2LB"], "falsePositive": ["B3NawTqo", "x6jsXtLS", "Z599Thxi"], "word": "CQssoMRn", "wordType": "8eDYZFhG"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreate' test.out

#- 57 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["mTYpBTIg", "mLNKMr0L", "IH0ZaAoc"], "falsePositive": ["mtWTRVBZ", "3a0BTlYj", "GchkegPL"], "word": "M9wYCMsq", "wordType": "4sdcq4JR"}, {"falseNegative": ["ssyBWvAn", "dWOe8wwe", "FwQFe9uv"], "falsePositive": ["bVCw6NOi", "tdVVTOhj", "VK12tUu9"], "word": "iFcJmQ5U", "wordType": "cyf4Tmu9"}, {"falseNegative": ["OX0YBd4K", "2uZRFnJr", "ZDlaKvdb"], "falsePositive": ["rrPIahZg", "EcFpDzix", "4cVZ5NTv"], "word": "iFJ6jo3x", "wordType": "mbbHFHhw"}]}' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityCreateBulk' test.out

#- 58 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityExport' test.out

#- 59 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityGroup' test.out

#- 60 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'REPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityImport' test.out

#- 61 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id '9qOdnpxO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["E0KAFUih", "yh09lMSf", "Q3Z7wMH3"], "falsePositive": ["U66FNRHz", "ZsU3QqG0", "382xSuLo"], "word": "EBf6bFSn", "wordType": "aQUgnFi5"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityUpdate' test.out

#- 62 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id '06ZnIZ5q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminProfanityDelete' test.out

#- 63 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 63 'PublicGetMessages' test.out

#- 64 PublicGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat publicGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicGetConfigV1' test.out

#- 65 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId '0QscUaZI' \
    --namespace "$AB_NAMESPACE" \
    --topic 'KEorJzXG' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
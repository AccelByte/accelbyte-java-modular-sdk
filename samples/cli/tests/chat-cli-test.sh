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
    --body '{"message": "FCrRsA3c", "timestamp": 66, "topicId": "beung6mL", "topicType": "PERSONAL", "userId": "SFKtVmgA"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminFilterChatMessage' test.out

#- 3 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'UF4NlFFQ,dBtkElbS,uBxQqtl5' \
    --endCreatedAt '47' \
    --keyword '0sElNTPF' \
    --limit '40' \
    --offset '57' \
    --order 'TCAZPIQN' \
    --senderUserId 'rN6tzHTl' \
    --shardId 'FcItyBbT' \
    --startCreatedAt '19' \
    --topic '7KhXYPpk,baaXFbBY,87EtaWEL' \
    --unfiltered  \
    > test.out 2>&1
eval_tap $? 3 'AdminChatHistory' test.out

#- 4 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "WRGPfrKj", "name": "yEemYMBS"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateNamespaceTopic' test.out

#- 5 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '72' \
    --topicType 'zoYE7po9' \
    > test.out 2>&1
eval_tap $? 5 'AdminTopicList' test.out

#- 6 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["FdmBQLGA", "bj9eYf6N", "cRZId0Pz"], "description": "PcSV0hJI", "isChannel": true, "isJoinable": false, "members": ["7kPHRX9U", "cyoXCkbJ", "DoEy8gJ3"], "name": "YXxEKBur", "shardLimit": 71, "type": "5S28Nsfb"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminCreateTopic' test.out

#- 7 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '50' \
    --topicName 'ewP9SL6G' \
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
    --endCreatedAt '58' \
    --limit '38' \
    --offset '71' \
    --senderUserId 'I46gCZYG' \
    --startCreatedAt '2' \
    --topicId 'KNZQp8Zl' \
    --topicIds 'kTVijhX5,7FfjsC7e,FirfXx7w' \
    --userId 'dEmFb28A' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryTopicLog' test.out

#- 10 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic '3T88Qe95' \
    --body '{"description": "vo3rEgTG", "isJoinable": true, "name": "x7MbK1UO"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateTopic' test.out

#- 11 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'xdjV6hPS' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteTopic' test.out

#- 12 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'Zuen8hp6' \
    --body '{"userIds": ["LktvYvEG", "iR1qGEnu", "fbSzTg85"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminBanTopicMembers' test.out

#- 13 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'UdDbVRsH' \
    > test.out 2>&1
eval_tap $? 13 'AdminChannelTopicInfo' test.out

#- 14 AdminTopicChatHistory
eval_tap 0 14 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 15 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'GBJ7RGxD' \
    --body '{"message": "0cL7ITuI"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId '5gBn6C31' \
    --namespace "$AB_NAMESPACE" \
    --topic 'FiPxeBDk' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '40EglW07' \
    --isBanned  \
    --isModerator  \
    --limit '72' \
    --offset '89' \
    --shardId 'zgdcozG5' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'lOQhbY1N' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'By2jD26n' \
    --body '{"userIds": ["01DpEjKR", "0VXTOBm4", "6N4sKD4S"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'subPdJxt' \
    --userId 'jNoNtjXh' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'OOLMmyLI' \
    --userId 'wU4VIxF4' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '52' \
    --offset '12' \
    --topic 'f9ATM5VF,rkR1Bw1S,pHyF8SEO' \
    --topicSubType 'PARTY' \
    --topicType 'GROUP' \
    --userId 'ys1xPaMT' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'GtfFpmbb' \
    --includePastTopics  \
    --limit '89' \
    --offset '20' \
    --topicSubType 'NAMESPACE' \
    --topicType 'PERSONAL' \
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
    --limit '84' \
    --offset '0' \
    --topicType 'ocgMompd' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'pWmuixWk' \
    --body '{"userIDs": ["zCnKeMIf", "ymBY5nMS", "ciKi8orc"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'nDaoYid1' \
    --limit '84' \
    --order 'dIJaBdTm' \
    --startCreatedAt '43' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'qHHcAdO6' \
    --namespace "$AB_NAMESPACE" \
    --topic 'j0QTZwJB' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'KAmC3rAa' \
    --body '{"duration": 82, "userId": "2VIOshXl"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'hB67WyOx' \
    --body '{"userIDs": ["E4SS8Ap1", "4dYlEvDY", "jYosQzBb"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'azfG5lno' \
    --body '{"userId": "Ygvo4oRU"}' \
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
    --body '{"internalAccessLogEnabled": true, "logLevel": "fatal", "logLevelDB": "debug", "slowQueryThreshold": 93, "socketLogEnabled": false}' \
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
    --body '{"chatRateLimitBurst": 63, "chatRateLimitDuration": 74, "concurrentUsersLimit": 91, "enableClanChat": false, "enableManualTopicCreation": false, "enablePmSendPlatformId": true, "enableProfanityFilter": true, "filterAppName": "WZF28vZX", "filterParam": "kGevmzG1", "filterType": "F0uwqegr", "generalRateLimitBurst": 100, "generalRateLimitDuration": 47, "maxChatMessageLength": 89, "shardCapacityLimit": 1, "shardDefaultLimit": 98, "shardHardLimit": 34, "spamChatBurst": 1, "spamChatDuration": 87, "spamMuteDuration": 45}' \
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
    --body '{"enabled": true, "expiresIn": 49, "hook": {"driver": "6hGZbqaC", "params": {"cRGjTYt3": {}, "tlfOolUH": {}, "WXwS2vem": {}}}, "jsonSchema": {"tIAs1cFy": {}, "82qDgg0s": {}, "pcJv2LND": {}}, "name": "ZVplxCkq", "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'nWd6w7Ye' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'kVxqKyUn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 53, "hook": {"driver": "pK1AgOUS", "params": {"7D8EZjLn": {}, "VadOunGQ": {}, "w7IKanL5": {}}}, "jsonSchema": {"8da6rBKz": {}, "XpN40WjL": {}, "4qmCSv5i": {}}, "saveInbox": false, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'YzMa2EbU' \
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
    --messageId 'NdZzBkcm' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteInboxMessage' test.out

#- 46 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '95' \
    --limit '5' \
    --messageId 'MmfaoYDz,rKE7aHhK,s5jHz2H5' \
    --offset '100' \
    --order 's3Bhzw0J' \
    --scope 'USER' \
    --startCreatedAt '20' \
    --status 'UNSENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 46 'AdminGetInboxMessages' test.out

#- 47 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "vBHrrXIv", "expiredAt": 15, "message": {"4mWb5JB1": {}, "3g7BwsRI": {}, "K5ubPNQO": {}}, "scope": "USER", "status": "DRAFT", "userIds": ["hXdUSnHz", "nBCpnXIF", "9bcXJ00T"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSaveInboxMessage' test.out

#- 48 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'mPMRs9gk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["y77gr8gi", "AmuQO9YQ", "wW4YuDX1"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminUnsendInboxMessage' test.out

#- 49 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'yblxWTkE' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '52' \
    --status 'UNREAD' \
    --userId 'jeaRh4xU' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetInboxUsers' test.out

#- 50 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'evu3Oole' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 56, "message": {"dp609toZ": {}, "vHI9aIRG": {}, "ozJ7wolw": {}}, "scope": "USER", "userIds": ["Ftg9hGkM", "8xGSQpdt", "rnRH9U90"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminUpdateInboxMessage' test.out

#- 51 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId '386REUUs' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 51 'AdminSendInboxMessage' test.out

#- 52 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'ZZb39Mlt,HbrsibT9,J9kauCwy' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetInboxStats' test.out

#- 53 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'CIneEcio' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminGetChatSnapshot' test.out

#- 54 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId '48t9fSmE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteChatSnapshot' test.out

#- 55 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'vL9YIt0w' \
    --includeChildren  \
    --limit '74' \
    --offset '38' \
    --parentId 'W3eHGOS4' \
    --startWith 'LUNhdwed' \
    --wordType 'ShGbW8ST' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityQuery' test.out

#- 56 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["6NeVn7bY", "1QbjFXT4", "63bKgZeA"], "falsePositive": ["Ndp8LJbi", "jIizxZKe", "BrqV3j5x"], "word": "71Z1REof", "wordType": "aLdkdMiu"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreate' test.out

#- 57 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["Ccn1hT6G", "ImreAx5X", "gBT6BCzq"], "falsePositive": ["pmdZMQnM", "gtBCzA4B", "57FpWa5N"], "word": "VqBPIaIx", "wordType": "jhGSbke2"}, {"falseNegative": ["VRwXDsPP", "PD2q7fM7", "gZ5PIJp1"], "falsePositive": ["lwq4K9l7", "LppjHUKI", "0SU7PFKb"], "word": "i2i1LjbP", "wordType": "xAgPkE9y"}, {"falseNegative": ["IMP7X66j", "16fP2Ff6", "XnR5MVhF"], "falsePositive": ["GdzY0ykX", "heMzBcfo", "5CSu7cMM"], "word": "TXE5U8F6", "wordType": "tJzCuGPC"}]}' \
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
    --limit '84' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityGroup' test.out

#- 60 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'FULLREPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityImport' test.out

#- 61 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'NMtZdKQs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["aM9qKcnB", "JjTdhwbn", "bGZwrdDU"], "falsePositive": ["tWLi8Kn1", "SVnnjbd4", "c9S0Z7zN"], "word": "vtcHLtT3", "wordType": "AJaRMf7k"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityUpdate' test.out

#- 62 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'x0JthLDX' \
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
    --chatId 'VvgIwIUy' \
    --namespace "$AB_NAMESPACE" \
    --topic 'tYoZ2NCD' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
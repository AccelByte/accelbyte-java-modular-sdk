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
echo "1..64"

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
    --body '{"message": "XMVoBuHb", "timestamp": 39, "topicId": "uzYbXOFU", "topicType": "PERSONAL", "userId": "ziFdpu2a"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminFilterChatMessage' test.out

#- 3 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'DwYfF2qN,ORlurcPz,9T5ftghG' \
    --endCreatedAt '78' \
    --keyword 'WX0G9bNt' \
    --limit '73' \
    --offset '90' \
    --order 'VSZfSSII' \
    --senderUserId 'CHp6gqJj' \
    --shardId 'bpckKrGN' \
    --startCreatedAt '67' \
    --topic 'hqub5z9k,ehmkoRrH,RGu7lvLu' \
    --unfiltered  \
    > test.out 2>&1
eval_tap $? 3 'AdminChatHistory' test.out

#- 4 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Wx3XsgO1", "name": "q4OpO3J0"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateNamespaceTopic' test.out

#- 5 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '47' \
    --topicType 'RMy9vqVr' \
    > test.out 2>&1
eval_tap $? 5 'AdminTopicList' test.out

#- 6 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["Uqa2cAEo", "m0bptCqn", "EEf11HVj"], "description": "DDaLikgS", "isChannel": true, "isJoinable": false, "members": ["PicLbHkZ", "wlL6F1Sv", "V08oIB6j"], "name": "tlQemBWk", "shardLimit": 16, "type": "e8FkdJwM"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminCreateTopic' test.out

#- 7 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '97' \
    --topicName '9aP0yfSv' \
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
    --endCreatedAt '21' \
    --limit '37' \
    --offset '21' \
    --senderUserId 'MwS3Fpv3' \
    --startCreatedAt '85' \
    --topicId 'PmwvtW30' \
    --topicIds 'HoUcO3SH,fGW7dtIL,JszAA5CJ' \
    --userId 'LtIrTyA0' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryTopicLog' test.out

#- 10 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'lVoVTDAq' \
    --body '{"description": "oimqTMqU", "isJoinable": false, "name": "ttsJfcSM"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateTopic' test.out

#- 11 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic '9mxyPJux' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteTopic' test.out

#- 12 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'J3HnA5ME' \
    --body '{"userIds": ["8SSdrRaZ", "mw0QXryK", "7fb34drB"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminBanTopicMembers' test.out

#- 13 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'favPXaEL' \
    > test.out 2>&1
eval_tap $? 13 'AdminChannelTopicInfo' test.out

#- 14 AdminTopicChatHistory
eval_tap 0 14 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 15 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'aOT2OE4z' \
    --body '{"message": "Y8fi6sgh"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'J73Yssj9' \
    --namespace "$AB_NAMESPACE" \
    --topic '1bLGRLP2' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '6zp9l447' \
    --isBanned  \
    --isModerator  \
    --limit '85' \
    --offset '51' \
    --shardId 'gF9jv9RZ' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic '7FxuCa2a' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'g35qeRFZ' \
    --body '{"userIds": ["UZPqMuNR", "Fqxdcymt", "Q1pxZflj"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'csS0LTwZ' \
    --userId '6c3QjotT' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'FshS97gU' \
    --userId 'qUdljK5r' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '41' \
    --offset '97' \
    --topic 'hY2ROxLU,taUd7Dnv,k13R8SRw' \
    --topicSubType 'CLAN' \
    --topicType 'GROUP' \
    --userId '6hPr0s1e' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'ioqfE47b' \
    --includePastTopics  \
    --limit '95' \
    --offset '18' \
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
    --limit '66' \
    --offset '99' \
    --topicType 'O6p38oUC' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'Fhgzy1As' \
    --body '{"userIDs": ["yBDwbeYu", "tLc6GgpS", "UB9TyMeX"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'JjmMkw8J' \
    --limit '86' \
    --order '997tVTt7' \
    --startCreatedAt '69' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId '1AmJCHwu' \
    --namespace "$AB_NAMESPACE" \
    --topic 'dPbmrmon' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'BlX85CPi' \
    --body '{"duration": 18, "userId": "kY6TiURt"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'fs4Z7sY0' \
    --body '{"userIDs": ["HV9eqPvF", "9o5ZA328", "32IzmIQx"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'Ss6Rwx7H' \
    --body '{"userId": "nfZj6GfZ"}' \
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
    --body '{"logLevel": "error", "logLevelDB": "debug", "slowQueryThreshold": 54, "socketLogEnabled": false}' \
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
    --body '{"chatRateLimitBurst": 45, "chatRateLimitDuration": 32, "concurrentUsersLimit": 59, "enableClanChat": true, "enableManualTopicCreation": false, "enableProfanityFilter": true, "filterAppName": "LAq7nunm", "filterParam": "6FntItOD", "filterType": "IPN9sSBR", "generalRateLimitBurst": 95, "generalRateLimitDuration": 90, "maxChatMessageLength": 60, "shardCapacityLimit": 10, "shardDefaultLimit": 53, "shardHardLimit": 20, "spamChatBurst": 0, "spamChatDuration": 62, "spamMuteDuration": 29}' \
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
    --body '{"enabled": false, "expiresIn": 16, "hook": {"driver": "Zfvi9QBX", "params": {"LFGoHc7Q": {}, "53ksHUN7": {}, "LsPYuTuE": {}}}, "jsonSchema": {"D4GFIbTY": {}, "55N5nu9q": {}, "p2BCAfOl": {}}, "name": "atx0B29a", "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'hy7xSINA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category '49jn08bV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 40, "hook": {"driver": "Nbr0Icz1", "params": {"oDDUoO16": {}, "t19JD9m9": {}, "77i4JNZV": {}}}, "jsonSchema": {"nuHFGKkQ": {}, "8lVK4Bv8": {}, "Fg883k9K": {}}, "saveInbox": true, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'FQFNeC38' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'AdminGetCategorySchema' test.out

#- 44 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'bHCfGApZ' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteInboxMessage' test.out

#- 45 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '5' \
    --limit '49' \
    --messageId 'cLqANvP3,00yc4KTl,vU5SAX5W' \
    --offset '21' \
    --order 'DbuEKetI' \
    --scope 'NAMESPACE' \
    --startCreatedAt '44' \
    --status 'DRAFT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxMessages' test.out

#- 46 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "MSP4jElG", "expiredAt": 4, "message": {"SPAVgnvx": {}, "ynLCCgW0": {}, "bPfl7CH3": {}}, "scope": "USER", "status": "SENT", "userIds": ["g7F33uXt", "qbOWGuYi", "x4OKdkff"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminSaveInboxMessage' test.out

#- 47 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'oKesvQw1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["CZzy4er4", "Uy2cUoIW", "94pwtH5f"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUnsendInboxMessage' test.out

#- 48 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'RukZTvgf' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '26' \
    --status 'UNREAD' \
    --userId 'uOfXzpAf' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxUsers' test.out

#- 49 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 't1AyxSzM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 50, "message": {"7NpDikmm": {}, "dkaJZGQ0": {}, "XZyF90gS": {}}, "scope": "NAMESPACE", "userIds": ["vNc72a3y", "RZL0xKzY", "XMXe4EEj"]}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdateInboxMessage' test.out

#- 50 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'BQ21MM0Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminSendInboxMessage' test.out

#- 51 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'gKcgTGUR,UJxvX3Ms,VQnx55Yy' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetInboxStats' test.out

#- 52 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'fI98kusL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetChatSnapshot' test.out

#- 53 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'nsbYkyqp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminDeleteChatSnapshot' test.out

#- 54 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'M9nLSVl0' \
    --includeChildren  \
    --limit '92' \
    --offset '93' \
    --parentId 'PKe1StMi' \
    --startWith 'ZeeubPNb' \
    --wordType 'jZaKJvzI' \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityQuery' test.out

#- 55 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["ba0iC8Yw", "fUn0gOpJ", "23HnPcR5"], "falsePositive": ["bGVFeedr", "bB1vSPhD", "O7eN2WR9"], "word": "XOy5sMAT", "wordType": "jsiCfCXu"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityCreate' test.out

#- 56 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["cI2HaDCA", "YYpkyqPy", "RqCzCC1f"], "falsePositive": ["R5kBmSR8", "uH9tGxkP", "mrRD7Kxd"], "word": "xFbfKykc", "wordType": "pYOYq6Vg"}, {"falseNegative": ["Jp36WA1e", "WNTaf9dG", "PzDOmuue"], "falsePositive": ["ZCbMqgtg", "V0CUyqFV", "nswdwlc9"], "word": "RTt0764S", "wordType": "CSASbWBi"}, {"falseNegative": ["aB9X4DTe", "o2lHBm6e", "eCxMUZBL"], "falsePositive": ["x54O1OlQ", "Lo5Fkass", "2aIJ99Q8"], "word": "FJlNpyCf", "wordType": "C7Ww4r9r"}]}' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityCreateBulk' test.out

#- 57 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityExport' test.out

#- 58 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityGroup' test.out

#- 59 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'FULLREPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 59 'AdminProfanityImport' test.out

#- 60 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id '8HbIfkBn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["ad1U9iZg", "bvApUCWY", "PxjqZ9ek"], "falsePositive": ["E60Wmk6t", "hjfgX6zJ", "2VyWaLTl"], "word": "R0s7jajI", "wordType": "oNyederc"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityUpdate' test.out

#- 61 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'kIWsIjvi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminProfanityDelete' test.out

#- 62 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 62 'PublicGetMessages' test.out

#- 63 PublicGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat publicGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'PublicGetConfigV1' test.out

#- 64 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId 'LLeibWgW' \
    --namespace "$AB_NAMESPACE" \
    --topic '23eheBM3' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
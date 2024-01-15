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
echo "1..60"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'iudgiMZI,GcUtgvW6,WPxxGdN4' \
    --endCreatedAt '2' \
    --keyword 'FDXLZar6' \
    --limit '31' \
    --offset '25' \
    --order 'jLyjHjzD' \
    --senderUserId 'YXhXO8bZ' \
    --shardId '2MzAPYz1' \
    --startCreatedAt '91' \
    --topic 'IZkLng6M,tZo4DrBB,ikV6LRis' \
    > test.out 2>&1
eval_tap $? 2 'AdminChatHistory' test.out

#- 3 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Xz8qs6oC", "name": "LrtAPvQw"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNamespaceTopic' test.out

#- 4 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '43' \
    --topicType 'zRY5LyYg' \
    > test.out 2>&1
eval_tap $? 4 'AdminTopicList' test.out

#- 5 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["vcyTQlUC", "x2OjYZoO", "aUnvA2lW"], "description": "tWmNLxst", "isChannel": false, "isJoinable": true, "members": ["r9r8om93", "DAZIfzYW", "Hm24asQ4"], "name": "0arTy6Qm", "shardLimit": 48, "type": "U7dtA1d2"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateTopic' test.out

#- 6 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '85' \
    --topicName 'a3oMwmDC' \
    > test.out 2>&1
eval_tap $? 6 'AdminChannelTopicList' test.out

#- 7 AdminChannelTopicSummary
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicSummary \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminChannelTopicSummary' test.out

#- 8 AdminQueryTopicLog
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopicLog \
    --namespace "$AB_NAMESPACE" \
    --endCreatedAt '38' \
    --limit '43' \
    --offset '13' \
    --senderUserId 'rqfED9dt' \
    --startCreatedAt '25' \
    --topicId 'rdjV0PRR' \
    --topicIds 'JFFfo8QD,01dasJmY,R8jxFmnL' \
    --userId 'fXQ806Gh' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryTopicLog' test.out

#- 9 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'BpcHDP7T' \
    --body '{"description": "W7kQgwBx", "isJoinable": true, "name": "V5yf5rq1"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateTopic' test.out

#- 10 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'zDOJbC3Z' \
    > test.out 2>&1
eval_tap $? 10 'AdminDeleteTopic' test.out

#- 11 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'ghSbCE8P' \
    --body '{"userIds": ["GE83C8W8", "k4QR9FZN", "vJVrGkWL"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminBanTopicMembers' test.out

#- 12 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'Ggzy6ehI' \
    > test.out 2>&1
eval_tap $? 12 'AdminChannelTopicInfo' test.out

#- 13 AdminTopicChatHistory
eval_tap 0 13 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 14 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'LC38uZEe' \
    --body '{"message": "L4UZbeM8"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminSendChat' test.out

#- 15 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'QrgIsECv' \
    --namespace "$AB_NAMESPACE" \
    --topic 'iNxa42iE' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteChat' test.out

#- 16 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'v3NmZie8' \
    --isBanned  \
    --isModerator  \
    --limit '80' \
    --offset '77' \
    --shardId 'O71Qt2yF' \
    > test.out 2>&1
eval_tap $? 16 'AdminTopicMembers' test.out

#- 17 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'UKua5IV1' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicShards' test.out

#- 18 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'ogzx9zK5' \
    --body '{"userIds": ["aiWHCeVi", "HHQ33j6Q", "ITMbMINR"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnbanTopicMembers' test.out

#- 19 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 't11oodOQ' \
    --userId 'TpDVocrF' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 19 'AdminAddTopicMember' test.out

#- 20 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'eZzKDL66' \
    --userId 'CvsLPIu3' \
    > test.out 2>&1
eval_tap $? 20 'AdminRemoveTopicMember' test.out

#- 21 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '93' \
    --offset '4' \
    --topic 'qdh9GnKy,nCPp6B6R,6qiptIXF' \
    --topicSubType 'PARTY' \
    --topicType 'GROUP' \
    --userId 'dLbezSk7' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryTopic' test.out

#- 22 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'hPTRGa2f' \
    --includePastTopics  \
    --limit '71' \
    --offset '89' \
    --topicSubType 'SESSION' \
    --topicType 'PERSONAL' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryUsersTopic' test.out

#- 23 PublicGetMutedTopics
./ng net.accelbyte.sdk.cli.Main chat publicGetMutedTopics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'PublicGetMutedTopics' test.out

#- 24 PublicTopicList
./ng net.accelbyte.sdk.cli.Main chat publicTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '81' \
    --topicType 'PORaY7GI' \
    > test.out 2>&1
eval_tap $? 24 'PublicTopicList' test.out

#- 25 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'meZJQ14a' \
    --body '{"userIDs": ["4IXxWnZB", "atYvIdGS", "ou3jp5wJ"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicBanTopicMembers' test.out

#- 26 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'qXemgdG8' \
    --limit '64' \
    --order '0kRCshPn' \
    --startCreatedAt '42' \
    > test.out 2>&1
eval_tap $? 26 'PublicChatHistory' test.out

#- 27 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'mSIDa9Ox' \
    --namespace "$AB_NAMESPACE" \
    --topic '3LkmAmOJ' \
    > test.out 2>&1
eval_tap $? 27 'PublicDeleteChat' test.out

#- 28 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'DeTWzLTx' \
    --body '{"duration": 40, "userId": "dwhalcA3"}' \
    > test.out 2>&1
eval_tap $? 28 'PublicMuteUser' test.out

#- 29 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'FV9oPSPW' \
    --body '{"userIDs": ["7CzjVIYR", "MrcL7DqM", "NYXW5tfe"]}' \
    > test.out 2>&1
eval_tap $? 29 'PublicUnbanTopicMembers' test.out

#- 30 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'l62lL308' \
    --body '{"userId": "kiocDDh7"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnmuteUser' test.out

#- 31 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAllConfigV1' test.out

#- 32 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetConfigV1' test.out

#- 33 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main chat adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"chatRateLimitBurst": 71, "chatRateLimitDuration": 24, "concurrentUsersLimit": 23, "enableClanChat": true, "enableManualTopicCreation": true, "enableProfanityFilter": false, "filterAppName": "bls3jGyd", "filterParam": "dXa2jKfW", "filterType": "3da9MJ4Z", "generalRateLimitBurst": 1, "generalRateLimitDuration": 14, "shardCapacityLimit": 21, "shardDefaultLimit": 69, "shardHardLimit": 60, "spamChatBurst": 39, "spamChatDuration": 41, "spamMuteDuration": 45}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdateConfigV1' test.out

#- 34 ExportConfig
./ng net.accelbyte.sdk.cli.Main chat exportConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ExportConfig' test.out

#- 35 ImportConfig
./ng net.accelbyte.sdk.cli.Main chat importConfig \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 35 'ImportConfig' test.out

#- 36 AdminGetInboxCategories
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminGetInboxCategories' test.out

#- 37 AdminAddInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminAddInboxCategory \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 5, "hook": {"driver": "KAFKA", "params": "XGhPr7cO"}, "jsonSchema": {"GuWfHEMg": {}, "25wv9eUi": {}, "o2YGcHJg": {}}, "name": "TtsFOZMZ", "saveInbox": false, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 37 'AdminAddInboxCategory' test.out

#- 38 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category 'qzUfq143' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteInboxCategory' test.out

#- 39 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category '7HjcDm3r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 12, "hook": {"driver": "KAFKA", "params": "4SIhjx6n"}, "jsonSchema": {"j48GAoqT": {}, "zZ3EXU6N": {}, "mgqHDWK1": {}}, "saveInbox": false, "sendNotification": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateInboxCategory' test.out

#- 40 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category '81K8S78R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'AdminGetCategorySchema' test.out

#- 41 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'pv1pR7KY' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxMessage' test.out

#- 42 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '68' \
    --limit '70' \
    --messageId 'lc2T81dP,P4hkKz9b,sH8zjXdv' \
    --offset '44' \
    --order 'BQCufhGK' \
    --scope 'USER' \
    --startCreatedAt '81' \
    --status 'UNSENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 42 'AdminGetInboxMessages' test.out

#- 43 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "9J4hbYUb", "expiredAt": 47, "message": {"WBjhJpuX": {}, "HF4SA3zA": {}, "EhLLj8bM": {}}, "scope": "USER", "status": "DRAFT", "userIds": ["7XCtqbiz", "AZbwse14", "4ELBn5jn"]}' \
    > test.out 2>&1
eval_tap $? 43 'AdminSaveInboxMessage' test.out

#- 44 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'UnJdb8u3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["IvCRQukI", "VQlCFbPa", "CRcSsLab"]}' \
    > test.out 2>&1
eval_tap $? 44 'AdminUnsendInboxMessage' test.out

#- 45 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'hRUCuNJF' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '97' \
    --status 'UNREAD' \
    --userId 'gDyAC7Ek' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxUsers' test.out

#- 46 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'SrGxTP1G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 49, "message": {"W5QvqOlL": {}, "P5sXpgHv": {}, "0PzKiFCZ": {}}, "scope": "NAMESPACE", "userIds": ["l0ECHwfD", "8zZgTYTR", "OozAbtLm"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateInboxMessage' test.out

#- 47 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId '61CzQ4vW' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSendInboxMessage' test.out

#- 48 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'wztffWt5,NZUpc5xm,lhyQegYJ' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxStats' test.out

#- 49 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'XdZgI6W8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'AdminGetChatSnapshot' test.out

#- 50 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId '97qq4mrT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteChatSnapshot' test.out

#- 51 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'Xk19UJ2L' \
    --includeChildren  \
    --limit '60' \
    --offset '56' \
    --parentId 'IcOS9hz6' \
    --startWith 'rx2dYsOP' \
    --wordType 'jpePPuFg' \
    > test.out 2>&1
eval_tap $? 51 'AdminProfanityQuery' test.out

#- 52 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["NbXgAZAk", "Yti1zgOA", "z1mfl46f"], "falsePositive": ["uS1MUDYp", "66URFiV9", "2vs3WTSv"], "word": "wi3BfEI5", "wordType": "mDgnZINK"}' \
    > test.out 2>&1
eval_tap $? 52 'AdminProfanityCreate' test.out

#- 53 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["tIO8cYyY", "tu8adIXi", "Na4ot29d"], "falsePositive": ["wHTS9cCu", "4vw2zGAo", "ew6N0iXu"], "word": "xKPmnBri", "wordType": "7Fxef8oi"}, {"falseNegative": ["Jfw0Z3sW", "SiVKwRbz", "Cr4nQDXm"], "falsePositive": ["LCQSO26t", "gDmPRAp1", "RWOTsXAG"], "word": "lD5BdutJ", "wordType": "8fViz70f"}, {"falseNegative": ["EymskBqo", "cNKd6gVE", "Gt2spnC5"], "falsePositive": ["QEIhBhK7", "IkaTj5VP", "4gGJCfqW"], "word": "LuEVDmME", "wordType": "Uj0xwAyP"}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminProfanityCreateBulk' test.out

#- 54 AdminProfanityExport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityExport \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityExport' test.out

#- 55 AdminProfanityGroup
./ng net.accelbyte.sdk.cli.Main chat adminProfanityGroup \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityGroup' test.out

#- 56 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'LEAVEOUT' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityImport' test.out

#- 57 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id '2AGZ5Y6U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["8U6G5dBC", "uzLtVyZV", "FmYxT7y8"], "falsePositive": ["h2GjHSJS", "SfLBuayA", "RnTuYCJP"], "word": "Kkf2MEwz", "wordType": "9EvqoT2c"}' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityUpdate' test.out

#- 58 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'Ln6QablQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityDelete' test.out

#- 59 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 59 'PublicGetMessages' test.out

#- 60 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId 'ohsCsA29' \
    --namespace "$AB_NAMESPACE" \
    --topic 'TM609Pu3' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
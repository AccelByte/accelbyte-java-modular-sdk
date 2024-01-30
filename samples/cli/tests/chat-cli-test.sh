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
    --chatId '6VNmfwQh,RAwcn3VV,IOynRnDg' \
    --endCreatedAt '90' \
    --keyword '8HlUPObs' \
    --limit '9' \
    --offset '70' \
    --order 'kIkBuLEO' \
    --senderUserId 'YQTsKZqQ' \
    --shardId 'OqXbyGbC' \
    --startCreatedAt '65' \
    --topic 'x8EKZkAQ,NBmS1bzE,tYwgNWrQ' \
    > test.out 2>&1
eval_tap $? 2 'AdminChatHistory' test.out

#- 3 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "a5YKTGMW", "name": "WUJBu8BX"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNamespaceTopic' test.out

#- 4 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '29' \
    --topicType 'OrE94v3q' \
    > test.out 2>&1
eval_tap $? 4 'AdminTopicList' test.out

#- 5 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["x6kGmlnn", "ftc8CibN", "lelHHx81"], "description": "fWnsWzrC", "isChannel": true, "isJoinable": true, "members": ["gfRsbnlp", "4q330QSQ", "WtaUdVrq"], "name": "mjkAju6O", "shardLimit": 92, "type": "ptITci31"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateTopic' test.out

#- 6 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '18' \
    --topicName 'q3IF4UVN' \
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
    --endCreatedAt '96' \
    --limit '99' \
    --offset '25' \
    --senderUserId 'ZxjMBUhd' \
    --startCreatedAt '63' \
    --topicId '0NCLMBC8' \
    --topicIds 'dueJ6hV8,U7Vh8fMv,MEJYszwa' \
    --userId 'GZZITTwu' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryTopicLog' test.out

#- 9 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'cJ9COidg' \
    --body '{"description": "W3mwzG9C", "isJoinable": true, "name": "LJMytSye"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateTopic' test.out

#- 10 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'ezUFIygN' \
    > test.out 2>&1
eval_tap $? 10 'AdminDeleteTopic' test.out

#- 11 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '6snmPy2w' \
    --body '{"userIds": ["hx7blox1", "50qrdABd", "23qmFiL1"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminBanTopicMembers' test.out

#- 12 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic '0JDTjhdi' \
    > test.out 2>&1
eval_tap $? 12 'AdminChannelTopicInfo' test.out

#- 13 AdminTopicChatHistory
eval_tap 0 13 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 14 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'DN2fa5Pe' \
    --body '{"message": "htBNv1sw"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminSendChat' test.out

#- 15 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'byylJIcM' \
    --namespace "$AB_NAMESPACE" \
    --topic 'AlLILXWB' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteChat' test.out

#- 16 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic '092SuMJY' \
    --isBanned  \
    --isModerator  \
    --limit '92' \
    --offset '73' \
    --shardId '4t0yzHqs' \
    > test.out 2>&1
eval_tap $? 16 'AdminTopicMembers' test.out

#- 17 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'lTRqACDr' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicShards' test.out

#- 18 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'eIfJCFx5' \
    --body '{"userIds": ["vCTybAGv", "bJ6XXtKN", "661nGfoJ"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnbanTopicMembers' test.out

#- 19 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'N5ignMiP' \
    --userId 'QVE853ov' \
    --body '{"isAdmin": false}' \
    > test.out 2>&1
eval_tap $? 19 'AdminAddTopicMember' test.out

#- 20 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'xhNAL742' \
    --userId 'F8pQOd7c' \
    > test.out 2>&1
eval_tap $? 20 'AdminRemoveTopicMember' test.out

#- 21 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '84' \
    --offset '98' \
    --topic 'R9z4NKds,AHd7Sd9T,Vz7bp3Gw' \
    --topicSubType 'PARTY' \
    --topicType 'GROUP' \
    --userId 'PEklfgqG' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryTopic' test.out

#- 22 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'i85ToihP' \
    --includePastTopics  \
    --limit '16' \
    --offset '49' \
    --topicSubType 'NORMAL' \
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
    --limit '46' \
    --offset '21' \
    --topicType 'dymuHFkw' \
    > test.out 2>&1
eval_tap $? 24 'PublicTopicList' test.out

#- 25 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'UnW6mwty' \
    --body '{"userIDs": ["cAAePq4L", "0YxLYuGs", "xZsuYCp8"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicBanTopicMembers' test.out

#- 26 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic 'Mt0nxFJW' \
    --limit '20' \
    --order 'VNWYtoxt' \
    --startCreatedAt '2' \
    > test.out 2>&1
eval_tap $? 26 'PublicChatHistory' test.out

#- 27 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'wCJkwTqv' \
    --namespace "$AB_NAMESPACE" \
    --topic 'k27Ibknd' \
    > test.out 2>&1
eval_tap $? 27 'PublicDeleteChat' test.out

#- 28 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'k4NwGItN' \
    --body '{"duration": 64, "userId": "a4ZEGy6o"}' \
    > test.out 2>&1
eval_tap $? 28 'PublicMuteUser' test.out

#- 29 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'jtsxEdG2' \
    --body '{"userIDs": ["vloDGHDx", "ma4RZOIZ", "mHG8CU7w"]}' \
    > test.out 2>&1
eval_tap $? 29 'PublicUnbanTopicMembers' test.out

#- 30 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'zrIlMx9u' \
    --body '{"userId": "b0tc0pZA"}' \
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
    --body '{"chatRateLimitBurst": 66, "chatRateLimitDuration": 97, "concurrentUsersLimit": 99, "enableClanChat": false, "enableManualTopicCreation": true, "enableProfanityFilter": false, "filterAppName": "rwTW4Fxa", "filterParam": "0aGJQR5D", "filterType": "Jh4jctoz", "generalRateLimitBurst": 96, "generalRateLimitDuration": 8, "shardCapacityLimit": 66, "shardDefaultLimit": 84, "shardHardLimit": 40, "spamChatBurst": 59, "spamChatDuration": 2, "spamMuteDuration": 4}' \
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
    --body '{"enabled": true, "expiresIn": 16, "hook": {"driver": "KAFKA", "params": "xuKf1PzA"}, "jsonSchema": {"KT3xHK33": {}, "YXaZF74r": {}, "IhDi9uTA": {}}, "name": "K4MeCStn", "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 37 'AdminAddInboxCategory' test.out

#- 38 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category '9JOZBxFl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteInboxCategory' test.out

#- 39 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'EjM7bQcC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "expiresIn": 54, "hook": {"driver": "KAFKA", "params": "PJ3G3VSO"}, "jsonSchema": {"vNdtYdvF": {}, "dQZqDLGl": {}, "1Ro5rHcq": {}}, "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 39 'AdminUpdateInboxCategory' test.out

#- 40 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'F1trRo0K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'AdminGetCategorySchema' test.out

#- 41 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'VtlKF0e5' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxMessage' test.out

#- 42 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '22' \
    --limit '9' \
    --messageId 'c6Ix1AIx,Z61mbIwd,5nITabw7' \
    --offset '8' \
    --order 'uMzjlxB7' \
    --scope 'NAMESPACE' \
    --startCreatedAt '33' \
    --status 'SENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 42 'AdminGetInboxMessages' test.out

#- 43 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "O90sCNYg", "expiredAt": 5, "message": {"5NIh39ef": {}, "1OHdxL84": {}, "AbCt4z4o": {}}, "scope": "USER", "status": "SENT", "userIds": ["aU8gHGNc", "UiQEXgF2", "68I3ba4b"]}' \
    > test.out 2>&1
eval_tap $? 43 'AdminSaveInboxMessage' test.out

#- 44 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox '0p6jFeHB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["RQ1A3q8M", "ebnFnGSs", "Zp8ZdAZZ"]}' \
    > test.out 2>&1
eval_tap $? 44 'AdminUnsendInboxMessage' test.out

#- 45 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'u7X0A6GG' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '39' \
    --status 'READ' \
    --userId 'BiKeXd0l' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxUsers' test.out

#- 46 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId 'PY7v1mZI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 3, "message": {"7eX8sgEj": {}, "YZpnAD5y": {}, "BadCfBE3": {}}, "scope": "NAMESPACE", "userIds": ["or37huWu", "OmCPOAMu", "ATglv0aW"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdateInboxMessage' test.out

#- 47 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId '5LHlMnEQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 47 'AdminSendInboxMessage' test.out

#- 48 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'pqbl0ZTo,M3Ry8lfS,TmnyzfoO' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxStats' test.out

#- 49 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'zUFLAsZd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'AdminGetChatSnapshot' test.out

#- 50 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId '0JH3oNqu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteChatSnapshot' test.out

#- 51 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'gXwsRdMm' \
    --includeChildren  \
    --limit '56' \
    --offset '26' \
    --parentId '09VSOBMG' \
    --startWith 'xddJdshZ' \
    --wordType 'fqoOdsQ2' \
    > test.out 2>&1
eval_tap $? 51 'AdminProfanityQuery' test.out

#- 52 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["MwxtBnxz", "rmhjJuxm", "Hesju5JA"], "falsePositive": ["TncVwC8d", "dWPlMJJJ", "As0qImQh"], "word": "IgQMlUZI", "wordType": "ksZQhZqJ"}' \
    > test.out 2>&1
eval_tap $? 52 'AdminProfanityCreate' test.out

#- 53 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["kOPS0yfm", "rM2xGpgQ", "UGcElxvb"], "falsePositive": ["taGsjIaX", "hldOlX1O", "mTvtHqeg"], "word": "vsWlzH78", "wordType": "7Xs3FC5B"}, {"falseNegative": ["7A7SLcZ9", "mYH5NyEj", "0NY9htDs"], "falsePositive": ["sLPuvO54", "ICcQ0nDM", "wShM8t5V"], "word": "ATuZAJga", "wordType": "gT2IsAHf"}, {"falseNegative": ["BvpN8vGi", "BN70tZj5", "UxfOAsyS"], "falsePositive": ["StOkpBiT", "EqMoOdeb", "vTyEORD8"], "word": "OUljEYYa", "wordType": "ZKIwpOwE"}]}' \
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
    --limit '5' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityGroup' test.out

#- 56 AdminProfanityImport
./ng net.accelbyte.sdk.cli.Main chat adminProfanityImport \
    --namespace "$AB_NAMESPACE" \
    --action 'REPLACE' \
    --showResult  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 56 'AdminProfanityImport' test.out

#- 57 AdminProfanityUpdate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityUpdate \
    --id 'Iouu2mHh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["WJawa8nr", "fXLQdmsI", "xnkW34hB"], "falsePositive": ["VM61gERT", "WJ17bECr", "e8EPtYh5"], "word": "xqB3aGIJ", "wordType": "GGHi4yEQ"}' \
    > test.out 2>&1
eval_tap $? 57 'AdminProfanityUpdate' test.out

#- 58 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'EclchvAF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminProfanityDelete' test.out

#- 59 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main chat publicGetMessages \
    > test.out 2>&1
eval_tap $? 59 'PublicGetMessages' test.out

#- 60 PublicGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat publicGetChatSnapshot \
    --chatId 'RgHSzB89' \
    --namespace "$AB_NAMESPACE" \
    --topic 'Oukbzmsw' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
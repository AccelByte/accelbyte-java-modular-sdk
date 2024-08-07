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
    --body '{"message": "loZMh51k", "timestamp": 83, "topicId": "kivwHaaG", "topicType": "GROUP", "userId": "Jfxcu7g1"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminFilterChatMessage' test.out

#- 3 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main chat adminChatHistory \
    --namespace "$AB_NAMESPACE" \
    --chatId 'LJAGx3so,d1Z5SLwS,N9Ay5ZFE' \
    --endCreatedAt '19' \
    --keyword 'cMjsaoU1' \
    --limit '61' \
    --offset '29' \
    --order 'J4I5HBNn' \
    --senderUserId 'EAD3xkI1' \
    --shardId '9vQw9dMo' \
    --startCreatedAt '77' \
    --topic 'DAAWqNH5,aJiPxgVl,SKdoaLMu' \
    --unfiltered  \
    > test.out 2>&1
eval_tap $? 3 'AdminChatHistory' test.out

#- 4 AdminCreateNamespaceTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateNamespaceTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ovOWfx1C", "name": "ncr1a0aF"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateNamespaceTopic' test.out

#- 5 AdminTopicList
./ng net.accelbyte.sdk.cli.Main chat adminTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '7' \
    --topicType 's5B15Yju' \
    > test.out 2>&1
eval_tap $? 5 'AdminTopicList' test.out

#- 6 AdminCreateTopic
./ng net.accelbyte.sdk.cli.Main chat adminCreateTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"admins": ["VtehZrZQ", "rJv88NKg", "PG7i7V4t"], "description": "bsqI7rwg", "isChannel": true, "isJoinable": false, "members": ["qkfRRTbj", "230XhwGK", "BmvHREQy"], "name": "HWHjAafM", "shardLimit": 7, "type": "q34bOUM2"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminCreateTopic' test.out

#- 7 AdminChannelTopicList
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicList \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '21' \
    --topicName 'sVneEthJ' \
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
    --endCreatedAt '65' \
    --limit '87' \
    --offset '55' \
    --senderUserId 'iYnyU5DI' \
    --startCreatedAt '7' \
    --topicId 'hhn80Der' \
    --topicIds 'PYwOtWKN,rQdt3xT8,hIdvWtft' \
    --userId 'rtoabATi' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryTopicLog' test.out

#- 10 AdminUpdateTopic
./ng net.accelbyte.sdk.cli.Main chat adminUpdateTopic \
    --namespace "$AB_NAMESPACE" \
    --topic 'ZfgXoh3z' \
    --body '{"description": "EhuHcdTa", "isJoinable": true, "name": "IMBJyVct"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateTopic' test.out

#- 11 AdminDeleteTopic
./ng net.accelbyte.sdk.cli.Main chat adminDeleteTopic \
    --namespace "$AB_NAMESPACE" \
    --topic '38ZhhRm2' \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteTopic' test.out

#- 12 AdminBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'ZHU3LbMz' \
    --body '{"userIds": ["bLaJ0eOm", "N52FXzZe", "3lWdDvLZ"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminBanTopicMembers' test.out

#- 13 AdminChannelTopicInfo
./ng net.accelbyte.sdk.cli.Main chat adminChannelTopicInfo \
    --namespace "$AB_NAMESPACE" \
    --topic 'n0OECa2r' \
    > test.out 2>&1
eval_tap $? 13 'AdminChannelTopicInfo' test.out

#- 14 AdminTopicChatHistory
eval_tap 0 14 'AdminTopicChatHistory # SKIP deprecated' test.out

#- 15 AdminSendChat
./ng net.accelbyte.sdk.cli.Main chat adminSendChat \
    --namespace "$AB_NAMESPACE" \
    --topic 'e7dwFUZ6' \
    --body '{"message": "o0RqfR3m"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminSendChat' test.out

#- 16 AdminDeleteChat
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChat \
    --chatId 'OelByQdu' \
    --namespace "$AB_NAMESPACE" \
    --topic '96EYCJQf' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeleteChat' test.out

#- 17 AdminTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'tLsmh1ii' \
    --isBanned  \
    --isModerator  \
    --limit '2' \
    --offset '24' \
    --shardId 'fcS1LqMq' \
    > test.out 2>&1
eval_tap $? 17 'AdminTopicMembers' test.out

#- 18 AdminTopicShards
./ng net.accelbyte.sdk.cli.Main chat adminTopicShards \
    --namespace "$AB_NAMESPACE" \
    --topic 'JfQQQYSq' \
    > test.out 2>&1
eval_tap $? 18 'AdminTopicShards' test.out

#- 19 AdminUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat adminUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'S9wFVpTZ' \
    --body '{"userIds": ["Vb9OwbN3", "C10aS1l5", "qzGwC1o1"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnbanTopicMembers' test.out

#- 20 AdminAddTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminAddTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'wlrAOGNS' \
    --userId 'ioaRqOqM' \
    --body '{"isAdmin": true}' \
    > test.out 2>&1
eval_tap $? 20 'AdminAddTopicMember' test.out

#- 21 AdminRemoveTopicMember
./ng net.accelbyte.sdk.cli.Main chat adminRemoveTopicMember \
    --namespace "$AB_NAMESPACE" \
    --topic 'NgKm1mxF' \
    --userId '1cPRwYCW' \
    > test.out 2>&1
eval_tap $? 21 'AdminRemoveTopicMember' test.out

#- 22 AdminQueryTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryTopic \
    --namespace "$AB_NAMESPACE" \
    --includeMembers  \
    --includePastMembers  \
    --includePastTopics  \
    --limit '45' \
    --offset '62' \
    --topic 'xga5MdQC,tBFtuaRw,bEuOj1eB' \
    --topicSubType 'NORMAL' \
    --topicType 'PERSONAL' \
    --userId 'mPygJeqd' \
    > test.out 2>&1
eval_tap $? 22 'AdminQueryTopic' test.out

#- 23 AdminQueryUsersTopic
./ng net.accelbyte.sdk.cli.Main chat adminQueryUsersTopic \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZ0WcSGK' \
    --includePastTopics  \
    --limit '38' \
    --offset '22' \
    --topicSubType 'NORMAL' \
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
    --limit '44' \
    --offset '63' \
    --topicType 'AKpHbKQP' \
    > test.out 2>&1
eval_tap $? 25 'PublicTopicList' test.out

#- 26 PublicBanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicBanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'C19EkmMH' \
    --body '{"userIDs": ["JBIquyjN", "sbZqfxsM", "4SFf0zrH"]}' \
    > test.out 2>&1
eval_tap $? 26 'PublicBanTopicMembers' test.out

#- 27 PublicChatHistory
./ng net.accelbyte.sdk.cli.Main chat publicChatHistory \
    --namespace "$AB_NAMESPACE" \
    --topic '4ywitu41' \
    --limit '12' \
    --order 'eo7rQMja' \
    --startCreatedAt '72' \
    > test.out 2>&1
eval_tap $? 27 'PublicChatHistory' test.out

#- 28 PublicDeleteChat
./ng net.accelbyte.sdk.cli.Main chat publicDeleteChat \
    --chatId 'ZNLB8UAS' \
    --namespace "$AB_NAMESPACE" \
    --topic 'c3HtpX1v' \
    > test.out 2>&1
eval_tap $? 28 'PublicDeleteChat' test.out

#- 29 PublicMuteUser
./ng net.accelbyte.sdk.cli.Main chat publicMuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'qSVhu1ti' \
    --body '{"duration": 21, "userId": "eCAhWHUt"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicMuteUser' test.out

#- 30 PublicUnbanTopicMembers
./ng net.accelbyte.sdk.cli.Main chat publicUnbanTopicMembers \
    --namespace "$AB_NAMESPACE" \
    --topic 'PUxFpyso' \
    --body '{"userIDs": ["lwl0uZ9i", "Yy14S5T5", "dTpaIF2e"]}' \
    > test.out 2>&1
eval_tap $? 30 'PublicUnbanTopicMembers' test.out

#- 31 PublicUnmuteUser
./ng net.accelbyte.sdk.cli.Main chat publicUnmuteUser \
    --namespace "$AB_NAMESPACE" \
    --topic 'pN1ct4w4' \
    --body '{"userId": "2lDZ6oAO"}' \
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
    --body '{"logLevel": "warning", "socketLogEnabled": true}' \
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
    --body '{"chatRateLimitBurst": 68, "chatRateLimitDuration": 49, "concurrentUsersLimit": 45, "enableClanChat": false, "enableManualTopicCreation": false, "enableProfanityFilter": true, "filterAppName": "C09m06m9", "filterParam": "MoSe8jgz", "filterType": "QpN1AAfo", "generalRateLimitBurst": 55, "generalRateLimitDuration": 7, "maxChatMessageLength": 96, "shardCapacityLimit": 13, "shardDefaultLimit": 83, "shardHardLimit": 22, "spamChatBurst": 6, "spamChatDuration": 66, "spamMuteDuration": 46}' \
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
    --body '{"enabled": false, "expiresIn": 77, "hook": {"driver": "4TvnWdYj", "params": {"hAV6VCj7": {}, "X1bltxhI": {}, "NtACiGgA": {}}}, "jsonSchema": {"i6K1atbH": {}, "GE3paNTX": {}, "IPt2iPj7": {}}, "name": "jOTDIx3C", "saveInbox": true, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 40 'AdminAddInboxCategory' test.out

#- 41 AdminDeleteInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxCategory \
    --category '1xjpnYie' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteInboxCategory' test.out

#- 42 AdminUpdateInboxCategory
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxCategory \
    --category 'YqtFJNQh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false, "expiresIn": 96, "hook": {"driver": "B0ZBMmC0", "params": {"urVshZgC": {}, "Kqh0gbXT": {}, "NypF7vyp": {}}}, "jsonSchema": {"dGMQ8e1G": {}, "ZQn8nXdv": {}, "gJqiBqIE": {}}, "saveInbox": false, "sendNotification": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateInboxCategory' test.out

#- 43 AdminGetCategorySchema
./ng net.accelbyte.sdk.cli.Main chat adminGetCategorySchema \
    --category 'XZS952yq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'AdminGetCategorySchema' test.out

#- 44 AdminDeleteInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminDeleteInboxMessage \
    --messageId 'cYEJ8X4L' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteInboxMessage' test.out

#- 45 AdminGetInboxMessages
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxMessages \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --endCreatedAt '32' \
    --limit '27' \
    --messageId '4AVoA9NT,csXuLgXa,OkG27whb' \
    --offset '25' \
    --order 'UUUDCjP3' \
    --scope 'USER' \
    --startCreatedAt '87' \
    --status 'UNSENT' \
    --transient_  \
    > test.out 2>&1
eval_tap $? 45 'AdminGetInboxMessages' test.out

#- 46 AdminSaveInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSaveInboxMessage \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "YAvwWs8Y", "expiredAt": 44, "message": {"Spmk9xXe": {}, "uKMmDt14": {}, "BT9AVpDI": {}}, "scope": "USER", "status": "DRAFT", "userIds": ["0aqEcoj8", "TQZvdkOJ", "pPEFGEvH"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminSaveInboxMessage' test.out

#- 47 AdminUnsendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUnsendInboxMessage \
    --inbox 'GhfiztWn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ZJBhMm9Q", "fPtkwAbZ", "IbG5Zpjq"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminUnsendInboxMessage' test.out

#- 48 AdminGetInboxUsers
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxUsers \
    --inbox 'wZPBYSdh' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '45' \
    --status 'READ' \
    --userId 'Y63JS3On' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetInboxUsers' test.out

#- 49 AdminUpdateInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminUpdateInboxMessage \
    --messageId '0ZhR1kF1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"expiredAt": 51, "message": {"9kWrqAYn": {}, "l2R1g2Pd": {}, "PF40QKqQ": {}}, "scope": "USER", "userIds": ["Ob8F3bLk", "H5yWaa33", "KJFqjycM"]}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdateInboxMessage' test.out

#- 50 AdminSendInboxMessage
./ng net.accelbyte.sdk.cli.Main chat adminSendInboxMessage \
    --messageId 'TISs7yKq' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminSendInboxMessage' test.out

#- 51 AdminGetInboxStats
./ng net.accelbyte.sdk.cli.Main chat adminGetInboxStats \
    --namespace "$AB_NAMESPACE" \
    --messageId 'bdiKkfuZ,9SeyvqrJ,v8vt5Khz' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetInboxStats' test.out

#- 52 AdminGetChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminGetChatSnapshot \
    --chatId 'MWWhOlGL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetChatSnapshot' test.out

#- 53 AdminDeleteChatSnapshot
./ng net.accelbyte.sdk.cli.Main chat adminDeleteChatSnapshot \
    --chatId 'gXGgfa1B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminDeleteChatSnapshot' test.out

#- 54 AdminProfanityQuery
./ng net.accelbyte.sdk.cli.Main chat adminProfanityQuery \
    --namespace "$AB_NAMESPACE" \
    --filterMask 'wFv4XFtD' \
    --includeChildren  \
    --limit '2' \
    --offset '35' \
    --parentId 'rB2qnxce' \
    --startWith 'aQDZY2iV' \
    --wordType 'zPpbMJzQ' \
    > test.out 2>&1
eval_tap $? 54 'AdminProfanityQuery' test.out

#- 55 AdminProfanityCreate
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["Z5jiHRZK", "C3WzwNj3", "MzqMKkyN"], "falsePositive": ["0Q2vY2la", "RqYP7iO5", "fkEtUSF5"], "word": "U6txEevo", "wordType": "1LiwmBbE"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminProfanityCreate' test.out

#- 56 AdminProfanityCreateBulk
./ng net.accelbyte.sdk.cli.Main chat adminProfanityCreateBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"dictionaries": [{"falseNegative": ["YHr94esC", "XgkeX18j", "ifRGWOvR"], "falsePositive": ["jIBHZQMq", "KdlrB8C4", "YqHGl2mq"], "word": "v7mPqGiW", "wordType": "GNNgsWyL"}, {"falseNegative": ["xTGkPaTM", "3oucIKFl", "FlAFmMhF"], "falsePositive": ["9EEY5Xg9", "2wrh4KHE", "qua6uV6r"], "word": "pqpAZDE2", "wordType": "opSx7lsF"}, {"falseNegative": ["7tmnt3Gs", "glAVbpEz", "ABIrnH7W"], "falsePositive": ["y4cSEXBC", "eAgg1BQs", "1q6ptbFT"], "word": "sTtSE1w6", "wordType": "v2zyPogh"}]}' \
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
    --limit '95' \
    --offset '7' \
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
    --id 'rK8IjWCz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"falseNegative": ["Sped1ZZB", "YO2fiXHI", "4jB1eclW"], "falsePositive": ["edkXXqH0", "d5X2SH8H", "YI6PR5BW"], "word": "EtH7oM0w", "wordType": "9i2CcDR7"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminProfanityUpdate' test.out

#- 61 AdminProfanityDelete
./ng net.accelbyte.sdk.cli.Main chat adminProfanityDelete \
    --id 'zxDhFVYw' \
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
    --chatId 'kFKySDc9' \
    --namespace "$AB_NAMESPACE" \
    --topic 'qfr32eyq' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetChatSnapshot' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
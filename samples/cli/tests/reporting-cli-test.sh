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
echo "1..36"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminFindActionList
./ng net.accelbyte.sdk.cli.Main reporting adminFindActionList \
    > test.out 2>&1
eval_tap $? 2 'AdminFindActionList' test.out

#- 3 AdminCreateModAction
./ng net.accelbyte.sdk.cli.Main reporting adminCreateModAction \
    --body '{"actionId": "icboL8B2", "actionName": "VEsWt2fF", "eventName": "R1Vf8qQp"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateModAction' test.out

#- 4 AdminFindExtensionCategoryList
./ng net.accelbyte.sdk.cli.Main reporting adminFindExtensionCategoryList \
    --order 'ascending' \
    --sortBy 'extensionCategoryName' \
    > test.out 2>&1
eval_tap $? 4 'AdminFindExtensionCategoryList' test.out

#- 5 AdminCreateExtensionCategory
./ng net.accelbyte.sdk.cli.Main reporting adminCreateExtensionCategory \
    --body '{"extensionCategory": "gpeqGBfr", "extensionCategoryName": "JN9NBKxF", "serviceSource": "Ls3JJknU"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateExtensionCategory' test.out

#- 6 Get
./ng net.accelbyte.sdk.cli.Main reporting get \
    --namespace "$AB_NAMESPACE" \
    --category 'extension' \
    > test.out 2>&1
eval_tap $? 6 'Get' test.out

#- 7 Upsert
./ng net.accelbyte.sdk.cli.Main reporting upsert \
    --namespace "$AB_NAMESPACE" \
    --body '{"categoryLimits": [{"extensionCategory": "KmyTm0nx", "maxReportPerTicket": 26, "name": "jsP2iJ43"}, {"extensionCategory": "1YIsqT9e", "maxReportPerTicket": 79, "name": "3lZa0o0u"}, {"extensionCategory": "WTcm9nUz", "maxReportPerTicket": 5, "name": "0qKtSxss"}], "timeInterval": 26, "userMaxReportPerTimeInterval": 76}' \
    > test.out 2>&1
eval_tap $? 7 'Upsert' test.out

#- 8 AdminListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting adminListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 8 'AdminListReasonGroups' test.out

#- 9 CreateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting createReasonGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["0fMtd3Ek", "MsKuOoNr", "7MAstKeA"], "title": "EXwrWBbO"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateReasonGroup' test.out

#- 10 GetReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting getReasonGroup \
    --groupId 'ypcNnuiS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetReasonGroup' test.out

#- 11 DeleteReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting deleteReasonGroup \
    --groupId 'Gv2SKxSg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteReasonGroup' test.out

#- 12 UpdateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting updateReasonGroup \
    --groupId 'wODGujPG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["NTK9oN0v", "POe5djFv", "SUC6PEfh"], "title": "fDHLGZ5U"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateReasonGroup' test.out

#- 13 AdminGetReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'p4LPIXgA' \
    --limit '87' \
    --offset '15' \
    --title 'KpQuAtJR' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetReasons' test.out

#- 14 CreateReason
./ng net.accelbyte.sdk.cli.Main reporting createReason \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "QLJOuMcA", "groupIds": ["E1ROP96l", "Kr0LaGpa", "RWkuljDM"], "title": "G4w9iMrS"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateReason' test.out

#- 15 AdminGetAllReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetAllReasons \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllReasons' test.out

#- 16 AdminGetUnusedReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetUnusedReasons \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'K7ANuLbC' \
    --category 'siie1pY3' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUnusedReasons' test.out

#- 17 AdminGetReason
./ng net.accelbyte.sdk.cli.Main reporting adminGetReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'wnhnD3Q0' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetReason' test.out

#- 18 DeleteReason
./ng net.accelbyte.sdk.cli.Main reporting deleteReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'lRtSQkH4' \
    > test.out 2>&1
eval_tap $? 18 'DeleteReason' test.out

#- 19 UpdateReason
./ng net.accelbyte.sdk.cli.Main reporting updateReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'ei4IKu5r' \
    --body '{"description": "2FBOjeI0", "groupIds": ["m6qt9v5f", "gBT2eTuC", "L47EB9uG"], "title": "kblDeYGS"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateReason' test.out

#- 20 ListReports
./ng net.accelbyte.sdk.cli.Main reporting listReports \
    --namespace "$AB_NAMESPACE" \
    --category 'Sxkl5x9n' \
    --limit '40' \
    --offset '88' \
    --reportedUserId 'uhBXhPV2' \
    --sortBy 'WRA81RvL' \
    > test.out 2>&1
eval_tap $? 20 'ListReports' test.out

#- 21 AdminSubmitReport
./ng net.accelbyte.sdk.cli.Main reporting adminSubmitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"nWRRNIB0": {}, "tE5LUzPJ": {}, "iYWwJMJb": {}}, "category": "UGC", "comment": "hHFRHm3F", "extensionCategory": "kTa7N6Ox", "objectId": "vLFKO8Kg", "objectType": "yEU7NdRs", "reason": "yotLKuYL", "userId": "VcpDNiZd"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSubmitReport' test.out

#- 22 CreateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting createModerationRule \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "nCUdSN4P", "duration": 6, "reason": "rCL7eXhu", "skipNotif": false, "type": "wKofDrJQ"}, "deleteChat": false, "extensionActionIds": ["m2O6Q2S2", "fiYpgORS", "vmoZv3ih"], "hideContent": true}, "active": false, "category": "USER", "extensionCategory": "BHvpSoej", "reason": "yAy2OoOa", "threshold": 97}' \
    > test.out 2>&1
eval_tap $? 22 'CreateModerationRule' test.out

#- 23 UpdateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'M5tS1k3O' \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "ajA5fEQq", "duration": 1, "reason": "fQnhVfFZ", "skipNotif": true, "type": "HDox3YZo"}, "deleteChat": true, "extensionActionIds": ["jJNw6xDn", "2RPrL2fR", "lCFnf5RW"], "hideContent": true}, "active": true, "category": "USER", "extensionCategory": "e38xAmJ0", "reason": "11NLHhte", "threshold": 30}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateModerationRule' test.out

#- 24 DeleteModerationRule
./ng net.accelbyte.sdk.cli.Main reporting deleteModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'ZVjMOhSn' \
    > test.out 2>&1
eval_tap $? 24 'DeleteModerationRule' test.out

#- 25 UpdateModerationRuleStatus
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRuleStatus \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'lYZDD7eX' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateModerationRuleStatus' test.out

#- 26 GetModerationRules
./ng net.accelbyte.sdk.cli.Main reporting getModerationRules \
    --namespace "$AB_NAMESPACE" \
    --category 'IryFRwhJ' \
    --extensionCategory 'p82HSaRO' \
    --limit '62' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 26 'GetModerationRules' test.out

#- 27 GetModerationRuleDetails
./ng net.accelbyte.sdk.cli.Main reporting getModerationRuleDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'onWH6Buh' \
    > test.out 2>&1
eval_tap $? 27 'GetModerationRuleDetails' test.out

#- 28 ListTickets
./ng net.accelbyte.sdk.cli.Main reporting listTickets \
    --namespace "$AB_NAMESPACE" \
    --category '2IjB4eOH' \
    --extensionCategory 'AT65Dgg9' \
    --limit '31' \
    --offset '95' \
    --order '5HUBrd2Q' \
    --reportedUserId 'fk7vrwcX' \
    --sortBy 'RmXY4K5b' \
    --status '73JkRBD6' \
    > test.out 2>&1
eval_tap $? 28 'ListTickets' test.out

#- 29 TicketStatistic
./ng net.accelbyte.sdk.cli.Main reporting ticketStatistic \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'a984wEwV' \
    --category 'BzgByMNh' \
    > test.out 2>&1
eval_tap $? 29 'TicketStatistic' test.out

#- 30 GetTicketDetail
./ng net.accelbyte.sdk.cli.Main reporting getTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'jJw0rlIh' \
    > test.out 2>&1
eval_tap $? 30 'GetTicketDetail' test.out

#- 31 DeleteTicket
./ng net.accelbyte.sdk.cli.Main reporting deleteTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'GJF0Uz4H' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTicket' test.out

#- 32 GetReportsByTicket
./ng net.accelbyte.sdk.cli.Main reporting getReportsByTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'BkU8rar4' \
    --limit '94' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 32 'GetReportsByTicket' test.out

#- 33 UpdateTicketResolutions
./ng net.accelbyte.sdk.cli.Main reporting updateTicketResolutions \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'vQJMef4c' \
    --body '{"notes": "eJvoldaE", "status": "UNKNOWN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTicketResolutions' test.out

#- 34 PublicListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting publicListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 34 'PublicListReasonGroups' test.out

#- 35 PublicGetReasons
./ng net.accelbyte.sdk.cli.Main reporting publicGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'pmnZ7unO' \
    --limit '77' \
    --offset '68' \
    --title 'Z0oocFtc' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetReasons' test.out

#- 36 SubmitReport
./ng net.accelbyte.sdk.cli.Main reporting submitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"4Au07Kqd": {}, "YWCvl7Nr": {}, "FxWUQDkT": {}}, "category": "EXTENSION", "comment": "qEwH6TjB", "extensionCategory": "DTFJr26x", "objectId": "j5Ast4Sk", "objectType": "XbFIGXBM", "reason": "TMluenkh", "userId": "bKnyefj5"}' \
    > test.out 2>&1
eval_tap $? 36 'SubmitReport' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
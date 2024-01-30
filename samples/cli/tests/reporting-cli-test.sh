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
    --body '{"actionId": "4YZoWDcX", "actionName": "fGpsQyuL", "eventName": "C7VDVuGb"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateModAction' test.out

#- 4 AdminFindExtensionCategoryList
./ng net.accelbyte.sdk.cli.Main reporting adminFindExtensionCategoryList \
    --order 'ascending' \
    --sortBy 'extensionCategory' \
    > test.out 2>&1
eval_tap $? 4 'AdminFindExtensionCategoryList' test.out

#- 5 AdminCreateExtensionCategory
./ng net.accelbyte.sdk.cli.Main reporting adminCreateExtensionCategory \
    --body '{"extensionCategory": "w8m9WoF9", "extensionCategoryName": "iyH2iUo1", "serviceSource": "drIJb0x7"}' \
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
    --body '{"categoryLimits": [{"extensionCategory": "2kDGAdB4", "maxReportPerTicket": 77, "name": "ZP5BteTV"}, {"extensionCategory": "q4LWNVfq", "maxReportPerTicket": 43, "name": "4D2OP5Gg"}, {"extensionCategory": "pkLZJGj5", "maxReportPerTicket": 76, "name": "4lQdujXK"}], "timeInterval": 15, "userMaxReportPerTimeInterval": 65}' \
    > test.out 2>&1
eval_tap $? 7 'Upsert' test.out

#- 8 AdminListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting adminListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 8 'AdminListReasonGroups' test.out

#- 9 CreateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting createReasonGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["f3OUg0RC", "5OaGYATV", "TOs9MMpq"], "title": "OFsPa716"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateReasonGroup' test.out

#- 10 GetReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting getReasonGroup \
    --groupId 'ztnhhobx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetReasonGroup' test.out

#- 11 DeleteReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting deleteReasonGroup \
    --groupId 'Iv1KrgqE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteReasonGroup' test.out

#- 12 UpdateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting updateReasonGroup \
    --groupId 'QXMjRCDq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["vgtT4vM8", "nkZ8KqcD", "diV3qmRr"], "title": "qtTFF3Iu"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateReasonGroup' test.out

#- 13 AdminGetReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'Mc1JYO9I' \
    --limit '59' \
    --offset '18' \
    --title 'FMbl3F5e' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetReasons' test.out

#- 14 CreateReason
./ng net.accelbyte.sdk.cli.Main reporting createReason \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8Mf56xKV", "groupIds": ["yd6Kr4yi", "Ab3qaiYo", "0H5oRZTG"], "title": "957RTRgq"}' \
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
    --extensionCategory 'Vt1ABTAc' \
    --category 'NHqDwdew' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUnusedReasons' test.out

#- 17 AdminGetReason
./ng net.accelbyte.sdk.cli.Main reporting adminGetReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'Ear5fLZS' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetReason' test.out

#- 18 DeleteReason
./ng net.accelbyte.sdk.cli.Main reporting deleteReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'uVFWuMvs' \
    > test.out 2>&1
eval_tap $? 18 'DeleteReason' test.out

#- 19 UpdateReason
./ng net.accelbyte.sdk.cli.Main reporting updateReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId '053oJ1yi' \
    --body '{"description": "ZoGk993e", "groupIds": ["eFNr0tYq", "IrXcu7ag", "44wm475G"], "title": "TiNCZnNW"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateReason' test.out

#- 20 ListReports
./ng net.accelbyte.sdk.cli.Main reporting listReports \
    --namespace "$AB_NAMESPACE" \
    --category '1MZDnXyK' \
    --limit '70' \
    --offset '82' \
    --reportedUserId 'LjR0oOuR' \
    --sortBy 'kT1YP9Aa' \
    > test.out 2>&1
eval_tap $? 20 'ListReports' test.out

#- 21 AdminSubmitReport
./ng net.accelbyte.sdk.cli.Main reporting adminSubmitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"EvBNzEi7": {}, "vOhB35Tl": {}, "LUHeAepZ": {}}, "category": "UGC", "comment": "busPZE9Y", "extensionCategory": "qoSCzlSz", "objectId": "m5STPhjb", "objectType": "A1PvUeHt", "reason": "IcB5cBeX", "userId": "Lr7nj8aB"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSubmitReport' test.out

#- 22 CreateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting createModerationRule \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "lWp5sJPr", "duration": 58, "reason": "7wjuGRbS", "skipNotif": true, "type": "QLEbWbxb"}, "deleteChat": false, "extensionActionIds": ["VUtWnrti", "w2HGBAZL", "1aoUeJlx"], "hideContent": false}, "active": false, "category": "EXTENSION", "extensionCategory": "Aih9tbOv", "reason": "nmRyJ2pz", "threshold": 30}' \
    > test.out 2>&1
eval_tap $? 22 'CreateModerationRule' test.out

#- 23 UpdateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'ngSzEAco' \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "1ufLj1ry", "duration": 53, "reason": "JvASYXZJ", "skipNotif": false, "type": "80MNHCkF"}, "deleteChat": true, "extensionActionIds": ["wpkeZYUv", "RIpWCRLr", "PvZpiAbd"], "hideContent": true}, "active": true, "category": "CHAT", "extensionCategory": "XVsk72Vu", "reason": "oekiMch5", "threshold": 73}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateModerationRule' test.out

#- 24 DeleteModerationRule
./ng net.accelbyte.sdk.cli.Main reporting deleteModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'SQ45AEIE' \
    > test.out 2>&1
eval_tap $? 24 'DeleteModerationRule' test.out

#- 25 UpdateModerationRuleStatus
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRuleStatus \
    --namespace "$AB_NAMESPACE" \
    --ruleId '6dAlS8Z4' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateModerationRuleStatus' test.out

#- 26 GetModerationRules
./ng net.accelbyte.sdk.cli.Main reporting getModerationRules \
    --namespace "$AB_NAMESPACE" \
    --category 'Um9kEJie' \
    --extensionCategory '1Rc0z6K1' \
    --limit '79' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 26 'GetModerationRules' test.out

#- 27 GetModerationRuleDetails
./ng net.accelbyte.sdk.cli.Main reporting getModerationRuleDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleId '4fpXygB5' \
    > test.out 2>&1
eval_tap $? 27 'GetModerationRuleDetails' test.out

#- 28 ListTickets
./ng net.accelbyte.sdk.cli.Main reporting listTickets \
    --namespace "$AB_NAMESPACE" \
    --category 'TTqeFZWV' \
    --extensionCategory 'bAmeysqs' \
    --limit '7' \
    --offset '0' \
    --order 'hk8EFg1G' \
    --reportedUserId 'cGyvgOdx' \
    --sortBy 'KpXN6MVN' \
    --status 'bAozBS3W' \
    > test.out 2>&1
eval_tap $? 28 'ListTickets' test.out

#- 29 TicketStatistic
./ng net.accelbyte.sdk.cli.Main reporting ticketStatistic \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'UtcQtqTy' \
    --category 'MVoRluFL' \
    > test.out 2>&1
eval_tap $? 29 'TicketStatistic' test.out

#- 30 GetTicketDetail
./ng net.accelbyte.sdk.cli.Main reporting getTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'vACqOe1R' \
    > test.out 2>&1
eval_tap $? 30 'GetTicketDetail' test.out

#- 31 DeleteTicket
./ng net.accelbyte.sdk.cli.Main reporting deleteTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'DaoRFNbR' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTicket' test.out

#- 32 GetReportsByTicket
./ng net.accelbyte.sdk.cli.Main reporting getReportsByTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'ZlyU0beL' \
    --limit '35' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 32 'GetReportsByTicket' test.out

#- 33 UpdateTicketResolutions
./ng net.accelbyte.sdk.cli.Main reporting updateTicketResolutions \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'FWNVKD8W' \
    --body '{"notes": "CtCCzxO9", "status": "UNKNOWN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTicketResolutions' test.out

#- 34 PublicListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting publicListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 34 'PublicListReasonGroups' test.out

#- 35 PublicGetReasons
./ng net.accelbyte.sdk.cli.Main reporting publicGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'J5o14EiR' \
    --limit '30' \
    --offset '32' \
    --title 'uEuUxcUF' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetReasons' test.out

#- 36 SubmitReport
./ng net.accelbyte.sdk.cli.Main reporting submitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"lgANBTDu": {}, "wPP6UOxf": {}, "z4GkdD4q": {}}, "category": "UGC", "comment": "kex02GI4", "extensionCategory": "RcHL3RKW", "objectId": "DGratR2Z", "objectType": "fsDIvhDf", "reason": "RHxgbngu", "userId": "B5HOoUnW"}' \
    > test.out 2>&1
eval_tap $? 36 'SubmitReport' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
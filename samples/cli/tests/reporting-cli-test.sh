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
    --body '{"actionId": "HIKHEGLV", "actionName": "u9H2JTpu", "eventName": "pTMm8zIM"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateModAction' test.out

#- 4 AdminFindExtensionCategoryList
./ng net.accelbyte.sdk.cli.Main reporting adminFindExtensionCategoryList \
    --order 'descending' \
    --sortBy 'extensionCategoryName' \
    > test.out 2>&1
eval_tap $? 4 'AdminFindExtensionCategoryList' test.out

#- 5 AdminCreateExtensionCategory
./ng net.accelbyte.sdk.cli.Main reporting adminCreateExtensionCategory \
    --body '{"extensionCategory": "j63K5ds7", "extensionCategoryName": "cy7XVUKT", "serviceSource": "clIepL7z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateExtensionCategory' test.out

#- 6 Get
./ng net.accelbyte.sdk.cli.Main reporting get \
    --namespace "$AB_NAMESPACE" \
    --category 'all' \
    > test.out 2>&1
eval_tap $? 6 'Get' test.out

#- 7 Upsert
./ng net.accelbyte.sdk.cli.Main reporting upsert \
    --namespace "$AB_NAMESPACE" \
    --body '{"categoryLimits": [{"extensionCategory": "Yfj9HbGR", "maxReportPerTicket": 97, "name": "yoIa92fy"}, {"extensionCategory": "NousX8Fe", "maxReportPerTicket": 19, "name": "gp6MZXGE"}, {"extensionCategory": "7uUGkP5w", "maxReportPerTicket": 12, "name": "61BzlQ5z"}], "timeInterval": 9, "userMaxReportPerTimeInterval": 63}' \
    > test.out 2>&1
eval_tap $? 7 'Upsert' test.out

#- 8 AdminListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting adminListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 8 'AdminListReasonGroups' test.out

#- 9 CreateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting createReasonGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["FMI1Sxf5", "yx6t6dHk", "YzFuwYfw"], "title": "ZwYn60lr"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateReasonGroup' test.out

#- 10 GetReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting getReasonGroup \
    --groupId 'mJiTmHLh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetReasonGroup' test.out

#- 11 DeleteReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting deleteReasonGroup \
    --groupId 'WiPo5Pfn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteReasonGroup' test.out

#- 12 UpdateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting updateReasonGroup \
    --groupId 'BvNq0wml' \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["mP0WbPTw", "uBlqfq1M", "SQ2dMO6X"], "title": "C0YUPigW"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateReasonGroup' test.out

#- 13 AdminGetReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'f24J5Yua' \
    --limit '49' \
    --offset '93' \
    --title '3RVugRnW' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetReasons' test.out

#- 14 CreateReason
./ng net.accelbyte.sdk.cli.Main reporting createReason \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "sibMvOe9", "groupIds": ["ikAyYRzK", "5gVvJ8vp", "3Ktns0qR"], "title": "0hqqkc9x"}' \
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
    --extensionCategory 'WKoHUJhB' \
    --category 'BJHouNC3' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUnusedReasons' test.out

#- 17 AdminGetReason
./ng net.accelbyte.sdk.cli.Main reporting adminGetReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'qHEbaFNE' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetReason' test.out

#- 18 DeleteReason
./ng net.accelbyte.sdk.cli.Main reporting deleteReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'ebkrPizB' \
    > test.out 2>&1
eval_tap $? 18 'DeleteReason' test.out

#- 19 UpdateReason
./ng net.accelbyte.sdk.cli.Main reporting updateReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'IE4Osmp4' \
    --body '{"description": "JHrW6pWF", "groupIds": ["mWgWqYH0", "BEAFAqL4", "I0Hx3fsT"], "title": "1I2h5wLR"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateReason' test.out

#- 20 ListReports
./ng net.accelbyte.sdk.cli.Main reporting listReports \
    --namespace "$AB_NAMESPACE" \
    --category 'EmK1lgBi' \
    --limit '92' \
    --offset '22' \
    --reportedUserId 'nWgYgJ2b' \
    --sortBy 'NQ4SX3Km' \
    > test.out 2>&1
eval_tap $? 20 'ListReports' test.out

#- 21 AdminSubmitReport
./ng net.accelbyte.sdk.cli.Main reporting adminSubmitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"jDZx8Gsn": {}, "1rxswIOw": {}, "0QIhfp5u": {}}, "category": "UGC", "comment": "kejHePcJ", "extensionCategory": "Zpfi5cgl", "objectId": "CcKsEDYt", "objectType": "y7xog1Q8", "reason": "jqyOwwuy", "userId": "1vDjwb9y"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSubmitReport' test.out

#- 22 CreateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting createModerationRule \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "tYmf0I60", "duration": 1, "reason": "iouJAjtu", "skipNotif": false, "type": "ZR3FY8OA"}, "deleteChat": false, "extensionActionIds": ["taOoKNVq", "t34Hk5bf", "rmjtJnbm"], "hideContent": false}, "active": true, "category": "EXTENSION", "extensionCategory": "rvE2scKz", "reason": "RAqxTg0B", "threshold": 18}' \
    > test.out 2>&1
eval_tap $? 22 'CreateModerationRule' test.out

#- 23 UpdateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'UaMcXZZZ' \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "3GyZWzHy", "duration": 42, "reason": "5pVsoZ6j", "skipNotif": true, "type": "nvkHvlu5"}, "deleteChat": false, "extensionActionIds": ["guP868uG", "pCJ2x2WV", "pwIS4MCy"], "hideContent": false}, "active": false, "category": "UGC", "extensionCategory": "BKT32ej7", "reason": "GQztWzsQ", "threshold": 92}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateModerationRule' test.out

#- 24 DeleteModerationRule
./ng net.accelbyte.sdk.cli.Main reporting deleteModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId '8Pmp2Nfu' \
    > test.out 2>&1
eval_tap $? 24 'DeleteModerationRule' test.out

#- 25 UpdateModerationRuleStatus
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRuleStatus \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'EA1Qzmi5' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateModerationRuleStatus' test.out

#- 26 GetModerationRules
./ng net.accelbyte.sdk.cli.Main reporting getModerationRules \
    --namespace "$AB_NAMESPACE" \
    --category 'GGjQ3akh' \
    --extensionCategory 'mtd5CYJX' \
    --limit '70' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 26 'GetModerationRules' test.out

#- 27 GetModerationRuleDetails
./ng net.accelbyte.sdk.cli.Main reporting getModerationRuleDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'tsuZvcjm' \
    > test.out 2>&1
eval_tap $? 27 'GetModerationRuleDetails' test.out

#- 28 ListTickets
./ng net.accelbyte.sdk.cli.Main reporting listTickets \
    --namespace "$AB_NAMESPACE" \
    --category 'Iwy9SrbO' \
    --extensionCategory 'Xsj1x4hP' \
    --limit '78' \
    --offset '41' \
    --order 'dOn6zHrx' \
    --reportedUserId '61cnyt6Z' \
    --sortBy 'r360pkdz' \
    --status 'uOge7ZMZ' \
    > test.out 2>&1
eval_tap $? 28 'ListTickets' test.out

#- 29 TicketStatistic
./ng net.accelbyte.sdk.cli.Main reporting ticketStatistic \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'PdenW03x' \
    --category 'sVYqboXx' \
    > test.out 2>&1
eval_tap $? 29 'TicketStatistic' test.out

#- 30 GetTicketDetail
./ng net.accelbyte.sdk.cli.Main reporting getTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'FQgrboZB' \
    > test.out 2>&1
eval_tap $? 30 'GetTicketDetail' test.out

#- 31 DeleteTicket
./ng net.accelbyte.sdk.cli.Main reporting deleteTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId '7aHsr97W' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTicket' test.out

#- 32 GetReportsByTicket
./ng net.accelbyte.sdk.cli.Main reporting getReportsByTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'xAsntZU9' \
    --limit '69' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 32 'GetReportsByTicket' test.out

#- 33 UpdateTicketResolutions
./ng net.accelbyte.sdk.cli.Main reporting updateTicketResolutions \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'h7pbxjzI' \
    --body '{"notes": "73sp4KCy", "status": "UNKNOWN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTicketResolutions' test.out

#- 34 PublicListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting publicListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 34 'PublicListReasonGroups' test.out

#- 35 PublicGetReasons
./ng net.accelbyte.sdk.cli.Main reporting publicGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'w3aVvNk6' \
    --limit '67' \
    --offset '74' \
    --title '6dMcjF4h' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetReasons' test.out

#- 36 SubmitReport
./ng net.accelbyte.sdk.cli.Main reporting submitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"H3mxt8qa": {}, "vXWyJlzX": {}, "6MFWbX2V": {}}, "category": "EXTENSION", "comment": "Ub75K7KI", "extensionCategory": "DTyv7rri", "objectId": "hCZF0Stu", "objectType": "Qa1MPrVm", "reason": "H0wA3D2x", "userId": "dr4j6aYh"}' \
    > test.out 2>&1
eval_tap $? 36 'SubmitReport' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
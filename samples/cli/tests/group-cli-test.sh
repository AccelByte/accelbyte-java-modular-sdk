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
echo "1..74"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "jYhrsaou", "description": "EHfFMCWY", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "tr56aSJs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.386527600257066}, {"ruleAttribute": "qm04tKcD", "ruleCriteria": "EQUAL", "ruleValue": 0.5637827931411948}, {"ruleAttribute": "jrply0Gp", "ruleCriteria": "MINIMUM", "ruleValue": 0.1253827465315157}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "tDVWaOWD", "ruleCriteria": "EQUAL", "ruleValue": 0.0791676508314707}, {"ruleAttribute": "hKAtcPmA", "ruleCriteria": "MINIMUM", "ruleValue": 0.015248444791980509}, {"ruleAttribute": "sil9LY1J", "ruleCriteria": "MINIMUM", "ruleValue": 0.6135251668951246}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "UfZqAFOV", "ruleCriteria": "EQUAL", "ruleValue": 0.9356066000870343}, {"ruleAttribute": "w7TijQup", "ruleCriteria": "MINIMUM", "ruleValue": 0.4169253194141823}, {"ruleAttribute": "utIIlr1R", "ruleCriteria": "EQUAL", "ruleValue": 0.18856639716382373}]}], "groupAdminRoleId": "WpsjUuLM", "groupMaxMember": 30, "groupMemberRoleId": "WLXbEUzZ", "name": "GLymyKBU"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'jII5Xk8u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'I3J86q1E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '6LrEXxwc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "LphR6VUt", "groupMaxMember": 76, "name": "mJxxt36B"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'v8yCy4AH' \
    --configurationCode 'YBW8ccLk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "k0AgzjPi", "ruleCriteria": "EQUAL", "ruleValue": 0.11621927390128384}, {"ruleAttribute": "UjK2tIZc", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5378509410190443}, {"ruleAttribute": "IjOqYYtn", "ruleCriteria": "EQUAL", "ruleValue": 0.6419727647949295}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '7jN1ShQi' \
    --configurationCode 'sYFQOoQb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'Vh99y7Ip' \
    --groupName 'q8PWvGjs' \
    --groupRegion 'dXtXTMdf' \
    --limit '93' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'qklcqtW2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '10rgfzXp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'mnYFMSRZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '58' \
    --order 'n9weBlhp' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "m5HzSdUM", "memberRolePermissions": [{"action": 64, "resourceName": "0bT4IFFI"}, {"action": 80, "resourceName": "kIDw9cYE"}, {"action": 91, "resourceName": "9mgoTbnQ"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'kJLfybVH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'poltJltH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'ZEsa5y8n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "SCi5H3hJ"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '5LSperOj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 81, "resourceName": "1580hrHy"}, {"action": 22, "resourceName": "SlzMgEGq"}, {"action": 71, "resourceName": "W8bU97CQ"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '30Q4pYrs' \
    --groupRegion 'SdN2SVbq' \
    --limit '69' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "pPKi5JvJ", "customAttributes": {"rgnX3pHV": {}, "fbwJYwzk": {}, "wJbzfQA1": {}}, "groupDescription": "zyEcb619", "groupIcon": "BbCpXQ4l", "groupMaxMember": 36, "groupName": "9U9RTFxo", "groupRegion": "PWkuNoP8", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "89397vcd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5861883112984008}, {"ruleAttribute": "VzqfcUWE", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5451243830842346}, {"ruleAttribute": "VkRTF8UK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.056445158048709976}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "6jHkjUzm", "ruleCriteria": "EQUAL", "ruleValue": 0.7808812354039073}, {"ruleAttribute": "HEywIMXr", "ruleCriteria": "MINIMUM", "ruleValue": 0.17669273296351273}, {"ruleAttribute": "hKMPZkjZ", "ruleCriteria": "EQUAL", "ruleValue": 0.6112485894568755}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "NcVpThdN", "ruleCriteria": "EQUAL", "ruleValue": 0.6370226380655247}, {"ruleAttribute": "o0UfU8Cb", "ruleCriteria": "MINIMUM", "ruleValue": 0.6107881386475491}, {"ruleAttribute": "uJDGHv56", "ruleCriteria": "EQUAL", "ruleValue": 0.08705260107822199}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'P5eSK90G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '8RpXcoyy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "uUFe4BTf", "groupIcon": "UhR6Gau6", "groupName": "iItgfjl5", "groupRegion": "63Dg9xzx", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'V1VyMWiA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '5ivOjy4q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "hQ9ICFcz", "groupIcon": "LMuLeEj3", "groupName": "a25GpeSf", "groupRegion": "rHYMeWMx", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'IhFbSnsz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"sg5EFHVv": {}, "gG0PSKuh": {}, "3Ckjd0Gj": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '7SKqJHSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'x52YwP2s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'Zgg0sohd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'K5q0bBjp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'LIMK7A5a' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Y21kqtmq' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '62' \
    --order 'jgzHz4u5' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'DYomlbRT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"Jt5WNFJr": {}, "dHtsIM3Y": {}, "kzRODMQp": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'A1dWveE9' \
    --groupId '3CTM6Vx4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "SNNDMCUS", "ruleCriteria": "EQUAL", "ruleValue": 0.7054423791057207}, {"ruleAttribute": "J1Y0ktkV", "ruleCriteria": "EQUAL", "ruleValue": 0.402434848592497}, {"ruleAttribute": "KMMlfHj1", "ruleCriteria": "EQUAL", "ruleValue": 0.03615491299045959}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '88UAQovi' \
    --groupId 'Jc6BDbeS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteGroupPredefinedRulePublicV1' test.out

#- 36 LeaveGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'LeaveGroupPublicV1' test.out

#- 37 GetMemberRolesListPublicV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'gKBdHxzT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "yLXsvd1c"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'SmUNlEuV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "2hdrHACn"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NVKPxwCT' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X998d9UT' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'raMWVERk' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4YfMmbTP' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jvIfJXJB' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["4RdPKbUV", "3PJJYPPb", "HEfRrsEL"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOrzOYDr' \
    --limit '18' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'aC03gBLs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eySzwEJY' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "jSb3iGOM", "customAttributes": {"lSrHrw4o": {}, "w3SRym9D": {}, "tG5HWeHW": {}}, "groupDescription": "dZiwiZpk", "groupIcon": "ysYGq8qc", "groupMaxMember": 67, "groupName": "hd7n7I4R", "groupRegion": "YLVnwmvV", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "6D2q0Jij", "ruleCriteria": "MINIMUM", "ruleValue": 0.1545619669591336}, {"ruleAttribute": "0HSPYXQ6", "ruleCriteria": "EQUAL", "ruleValue": 0.14832838193800124}, {"ruleAttribute": "tr2CEdzG", "ruleCriteria": "MINIMUM", "ruleValue": 0.2633044948785951}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "hIJ1kPnM", "ruleCriteria": "EQUAL", "ruleValue": 0.9720331465450596}, {"ruleAttribute": "sph9nLrD", "ruleCriteria": "MINIMUM", "ruleValue": 0.23904613605822378}, {"ruleAttribute": "m7AafYMo", "ruleCriteria": "EQUAL", "ruleValue": 0.33342101880954633}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "mdpoTRk2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11855806068082042}, {"ruleAttribute": "Bx0V5qV1", "ruleCriteria": "EQUAL", "ruleValue": 0.057657239899676194}, {"ruleAttribute": "uf4HwaiY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.778920524918658}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["lNIYaoFU", "qcx2O2bt", "bEOp3VVl"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'iLz00lww' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "XPvmAWR9", "groupIcon": "3DKHCIZU", "groupName": "CM4NtwM4", "groupRegion": "uYL5WHJn", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'bZ4BusR4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'p6CPYNFC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ZFyPbXvN", "groupIcon": "DLujy90G", "groupName": "vP9V3UAT", "groupRegion": "Que5TrMV", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'YKiL5ktr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"7dA2X3dZ": {}, "5G038EPu": {}, "dlXTzaLh": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'XJNW1Dqt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'YIO7J3Xh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'WJSSz1hR' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'KJtwkCfd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '5CJXqs5L' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'VSHBJInT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'JRYNxGun' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"SV4fj4NS": {}, "62Dgard3": {}, "uyfuL9Ym": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction '5w3icDJZ' \
    --groupId 'VygLzN1E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "bGnTvG1R", "ruleCriteria": "MINIMUM", "ruleValue": 0.007659993495609085}, {"ruleAttribute": "OxMXVvdU", "ruleCriteria": "EQUAL", "ruleValue": 0.8406421006954521}, {"ruleAttribute": "icpcvO1b", "ruleCriteria": "EQUAL", "ruleValue": 0.2028054378798938}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'VrPVOJ4Y' \
    --groupId 'nSHZDl1x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'vleq2veT' \
    --memberRoleId 'F4OQecfu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "jPYDbu3p"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'nkBLl5yW' \
    --memberRoleId 'OjowbuJ6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RB60l231"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'L20GvgK0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gjuSJ5av' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'AmvmmEZG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rJ13Zk5P' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 's5NSg4Yd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'suuUsEz6' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'x30dcsA0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HYy70Yia' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'ar4ALyej' \
    --namespace "$AB_NAMESPACE" \
    --userId '0Ix4zqrr' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'rUQ2MpZo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKH66Mb0' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
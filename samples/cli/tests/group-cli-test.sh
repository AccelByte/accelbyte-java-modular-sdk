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
    --limit '53' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "B7VfLBSe", "description": "AsXljlfo", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "0RO8kTDr", "ruleCriteria": "EQUAL", "ruleValue": 0.5907928565245112}, {"ruleAttribute": "egKi4yVZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.13370489518095852}, {"ruleAttribute": "XXfh2qYT", "ruleCriteria": "MINIMUM", "ruleValue": 0.05831956040853192}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "PGM69pHX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23857266988381176}, {"ruleAttribute": "tW8D61dv", "ruleCriteria": "EQUAL", "ruleValue": 0.14726558001546863}, {"ruleAttribute": "Z72yEGpJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.6813942954866006}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "oQGr2SqU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.95116291418914}, {"ruleAttribute": "47D39hzg", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4476368198141242}, {"ruleAttribute": "6fNBqjzt", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5651280997181491}]}], "groupAdminRoleId": "jUYGToYg", "groupMaxMember": 31, "groupMemberRoleId": "BkMV29Mf", "name": "aJCT6bIP"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'TxBpwl3M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'xJ1e5VBv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '89qnkRP0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wZRI050p", "groupMaxMember": 71, "name": "Gu8kK5IJ"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'bjruRYcK' \
    --configurationCode 'dHKDHXIe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "SbgRifEy", "ruleCriteria": "EQUAL", "ruleValue": 0.8868972940766432}, {"ruleAttribute": "ywnWIdkD", "ruleCriteria": "EQUAL", "ruleValue": 0.574296235535815}, {"ruleAttribute": "yY6UFQGp", "ruleCriteria": "MAXIMUM", "ruleValue": 0.10541421435317933}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'HVzEnJCL' \
    --configurationCode 'KtX7IsIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'AbTWtfXp' \
    --groupName 'lhprRVOg' \
    --groupRegion 'uew1a7jr' \
    --limit '64' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'NmOZ8xru' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'emCPt1NW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'y7oFsbUj' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '64' \
    --order 'FM2dbBS1' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "yu6qbiRx", "memberRolePermissions": [{"action": 12, "resourceName": "Am9pYICB"}, {"action": 85, "resourceName": "HypZCCCl"}, {"action": 43, "resourceName": "cY7k5EIY"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'cBgOja4U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'LFreud4i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'odsffQA2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "9l89YFMP"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'ebRM5LMR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 85, "resourceName": "nlSF4dUX"}, {"action": 98, "resourceName": "Q3pBPve0"}, {"action": 11, "resourceName": "MUg2hYhg"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Baoq55Zw' \
    --groupRegion 'VvwT79eN' \
    --limit '16' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "NtKClyob", "customAttributes": {"bVpQkbet": {}, "H8vNt90J": {}, "0SHCtML8": {}}, "groupDescription": "vMg2VcGx", "groupIcon": "ztYW9Cqd", "groupMaxMember": 7, "groupName": "68ttqosg", "groupRegion": "8vItnAhY", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "7gnEE2bI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5798017929960997}, {"ruleAttribute": "vzh7w2DZ", "ruleCriteria": "EQUAL", "ruleValue": 0.9659875360860515}, {"ruleAttribute": "KNs4mt2E", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6044904458646306}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "9CuVQXHY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5572008289120036}, {"ruleAttribute": "1e169ZdG", "ruleCriteria": "MINIMUM", "ruleValue": 0.024993400606566518}, {"ruleAttribute": "1ZIeOZFD", "ruleCriteria": "MINIMUM", "ruleValue": 0.3938324995563426}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "KQF0qMqM", "ruleCriteria": "MINIMUM", "ruleValue": 0.026218092487778955}, {"ruleAttribute": "OnNGWYVV", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1479515902356885}, {"ruleAttribute": "Ac4Kmizh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6046483663311515}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'PxAC86JL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '09wKilED' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "29ctG4jS", "groupIcon": "PJcearak", "groupName": "fCZcMf7a", "groupRegion": "Gj3dRhvR", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'gFDmBqqv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '9iBu93AM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "eJ8GRMtA", "groupIcon": "FOtsb7wg", "groupName": "VsWs1Iyh", "groupRegion": "iZawGWY1", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '0jL8xO9e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"HPDHdYxI": {}, "fTcqz1D5": {}, "ymYT0ldw": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '5G2ZMUpo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'uMNqD8ZL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '5doKR6Ta' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'UWRDkVcE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'R5gaRULY' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'vxBdyMbN' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '3' \
    --order 'qWIyFzcp' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'zQ5LmD8W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"UEmltlar": {}, "rf6BP7Oq": {}, "1NZQZfcP": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'TssXm0jt' \
    --groupId '8WbPoKRf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "mPnLhyi2", "ruleCriteria": "MINIMUM", "ruleValue": 0.7194065783739065}, {"ruleAttribute": "982ygszV", "ruleCriteria": "EQUAL", "ruleValue": 0.3644194352773603}, {"ruleAttribute": "LNuTcXzV", "ruleCriteria": "MINIMUM", "ruleValue": 0.5791996941669442}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'wQp7I1aP' \
    --groupId 'tg1byvoR' \
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
    --limit '93' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'V1CaZpLW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "EAmoeI02"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'D5fX5x6a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "3RlL1qaL"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OmiiEwHK' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxxxNTib' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmxTjL4g' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0AYg70lO' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cPn0Wkqu' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["sGHxzcMk", "dvCmyneW", "MBeUBTlL"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bn5gr7CA' \
    --limit '73' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'VD6alv1C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FogCbOtd' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "9fgEyVGJ", "customAttributes": {"qro2fNCJ": {}, "lHjvJBXe": {}, "o61WWFmb": {}}, "groupDescription": "B39k3CvT", "groupIcon": "xjDe04hP", "groupMaxMember": 12, "groupName": "27nsrf0E", "groupRegion": "TVVR3okV", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "3PctIa6v", "ruleCriteria": "EQUAL", "ruleValue": 0.16372485598574216}, {"ruleAttribute": "L0h0KnNS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5978619090532803}, {"ruleAttribute": "VdPGQ6Ca", "ruleCriteria": "EQUAL", "ruleValue": 0.9937444216372311}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "cOQu1qlI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4281239021981309}, {"ruleAttribute": "gimZFikR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9515050359494626}, {"ruleAttribute": "u456Xx5R", "ruleCriteria": "MINIMUM", "ruleValue": 0.22602085543885575}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "PjPqytWd", "ruleCriteria": "EQUAL", "ruleValue": 0.7334408387475914}, {"ruleAttribute": "obTSk3RT", "ruleCriteria": "EQUAL", "ruleValue": 0.2440218365828487}, {"ruleAttribute": "ACXP3Ejf", "ruleCriteria": "EQUAL", "ruleValue": 0.41669380890883223}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["6Gb2OnvW", "lWuUX8SL", "U9NyKCbn"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'pYWoa1vB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "AE3irk5N", "groupIcon": "r4qscjh5", "groupName": "8b9FvRjg", "groupRegion": "LBdmPAtg", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'BFE40ZxW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'ReB85oiz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "4gQXPkmi", "groupIcon": "0IITFRkC", "groupName": "cVv6gvNb", "groupRegion": "WUVzgJI9", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'QL9bE4hH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"gHSdFCwx": {}, "y6ZfJxyb": {}, "gy12ndG9": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'QR2rQceR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '5Cz1OjLx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'bxOpH8AN' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'zmWmkts0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'zlfvENjn' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'kGtUCDIG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'U63im439' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"zdGzPQIo": {}, "f7tCFypp": {}, "i4b8HBAe": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'ylnGfb2a' \
    --groupId '9DJxbmrq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "SMF0djVT", "ruleCriteria": "EQUAL", "ruleValue": 0.7710415824696621}, {"ruleAttribute": "Gg6pQlrh", "ruleCriteria": "EQUAL", "ruleValue": 0.06555740352909778}, {"ruleAttribute": "0LpuSWB9", "ruleCriteria": "MINIMUM", "ruleValue": 0.620615319065109}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'L99aBbpj' \
    --groupId 'ozmBCZLn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'yiBiiVS9' \
    --memberRoleId 'H12BiBZQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RCmPd5mQ"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '1imrMHSs' \
    --memberRoleId 'zghqfPZw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Q261R3ar"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'l9hMcbDh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'No8Y4pEC' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'Kzq3BwrH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5fJ8PGs' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'vcuB31Vs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCjIKxf7' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'KySIbDt9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNyTwdCV' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId '7Ur1apQV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qggNnGdz' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'LZfUvlnc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhjNalFy' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
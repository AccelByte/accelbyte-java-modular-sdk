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
    --limit '92' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "NO7yEFT5", "description": "zMtcAqnp", "globalRules": [{"allowedAction": "ns2Dmdq9", "ruleDetail": [{"ruleAttribute": "UMWsqDA9", "ruleCriteria": "MINIMUM", "ruleValue": 0.10708877326295596}, {"ruleAttribute": "PSFcYNgZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06489788311722788}, {"ruleAttribute": "a7AQlVD2", "ruleCriteria": "MINIMUM", "ruleValue": 0.0230174352981376}]}, {"allowedAction": "RWaulYuA", "ruleDetail": [{"ruleAttribute": "GaZCkT0D", "ruleCriteria": "MINIMUM", "ruleValue": 0.6621796330993299}, {"ruleAttribute": "Pgp8IPTR", "ruleCriteria": "MINIMUM", "ruleValue": 0.27445553817956214}, {"ruleAttribute": "DvKnsvM2", "ruleCriteria": "EQUAL", "ruleValue": 0.38535284714165674}]}, {"allowedAction": "pPRys5SN", "ruleDetail": [{"ruleAttribute": "1IpnMixb", "ruleCriteria": "MINIMUM", "ruleValue": 0.3150201416514068}, {"ruleAttribute": "Z6wJrMNz", "ruleCriteria": "EQUAL", "ruleValue": 0.9030051045196908}, {"ruleAttribute": "eqoAUWDZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6367802033549648}]}], "groupAdminRoleId": "hIlD2Jgw", "groupMaxMember": 85, "groupMemberRoleId": "5oPaeaVa", "name": "yhDEwY2U"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'rn6WAvcf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'zRccKWuI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '72bzQPQb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "e3NQaxqN", "groupMaxMember": 64, "name": "9s9twHcu"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '2RYbObKv' \
    --configurationCode 'Y1PC04Qa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "wKHdx954", "ruleCriteria": "MAXIMUM", "ruleValue": 0.04501173585260421}, {"ruleAttribute": "0ycmDQb2", "ruleCriteria": "MINIMUM", "ruleValue": 0.18405224922426822}, {"ruleAttribute": "3YtPqesT", "ruleCriteria": "EQUAL", "ruleValue": 0.602743699600129}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'WaLtQ1LM' \
    --configurationCode 'wNQPzaE8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '5PWzTsDT' \
    --groupName 'JSIYGp1W' \
    --groupRegion 'WLkW0jZ4' \
    --limit '31' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'JK8MqwAD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '2DSZmJYw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'jWXFuKYf' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '78' \
    --order '0sbOTXk2' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "bMSO5uip", "memberRolePermissions": [{"action": 76, "resourceName": "CI5gjOuJ"}, {"action": 35, "resourceName": "egRbj61T"}, {"action": 80, "resourceName": "ouoLM10O"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '8xyzXxul' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'CPUfdtos' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'f2pJ9CgX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Jc8XuucI"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'HtViQpI4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 95, "resourceName": "4Djj2HeL"}, {"action": 51, "resourceName": "csqtGMRh"}, {"action": 72, "resourceName": "EOsMqtFo"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'fm53OYTs' \
    --groupRegion 'TqsW2207' \
    --limit '100' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "MnkoHrFy", "customAttributes": {"8NuxOHVo": {}, "q6VdM452": {}, "uzMrYF26": {}}, "groupDescription": "E7rJg8X4", "groupIcon": "iraCIVjU", "groupMaxMember": 8, "groupName": "7V8ksw1V", "groupRegion": "46tMeYP3", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "C6wCy5Kh", "ruleDetail": [{"ruleAttribute": "Feabu2P0", "ruleCriteria": "MINIMUM", "ruleValue": 0.23702146324789464}, {"ruleAttribute": "jyjbwaVh", "ruleCriteria": "EQUAL", "ruleValue": 0.1817743737251798}, {"ruleAttribute": "k02JzzJu", "ruleCriteria": "EQUAL", "ruleValue": 0.5066891372933947}]}, {"allowedAction": "r1qTyy2r", "ruleDetail": [{"ruleAttribute": "qcULexvU", "ruleCriteria": "MINIMUM", "ruleValue": 0.23315009079637605}, {"ruleAttribute": "LOiRypHE", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6506970043571783}, {"ruleAttribute": "1p8cpdry", "ruleCriteria": "MINIMUM", "ruleValue": 0.6536007387978869}]}, {"allowedAction": "n8XRDhot", "ruleDetail": [{"ruleAttribute": "DzP2MDTm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8890949467249136}, {"ruleAttribute": "I4dcmGd0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.08007315084153199}, {"ruleAttribute": "zhknE0Rx", "ruleCriteria": "MAXIMUM", "ruleValue": 0.737836671511024}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'GYov03cs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'SXCu8GmZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "sdo7osHg", "groupIcon": "tqV9Cy29", "groupName": "uua7Ost6", "groupRegion": "4BMjWe8x", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'wDoT4TGM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'XC9teVqd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "TYGCaeoG", "groupIcon": "1BKqzzvo", "groupName": "yEGpxelX", "groupRegion": "UfUCoTLH", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'OCkhhDag' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ZTae1RgJ": {}, "OOG6is7D": {}, "A9rzo4YH": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'vChYnLpc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'S4Xi2275' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '4ntchKNt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'bA8wEFiP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '9YLKQFiD' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'vXQ1bjE3' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '84' \
    --order 'iNy7qozj' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'NKEw59ih' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"gSd1OefR": {}, "dUV7C0Wf": {}, "FoboA6vT": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'K6df9JYs' \
    --groupId '3GUa5ZqK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "1ZtE6PH8", "ruleCriteria": "EQUAL", "ruleValue": 0.5199430639368616}, {"ruleAttribute": "tujgg1Ry", "ruleCriteria": "MINIMUM", "ruleValue": 0.46917510141651764}, {"ruleAttribute": "MD03yiaQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.1929593831191797}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'MLspAILy' \
    --groupId 'gKCQZ3Vb' \
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
    --limit '47' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'CccbC9in' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ogKFKV3v"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'zK1gdw43' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "hCBAJJke"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z8hVtbNA' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9t1qubK' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SS2FWX0e' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUbLBppF' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CIWKu9Vi' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["sUj1JhFy", "WXzoffPS", "z7jNsaUp"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWz9lsHJ' \
    --limit '65' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '78HvAtCh' \
    --namespace "$AB_NAMESPACE" \
    --userId '1xbc7a1G' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "VRCH0fxH", "customAttributes": {"1Q28hSTL": {}, "QorQLYa7": {}, "bzZlbb0l": {}}, "groupDescription": "lCV3lUgQ", "groupIcon": "8gioSnfw", "groupMaxMember": 53, "groupName": "Lpzuc8t4", "groupRegion": "Ovx3ssE7", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "iOuVCsEU", "ruleDetail": [{"ruleAttribute": "A8rzGCxn", "ruleCriteria": "EQUAL", "ruleValue": 0.41787666472955176}, {"ruleAttribute": "DMzIStHA", "ruleCriteria": "EQUAL", "ruleValue": 0.5300585218069807}, {"ruleAttribute": "xxImgM19", "ruleCriteria": "EQUAL", "ruleValue": 0.284975343178858}]}, {"allowedAction": "3stETiUv", "ruleDetail": [{"ruleAttribute": "wdRnuP5c", "ruleCriteria": "MINIMUM", "ruleValue": 0.18773191005260037}, {"ruleAttribute": "ggZfSFJG", "ruleCriteria": "MINIMUM", "ruleValue": 0.5205498942351228}, {"ruleAttribute": "2iFoqfB7", "ruleCriteria": "EQUAL", "ruleValue": 0.6729815272962266}]}, {"allowedAction": "KBVwjlCh", "ruleDetail": [{"ruleAttribute": "SrSCJ361", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8919141718710794}, {"ruleAttribute": "7U3CwJm6", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9575550643448263}, {"ruleAttribute": "deNwMvoD", "ruleCriteria": "EQUAL", "ruleValue": 0.28566337363908145}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["F44elhVN", "HCM13XAs", "mCibVAaI"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'u27X7Rie' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "SC76TjP7", "groupIcon": "nUPhze2Q", "groupName": "3yzVpUYu", "groupRegion": "HLAchnV3", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'F9u9AtyC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'kCLwzBGw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "6j93G49f", "groupIcon": "T5OBd0ub", "groupName": "SmaUqGUg", "groupRegion": "tXUjLxSZ", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'bom6QxKV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"uIiI2o6J": {}, "PBIqjGsi": {}, "VEVNkfhP": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'onC4GJGA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '5wMIVkyK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'RZ1xcmOx' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'rWdppUHI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'jmGKYSvW' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'XXBmIZGx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'vh65GQFD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"bJvtvFRG": {}, "nFUKinmh": {}, "ukMGey7p": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'WBoZXpnY' \
    --groupId 'M6sj80mY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "G6nUCWHI", "ruleCriteria": "EQUAL", "ruleValue": 0.9279923887217016}, {"ruleAttribute": "wOMbfpQR", "ruleCriteria": "MINIMUM", "ruleValue": 0.41913121285008104}, {"ruleAttribute": "E3NkccRi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7198084342489135}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'ixe0n4L3' \
    --groupId 'H5LRNjqr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'jAnt5hfB' \
    --memberRoleId 'RZzWZlGA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "LOJXJ0rP"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'VtT1CeWL' \
    --memberRoleId 'q7iLCzkf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "g7QNJRj3"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'LG7Jfozm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSZ12En6' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'zZQapkDb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K2RWebuS' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'jhbhFioD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zIsjkw3V' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'TdqHp2v3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzgVTgr6' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'rNGNEBc1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'McTmqZjJ' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'ILLJqjR0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FkBAyM5f' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
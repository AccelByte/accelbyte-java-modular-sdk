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
    --limit '19' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "ZpqGNE0f", "description": "elWx1bqM", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "9BWhwk9m", "ruleCriteria": "EQUAL", "ruleValue": 0.9784205588020405}, {"ruleAttribute": "BRlvy0Pz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.43052097715798465}, {"ruleAttribute": "Ag4x0ygQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.3810576488397003}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "6NBxOPAQ", "ruleCriteria": "EQUAL", "ruleValue": 0.28592728832073977}, {"ruleAttribute": "PVEweryL", "ruleCriteria": "EQUAL", "ruleValue": 0.000431334484397361}, {"ruleAttribute": "rBvAZ6pR", "ruleCriteria": "MINIMUM", "ruleValue": 0.8317736156934008}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ofJjnnbr", "ruleCriteria": "EQUAL", "ruleValue": 0.8569684505941537}, {"ruleAttribute": "59JWmRVl", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8569284930079816}, {"ruleAttribute": "BCzgRE02", "ruleCriteria": "MAXIMUM", "ruleValue": 0.609011325536235}]}], "groupAdminRoleId": "6oZNzG84", "groupMaxMember": 45, "groupMemberRoleId": "xproTDXu", "name": "eGPsCBfK"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'CBTiJgcW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '9kR7viy4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'Ws7pleas' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "xY7pI9gp", "groupMaxMember": 51, "name": "RUD8pTxU"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'rDmBroLd' \
    --configurationCode 'n6MMSj8m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "8kR04moC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5707819459287317}, {"ruleAttribute": "7zkokzOm", "ruleCriteria": "MINIMUM", "ruleValue": 0.1088570405908369}, {"ruleAttribute": "nH7pEDbL", "ruleCriteria": "MINIMUM", "ruleValue": 0.6114986401076568}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'pk4kMYUw' \
    --configurationCode 'WE3VpXxU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'AkUQDYz0' \
    --groupName '5PxPg2f7' \
    --groupRegion 'TXmXvVmu' \
    --limit '18' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'al6RErbG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'vQtHftpQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'd89RZAPK' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '37' \
    --order 'dDxlkcLj' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "b7XUbdG5", "memberRolePermissions": [{"action": 78, "resourceName": "PQK79CPL"}, {"action": 6, "resourceName": "GpG9Rxyk"}, {"action": 94, "resourceName": "0a43lVOj"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '2PYsy51S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'sXtwh7B4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'qOSurB2O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "6vE6k3bC"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'Emqxq77N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 89, "resourceName": "LATZCz3b"}, {"action": 72, "resourceName": "gxOWZm1J"}, {"action": 21, "resourceName": "gLNZsBK4"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'l5HY9YwX' \
    --groupRegion 'WCACgGJk' \
    --limit '41' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "qbxSQBqL", "customAttributes": {"sQayFcg9": {}, "cFd7M45Q": {}, "Woz0U1U0": {}}, "groupDescription": "i0ICbfm2", "groupIcon": "yNQCdMso", "groupMaxMember": 56, "groupName": "NjeVpaA1", "groupRegion": "mwefHzdV", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "OWtWHDeH", "ruleCriteria": "EQUAL", "ruleValue": 0.48679452784883337}, {"ruleAttribute": "es2a9E5u", "ruleCriteria": "MAXIMUM", "ruleValue": 0.17624007304180012}, {"ruleAttribute": "Wp5zujEs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4791777370754554}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "SosYLRi5", "ruleCriteria": "EQUAL", "ruleValue": 0.24017153864203922}, {"ruleAttribute": "HhssJs12", "ruleCriteria": "MINIMUM", "ruleValue": 0.5075577774093298}, {"ruleAttribute": "Mk1T3nmy", "ruleCriteria": "EQUAL", "ruleValue": 0.9639450617864264}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "lZuRyb8r", "ruleCriteria": "MINIMUM", "ruleValue": 0.8386441937423287}, {"ruleAttribute": "mdxcxfBc", "ruleCriteria": "EQUAL", "ruleValue": 0.23536841028585687}, {"ruleAttribute": "0dQurrs5", "ruleCriteria": "MINIMUM", "ruleValue": 0.440627606122762}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Tfki7rzy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '93SpZzvg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "hDxKSF9F", "groupIcon": "ZG5ijUTf", "groupName": "tb081A4C", "groupRegion": "W30Q3sR8", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'UVnn62Vt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'gcQRpVZe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Sd8oCbxG", "groupIcon": "jP6cUinj", "groupName": "wJr1JTtM", "groupRegion": "Faq3PDrh", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'cqviGG7Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8AQgoedV": {}, "UofmGsI1": {}, "nKt2olIH": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '6SUFcEXn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'djHbCWmL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'oArTzv3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'FsJEjWYl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '94ZB6XFq' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Vldx3mPl' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '72' \
    --order 'ENpagz96' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'exQJR9aw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"aejS4REk": {}, "6fcSjsbL": {}, "6COH50Te": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '1xfjqZ2z' \
    --groupId 'fpNVK1eE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "5yMyqXlH", "ruleCriteria": "EQUAL", "ruleValue": 0.4256858420274039}, {"ruleAttribute": "ZUo2h82q", "ruleCriteria": "EQUAL", "ruleValue": 0.576710881500008}, {"ruleAttribute": "IGwLhNYG", "ruleCriteria": "EQUAL", "ruleValue": 0.9059848079505973}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'WlduzV5s' \
    --groupId 'unmLBvLh' \
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
    --limit '24' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'fkyTaPYO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "88iDNS8q"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '6H5kt7mV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "B1eKRjOo"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eR3iPTL1' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mC84sm38' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yErwwxrw' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MfbNZJhc' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZGmG8gn' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["K5KKiU35", "pDFAflqp", "jzi4xY7c"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhoGsjni' \
    --limit '99' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'pIke9kgC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PsVErE7S' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "I2gaLYOq", "customAttributes": {"UcyoVCI7": {}, "OxnObnlk": {}, "fur8XaKz": {}}, "groupDescription": "e2TnD2Oh", "groupIcon": "FtBgU8nI", "groupMaxMember": 93, "groupName": "J3SuaXlo", "groupRegion": "j8Jd1N7F", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "iEPnQvqA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9376987642318061}, {"ruleAttribute": "nGJ99JAu", "ruleCriteria": "EQUAL", "ruleValue": 0.6265746261275031}, {"ruleAttribute": "9W5nwgua", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3525035946577679}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ZFKIIkDE", "ruleCriteria": "MINIMUM", "ruleValue": 0.8547479837574921}, {"ruleAttribute": "786LXeeY", "ruleCriteria": "MINIMUM", "ruleValue": 0.655851004317673}, {"ruleAttribute": "rNbgmNI8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.17037486996439322}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "zLAXO1IN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.0915705653113591}, {"ruleAttribute": "G7II6eph", "ruleCriteria": "EQUAL", "ruleValue": 0.2848698918708841}, {"ruleAttribute": "DzZL8vKS", "ruleCriteria": "EQUAL", "ruleValue": 0.8124502883210837}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["AuvVp4pq", "5ckLCPvA", "ceBvkqoA"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'UOWNzsfH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Pe2qbHdk", "groupIcon": "EiwwHgHr", "groupName": "FWSjnKo2", "groupRegion": "UgkN7fae", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'wnoLEjvq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'hARrKaQx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "PGXHPE6a", "groupIcon": "ZOjx5fJr", "groupName": "u8MVwc70", "groupRegion": "CYkIb4OE", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId '6CkY5p3W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"st0UOFuU": {}, "bMbH3S1a": {}, "ywI0MKM1": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'mLHNzcDS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '0d8gHsX0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'iv41aZ4w' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'QSeUGWgG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'TdLX1St3' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'RWqiJ3vN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'pVuM19yj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"ggLeJEHJ": {}, "iwCM5LRF": {}, "zXzRrjAj": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'HbiLCkjr' \
    --groupId 'ijQHMhHR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "jBgOrjtv", "ruleCriteria": "EQUAL", "ruleValue": 0.2180974613467651}, {"ruleAttribute": "qvLFBWiE", "ruleCriteria": "EQUAL", "ruleValue": 0.9394601194425896}, {"ruleAttribute": "L4spgIJO", "ruleCriteria": "EQUAL", "ruleValue": 0.7497940062241212}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '3Y2m8yTt' \
    --groupId '7o4FHA5X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'PXjjlI9W' \
    --memberRoleId '4YlFkhzh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "bMz0XYbW"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'qpyWSJPN' \
    --memberRoleId 'plFGr41n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "hJuxEPuF"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '195lDaoU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dz0lUS9G' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'ntmRLzY9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kvz9GZQS' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'u9GemsSh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dRmL766N' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'MRhcmVbK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NUeWA7KW' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId '5yjBE3h0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mhXLEBZp' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 's6oyHbSm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tHvW87FP' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
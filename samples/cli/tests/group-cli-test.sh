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
    --limit '69' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "JcQchxU6", "description": "EfnRQeaj", "globalRules": [{"allowedAction": "BbauQkew", "ruleDetail": [{"ruleAttribute": "FuxrQMg3", "ruleCriteria": "MINIMUM", "ruleValue": 0.8637168316056547}, {"ruleAttribute": "hT57vhqM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7787918815822436}, {"ruleAttribute": "atfonqzW", "ruleCriteria": "EQUAL", "ruleValue": 0.6838259774990654}]}, {"allowedAction": "HofTEXTj", "ruleDetail": [{"ruleAttribute": "3BdMQaI0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1781166814581534}, {"ruleAttribute": "03fSejJY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2079855455539371}, {"ruleAttribute": "lkY7Wm9I", "ruleCriteria": "EQUAL", "ruleValue": 0.37853144571298236}]}, {"allowedAction": "XLlhTH0W", "ruleDetail": [{"ruleAttribute": "mjA4bvIi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5289441358749182}, {"ruleAttribute": "pOgmT45g", "ruleCriteria": "MINIMUM", "ruleValue": 0.4909456750681567}, {"ruleAttribute": "oLHQjA3h", "ruleCriteria": "EQUAL", "ruleValue": 0.4408874984909673}]}], "groupAdminRoleId": "UCrync2F", "groupMaxMember": 57, "groupMemberRoleId": "OSBhNyTO", "name": "c8gcCIkq"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'slOcSnlX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'HV4dvYMN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'gV0ZXyZC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "4BpfNYOJ", "groupMaxMember": 60, "name": "0R8ALKIO"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 's6KX7M1k' \
    --configurationCode 'UJgA8Eds' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "PU5QsiEF", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8543391441751599}, {"ruleAttribute": "d7oqQT8Y", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8284229949285937}, {"ruleAttribute": "qldy8tAN", "ruleCriteria": "EQUAL", "ruleValue": 0.4730901285791159}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'js6TBx8E' \
    --configurationCode 'jIuWH5W0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'jA5pEU9l' \
    --groupName 'P2Sc15Iq' \
    --groupRegion 'br4Ca1tQ' \
    --limit '86' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'KRvE3ku3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'YRBzzc6D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'p138iYZr' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '63' \
    --order 'OKuenRnB' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "HDrdpIgJ", "memberRolePermissions": [{"action": 77, "resourceName": "qnwwQsvv"}, {"action": 45, "resourceName": "b18DNz3f"}, {"action": 2, "resourceName": "bZ7aROcj"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'HZC5mOG8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'i6wrEwMV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'EDSKwy4M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "U8h3GOMT"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'GxfdEGpH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 40, "resourceName": "SWU0h8B6"}, {"action": 30, "resourceName": "WVdhzfVP"}, {"action": 91, "resourceName": "HhCeeP8P"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '2UTGHDYG' \
    --groupRegion 'xK9zpxis' \
    --limit '56' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "qqCJbBfU", "customAttributes": {"Uklb0co4": {}, "MSbEa4CJ": {}, "qvgPZU5U": {}}, "groupDescription": "dbPADPgg", "groupIcon": "BlobhQOU", "groupMaxMember": 81, "groupName": "nSca7CqU", "groupRegion": "lE6jDqt5", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "cga2FQJ5", "ruleDetail": [{"ruleAttribute": "04TthnYG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9885855037791478}, {"ruleAttribute": "jSo6JtK4", "ruleCriteria": "MINIMUM", "ruleValue": 0.1407167096315748}, {"ruleAttribute": "nsWkk0Gp", "ruleCriteria": "MINIMUM", "ruleValue": 0.12946469542574535}]}, {"allowedAction": "TEMweNqP", "ruleDetail": [{"ruleAttribute": "wXsGqx2B", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06105739620319628}, {"ruleAttribute": "4m8epFdD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1226906864645283}, {"ruleAttribute": "AJJcujrm", "ruleCriteria": "MINIMUM", "ruleValue": 0.9233619024229165}]}, {"allowedAction": "QpZl3y8U", "ruleDetail": [{"ruleAttribute": "NgOCjzMy", "ruleCriteria": "EQUAL", "ruleValue": 0.3216983711034689}, {"ruleAttribute": "pnn2wU5P", "ruleCriteria": "EQUAL", "ruleValue": 0.9577291027158167}, {"ruleAttribute": "BZK5CRA0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6414822075584391}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'sMGHMD8N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'ufim4D67' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "9FWWlWHf", "groupIcon": "7NlS0aQF", "groupName": "mcIbTGK9", "groupRegion": "RwvzwQQG", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'LtEaAxkr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '6rcH1F9T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "PNb9TB5a", "groupIcon": "pz8EXNwR", "groupName": "csSTfEzE", "groupRegion": "eYWbxZYO", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '8BoGQaIG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"chcpVznO": {}, "6IJoIYae": {}, "UVdUYh9z": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'JB7uJDCO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '2MSzHXeL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'mbDcIjHL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '8VQOPbnb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'qMnoCYbl' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'ohXKlenK' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '68' \
    --order 'fixPB1Za' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'bwV8lrJN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"FF0lQ8Hj": {}, "Pvn2MdHb": {}, "V1t1wvjZ": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'utGwD6gA' \
    --groupId '2ZOmcQqY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "smnLJh5T", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5189808372549074}, {"ruleAttribute": "IozswSXe", "ruleCriteria": "MINIMUM", "ruleValue": 0.6428710833825476}, {"ruleAttribute": "PPDjX1Np", "ruleCriteria": "EQUAL", "ruleValue": 0.0178589767367322}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '9xhmrpJJ' \
    --groupId 'u8JLG82j' \
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
    --offset '50' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '8l9uIkjY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "v9GRLsZu"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'VL7tSSRp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "kr4CFwPV"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lkEfvuhm' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ah08Gee2' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v3teO2i6' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lzeP1516' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6VzPOBLL' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["YL2G35Cw", "MVC8wD4k", "7q1GRv4M"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUkSfjlI' \
    --limit '67' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'LqZPFatC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S5QuQplT' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "L0mEOt1v", "customAttributes": {"yL4yGLe6": {}, "agSlhlXf": {}, "eedGlWsm": {}}, "groupDescription": "YIctgxI0", "groupIcon": "35Cgccqg", "groupMaxMember": 88, "groupName": "8wCWWJJ1", "groupRegion": "ZZkSRC63", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "iSZwd83N", "ruleDetail": [{"ruleAttribute": "fvv3TWc6", "ruleCriteria": "EQUAL", "ruleValue": 0.7291162730000386}, {"ruleAttribute": "pSFCfvlO", "ruleCriteria": "MINIMUM", "ruleValue": 0.953503409917054}, {"ruleAttribute": "ZRKAZE89", "ruleCriteria": "MAXIMUM", "ruleValue": 0.815843916210888}]}, {"allowedAction": "nCJEpJIq", "ruleDetail": [{"ruleAttribute": "18T7xpX5", "ruleCriteria": "MINIMUM", "ruleValue": 0.5718058872561389}, {"ruleAttribute": "Ceg0uIdE", "ruleCriteria": "MAXIMUM", "ruleValue": 0.21332968622492654}, {"ruleAttribute": "I370D7yf", "ruleCriteria": "MINIMUM", "ruleValue": 0.4183959130168844}]}, {"allowedAction": "FkGcluNx", "ruleDetail": [{"ruleAttribute": "fhB7uPfv", "ruleCriteria": "MINIMUM", "ruleValue": 0.6894042472821619}, {"ruleAttribute": "JD0qrAgO", "ruleCriteria": "EQUAL", "ruleValue": 0.6223217497138057}, {"ruleAttribute": "XDutZ0Ld", "ruleCriteria": "MINIMUM", "ruleValue": 0.7071547326942872}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["540EH8C5", "0brdgZNG", "prIIOkKd"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'R9Ft0pgq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "m2GHwsUx", "groupIcon": "wBfHGrW1", "groupName": "l8NYTzVf", "groupRegion": "3c8XUqn2", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'XqMlDX8y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'NKc3FVMC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "eLR3ySKY", "groupIcon": "0vNB8QUv", "groupName": "UMkGCqsP", "groupRegion": "J8XLFqO5", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'hDWNkEWc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"UYne9bpy": {}, "Urfm95SF": {}, "ksN6Jc0x": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'PgLwFcNm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'pr1uQeAG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'FtO8vFSl' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'JQzu0rcT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'bMwFWrsY' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'ut8JCu5V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'ZTJI10By' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"Mls8zJ7c": {}, "GJhsn9Mz": {}, "k8NwXDKD": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'owDEoi5G' \
    --groupId '8JIPSRSR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Ju9IyP8r", "ruleCriteria": "EQUAL", "ruleValue": 0.03538386752972078}, {"ruleAttribute": "8Tdl3dzT", "ruleCriteria": "EQUAL", "ruleValue": 0.6254238737334156}, {"ruleAttribute": "TM9O8i1H", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3682826114958142}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '8xi9mfQv' \
    --groupId 'iMu2Yqw2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'hWqJb5oS' \
    --memberRoleId 'ZYXyvTEo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "75CwNqD6"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'Vxv8Nsrp' \
    --memberRoleId 'vvAPZSDi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "iyxL6Jvn"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'FwogzEGm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBdtmAQd' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'eJ81tVtS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdY6SDLT' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'PFuJ4Cvq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YDkGsyzR' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'uknLbuaj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'foXJVfze' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'FnsbzKmf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'se7CROaG' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'BkmMgEBp' \
    --namespace "$AB_NAMESPACE" \
    --userId '0uqWHAJJ' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
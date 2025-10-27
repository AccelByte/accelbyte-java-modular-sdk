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
    --limit '74' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "VbwjFM47", "description": "IvWKUMdH", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "IXCK9NYG", "ruleCriteria": "MINIMUM", "ruleValue": 0.5522695202399919}, {"ruleAttribute": "ZZoYQIdM", "ruleCriteria": "EQUAL", "ruleValue": 0.01606042180942202}, {"ruleAttribute": "5n0eAwoI", "ruleCriteria": "MINIMUM", "ruleValue": 0.7498241121206902}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "PtXXTe0d", "ruleCriteria": "MAXIMUM", "ruleValue": 0.05138231149863137}, {"ruleAttribute": "tR3bkbc4", "ruleCriteria": "MAXIMUM", "ruleValue": 0.12061575031203398}, {"ruleAttribute": "UakFI4mT", "ruleCriteria": "MINIMUM", "ruleValue": 0.08950666037033272}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "jXZRcE4l", "ruleCriteria": "EQUAL", "ruleValue": 0.05358772421446589}, {"ruleAttribute": "BAfRhlsB", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9104725071387488}, {"ruleAttribute": "gfmJR0or", "ruleCriteria": "EQUAL", "ruleValue": 0.3600747033053192}]}], "groupAdminRoleId": "a3xsqUnu", "groupMaxMember": 44, "groupMemberRoleId": "MmwlEfDg", "name": "uRvlSosb"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'r58fxqUu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '6YoeeaZo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'PxziibXA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "huAptk5l", "groupMaxMember": 81, "name": "jFrBIemW"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'vlHLtdt4' \
    --configurationCode 'uLqPTLlc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "23hHaJs0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7287522577467087}, {"ruleAttribute": "KI5ZRZ5G", "ruleCriteria": "MAXIMUM", "ruleValue": 0.638177809993718}, {"ruleAttribute": "c4jPpCm6", "ruleCriteria": "EQUAL", "ruleValue": 0.5368402223480655}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'hiSSaDo6' \
    --configurationCode 'GwjzQ5Vk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'wwFEregO' \
    --groupName '5XYp2Y5X' \
    --groupRegion '2H7rmGj5' \
    --limit '66' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'HK5Eb7ea' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'zzoMMJEV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'cbVVApZO' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '22' \
    --order 'FTCdghvD' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "mESKHH6x", "memberRolePermissions": [{"action": 99, "resourceName": "qlLNgSNx"}, {"action": 34, "resourceName": "zPRZ20Wc"}, {"action": 43, "resourceName": "fjZluhtg"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'sTp6g3iP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'xkSW48S7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '4Q8WhWoD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "E7dvkuqR"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'RCjKTxJe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 51, "resourceName": "a4vYU2Vx"}, {"action": 83, "resourceName": "XPJM0cOh"}, {"action": 90, "resourceName": "EIhsUm3B"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'zRT6WGzg' \
    --groupRegion 'fQZ4IBPe' \
    --limit '38' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "sBLq7Zt5", "customAttributes": {"zXrUpFmv": {}, "q0RNuvp9": {}, "qsnx7erD": {}}, "groupDescription": "qq4cJOYF", "groupIcon": "oFZk78X5", "groupMaxMember": 16, "groupName": "Gg2S2gYa", "groupRegion": "90d05Ljh", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ktID3MNJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.27630352840251515}, {"ruleAttribute": "Cjfrz36m", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4765590893390145}, {"ruleAttribute": "EsVHrGVa", "ruleCriteria": "MINIMUM", "ruleValue": 0.5871892490945659}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "1hCyLu5x", "ruleCriteria": "EQUAL", "ruleValue": 0.058165721556879824}, {"ruleAttribute": "enjJYCyj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3883707964009374}, {"ruleAttribute": "xWUuD7EA", "ruleCriteria": "EQUAL", "ruleValue": 0.9022925556730493}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "5jvDjfnZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.4657856400952156}, {"ruleAttribute": "2gaor6C7", "ruleCriteria": "EQUAL", "ruleValue": 0.7453345509762993}, {"ruleAttribute": "OTs0XDTj", "ruleCriteria": "MINIMUM", "ruleValue": 0.9946191017216425}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'g4gKSgCe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'UzrtPcYm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "hIjEoKLT", "groupIcon": "CFJTQse6", "groupName": "B6HmnIty", "groupRegion": "MZTKPzx1", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'B8eNGB8M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'oyt6FyIG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "37PZXjxS", "groupIcon": "6DMfV54v", "groupName": "PTv3SD37", "groupRegion": "5HuYsegp", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'oevdfy5r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Rup83x9r": {}, "wIbo2Jx0": {}, "gWweFO0Y": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'DxjQvi65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'Qx6FZknf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'bQSpRvhl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'TKkXDXGY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'xq6osO6G' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'RHS8AeTh' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '0' \
    --order 'WlrF1AA6' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'lbpEnrL7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"LEHRLFps": {}, "BX0GXTH0": {}, "3h1Lr1KT": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'zrrodXNe' \
    --groupId 'Frup9XFl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "R8Vt3sWk", "ruleCriteria": "EQUAL", "ruleValue": 0.8253975517478093}, {"ruleAttribute": "kYyvsuPn", "ruleCriteria": "MINIMUM", "ruleValue": 0.23645438043262523}, {"ruleAttribute": "lHJ7ZROc", "ruleCriteria": "EQUAL", "ruleValue": 0.024283024183754942}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '2havN3Ps' \
    --groupId 'xAaXgFL5' \
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
    --limit '29' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'aoaXvGT4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "MCtRUG2Z"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'E8L5C6xx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "22Jo7Yif"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ru1HkiXq' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qKjLswuu' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LHDRz2qA' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYz9Lh0F' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UNNFplnF' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["S3AIciyn", "Oz4lkfvo", "GOGXqtk0"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4lPkZ7XE' \
    --limit '50' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'Brbc2Yxw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ujs6ZiEd' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "oMD2QbSq", "customAttributes": {"CIpLU1bz": {}, "YYroUuVT": {}, "ofYVPKoV": {}}, "groupDescription": "3ZOzbvSb", "groupIcon": "uyldYwGZ", "groupMaxMember": 40, "groupName": "6GWiUopG", "groupRegion": "t4eaE5qS", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "vofk6Ub8", "ruleCriteria": "EQUAL", "ruleValue": 0.8220186441357393}, {"ruleAttribute": "mlPlSZq3", "ruleCriteria": "EQUAL", "ruleValue": 0.6675001634821667}, {"ruleAttribute": "DEaMLlhG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5211068989434827}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "Xypy7NqS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2249643422368116}, {"ruleAttribute": "tLNs4MFn", "ruleCriteria": "MINIMUM", "ruleValue": 0.2775339868999386}, {"ruleAttribute": "1gaJXc5I", "ruleCriteria": "EQUAL", "ruleValue": 0.12671649467516544}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "wCaLDS68", "ruleCriteria": "MINIMUM", "ruleValue": 0.11469936092507604}, {"ruleAttribute": "eJN2NW5H", "ruleCriteria": "MINIMUM", "ruleValue": 0.42561505229478547}, {"ruleAttribute": "DfBbzoUr", "ruleCriteria": "EQUAL", "ruleValue": 0.06152549759490378}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["DOQ0AOb0", "mOZ31xSi", "r5YGwyEy"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'CNkFtLRR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "L2jnusGQ", "groupIcon": "Ph8HYNHT", "groupName": "OLejCE7M", "groupRegion": "aHj5aN82", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'hnStvNUk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'r4YNKHkB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "mJAw2QTa", "groupIcon": "ujP7Vowu", "groupName": "U3ClP95P", "groupRegion": "XjBrdOn1", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'oB2lXgpa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"rKLwu7YR": {}, "kOEIhF8O": {}, "J9dhyjyN": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'diGQ5Yx7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '4RGyoMW7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'kbaybZZj' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'q3uECdiA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '4bvmDkur' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'dtiXS5i8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'tujSGO7V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"jduB326Y": {}, "crxsQDoI": {}, "ydvNFE5X": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'vOjzUnnN' \
    --groupId 'BGpngpxj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "R5Bscy7e", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6544663964261195}, {"ruleAttribute": "5LNpxED9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03507019306210002}, {"ruleAttribute": "ai3L4zuw", "ruleCriteria": "EQUAL", "ruleValue": 0.8455531480196471}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'Kb9SsqvX' \
    --groupId 'Sprvx2Hw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '9J5GWSvp' \
    --memberRoleId 'NrHqTeGI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "vEJh2b85"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '8z6Ka7iG' \
    --memberRoleId 'nLojzkcY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "tpUgQUYW"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'OT2MJsRS' \
    --namespace "$AB_NAMESPACE" \
    --userId '3nWrerRP' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'Kt5i828Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rIMIzzfZ' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId '2ZxEoChI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjQTk82W' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId '9H9khIcw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BctTalCe' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'e0YdHuGP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDNydDmQ' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'bHXcLhZp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LK6cYKUe' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
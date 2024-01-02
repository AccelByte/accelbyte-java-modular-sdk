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
    --limit '87' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "RSLGbumi", "description": "MSBSOeEj", "globalRules": [{"allowedAction": "MUDPsxdV", "ruleDetail": [{"ruleAttribute": "CfbdfmgH", "ruleCriteria": "MINIMUM", "ruleValue": 0.6598656891491507}, {"ruleAttribute": "gBob9Gv4", "ruleCriteria": "MINIMUM", "ruleValue": 0.3454312273311534}, {"ruleAttribute": "BMZr6oSr", "ruleCriteria": "MINIMUM", "ruleValue": 0.1765355954118174}]}, {"allowedAction": "kVj8woo3", "ruleDetail": [{"ruleAttribute": "LVtXCZqw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6499097730995489}, {"ruleAttribute": "MKlhuTBK", "ruleCriteria": "EQUAL", "ruleValue": 0.40511530085352554}, {"ruleAttribute": "CVt5fLXB", "ruleCriteria": "EQUAL", "ruleValue": 0.6448017656646845}]}, {"allowedAction": "KtMXJ3si", "ruleDetail": [{"ruleAttribute": "E8IHT2nY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.998009559312676}, {"ruleAttribute": "X6mEI0Ak", "ruleCriteria": "EQUAL", "ruleValue": 0.570325526124667}, {"ruleAttribute": "TJ5lzKG0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03488360247826561}]}], "groupAdminRoleId": "arWPmdui", "groupMaxMember": 79, "groupMemberRoleId": "fdiXWyVk", "name": "pAB1Xyyr"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '9doNoRb0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'cv0LBjOg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'jA36fD7O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "YnfPFtEu", "groupMaxMember": 40, "name": "ngFCL4n8"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'QSf83exm' \
    --configurationCode 'CRS71IUU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "7al0d5vi", "ruleCriteria": "EQUAL", "ruleValue": 0.6145460778515339}, {"ruleAttribute": "fzTdPWOy", "ruleCriteria": "MINIMUM", "ruleValue": 0.9373032221537911}, {"ruleAttribute": "n3PWKRV3", "ruleCriteria": "MINIMUM", "ruleValue": 0.7472456312539367}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '2GWONwDl' \
    --configurationCode 'B60xxiDO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'wvh6fLvA' \
    --groupName 'k7GOAWW1' \
    --groupRegion 'S2zm3Vkf' \
    --limit '55' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'AMyfciw0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'P52PuPsu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'BV378Aw2' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '89' \
    --order 'PD7tDUEB' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "jsL33kQv", "memberRolePermissions": [{"action": 77, "resourceName": "aMjcgPAv"}, {"action": 21, "resourceName": "wWekUmDt"}, {"action": 77, "resourceName": "ut57cWul"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '8BGFxJLx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'mlA4hS5g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'xsp6gIUR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "o6er3RyJ"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jveUL94t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 23, "resourceName": "D9U8fnvn"}, {"action": 77, "resourceName": "9Epb3axI"}, {"action": 40, "resourceName": "WhpYk9pa"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'WHvaXSW4' \
    --groupRegion 'M4WT4iHL' \
    --limit '33' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "xCVpqxCp", "customAttributes": {"uTkm4vBl": {}, "X3oSYNe8": {}, "UrSQNB56": {}}, "groupDescription": "yNFJpcBy", "groupIcon": "60HwOJfh", "groupMaxMember": 34, "groupName": "VAYiRgW4", "groupRegion": "RnEMTZj1", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "ZUoxoAJZ", "ruleDetail": [{"ruleAttribute": "YeGfTl9c", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11606849946841147}, {"ruleAttribute": "XtpU0hEF", "ruleCriteria": "MINIMUM", "ruleValue": 0.5320775335574648}, {"ruleAttribute": "lrmesGa3", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7759166022748439}]}, {"allowedAction": "GQY0Hr7L", "ruleDetail": [{"ruleAttribute": "zvEjSQ6w", "ruleCriteria": "MINIMUM", "ruleValue": 0.9567381712188158}, {"ruleAttribute": "1xRycRVn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.35774366257694434}, {"ruleAttribute": "EpqW1F1M", "ruleCriteria": "MINIMUM", "ruleValue": 0.1838815841290954}]}, {"allowedAction": "mORB3vQN", "ruleDetail": [{"ruleAttribute": "PBEIdE5q", "ruleCriteria": "MAXIMUM", "ruleValue": 0.43650923914022766}, {"ruleAttribute": "J8g4Z7j3", "ruleCriteria": "MINIMUM", "ruleValue": 0.3433749425289201}, {"ruleAttribute": "Fa4VjhVw", "ruleCriteria": "MINIMUM", "ruleValue": 0.07086728297942912}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'v2zUfAuI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'Podi28Tw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ya6jfUkJ", "groupIcon": "mn45GItf", "groupName": "KIGPYE6z", "groupRegion": "M7EXyU1i", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'tmlx38Ww' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'RMQrK74k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "opZMSeEA", "groupIcon": "Aqx6mwl6", "groupName": "bOW6OAI6", "groupRegion": "XL4Cd9hG", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'yVwP02nx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"hAuJbehj": {}, "hIbLcRB4": {}, "T6HW7V5I": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'tpymYZof' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'qpwmHXQY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'UTO5Eo5V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '4ykRIxLM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'rSaEiAza' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '0jSLgYCj' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '36' \
    --order 'Mr0hpNbi' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '7mu8A33y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"fGDnD9H2": {}, "0EjnXCQP": {}, "T1H8kke3": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '8DePgYd3' \
    --groupId 'rUe7NGf8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "GlBCz3xu", "ruleCriteria": "MAXIMUM", "ruleValue": 0.016786663579875016}, {"ruleAttribute": "6vXAuTNv", "ruleCriteria": "EQUAL", "ruleValue": 0.4338182455184928}, {"ruleAttribute": "HNGhDU5K", "ruleCriteria": "MINIMUM", "ruleValue": 0.5411833286748805}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'F2zM4FZr' \
    --groupId 'cwWpk2SX' \
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
    --limit '21' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '3GCV3PS4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "AwYWyCKV"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'sYVlL0OD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "L1jMCzdW"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nL3aGrqN' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EbkPZl5C' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2PW4KgFX' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'no0YnuWo' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lyAQ6U2c' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["vLCvqXXY", "G03uxuqi", "16zDMbxz"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6UhwaVL' \
    --limit '81' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'wtiYbl2s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BnLSgk4u' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "iCuZ27h2", "customAttributes": {"d5OvL3eQ": {}, "cbqVHdCW": {}, "k0n8GnvL": {}}, "groupDescription": "FYRUmcSg", "groupIcon": "EjMPnRcE", "groupMaxMember": 43, "groupName": "cd83cupM", "groupRegion": "Sn5j1mnW", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "iQHTn0l0", "ruleDetail": [{"ruleAttribute": "Kcnud23T", "ruleCriteria": "MINIMUM", "ruleValue": 0.7451923316129542}, {"ruleAttribute": "Ib2H5fp2", "ruleCriteria": "EQUAL", "ruleValue": 0.25050753310287366}, {"ruleAttribute": "TLJoFROL", "ruleCriteria": "EQUAL", "ruleValue": 0.6061597033615658}]}, {"allowedAction": "dc8Fufre", "ruleDetail": [{"ruleAttribute": "B5SgE9bO", "ruleCriteria": "MINIMUM", "ruleValue": 0.6182097878246616}, {"ruleAttribute": "fmdeuz1b", "ruleCriteria": "MAXIMUM", "ruleValue": 0.41014499923675807}, {"ruleAttribute": "1eYUSkKw", "ruleCriteria": "MINIMUM", "ruleValue": 0.7266699560244163}]}, {"allowedAction": "rfXVCRWj", "ruleDetail": [{"ruleAttribute": "BuLG4eot", "ruleCriteria": "EQUAL", "ruleValue": 0.7925835588156777}, {"ruleAttribute": "t1jSZJUg", "ruleCriteria": "EQUAL", "ruleValue": 0.31172568238623255}, {"ruleAttribute": "OG8uEuwO", "ruleCriteria": "MINIMUM", "ruleValue": 0.5531604173179373}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["qeQ7H4I8", "xNzCB622", "nKdIPgYH"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId '0hulutWt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "bP7p3LyD", "groupIcon": "l99AmnDV", "groupName": "TOiWMD41", "groupRegion": "LTPl1R68", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'c1JIZvvq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'zD69NXZc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "1rfgRyhl", "groupIcon": "DUjfYgiJ", "groupName": "o1iy0muk", "groupRegion": "1RkSWfr3", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'KwZ8xRPJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"mkjscnbU": {}, "NTPOWhcU": {}, "GtDRQDnQ": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId '6bkti3XA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'cRYM1pjg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId '97LkffJB' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'VtEJtCjM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'C76PNGNR' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'gfRqR2hR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'ZNTI8wxR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"X6WgfvFE": {}, "H3ovHkB4": {}, "FEaIN3AL": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction '1dZHQinA' \
    --groupId 'BJoa3Op0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "iMCgGirT", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7895564391270451}, {"ruleAttribute": "7xvefbfK", "ruleCriteria": "EQUAL", "ruleValue": 0.8962931044114557}, {"ruleAttribute": "edtgC0ts", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7567357163851675}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'tWSe4cpY' \
    --groupId '77gM6ZJS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'KEFAUEGg' \
    --memberRoleId 'GfJOgT0L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "8vUJ3h1E"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'j6jqGdwv' \
    --memberRoleId 'MArsWU3P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "MKBLCdcQ"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'GvqNVEnk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rtABWYcj' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'qwcg4OI1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mEZLRWJP' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'HeLihnJk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQMPuoJg' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'L53ygPoE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WWTRbzt3' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'Tz7kMtAS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHTZ8xDX' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'HtE68fmk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YwsfmhE4' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
echo "1..82"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 IndexHandler
./ng net.accelbyte.sdk.cli.Main group indexHandler \
    > test.out 2>&1
eval_tap $? 2 'IndexHandler' test.out

#- 3 BlockHandler
./ng net.accelbyte.sdk.cli.Main group blockHandler \
    > test.out 2>&1
eval_tap $? 3 'BlockHandler' test.out

#- 4 CmdlineHandler
./ng net.accelbyte.sdk.cli.Main group cmdlineHandler \
    > test.out 2>&1
eval_tap $? 4 'CmdlineHandler' test.out

#- 5 GoroutineHandler
./ng net.accelbyte.sdk.cli.Main group goroutineHandler \
    > test.out 2>&1
eval_tap $? 5 'GoroutineHandler' test.out

#- 6 HeapHandler
./ng net.accelbyte.sdk.cli.Main group heapHandler \
    > test.out 2>&1
eval_tap $? 6 'HeapHandler' test.out

#- 7 Profile
./ng net.accelbyte.sdk.cli.Main group profile \
    > test.out 2>&1
eval_tap $? 7 'Profile' test.out

#- 8 SymbolHandler
./ng net.accelbyte.sdk.cli.Main group symbolHandler \
    > test.out 2>&1
eval_tap $? 8 'SymbolHandler' test.out

#- 9 ThreadcreateHandler
./ng net.accelbyte.sdk.cli.Main group threadcreateHandler \
    > test.out 2>&1
eval_tap $? 9 'ThreadcreateHandler' test.out

#- 10 ListGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 10 'ListGroupConfigurationAdminV1' test.out

#- 11 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "FmTgrLdV", "description": "b7jeGbGq", "globalRules": [{"allowedAction": "uMaZtneM", "ruleDetail": [{"ruleAttribute": "8WawMXAX", "ruleCriteria": "MINIMUM", "ruleValue": 0.7154852845706859}, {"ruleAttribute": "dbjHZFGv", "ruleCriteria": "MINIMUM", "ruleValue": 0.8633938378011723}, {"ruleAttribute": "A31Ee219", "ruleCriteria": "MINIMUM", "ruleValue": 0.4611422071314951}]}, {"allowedAction": "HDbFkMhF", "ruleDetail": [{"ruleAttribute": "FPxZCCEw", "ruleCriteria": "MINIMUM", "ruleValue": 0.93069582556426}, {"ruleAttribute": "dWF4iDkG", "ruleCriteria": "EQUAL", "ruleValue": 0.7456793900355585}, {"ruleAttribute": "jnC5bJ9t", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2567301146581846}]}, {"allowedAction": "lcVNyEwe", "ruleDetail": [{"ruleAttribute": "t4i1W6HD", "ruleCriteria": "EQUAL", "ruleValue": 0.6964047576471878}, {"ruleAttribute": "eeL5970n", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8809183834851443}, {"ruleAttribute": "ynCLMeRs", "ruleCriteria": "MINIMUM", "ruleValue": 0.8411000219205146}]}], "groupAdminRoleId": "w4UbIdIY", "groupMaxMember": 92, "groupMemberRoleId": "KD3HnMYl", "name": "N9j5968z"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateGroupConfigurationAdminV1' test.out

#- 12 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'InitiateGroupConfigurationAdminV1' test.out

#- 13 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '0TgzaMTn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetGroupConfigurationAdminV1' test.out

#- 14 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'Kcur9rBZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteGroupConfigurationV1' test.out

#- 15 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '14rNBlqx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Mem4fuJ8", "groupMaxMember": 90, "name": "rTptFNII"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateGroupConfigurationAdminV1' test.out

#- 16 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'QpDYAb71' \
    --configurationCode 'mZEgiwlX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "O9V7RhSh", "ruleCriteria": "EQUAL", "ruleValue": 0.42229376194757084}, {"ruleAttribute": "rJAgEf9k", "ruleCriteria": "MINIMUM", "ruleValue": 0.8431619636600622}, {"ruleAttribute": "HDH2HhKv", "ruleCriteria": "MINIMUM", "ruleValue": 0.11180290221774014}]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 17 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'qDVCzSFl' \
    --configurationCode 'GG6cjREc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 18 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'E4BsETkT' \
    --groupName 'P1TpJ1a7' \
    --groupRegion 'RXIn6VNh' \
    --limit '21' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 18 'GetGroupListAdminV1' test.out

#- 19 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'OWQADQcw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetSingleGroupAdminV1' test.out

#- 20 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'DhuvH56L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteGroupAdminV1' test.out

#- 21 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '5RiPV5gM' \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '98' \
    --order 'kNj1nG0F' \
    > test.out 2>&1
eval_tap $? 21 'GetGroupMembersListAdminV1' test.out

#- 22 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 22 'GetMemberRolesListAdminV1' test.out

#- 23 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "jqp25al2", "memberRolePermissions": [{"action": 91, "resourceName": "hNE2NPw2"}, {"action": 96, "resourceName": "LO3Q3Onx"}, {"action": 32, "resourceName": "wEIaNF09"}]}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMemberRoleAdminV1' test.out

#- 24 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'lolEmfhT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetSingleMemberRoleAdminV1' test.out

#- 25 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'olYKq0ol' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteMemberRoleAdminV1' test.out

#- 26 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'h3U4fbqE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "7UsGMobd"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateMemberRoleAdminV1' test.out

#- 27 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'a5X8u99M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 15, "resourceName": "huKEuePJ"}, {"action": 84, "resourceName": "Fga09ENK"}, {"action": 59, "resourceName": "wVjY9zJH"}]}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateMemberRolePermissionAdminV1' test.out

#- 28 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'lFMSmlQ2' \
    --groupRegion 'xQEKu6zs' \
    --limit '54' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 28 'GetGroupListPublicV1' test.out

#- 29 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "mCPQa4sn", "customAttributes": {"tI0Zq2jf": {}, "fzh4RTNP": {}, "7xtie0ap": {}}, "groupDescription": "pOSCswVL", "groupIcon": "acf7bvW2", "groupMaxMember": 54, "groupName": "uFNxCpMa", "groupRegion": "j2nmCkIA", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "lT3zZrnE", "ruleDetail": [{"ruleAttribute": "VEM5rzdn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.18285420543749198}, {"ruleAttribute": "tgmB8W1w", "ruleCriteria": "MAXIMUM", "ruleValue": 0.21719692881014374}, {"ruleAttribute": "JuVueoGW", "ruleCriteria": "EQUAL", "ruleValue": 0.6624978436788742}]}, {"allowedAction": "3IiGokEc", "ruleDetail": [{"ruleAttribute": "svPt5nkF", "ruleCriteria": "MINIMUM", "ruleValue": 0.6900420144232058}, {"ruleAttribute": "fqrq7ufx", "ruleCriteria": "EQUAL", "ruleValue": 0.9171023630795359}, {"ruleAttribute": "VUkWBtZm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.589089152873933}]}, {"allowedAction": "NL2hvy1a", "ruleDetail": [{"ruleAttribute": "ck3o3EcN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.42760486630740635}, {"ruleAttribute": "6wflESxG", "ruleCriteria": "EQUAL", "ruleValue": 0.7475832145759925}, {"ruleAttribute": "rjq2bzni", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1915756070167527}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateNewGroupPublicV1' test.out

#- 30 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'QnXsXOzy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetSingleGroupPublicV1' test.out

#- 31 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'PVASzhbY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "AOFhXiGc", "groupIcon": "adMCddbr", "groupName": "tXxokBjs", "groupRegion": "3v8R4flo", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateSingleGroupV1' test.out

#- 32 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'n1zx4LzO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteGroupPublicV1' test.out

#- 33 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'THLClcyX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "vCnbFh8Q", "groupIcon": "Hn0zFrfr", "groupName": "uRJqEsG5", "groupRegion": "A0nGJGNX", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdatePatchSingleGroupPublicV1' test.out

#- 34 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'E23FrI6Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"AnEQLCRt": {}, "HXlHy0rz": {}, "m3vFph1F": {}}}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupCustomAttributesPublicV1' test.out

#- 35 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'susIPXLF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AcceptGroupInvitationPublicV1' test.out

#- 36 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'fFfXuDVw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RejectGroupInvitationPublicV1' test.out

#- 37 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'Z6g0jY9S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'JoinGroupV1' test.out

#- 38 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'ZzJPejEH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'CancelGroupJoinRequestV1' test.out

#- 39 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'g4pX0F0v' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 39 'GetGroupJoinRequestPublicV1' test.out

#- 40 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'ozzzZV1S' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '79' \
    --order '4CifwwcL' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupMembersListPublicV1' test.out

#- 41 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'QNITjuSw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"tesSIZ3l": {}, "yRzo1NRM": {}, "DXpjUQ2y": {}}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateGroupCustomRulePublicV1' test.out

#- 42 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '8sQ0fsak' \
    --groupId 'dICRJi16' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "UQNleq1d", "ruleCriteria": "MINIMUM", "ruleValue": 0.09433986892448276}, {"ruleAttribute": "nnrLM6Ns", "ruleCriteria": "MAXIMUM", "ruleValue": 0.20419473007926547}, {"ruleAttribute": "aXS9kQyd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.36238426496141396}]}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGroupPredefinedRulePublicV1' test.out

#- 43 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'nYv4fCd9' \
    --groupId '2oZzCddI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'DeleteGroupPredefinedRulePublicV1' test.out

#- 44 LeaveGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'LeaveGroupPublicV1' test.out

#- 45 GetMemberRolesListPublicV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 45 'GetMemberRolesListPublicV1' test.out

#- 46 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'zetIOOp4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ttybYSxT"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateMemberRolePublicV1' test.out

#- 47 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'jZuKfz0C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "cmmLgvS7"}' \
    > test.out 2>&1
eval_tap $? 47 'DeleteMemberRolePublicV1' test.out

#- 48 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 48 'GetGroupInvitationRequestPublicV1' test.out

#- 49 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WCTwRC0k' \
    > test.out 2>&1
eval_tap $? 49 'GetUserGroupInformationPublicV1' test.out

#- 50 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a808efn8' \
    > test.out 2>&1
eval_tap $? 50 'InviteGroupPublicV1' test.out

#- 51 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NzuVF8iV' \
    > test.out 2>&1
eval_tap $? 51 'AcceptGroupJoinRequestPublicV1' test.out

#- 52 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMGdUcRt' \
    > test.out 2>&1
eval_tap $? 52 'RejectGroupJoinRequestPublicV1' test.out

#- 53 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aWDfYh74' \
    > test.out 2>&1
eval_tap $? 53 'KickGroupMemberPublicV1' test.out

#- 54 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["OqsdRPBp", "RDKsivkM", "ZlEKsw2i"]}' \
    > test.out 2>&1
eval_tap $? 54 'GetListGroupByIDsAdminV2' test.out

#- 55 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '85w9GFFR' \
    --limit '75' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 55 'GetUserJoinedGroupInformationPublicV2' test.out

#- 56 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'LmEhmQFf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nzjfy3L2' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetUserGroupStatusInformationV2' test.out

#- 57 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "ijPtXVla", "customAttributes": {"QgeypIoZ": {}, "vTlmFmSr": {}, "LMvESpoQ": {}}, "groupDescription": "q3WyG3uJ", "groupIcon": "c7PHGny9", "groupMaxMember": 68, "groupName": "4hMzTwTx", "groupRegion": "NZ0lyEpc", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "B9Ziy93N", "ruleDetail": [{"ruleAttribute": "zvGRq9KW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2943049465870644}, {"ruleAttribute": "u9WHu6eR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3830227023128585}, {"ruleAttribute": "CBcQQvLW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.635251004292831}]}, {"allowedAction": "ntafTT1M", "ruleDetail": [{"ruleAttribute": "d1KqxKxq", "ruleCriteria": "MINIMUM", "ruleValue": 0.5628975526444485}, {"ruleAttribute": "8K4chDNn", "ruleCriteria": "EQUAL", "ruleValue": 0.6767361872973788}, {"ruleAttribute": "iFs4T1SZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.03306351530917284}]}, {"allowedAction": "2Tlk6ILI", "ruleDetail": [{"ruleAttribute": "XWnDQhNx", "ruleCriteria": "MINIMUM", "ruleValue": 0.30410346850473224}, {"ruleAttribute": "yls7BA1R", "ruleCriteria": "EQUAL", "ruleValue": 0.5702621144882091}, {"ruleAttribute": "XskFhMNQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.984423722396103}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 57 'CreateNewGroupPublicV2' test.out

#- 58 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["d2z7S0La", "dUmwOWXL", "G8xzCO1b"]}' \
    > test.out 2>&1
eval_tap $? 58 'GetListGroupByIDsV2' test.out

#- 59 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'L88Uc5W7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "95VMiRTQ", "groupIcon": "vkcd9rxC", "groupName": "HXP7qNdl", "groupRegion": "ShB0Eu3B", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePutSingleGroupPublicV2' test.out

#- 60 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'E3RygqGG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteGroupPublicV2' test.out

#- 61 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'q2gNhl5P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "DqS1QkI6", "groupIcon": "iyFlP2r3", "groupName": "PJNaUX8G", "groupRegion": "wL2NyVLx", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePatchSingleGroupPublicV2' test.out

#- 62 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'YsWbzEb5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"7LR9kF4E": {}, "LvKDdTD8": {}, "42QBwbmn": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupCustomAttributesPublicV2' test.out

#- 63 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'jpgCxBSZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AcceptGroupInvitationPublicV2' test.out

#- 64 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'NU9FrfZ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'RejectGroupInvitationPublicV2' test.out

#- 65 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'F5sDFQAF' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 65 'GetGroupInviteRequestPublicV2' test.out

#- 66 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'MVvvUEj5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'JoinGroupV2' test.out

#- 67 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'v1vehklf' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 67 'GetGroupJoinRequestPublicV2' test.out

#- 68 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'GZvpCSh4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'LeaveGroupPublicV2' test.out

#- 69 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'OaRWk0QV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"acKrfqMN": {}, "7c5x9PpD": {}, "jEMwjCVv": {}}}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateGroupCustomRulePublicV2' test.out

#- 70 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'tLAQxvNv' \
    --groupId 'Z20c5LWW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "0za39BRj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8880130462367747}, {"ruleAttribute": "BsujA2lq", "ruleCriteria": "EQUAL", "ruleValue": 0.9637765334309927}, {"ruleAttribute": "Vltdvhu1", "ruleCriteria": "EQUAL", "ruleValue": 0.7068999179282238}]}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateGroupPredefinedRulePublicV2' test.out

#- 71 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'bLCtznwq' \
    --groupId 'Bsp0HJfL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteGroupPredefinedRulePublicV2' test.out

#- 72 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 72 'GetMemberRolesListPublicV2' test.out

#- 73 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '7BWbYtWx' \
    --memberRoleId 'VCFMEmT4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "JUnFdYCp"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateMemberRolePublicV2' test.out

#- 74 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'YIJah53I' \
    --memberRoleId 'Egn9izQv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "vKD9y2Rs"}' \
    > test.out 2>&1
eval_tap $? 74 'DeleteMemberRolePublicV2' test.out

#- 75 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 75 'GetUserGroupInformationPublicV2' test.out

#- 76 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 76 'GetMyGroupJoinRequestV2' test.out

#- 77 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'wY40nuZO' \
    --namespace "$AB_NAMESPACE" \
    --userId '0Bnlp3kX' \
    > test.out 2>&1
eval_tap $? 77 'InviteGroupPublicV2' test.out

#- 78 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId '3JOgy1Pj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFTjk2W3' \
    > test.out 2>&1
eval_tap $? 78 'CancelInvitationGroupMemberV2' test.out

#- 79 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'BpUg1NBU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzALfpt4' \
    > test.out 2>&1
eval_tap $? 79 'AcceptGroupJoinRequestPublicV2' test.out

#- 80 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'nYWCkr96' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EiSVw5XL' \
    > test.out 2>&1
eval_tap $? 80 'RejectGroupJoinRequestPublicV2' test.out

#- 81 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'CsjFDUkB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gk6o9zNG' \
    > test.out 2>&1
eval_tap $? 81 'KickGroupMemberPublicV2' test.out

#- 82 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'v4TdjRpj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UsPHix3S' \
    > test.out 2>&1
eval_tap $? 82 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --limit '66' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "jOXgAh97", "description": "0BM54FP8", "globalRules": [{"allowedAction": "oRd014SH", "ruleDetail": [{"ruleAttribute": "t9VkYkpG", "ruleCriteria": "MINIMUM", "ruleValue": 0.0899761432642564}, {"ruleAttribute": "whCDdXzW", "ruleCriteria": "EQUAL", "ruleValue": 0.2652786592785833}, {"ruleAttribute": "wOyVVXHR", "ruleCriteria": "EQUAL", "ruleValue": 0.38198379850144304}]}, {"allowedAction": "ko5Lm1nL", "ruleDetail": [{"ruleAttribute": "qiwpcHzm", "ruleCriteria": "EQUAL", "ruleValue": 0.8143183132389548}, {"ruleAttribute": "L3yhSTQm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6231312596854374}, {"ruleAttribute": "dAwJ4YAQ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.531276147761536}]}, {"allowedAction": "QB1hR4xC", "ruleDetail": [{"ruleAttribute": "YBSlx8UV", "ruleCriteria": "MINIMUM", "ruleValue": 0.15473319978860423}, {"ruleAttribute": "DvxeAjSf", "ruleCriteria": "EQUAL", "ruleValue": 0.019758786613197965}, {"ruleAttribute": "5iPk24pk", "ruleCriteria": "EQUAL", "ruleValue": 0.44179998750640803}]}], "groupAdminRoleId": "hE5op1oZ", "groupMaxMember": 59, "groupMemberRoleId": "BysuRngg", "name": "ztGDHijL"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'fbcusTYc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'Crej81Vi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'GYKwc4WT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "6YlPXD3z", "groupMaxMember": 55, "name": "3f2GOXmU"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '01b0TgPz' \
    --configurationCode 'JoK4O9ps' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "m8cLa1H0", "ruleCriteria": "MINIMUM", "ruleValue": 0.8795133518268669}, {"ruleAttribute": "XJJzfyoy", "ruleCriteria": "MINIMUM", "ruleValue": 0.9914908969267915}, {"ruleAttribute": "DZjNagMR", "ruleCriteria": "EQUAL", "ruleValue": 0.12370449399417571}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'sd6d0JaT' \
    --configurationCode 'XqZn3Cnd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'Hx1oC2jT' \
    --groupName 'okqcqT1B' \
    --groupRegion 'BJ6DykBl' \
    --limit '36' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'y1TOaRWy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '80K25ePT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'HVHo6fwO' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '15' \
    --order 'F1pTIiXk' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "aEy6miyg", "memberRolePermissions": [{"action": 77, "resourceName": "DuHPqc8A"}, {"action": 77, "resourceName": "PKTywiiJ"}, {"action": 40, "resourceName": "G4uJDj7Q"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'aZOz7M7c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'mv2pe1uG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'NbGGXJUd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "DGAiahwb"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'D7z4lqst' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 13, "resourceName": "7UMwFQp6"}, {"action": 39, "resourceName": "Gne8S763"}, {"action": 83, "resourceName": "rq70lhzs"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'SEDZSoeE' \
    --groupRegion '5mL6LNLp' \
    --limit '71' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "SdHjjEmc", "customAttributes": {"3kQvHp26": {}, "UcxL4QKV": {}, "cNODCdid": {}}, "groupDescription": "dONXQSGr", "groupIcon": "8dnZEfC4", "groupMaxMember": 9, "groupName": "Wtw7T6Rl", "groupRegion": "iSX4MhHU", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "9V5it6a1", "ruleDetail": [{"ruleAttribute": "cScVxNzi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3345829118179172}, {"ruleAttribute": "TwstfnZP", "ruleCriteria": "MINIMUM", "ruleValue": 0.0374732320732899}, {"ruleAttribute": "Aep1tr9y", "ruleCriteria": "MINIMUM", "ruleValue": 0.21658158915427272}]}, {"allowedAction": "tdAraa3c", "ruleDetail": [{"ruleAttribute": "g5cb54a9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5945924645799252}, {"ruleAttribute": "xqRHa1aH", "ruleCriteria": "MAXIMUM", "ruleValue": 0.18748467796185475}, {"ruleAttribute": "DUrGgAso", "ruleCriteria": "MINIMUM", "ruleValue": 0.8687652427863501}]}, {"allowedAction": "QnAStt9q", "ruleDetail": [{"ruleAttribute": "Mcpoz4ON", "ruleCriteria": "EQUAL", "ruleValue": 0.24588820930268684}, {"ruleAttribute": "O2WWAXxx", "ruleCriteria": "MINIMUM", "ruleValue": 0.5304405564113298}, {"ruleAttribute": "oZimID4I", "ruleCriteria": "MINIMUM", "ruleValue": 0.7470807895374306}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'qOHUQaTe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '5lRIjhzb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "2kdX4tAw", "groupIcon": "FJleZkc4", "groupName": "8tXf8eQs", "groupRegion": "JM9Qu31G", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'JrYAUU3j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'cA9fyPQK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "qn6N7X6k", "groupIcon": "QgYCcZNO", "groupName": "aOVfjpjr", "groupRegion": "Rs3B3BRC", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'TDLasKOx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Q4FgNRu5": {}, "qheIJnA0": {}, "46zxrCuX": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'c9k24PhW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'fjAVCAOi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'ZvTezfpN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'N78XeHrb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '1T9exJW7' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'mdxu0kB3' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '70' \
    --order 'ynyHfGcf' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'oZdDxMGE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"M6CHmL3Z": {}, "BFfmuLRI": {}, "Sd5H8lfd": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'NCIooY7U' \
    --groupId 'O6AmPNxV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "VyanwVqU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7017634934292296}, {"ruleAttribute": "b7AQwrOx", "ruleCriteria": "MINIMUM", "ruleValue": 0.622548549276374}, {"ruleAttribute": "11AcbAhs", "ruleCriteria": "MINIMUM", "ruleValue": 0.9769648743674751}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'cqSnFvg4' \
    --groupId 'BJoWLQIU' \
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
    --limit '44' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'vTUc5BBU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "x4sdXMMz"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Hy0wgXUy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "OvhvKJ3h"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '31PZSb0B' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 't8mN0YJA' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6EmK40sq' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l3XLLa7s' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmYavYJV' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["LgnFNduD", "8Tc0sgpp", "mTzOm5mt"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 's1WMXsiY' \
    --limit '41' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'GdHyv1gO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QqVE1xdH' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "rEBq5O6o", "customAttributes": {"ekLDZUKk": {}, "PXCcxGqk": {}, "SWcqkkO0": {}}, "groupDescription": "A0KI56fo", "groupIcon": "AYNBbJZR", "groupMaxMember": 97, "groupName": "kvy9pecY", "groupRegion": "NSsSSk30", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "SCyzTgfm", "ruleDetail": [{"ruleAttribute": "mvLvso7V", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8826660592038639}, {"ruleAttribute": "Wbvir6cu", "ruleCriteria": "EQUAL", "ruleValue": 0.3279126611034321}, {"ruleAttribute": "BYditTLW", "ruleCriteria": "EQUAL", "ruleValue": 0.06839907569964443}]}, {"allowedAction": "e9fcd0so", "ruleDetail": [{"ruleAttribute": "viBfhX7P", "ruleCriteria": "MINIMUM", "ruleValue": 0.7932880313658361}, {"ruleAttribute": "lNbCEyjn", "ruleCriteria": "EQUAL", "ruleValue": 0.05778364951532311}, {"ruleAttribute": "gzp4yP15", "ruleCriteria": "MINIMUM", "ruleValue": 0.16537087356287417}]}, {"allowedAction": "WArQfcv5", "ruleDetail": [{"ruleAttribute": "jLphYPxq", "ruleCriteria": "EQUAL", "ruleValue": 0.36238814759371485}, {"ruleAttribute": "MCMzybyn", "ruleCriteria": "EQUAL", "ruleValue": 0.40921617991721104}, {"ruleAttribute": "sPv9Vb9Z", "ruleCriteria": "MAXIMUM", "ruleValue": 0.719134012710567}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["LPYpGVMT", "uoCSEABg", "09cPfBG8"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId '6OmJRSNg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "dlgffKXz", "groupIcon": "MPxT9Oar", "groupName": "4dGHQ4p2", "groupRegion": "fW89faIG", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'tonMzqet' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId '52fvfbPD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "kNUAMDAl", "groupIcon": "Frvy26Dp", "groupName": "GbItrZ7Z", "groupRegion": "8PXVXpXt", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId '1dZo0bnE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"OUmH1D1y": {}, "TaHu3t6W": {}, "mvBej00I": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'hop8kozw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '0zcPwARY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'E2ffwE3F' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'TfJ1pCfg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '4QUjXMbr' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'vJIpGNaZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'ec2HnmKi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"vqnqdCP3": {}, "9pXcPpnb": {}, "pk58kHjE": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'CUFuY47r' \
    --groupId 'pO7IZHYL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "VjYV1m12", "ruleCriteria": "MINIMUM", "ruleValue": 0.24146450425851085}, {"ruleAttribute": "H3XIfwwM", "ruleCriteria": "EQUAL", "ruleValue": 0.23048493052284502}, {"ruleAttribute": "CibCbGJq", "ruleCriteria": "MINIMUM", "ruleValue": 0.8429842060944276}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'T9H8HoFf' \
    --groupId 'At2hzjUL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'ZpWaDg2S' \
    --memberRoleId 'waZv9C23' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "k8nkvGew"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'qKdDzndq' \
    --memberRoleId 'yLlRjzQs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "SUXyfFnC"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '2nVgkBJX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F7XRnQ8t' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'kYTz1b1w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvIj1kDx' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'sJCZ24Ik' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9gwBfxW' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId '9aGH9iM7' \
    --namespace "$AB_NAMESPACE" \
    --userId '7NmCuQBu' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'SfakzNaZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '4WzB2UlC' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'MCxXpO3r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rSca3cRT' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
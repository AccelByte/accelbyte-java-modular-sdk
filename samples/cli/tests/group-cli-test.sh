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
    --limit '6' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "JNhnpwXc", "description": "7FWhKtVK", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "UrfHyVXu", "ruleCriteria": "EQUAL", "ruleValue": 0.4091199325398124}, {"ruleAttribute": "ahH7Ex83", "ruleCriteria": "EQUAL", "ruleValue": 0.28801497815939603}, {"ruleAttribute": "r9ComwZh", "ruleCriteria": "MINIMUM", "ruleValue": 0.8727684298783825}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "woSrGqIP", "ruleCriteria": "MINIMUM", "ruleValue": 0.4678248216272316}, {"ruleAttribute": "YGCcPHsO", "ruleCriteria": "MINIMUM", "ruleValue": 0.2573685172902944}, {"ruleAttribute": "3pKqzxu0", "ruleCriteria": "MINIMUM", "ruleValue": 0.9552745237524636}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "tl9AznO3", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7987719806219614}, {"ruleAttribute": "F37a6ja9", "ruleCriteria": "MINIMUM", "ruleValue": 0.4316123952438784}, {"ruleAttribute": "TxlhvO9F", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03824396182920986}]}], "groupAdminRoleId": "v4m8aMZD", "groupMaxMember": 67, "groupMemberRoleId": "Sw1gWGjo", "name": "qnLhErSq"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'NG1NjDWn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'tmGEUqtZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'onF7WfBK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "shhYegBT", "groupMaxMember": 91, "name": "kaoYSJ1l"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '9fMtD8yA' \
    --configurationCode 'adgtLcIb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "50pTaBq6", "ruleCriteria": "EQUAL", "ruleValue": 0.8085162506878537}, {"ruleAttribute": "SdE5vy7a", "ruleCriteria": "MINIMUM", "ruleValue": 0.4026714405436853}, {"ruleAttribute": "ClxShQQG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3225597160738798}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'VMMZHDdV' \
    --configurationCode '7Fkq3aKE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'UXU9MM3B' \
    --groupName 'AUDPZuWB' \
    --groupRegion 'nuEpAeTh' \
    --limit '88' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '8MG4mKih' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'AOeyc5Dy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'VLa9eFtU' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '93' \
    --order 'PQfyL21d' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "f3Ksu4IG", "memberRolePermissions": [{"action": 66, "resourceName": "B15lWeDZ"}, {"action": 38, "resourceName": "UjgZLCpU"}, {"action": 75, "resourceName": "R9m6ARi5"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'TTFEp3UW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'p08ovIn9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'tgPuTfYI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "pNt4Lkir"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'K3fOkIkz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 84, "resourceName": "Wu0zWoxL"}, {"action": 19, "resourceName": "kvjCaYxW"}, {"action": 91, "resourceName": "YDWajCy3"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'UsOtHBig' \
    --groupRegion 'zgc8ipQk' \
    --limit '12' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "x3EAQJgL", "customAttributes": {"QDsd7j1N": {}, "9BmZTZOX": {}, "RUGTG5ck": {}}, "groupDescription": "1fvlQpi8", "groupIcon": "0p7A3lxm", "groupMaxMember": 99, "groupName": "UelNkpki", "groupRegion": "5uS3fBOK", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "oRPZT02X", "ruleCriteria": "EQUAL", "ruleValue": 0.7204760424129083}, {"ruleAttribute": "4rQDJzpF", "ruleCriteria": "MAXIMUM", "ruleValue": 0.24522257765541744}, {"ruleAttribute": "tKT77T7J", "ruleCriteria": "EQUAL", "ruleValue": 0.5570546613425852}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "QS8O8I7a", "ruleCriteria": "MINIMUM", "ruleValue": 0.025074600005423053}, {"ruleAttribute": "nER81Pt9", "ruleCriteria": "MINIMUM", "ruleValue": 0.5409362506421466}, {"ruleAttribute": "eM8FJKgY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11463350180039933}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "kBAG2u1x", "ruleCriteria": "MINIMUM", "ruleValue": 0.12705828127954655}, {"ruleAttribute": "NqG3U7fC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4028808766834483}, {"ruleAttribute": "Fwzt1qWW", "ruleCriteria": "EQUAL", "ruleValue": 0.012213795126477467}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'HF7ielgb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'YLkGrbnv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "sdpWQaxF", "groupIcon": "2NAYR4lp", "groupName": "wTuAZYth", "groupRegion": "9mYyw1gw", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'CK8VBYWW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '7MFMefLO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "FlNVX964", "groupIcon": "Okr40cPf", "groupName": "sK4X6Dw3", "groupRegion": "WhthbFSg", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '4kb5JuhJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Iro0Lnxn": {}, "NWwKTZ2D": {}, "ukRPBrF7": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'RT7zxQ8C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '5vojzO8J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'jVYxAvxt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'Nqk5y214' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'NK9fsNmA' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Et9z9y0a' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '24' \
    --order 'IlEGbTqU' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'B2mr1B7A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"J2FjNEfH": {}, "c8iROA90": {}, "PWBzDfPC": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'M8KzDj9s' \
    --groupId 'f0rqIo0X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "azrQVJKC", "ruleCriteria": "EQUAL", "ruleValue": 0.5543871190166905}, {"ruleAttribute": "O1IRmvwa", "ruleCriteria": "MINIMUM", "ruleValue": 0.5984209610355228}, {"ruleAttribute": "1Rs5xWe6", "ruleCriteria": "MINIMUM", "ruleValue": 0.6241886387298461}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'rlPUHMK6' \
    --groupId '3OlEXjLE' \
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
    --limit '69' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'ULQGJ6Iy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "85KJL1zu"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'CWFsfeMw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "jkZFWgKM"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8ndptalQ' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MMEJERZd' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqs3V4RF' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ITfANQAy' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aR5EymOz' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["YtQ1W7VK", "Cins2rcZ", "SFiBsMNM"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHVuxPW9' \
    --limit '58' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'ydHdMc9e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SL9QY9lw' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "soH8qLOf", "customAttributes": {"qMHlkE1q": {}, "LYGjTpNa": {}, "kfDo6Uae": {}}, "groupDescription": "Y4HG78yu", "groupIcon": "oO6Lv1JB", "groupMaxMember": 86, "groupName": "ycJsOTT1", "groupRegion": "19IKAZ8S", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "6brWfRKV", "ruleCriteria": "MINIMUM", "ruleValue": 0.9643629188626264}, {"ruleAttribute": "iPMDtvet", "ruleCriteria": "EQUAL", "ruleValue": 0.31942433648700486}, {"ruleAttribute": "RRCNBabG", "ruleCriteria": "EQUAL", "ruleValue": 0.0857920210671288}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "q3KJsSIG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2668051031143699}, {"ruleAttribute": "sinnp1HY", "ruleCriteria": "EQUAL", "ruleValue": 0.769474379438451}, {"ruleAttribute": "IHHD3oPe", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9724846330487891}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "FQpXAT41", "ruleCriteria": "MINIMUM", "ruleValue": 0.2163960793776618}, {"ruleAttribute": "vvWiDZLy", "ruleCriteria": "MINIMUM", "ruleValue": 0.19598981163733986}, {"ruleAttribute": "TrjAZYaI", "ruleCriteria": "EQUAL", "ruleValue": 0.6295468990359339}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["0jZVFw4a", "Ydxw0IP8", "otWbLh4F"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId '6zSqvNW0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "05qJzuig", "groupIcon": "Zn33I9Xa", "groupName": "TMHIz4vX", "groupRegion": "jwjQdjja", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'yT9dQc34' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'NJrkGJU9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "cXjV9Nno", "groupIcon": "OF5JO0cA", "groupName": "A8949i8E", "groupRegion": "gEf0vgam", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'FvBfCfl1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"UMFaeFlz": {}, "YmRGl93t": {}, "jSRkkdmP": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'Sf6oGpNA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'nBYzeazD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'jv7SvxKJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'HnjCDnlS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'W1O30Ht0' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'ZZ4d5bQQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'ndyyesgd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"JjosrJ6s": {}, "dJZgKpcd": {}, "Ct6eEmPB": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'hN4tk2yB' \
    --groupId 'wizZIxkN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "SX8K3koY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1987570800388302}, {"ruleAttribute": "RTLzQ4VS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.02662667790806783}, {"ruleAttribute": "4qj6KBKI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1853779127950731}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '6OqygIWU' \
    --groupId 'jSWpo33Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'IJG0eJ4Y' \
    --memberRoleId 'OtBTfisH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "iEyA8O4D"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'Ty8j9aBS' \
    --memberRoleId 'MZFwM8aB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "4lch6HMz"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'IolFIbR4' \
    --namespace "$AB_NAMESPACE" \
    --userId '2ccSA4yO' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'f4nCVmC5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'irMNYC1F' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'fZZBZQhD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZTPTaw1v' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'fXkjztEb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4sIe1aq' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'SYVJAT7t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILzHupNI' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'QDvtCDSw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'poLEtU9C' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
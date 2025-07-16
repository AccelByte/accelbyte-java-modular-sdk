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
    --limit '38' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "4LAgMH6b", "description": "GldnHfFV", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "YgU3UlTp", "ruleCriteria": "MINIMUM", "ruleValue": 0.8109283422434246}, {"ruleAttribute": "XWJ5GMce", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7779009884351069}, {"ruleAttribute": "Dx5R8mHz", "ruleCriteria": "EQUAL", "ruleValue": 0.19825830694654978}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "DgBunplx", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9526259906797656}, {"ruleAttribute": "UsHnYeVz", "ruleCriteria": "EQUAL", "ruleValue": 0.1792470089725946}, {"ruleAttribute": "MkxyjsIp", "ruleCriteria": "EQUAL", "ruleValue": 0.3598340450359744}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "4IitzEpg", "ruleCriteria": "EQUAL", "ruleValue": 0.48546025125093817}, {"ruleAttribute": "3GhHvzjr", "ruleCriteria": "MINIMUM", "ruleValue": 0.3269370238541447}, {"ruleAttribute": "h3WrYz3o", "ruleCriteria": "EQUAL", "ruleValue": 0.3915246952958512}]}], "groupAdminRoleId": "WAsgxYUQ", "groupMaxMember": 55, "groupMemberRoleId": "YwmBQzPG", "name": "XILvRgT1"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'EYmsYuaF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'QEiQmpJ1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'nyF6YcRZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ACZmr2CD", "groupMaxMember": 62, "name": "TW5OeEnA"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'uL6Gy6WR' \
    --configurationCode 'aWyzQDQS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "h5mleagG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7737650644987696}, {"ruleAttribute": "dOIAno4D", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8421220925127034}, {"ruleAttribute": "Mj8QVCdr", "ruleCriteria": "MINIMUM", "ruleValue": 0.6071097759345052}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'U0K03xlh' \
    --configurationCode 'vydNCIpj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '9MLWoZ3r' \
    --groupName 'Z6tc8eMI' \
    --groupRegion '9jY6pIVc' \
    --limit '24' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '2FXtF7Ya' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'cyexyTUq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'vbO7VF6k' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '96' \
    --order 'HngGGcq0' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Wb9ksnsU", "memberRolePermissions": [{"action": 9, "resourceName": "IhCmxiAK"}, {"action": 76, "resourceName": "JvnHs4Uc"}, {"action": 94, "resourceName": "cZLUVl6M"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'NZiSuVH7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'URJ2fChb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'hoIrJqRq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "fzrwNet3"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'JwMezNP3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 21, "resourceName": "BNP6v98i"}, {"action": 72, "resourceName": "IubOPZWR"}, {"action": 92, "resourceName": "BANNQtUZ"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'DAxzKJQa' \
    --groupRegion 'd1GAvrYO' \
    --limit '22' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "1jr2vVx0", "customAttributes": {"LXq7ZFlJ": {}, "yLdZpExd": {}, "xlk6KCKl": {}}, "groupDescription": "QZ4a7HAe", "groupIcon": "03YSaout", "groupMaxMember": 79, "groupName": "QMFmVWxg", "groupRegion": "ztd9qJty", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "IeLnTgea", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6137295620327308}, {"ruleAttribute": "BuVKadZU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2753812884041843}, {"ruleAttribute": "SyQJRqjN", "ruleCriteria": "MINIMUM", "ruleValue": 0.7018696253926324}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "uhiqkzwd", "ruleCriteria": "MINIMUM", "ruleValue": 0.1317755092516011}, {"ruleAttribute": "KU6at0Lp", "ruleCriteria": "MINIMUM", "ruleValue": 0.11940885926746125}, {"ruleAttribute": "JSR1l0Ds", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6132353554032446}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "1fwYAzOc", "ruleCriteria": "EQUAL", "ruleValue": 0.5071406569702899}, {"ruleAttribute": "koDTU0E1", "ruleCriteria": "MINIMUM", "ruleValue": 0.954279843805107}, {"ruleAttribute": "CKewlrzU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2227776234916048}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'XrjROxIH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'pogrrN7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "SB05M2wo", "groupIcon": "zlVQF6Jy", "groupName": "bRJQ7ZoU", "groupRegion": "VDZipBIc", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'j3lWmkm2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'qnS58jHl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ooAFVWbe", "groupIcon": "oFskMqz7", "groupName": "no99o0Ae", "groupRegion": "CDNCOUEt", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'SKI3554W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"6bVnGW06": {}, "GgFP3ayV": {}, "yiE9FvDM": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'VXV9bRkp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '201PV6MP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'ZuxMxf0h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'u9DolwmT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'Mt7xBvPg' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'DPYUUu98' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '12' \
    --order 'xFxzlG0O' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'ANPqpUKM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"2MhNCYpG": {}, "qyDq3HUh": {}, "3KBr7eZK": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'T1b8T77E' \
    --groupId 'OyYijgsa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "bMySWPQ8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.08161468641961389}, {"ruleAttribute": "rBDjWPvI", "ruleCriteria": "MINIMUM", "ruleValue": 0.06828875538010926}, {"ruleAttribute": "izteV8O2", "ruleCriteria": "MINIMUM", "ruleValue": 0.30598612167908457}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'u4V0u4QF' \
    --groupId 'zB6Lux4u' \
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
    --limit '40' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '8XSu9buf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "XxSEr6vg"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'qWv3GJH9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "gFN5Fw9e"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zwx3gAvi' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e823WCNY' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XqGJRJ0a' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DjCuJpg5' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4VSVTzjM' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["lbdzROBq", "iWPTstXy", "F4s6btuW"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPNxT3fo' \
    --limit '91' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'zT5niHIp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAo73e2q' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "686Ssf2i", "customAttributes": {"MWYLAmD1": {}, "BcUSQZqV": {}, "AYZVnxJc": {}}, "groupDescription": "Q6m4IKr1", "groupIcon": "ycuPGp3Z", "groupMaxMember": 20, "groupName": "0x0x3fYi", "groupRegion": "x1Yacm93", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "5Gi3blDu", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7844466326078365}, {"ruleAttribute": "hCQAHjgx", "ruleCriteria": "MINIMUM", "ruleValue": 0.005604574080846247}, {"ruleAttribute": "cOInMZxk", "ruleCriteria": "EQUAL", "ruleValue": 0.3708546301227905}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "bpMgYFGY", "ruleCriteria": "MINIMUM", "ruleValue": 0.02361677767314485}, {"ruleAttribute": "bIuGe5KU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.16304504706354261}, {"ruleAttribute": "tLi3vmNc", "ruleCriteria": "EQUAL", "ruleValue": 0.5948200395876826}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "RoGXhdDT", "ruleCriteria": "EQUAL", "ruleValue": 0.5840285017997519}, {"ruleAttribute": "rZLpYpoo", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9360035432045816}, {"ruleAttribute": "QBIyFpGJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7005041791615534}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["wu0yXTQT", "qpZBUyBj", "RTkIUbYG"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'pqxF6tEV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "QKqMK0R3", "groupIcon": "qwuJMLss", "groupName": "qknPUNmQ", "groupRegion": "2vXDWOgv", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'CBvgnHVu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'A4Yc8u9d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "WVWKHmj6", "groupIcon": "RLwqaXEw", "groupName": "BFZXNJol", "groupRegion": "bdD04d5j", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'r2u3xfXn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"fc8LAlH0": {}, "pLIReRmi": {}, "Oa9eaZV8": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId '6vRY6SDz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '2wvhfNnK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'rETPKQge' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'JgDkfDjj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'A2oqeSAm' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'gV4gNLGx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'CjzkmvMG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"ns6JnpXg": {}, "VhWTQEQl": {}, "7LkPF7io": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'NsDZlkiR' \
    --groupId 'SBhiqcH1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "l3lSswpO", "ruleCriteria": "EQUAL", "ruleValue": 0.05033786128026774}, {"ruleAttribute": "uRaqsicB", "ruleCriteria": "MINIMUM", "ruleValue": 0.3653118544641799}, {"ruleAttribute": "IqJPgJA5", "ruleCriteria": "MINIMUM", "ruleValue": 0.9784652283020372}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'todMQ7E9' \
    --groupId 'oPRNC1kV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'RQncX1GR' \
    --memberRoleId 'SSDzHFYB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "YAEHu226"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'jWq5rUuT' \
    --memberRoleId 'voaxhpW3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "wUzbnhqT"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'Ky39EZFQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IeO2nYsm' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'vCV8IGqy' \
    --namespace "$AB_NAMESPACE" \
    --userId '2aaqhlEP' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'wVuFUzxu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5GHLqb9' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'NLu9ShBt' \
    --namespace "$AB_NAMESPACE" \
    --userId '61ErhKgv' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'GtnjyWIK' \
    --namespace "$AB_NAMESPACE" \
    --userId '3aJZg2aR' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId '9mGJmm7T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V2iqkFCq' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
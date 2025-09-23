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
    --limit '27' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "1HUI7VVY", "description": "bp7M2nJ0", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Tf8WNHyU", "ruleCriteria": "MINIMUM", "ruleValue": 0.9132667541600127}, {"ruleAttribute": "mIUJonGC", "ruleCriteria": "EQUAL", "ruleValue": 0.9453161504600651}, {"ruleAttribute": "uvrclUqC", "ruleCriteria": "EQUAL", "ruleValue": 0.9170520860187765}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "CvMpdXlO", "ruleCriteria": "MINIMUM", "ruleValue": 0.6755057500692399}, {"ruleAttribute": "WOAnuw68", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5052706054342011}, {"ruleAttribute": "Yi8EmKAr", "ruleCriteria": "EQUAL", "ruleValue": 0.5653665416152139}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "gxkH3xgY", "ruleCriteria": "EQUAL", "ruleValue": 0.009463342890012716}, {"ruleAttribute": "FJUIW9tc", "ruleCriteria": "EQUAL", "ruleValue": 0.3753927110289299}, {"ruleAttribute": "aQw4hAzC", "ruleCriteria": "EQUAL", "ruleValue": 0.67760250607045}]}], "groupAdminRoleId": "NIFHWx6F", "groupMaxMember": 36, "groupMemberRoleId": "E4U0XLXc", "name": "oCnvzYd6"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'kWuKxdQ0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'YMqxwuTf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'XoZVmgkn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "YdoU953I", "groupMaxMember": 3, "name": "Z23fYZhj"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'WVFlmAkQ' \
    --configurationCode 'pTjIBM9B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "kYTi0qd0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.911772694086246}, {"ruleAttribute": "Iyn47Qyj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1690544356921907}, {"ruleAttribute": "QhbIr5Ns", "ruleCriteria": "MAXIMUM", "ruleValue": 0.724602589526983}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'satnexBN' \
    --configurationCode 'pS0WNXZw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '6hz5gyYH' \
    --groupName '3ekPre2p' \
    --groupRegion 'yBZPuH07' \
    --limit '37' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'WTq8IZRH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'rJxa2S6G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '9sDC6z1y' \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '38' \
    --order '6IjhvCfw' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "mi4R3X6f", "memberRolePermissions": [{"action": 79, "resourceName": "HYY0nPKR"}, {"action": 54, "resourceName": "h0LyB4Fy"}, {"action": 91, "resourceName": "dT6vOoWN"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '4ioYldn1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'e9op3ZN1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'JoNHBfti' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "kp541YCW"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'P3pPkKxp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 66, "resourceName": "3djlAhE2"}, {"action": 87, "resourceName": "xbX4Ews8"}, {"action": 24, "resourceName": "MpnzmJyQ"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'jM1T8AWh' \
    --groupRegion 'gVloqksM' \
    --limit '94' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "SG7KbpUD", "customAttributes": {"Sdvvtrbb": {}, "dzCDquvK": {}, "hmXQAWtI": {}}, "groupDescription": "eWtIETpe", "groupIcon": "AVms6SHl", "groupMaxMember": 70, "groupName": "OCcBTnTl", "groupRegion": "VuNAcwkC", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "HV3OD2WI", "ruleCriteria": "MINIMUM", "ruleValue": 0.05052940121147942}, {"ruleAttribute": "wPC4War2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4204595572470924}, {"ruleAttribute": "aVvFY0kd", "ruleCriteria": "MINIMUM", "ruleValue": 0.4387980129112}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "wj5lkaQT", "ruleCriteria": "MINIMUM", "ruleValue": 0.36190918927341664}, {"ruleAttribute": "IS6HmnMK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.802921258647118}, {"ruleAttribute": "Kd2ACyuF", "ruleCriteria": "MINIMUM", "ruleValue": 0.3211716438660702}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "540BGmuq", "ruleCriteria": "MINIMUM", "ruleValue": 0.6771756534921517}, {"ruleAttribute": "f1Pi9ab4", "ruleCriteria": "MINIMUM", "ruleValue": 0.9895968477536876}, {"ruleAttribute": "OcE08FoM", "ruleCriteria": "EQUAL", "ruleValue": 0.6537276854612621}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'k4AnCIyG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'sastB97H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "dWRrgZqK", "groupIcon": "u7KduTkh", "groupName": "jnfSxH4i", "groupRegion": "wy2AJ9IE", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'YVqpHSUq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '2TkW4vMK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "fnzYmEvt", "groupIcon": "dk7VQpbe", "groupName": "3QT7lqrY", "groupRegion": "aBXxpfGM", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'Ls4zg5Wd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"BG7Pdn4M": {}, "Jt3RDZkf": {}, "yrKDnTcr": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'gV9396T5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '1c7p0Xpg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'CMd1IJT2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'tp1xwmTG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '7cAWcP32' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '7BP6elCN' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '100' \
    --order 'rtAH1Zpk' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '9WGL6x3I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"gc2dSpJi": {}, "M4jXxPvd": {}, "mb2C1vG4": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'MyiVL0qn' \
    --groupId 'RwX256fG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "d8kzZlV8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06689253793318273}, {"ruleAttribute": "4st59iMN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8559093471475622}, {"ruleAttribute": "4sAPSLVw", "ruleCriteria": "MINIMUM", "ruleValue": 0.9218080698236739}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '0d0mvtY1' \
    --groupId '7IxwFgvE' \
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
    --limit '9' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'aDDYLRG5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "08ciHKCX"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'clJKRONo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "WAaGyUkD"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZjryvVp' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OGSvMw7A' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yeTGgs5Z' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tUcQtB49' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nujsO1du' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["0vmrNubj", "sFMpXKxx", "sZqVpXsa"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMNS5tMo' \
    --limit '70' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'azAzsqy5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4YU8X5x' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "P0LHRjFs", "customAttributes": {"TQn1IPvT": {}, "n0bQt0YP": {}, "8BLE92ph": {}}, "groupDescription": "PyLdCKLD", "groupIcon": "A82OO5ij", "groupMaxMember": 43, "groupName": "NzmjV4E5", "groupRegion": "BSujtsUO", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "VrK6r58o", "ruleCriteria": "EQUAL", "ruleValue": 0.09656601492605443}, {"ruleAttribute": "mqjVhtso", "ruleCriteria": "MINIMUM", "ruleValue": 0.501112908971063}, {"ruleAttribute": "sHyQw8zB", "ruleCriteria": "EQUAL", "ruleValue": 0.31213510523884247}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "CKxi7Y0r", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6001240539421357}, {"ruleAttribute": "CZ7JhOTz", "ruleCriteria": "MINIMUM", "ruleValue": 0.2722633553765018}, {"ruleAttribute": "DNNCyDSq", "ruleCriteria": "MINIMUM", "ruleValue": 0.5564748316624409}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "OYCrDMkX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7044024209481615}, {"ruleAttribute": "4EVa6syv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7792802753674988}, {"ruleAttribute": "XjOCr9WW", "ruleCriteria": "MINIMUM", "ruleValue": 0.7473616452154381}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["CQdvm6Ww", "njTHzIF9", "z9mY02Bf"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'GU8FjL5X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "MDe19E3Q", "groupIcon": "umbHRGeo", "groupName": "LgBp8IOZ", "groupRegion": "n8CAtt4D", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'fSPOTe3A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'sY2FScnT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "CBvigpM1", "groupIcon": "dfOJ3VuK", "groupName": "KzSk9OyL", "groupRegion": "nTOKePnA", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'MWLrNtxf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"4KmYuGAn": {}, "kPwyDxCY": {}, "1T4v6mFC": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId '7RdVhRxK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '9Nk67yti' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'RWbBYyPw' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'qcg3OCli' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '4eEGJBHL' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'yHDiccxI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'CsO94MSi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"DbY8fhHS": {}, "1EtWNUjo": {}, "1kYSFHjF": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'GlbANOXy' \
    --groupId 'YMuKPNwp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "JLDVN0CE", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2532817911054914}, {"ruleAttribute": "qC2vACz3", "ruleCriteria": "MINIMUM", "ruleValue": 0.4553036992423847}, {"ruleAttribute": "I169da5m", "ruleCriteria": "EQUAL", "ruleValue": 0.48561823843299545}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'EZiOq6Xa' \
    --groupId 'SkhmiRHg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'EsqGLM2K' \
    --memberRoleId 'LlQcEBmJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "OsuJitIh"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'Gtwou1y0' \
    --memberRoleId '54fuxYsN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ocL3PYK8"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'HTKdkv5z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVuqWEhT' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'pgPfFfb5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c2WcWdeV' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'cy5gNyGU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BvyziX3t' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'eBvOGNxJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGDI4zQy' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'JcWasfXB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOsAmHSd' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId '60WK9q3w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnUumQk5' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
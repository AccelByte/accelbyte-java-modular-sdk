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
    --limit '78' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "tKVu6y9Y", "description": "rcWrUoy4", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "mopKFUck", "ruleCriteria": "MINIMUM", "ruleValue": 0.3811044864163403}, {"ruleAttribute": "obwuGO53", "ruleCriteria": "EQUAL", "ruleValue": 0.5372041151367127}, {"ruleAttribute": "3WpouIob", "ruleCriteria": "MINIMUM", "ruleValue": 0.36664285524074014}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "e3OqLMdi", "ruleCriteria": "EQUAL", "ruleValue": 0.26956294387556934}, {"ruleAttribute": "RoUZy4Kz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.32944695787525313}, {"ruleAttribute": "ZveoBMWS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5176476761055202}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "qAkOXz4n", "ruleCriteria": "EQUAL", "ruleValue": 0.584748819826495}, {"ruleAttribute": "B9fk0Ws9", "ruleCriteria": "EQUAL", "ruleValue": 0.8192086507948072}, {"ruleAttribute": "NepxMkE9", "ruleCriteria": "MINIMUM", "ruleValue": 0.18879156280971499}]}], "groupAdminRoleId": "C6UFQE5c", "groupMaxMember": 98, "groupMemberRoleId": "hxTyWAss", "name": "3fL6Ohqa"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'NPmC7Cw3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'Oj5ZuaRm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'L8Wwm24i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "We747BPd", "groupMaxMember": 7, "name": "VbU21Kty"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'hXyoKH7s' \
    --configurationCode 'DF8V9aIM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "9NbWw2RS", "ruleCriteria": "MINIMUM", "ruleValue": 0.17332085702215816}, {"ruleAttribute": "AhiY5Nav", "ruleCriteria": "MAXIMUM", "ruleValue": 0.25039463007803886}, {"ruleAttribute": "rWrhLclD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4125382691380971}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '1C5YxWkL' \
    --configurationCode '2iEKWEaA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'ejXPk52L' \
    --groupName 'bd6ofSmd' \
    --groupRegion 'Z8aUViYY' \
    --limit '14' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'noBTZNlK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'NLwx4uUn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'sO0QI8ag' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '38' \
    --order 'sGcYFFl4' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "9GBsGgOA", "memberRolePermissions": [{"action": 24, "resourceName": "2eysNLAI"}, {"action": 16, "resourceName": "mIN3wamp"}, {"action": 13, "resourceName": "Y1ufVC23"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '2iiKrYng' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'h3NLzXNl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'GMhsaqb9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "3KB2fQXm"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'nbx3rlZJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 76, "resourceName": "z8ngoD8a"}, {"action": 94, "resourceName": "c3GOdmKY"}, {"action": 18, "resourceName": "Ey1OmE1H"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'AQkBKNVQ' \
    --groupRegion '7R1hPeLL' \
    --limit '69' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "D9pNNhfp", "customAttributes": {"bUKWsLAc": {}, "Mkm7byiO": {}, "fvWwWZwA": {}}, "groupDescription": "kKbViFS6", "groupIcon": "CTMeuaBi", "groupMaxMember": 19, "groupName": "dI0nUNrS", "groupRegion": "Xi2AgXPC", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "zBRC0v70", "ruleCriteria": "EQUAL", "ruleValue": 0.10229629324864509}, {"ruleAttribute": "QRJI2co5", "ruleCriteria": "EQUAL", "ruleValue": 0.46438647248224973}, {"ruleAttribute": "vh5B15El", "ruleCriteria": "EQUAL", "ruleValue": 0.48848418281668626}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "tk65rLvl", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9520775506094893}, {"ruleAttribute": "edIAP5ej", "ruleCriteria": "EQUAL", "ruleValue": 0.5056093350278483}, {"ruleAttribute": "u6qpKJal", "ruleCriteria": "MINIMUM", "ruleValue": 0.030952924582517194}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "IV12BO0M", "ruleCriteria": "EQUAL", "ruleValue": 0.42798682839119695}, {"ruleAttribute": "dmUMzs1j", "ruleCriteria": "MINIMUM", "ruleValue": 0.5815490219964904}, {"ruleAttribute": "Gr3iZfFd", "ruleCriteria": "MINIMUM", "ruleValue": 0.7384749688639823}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'bSXfcOm4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'fXFuuLv5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "xiqisaMM", "groupIcon": "2jqetBg5", "groupName": "63WUuOqZ", "groupRegion": "emeR6JBp", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'GB9bMxsN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'tygii3Aj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "RqttOqEs", "groupIcon": "9cYgrLAo", "groupName": "cVFgogUq", "groupRegion": "sJ2HF4tv", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ui78sFMH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"UHvA5wvw": {}, "rDTyQw3x": {}, "suU2Vo5L": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '3TT0zMdq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '3Lr4N0uy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'Jjla7KxN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'htBzB0PW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '8uTPxyZd' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'zoaXW44Q' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '17' \
    --order 'GbwPgsoF' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'ioWhS1Wu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"WOFNDY5Q": {}, "hlkeRlMB": {}, "ZKGvnhM8": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'RaJ1yW3C' \
    --groupId '6WIMKRW8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "YlQPSMlH", "ruleCriteria": "MINIMUM", "ruleValue": 0.12916331232401235}, {"ruleAttribute": "l783H8cj", "ruleCriteria": "EQUAL", "ruleValue": 0.2832720164565016}, {"ruleAttribute": "1XZlv0Fx", "ruleCriteria": "EQUAL", "ruleValue": 0.28203681784987145}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '9AVVFFWW' \
    --groupId 'fCJKAEwF' \
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
    --limit '79' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'lVyKUU7t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "jRwrFXJb"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Gv1yQiKc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "CljpK66T"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FW8iPFuD' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ldjZ1GYK' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KhQneIa5' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VuazjB9Z' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9A2SnZbV' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["n4zgG5f4", "oFffNXuS", "5TdfP0Ef"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wV0cAyv8' \
    --limit '11' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '3rjqdwTT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGXL6gaL' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "F5CWjc5R", "customAttributes": {"fWjOfAXC": {}, "Ov82vxdp": {}, "gPHge9R0": {}}, "groupDescription": "StW7vIBm", "groupIcon": "jYFJYTHX", "groupMaxMember": 44, "groupName": "z5xj4gFo", "groupRegion": "1wZHnKRV", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "xKakgzFi", "ruleCriteria": "MINIMUM", "ruleValue": 0.6236680124250434}, {"ruleAttribute": "mILzDJZz", "ruleCriteria": "MINIMUM", "ruleValue": 0.560273264389355}, {"ruleAttribute": "CQZq7phl", "ruleCriteria": "EQUAL", "ruleValue": 0.20355198358792104}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "TsrW3XES", "ruleCriteria": "MINIMUM", "ruleValue": 0.6997243967920066}, {"ruleAttribute": "q2O04HEa", "ruleCriteria": "MINIMUM", "ruleValue": 0.3048364592368491}, {"ruleAttribute": "GYDZAEw8", "ruleCriteria": "EQUAL", "ruleValue": 0.4065412255703753}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "sHzsdm3a", "ruleCriteria": "EQUAL", "ruleValue": 0.3370802707731331}, {"ruleAttribute": "pB6QlHDn", "ruleCriteria": "MINIMUM", "ruleValue": 0.5922245327581358}, {"ruleAttribute": "X4fobMSh", "ruleCriteria": "EQUAL", "ruleValue": 0.21214388109176818}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["WzKGfy5c", "X2gzHV0Q", "S6Qq98sL"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId '5Bx9PLBy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "igYboNfQ", "groupIcon": "Kia4zjey", "groupName": "832GyV8z", "groupRegion": "6cw2FEjV", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId '0Smyoz3h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'VK3gF2CM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "bTQOXHXK", "groupIcon": "Owtg6qIY", "groupName": "YzDAy6qu", "groupRegion": "9fxsG8mX", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'w62t8wHT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"lIzRaeYT": {}, "mxKo5CPr": {}, "xGhaFnv4": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'YUJz75Ac' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'PIdO6nLP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'WUw9zgbb' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'SwvthQ2a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'QFtyiPhQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Z8PkFsbd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'GJcx4vNB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"pJTmgs5e": {}, "byKRW0pX": {}, "c4HagSex": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'WRsA0hAl' \
    --groupId '16ihmq5H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "ZkvDZlza", "ruleCriteria": "MINIMUM", "ruleValue": 0.8509593501344836}, {"ruleAttribute": "EVhTXKYk", "ruleCriteria": "EQUAL", "ruleValue": 0.914987821040012}, {"ruleAttribute": "hzW5Yava", "ruleCriteria": "MAXIMUM", "ruleValue": 0.48037473995382207}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'AWq407Vw' \
    --groupId 'JxRPHf8g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'Vc5pzj0V' \
    --memberRoleId '6VkClLW1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "mTaiEAz4"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'nRVUlFmh' \
    --memberRoleId 'kl1MY2GM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "7wgwdg3E"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'WsEAG31X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IZFGU2Bz' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'XGMhBFV1' \
    --namespace "$AB_NAMESPACE" \
    --userId '6jXpRs4A' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'hWJpGdHC' \
    --namespace "$AB_NAMESPACE" \
    --userId '8IV3lO1z' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'gNn2dU3f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'niQLqNS3' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'Egy9kofU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hsyDYXEQ' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'k6tUQ8WP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gFa8OGWW' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
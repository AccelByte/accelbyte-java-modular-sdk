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
    --limit '50' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "iBmkk61W", "description": "zTKLeXPR", "globalRules": [{"allowedAction": "fGwHSDh2", "ruleDetail": [{"ruleAttribute": "yCO1FE2O", "ruleCriteria": "MAXIMUM", "ruleValue": 0.48661123603686507}, {"ruleAttribute": "C0pT093p", "ruleCriteria": "MINIMUM", "ruleValue": 0.6790593620815643}, {"ruleAttribute": "8Rr4MTm1", "ruleCriteria": "MINIMUM", "ruleValue": 0.5336008955867759}]}, {"allowedAction": "HMK4uZgW", "ruleDetail": [{"ruleAttribute": "eYHBWR7C", "ruleCriteria": "MINIMUM", "ruleValue": 0.4353304953147643}, {"ruleAttribute": "whwch3hJ", "ruleCriteria": "EQUAL", "ruleValue": 0.9353134015683457}, {"ruleAttribute": "7V8i39bj", "ruleCriteria": "MINIMUM", "ruleValue": 0.20883927995767093}]}, {"allowedAction": "1kQb9Dq9", "ruleDetail": [{"ruleAttribute": "BR0ZeFD0", "ruleCriteria": "MINIMUM", "ruleValue": 0.8240649402984673}, {"ruleAttribute": "4zC0gtF1", "ruleCriteria": "EQUAL", "ruleValue": 0.7294180205065098}, {"ruleAttribute": "S8XT7Tal", "ruleCriteria": "MAXIMUM", "ruleValue": 0.46192938740815637}]}], "groupAdminRoleId": "XnSiEHek", "groupMaxMember": 7, "groupMemberRoleId": "QnJU3HQl", "name": "rywekD2B"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'iV1S3KDB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'HYgz1V2Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'lrKfNJ3K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZkjY0JvC", "groupMaxMember": 64, "name": "RJMXdNXV"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'VKq9lfFO' \
    --configurationCode '2Fi08fSz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "18b8iUD2", "ruleCriteria": "MINIMUM", "ruleValue": 0.7826428228878607}, {"ruleAttribute": "FioF4C83", "ruleCriteria": "EQUAL", "ruleValue": 0.3565892073894843}, {"ruleAttribute": "EmEviQXe", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6692443013318929}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'eryGnK4u' \
    --configurationCode 'R1UoWwj6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'Ses8DxiJ' \
    --groupName 'sOSXTjR8' \
    --groupRegion '1M5b0aq9' \
    --limit '76' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'zKIPigpo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'WBlKAL7t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '0MOcIlrM' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '41' \
    --order '2XvFFqJg' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "DFhYMPS0", "memberRolePermissions": [{"action": 29, "resourceName": "QrlnrZN0"}, {"action": 9, "resourceName": "bDodYeLt"}, {"action": 80, "resourceName": "DQ0M5BVr"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'FvqlyYv6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'JI7VrR3f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'Z0cT9zPO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "t0Jg5Ag7"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'ntI7PeH9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 79, "resourceName": "qOtp1i7U"}, {"action": 42, "resourceName": "vyp3oz4h"}, {"action": 55, "resourceName": "Prj2kSf1"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'GO8jiKIs' \
    --groupRegion 'WBkjnJbB' \
    --limit '61' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "916GbqiA", "customAttributes": {"9w8e88yS": {}, "uWtdwlrY": {}, "myLrNpw5": {}}, "groupDescription": "KrDJNiDe", "groupIcon": "vK7I3nfv", "groupMaxMember": 45, "groupName": "WFza4Nul", "groupRegion": "PXwnA5Qy", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "rXGbiQce", "ruleDetail": [{"ruleAttribute": "FeTV2505", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9338295977321766}, {"ruleAttribute": "EKdnhz6F", "ruleCriteria": "EQUAL", "ruleValue": 0.6409205642211735}, {"ruleAttribute": "DsVWuB6V", "ruleCriteria": "MINIMUM", "ruleValue": 0.7275943871848245}]}, {"allowedAction": "OCmwnTyJ", "ruleDetail": [{"ruleAttribute": "jAcbgUQl", "ruleCriteria": "EQUAL", "ruleValue": 0.24553993383911332}, {"ruleAttribute": "0dSz7b87", "ruleCriteria": "EQUAL", "ruleValue": 0.8586934446743255}, {"ruleAttribute": "ZDR9dIBt", "ruleCriteria": "EQUAL", "ruleValue": 0.05044800640660718}]}, {"allowedAction": "lk4V916U", "ruleDetail": [{"ruleAttribute": "CExTTZyN", "ruleCriteria": "MINIMUM", "ruleValue": 0.7200248745043681}, {"ruleAttribute": "awgmCJ2i", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7831047945760298}, {"ruleAttribute": "f3TjUT75", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8236545950450768}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'PlhKVPs5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'HULjEIiD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "vwumTVjH", "groupIcon": "8yoVwOlJ", "groupName": "mYngQg3Y", "groupRegion": "RoYMjQNv", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'aiZDWJJd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'KqoNDmGj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NWUixkDB", "groupIcon": "G0O47vhJ", "groupName": "RC0DCH0z", "groupRegion": "WbUuOefc", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'z5fvxP9o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"pm8kmTne": {}, "yPBuUSvi": {}, "kfJ4PcjW": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'KE7Bzsmj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '5grajz0G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'qXZUkfjl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'szAChZgw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'zfd6DKAU' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'DbQqf8Go' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '77' \
    --order 'joaaAHm0' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'N0i1XPYY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"9EIOo30x": {}, "KxQV4xdQ": {}, "CuEQYNBT": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'cWeJQY0R' \
    --groupId 'ru7WK2TE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "AkoNEi8j", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9091893206361955}, {"ruleAttribute": "dGv9c0s7", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11959640662401094}, {"ruleAttribute": "zdbZE7QB", "ruleCriteria": "EQUAL", "ruleValue": 0.18733043362190438}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'hXUIW1PG' \
    --groupId 'yBvTGECN' \
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
    --limit '54' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '8WArtv9E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "f5HWUpPn"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'MEveKd0E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "vaiTGfAi"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwFCU7wY' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JIX3xoFb' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tdg04GbK' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZdshSOz' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FbwGoYdu' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["92zA7XEK", "OZehXMuz", "PkH5epnk"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJaXFfWw' \
    --limit '38' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'uTeUSULF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqdGwoMd' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "yMajN7M0", "customAttributes": {"TPq4Du6O": {}, "hoQUN9zc": {}, "ezxAEDTP": {}}, "groupDescription": "0vbcL4W1", "groupIcon": "YReXwZRu", "groupMaxMember": 23, "groupName": "sf5QGCfX", "groupRegion": "qawSUea3", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "N02tJ7fx", "ruleDetail": [{"ruleAttribute": "2Vooqyqu", "ruleCriteria": "EQUAL", "ruleValue": 0.5515806233027767}, {"ruleAttribute": "VH0zXGC0", "ruleCriteria": "MINIMUM", "ruleValue": 0.908776932572671}, {"ruleAttribute": "VKeJfU9m", "ruleCriteria": "MINIMUM", "ruleValue": 0.3245426056993439}]}, {"allowedAction": "TD5PqmAe", "ruleDetail": [{"ruleAttribute": "p37bc2kU", "ruleCriteria": "MINIMUM", "ruleValue": 0.7572383638444621}, {"ruleAttribute": "4jVDHqtS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23251018894379527}, {"ruleAttribute": "cA1HhVld", "ruleCriteria": "MINIMUM", "ruleValue": 0.024995764059996928}]}, {"allowedAction": "Ff6zQcZV", "ruleDetail": [{"ruleAttribute": "e0QlnA9I", "ruleCriteria": "MINIMUM", "ruleValue": 0.2947083675597124}, {"ruleAttribute": "AvbId0eJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.5625511573549303}, {"ruleAttribute": "oCj9Xcxy", "ruleCriteria": "MINIMUM", "ruleValue": 0.4012343587886237}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["w1xKpFww", "oPp6URU4", "QDJuOuPh"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'TfF7vH29' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "wRK3JMZa", "groupIcon": "LCnZzMUD", "groupName": "3225D0Td", "groupRegion": "OeWK9FEY", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'prreP23n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId '8QG5HkKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "6Z7lXn5T", "groupIcon": "X6rty2bw", "groupName": "6hAbXOuP", "groupRegion": "WfEIMAPr", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'vIHUCLun' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"BgpQH1SE": {}, "mrCc4pLj": {}, "Vs4L9DLg": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'rffL7ZdZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'DDFq3Sha' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'utfr4RLO' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'Hjy3Q2GQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'KIU6eizO' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'urqbDTLo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'eZ2E2to2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"V7E7ufLp": {}, "SnUEbKEG": {}, "TYtsFNfi": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'Uq0B6Aov' \
    --groupId 'mR0R8t2c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "pOKncHSo", "ruleCriteria": "MINIMUM", "ruleValue": 0.3219073979377317}, {"ruleAttribute": "SMzRWli8", "ruleCriteria": "MINIMUM", "ruleValue": 0.8190399380824659}, {"ruleAttribute": "T8Feb1PO", "ruleCriteria": "EQUAL", "ruleValue": 0.9407923819351368}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '0BuAGQ7H' \
    --groupId 'MckJTmr6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'fuleJHUj' \
    --memberRoleId 'xvYlUq9Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "3Y2KUhxQ"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '7KDA6cCO' \
    --memberRoleId 'bh3XHrfA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "tFSo2IuN"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'twIStJDd' \
    --namespace "$AB_NAMESPACE" \
    --userId '3VZzRQjr' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'Eh3A2J8j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSrMIYrc' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'Hq6sAK1I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Psr4Qa8O' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'szd9UER9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8OCgui9' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'PGHOgrFE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jh7EJAg3' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'XihULRrX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sp2AWs5v' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
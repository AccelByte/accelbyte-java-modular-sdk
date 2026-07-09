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
    --limit '45' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "zsTOfkNR", "description": "Sz8yHIZ2", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "sMXnKRiF", "ruleCriteria": "MAXIMUM", "ruleValue": 0.015737325675641123}, {"ruleAttribute": "lnfvi6Dk", "ruleCriteria": "EQUAL", "ruleValue": 0.7266494003516102}, {"ruleAttribute": "70aL0Rik", "ruleCriteria": "MAXIMUM", "ruleValue": 0.063223866640852}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "Rc8wzJXX", "ruleCriteria": "EQUAL", "ruleValue": 0.28852099313118307}, {"ruleAttribute": "TmxTjq9C", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6462476531108327}, {"ruleAttribute": "B5rW6LLT", "ruleCriteria": "EQUAL", "ruleValue": 0.9640635472492607}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "axowwOGb", "ruleCriteria": "EQUAL", "ruleValue": 0.5358520283663848}, {"ruleAttribute": "BGtCaAfZ", "ruleCriteria": "EQUAL", "ruleValue": 0.43436365933024434}, {"ruleAttribute": "2ysbiixx", "ruleCriteria": "EQUAL", "ruleValue": 0.04133000431853984}]}], "groupAdminRoleId": "muTw8Qzw", "groupMaxMember": 27, "groupMemberRoleId": "tJFOIhtL", "name": "itwmo3qO"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'LzFzRIak' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'PPqnfVEX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'G0ApPito' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aGW5Lo5t", "groupMaxMember": 89, "name": "3S3PvzXb"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'd7tqGifG' \
    --configurationCode '3CpteSTn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Dcek5mog", "ruleCriteria": "MINIMUM", "ruleValue": 0.4200335422378977}, {"ruleAttribute": "yVkWfbDw", "ruleCriteria": "EQUAL", "ruleValue": 0.5265242048501708}, {"ruleAttribute": "2ND2GgQW", "ruleCriteria": "MINIMUM", "ruleValue": 0.5894896444976724}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'KyKfySZU' \
    --configurationCode 'YfU47IvV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'C4VXZTkq' \
    --groupName 'ryq7IV5X' \
    --groupRegion '3VqT8Zqx' \
    --limit '43' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '8OVevYQb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '2DtugWAD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'uQLuqANW' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '21' \
    --order '2IdRJLWi' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "fWjywUpl", "memberRolePermissions": [{"action": 15, "resourceName": "PiL1dqFk"}, {"action": 99, "resourceName": "BKT4vB9A"}, {"action": 22, "resourceName": "hFX8cCS3"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'hqbK13ic' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'yGyb3ZRw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'HP4o2EsT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "bWt8y1Ml"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'zEopvkkj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 27, "resourceName": "En1a6NF0"}, {"action": 75, "resourceName": "9Yy2dcp0"}, {"action": 52, "resourceName": "JQdQiMc4"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'zDmHS7Pu' \
    --groupRegion 'vYXUXVKm' \
    --limit '37' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "7yuuBqiU", "customAttributes": {"Gcclr8zx": {}, "925DWGsT": {}, "XkCF6Qce": {}}, "groupDescription": "mnJh5hlD", "groupIcon": "1aXSobZ4", "groupMaxMember": 85, "groupName": "xxUSQEmn", "groupRegion": "NcmzuxUk", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "KL4miMp5", "ruleCriteria": "EQUAL", "ruleValue": 0.9043758916285694}, {"ruleAttribute": "SBgYZqgj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8545401009040607}, {"ruleAttribute": "XUtcjTZT", "ruleCriteria": "MINIMUM", "ruleValue": 0.407148247294453}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "5VByhc4p", "ruleCriteria": "EQUAL", "ruleValue": 0.1935932223842156}, {"ruleAttribute": "c7WMZ33C", "ruleCriteria": "EQUAL", "ruleValue": 0.7507225966095659}, {"ruleAttribute": "bRQTaKbs", "ruleCriteria": "EQUAL", "ruleValue": 0.5171392647198083}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "IQbBYViz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2020318048551678}, {"ruleAttribute": "SVcN0MbL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7081553397240881}, {"ruleAttribute": "RQMxzJK3", "ruleCriteria": "MINIMUM", "ruleValue": 0.6694296398752774}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'pwwVl1Oi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'W8La5gCj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "MqwOth7A", "groupIcon": "PGwOPe99", "groupName": "vDJTlA9m", "groupRegion": "k8M1vBMJ", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'YYXjXwlA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'IvRzSlLk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "T8SM0SZd", "groupIcon": "3AdyxUHh", "groupName": "M3VRoUVu", "groupRegion": "dHUGyDLF", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ydlCyT9C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"x71qV0iZ": {}, "3AYnXoPA": {}, "PRFD6EN3": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'RT5YcQc2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'N9R9no4k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '1skLECC5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'AYSYwgAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'UEmAD2zt' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'teXZY4SF' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '48' \
    --order 'lfOUFsZE' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '1FsVUwbQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"IWKsNv6Y": {}, "amwVvvDF": {}, "V66EDKyH": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '6ojg9Qcc' \
    --groupId 'pFlNCsVz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "XV9ClF3x", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3738579757742828}, {"ruleAttribute": "WoIJomnn", "ruleCriteria": "MINIMUM", "ruleValue": 0.1951007640056821}, {"ruleAttribute": "R7wN4s2u", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6025853621809907}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '7Eyw7Ay9' \
    --groupId 'pkr9n6cb' \
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
    --offset '1' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'wg6NCAyZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "yWy6bPVx"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'hSXvCD5G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "PnpaCtoS"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jp0kO9Ou' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pqnTxnj9' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Aycnf00o' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hXpOpB8u' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0F52Bks' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["dw354Ue2", "ljCbj5am", "rTGMozf0"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gjv5dPMQ' \
    --limit '79' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'jS2jobju' \
    --namespace "$AB_NAMESPACE" \
    --userId '8GyAAzyK' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "TwVd12Du", "customAttributes": {"cu03rlfW": {}, "5zV9msoL": {}, "J8DONbvd": {}}, "groupDescription": "kj81ZxFh", "groupIcon": "5zG22wO1", "groupMaxMember": 27, "groupName": "DtJQHH5m", "groupRegion": "lwsv583r", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "BdM6Tw2J", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06517708939144684}, {"ruleAttribute": "EjC2R2NB", "ruleCriteria": "MINIMUM", "ruleValue": 0.20485837914639138}, {"ruleAttribute": "3ANcpt6J", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9482494217928976}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "SmgZY6hC", "ruleCriteria": "EQUAL", "ruleValue": 0.4461833746646764}, {"ruleAttribute": "6BEveqqd", "ruleCriteria": "MINIMUM", "ruleValue": 0.14425223496259687}, {"ruleAttribute": "nBdfmlue", "ruleCriteria": "MINIMUM", "ruleValue": 0.2615750442725805}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "SVLO8mN3", "ruleCriteria": "MINIMUM", "ruleValue": 0.7288405599082639}, {"ruleAttribute": "wPc3BRRi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.25065151291899945}, {"ruleAttribute": "YuHaAtbi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6432853084494562}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["0EUqteCc", "KFxYVXqm", "vmMzceS6"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'wY0K9TZh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Y8YioVSD", "groupIcon": "UK0OJGVD", "groupName": "Q5yhhy3A", "groupRegion": "YPIjykUq", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'XdzTHjGY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'ThmSIara' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Q8Int5ed", "groupIcon": "rHCrp3Fx", "groupName": "CKEyNbDe", "groupRegion": "bWgz05CF", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'Q4Jc0jEM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"BxdCgRph": {}, "jEtEfqhv": {}, "U6FUOU4T": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'lRPqKn8m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'HHjTHL2x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'o104gYu1' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'dpfbhy7X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'cikXi9R4' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Om1bRjST' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'b2G2bLht' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"aQMhLihE": {}, "9AvDahgE": {}, "IjpZT4Ir": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'VolILitA' \
    --groupId 'I1Ex1eAE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "xtz3DRaZ", "ruleCriteria": "EQUAL", "ruleValue": 0.6310106436133355}, {"ruleAttribute": "7bu8zWmL", "ruleCriteria": "EQUAL", "ruleValue": 0.3291346717267726}, {"ruleAttribute": "hPuMp0iG", "ruleCriteria": "MINIMUM", "ruleValue": 0.618977821144481}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'IlmftMaU' \
    --groupId '7hs1HqaB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'AOzmdiyM' \
    --memberRoleId 'yiIvh2qp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "smXhKHNX"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'KExnreTf' \
    --memberRoleId 'pCbDTsQC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "zdSXA10u"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'kh9Rbsrr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvOskqVI' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'r42L9J01' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a70IuViQ' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'l1SBuaBL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XNpnKZ0u' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'I5SUyP0V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gm1pIYy1' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'VA7Skus1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wCZwzfFQ' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'tcWWNijS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBCpAI4F' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
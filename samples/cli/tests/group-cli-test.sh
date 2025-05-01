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
    --limit '93' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "RnhIOADy", "description": "G2J1MBnG", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "wgktsgCP", "ruleCriteria": "EQUAL", "ruleValue": 0.8371737345782987}, {"ruleAttribute": "iCbjLET3", "ruleCriteria": "EQUAL", "ruleValue": 0.8451825609510165}, {"ruleAttribute": "ZMQognnJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.7271472074557647}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "4KjoKXJ8", "ruleCriteria": "MINIMUM", "ruleValue": 0.7887976181436304}, {"ruleAttribute": "SJdltniW", "ruleCriteria": "MINIMUM", "ruleValue": 0.7188384067037874}, {"ruleAttribute": "hlTmH9DX", "ruleCriteria": "MINIMUM", "ruleValue": 0.8267308954597654}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ZAqJFHpb", "ruleCriteria": "EQUAL", "ruleValue": 0.12504706077856642}, {"ruleAttribute": "FLhMHiUN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.09705847874447049}, {"ruleAttribute": "7ZmnjaJg", "ruleCriteria": "MINIMUM", "ruleValue": 0.2927512716554852}]}], "groupAdminRoleId": "YzTcakFu", "groupMaxMember": 40, "groupMemberRoleId": "0je2Czez", "name": "G17DpYlj"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'Ky6YEAjf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '8vQPxmMv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'XXmoiFcg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tPZ4tIhS", "groupMaxMember": 16, "name": "IgRxP5M3"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Z97I64hK' \
    --configurationCode 'icY0YSjg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "NCXjXFit", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4100444618976953}, {"ruleAttribute": "MD4T482G", "ruleCriteria": "EQUAL", "ruleValue": 0.4940998803766976}, {"ruleAttribute": "tw8KVFRU", "ruleCriteria": "MINIMUM", "ruleValue": 0.8945916804185726}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '87L3sUu9' \
    --configurationCode 'jeWMsBRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '1N5PblVc' \
    --groupName 'Rg1kc6Tq' \
    --groupRegion '6wMKQTOp' \
    --limit '38' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'rzzBvbq5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '5AlZ136F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'cUYRj4tS' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '51' \
    --order '6rAYDcIN' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Pwxi8s7K", "memberRolePermissions": [{"action": 28, "resourceName": "ECTrJPzp"}, {"action": 3, "resourceName": "eTmKv3zK"}, {"action": 56, "resourceName": "ts1rnapp"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'QUZZ0aGE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'IQH3B2TT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'O1dj18rQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "miN4kd8q"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jutoUvy5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 82, "resourceName": "X6FP6wwZ"}, {"action": 8, "resourceName": "1jScGXYM"}, {"action": 15, "resourceName": "P60l3YiT"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Syizrw5W' \
    --groupRegion '9UpuhKBe' \
    --limit '42' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "aIdyQaHJ", "customAttributes": {"jRdleAGO": {}, "nzBvCKu7": {}, "9w6ej4Ia": {}}, "groupDescription": "bNHuIXST", "groupIcon": "rikj3cwU", "groupMaxMember": 65, "groupName": "z4UCc5EM", "groupRegion": "gDRuNCJy", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "Tz2ATrgV", "ruleCriteria": "EQUAL", "ruleValue": 0.4964162685819564}, {"ruleAttribute": "IXT1AUi7", "ruleCriteria": "MINIMUM", "ruleValue": 0.4854653177155306}, {"ruleAttribute": "6eo2ZjI9", "ruleCriteria": "MINIMUM", "ruleValue": 0.466300916413561}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "9ntOx2hF", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8170921606822278}, {"ruleAttribute": "0g0Y2PgS", "ruleCriteria": "EQUAL", "ruleValue": 0.014239653092602444}, {"ruleAttribute": "2jLgjIoA", "ruleCriteria": "EQUAL", "ruleValue": 0.8121586412974201}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ONIQjWDK", "ruleCriteria": "MINIMUM", "ruleValue": 0.33701709711211136}, {"ruleAttribute": "OoG15D3g", "ruleCriteria": "EQUAL", "ruleValue": 0.2078210391830707}, {"ruleAttribute": "bq2qZbGi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5819679022083711}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '5OzUIv0C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'fdl2kCPc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "1WZ7tDZz", "groupIcon": "Oy8iSUeY", "groupName": "slcBssVO", "groupRegion": "3ktkEXvX", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'N3hDEGRj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'neXnKSeE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "fRLeH9y9", "groupIcon": "VOoyto9Z", "groupName": "UyMjItGh", "groupRegion": "d6RRIpjV", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'UPfW4OGc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"4BdBdbEY": {}, "WnqmFzSX": {}, "HNa4Rd7w": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'sycKL8jz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'sdV7Yv7n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '3xIiEYnG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'xIKwcdVm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'wQF6FbIT' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '2VUOw8Kp' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '76' \
    --order 'OBzdBnUl' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'DlOwl8AT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"hZL74Rp1": {}, "CzerqoyH": {}, "9rzywud9": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'oW1jvufk' \
    --groupId 'SMfxfW8y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Y5B4cy4f", "ruleCriteria": "MINIMUM", "ruleValue": 0.1788930742579251}, {"ruleAttribute": "gynY2IAE", "ruleCriteria": "EQUAL", "ruleValue": 0.10591336733649248}, {"ruleAttribute": "VO63e5V7", "ruleCriteria": "MINIMUM", "ruleValue": 0.9721119654866696}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'CpGOLu2B' \
    --groupId '1THmZyQI' \
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
    --limit '81' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '4kbsM5D0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "P6mqIZNt"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 't7LxErfM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Sg3EmDbh"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bwWfUMUc' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7gh9pvbD' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ivYKFAnT' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A82HUP9b' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'piKvsWS4' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["w9MZgvPz", "fkQPgpuH", "2SJ1xrEO"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '1KUTUne2' \
    --limit '57' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '0U9XTb7a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pU8ueTbX' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "ygM53HLc", "customAttributes": {"9fmqN97V": {}, "LQP4avto": {}, "YR4up5BO": {}}, "groupDescription": "l98I6J0a", "groupIcon": "oa6jv1kB", "groupMaxMember": 54, "groupName": "152LMmT5", "groupRegion": "2f8NuRml", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "f3B4829H", "ruleCriteria": "MINIMUM", "ruleValue": 0.4368505599899276}, {"ruleAttribute": "9XfaUooo", "ruleCriteria": "EQUAL", "ruleValue": 0.7084131769010549}, {"ruleAttribute": "zXQ7C5rT", "ruleCriteria": "EQUAL", "ruleValue": 0.883972535705421}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "zpzw8nSB", "ruleCriteria": "EQUAL", "ruleValue": 0.4419266565622385}, {"ruleAttribute": "vmeeO0Rb", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3232395990645699}, {"ruleAttribute": "hYBgEGqO", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6696103495171849}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "UWmQqdiv", "ruleCriteria": "EQUAL", "ruleValue": 0.9601309375197145}, {"ruleAttribute": "AS9d3iLa", "ruleCriteria": "MAXIMUM", "ruleValue": 0.030574045172870767}, {"ruleAttribute": "VaXHTgkG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.19148229356825464}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["IiD9dLv2", "1ZuptgPo", "adHIJc6K"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'RRMlpCTR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NPhpxRIe", "groupIcon": "ttDGZHSt", "groupName": "m1QQvnyN", "groupRegion": "kw8EGRGH", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'MzyQYCu5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'qlsjesCk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "syxI3bh9", "groupIcon": "KrspPFS8", "groupName": "SuMqVmv3", "groupRegion": "UBj7iKAU", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'dWnMyltn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"kU2jXfAc": {}, "FOfMs7mJ": {}, "L9oKGcD0": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'ri3Omr3t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'XcNqcQ0I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'o5BMD6US' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'wbZLynbW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'sZJCuOES' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'v30HyGpL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'YE2t6O38' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"AhJAyXvA": {}, "32iqaNaj": {}, "mrZAY5yF": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'yaEkK0ih' \
    --groupId 'x7SoEwXn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "QiFDiAHi", "ruleCriteria": "EQUAL", "ruleValue": 0.26587680791050916}, {"ruleAttribute": "LZR2IXc7", "ruleCriteria": "MINIMUM", "ruleValue": 0.4346503930217577}, {"ruleAttribute": "XfmIehMC", "ruleCriteria": "EQUAL", "ruleValue": 0.7551765082617048}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'SH91P08X' \
    --groupId 'YdDYnMVN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'Fzb6NHQl' \
    --memberRoleId 'sKER5zWA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "92Olaphm"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'LsakCrTW' \
    --memberRoleId 'JA0al3mY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "9huskJXL"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'QDy2RHDF' \
    --namespace "$AB_NAMESPACE" \
    --userId '1pOZ5HX2' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'Mwrrkevn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'COEHrKH0' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId '4aGj3pK4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tB5WG4sO' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'toj0OdRv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fB5i69dU' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'hgZGucgu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIc0saYA' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'EW0QRPMb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rbP7vZdX' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
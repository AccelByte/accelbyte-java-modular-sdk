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
    --offset '86' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "A2gMZ2cg", "description": "HRRm4d6R", "globalRules": [{"allowedAction": "fzAn4suD", "ruleDetail": [{"ruleAttribute": "GtAkIQ4r", "ruleCriteria": "EQUAL", "ruleValue": 0.8025816049974557}, {"ruleAttribute": "JAwOVYmk", "ruleCriteria": "EQUAL", "ruleValue": 0.6447262835832039}, {"ruleAttribute": "JvK00Uz9", "ruleCriteria": "EQUAL", "ruleValue": 0.9257699302247736}]}, {"allowedAction": "v9RqZ2MG", "ruleDetail": [{"ruleAttribute": "jbvhtcaJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.20323131843468834}, {"ruleAttribute": "uQl9wcqO", "ruleCriteria": "MINIMUM", "ruleValue": 0.849849644426728}, {"ruleAttribute": "8DhNbxNJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.34664041403358314}]}, {"allowedAction": "ChWHCTgw", "ruleDetail": [{"ruleAttribute": "tP5H3OIu", "ruleCriteria": "MINIMUM", "ruleValue": 0.6074991716024654}, {"ruleAttribute": "jQuDYxdq", "ruleCriteria": "EQUAL", "ruleValue": 0.013901204382043564}, {"ruleAttribute": "k5KBzhTV", "ruleCriteria": "MAXIMUM", "ruleValue": 0.19103857345642483}]}], "groupAdminRoleId": "zO4mcdiP", "groupMaxMember": 26, "groupMemberRoleId": "VqN071KK", "name": "HqH2JFSO"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '9qctbPWU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'fAC1skqV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'Prbnkggi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "KK5vPZT8", "groupMaxMember": 78, "name": "B9GfabYy"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'CEBPzP4h' \
    --configurationCode 'WhcqByNT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "fJN5q354", "ruleCriteria": "EQUAL", "ruleValue": 0.61097696218908}, {"ruleAttribute": "XoF6fcIK", "ruleCriteria": "MINIMUM", "ruleValue": 0.6234844558762617}, {"ruleAttribute": "jbZdORIU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7618522570856922}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'QUapx9FZ' \
    --configurationCode 'EdRKQkRn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'sevXxcwd' \
    --groupName 'LUpqbx4J' \
    --groupRegion 'hFKAhCZl' \
    --limit '50' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'FQwuJj9O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'nM23AhdH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'r4HXmG8E' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '70' \
    --order 'hKOHAuRz' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "PsiM6YNQ", "memberRolePermissions": [{"action": 75, "resourceName": "oj7irMrP"}, {"action": 73, "resourceName": "AiYZJELp"}, {"action": 53, "resourceName": "OBISSRTh"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'iSKNGePP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'L7a9hOzh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'azzM7Qiw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Gr5UknWK"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '3NpVZ0YO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 70, "resourceName": "ddpAr8Pb"}, {"action": 15, "resourceName": "2saY22KX"}, {"action": 57, "resourceName": "CBFuMQ7X"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '9mUwdOsM' \
    --groupRegion 'G30CDC46' \
    --limit '5' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "iTkfWlRm", "customAttributes": {"2aXbIxUm": {}, "aSqBDD1x": {}, "Fm4n7NtD": {}}, "groupDescription": "QQDjHfn3", "groupIcon": "tATqgueK", "groupMaxMember": 19, "groupName": "ODG47VfB", "groupRegion": "8OvW2rlA", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "EKTkLrcI", "ruleDetail": [{"ruleAttribute": "KP4vOV85", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9864113024157368}, {"ruleAttribute": "rvfukZGf", "ruleCriteria": "EQUAL", "ruleValue": 0.7336758936207596}, {"ruleAttribute": "WpjDYNRL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.034622092550680716}]}, {"allowedAction": "tDBjSETb", "ruleDetail": [{"ruleAttribute": "lPp77QJp", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7538486221994877}, {"ruleAttribute": "3jVxlDEa", "ruleCriteria": "EQUAL", "ruleValue": 0.8093771898733602}, {"ruleAttribute": "amv2vyr9", "ruleCriteria": "EQUAL", "ruleValue": 0.9424581422263841}]}, {"allowedAction": "WVNdbo7P", "ruleDetail": [{"ruleAttribute": "I5uNbLdz", "ruleCriteria": "EQUAL", "ruleValue": 0.7877115616143597}, {"ruleAttribute": "1vGHuHE5", "ruleCriteria": "EQUAL", "ruleValue": 0.05990576630593636}, {"ruleAttribute": "qCmCDyxb", "ruleCriteria": "EQUAL", "ruleValue": 0.2856543741157913}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'XiPNtSXf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'dSEWilkz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "XeTU7rkf", "groupIcon": "NUemVlyg", "groupName": "UeOb85Ps", "groupRegion": "mGrXE7ks", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'dokyWPNh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'r2eibCFs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "YFBzyyEn", "groupIcon": "p8DctPLO", "groupName": "6NwLCukF", "groupRegion": "hJepEcDT", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'yKHYIgQa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"p067nDRT": {}, "mijwc6bq": {}, "OOcpEFYn": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'VApm9eNX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'CqIfA6h2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'TGpgotNX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'b25zgyst' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'ploEs2jX' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'x6LkI2Qf' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '89' \
    --order 'fWIpgSKz' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'lwoUOw2M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"OdFw9PMw": {}, "pOKkHL78": {}, "WZH5GgHQ": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'WXttz2AN' \
    --groupId 'fTOrGnt0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Pw1gVz1R", "ruleCriteria": "MINIMUM", "ruleValue": 0.8820385294291794}, {"ruleAttribute": "4g6c86N9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.40980395925693136}, {"ruleAttribute": "xjl39rcx", "ruleCriteria": "MINIMUM", "ruleValue": 0.30631597699952806}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'HE4J9BgZ' \
    --groupId 'oOnwat3l' \
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
    --limit '72' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'eRYfG3aN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "xacrW6b6"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'assuRqcU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "zv1ZdZ1c"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'imjXdODl' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NTcpbdEN' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4LIz23Z9' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2NdgWJq' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSJVj1Kx' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["3meXnKoE", "Bm6cuXTw", "MhZtfXDd"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HL1lNXE0' \
    --limit '3' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'u9mmy0aU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u3rHLOGl' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "niJzsFrp", "customAttributes": {"Mx4eX7Iy": {}, "wx6VOUg1": {}, "OMA5CnPP": {}}, "groupDescription": "62UA9nbP", "groupIcon": "NKtYLZgS", "groupMaxMember": 2, "groupName": "geaeASYl", "groupRegion": "pT3H28lJ", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "0EAX9AC6", "ruleDetail": [{"ruleAttribute": "MIaIseBR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4688526906955073}, {"ruleAttribute": "UEng6G6U", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1608778814103633}, {"ruleAttribute": "q20ju3PU", "ruleCriteria": "MINIMUM", "ruleValue": 0.764607116751279}]}, {"allowedAction": "iVttZAJi", "ruleDetail": [{"ruleAttribute": "clSIcD2I", "ruleCriteria": "MAXIMUM", "ruleValue": 0.40126585190938224}, {"ruleAttribute": "xbdwpBmk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9613550663429435}, {"ruleAttribute": "fXG01YUQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8006532838909919}]}, {"allowedAction": "c7DIT6mI", "ruleDetail": [{"ruleAttribute": "XfHb2Zfu", "ruleCriteria": "EQUAL", "ruleValue": 0.38108076114955947}, {"ruleAttribute": "ZsiQGksv", "ruleCriteria": "EQUAL", "ruleValue": 0.8074387550070357}, {"ruleAttribute": "sajOycvv", "ruleCriteria": "EQUAL", "ruleValue": 0.9576886082926158}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["eQrlRs5B", "2gs9Tkno", "aVEU6rDw"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'TLJV6brY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "RNcwVvkh", "groupIcon": "AdT6O5E3", "groupName": "4SvGIgvP", "groupRegion": "tPzS9PKY", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'XrS2kqiN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'DHgem69z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "d1iMmhoa", "groupIcon": "Rpghc4Ao", "groupName": "7tRfVY2Q", "groupRegion": "4RS2VUsq", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'xBBospXf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"TSwDYYYf": {}, "hWeT4Q9J": {}, "nnkkkBw2": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'reLbv0ou' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'HEsOHwl4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'votJpmiU' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'cXjJipvU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '0sOP887P' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'A2JHouIq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'L6VX3o2t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"XhIR1igb": {}, "XOGtX9Gi": {}, "Ma51sfNR": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'PboAte0x' \
    --groupId 'JxSj6kbo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "qhwKIIq6", "ruleCriteria": "EQUAL", "ruleValue": 0.5345455363645331}, {"ruleAttribute": "wSeORAou", "ruleCriteria": "MINIMUM", "ruleValue": 0.055013307376431286}, {"ruleAttribute": "XuDXTgea", "ruleCriteria": "EQUAL", "ruleValue": 0.913177253636272}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '20f64SYT' \
    --groupId '6hdJma9Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '5qb0SX1W' \
    --memberRoleId 'dbzNNesU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "1PlJqpoU"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '3zKKHhmv' \
    --memberRoleId 'xi0e3ZZV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "gNzMMyJf"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'Uba6p2rp' \
    --namespace "$AB_NAMESPACE" \
    --userId '6R2Qfdt5' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'VYAfdO93' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ct5eE8On' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'BJvnbBsB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dHqXdOda' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'qq0evl02' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLWyOaKq' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'wPQFpVWu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xQvTyh0u' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'LMNPKR6J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xR6y2Lta' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
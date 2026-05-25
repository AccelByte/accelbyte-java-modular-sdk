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
    --limit '65' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "92yvH7VP", "description": "EoMchWUx", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Q2Ju7zdz", "ruleCriteria": "MINIMUM", "ruleValue": 0.9465094747661846}, {"ruleAttribute": "AD31sgql", "ruleCriteria": "EQUAL", "ruleValue": 0.37880816527729944}, {"ruleAttribute": "5JPKmdrB", "ruleCriteria": "EQUAL", "ruleValue": 0.4131733726185284}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "1HB7t0gp", "ruleCriteria": "EQUAL", "ruleValue": 0.5014106610382505}, {"ruleAttribute": "PrWp5QCA", "ruleCriteria": "MINIMUM", "ruleValue": 0.2797617938552295}, {"ruleAttribute": "EX2PdSBo", "ruleCriteria": "MAXIMUM", "ruleValue": 0.026327756203999964}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Z4GHGqwn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9771529791248319}, {"ruleAttribute": "mtFaHRa7", "ruleCriteria": "MINIMUM", "ruleValue": 0.28126848681894145}, {"ruleAttribute": "GJSVtmlc", "ruleCriteria": "MINIMUM", "ruleValue": 0.5893961435374941}]}], "groupAdminRoleId": "aVs11d3i", "groupMaxMember": 72, "groupMemberRoleId": "pVEihI9O", "name": "aIBN5SZb"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'nfuOkI2a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'Oa2xQvXQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'MvfGufVc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fDqlivTT", "groupMaxMember": 17, "name": "PAGYAKzd"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '7kFKbAbi' \
    --configurationCode 'aetbmMN7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "lj3oPKhq", "ruleCriteria": "MINIMUM", "ruleValue": 0.7223007675641143}, {"ruleAttribute": "rwkZjxmR", "ruleCriteria": "MINIMUM", "ruleValue": 0.2718205242749807}, {"ruleAttribute": "hTEneQ9t", "ruleCriteria": "MINIMUM", "ruleValue": 0.168677303472328}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'KztBbYSO' \
    --configurationCode '2HTJxYd1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '6godhgzZ' \
    --groupName 'kGlbibsI' \
    --groupRegion 'SCQIWxX3' \
    --limit '50' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'aOkCT4XS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'UaRS0Ies' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'e1Hhi5Hy' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '19' \
    --order 'UTqDSRga' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "6ambe9gZ", "memberRolePermissions": [{"action": 59, "resourceName": "QNj2EZH6"}, {"action": 76, "resourceName": "KWHjcoNP"}, {"action": 66, "resourceName": "ZvtPnDFD"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '96CLhOEi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'X9sX9aQh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'i3Ly8T8C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "bngAsSTN"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '4Pbz4k6A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 20, "resourceName": "YhsLEoHh"}, {"action": 49, "resourceName": "p0bW2a83"}, {"action": 2, "resourceName": "6EL6hRx1"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '8a5DJwWn' \
    --groupRegion '3Hy8WvBE' \
    --limit '17' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "V8Hbo5Ih", "customAttributes": {"G5E9fTB0": {}, "dXWyUwuB": {}, "ikXpZqne": {}}, "groupDescription": "wvsOzD7s", "groupIcon": "JNG1cgHp", "groupMaxMember": 60, "groupName": "8ddDdT2X", "groupRegion": "7p9llXl4", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "Bqse6nME", "ruleCriteria": "MINIMUM", "ruleValue": 0.4197420961084394}, {"ruleAttribute": "uElOvmzZ", "ruleCriteria": "EQUAL", "ruleValue": 0.12470251841281454}, {"ruleAttribute": "QuuBD3al", "ruleCriteria": "MINIMUM", "ruleValue": 0.6526028595098895}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "JRcEIOAq", "ruleCriteria": "MINIMUM", "ruleValue": 0.7960135837361578}, {"ruleAttribute": "Abh4qMID", "ruleCriteria": "EQUAL", "ruleValue": 0.016100518223321814}, {"ruleAttribute": "WEIMOEFq", "ruleCriteria": "MINIMUM", "ruleValue": 0.6982827630316355}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "8E70oFux", "ruleCriteria": "MINIMUM", "ruleValue": 0.642745170218322}, {"ruleAttribute": "3GVPBjFK", "ruleCriteria": "MINIMUM", "ruleValue": 0.9971894779540419}, {"ruleAttribute": "bc5BYodf", "ruleCriteria": "MINIMUM", "ruleValue": 0.5645269615635483}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '97m8wucO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'zfDS92Dh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "98GZkWeR", "groupIcon": "kXoI7Cst", "groupName": "7gm5TIQo", "groupRegion": "O7ieAehD", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId '6zGFHZEV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'NRl4HhJC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "S5AGfOdY", "groupIcon": "DAHNRdQp", "groupName": "KGQXuVK0", "groupRegion": "vNZuX03G", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'CqQLeJXm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ccqUt7MH": {}, "AYkBn8Or": {}, "Y3H8ZnQ7": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'keRHl46B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'kwvef0A1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'mcyOciZX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'IaYDuguj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'xa7wfGWW' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '1CVtLasm' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '26' \
    --order 'v8pyZo8Z' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'MtFKEfrO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"O3W0ALlQ": {}, "iCSAuE5c": {}, "eBhbV5rF": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'bFWJjCHq' \
    --groupId 'zyq7Sv2s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "75NHq9iS", "ruleCriteria": "EQUAL", "ruleValue": 0.22868748506292957}, {"ruleAttribute": "fEUdfnc1", "ruleCriteria": "MINIMUM", "ruleValue": 0.15396483243307424}, {"ruleAttribute": "yqd7foag", "ruleCriteria": "EQUAL", "ruleValue": 0.5328695116082095}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'sYRwpoYD' \
    --groupId 'LbU75hU2' \
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
    --limit '3' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '89Ul07pi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Fn2MnZgq"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '8Qhx08qC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Ud3CmLGy"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0JWTWu0S' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8tySSrkW' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gPs3IBue' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8D2Iaco' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xJWdVjCY' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["wRVWBuye", "1UTdBA40", "3mSeUwvV"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OOwJmFSc' \
    --limit '28' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'og0mjQK6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aL1WStq4' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Y9lBGNog", "customAttributes": {"Pr5L5Kd9": {}, "ufpAMkmi": {}, "ON0Iyltr": {}}, "groupDescription": "EhWY6fDL", "groupIcon": "o8kMISpJ", "groupMaxMember": 5, "groupName": "k3QT8yGb", "groupRegion": "JR1alBsV", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "rbOjcCCb", "ruleCriteria": "EQUAL", "ruleValue": 0.6565860151463359}, {"ruleAttribute": "gINBP5L9", "ruleCriteria": "MINIMUM", "ruleValue": 0.9354152300113474}, {"ruleAttribute": "6Svznt0Y", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9777542517539978}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "zxtVqhdR", "ruleCriteria": "EQUAL", "ruleValue": 0.8152943559667725}, {"ruleAttribute": "keqTna9g", "ruleCriteria": "EQUAL", "ruleValue": 0.18767139189926696}, {"ruleAttribute": "yKLRlHKz", "ruleCriteria": "EQUAL", "ruleValue": 0.12757561342553358}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "NYMwioCC", "ruleCriteria": "MINIMUM", "ruleValue": 0.20337609508857912}, {"ruleAttribute": "9JvuIKy5", "ruleCriteria": "EQUAL", "ruleValue": 0.02319254199406129}, {"ruleAttribute": "xLyyvhZq", "ruleCriteria": "MINIMUM", "ruleValue": 0.7440699817944629}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["7T9ILrHV", "qNit09T0", "nd3OHoUv"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'swn5uRml' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "1N40V6G8", "groupIcon": "tsXdthFj", "groupName": "6VJcfbnh", "groupRegion": "tTlJeEz8", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'B2a5McGY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'u8y7sRvu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "kS0eVYMn", "groupIcon": "Mm8usFJA", "groupName": "gJRtfd5s", "groupRegion": "ytoXiREP", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId '9LQir720' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"5Z5HQ30K": {}, "86VWoy7U": {}, "9So456Ac": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'Qw1m3dsZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'iNaIDgvY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 't2AqvYFz' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'lH13BcxT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'tXKu3GI7' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'D1nHdYbC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'NWcFEM0K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"4dsxCOjT": {}, "3BUCBmiy": {}, "TBeD0hhK": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'cYt2ntHi' \
    --groupId '04LffH9I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "hSWqPhf2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8358007669716409}, {"ruleAttribute": "8uHtYsfH", "ruleCriteria": "MINIMUM", "ruleValue": 0.8404328894802596}, {"ruleAttribute": "gUc0ySxC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7664964099859801}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'VSOli2KB' \
    --groupId 'jSEfGwHg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '5rZzXe8g' \
    --memberRoleId 'Ke8h8NkT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "rxIY8CQq"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'uw2pjEWz' \
    --memberRoleId 'YdKTgoAa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RvO3UvA1"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'RvEj6zJX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oiMsYBkJ' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'lOhgpQ1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KzqtlosV' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'iryCBZ3v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhSpZgLs' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'yI0l0ykq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IjMsE04W' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'HH1iFn7u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxpOmwrb' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId '7KSPjqb0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ueQoKqQ1' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
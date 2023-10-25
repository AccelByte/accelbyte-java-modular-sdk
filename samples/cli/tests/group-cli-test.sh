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
    --limit '97' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "juL9uoqt", "description": "XiRv0xn5", "globalRules": [{"allowedAction": "IaSuEE8X", "ruleDetail": [{"ruleAttribute": "hOysgkDy", "ruleCriteria": "EQUAL", "ruleValue": 0.5718708783861549}, {"ruleAttribute": "aUfhmiTN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23366777753455636}, {"ruleAttribute": "TNORDDfI", "ruleCriteria": "MINIMUM", "ruleValue": 0.22023615041876632}]}, {"allowedAction": "LL9Ci4gn", "ruleDetail": [{"ruleAttribute": "ouCdyclx", "ruleCriteria": "MINIMUM", "ruleValue": 0.8972510235982251}, {"ruleAttribute": "UHNdjCfW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.13572338966294795}, {"ruleAttribute": "LnGo20i8", "ruleCriteria": "MINIMUM", "ruleValue": 0.22848715729393998}]}, {"allowedAction": "oFO20iQ7", "ruleDetail": [{"ruleAttribute": "PeNIoy08", "ruleCriteria": "MINIMUM", "ruleValue": 0.8041871797722248}, {"ruleAttribute": "jBIUFLWD", "ruleCriteria": "MINIMUM", "ruleValue": 0.9206630964926408}, {"ruleAttribute": "dtAQdHnk", "ruleCriteria": "MINIMUM", "ruleValue": 0.024405488233308903}]}], "groupAdminRoleId": "rjLpmAgV", "groupMaxMember": 69, "groupMemberRoleId": "0D7ieZGt", "name": "zq81PfBf"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '7UMDQ9Z3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '2BVfc5EH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'wPc8zaGp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "awp7jko2", "groupMaxMember": 70, "name": "oTEGekbE"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '3FEjyxdI' \
    --configurationCode 'KN7rRBHV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "thtvOwYJ", "ruleCriteria": "EQUAL", "ruleValue": 0.6609002099772869}, {"ruleAttribute": "UIKsD5JL", "ruleCriteria": "EQUAL", "ruleValue": 0.8834499184338026}, {"ruleAttribute": "6vFJdL3Z", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7572067584739928}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'YDVf7DCg' \
    --configurationCode 'gxaZ8Gjn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'M1iu4mto' \
    --groupName 'eRGvd1ZV' \
    --groupRegion 'AXRSbKTH' \
    --limit '34' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'JLWWfCkn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'QytAkvyd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'IUEtePn4' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '27' \
    --order 'a7iorfB0' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "b3o3ycs9", "memberRolePermissions": [{"action": 84, "resourceName": "m6ZkfXNL"}, {"action": 4, "resourceName": "HySFVRuW"}, {"action": 16, "resourceName": "PeFJ641A"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'RnKzhPUY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '28vnlPaB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'R9Y8yNcF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "JGx69tSH"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'ipBPyywm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 36, "resourceName": "QUmt5U1Y"}, {"action": 7, "resourceName": "beDjJrYL"}, {"action": 91, "resourceName": "RrdZrxWq"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'vJygtVB7' \
    --groupRegion 'jawNxrKY' \
    --limit '83' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "UWfAx24G", "customAttributes": {"0G1lCFcI": {}, "WCuSQZHE": {}, "1P6IfSug": {}}, "groupDescription": "uo4KfhFn", "groupIcon": "vjDEu2WQ", "groupMaxMember": 3, "groupName": "gqe1Jsyc", "groupRegion": "K9RIHx6S", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "TlRwqKEx", "ruleDetail": [{"ruleAttribute": "YcvirseD", "ruleCriteria": "MINIMUM", "ruleValue": 0.9178381930714692}, {"ruleAttribute": "AjoTvLYz", "ruleCriteria": "EQUAL", "ruleValue": 0.25629038403085136}, {"ruleAttribute": "AOUwl4br", "ruleCriteria": "MAXIMUM", "ruleValue": 0.13850332337175064}]}, {"allowedAction": "JPzs1Opo", "ruleDetail": [{"ruleAttribute": "JyXKPUof", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9266972680507511}, {"ruleAttribute": "mWnyeP3b", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6328087712919015}, {"ruleAttribute": "32yw9rlX", "ruleCriteria": "EQUAL", "ruleValue": 0.7141789298915006}]}, {"allowedAction": "Bh1rc5Eq", "ruleDetail": [{"ruleAttribute": "gIePuRBo", "ruleCriteria": "EQUAL", "ruleValue": 0.9961150365466256}, {"ruleAttribute": "1ftCYojG", "ruleCriteria": "MINIMUM", "ruleValue": 0.3772735046892042}, {"ruleAttribute": "gxyDZVF3", "ruleCriteria": "EQUAL", "ruleValue": 0.3994513400543176}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'KphnFHQQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'hTbj5sXk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Nx9hCTIT", "groupIcon": "UkvNseQK", "groupName": "kqJhQTuE", "groupRegion": "yIX1i5W1", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'fV6HpE0O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'pvCugpKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ODdEM4BN", "groupIcon": "qSO7lKAw", "groupName": "fPJJiRbu", "groupRegion": "ARltEimq", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'gZ6qOdQG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CcfqIJQE": {}, "nU4l7cDR": {}, "dbFPgW5z": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'geU7dV2L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'wm5xqiUy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'NZ5Q2DuA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'aKSdWLfP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'pgyEGnUD' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'fZ48Gv9r' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '97' \
    --order 'E34yJJhl' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'rS7Ea62B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"7Rv29oKo": {}, "ZEzyUtBy": {}, "jGuw4q23": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'C2Bw55mG' \
    --groupId '91HpKqpY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "v3xgNxSs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.375796727285147}, {"ruleAttribute": "ITrBIa6h", "ruleCriteria": "EQUAL", "ruleValue": 0.5602057154255545}, {"ruleAttribute": "sAkrYlRt", "ruleCriteria": "MINIMUM", "ruleValue": 0.945387986950506}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '6u62TsqT' \
    --groupId '2X9mQgjp' \
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
    --limit '100' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'WzDhnrDV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "JBgXtnj1"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Z1BYzUhI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "t2ODbFby"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4mLmDagM' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RXEapfQc' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9QUA8fO' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SYa4KV9l' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oLQ5MPrR' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["fkBkzd4b", "HQDvqbFm", "0N5kVT47"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogN6Kjgq' \
    --limit '61' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '29aDzSn0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MAj4yVue' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "i8gvyyHt", "customAttributes": {"eyWNhrc4": {}, "rwflkqx3": {}, "4OGelZIa": {}}, "groupDescription": "CrrhUihC", "groupIcon": "k2nQ0gom", "groupMaxMember": 24, "groupName": "Ac04L9eC", "groupRegion": "yoaVELj2", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "N5OMcnSA", "ruleDetail": [{"ruleAttribute": "XCiGl54a", "ruleCriteria": "MINIMUM", "ruleValue": 0.9442868000364721}, {"ruleAttribute": "mgtU5fGd", "ruleCriteria": "EQUAL", "ruleValue": 0.44715484163574093}, {"ruleAttribute": "ASZV8t1Z", "ruleCriteria": "EQUAL", "ruleValue": 0.31524419427501005}]}, {"allowedAction": "X8SfKj9T", "ruleDetail": [{"ruleAttribute": "65Nj35PM", "ruleCriteria": "MINIMUM", "ruleValue": 0.8495407283115921}, {"ruleAttribute": "K5boOVT9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.01641813895359734}, {"ruleAttribute": "nB1Kv65b", "ruleCriteria": "EQUAL", "ruleValue": 0.33568548810488363}]}, {"allowedAction": "BBYjtjN5", "ruleDetail": [{"ruleAttribute": "kz3QMW8n", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8434104923202627}, {"ruleAttribute": "VFJzLkzx", "ruleCriteria": "EQUAL", "ruleValue": 0.7584448472410256}, {"ruleAttribute": "gAtXKUGi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.07751553368044273}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["yCySt3u8", "YIbGT6V4", "unomGe9t"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'HcIaH7wR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "yaf1FEr4", "groupIcon": "maKvtnke", "groupName": "hLGcvPsO", "groupRegion": "PtGnCqAP", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'CZDDWXQe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'QqpIC7AJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "LkGhwatl", "groupIcon": "Q03LgiaH", "groupName": "Z1c0UUA7", "groupRegion": "c208ms6v", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'qKniVZPD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"j28tFQMv": {}, "LFLhuJTf": {}, "LwmNQwyR": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'Dwpl6tXJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'H1pvk9Xl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'WAN9xKHv' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'VwmgD7rp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'IC4txLXj' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'GRdOCcZQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '1KKrW7pO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"qCIRvrXk": {}, "4SwU3uYy": {}, "aqbyadcZ": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'FVIBlLhL' \
    --groupId 'ix19FKi7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "zAzJE9uQ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8828614450042233}, {"ruleAttribute": "0tli9rd3", "ruleCriteria": "EQUAL", "ruleValue": 0.9451316542120178}, {"ruleAttribute": "Rvg6lE6n", "ruleCriteria": "EQUAL", "ruleValue": 0.6266150822919484}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'ii9iOQze' \
    --groupId 'pD7veeKX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'eOtydId9' \
    --memberRoleId 'T6jwYrQw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "dnYfzfv9"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '8N4QnnOI' \
    --memberRoleId 'XVIrIe62' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "wiVxohXk"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'U3Ogf9Le' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAGoc3vO' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'qwCqEs7V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'utA3Mn2W' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'RoDBcUe5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lkmRBFQz' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 've9tniI9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p5NwR6tm' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'OhaT6iuO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZOmqiYS' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'DOJ0HNvt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nHAGnV7w' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
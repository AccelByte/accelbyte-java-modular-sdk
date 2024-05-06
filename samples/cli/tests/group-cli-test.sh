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
echo "1..82"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 IndexHandler
./ng net.accelbyte.sdk.cli.Main group indexHandler \
    > test.out 2>&1
eval_tap $? 2 'IndexHandler' test.out

#- 3 BlockHandler
./ng net.accelbyte.sdk.cli.Main group blockHandler \
    > test.out 2>&1
eval_tap $? 3 'BlockHandler' test.out

#- 4 CmdlineHandler
./ng net.accelbyte.sdk.cli.Main group cmdlineHandler \
    > test.out 2>&1
eval_tap $? 4 'CmdlineHandler' test.out

#- 5 GoroutineHandler
./ng net.accelbyte.sdk.cli.Main group goroutineHandler \
    > test.out 2>&1
eval_tap $? 5 'GoroutineHandler' test.out

#- 6 HeapHandler
./ng net.accelbyte.sdk.cli.Main group heapHandler \
    > test.out 2>&1
eval_tap $? 6 'HeapHandler' test.out

#- 7 Profile
./ng net.accelbyte.sdk.cli.Main group profile \
    > test.out 2>&1
eval_tap $? 7 'Profile' test.out

#- 8 SymbolHandler
./ng net.accelbyte.sdk.cli.Main group symbolHandler \
    > test.out 2>&1
eval_tap $? 8 'SymbolHandler' test.out

#- 9 ThreadcreateHandler
./ng net.accelbyte.sdk.cli.Main group threadcreateHandler \
    > test.out 2>&1
eval_tap $? 9 'ThreadcreateHandler' test.out

#- 10 ListGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 10 'ListGroupConfigurationAdminV1' test.out

#- 11 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "apDYP7FY", "description": "861kz8vq", "globalRules": [{"allowedAction": "FdFEr9Xf", "ruleDetail": [{"ruleAttribute": "AksTMUa8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23234921558883193}, {"ruleAttribute": "SKjxFUir", "ruleCriteria": "MINIMUM", "ruleValue": 0.8932894963764134}, {"ruleAttribute": "tTu9ZxPq", "ruleCriteria": "MINIMUM", "ruleValue": 0.944840176544129}]}, {"allowedAction": "ujaqYRnE", "ruleDetail": [{"ruleAttribute": "nGvNXWok", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9710023033002404}, {"ruleAttribute": "aIBm5nLg", "ruleCriteria": "EQUAL", "ruleValue": 0.6360287988252405}, {"ruleAttribute": "EfezhseJ", "ruleCriteria": "EQUAL", "ruleValue": 0.48857290816861576}]}, {"allowedAction": "8qdZtwaE", "ruleDetail": [{"ruleAttribute": "3yjTemic", "ruleCriteria": "EQUAL", "ruleValue": 0.7431939896487205}, {"ruleAttribute": "KkQ1Dvr0", "ruleCriteria": "EQUAL", "ruleValue": 0.0027704553829142053}, {"ruleAttribute": "6SKIWo3Q", "ruleCriteria": "MAXIMUM", "ruleValue": 0.27538909020347013}]}], "groupAdminRoleId": "vIVsF3Fj", "groupMaxMember": 58, "groupMemberRoleId": "d3Bz1h6X", "name": "YICsl0Op"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateGroupConfigurationAdminV1' test.out

#- 12 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'InitiateGroupConfigurationAdminV1' test.out

#- 13 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'zP1luZCM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetGroupConfigurationAdminV1' test.out

#- 14 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'wXa3DqiW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteGroupConfigurationV1' test.out

#- 15 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'A2IRgMKA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "IuSZOO6l", "groupMaxMember": 41, "name": "vlbLkev3"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateGroupConfigurationAdminV1' test.out

#- 16 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'WgKK8w1n' \
    --configurationCode '9v9qMUW7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "GPMdtIaf", "ruleCriteria": "MAXIMUM", "ruleValue": 0.46853937173832294}, {"ruleAttribute": "Jt3bqHZf", "ruleCriteria": "MINIMUM", "ruleValue": 0.23438466827713322}, {"ruleAttribute": "W7MVPj44", "ruleCriteria": "MINIMUM", "ruleValue": 0.7691107168512562}]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 17 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '9nBwnwPo' \
    --configurationCode '2gQuMnkt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 18 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'YGDRe4Gn' \
    --groupName 'Pc7UjXoB' \
    --groupRegion 'S9UrRkP3' \
    --limit '94' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 18 'GetGroupListAdminV1' test.out

#- 19 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'OKvFgfKi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetSingleGroupAdminV1' test.out

#- 20 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'unmrPOex' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteGroupAdminV1' test.out

#- 21 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 't6PwRAMp' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '18' \
    --order 'dVmdRHSY' \
    > test.out 2>&1
eval_tap $? 21 'GetGroupMembersListAdminV1' test.out

#- 22 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 22 'GetMemberRolesListAdminV1' test.out

#- 23 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "FEP8wDjt", "memberRolePermissions": [{"action": 6, "resourceName": "yirgAWMC"}, {"action": 59, "resourceName": "Vpnrsctf"}, {"action": 39, "resourceName": "ljnXQdWE"}]}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMemberRoleAdminV1' test.out

#- 24 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'u2JzUQyC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetSingleMemberRoleAdminV1' test.out

#- 25 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'k0LpFLHA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteMemberRoleAdminV1' test.out

#- 26 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'IS1Vq1MX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "QBUCRTKU"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateMemberRoleAdminV1' test.out

#- 27 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '2erd9fFn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 67, "resourceName": "BI84epjV"}, {"action": 33, "resourceName": "9xqApgK7"}, {"action": 52, "resourceName": "ue5IiLIY"}]}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateMemberRolePermissionAdminV1' test.out

#- 28 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '1j18Dz2Y' \
    --groupRegion 'LNKtEhWh' \
    --limit '5' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 28 'GetGroupListPublicV1' test.out

#- 29 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "vqgt0h5H", "customAttributes": {"8PZ8EyMR": {}, "ZFRJXzol": {}, "dYeqp9DE": {}}, "groupDescription": "GWV7XIi0", "groupIcon": "wxKZj62c", "groupMaxMember": 57, "groupName": "1eBXNtej", "groupRegion": "Ijj0dJ2Y", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "fVPVT5mk", "ruleDetail": [{"ruleAttribute": "aMkcUmvP", "ruleCriteria": "MINIMUM", "ruleValue": 0.9778178974605982}, {"ruleAttribute": "XC7qmgCd", "ruleCriteria": "MINIMUM", "ruleValue": 0.2913463748083237}, {"ruleAttribute": "losKC16M", "ruleCriteria": "MINIMUM", "ruleValue": 0.713481035964238}]}, {"allowedAction": "3BegUkGp", "ruleDetail": [{"ruleAttribute": "AhJYMron", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7353835878121283}, {"ruleAttribute": "MVe3G9AU", "ruleCriteria": "MINIMUM", "ruleValue": 0.33524599408340294}, {"ruleAttribute": "E7zS6HwE", "ruleCriteria": "MINIMUM", "ruleValue": 0.2900915244266582}]}, {"allowedAction": "QEVZdTfl", "ruleDetail": [{"ruleAttribute": "HD0OUR0N", "ruleCriteria": "EQUAL", "ruleValue": 0.8460726415547482}, {"ruleAttribute": "8js10hOs", "ruleCriteria": "EQUAL", "ruleValue": 0.7826960157313324}, {"ruleAttribute": "9OJG09Wr", "ruleCriteria": "MINIMUM", "ruleValue": 0.7386326232339853}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateNewGroupPublicV1' test.out

#- 30 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'CcOO0CBo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetSingleGroupPublicV1' test.out

#- 31 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'vOnuEXy1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ko6Mtiz3", "groupIcon": "hPA2T0Rp", "groupName": "ozonp0Dc", "groupRegion": "Zd7vHv18", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateSingleGroupV1' test.out

#- 32 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'VxSFjIGu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteGroupPublicV1' test.out

#- 33 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'WA8NNltY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "INY8R7DY", "groupIcon": "QNhqcV9J", "groupName": "92T0xMDZ", "groupRegion": "6oRdHaMx", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdatePatchSingleGroupPublicV1' test.out

#- 34 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'xqQPVBU2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"pWWlFiCY": {}, "sgOs76JR": {}, "ZFArMFLj": {}}}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupCustomAttributesPublicV1' test.out

#- 35 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'ik1zwMAe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AcceptGroupInvitationPublicV1' test.out

#- 36 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'HYjCjzh3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RejectGroupInvitationPublicV1' test.out

#- 37 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'Ic4nNDGz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'JoinGroupV1' test.out

#- 38 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '9IY61PPz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'CancelGroupJoinRequestV1' test.out

#- 39 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'IVF5Poqu' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 39 'GetGroupJoinRequestPublicV1' test.out

#- 40 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'sLiAzC4E' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '86' \
    --order 'V7pUPFR9' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupMembersListPublicV1' test.out

#- 41 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'Ri4oTA6j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"drOTamaw": {}, "3kHwmsNH": {}, "9ff5KIOQ": {}}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateGroupCustomRulePublicV1' test.out

#- 42 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'SCpXisBA' \
    --groupId 'xu8sXkoR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "EkawQKBC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6556632441595153}, {"ruleAttribute": "EMk8Y6yl", "ruleCriteria": "MINIMUM", "ruleValue": 0.42501839381307127}, {"ruleAttribute": "HPC65eSX", "ruleCriteria": "MINIMUM", "ruleValue": 0.45559392803579146}]}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGroupPredefinedRulePublicV1' test.out

#- 43 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'GS8u5jaz' \
    --groupId 'btET8eMB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'DeleteGroupPredefinedRulePublicV1' test.out

#- 44 LeaveGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'LeaveGroupPublicV1' test.out

#- 45 GetMemberRolesListPublicV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 45 'GetMemberRolesListPublicV1' test.out

#- 46 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'olhrJkfq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "tNLWNkpY"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateMemberRolePublicV1' test.out

#- 47 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'a5o2muFZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "a3msrJTq"}' \
    > test.out 2>&1
eval_tap $? 47 'DeleteMemberRolePublicV1' test.out

#- 48 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 48 'GetGroupInvitationRequestPublicV1' test.out

#- 49 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '61UJJxGi' \
    > test.out 2>&1
eval_tap $? 49 'GetUserGroupInformationPublicV1' test.out

#- 50 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsXhMPVp' \
    > test.out 2>&1
eval_tap $? 50 'InviteGroupPublicV1' test.out

#- 51 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GuAn9qb2' \
    > test.out 2>&1
eval_tap $? 51 'AcceptGroupJoinRequestPublicV1' test.out

#- 52 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXHKkXjR' \
    > test.out 2>&1
eval_tap $? 52 'RejectGroupJoinRequestPublicV1' test.out

#- 53 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vgJS8szB' \
    > test.out 2>&1
eval_tap $? 53 'KickGroupMemberPublicV1' test.out

#- 54 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["lBiRnWsc", "YDZwgD1u", "Z9NBQGho"]}' \
    > test.out 2>&1
eval_tap $? 54 'GetListGroupByIDsAdminV2' test.out

#- 55 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JuBxpxDj' \
    --limit '20' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 55 'GetUserJoinedGroupInformationPublicV2' test.out

#- 56 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'c3Mz48RM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sxwDl9z1' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetUserGroupStatusInformationV2' test.out

#- 57 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "ZOC57j95", "customAttributes": {"w7L1VGPD": {}, "Tioc7V9E": {}, "tUGQKVSn": {}}, "groupDescription": "8cvu5qv0", "groupIcon": "L1hlKGxF", "groupMaxMember": 49, "groupName": "OsO2wTWk", "groupRegion": "bLvYUhyj", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "rdIk9CcX", "ruleDetail": [{"ruleAttribute": "ALsqdG1b", "ruleCriteria": "MAXIMUM", "ruleValue": 0.30801285367386555}, {"ruleAttribute": "yKdggQH7", "ruleCriteria": "MINIMUM", "ruleValue": 0.9582841944766013}, {"ruleAttribute": "AxmiJqkh", "ruleCriteria": "EQUAL", "ruleValue": 0.9914241304606493}]}, {"allowedAction": "LZJ4wS1e", "ruleDetail": [{"ruleAttribute": "GPzPAXjf", "ruleCriteria": "MINIMUM", "ruleValue": 0.4893931220855898}, {"ruleAttribute": "t0glJwVb", "ruleCriteria": "MAXIMUM", "ruleValue": 0.44388043800145593}, {"ruleAttribute": "J6xEstF2", "ruleCriteria": "MINIMUM", "ruleValue": 0.7906455134448809}]}, {"allowedAction": "xsGEtdJL", "ruleDetail": [{"ruleAttribute": "cSWCQqaJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8972388253932005}, {"ruleAttribute": "ErnYDKyc", "ruleCriteria": "EQUAL", "ruleValue": 0.6505789058079853}, {"ruleAttribute": "4CmNQKYt", "ruleCriteria": "MAXIMUM", "ruleValue": 0.786708043328535}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 57 'CreateNewGroupPublicV2' test.out

#- 58 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["XMvHBevG", "7XETI3Xz", "hdZvBPPF"]}' \
    > test.out 2>&1
eval_tap $? 58 'GetListGroupByIDsV2' test.out

#- 59 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'DjhBides' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "IRkR9MOq", "groupIcon": "WtMeykoK", "groupName": "uA6Se9KF", "groupRegion": "oLpVC7tP", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePutSingleGroupPublicV2' test.out

#- 60 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'oG7Sl81J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteGroupPublicV2' test.out

#- 61 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'U59ndmwu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "DKOBWrcT", "groupIcon": "FsMYXnGi", "groupName": "58tQrcoF", "groupRegion": "vBeTXe96", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePatchSingleGroupPublicV2' test.out

#- 62 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'DRMw8mi4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"kkHi1Cam": {}, "MZo8LKxf": {}, "I4ffDqmX": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupCustomAttributesPublicV2' test.out

#- 63 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'gHs0Pn1Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AcceptGroupInvitationPublicV2' test.out

#- 64 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '9H4V3YYt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'RejectGroupInvitationPublicV2' test.out

#- 65 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'M4e080Rz' \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 65 'GetGroupInviteRequestPublicV2' test.out

#- 66 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'BsQwwPul' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'JoinGroupV2' test.out

#- 67 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'JHcLC9rU' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 67 'GetGroupJoinRequestPublicV2' test.out

#- 68 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Bqkpptop' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'LeaveGroupPublicV2' test.out

#- 69 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '77MRlb4b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"JNfFdFHI": {}, "o9wSmTpc": {}, "3HDUBS5F": {}}}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateGroupCustomRulePublicV2' test.out

#- 70 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'rFgeTibU' \
    --groupId 'Mod8QiRF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "xO8YcuwU", "ruleCriteria": "MINIMUM", "ruleValue": 0.03469939446170489}, {"ruleAttribute": "Iw9fAL6a", "ruleCriteria": "EQUAL", "ruleValue": 0.7740893818019327}, {"ruleAttribute": "9yL3mdDD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5836155043942035}]}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateGroupPredefinedRulePublicV2' test.out

#- 71 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'D9YNgW5k' \
    --groupId '2zfO5OoY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteGroupPredefinedRulePublicV2' test.out

#- 72 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 72 'GetMemberRolesListPublicV2' test.out

#- 73 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'SeGgN60f' \
    --memberRoleId '5Bf58Qgs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "iVaZDNhD"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateMemberRolePublicV2' test.out

#- 74 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'taRqh67O' \
    --memberRoleId 'Iye22APa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "zxWy5fqt"}' \
    > test.out 2>&1
eval_tap $? 74 'DeleteMemberRolePublicV2' test.out

#- 75 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 75 'GetUserGroupInformationPublicV2' test.out

#- 76 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 76 'GetMyGroupJoinRequestV2' test.out

#- 77 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'tIEfz8oQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XGuiAoWU' \
    > test.out 2>&1
eval_tap $? 77 'InviteGroupPublicV2' test.out

#- 78 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'DheQMbid' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZApuUfql' \
    > test.out 2>&1
eval_tap $? 78 'CancelInvitationGroupMemberV2' test.out

#- 79 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'tJkv4ah1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wudk3ts2' \
    > test.out 2>&1
eval_tap $? 79 'AcceptGroupJoinRequestPublicV2' test.out

#- 80 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'ekbL44OB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IGJHCqU5' \
    > test.out 2>&1
eval_tap $? 80 'RejectGroupJoinRequestPublicV2' test.out

#- 81 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'Hmau5fGK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NeikVL2B' \
    > test.out 2>&1
eval_tap $? 81 'KickGroupMemberPublicV2' test.out

#- 82 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'hA3aJcic' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkohGFbm' \
    > test.out 2>&1
eval_tap $? 82 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
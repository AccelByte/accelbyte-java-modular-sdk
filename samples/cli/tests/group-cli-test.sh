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
    --limit '39' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 10 'ListGroupConfigurationAdminV1' test.out

#- 11 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "qpYuaIqQ", "description": "Ur2pDBE8", "globalRules": [{"allowedAction": "oKJssM9K", "ruleDetail": [{"ruleAttribute": "Nvc7FPgv", "ruleCriteria": "MINIMUM", "ruleValue": 0.44615222657261633}, {"ruleAttribute": "k671If5z", "ruleCriteria": "MAXIMUM", "ruleValue": 0.18357549553485364}, {"ruleAttribute": "TrE73XDB", "ruleCriteria": "MINIMUM", "ruleValue": 0.3318750703475756}]}, {"allowedAction": "Y0OaJYRN", "ruleDetail": [{"ruleAttribute": "DaBcxFsq", "ruleCriteria": "MINIMUM", "ruleValue": 0.38112156204868786}, {"ruleAttribute": "z0Z8w1Ci", "ruleCriteria": "EQUAL", "ruleValue": 0.3583189930739551}, {"ruleAttribute": "wONMxIdP", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11940820867260993}]}, {"allowedAction": "5BsdBJWs", "ruleDetail": [{"ruleAttribute": "jEj5AY5o", "ruleCriteria": "EQUAL", "ruleValue": 0.7008524421156458}, {"ruleAttribute": "Y26ZeWLA", "ruleCriteria": "EQUAL", "ruleValue": 0.9047594918237685}, {"ruleAttribute": "QKja5wsX", "ruleCriteria": "EQUAL", "ruleValue": 0.4369833150480653}]}], "groupAdminRoleId": "8kSc4IJ6", "groupMaxMember": 47, "groupMemberRoleId": "z50j0jmj", "name": "K3n1kftl"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateGroupConfigurationAdminV1' test.out

#- 12 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'InitiateGroupConfigurationAdminV1' test.out

#- 13 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'Akt07lqG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetGroupConfigurationAdminV1' test.out

#- 14 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'dC3tAzYT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteGroupConfigurationV1' test.out

#- 15 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'rcJXAbzG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Mx1b3hZT", "groupMaxMember": 13, "name": "czE28pu3"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateGroupConfigurationAdminV1' test.out

#- 16 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'HBj8BByl' \
    --configurationCode 'LQdE8O02' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "aotSzrjw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6003956073550472}, {"ruleAttribute": "1kYUAVI0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.20012131445097725}, {"ruleAttribute": "Di4SVujZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2857486068635279}]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 17 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'yuVHU2JP' \
    --configurationCode 'nHfpTkcp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 18 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'I08LLSbe' \
    --groupName 'A0mASRDd' \
    --groupRegion 'vkLMx2Vo' \
    --limit '91' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 18 'GetGroupListAdminV1' test.out

#- 19 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'sRNXoLtD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetSingleGroupAdminV1' test.out

#- 20 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 's2TQwSta' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteGroupAdminV1' test.out

#- 21 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'Vl42tMwV' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '4' \
    --order '2ygRGfHl' \
    > test.out 2>&1
eval_tap $? 21 'GetGroupMembersListAdminV1' test.out

#- 22 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 22 'GetMemberRolesListAdminV1' test.out

#- 23 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "OZuY6thy", "memberRolePermissions": [{"action": 85, "resourceName": "MzKiYDSy"}, {"action": 86, "resourceName": "tEhYmXK3"}, {"action": 31, "resourceName": "bXOV9if6"}]}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMemberRoleAdminV1' test.out

#- 24 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'rXxIezxt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetSingleMemberRoleAdminV1' test.out

#- 25 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'CpWN1Nju' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteMemberRoleAdminV1' test.out

#- 26 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'CW9VXa81' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "qAWtXEGc"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateMemberRoleAdminV1' test.out

#- 27 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '5PlvLXgs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 97, "resourceName": "2af1F6PJ"}, {"action": 90, "resourceName": "ImvvxIwY"}, {"action": 28, "resourceName": "mP8nc8xn"}]}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateMemberRolePermissionAdminV1' test.out

#- 28 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'omJBZ7ii' \
    --groupRegion 'gY6t9znf' \
    --limit '81' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 28 'GetGroupListPublicV1' test.out

#- 29 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Skoxul9a", "customAttributes": {"885Oz9Vg": {}, "sJo17i6r": {}, "86XRGNaM": {}}, "groupDescription": "xtgxekiR", "groupIcon": "VygHufeu", "groupMaxMember": 40, "groupName": "YEutYZBL", "groupRegion": "QK9bEd4W", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "iKdvEEum", "ruleDetail": [{"ruleAttribute": "nuIQP2sd", "ruleCriteria": "EQUAL", "ruleValue": 0.24946689682219647}, {"ruleAttribute": "uWenpAEe", "ruleCriteria": "MINIMUM", "ruleValue": 0.9139715917272947}, {"ruleAttribute": "V8EkRraj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9648643699125552}]}, {"allowedAction": "Opl4RDpz", "ruleDetail": [{"ruleAttribute": "XGO5dhHX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.035801024101814405}, {"ruleAttribute": "WoOVrJix", "ruleCriteria": "EQUAL", "ruleValue": 0.9377911147455296}, {"ruleAttribute": "05sF8r59", "ruleCriteria": "MAXIMUM", "ruleValue": 0.83275179889156}]}, {"allowedAction": "f1BYIQtj", "ruleDetail": [{"ruleAttribute": "cYDU9d2q", "ruleCriteria": "MINIMUM", "ruleValue": 0.04792176138744786}, {"ruleAttribute": "tG2fwGti", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9332948710912353}, {"ruleAttribute": "HlXmrLel", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9118053313469944}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateNewGroupPublicV1' test.out

#- 30 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'WBAefGSz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetSingleGroupPublicV1' test.out

#- 31 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '0Q7Iq338' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "7tYExgfa", "groupIcon": "bts9719k", "groupName": "rok2fOER", "groupRegion": "YLGEwbGp", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateSingleGroupV1' test.out

#- 32 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'w2QEKlsj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteGroupPublicV1' test.out

#- 33 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'dCfOrfu9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Si9WelSg", "groupIcon": "vFtRiUga", "groupName": "ZekZ9fOW", "groupRegion": "LJQlHxG6", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdatePatchSingleGroupPublicV1' test.out

#- 34 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'xsNaHsT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CET8XGwB": {}, "WEqUTrLy": {}, "lKJid7jQ": {}}}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupCustomAttributesPublicV1' test.out

#- 35 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'sB2vLhMJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AcceptGroupInvitationPublicV1' test.out

#- 36 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'pkneakIX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RejectGroupInvitationPublicV1' test.out

#- 37 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'tkUADKar' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'JoinGroupV1' test.out

#- 38 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'CvOQ5Ogd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'CancelGroupJoinRequestV1' test.out

#- 39 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'MBUUWgSs' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 39 'GetGroupJoinRequestPublicV1' test.out

#- 40 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'M0ZKtm8n' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '7' \
    --order 'Q2kvEIME' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupMembersListPublicV1' test.out

#- 41 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '6eGGLHWV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"5Zup12ko": {}, "NabZmZAY": {}, "hBCBmnOg": {}}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateGroupCustomRulePublicV1' test.out

#- 42 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'qDRFtmFE' \
    --groupId '0SMROr09' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "mmmn0pvt", "ruleCriteria": "EQUAL", "ruleValue": 0.8897666519498796}, {"ruleAttribute": "bRzM1n3A", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7018683031423624}, {"ruleAttribute": "oTFw7yrQ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6177140985331692}]}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGroupPredefinedRulePublicV1' test.out

#- 43 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'fBZFKfzW' \
    --groupId 'jyAF6dwz' \
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
    --limit '77' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 45 'GetMemberRolesListPublicV1' test.out

#- 46 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'RmBFmExd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "JKCmRyAd"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateMemberRolePublicV1' test.out

#- 47 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Z1A87bkE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "AUfUH8uP"}' \
    > test.out 2>&1
eval_tap $? 47 'DeleteMemberRolePublicV1' test.out

#- 48 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 48 'GetGroupInvitationRequestPublicV1' test.out

#- 49 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wubn8q2I' \
    > test.out 2>&1
eval_tap $? 49 'GetUserGroupInformationPublicV1' test.out

#- 50 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '959LXkYf' \
    > test.out 2>&1
eval_tap $? 50 'InviteGroupPublicV1' test.out

#- 51 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qXYymdit' \
    > test.out 2>&1
eval_tap $? 51 'AcceptGroupJoinRequestPublicV1' test.out

#- 52 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5vDUiPSj' \
    > test.out 2>&1
eval_tap $? 52 'RejectGroupJoinRequestPublicV1' test.out

#- 53 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '85Sw6oXD' \
    > test.out 2>&1
eval_tap $? 53 'KickGroupMemberPublicV1' test.out

#- 54 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["BYjYczWx", "jf8gN5uc", "4kn2QVOq"]}' \
    > test.out 2>&1
eval_tap $? 54 'GetListGroupByIDsAdminV2' test.out

#- 55 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6PXn7xsJ' \
    --limit '90' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 55 'GetUserJoinedGroupInformationPublicV2' test.out

#- 56 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '9BYMGS4a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zR5gIrjC' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetUserGroupStatusInformationV2' test.out

#- 57 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Acl2JoZE", "customAttributes": {"8N5zMg9M": {}, "FfHNRDmL": {}, "v2OEEk1k": {}}, "groupDescription": "vUkayWaY", "groupIcon": "ParldQxM", "groupMaxMember": 34, "groupName": "DlB9mVPC", "groupRegion": "dTPjCxWY", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "687AMR35", "ruleDetail": [{"ruleAttribute": "h8ULshUx", "ruleCriteria": "EQUAL", "ruleValue": 0.04742795994730953}, {"ruleAttribute": "tYLLeW5W", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6929159041659564}, {"ruleAttribute": "Fig7xEkg", "ruleCriteria": "EQUAL", "ruleValue": 0.8766377835515646}]}, {"allowedAction": "NavMWMoc", "ruleDetail": [{"ruleAttribute": "ZzIHYs8j", "ruleCriteria": "MAXIMUM", "ruleValue": 0.45327127730336636}, {"ruleAttribute": "GD0S3xPQ", "ruleCriteria": "EQUAL", "ruleValue": 0.6972872418858601}, {"ruleAttribute": "h4zNxE2l", "ruleCriteria": "MINIMUM", "ruleValue": 0.6994747517201823}]}, {"allowedAction": "xeKrwrwW", "ruleDetail": [{"ruleAttribute": "T2dsUjVG", "ruleCriteria": "EQUAL", "ruleValue": 0.2131422134297195}, {"ruleAttribute": "OpDgDnym", "ruleCriteria": "EQUAL", "ruleValue": 0.3451980312079873}, {"ruleAttribute": "zDpGc20Q", "ruleCriteria": "MINIMUM", "ruleValue": 0.7246740194318309}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 57 'CreateNewGroupPublicV2' test.out

#- 58 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["mcTXomVl", "HTVdJWDj", "NbztZLnm"]}' \
    > test.out 2>&1
eval_tap $? 58 'GetListGroupByIDsV2' test.out

#- 59 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'ZgIzEIMO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "71ZZAfMW", "groupIcon": "lfaZVzMB", "groupName": "iB3OyOM4", "groupRegion": "GaGsiAAl", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePutSingleGroupPublicV2' test.out

#- 60 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId '8bhryvbP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteGroupPublicV2' test.out

#- 61 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'l2j60jeS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NzaaM5k2", "groupIcon": "ytBQgwzF", "groupName": "JwJZUuol", "groupRegion": "8zuY6kUH", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePatchSingleGroupPublicV2' test.out

#- 62 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'QIndoz9n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"FwUkjOgv": {}, "n4uOd2MW": {}, "WRLY91wX": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupCustomAttributesPublicV2' test.out

#- 63 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'SYbeB3uW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AcceptGroupInvitationPublicV2' test.out

#- 64 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'zk6ESOgu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'RejectGroupInvitationPublicV2' test.out

#- 65 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'eEW9yt3O' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 65 'GetGroupInviteRequestPublicV2' test.out

#- 66 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '3EL9rdpk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'JoinGroupV2' test.out

#- 67 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'PG54ETpt' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 67 'GetGroupJoinRequestPublicV2' test.out

#- 68 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'PCsQiH0E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'LeaveGroupPublicV2' test.out

#- 69 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'rF7ESWCK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"VOcapm6A": {}, "skoSKI4g": {}, "pJMuItXY": {}}}' \
    > test.out 2>&1
eval_tap $? 69 'UpdateGroupCustomRulePublicV2' test.out

#- 70 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'uhFDp2qb' \
    --groupId 'HXd0ASQH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "IE1vH8Si", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7039457831908781}, {"ruleAttribute": "iK48dDKA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.0024850107985292524}, {"ruleAttribute": "Vm4nYCLy", "ruleCriteria": "EQUAL", "ruleValue": 0.38566498650945025}]}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateGroupPredefinedRulePublicV2' test.out

#- 71 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'J0FdB37e' \
    --groupId 'flzpSqgo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteGroupPredefinedRulePublicV2' test.out

#- 72 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 72 'GetMemberRolesListPublicV2' test.out

#- 73 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '8SpUnVOM' \
    --memberRoleId 'Ku4vTVlu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "6NSTvVbz"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateMemberRolePublicV2' test.out

#- 74 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'eGQ0x7nH' \
    --memberRoleId 'VFZ4WL2F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "7s9CrYPx"}' \
    > test.out 2>&1
eval_tap $? 74 'DeleteMemberRolePublicV2' test.out

#- 75 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 75 'GetUserGroupInformationPublicV2' test.out

#- 76 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 76 'GetMyGroupJoinRequestV2' test.out

#- 77 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'NBP7CyyF' \
    --namespace "$AB_NAMESPACE" \
    --userId '3PjbFOv6' \
    > test.out 2>&1
eval_tap $? 77 'InviteGroupPublicV2' test.out

#- 78 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'MxaCXyXY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbqlDsq6' \
    > test.out 2>&1
eval_tap $? 78 'CancelInvitationGroupMemberV2' test.out

#- 79 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'OSjuY0fi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yI6x5tTf' \
    > test.out 2>&1
eval_tap $? 79 'AcceptGroupJoinRequestPublicV2' test.out

#- 80 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'n8O7sFrZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKHibYHu' \
    > test.out 2>&1
eval_tap $? 80 'RejectGroupJoinRequestPublicV2' test.out

#- 81 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId '0kVeTU8O' \
    --namespace "$AB_NAMESPACE" \
    --userId '1M06aOwO' \
    > test.out 2>&1
eval_tap $? 81 'KickGroupMemberPublicV2' test.out

#- 82 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'GNhrmdj1' \
    --namespace "$AB_NAMESPACE" \
    --userId '9RTPXuHR' \
    > test.out 2>&1
eval_tap $? 82 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
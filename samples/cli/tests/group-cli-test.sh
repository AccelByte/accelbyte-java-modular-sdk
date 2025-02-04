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
    --limit '69' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "plu5O9Hw", "description": "TJmKT7m5", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "E8d6q1dz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.13501421480043652}, {"ruleAttribute": "hRO921TH", "ruleCriteria": "EQUAL", "ruleValue": 0.1145676086655133}, {"ruleAttribute": "6xr1dZcO", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2836932873489554}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "nrewVQgs", "ruleCriteria": "MINIMUM", "ruleValue": 0.3450449389722062}, {"ruleAttribute": "8hsRXGWh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5058199492992025}, {"ruleAttribute": "aM6eGEmC", "ruleCriteria": "EQUAL", "ruleValue": 0.07216774562475248}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "z6a2k4kg", "ruleCriteria": "MINIMUM", "ruleValue": 0.7329208211644972}, {"ruleAttribute": "m507in93", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8547469092075941}, {"ruleAttribute": "65Twi4Zw", "ruleCriteria": "EQUAL", "ruleValue": 0.06347931869817536}]}], "groupAdminRoleId": "lemKbeyV", "groupMaxMember": 60, "groupMemberRoleId": "rngFmXGw", "name": "ZBiJNJlR"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'ikcqBTN4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'VkK50lD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'kj1r23Hx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "5AF9DIO1", "groupMaxMember": 69, "name": "9W89FbPp"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'e7GKjYwq' \
    --configurationCode 'q7Xt6Bnb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "2mxq5ViX", "ruleCriteria": "MINIMUM", "ruleValue": 0.13448058831287446}, {"ruleAttribute": "QHMMOusi", "ruleCriteria": "EQUAL", "ruleValue": 0.026750061793530566}, {"ruleAttribute": "fOCJNq0I", "ruleCriteria": "MAXIMUM", "ruleValue": 0.27653007691169496}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'I1JXbZfM' \
    --configurationCode 'GiP8NHeU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'PJ5dR4R8' \
    --groupName 'HCyz4JnN' \
    --groupRegion '3Xy21ujJ' \
    --limit '80' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'SytfSHQb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '7yKKdP2m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '5SGThRqr' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '36' \
    --order 'X0w9yjvG' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "yvi9sxmC", "memberRolePermissions": [{"action": 34, "resourceName": "NX3PG7yU"}, {"action": 91, "resourceName": "ZpBIlkPP"}, {"action": 80, "resourceName": "LKrpIgfu"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '98tLfoQT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'dPOO7Kq2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'FuJSQDUm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "MrjyJdwH"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'cZWhtTMS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 81, "resourceName": "GYk697Nq"}, {"action": 8, "resourceName": "sDuA5mID"}, {"action": 81, "resourceName": "gwuuxUOA"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Mh5YFeXV' \
    --groupRegion 'KqI3Sslc' \
    --limit '64' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "ItBodjjK", "customAttributes": {"T2T7juyf": {}, "g0gjzuyS": {}, "wGXADm1Y": {}}, "groupDescription": "VQIUpG4g", "groupIcon": "UgGre8L0", "groupMaxMember": 19, "groupName": "KnEJ02Qy", "groupRegion": "wyWm1S0l", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "FKlz61Ri", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5528260775038598}, {"ruleAttribute": "ksegvvNE", "ruleCriteria": "MINIMUM", "ruleValue": 0.25750690260868836}, {"ruleAttribute": "1yroz9AK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6212850780166357}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ioEZoU4o", "ruleCriteria": "MINIMUM", "ruleValue": 0.89312168665731}, {"ruleAttribute": "iI1qlsfM", "ruleCriteria": "MINIMUM", "ruleValue": 0.8807613465183578}, {"ruleAttribute": "PxVaU62H", "ruleCriteria": "EQUAL", "ruleValue": 0.3860359014387409}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "sfhCmjih", "ruleCriteria": "EQUAL", "ruleValue": 0.4124156032302363}, {"ruleAttribute": "n6ipgOSP", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9607722328911626}, {"ruleAttribute": "l3OgCu8G", "ruleCriteria": "MINIMUM", "ruleValue": 0.8934171528744532}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '0rmgbEhl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'nVHi5Ewm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "3i6CPBat", "groupIcon": "dclreeEl", "groupName": "N8kOW8yY", "groupRegion": "XiCLhA5y", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'LtN40My0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'cundCIxq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "2F95JopV", "groupIcon": "YIxUsOAd", "groupName": "2a2gWw5C", "groupRegion": "6sXjkSzG", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ZJcyH37T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"xvtLClK7": {}, "U9YsQ3oP": {}, "flG7Z7Is": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'GU2SV5Rs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'WifEwkVs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'by9BdP0P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'M7J0EjjC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '6CL6DAJT' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '5913ULAI' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '76' \
    --order 'puFuMICk' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'qFSbJif4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"DgvSAjFD": {}, "Sq6TGu4y": {}, "bBrzBwHJ": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '9LCqcq6B' \
    --groupId 'hetOXnf1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "15DXdQYC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7856912464677914}, {"ruleAttribute": "njdL6gxH", "ruleCriteria": "EQUAL", "ruleValue": 0.33058354881383845}, {"ruleAttribute": "rk5QQwlV", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7452259361102401}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'xa9ovWiM' \
    --groupId 'nHEnMbW4' \
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
    --limit '34' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'IIDrnZCz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "5NlBg2Jl"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'vwPqx6XM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "lT6YCppq"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9BBgLaZL' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd6bgkNLI' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H7PFMeUC' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W3Ciz64U' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kf7RyXg5' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["hdxNx5bL", "dM4PWoJZ", "GVmEnpOd"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnurTQdZ' \
    --limit '77' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '9sRu7QaB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhWjyYrR' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "0PNqzvQa", "customAttributes": {"Mc4Ix1bR": {}, "svwfmkeh": {}, "XHKJy4U1": {}}, "groupDescription": "V8U9GwhL", "groupIcon": "QcSOw7xr", "groupMaxMember": 42, "groupName": "Ig6Q3Vqq", "groupRegion": "BCmnJR6I", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "fiMLgdTX", "ruleCriteria": "MINIMUM", "ruleValue": 0.2760415813997843}, {"ruleAttribute": "ip4YfLE0", "ruleCriteria": "EQUAL", "ruleValue": 0.9810064500758651}, {"ruleAttribute": "UkF1kb6y", "ruleCriteria": "EQUAL", "ruleValue": 0.2960610298877533}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "2hlrhs2f", "ruleCriteria": "MAXIMUM", "ruleValue": 0.36426865649103646}, {"ruleAttribute": "tYpu3drs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4161935161232676}, {"ruleAttribute": "exxIvxqR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5763136011139007}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "YPNaNKAs", "ruleCriteria": "MINIMUM", "ruleValue": 0.42949002099659905}, {"ruleAttribute": "UD6wFMkK", "ruleCriteria": "MINIMUM", "ruleValue": 0.26751291927186316}, {"ruleAttribute": "YAK08MAA", "ruleCriteria": "MINIMUM", "ruleValue": 0.09861596090462688}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["az0oVBaR", "lG6thvZ3", "CdVYlkEA"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'Th0Ff9F5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "2K25m5Jk", "groupIcon": "JX2sgPKJ", "groupName": "R6xfSDty", "groupRegion": "hDu3Gn4i", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'vQCyTQD7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'yJJyW1En' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ij6x90Hh", "groupIcon": "beHBkkE1", "groupName": "OdjG5vkX", "groupRegion": "VGCGkWXJ", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'ru1WhFhP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"z4cbNVAX": {}, "PkXA2vLu": {}, "ekUwfzhO": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'Bn9eihND' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'DWo12oto' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId '1IwzFXwz' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'oJX83Xlx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'OAqWeXuC' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Vr4WqmHD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'ws0mRXJe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"dXIVXgb8": {}, "qEfSWJvK": {}, "jl1ZoriE": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction '14A7hwQu' \
    --groupId 'dQ4cPepV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "byMzhZHY", "ruleCriteria": "EQUAL", "ruleValue": 0.23944822119488685}, {"ruleAttribute": "OVxzEpK9", "ruleCriteria": "EQUAL", "ruleValue": 0.06889961653354482}, {"ruleAttribute": "KMNGbaJ1", "ruleCriteria": "MINIMUM", "ruleValue": 0.9372495523207827}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '0YXczNoV' \
    --groupId 'cqTVsPM2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'ycnY1gWT' \
    --memberRoleId 'oY1b7B7s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "k3SXzFqO"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'ZjGlD1Td' \
    --memberRoleId 'z7Nv3DA7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "I4ovXeo0"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '9LWtf6b5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7yiujVC' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId '4EGhGRef' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o6BafHjs' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'ich8udbG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ea879r7s' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'C1zI3JFW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JCMQjogB' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'XNaBHXez' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i55WA1fd' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'nnHZLFIH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJRWzv8O' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --limit '22' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "eiXL1Rca", "description": "n6DERtMb", "globalRules": [{"allowedAction": "M4CvquRR", "ruleDetail": [{"ruleAttribute": "L5YqQ5mp", "ruleCriteria": "EQUAL", "ruleValue": 0.9248044036948848}, {"ruleAttribute": "3KZLadzK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5285669680571505}, {"ruleAttribute": "ITbVqdcx", "ruleCriteria": "MAXIMUM", "ruleValue": 0.005561480381649275}]}, {"allowedAction": "eUsBetGT", "ruleDetail": [{"ruleAttribute": "5mHCvbg7", "ruleCriteria": "EQUAL", "ruleValue": 0.18961004065361353}, {"ruleAttribute": "KfCAJ8OH", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4951149400660867}, {"ruleAttribute": "eRfmylnH", "ruleCriteria": "MINIMUM", "ruleValue": 0.862426268218456}]}, {"allowedAction": "2lXp2EYP", "ruleDetail": [{"ruleAttribute": "v22e40TD", "ruleCriteria": "EQUAL", "ruleValue": 0.36594592508967416}, {"ruleAttribute": "UDC3XgB1", "ruleCriteria": "MINIMUM", "ruleValue": 0.27993292923945434}, {"ruleAttribute": "4TrZhkXv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.510502751741363}]}], "groupAdminRoleId": "SHqlTEvU", "groupMaxMember": 71, "groupMemberRoleId": "7fHoQa5p", "name": "PQd4jq4S"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'M9tXcYFj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '83rYSSEf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'cik9Zrer' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Lu5mJvey", "groupMaxMember": 80, "name": "VRlLl01K"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'IKt5E5sf' \
    --configurationCode 'gEUlqpZM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "IxZcHBIh", "ruleCriteria": "MINIMUM", "ruleValue": 0.18076467350991043}, {"ruleAttribute": "TgQAitc5", "ruleCriteria": "MINIMUM", "ruleValue": 0.918240445671009}, {"ruleAttribute": "uQDSMTmu", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2669740114790341}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '9Bgv6qOn' \
    --configurationCode 'xH6lgk4F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '1c4I5vnQ' \
    --groupName 'LIbX17mt' \
    --groupRegion 'LUUAptf7' \
    --limit '16' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'u7lgcElT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'wE1U8l0J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'yQ3aoSp4' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '32' \
    --order 'GxBG2vZS' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "M21ATaSY", "memberRolePermissions": [{"action": 26, "resourceName": "lg7lqO6Z"}, {"action": 4, "resourceName": "mwpstO9e"}, {"action": 28, "resourceName": "r1zTNln6"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'itA1Mya9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '5C4ZZoN6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'Kr2Edfvb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "gd3pYDTb"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'x4v9DdUz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 69, "resourceName": "ilrrjNbm"}, {"action": 74, "resourceName": "cE4KsuH1"}, {"action": 42, "resourceName": "4sB2NbII"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Rb5V3ilW' \
    --groupRegion '3uqnjDXW' \
    --limit '85' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "VLz9Xgwp", "customAttributes": {"7WBZa4Ii": {}, "SuriSkEa": {}, "V6fc0bTq": {}}, "groupDescription": "msfxVxxQ", "groupIcon": "jbiXHVCI", "groupMaxMember": 15, "groupName": "5bFiFVQi", "groupRegion": "stcPWwOu", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "nq2QbEZ5", "ruleDetail": [{"ruleAttribute": "QbQe8azU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9143506832342861}, {"ruleAttribute": "Q7vdXZpv", "ruleCriteria": "MINIMUM", "ruleValue": 0.9817980754860949}, {"ruleAttribute": "Kfm6eMmG", "ruleCriteria": "EQUAL", "ruleValue": 0.5473991687857535}]}, {"allowedAction": "IPKqmwC5", "ruleDetail": [{"ruleAttribute": "57Q3HJwk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9251009371713399}, {"ruleAttribute": "CiaFtiL4", "ruleCriteria": "EQUAL", "ruleValue": 0.9717851507714212}, {"ruleAttribute": "2VtC42dT", "ruleCriteria": "MAXIMUM", "ruleValue": 0.19558268087982755}]}, {"allowedAction": "t52naVUK", "ruleDetail": [{"ruleAttribute": "0bgiaZAG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5185154876734248}, {"ruleAttribute": "pMPtz32p", "ruleCriteria": "EQUAL", "ruleValue": 0.4578436530211779}, {"ruleAttribute": "snshsEG6", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6560659788150572}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'VgDKheW7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'N09U4xoj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "MGPpejby", "groupIcon": "W0Pb4r1K", "groupName": "YFf4SvRP", "groupRegion": "TS6OZGke", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'Vk1YDggC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'KGkY0ldV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "M5ofPdzk", "groupIcon": "y6JavQxU", "groupName": "VHcI9EX3", "groupRegion": "DXymjqMF", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'sCBMeeJt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"QAbeSq6u": {}, "rjxYQDHP": {}, "IE1Z0VRI": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'Uej6B833' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'zuENhH45' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'rhDgMVHG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '12IVAKoO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '1H3X6N9E' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '1CIF2v0l' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '71' \
    --order 'q45sH5mt' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '1NXw1D5S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"KDlxwSXH": {}, "jZ1QqHfL": {}, "Sur4czaJ": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '4dZ1muZs' \
    --groupId 'vpNJoD3A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "bC3JVL1j", "ruleCriteria": "MINIMUM", "ruleValue": 0.23764510076701473}, {"ruleAttribute": "7ia9XLL1", "ruleCriteria": "EQUAL", "ruleValue": 0.689622706359225}, {"ruleAttribute": "SzWxvVJ9", "ruleCriteria": "MINIMUM", "ruleValue": 0.7006177818547197}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '6PG8DD7w' \
    --groupId '6X7IvaZ4' \
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
    --limit '0' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'NNL4y7jw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "SkeYvdJT"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'MyN9z9YD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "nRBdWeHp"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ilXPQoc7' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WW6ICgYr' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pqfz7Uij' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvOZD4J4' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOjozcLi' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["MzNVx1mm", "8S6Tzt7J", "jRl55uEJ"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '0L9BGhPa' \
    --limit '88' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'ahmsgHL0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'njNJ5WT3' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "5PhS60Ez", "customAttributes": {"kZ7NciZ1": {}, "hxpcR9Z8": {}, "vtoCJv9E": {}}, "groupDescription": "tVrEvC57", "groupIcon": "8KEZr8xS", "groupMaxMember": 94, "groupName": "wwJtRF75", "groupRegion": "29Ghrc8G", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "fxtzgcXC", "ruleDetail": [{"ruleAttribute": "1IGp7jU2", "ruleCriteria": "MINIMUM", "ruleValue": 0.7556313994475821}, {"ruleAttribute": "WXsHfshb", "ruleCriteria": "MINIMUM", "ruleValue": 0.5963827366351531}, {"ruleAttribute": "0YNgSS3p", "ruleCriteria": "MINIMUM", "ruleValue": 0.23901969414879531}]}, {"allowedAction": "ycUwFyqB", "ruleDetail": [{"ruleAttribute": "qUzUAL9i", "ruleCriteria": "EQUAL", "ruleValue": 0.13388627494097904}, {"ruleAttribute": "TiPB6Ryq", "ruleCriteria": "EQUAL", "ruleValue": 0.758579856005494}, {"ruleAttribute": "Jxq7uloU", "ruleCriteria": "MINIMUM", "ruleValue": 0.5327211162814272}]}, {"allowedAction": "dMpQSw0S", "ruleDetail": [{"ruleAttribute": "gPl0VHjJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.26791784936369056}, {"ruleAttribute": "zzQBqL1M", "ruleCriteria": "MINIMUM", "ruleValue": 0.6437539823342923}, {"ruleAttribute": "NaKS1R1A", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7665119488655558}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["9rhA2ogg", "bNar96g0", "wXI3Sg30"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'jv7EiiiJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "sMOOmGBW", "groupIcon": "m46efe6C", "groupName": "Q5VLuqow", "groupRegion": "O3hJt24D", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'zttxfR5s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'JO8ttZoD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "wqi1AydS", "groupIcon": "iWScZArL", "groupName": "09Bdnhq2", "groupRegion": "G4F2tXpP", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId '0BdKvI7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"RjpBiTCI": {}, "KcYj8kOR": {}, "mAp8aMru": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'hshqNAPY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'l26E2x6O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'ai5H3UzJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '6tJnayVx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'PJHMpXDu' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'eAfVZytX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '2BUb9iPH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"3JMYFuFo": {}, "8LszBzcK": {}, "Hxfijej2": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'drZQWnA0' \
    --groupId 'eUorCoOr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "RvgIQrqt", "ruleCriteria": "EQUAL", "ruleValue": 0.13603284648396263}, {"ruleAttribute": "cLap8k5O", "ruleCriteria": "MAXIMUM", "ruleValue": 0.531244230551399}, {"ruleAttribute": "s5SocPpM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.12769161167127063}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'qW8ambRP' \
    --groupId 'JwKcZfbH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'Zbqp14HJ' \
    --memberRoleId 'iu6JQwz3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "0dV2GOlH"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'P7LgNMt8' \
    --memberRoleId '8SsFJ60E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "hiPph83P"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'DVzyQHeB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eK94qLJ8' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'iBszTjbz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iMxCCT17' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'YmhV50CG' \
    --namespace "$AB_NAMESPACE" \
    --userId '8JscTpu7' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'MN772dYM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xuBheFdt' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'I38DLuZz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAfCf057' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'Bkbpgl6d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddR0fyD9' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
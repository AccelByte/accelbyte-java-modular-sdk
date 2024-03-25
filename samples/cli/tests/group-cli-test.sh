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
    --limit '46' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "0K4CibTv", "description": "gKfjyYzk", "globalRules": [{"allowedAction": "8Y0OAEex", "ruleDetail": [{"ruleAttribute": "hVocZVRJ", "ruleCriteria": "EQUAL", "ruleValue": 0.017438731034657207}, {"ruleAttribute": "ZYLxGuQK", "ruleCriteria": "MINIMUM", "ruleValue": 0.7858218278456955}, {"ruleAttribute": "eKNfXJJv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8302969204547439}]}, {"allowedAction": "pyBromLP", "ruleDetail": [{"ruleAttribute": "3d7bjs41", "ruleCriteria": "MINIMUM", "ruleValue": 0.5755273480337532}, {"ruleAttribute": "Q3fQQ3Q9", "ruleCriteria": "EQUAL", "ruleValue": 0.056204514037772935}, {"ruleAttribute": "irwD8nSN", "ruleCriteria": "MINIMUM", "ruleValue": 0.3313153666278099}]}, {"allowedAction": "GBeVdFZC", "ruleDetail": [{"ruleAttribute": "I0fR5BnA", "ruleCriteria": "MINIMUM", "ruleValue": 0.6024138784859832}, {"ruleAttribute": "avWelSVv", "ruleCriteria": "EQUAL", "ruleValue": 0.9382334030911801}, {"ruleAttribute": "E1UG0G7y", "ruleCriteria": "MINIMUM", "ruleValue": 0.2791146133771536}]}], "groupAdminRoleId": "jvadzJPZ", "groupMaxMember": 98, "groupMemberRoleId": "Gl9Slsw9", "name": "6phabWRM"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'u4GhazMs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'WSTJI0hJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'TwDJendG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PXjcpaU4", "groupMaxMember": 57, "name": "4bdUvw6I"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'TcO8DjxH' \
    --configurationCode '5E6fIc5n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "ny633rvo", "ruleCriteria": "EQUAL", "ruleValue": 0.6932707977242567}, {"ruleAttribute": "zs8HwJuI", "ruleCriteria": "MINIMUM", "ruleValue": 0.6729981815144269}, {"ruleAttribute": "qIn1DJYw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.008808409115901195}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'N1pgoZ0V' \
    --configurationCode 'hO5bkKnf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'LGcR4qLY' \
    --groupName 'jEfKSTMo' \
    --groupRegion 'VLIv5iJC' \
    --limit '0' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'mwAE2cZe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'DcyOsZhZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'TPONpj8Z' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '13' \
    --order 'fYqZQLjq' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "OQw2UcvV", "memberRolePermissions": [{"action": 35, "resourceName": "lJX5XIRn"}, {"action": 34, "resourceName": "JWJG8Dn6"}, {"action": 71, "resourceName": "TBErdhu7"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'VMbVZ5UJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'vCwwBHca' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'QdNMd8LF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "t1UDeg9N"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jVZ3R9kl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 50, "resourceName": "JidwltVf"}, {"action": 52, "resourceName": "AUCBMsnr"}, {"action": 0, "resourceName": "C0GU4FJz"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'pUiKK8qL' \
    --groupRegion 'mebngJg3' \
    --limit '2' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "jQ4ttvDf", "customAttributes": {"WdhSu9Oa": {}, "BKwGLRrz": {}, "g3MaXEM7": {}}, "groupDescription": "QDiSA4Fw", "groupIcon": "7MDh1PBJ", "groupMaxMember": 89, "groupName": "GPquSVBq", "groupRegion": "pl9lSSii", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "KphJMiD7", "ruleDetail": [{"ruleAttribute": "NmU8FtPg", "ruleCriteria": "MINIMUM", "ruleValue": 0.06066570583938491}, {"ruleAttribute": "b9NRZXTh", "ruleCriteria": "EQUAL", "ruleValue": 0.501137344037617}, {"ruleAttribute": "KFaMKJgl", "ruleCriteria": "EQUAL", "ruleValue": 0.8111762687781281}]}, {"allowedAction": "aegDP1yc", "ruleDetail": [{"ruleAttribute": "KurEJthA", "ruleCriteria": "EQUAL", "ruleValue": 0.7901097176138618}, {"ruleAttribute": "8E0vkTq8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9854162531216701}, {"ruleAttribute": "eWyKtcVt", "ruleCriteria": "EQUAL", "ruleValue": 0.6417050516517361}]}, {"allowedAction": "WvlFUZLH", "ruleDetail": [{"ruleAttribute": "kPHnfFy2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6003271776090123}, {"ruleAttribute": "J84yVPgI", "ruleCriteria": "MINIMUM", "ruleValue": 0.7725860580129434}, {"ruleAttribute": "uAGFCOJ1", "ruleCriteria": "MAXIMUM", "ruleValue": 0.17174502230174493}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Gthr2Uny' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'wXKlW0bl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "pNHkKMgl", "groupIcon": "yqSbWRGM", "groupName": "IU0s6T06", "groupRegion": "xuO31vXD", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'n15Hya6W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'XuG3JH7d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "FPuNDNWJ", "groupIcon": "hpykONf8", "groupName": "dKb7foyc", "groupRegion": "dkIjEivL", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'Qc0vVQX2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Zq7yaCCg": {}, "q4dCQ7qB": {}, "AQuGS5n6": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'Jr5ZjtIa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'T7wnQJtx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'UzFWdn0z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'ZWTfXkDk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'jwntxJQw' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'jRx6oGbo' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '2' \
    --order 'wkUGgahL' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '7gV9Xpvl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"E0eBUmMy": {}, "1890JPzA": {}, "v4rXQtop": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'QS2HXqdh' \
    --groupId 'SlC1MxUD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "u2ilUHSU", "ruleCriteria": "MINIMUM", "ruleValue": 0.7454552683624805}, {"ruleAttribute": "zHd9MiZ4", "ruleCriteria": "MINIMUM", "ruleValue": 0.5464584405299822}, {"ruleAttribute": "vYPOMxUE", "ruleCriteria": "EQUAL", "ruleValue": 0.07557675848677892}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'GXcQpgtv' \
    --groupId 'IGPVWnnc' \
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
    --limit '41' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'MW0BDnTg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "o8eBo7rL"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'srLmuOqS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Mb9zLJ0N"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eRAAII6v' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rI0HRfPG' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmIlFfCG' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aIjYErjh' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x9yMbLBv' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["Bm1WGtVe", "uR1DViEy", "B1kQNCyf"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4YueXW5G' \
    --limit '37' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'B8SzXaV6' \
    --namespace "$AB_NAMESPACE" \
    --userId '7TKxWCTW' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "qcxedJFw", "customAttributes": {"BRojyaq4": {}, "KPK5QK5d": {}, "xurWXEnf": {}}, "groupDescription": "5CHLgkXw", "groupIcon": "Y3itqBia", "groupMaxMember": 24, "groupName": "tAZmRy41", "groupRegion": "qO50WhAv", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "ruXOjf7j", "ruleDetail": [{"ruleAttribute": "w50oHCuq", "ruleCriteria": "MINIMUM", "ruleValue": 0.4862496774674224}, {"ruleAttribute": "SKi3JqtT", "ruleCriteria": "MAXIMUM", "ruleValue": 0.19766861390353396}, {"ruleAttribute": "yKt9iv0l", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06172151161917916}]}, {"allowedAction": "zadW05em", "ruleDetail": [{"ruleAttribute": "cOrbVSlO", "ruleCriteria": "EQUAL", "ruleValue": 0.6562190279657553}, {"ruleAttribute": "xndZZ9YZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8826878408290213}, {"ruleAttribute": "BpKJCpnn", "ruleCriteria": "MINIMUM", "ruleValue": 0.7638304935249596}]}, {"allowedAction": "hxWnJ1SW", "ruleDetail": [{"ruleAttribute": "AY3SanJO", "ruleCriteria": "EQUAL", "ruleValue": 0.750903818347632}, {"ruleAttribute": "vvgR5KIY", "ruleCriteria": "MINIMUM", "ruleValue": 0.4405176151084649}, {"ruleAttribute": "QwzSTuFU", "ruleCriteria": "EQUAL", "ruleValue": 0.11788571981716445}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["UcUbjp0v", "9q7ExTeg", "zTVtlc2Y"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'eJPmUiMa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "BlVbc3rd", "groupIcon": "6TmeZI0U", "groupName": "EMQpddqk", "groupRegion": "rt7gdApQ", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'XC5uuP1l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'PE4GevZP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "gqVIcl5A", "groupIcon": "0jM27VrE", "groupName": "NWO7aEmN", "groupRegion": "MB1xIRt5", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'aE1wNvtd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"xFeJM6ix": {}, "r3aZ5hdo": {}, "xSgxDj5f": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'FV9mg5Gi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'm0P31LQO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'CsQ5lGzM' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '9dMmEQ2U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '6rCjUIEJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId '4cB3B3GS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'zwMzdrfF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"FHZ9rkWe": {}, "Sb1n5YbA": {}, "B2OdeD7c": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'X7wPyveg' \
    --groupId 'jihZ1ttU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "byxo9WQf", "ruleCriteria": "EQUAL", "ruleValue": 0.8374954039725305}, {"ruleAttribute": "OSmkDzUm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7395799290975461}, {"ruleAttribute": "GLI7Ibby", "ruleCriteria": "MINIMUM", "ruleValue": 0.17265317430260219}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'mN7XQLQ8' \
    --groupId 'Wo1OQ1DO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'B3zv03c0' \
    --memberRoleId 'uiRnlLhb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "8MfRpym7"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'Le5RfRXQ' \
    --memberRoleId 'FHkvoLxD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ccouO9iW"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'PZtgT9R1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BAvWUa2q' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'iYAfqKDp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qhMovVCv' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'SsKwFLwd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BW9imF4l' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'Rpc5OvEe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0LouMmF' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId '8ghp4G1K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KfHhq6SC' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'B37tptO3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FMNTi6lT' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
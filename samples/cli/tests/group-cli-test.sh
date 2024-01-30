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
    --limit '28' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "1HOltJ8P", "description": "4d0FT6LE", "globalRules": [{"allowedAction": "D6h03xyh", "ruleDetail": [{"ruleAttribute": "yTj4xhPj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9582386101343334}, {"ruleAttribute": "DgkXj1kJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.35215545767920875}, {"ruleAttribute": "nSfelycr", "ruleCriteria": "MINIMUM", "ruleValue": 0.6904249627701409}]}, {"allowedAction": "LQTa76Aw", "ruleDetail": [{"ruleAttribute": "rCRGuElL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6381103052037449}, {"ruleAttribute": "YfWvkMn9", "ruleCriteria": "MINIMUM", "ruleValue": 0.42337416693469787}, {"ruleAttribute": "Qfdi0WkQ", "ruleCriteria": "EQUAL", "ruleValue": 0.5597336224315516}]}, {"allowedAction": "wEgwJUG0", "ruleDetail": [{"ruleAttribute": "BHZZOMb5", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9943753319300322}, {"ruleAttribute": "hlIqQ6UN", "ruleCriteria": "EQUAL", "ruleValue": 0.8109118690894516}, {"ruleAttribute": "fOKdwUCg", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8687066800553397}]}], "groupAdminRoleId": "Lrb694zZ", "groupMaxMember": 31, "groupMemberRoleId": "L9OCyR5K", "name": "1l9n1jpC"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'B77bvERe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'V3X3MfYJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'Ysjh3FDy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PCRJcCmW", "groupMaxMember": 14, "name": "dhZeQNn2"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'y7aIqGqc' \
    --configurationCode 'OKF8yL4S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "3dp7GihB", "ruleCriteria": "EQUAL", "ruleValue": 0.03661243375702006}, {"ruleAttribute": "lvgB4ebw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7785668440988865}, {"ruleAttribute": "g1GwQrll", "ruleCriteria": "EQUAL", "ruleValue": 0.16907877216731104}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Uqg6HX0f' \
    --configurationCode 'QQqeGnVP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'bOpGLBRh' \
    --groupName 'i55KivTB' \
    --groupRegion '4XaIKtx1' \
    --limit '68' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'dWnA1ZIl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'teYa1GWI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'iRMs3FR0' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '48' \
    --order 'COU9bZaW' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "wXST3PAW", "memberRolePermissions": [{"action": 32, "resourceName": "dkDUlzPz"}, {"action": 55, "resourceName": "vswJsJ6F"}, {"action": 6, "resourceName": "gRr7WqDH"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'XNVOqnS4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '7qqss0Pt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'c6CtENV3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "qCHbY3fp"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'HcrGbjW3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 72, "resourceName": "3PxyPEe4"}, {"action": 12, "resourceName": "qXf4asO6"}, {"action": 67, "resourceName": "iLUQLRJe"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '0vImxJdZ' \
    --groupRegion '9712tbr1' \
    --limit '57' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "HdLITQ4v", "customAttributes": {"5xYSRgE6": {}, "Q8PtdnNk": {}, "PPNzHKwE": {}}, "groupDescription": "wReda7Mz", "groupIcon": "6PD468kn", "groupMaxMember": 82, "groupName": "kG3aFpLA", "groupRegion": "72YxxlHp", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "T5OI41qG", "ruleDetail": [{"ruleAttribute": "Lg7f7Fs9", "ruleCriteria": "MINIMUM", "ruleValue": 0.7465423863193403}, {"ruleAttribute": "4jh9DUcn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.46147753619734755}, {"ruleAttribute": "IkyfrpL7", "ruleCriteria": "EQUAL", "ruleValue": 0.9459992936545943}]}, {"allowedAction": "derwQ6W7", "ruleDetail": [{"ruleAttribute": "36BTjM5P", "ruleCriteria": "MINIMUM", "ruleValue": 0.1474665593500194}, {"ruleAttribute": "c8c9ao7F", "ruleCriteria": "EQUAL", "ruleValue": 0.34036619255388145}, {"ruleAttribute": "hUCsmo5R", "ruleCriteria": "EQUAL", "ruleValue": 0.9717317382191404}]}, {"allowedAction": "NYJsv2uV", "ruleDetail": [{"ruleAttribute": "x2eZdLFJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.24840016774672213}, {"ruleAttribute": "S0KyxS8H", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7775929897794701}, {"ruleAttribute": "9eW2Ragh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8654119905696612}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '1BsaNwOX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'wGGhytnN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "vXBJMYVh", "groupIcon": "R4bR4r2O", "groupName": "jTRSYfGF", "groupRegion": "BHEM18rW", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'k1c1yagT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '2U13e8J0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "jnWB7fGQ", "groupIcon": "lolP4Z0A", "groupName": "eI4vgQ5U", "groupRegion": "x8ecD9Ut", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ryStAwcz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CrY9wTZw": {}, "837KbQ0s": {}, "XLQpDc4p": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'wlsFsNoV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'U0IpZwJ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'BJxYzGHt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'xVO6VzQ7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'LG95H683' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'LsDYWOAc' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '93' \
    --order 'T52A3JqY' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '54ZbcHJs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"QY70g2ns": {}, "suCcwxYA": {}, "E6k5tv6b": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '2ZpEUPAr' \
    --groupId 'koiwow3W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "ST8qMuWy", "ruleCriteria": "MINIMUM", "ruleValue": 0.2783249410232399}, {"ruleAttribute": "ImvbnoSU", "ruleCriteria": "EQUAL", "ruleValue": 0.5524432444774733}, {"ruleAttribute": "3UkApDlh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5240389344753844}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'VfRh22vy' \
    --groupId 'QsxOGGsR' \
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
    --limit '4' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'PDW8qDoi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "qmmB24I1"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Rv31iulo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "8VEEUJ6I"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ViOwm73u' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8qCbCXF' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LorP7w4c' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fEJ3xQCx' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5LFKE8EA' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["OZi4zRGl", "YK9oE4yY", "U6o9qRzM"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Km6362L' \
    --limit '32' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '2SbuH2xO' \
    --namespace "$AB_NAMESPACE" \
    --userId 's8yn6Hyk' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "fKmVvG6a", "customAttributes": {"ZTS9jpf2": {}, "fGLJ7lPk": {}, "gPlSRgtZ": {}}, "groupDescription": "v45G8fTK", "groupIcon": "PMG9S7u9", "groupMaxMember": 66, "groupName": "fciPs3dr", "groupRegion": "0fgVFDsH", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "W4JtXm7f", "ruleDetail": [{"ruleAttribute": "KtkuTi0B", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9187380641397865}, {"ruleAttribute": "0Yvb4uUu", "ruleCriteria": "MINIMUM", "ruleValue": 0.43235881859226355}, {"ruleAttribute": "nEuhzULk", "ruleCriteria": "MINIMUM", "ruleValue": 0.6633341362449386}]}, {"allowedAction": "U3lCUp5p", "ruleDetail": [{"ruleAttribute": "BZ9zVC88", "ruleCriteria": "EQUAL", "ruleValue": 0.6841005171685206}, {"ruleAttribute": "nUK2MnDn", "ruleCriteria": "EQUAL", "ruleValue": 0.6680010868003837}, {"ruleAttribute": "pb4OP3PP", "ruleCriteria": "MINIMUM", "ruleValue": 0.628341733184112}]}, {"allowedAction": "DMUxY07z", "ruleDetail": [{"ruleAttribute": "ahfTjNg1", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4487551927609462}, {"ruleAttribute": "FeOXlb5G", "ruleCriteria": "MINIMUM", "ruleValue": 0.6428604736649379}, {"ruleAttribute": "QzaM5dOO", "ruleCriteria": "EQUAL", "ruleValue": 0.8283389160607194}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["tn6bPlie", "jqBLRCx4", "xun6DkbZ"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'krsTDUDR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "jaOYckwF", "groupIcon": "500ikRVE", "groupName": "gIpwKpSP", "groupRegion": "U3hGgPtX", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'SxVFo82R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'Iy5RGVo1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "01rV9zIT", "groupIcon": "kV5YDQO7", "groupName": "3jhcoe7f", "groupRegion": "KQvLTx0M", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'rpaO6AsQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"98cQo5Xa": {}, "wBzEostv": {}, "Y9vd1pk5": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'CwHaTelS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'y61zj0DC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'ngmHYABs' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'g3rdwgc5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'uqpXhiKN' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Q2A2sTF1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '5upRubQu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"DY6pwenC": {}, "94x12urT": {}, "d4SRBKKD": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'khcQLHD4' \
    --groupId '2x5AKxvl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "mtiW94wR", "ruleCriteria": "EQUAL", "ruleValue": 0.09381163287369576}, {"ruleAttribute": "fd4a1wlR", "ruleCriteria": "EQUAL", "ruleValue": 0.9041632911800102}, {"ruleAttribute": "1MUz4Yc3", "ruleCriteria": "EQUAL", "ruleValue": 0.6308670504343016}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'StY07gM0' \
    --groupId 'nYvmKB2I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'GcXaUp8m' \
    --memberRoleId 'ozPLExKZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "gxJvXEX4"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'Zzj7LZWX' \
    --memberRoleId 'Bv6gAw93' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "q2u8Qqdo"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'KgysVLNK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQ8i35xV' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'wtrK50ur' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwjB0goD' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'HBsDgggj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LV62GefF' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'lQW4J1wR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKx5qBHS' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'pdrFeOKS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yfjy0Eg7' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'V1kADwRs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vwMJLGYi' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
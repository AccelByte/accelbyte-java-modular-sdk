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
    --limit '32' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "sZfUvsBY", "description": "HdLapPS5", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "H4xS20Eh", "ruleCriteria": "MINIMUM", "ruleValue": 0.24972883512614208}, {"ruleAttribute": "0SPsrobJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.12733188646755145}, {"ruleAttribute": "Lkp07JBv", "ruleCriteria": "MINIMUM", "ruleValue": 0.5768890274876914}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "yKJPaLgh", "ruleCriteria": "EQUAL", "ruleValue": 0.2937128484827254}, {"ruleAttribute": "ZNCfrTiZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.42560009641008256}, {"ruleAttribute": "BP1Qphxy", "ruleCriteria": "EQUAL", "ruleValue": 0.7985762838534645}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "gu6xI6uY", "ruleCriteria": "MINIMUM", "ruleValue": 0.9336929971214204}, {"ruleAttribute": "wCCVg5RG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2676494150177169}, {"ruleAttribute": "7T291H4v", "ruleCriteria": "MINIMUM", "ruleValue": 0.22431589220419312}]}], "groupAdminRoleId": "rCIUcCNw", "groupMaxMember": 24, "groupMemberRoleId": "gbswBvdO", "name": "koGveqBd"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '1UfSZadi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'E8Yb6XJP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'npVWSJoc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "C9qJfZnV", "groupMaxMember": 76, "name": "wXPEol50"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'o7EVsu5t' \
    --configurationCode 'upQ8jAFi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "JA4PuaSs", "ruleCriteria": "EQUAL", "ruleValue": 0.1558942281301946}, {"ruleAttribute": "e6e7H5em", "ruleCriteria": "MAXIMUM", "ruleValue": 0.34219128340555993}, {"ruleAttribute": "oD5DBwLK", "ruleCriteria": "EQUAL", "ruleValue": 0.04648774524463983}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'tKMfIebq' \
    --configurationCode 'JzolUmzO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'pPwwOeZg' \
    --groupName 'N7znBRVI' \
    --groupRegion '7GjMFQzw' \
    --limit '52' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'siTTz3jG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'Br45oFRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'o6kt0Uin' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '49' \
    --order 'BGCzq262' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "3bpkJcqq", "memberRolePermissions": [{"action": 8, "resourceName": "gPNQ1xSu"}, {"action": 38, "resourceName": "mv9Gs1SV"}, {"action": 99, "resourceName": "yDkm1Ehp"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'O7aDqe5T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'Csx1L2X7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'eEOFuaru' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "ITozA7iO"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'I5LmwyMF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 40, "resourceName": "bD5hdjoI"}, {"action": 61, "resourceName": "cb7AYWx3"}, {"action": 81, "resourceName": "Z8AEeXhX"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'IM5orjM6' \
    --groupRegion 'vTiYjLWM' \
    --limit '88' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "DRmTSoTx", "customAttributes": {"HdfeN4Pm": {}, "gt1Ebr4F": {}, "Gqfi5ZBm": {}}, "groupDescription": "zLF9pF4a", "groupIcon": "l60LDxyJ", "groupMaxMember": 68, "groupName": "w9AWhH1m", "groupRegion": "BxyF99p2", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "7I7V8ovb", "ruleCriteria": "MINIMUM", "ruleValue": 0.7256126783288318}, {"ruleAttribute": "dIonMx1N", "ruleCriteria": "EQUAL", "ruleValue": 0.49527222396391546}, {"ruleAttribute": "F2kSqB5W", "ruleCriteria": "EQUAL", "ruleValue": 0.9904612756594224}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "ZhzEvw9s", "ruleCriteria": "MAXIMUM", "ruleValue": 0.44630173571426157}, {"ruleAttribute": "iCZMovsn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.46586712367378724}, {"ruleAttribute": "N6PQzbtU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.31493525779248266}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "B7YSK1xQ", "ruleCriteria": "EQUAL", "ruleValue": 0.6487546379600736}, {"ruleAttribute": "wKgPDmbY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.45037599197052136}, {"ruleAttribute": "XLo2czgE", "ruleCriteria": "MINIMUM", "ruleValue": 0.6093133009423679}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'OH1oOSVz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'PxQ4HvTS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "O7mqbd4z", "groupIcon": "0fMXT1uU", "groupName": "ThvDKuKx", "groupRegion": "3q0cnfOn", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'qzcMhdYf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'srqeSxG0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "F10hEAcs", "groupIcon": "n3baYOAI", "groupName": "kB7pXfUS", "groupRegion": "0WDa2AwE", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'dwG2YBJO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"VR5mn3d9": {}, "UzOJEvt3": {}, "IimatAIB": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'wczdE1Y9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '17iqjn47' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'D1bZ20GS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'UxCNTDMO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'NaIhfRmb' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Qgy28iRk' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '69' \
    --order 'vhSazqld' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'l76cKXVX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"1xuC4pTn": {}, "v6V4HyKT": {}, "9lRniDls": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'KKBFGjTB' \
    --groupId 'lFL9TtJ0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Yp1QGNOQ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.0051671059371131145}, {"ruleAttribute": "SEsA9sNf", "ruleCriteria": "EQUAL", "ruleValue": 0.38028258603795473}, {"ruleAttribute": "cCrwKOuv", "ruleCriteria": "MINIMUM", "ruleValue": 0.20144795747741595}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'sBzZu0cm' \
    --groupId 'P5IEQmvV' \
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
    --limit '96' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'u0cBGypL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ZNhuNQr3"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'dMcoPVkS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "60e5OXy7"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '97YuY8Qq' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2WTRyB9t' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWKf3jLK' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHLKc7Xu' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ERgTW17t' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["pA83H6L8", "BQRDQWqZ", "Cdx3twkX"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwH6IiAm' \
    --limit '39' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId '1jFx8F3j' \
    --namespace "$AB_NAMESPACE" \
    --userId '6gPO48Ka' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "fDpq5Ous", "customAttributes": {"jX9Yc5w9": {}, "WaQ2KJIP": {}, "okc3nsYp": {}}, "groupDescription": "wNFbttOP", "groupIcon": "VjzK3EwY", "groupMaxMember": 25, "groupName": "EJYQg8Kl", "groupRegion": "FegLGVk9", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "jrDRFOMZ", "ruleCriteria": "EQUAL", "ruleValue": 0.28611383399293955}, {"ruleAttribute": "QlHDMdaY", "ruleCriteria": "EQUAL", "ruleValue": 0.8855588104901905}, {"ruleAttribute": "2zZaX9rz", "ruleCriteria": "EQUAL", "ruleValue": 0.021396078411892727}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "lqhVexIW", "ruleCriteria": "MINIMUM", "ruleValue": 0.6841026186648418}, {"ruleAttribute": "g0dgMF63", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11331790250538842}, {"ruleAttribute": "IjCAF7tv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.04324943076314636}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "96SAMN2B", "ruleCriteria": "MINIMUM", "ruleValue": 0.6575578134251802}, {"ruleAttribute": "O8hsMbVG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.31783098372456253}, {"ruleAttribute": "oOMoxcz1", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4961195640308791}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["dnWW72r6", "lhXm2yHP", "GsiKUCMk"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'SqzYX9d8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "LVH34Lnh", "groupIcon": "ZhVZVvC2", "groupName": "chaN5kan", "groupRegion": "aVo5dsPO", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'ymVxBycS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'nnmfiZpY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "TabkUvxj", "groupIcon": "8Zt1jSkO", "groupName": "rcvLj1Wi", "groupRegion": "pIMBmT5R", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'o1TsZOOC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"TbwBx1O9": {}, "ZxjEeqS0": {}, "hq39Autk": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'kAIK9wyi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '8XzrvP2o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'wDwlkYRt' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '5YPGKyXy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'UPd5rfdj' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'hlIUb5Ky' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'SDRF1mBq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"6QQuzM35": {}, "aQ45K87O": {}, "ShpgPxfl": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'bD6iueCs' \
    --groupId 'sWp5Ou9l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "WyF6Dtsy", "ruleCriteria": "EQUAL", "ruleValue": 0.5735652472474069}, {"ruleAttribute": "mr1Aqze9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5618039245255467}, {"ruleAttribute": "hCSCsZwq", "ruleCriteria": "EQUAL", "ruleValue": 0.5849018418654555}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'WJmvda7b' \
    --groupId 'HN2quZlr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'NFt0vHny' \
    --memberRoleId '7aRDBi2G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "2OGonM0K"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'XrFOVrPx' \
    --memberRoleId 'EPZtPW5n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Zcce4w5j"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'oH7IWdbT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGX68SHF' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'y4msipJg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxkZSoJ9' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'hRyOAjuy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zj13BUlX' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'bvqYN5jX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZH964iAd' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'QYFnJWdb' \
    --namespace "$AB_NAMESPACE" \
    --userId '0UOudZwp' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'NdCk1vnI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tLRszB8A' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
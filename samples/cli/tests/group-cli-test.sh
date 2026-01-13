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
    --limit '93' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "0HzPT3Xu", "description": "wO0bkTKD", "globalRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "zByYnxC0", "ruleCriteria": "MINIMUM", "ruleValue": 0.5092912501566773}, {"ruleAttribute": "C31RXCRY", "ruleCriteria": "MINIMUM", "ruleValue": 0.6887996215906111}, {"ruleAttribute": "5uuEvRti", "ruleCriteria": "EQUAL", "ruleValue": 0.827404867275319}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "lZMb25N9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8102641007581477}, {"ruleAttribute": "1zOve2mO", "ruleCriteria": "EQUAL", "ruleValue": 0.942743722468042}, {"ruleAttribute": "qUqqAFyP", "ruleCriteria": "EQUAL", "ruleValue": 0.12697968974715856}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "b8je7VJz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3472050351132865}, {"ruleAttribute": "Qd8FhjMI", "ruleCriteria": "MINIMUM", "ruleValue": 0.15849652773300404}, {"ruleAttribute": "yqipg5AD", "ruleCriteria": "MINIMUM", "ruleValue": 0.3796783240698234}]}], "groupAdminRoleId": "fZ6BqZNm", "groupMaxMember": 59, "groupMemberRoleId": "pb46bPRu", "name": "Ghpbwt9T"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'cu3hEbO6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'dxFu3qaA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'Fy2hvntt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0ZpqXDTY", "groupMaxMember": 58, "name": "gNlHkugu"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'rZgjHaw5' \
    --configurationCode 'cA4AHjOY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "oAfdWI8x", "ruleCriteria": "EQUAL", "ruleValue": 0.3989776275396941}, {"ruleAttribute": "L9pDmTrh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1668259446429431}, {"ruleAttribute": "RGEgptZJ", "ruleCriteria": "EQUAL", "ruleValue": 0.44407286789088607}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'KVoGao7Y' \
    --configurationCode 'pyhieUTk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '68oi3EkO' \
    --groupName '1hmEc4uG' \
    --groupRegion 'bxthSBFX' \
    --limit '74' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'Xy52DoDn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'Y1A2vO68' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'PoboEp74' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '31' \
    --order 'E4g0TA3h' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "O8ztSuHC", "memberRolePermissions": [{"action": 91, "resourceName": "eB9npIsD"}, {"action": 91, "resourceName": "MjwQlEMl"}, {"action": 14, "resourceName": "DTdrdeSe"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'MYCci4Vt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'qpEiG0py' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'XRKHcmTB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "fxr5UQ9u"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'sDoXPnr5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 71, "resourceName": "bi6L87hD"}, {"action": 28, "resourceName": "NDAmetM8"}, {"action": 3, "resourceName": "sHWEr4sQ"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'XizToaqW' \
    --groupRegion 'w9pBh3oS' \
    --limit '49' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "ygNOn71A", "customAttributes": {"51IcwrGo": {}, "YpKKd2Bb": {}, "h2Lf2D7W": {}}, "groupDescription": "M7KVZJKJ", "groupIcon": "NpqK1B0I", "groupMaxMember": 25, "groupName": "BlJseACQ", "groupRegion": "GPMHmgnk", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "371fy6K5", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9417807936167663}, {"ruleAttribute": "XEduGfo0", "ruleCriteria": "MINIMUM", "ruleValue": 0.6340913273110229}, {"ruleAttribute": "xFBa3q3T", "ruleCriteria": "MINIMUM", "ruleValue": 0.704509390774298}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "AoMbWpu3", "ruleCriteria": "EQUAL", "ruleValue": 0.5737443639620025}, {"ruleAttribute": "e8mw3NFM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.122923163127584}, {"ruleAttribute": "2BF1kvo0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7663413613084357}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "TzbA0fXC", "ruleCriteria": "MINIMUM", "ruleValue": 0.23226865770256155}, {"ruleAttribute": "UQcbRCW8", "ruleCriteria": "EQUAL", "ruleValue": 0.812504872494545}, {"ruleAttribute": "mPYYNvT9", "ruleCriteria": "EQUAL", "ruleValue": 0.16324231977288017}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'YQeagvDb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'UCOj3ujR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "1rJML68E", "groupIcon": "yDMYDXZY", "groupName": "rVoSrpZo", "groupRegion": "Fa3fJKgt", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'NYvXw722' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'RChDQx6k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "lwtV2jIo", "groupIcon": "UPVAK39Q", "groupName": "OdivqClJ", "groupRegion": "oSGK2dCe", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'IARMp2Rr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"HMbYfd6s": {}, "on2opmYi": {}, "lAHbMNsx": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '4Sg7cNlZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'tD2gLmcz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'noKYF1vx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'q9AiXaXi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '0ZAdJao9' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '1Di1mdyP' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '23' \
    --order 'QkNaxKn5' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'i0GqUUgK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"CBq5NVzS": {}, "oGYh24Zo": {}, "bSRpex6H": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'tJwhR7pV' \
    --groupId 'pvFDPFcF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "KW7QmN18", "ruleCriteria": "MINIMUM", "ruleValue": 0.2958772570131488}, {"ruleAttribute": "TFg4UbsR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9571401426955187}, {"ruleAttribute": "HAkPSgn7", "ruleCriteria": "MINIMUM", "ruleValue": 0.6164250409808693}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '2wvL2cII' \
    --groupId 'QaEbxxfC' \
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
    --limit '81' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'ewM9sCdr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "7rhUjrLK"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'pQnk6Y6r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "HCv3P0j4"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHiDJqYO' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '58UNW8aI' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HK9ngxeU' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zf7QYAuV' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dppaRpDw' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["d9uyXQ4s", "AuUYm6ar", "fZtnZ2Ge"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F3GAtzHW' \
    --limit '56' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'k0z4U6e0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pDwLAvkL' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "26Y5CcpP", "customAttributes": {"TBcyXes3": {}, "TAGyytUb": {}, "qHW9EKEP": {}}, "groupDescription": "emVwcHlk", "groupIcon": "MyKACA77", "groupMaxMember": 99, "groupName": "Gr4nXw9P", "groupRegion": "Gy8k9d5L", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Zgn35Na7", "ruleCriteria": "EQUAL", "ruleValue": 0.3369859610297925}, {"ruleAttribute": "SxTcsLsP", "ruleCriteria": "MINIMUM", "ruleValue": 0.3088729710878928}, {"ruleAttribute": "CzeRYguM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5595724498788204}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ogybdYZm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.27872191669421775}, {"ruleAttribute": "HzHAUnGW", "ruleCriteria": "MINIMUM", "ruleValue": 0.18588277005224896}, {"ruleAttribute": "hiRXN1eQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.5129913480207582}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "FnO4CvOZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8289531588109436}, {"ruleAttribute": "UEOAp91C", "ruleCriteria": "EQUAL", "ruleValue": 0.32711573440873887}, {"ruleAttribute": "eYxOMAHj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7152471061356822}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["wNmItBhi", "9sl2K5rm", "s7Abig3V"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'lcs6OfZg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "kiOx0BnA", "groupIcon": "a3DKLuDx", "groupName": "Qb3l1nPl", "groupRegion": "ZHhqZUPT", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId '0o5hzJUE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'tEpAowcH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "cPnmK9mB", "groupIcon": "MjgQpDEw", "groupName": "wHO6N2ja", "groupRegion": "zov02TZU", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'jaJ8AmAG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"41Br3dJq": {}, "DUxJ2Dh2": {}, "jw8nnyOi": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'G2oxBFjX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'LF2q9x9y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'vFdHR1NW' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'I2AHw0Pt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'I3zk653V' \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'tHjqXZBr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'VXVHFF83' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"ymxvxekg": {}, "yZp9W5D7": {}, "yAlNVVSH": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction '6zC5QO3M' \
    --groupId '1AQEPKiS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "snFafkZF", "ruleCriteria": "EQUAL", "ruleValue": 0.8424960015888358}, {"ruleAttribute": "u88r4YWA", "ruleCriteria": "MINIMUM", "ruleValue": 0.057145263106402555}, {"ruleAttribute": "K2zCKs7I", "ruleCriteria": "MINIMUM", "ruleValue": 0.532101502690531}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'ydlmmo2c' \
    --groupId 'jY9EfHlH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'q49fy2Oz' \
    --memberRoleId 'cITnWN2t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "yq7yMt6E"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '6gcVk9yE' \
    --memberRoleId 'BIC2DiLd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "wHRzXPPl"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '1visGONG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiQ5udli' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'JCiCCSDO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z6Tnoml7' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'YKIfrOUR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OY6xkDZ0' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'D2RQUTbv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f3XUh0Ay' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'I5CbWS86' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pBXH2lEB' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'n9J9beuk' \
    --namespace "$AB_NAMESPACE" \
    --userId '4Ik9bNGo' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
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
    --limit '75' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "292rmfMS", "description": "t1eMaMyf", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ksCLdKKT", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8720052928581153}, {"ruleAttribute": "1Syd4Yo9", "ruleCriteria": "EQUAL", "ruleValue": 0.4512063587934707}, {"ruleAttribute": "D50Phrsd", "ruleCriteria": "EQUAL", "ruleValue": 0.3794029401758695}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Z17omNQd", "ruleCriteria": "EQUAL", "ruleValue": 0.6456597107122457}, {"ruleAttribute": "qefc2V25", "ruleCriteria": "EQUAL", "ruleValue": 0.20554626997369307}, {"ruleAttribute": "9s7zhrg1", "ruleCriteria": "EQUAL", "ruleValue": 0.48806293841754944}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "95jAVJeM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.35518413499233903}, {"ruleAttribute": "xolfiIH8", "ruleCriteria": "EQUAL", "ruleValue": 0.6580477850044089}, {"ruleAttribute": "0iM1CkrL", "ruleCriteria": "EQUAL", "ruleValue": 0.34583688275632685}]}], "groupAdminRoleId": "WEM9W1SR", "groupMaxMember": 31, "groupMemberRoleId": "1HM9Uqy4", "name": "LrEjLP5Z"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'y39WBffn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'DaHrCIXL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '70WYSD8X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "q1jAwasF", "groupMaxMember": 43, "name": "QHpctH1o"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '6T3PSDoj' \
    --configurationCode 'lzQypzV4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "6ICQR0JT", "ruleCriteria": "MINIMUM", "ruleValue": 0.1596950531337843}, {"ruleAttribute": "NBBcXZjM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.33791581722167063}, {"ruleAttribute": "OYpCpAMo", "ruleCriteria": "EQUAL", "ruleValue": 0.3603522908482599}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'nhkp83QP' \
    --configurationCode 'z5g5cYCa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '2iIlDSDd' \
    --groupName 'RTVHentG' \
    --groupRegion 'pgWil8s8' \
    --limit '63' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '3YuyvAg0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '3Ey30kEH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'ITLCjkDC' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '11' \
    --order 'IFM3PX6d' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "qpbBb4DG", "memberRolePermissions": [{"action": 95, "resourceName": "keptguib"}, {"action": 62, "resourceName": "IcGNVkS9"}, {"action": 75, "resourceName": "djh5CLRB"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'za1sTwQS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '4DQVhkTh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'Ka9BSwuw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "ovxcizOW"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jpuyAY39' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 14, "resourceName": "fLHJ7bTg"}, {"action": 8, "resourceName": "wlVPZO15"}, {"action": 65, "resourceName": "Pjngufew"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'XoGNuBfp' \
    --groupRegion '9tHAcmzJ' \
    --limit '3' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "WomocinD", "customAttributes": {"vAEnvasl": {}, "kFjSTM5q": {}, "w3AdbjAg": {}}, "groupDescription": "jR07x20j", "groupIcon": "zOx6uqvH", "groupMaxMember": 26, "groupName": "7vXtZxlJ", "groupRegion": "OOqy02v0", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "pw2T2nNY", "ruleCriteria": "EQUAL", "ruleValue": 0.9025469322209307}, {"ruleAttribute": "XPhT20JK", "ruleCriteria": "MINIMUM", "ruleValue": 0.643089461925093}, {"ruleAttribute": "uWhK0GFZ", "ruleCriteria": "EQUAL", "ruleValue": 0.6666920640499219}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "DIKLmAUJ", "ruleCriteria": "EQUAL", "ruleValue": 0.11294537487865952}, {"ruleAttribute": "UPHJvkmj", "ruleCriteria": "MINIMUM", "ruleValue": 0.17951449286691235}, {"ruleAttribute": "8vmF7vtK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.08981195067155323}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "vAuPWxy0", "ruleCriteria": "EQUAL", "ruleValue": 0.8717499305076939}, {"ruleAttribute": "b0Bav5YS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.76605255572266}, {"ruleAttribute": "JPWvfuDr", "ruleCriteria": "MINIMUM", "ruleValue": 0.47450065766003047}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'baVkrHK7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'Unj4NrFO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "uofSUZvE", "groupIcon": "2WVapO7f", "groupName": "BvGuIrOo", "groupRegion": "MfuWiyWL", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'dCxthOj5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'GbpUdixW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "qeRbxNMy", "groupIcon": "rtQWefaz", "groupName": "9rVSzFNV", "groupRegion": "Pba70Ov1", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'v8kzjIEu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"mV7VHHOD": {}, "e6OJHU0D": {}, "pGsKyoXa": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'pP4wK2jo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'lYHyOrhm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '5Cm098lO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'UDJkwyXR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'pVMNjB0E' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'lSPqHajj' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '94' \
    --order 'P58Oea6d' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'l3Dp5mYO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"vr5fIj6e": {}, "s2hJvuiZ": {}, "Tu52Pjc9": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'HVFqbBqQ' \
    --groupId 'qSfqBmYy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Cwk45d2c", "ruleCriteria": "EQUAL", "ruleValue": 0.2973353232694572}, {"ruleAttribute": "tEFmS19n", "ruleCriteria": "MINIMUM", "ruleValue": 0.3311515255278962}, {"ruleAttribute": "Tt2lOOIz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6553239709323592}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'HSIzXYTi' \
    --groupId 'L5IttSQR' \
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
    --limit '63' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'YkelymR9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "yh7gSnuq"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'GOJvLFcf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "tuZBOiZO"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W62AYDky' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ype5uqvY' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sLa9A8Nx' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'USSOhwKb' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PyA4kFVF' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["ScU1rtnr", "ZirgsfM2", "ya520BIY"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Za1dg0JG' \
    --limit '39' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'cvt5Uqjy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fqwTk7aV' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "4dupfhRS", "customAttributes": {"hM2GrDBf": {}, "8NUjGeZP": {}, "elZRdmak": {}}, "groupDescription": "fdasNVRP", "groupIcon": "Xw424fRe", "groupMaxMember": 80, "groupName": "s0QHZBUO", "groupRegion": "F8ORfxzF", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "TBWGZRdJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.6571108733412165}, {"ruleAttribute": "mWoWA0eO", "ruleCriteria": "EQUAL", "ruleValue": 0.8862398212873381}, {"ruleAttribute": "bgaqtH0v", "ruleCriteria": "MINIMUM", "ruleValue": 0.9417902562949321}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "KtuM1xHZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6882041597012662}, {"ruleAttribute": "TIXZSuEv", "ruleCriteria": "EQUAL", "ruleValue": 0.9765812550291308}, {"ruleAttribute": "1TABrvUa", "ruleCriteria": "EQUAL", "ruleValue": 0.8047435507585704}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ZcVNAUJR", "ruleCriteria": "MINIMUM", "ruleValue": 0.8086298276371621}, {"ruleAttribute": "AFA8wE4d", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3869978922256516}, {"ruleAttribute": "6thFh3kJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.25142645316377155}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["tkspjI3c", "KBYz4U4e", "GpzpXFCv"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'IqZ7YOWT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "pBTJpaeY", "groupIcon": "Siv3Mndh", "groupName": "re2aHX5g", "groupRegion": "4UhMvbpE", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'IcQLpNxo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'W4JvaGiN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "WYSVw3Nz", "groupIcon": "wSu0Q2Zm", "groupName": "EalpMrTM", "groupRegion": "GKEj7rxQ", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'ln9f65HK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"gRjC7RNV": {}, "QsjwDCKs": {}, "FUKGcotx": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'VWOaV3PG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'LOOyPKrm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId '8MLuWCGX' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '6GpMtNwa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'HUFkhgRu' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'H9YWhfTa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'kRO26rma' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"4ePMQsiH": {}, "9mexA9l8": {}, "xGK4jq9B": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'YxlKJjAy' \
    --groupId 'B3x1Viob' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "RD9PBK1I", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4339280932572058}, {"ruleAttribute": "dzDxs4R9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9537928771155861}, {"ruleAttribute": "wEIz2Qdd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6174180671221825}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'E6pmpY47' \
    --groupId 'qgSA8j9C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'KI72YuCW' \
    --memberRoleId 'VvKVktgk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "1SsuSLsn"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'JOR2nwu1' \
    --memberRoleId 'aKfLxRjS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "o3XAuVMW"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'YXLvB71U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cSgFWtrA' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId '1OlUKYMt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UVlzZaNg' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'VPbbhyzu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQQTfrBe' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId '1QRvvNFG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiBk7S6y' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'kXd0HVoO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SW96Lu0n' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'Zw4YjTkq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsMIUhmP' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
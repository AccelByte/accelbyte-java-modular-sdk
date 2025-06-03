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
    --limit '55' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "DN0rBnqL", "description": "putAzstk", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "WeOlTNz0", "ruleCriteria": "MINIMUM", "ruleValue": 0.5537172627172616}, {"ruleAttribute": "PTxYeySr", "ruleCriteria": "MINIMUM", "ruleValue": 0.48338796690875874}, {"ruleAttribute": "1KBwYVtB", "ruleCriteria": "MINIMUM", "ruleValue": 0.13373194529526677}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "Ijmvb4zY", "ruleCriteria": "EQUAL", "ruleValue": 0.7645775588459933}, {"ruleAttribute": "Y2RsKBoR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.015070900735928872}, {"ruleAttribute": "xW456cqh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7196523904027592}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "8Jerlqac", "ruleCriteria": "MAXIMUM", "ruleValue": 0.008339544683895972}, {"ruleAttribute": "h8TQ8O7s", "ruleCriteria": "MINIMUM", "ruleValue": 0.38022649954719945}, {"ruleAttribute": "jkAF5cXl", "ruleCriteria": "EQUAL", "ruleValue": 0.38054825714235707}]}], "groupAdminRoleId": "Czw8ALmR", "groupMaxMember": 12, "groupMemberRoleId": "kXqbfzdF", "name": "AcjFOmCs"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'RFf6VeNG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '3ck5V2PX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'do9X7T48' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FOKj43W4", "groupMaxMember": 82, "name": "avT1Mlcn"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'kKAB6I2X' \
    --configurationCode 'dYgNx75a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "EYd4mDBC", "ruleCriteria": "MINIMUM", "ruleValue": 0.865097283892805}, {"ruleAttribute": "uA84UeGe", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11492578284435251}, {"ruleAttribute": "RIS1CJjJ", "ruleCriteria": "EQUAL", "ruleValue": 0.5164689439187091}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'EJDCpRfE' \
    --configurationCode '77gYAIeS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'OEqjuRH4' \
    --groupName 'AULRBsKT' \
    --groupRegion '7B4WEHdf' \
    --limit '33' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'oehRrFBV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'XJziYZXA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'u61Id0zn' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '100' \
    --order 'mBy6uV0H' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "oNrc87PQ", "memberRolePermissions": [{"action": 35, "resourceName": "L5tND6gj"}, {"action": 87, "resourceName": "FEcs5Vzf"}, {"action": 12, "resourceName": "NFx06t9A"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'FRfS0ung' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'N9ue0iCl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'epHX6dyq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "r4Uk3NGM"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jZrgW2lC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 28, "resourceName": "Z9bMqBYo"}, {"action": 66, "resourceName": "SaLMh2vE"}, {"action": 94, "resourceName": "y9uHvY26"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'JGZAmRNL' \
    --groupRegion 'ZTWvCaoZ' \
    --limit '38' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "umPzx7B1", "customAttributes": {"QBbu75eW": {}, "STtgIzKt": {}, "02Wbbocl": {}}, "groupDescription": "T6MQm8WC", "groupIcon": "I4hyBrCz", "groupMaxMember": 61, "groupName": "Ua4NAXMx", "groupRegion": "CsALzRgv", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "bP9ozf7j", "ruleCriteria": "EQUAL", "ruleValue": 0.4720817518802126}, {"ruleAttribute": "2fApDewl", "ruleCriteria": "MINIMUM", "ruleValue": 0.36513535059526103}, {"ruleAttribute": "Rd2q4ZvA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6939623525134841}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "FCrgse6V", "ruleCriteria": "EQUAL", "ruleValue": 0.8142934159914605}, {"ruleAttribute": "2F359Avw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1996456949969453}, {"ruleAttribute": "06QrNTFQ", "ruleCriteria": "EQUAL", "ruleValue": 0.5934199247434503}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "PvcqxGo9", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8457289215047061}, {"ruleAttribute": "gHW81h2t", "ruleCriteria": "MINIMUM", "ruleValue": 0.7545409069480353}, {"ruleAttribute": "xDXQSTnB", "ruleCriteria": "MINIMUM", "ruleValue": 0.8051838859603924}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'MvcaIpof' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'R60Jgj6s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "yFN6yLfO", "groupIcon": "OtG8p6vp", "groupName": "FQbhjO0z", "groupRegion": "YSZmWBVF", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'hDuYUMUn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'tn4glmrt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "IM7Lb3R3", "groupIcon": "Kkq2VNIs", "groupName": "arGT0dKr", "groupRegion": "soiTlTJY", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'h912T7RC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"hlUqGqiB": {}, "IFoBWqTL": {}, "ydjHiufZ": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'eWQ6j8Yn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '7Kmj5nCd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'zZsDz9de' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '7H2QshHi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'sQgjFoZE' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'KyRvIsHq' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '67' \
    --order 'EdRpbrjW' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'ly0fW3QY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"VO1Rj3V9": {}, "AhaUWzuS": {}, "Byr4JqOF": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'wDXXV1AS' \
    --groupId 'usV0VvT1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "zOdqCTwb", "ruleCriteria": "MINIMUM", "ruleValue": 0.4490407196867703}, {"ruleAttribute": "rxzy5QjE", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4084769109087578}, {"ruleAttribute": "2MEjKVEY", "ruleCriteria": "EQUAL", "ruleValue": 0.9960127193506861}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'wMe2SjvH' \
    --groupId 'FyHXTOUt' \
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
    --offset '44' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '4V93kKyy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "pABjPLK2"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Vwi6ZTcL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RaxxyjSf"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYXclfDD' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0bYSyBv' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PvJI7vqH' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o549kEfi' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K67OyNQA' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["Cid2CvcX", "LDC2laii", "hXd0MJVc"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '21zhkVC0' \
    --limit '10' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'OU3a8lC0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NbJPAFfS' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "f6e6jX9J", "customAttributes": {"szZyPNdA": {}, "a6cxGvnt": {}, "eHCxQh00": {}}, "groupDescription": "yrqWOgF3", "groupIcon": "B45QVrH9", "groupMaxMember": 86, "groupName": "ShY4kYf1", "groupRegion": "qetV6xub", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "qjVPrOBQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.11154953521234345}, {"ruleAttribute": "xcSJg8Bv", "ruleCriteria": "EQUAL", "ruleValue": 0.7750251439813941}, {"ruleAttribute": "OdQpH7tW", "ruleCriteria": "EQUAL", "ruleValue": 0.35245674771079627}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "esSV0XuK", "ruleCriteria": "MINIMUM", "ruleValue": 0.5325295593541742}, {"ruleAttribute": "eBaacJcI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.504367217666797}, {"ruleAttribute": "JnG03tk8", "ruleCriteria": "EQUAL", "ruleValue": 0.25729663081362764}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "WvEAzDqr", "ruleCriteria": "MINIMUM", "ruleValue": 0.12420597588009719}, {"ruleAttribute": "601Gzz3d", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4646607346403976}, {"ruleAttribute": "tWuUl4Vj", "ruleCriteria": "MINIMUM", "ruleValue": 0.9747650340048797}]}]}, "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["6DbeXm8t", "gjBV1Kyt", "GOYEe2Bp"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId '5bMphC8T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "DSB4d63M", "groupIcon": "lCEibCN4", "groupName": "UshbfYgv", "groupRegion": "Bt1P9a60", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'HoT2C0DV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'rGvkMyNG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "uHtmMNIE", "groupIcon": "kFHQdODv", "groupName": "3OQxEw8u", "groupRegion": "QvfDfPgJ", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'XXPUkDHH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8yUwgrUi": {}, "VFuj23nZ": {}, "arAUuh3l": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId '9AvteTuN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '713E8INq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'oytWt6AX' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '5vAzAHeW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'O0TuwVD6' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId '7cSB4vjO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '98vAjszn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"j7eJ0OYN": {}, "nwO2FdxT": {}, "6NpAphjT": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'FcXcw3er' \
    --groupId 'OeunD3RL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "FOWNqXSL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8106275614660962}, {"ruleAttribute": "VgCNsavM", "ruleCriteria": "EQUAL", "ruleValue": 0.6695064549779047}, {"ruleAttribute": "INONfkPk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11530505526026869}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction '1tmP4kH0' \
    --groupId 'ob4bfAjO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'iOEI0Ycb' \
    --memberRoleId 'cvB3aPCn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "al5NK4F9"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'y9NGGnZh' \
    --memberRoleId 'LEracNbl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "9EkTQeZG"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '0tNxBgun' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WeKsRR4D' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'EcanF0Rq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWQREKc4' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId '5F3lFFw1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MhuXWtcT' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId '8zZsgGAx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CrAqyc3U' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'EsZtn9Qy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUy7YCdM' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'xtqRKnST' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AYdBWuDY' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE
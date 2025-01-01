/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operation_responses.group_member.*;
import net.accelbyte.sdk.api.group.operations.group_member.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class GroupMember {

  private RequestRunner sdk;
  private String customBasePath = "";

  public GroupMember(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("group");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public GroupMember(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetGroupMembersListAdminV1
   */
  public GetGroupMembersListAdminV1OpResponse getGroupMembersListAdminV1(
      GetGroupMembersListAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupInvitationPublicV1
   */
  public AcceptGroupInvitationPublicV1OpResponse acceptGroupInvitationPublicV1(
      AcceptGroupInvitationPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupInvitationPublicV1
   */
  public RejectGroupInvitationPublicV1OpResponse rejectGroupInvitationPublicV1(
      RejectGroupInvitationPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinGroupV1
   */
  public JoinGroupV1OpResponse joinGroupV1(JoinGroupV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelGroupJoinRequestV1
   */
  public CancelGroupJoinRequestV1OpResponse cancelGroupJoinRequestV1(CancelGroupJoinRequestV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupMembersListPublicV1
   */
  public GetGroupMembersListPublicV1OpResponse getGroupMembersListPublicV1(
      GetGroupMembersListPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LeaveGroupPublicV1
   */
  public LeaveGroupPublicV1OpResponse leaveGroupPublicV1(LeaveGroupPublicV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupInformationPublicV1
   */
  public GetUserGroupInformationPublicV1OpResponse getUserGroupInformationPublicV1(
      GetUserGroupInformationPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InviteGroupPublicV1
   */
  public InviteGroupPublicV1OpResponse inviteGroupPublicV1(InviteGroupPublicV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupJoinRequestPublicV1
   */
  public AcceptGroupJoinRequestPublicV1OpResponse acceptGroupJoinRequestPublicV1(
      AcceptGroupJoinRequestPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupJoinRequestPublicV1
   */
  public RejectGroupJoinRequestPublicV1OpResponse rejectGroupJoinRequestPublicV1(
      RejectGroupJoinRequestPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see KickGroupMemberPublicV1
   */
  public KickGroupMemberPublicV1OpResponse kickGroupMemberPublicV1(KickGroupMemberPublicV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserJoinedGroupInformationPublicV2
   */
  public GetUserJoinedGroupInformationPublicV2OpResponse getUserJoinedGroupInformationPublicV2(
      GetUserJoinedGroupInformationPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserGroupStatusInformationV2
   */
  public AdminGetUserGroupStatusInformationV2OpResponse adminGetUserGroupStatusInformationV2(
      AdminGetUserGroupStatusInformationV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupInvitationPublicV2
   */
  public AcceptGroupInvitationPublicV2OpResponse acceptGroupInvitationPublicV2(
      AcceptGroupInvitationPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupInvitationPublicV2
   */
  public RejectGroupInvitationPublicV2OpResponse rejectGroupInvitationPublicV2(
      RejectGroupInvitationPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinGroupV2
   */
  public JoinGroupV2OpResponse joinGroupV2(JoinGroupV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LeaveGroupPublicV2
   */
  public LeaveGroupPublicV2OpResponse leaveGroupPublicV2(LeaveGroupPublicV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupInformationPublicV2
   */
  public GetUserGroupInformationPublicV2OpResponse getUserGroupInformationPublicV2(
      GetUserGroupInformationPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InviteGroupPublicV2
   */
  public InviteGroupPublicV2OpResponse inviteGroupPublicV2(InviteGroupPublicV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelInvitationGroupMemberV2
   */
  public CancelInvitationGroupMemberV2OpResponse cancelInvitationGroupMemberV2(
      CancelInvitationGroupMemberV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupJoinRequestPublicV2
   */
  public AcceptGroupJoinRequestPublicV2OpResponse acceptGroupJoinRequestPublicV2(
      AcceptGroupJoinRequestPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupJoinRequestPublicV2
   */
  public RejectGroupJoinRequestPublicV2OpResponse rejectGroupJoinRequestPublicV2(
      RejectGroupJoinRequestPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see KickGroupMemberPublicV2
   */
  public KickGroupMemberPublicV2OpResponse kickGroupMemberPublicV2(KickGroupMemberPublicV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupStatusInformationV2
   */
  public GetUserGroupStatusInformationV2OpResponse getUserGroupStatusInformationV2(
      GetUserGroupStatusInformationV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

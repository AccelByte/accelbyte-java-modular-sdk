/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * acceptGroupInvitationPublicV2
 *
 * <p>Required valid user authentication
 *
 * <p>This endpoint is used to accept group invitation.
 *
 * <p>Accept group invitation. If specific user is not invited in the specific group ID, it will
 * show the the error to show if the user is not invited yet.
 *
 * <p>This endpoint will also check if the user who access this endpoint is already joined to
 * specific group
 *
 * <p>Accessing this endpoint will make all requests (invite / join request) will be deleted for the
 * user who access this endpoint
 *
 * <p>Existing members will receive notification of newly accepted member.
 *
 * <p>Action Code: 73401
 */
@Getter
@Setter
public class AcceptGroupInvitationPublicV2 extends Operation {
  /** generated field's value */
  private String path = "/group/v2/public/namespaces/{namespace}/groups/{groupId}/invite/accept";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String groupId;

  private String namespace;

  /**
   * @param groupId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AcceptGroupInvitationPublicV2(String customBasePath, String groupId, String namespace) {
    this.groupId = groupId;
    this.namespace = namespace;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.groupId != null) {
      pathParams.put("groupId", this.groupId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.groupId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsMemberRequestGroupResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsMemberRequestGroupResponseV1().createFromJson(json);
  }
}

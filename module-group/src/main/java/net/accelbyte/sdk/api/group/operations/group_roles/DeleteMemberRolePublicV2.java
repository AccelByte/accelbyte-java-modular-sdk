/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_roles;

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
 * deleteMemberRolePublicV2
 *
 * <p>Required Member Role Permission: "GROUP:ROLE [UPDATE]"
 *
 * <p>This endpoint is used to remove role from group member
 *
 * <p>Action Code: 73204
 */
@Getter
@Setter
public class DeleteMemberRolePublicV2 extends Operation {
  /** generated field's value */
  private String path =
      "/group/v2/public/namespaces/{namespace}/roles/{memberRoleId}/groups/{groupId}/members";

  private String customBasePath = "";
  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String groupId;

  private String memberRoleId;
  private String namespace;
  private ModelsRemoveRoleFromMemberRequestV1 body;

  /**
   * @param groupId required
   * @param memberRoleId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteMemberRolePublicV2(
      String customBasePath,
      String groupId,
      String memberRoleId,
      String namespace,
      ModelsRemoveRoleFromMemberRequestV1 body) {
    this.groupId = groupId;
    this.memberRoleId = memberRoleId;
    this.namespace = namespace;
    this.body = body;
    this.customBasePath = customBasePath;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.groupId != null) {
      pathParams.put("groupId", this.groupId);
    }
    if (this.memberRoleId != null) {
      pathParams.put("memberRoleId", this.memberRoleId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsRemoveRoleFromMemberRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.groupId == null) {
      return false;
    }
    if (this.memberRoleId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users_v4.PublicInviteUserV4OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicInviteUserV4
 *
 * <p>This endpoint is used to invite a game studio admin user with new namespace in multi tenant
 * mode. It will return error if the service multi tenant mode is set to false.
 *
 * <p>Request body details: - emailAddress: email address of the user to be invited - namespace: new
 * namespace of the user to be created - namespaceDisplayName: display name of the new namespace -
 * additionalData(optional): for utm parameter data
 *
 * <p>The invited users will also be assigned with "User" role by default.
 */
@Getter
@Setter
public class PublicInviteUserV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/users/invite";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelPublicInviteUserRequestV4 body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicInviteUserV4(String customBasePath, ModelPublicInviteUserRequestV4 body) {
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public ModelPublicInviteUserRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public PublicInviteUserV4OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicInviteUserV4OpResponse response = new PublicInviteUserV4OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelInviteUserResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    } else if (code == 429) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError429(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError429().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelInviteUserResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelInviteUserResponseV3().createFromJson(json);
  }
  */

}

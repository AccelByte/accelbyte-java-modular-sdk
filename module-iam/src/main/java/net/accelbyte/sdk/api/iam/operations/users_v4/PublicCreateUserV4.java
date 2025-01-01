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
import net.accelbyte.sdk.api.iam.operation_responses.users_v4.PublicCreateUserV4OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicCreateUserV4
 *
 * <p>Create a new user with unique email address and username. **Required attributes:** - authType:
 * possible value is EMAILPASSWD - emailAddress: Please refer to the rule from
 * /v3/public/inputValidations API. - username: Please refer to the rule from
 * /v3/public/inputValidations API. - password: Please refer to the rule from
 * /v3/public/inputValidations API. - country: ISO3166-1 alpha-2 two letter, e.g. US. - dateOfBirth:
 * YYYY-MM-DD, e.g. 1990-01-01. valid values are between 1905-01-01 until current date. -
 * uniqueDisplayName: required when uniqueDisplayNameEnabled/UNIQUE_DISPLAY_NAME_ENABLED is true,
 * please refer to the rule from /v3/public/inputValidations API. - code: required when
 * mandatoryEmailVerificationEnabled config is true, please refer to the config from
 * /iam/v3/public/namespaces/{namespace}/config/{configKey} [GET] API.
 *
 * <p>**Not required attributes:** - displayName: Please refer to the rule from
 * /v3/public/inputValidations API. This endpoint support accepting agreements for the created user.
 * Supply the accepted agreements in acceptedPolicies attribute.
 */
@Getter
@Setter
public class PublicCreateUserV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/namespaces/{namespace}/users";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private AccountCreateUserRequestV4 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicCreateUserV4(
      String customBasePath, String namespace, AccountCreateUserRequestV4 body) {
    this.namespace = namespace;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public AccountCreateUserRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public PublicCreateUserV4OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicCreateUserV4OpResponse response = new PublicCreateUserV4OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new AccountCreateUserResponseV4().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
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
  public AccountCreateUserResponseV4 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new AccountCreateUserResponseV4().createFromJson(json);
  }
  */

}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.override_role_config_v3;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.override_role_config_v3.AdminGetRoleOverrideConfigV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetRoleOverrideConfigV3
 *
 * <p>Get role override config. This API has upsert behavior, if there is no config yet, it will
 * create a new one with inactive status.
 */
@Getter
@Setter
public class AdminGetRoleOverrideConfigV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/roleoverride";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String identity;

  /**
   * @param namespace required
   * @param identity required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetRoleOverrideConfigV3(String customBasePath, String namespace, String identity) {
    this.namespace = namespace;
    this.identity = identity;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("identity", this.identity == null ? null : Arrays.asList(this.identity));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.identity == null) {
      return false;
    }
    return true;
  }

  public AdminGetRoleOverrideConfigV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminGetRoleOverrideConfigV3OpResponse response =
        new AdminGetRoleOverrideConfigV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelRoleOverrideResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelRoleOverrideResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelRoleOverrideResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("identity", "None");
    return result;
  }

  public enum Identity {
    GAMEADMIN("GAME_ADMIN"),
    USER("USER"),
    VIEWONLY("VIEW_ONLY");

    private String value;

    Identity(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminGetRoleOverrideConfigV3Builder {
    private String identity;

    public AdminGetRoleOverrideConfigV3Builder identity(final String identity) {
      this.identity = identity;
      return this;
    }

    public AdminGetRoleOverrideConfigV3Builder identityFromEnum(final Identity identity) {
      this.identity = identity.toString();
      return this;
    }
  }
}

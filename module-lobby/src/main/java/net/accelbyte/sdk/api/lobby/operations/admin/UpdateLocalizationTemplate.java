/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.admin;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operation_responses.admin.UpdateLocalizationTemplateOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateLocalizationTemplate
 *
 * <p>Modify draft template
 */
@Getter
@Setter
public class UpdateLocalizationTemplate extends Operation {
  /** generated field's value */
  private String path =
      "/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String templateLanguage;
  private String templateSlug;
  private ModelUpdateTemplateRequest body;

  /**
   * @param namespace required
   * @param templateLanguage required
   * @param templateSlug required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateLocalizationTemplate(
      String customBasePath,
      String namespace,
      String templateLanguage,
      String templateSlug,
      ModelUpdateTemplateRequest body) {
    this.namespace = namespace;
    this.templateLanguage = templateLanguage;
    this.templateSlug = templateSlug;
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
    if (this.templateLanguage != null) {
      pathParams.put("templateLanguage", this.templateLanguage);
    }
    if (this.templateSlug != null) {
      pathParams.put("templateSlug", this.templateSlug);
    }
    return pathParams;
  }

  @Override
  public ModelUpdateTemplateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.templateLanguage == null) {
      return false;
    }
    if (this.templateSlug == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public UpdateLocalizationTemplateOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final UpdateLocalizationTemplateOpResponse response =
        new UpdateLocalizationTemplateOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 204){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}

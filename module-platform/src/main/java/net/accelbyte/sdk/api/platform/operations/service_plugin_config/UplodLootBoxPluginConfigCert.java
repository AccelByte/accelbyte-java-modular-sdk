/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.service_plugin_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.service_plugin_config.UplodLootBoxPluginConfigCertOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * uplodLootBoxPluginConfigCert
 *
 * <p>Upload lootbox plugin custom config tls cert.Other detail info: * Returns : updated service
 * plugin config
 */
@Getter
@Setter
public class UplodLootBoxPluginConfigCert extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/catalog/plugins/lootbox/customConfig/cert";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private File file;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UplodLootBoxPluginConfigCert(String customBasePath, String namespace, File file) {
    this.namespace = namespace;
    this.file = file;
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
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.file != null) {
      formDataParams.put("file", this.file);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public UplodLootBoxPluginConfigCertOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final UplodLootBoxPluginConfigCertOpResponse response =
        new UplodLootBoxPluginConfigCertOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new LootBoxPluginConfigInfo().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ValidationErrorEntity().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    }

    return response;
  }

  /*
  public LootBoxPluginConfigInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new LootBoxPluginConfigInfo().createFromJson(json);
  }
  */

}

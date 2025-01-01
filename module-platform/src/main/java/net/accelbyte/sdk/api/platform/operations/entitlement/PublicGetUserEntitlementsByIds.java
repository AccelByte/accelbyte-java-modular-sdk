/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.entitlement.PublicGetUserEntitlementsByIdsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicGetUserEntitlementsByIds
 *
 * <p>Get user entitlements by ids..
 *
 * <p>Other detail info:
 *
 * <p>* Returns : entitlement list
 */
@Getter
@Setter
public class PublicGetUserEntitlementsByIds extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/byIds";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean availablePlatformOnly;
  private List<String> ids;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetUserEntitlementsByIds(
      String customBasePath,
      String namespace,
      String userId,
      Boolean availablePlatformOnly,
      List<String> ids) {
    this.namespace = namespace;
    this.userId = userId;
    this.availablePlatformOnly = availablePlatformOnly;
    this.ids = ids;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "availablePlatformOnly",
        this.availablePlatformOnly == null
            ? null
            : Arrays.asList(String.valueOf(this.availablePlatformOnly)));
    queryParams.put(
        "ids",
        this.ids == null
            ? null
            : this.ids.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public PublicGetUserEntitlementsByIdsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicGetUserEntitlementsByIdsOpResponse response =
        new PublicGetUserEntitlementsByIdsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(
          new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {}));
    }

    return response;
  }

  /*
  public List<EntitlementInfo> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {});
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("availablePlatformOnly", "None");
    result.put("ids", "multi");
    return result;
  }
}

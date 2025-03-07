/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap_subscription;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.iap_subscription.GetThirdPartyPlatformSubscriptionOwnershipByProductIdOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getThirdPartyPlatformSubscriptionOwnershipByProductId
 *
 * <p>Get user third party subscription by subscription product id.
 */
@Getter
@Setter
public class GetThirdPartyPlatformSubscriptionOwnershipByProductId extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/iap/subscriptions/platforms/{platform}/ownership/byProductId";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;
  private String userId;
  private String productId;

  /**
   * @param namespace required
   * @param platform required
   * @param userId required
   * @param productId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetThirdPartyPlatformSubscriptionOwnershipByProductId(
      String customBasePath, String namespace, String platform, String userId, String productId) {
    this.namespace = namespace;
    this.platform = platform;
    this.userId = userId;
    this.productId = productId;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platform != null) {
      pathParams.put("platform", this.platform);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("productId", this.productId == null ? null : Arrays.asList(this.productId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platform == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.productId == null) {
      return false;
    }
    return true;
  }

  public GetThirdPartyPlatformSubscriptionOwnershipByProductIdOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetThirdPartyPlatformSubscriptionOwnershipByProductIdOpResponse response =
        new GetThirdPartyPlatformSubscriptionOwnershipByProductIdOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ThirdPartySubscriptionOwnership().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public ThirdPartySubscriptionOwnership parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ThirdPartySubscriptionOwnership().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("productId", "None");
    return result;
  }

  public enum Platform {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetThirdPartyPlatformSubscriptionOwnershipByProductIdBuilder {
    private String platform;

    public GetThirdPartyPlatformSubscriptionOwnershipByProductIdBuilder platform(
        final String platform) {
      this.platform = platform;
      return this;
    }

    public GetThirdPartyPlatformSubscriptionOwnershipByProductIdBuilder platformFromEnum(
        final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}

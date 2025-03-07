/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.wallet.QueryWalletsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryWallets
 *
 * <p>Query wallets. Other detail info:
 *
 * <p>* Returns : paginated wallets info
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class QueryWallets extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/wallets";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String currencyCode;
  private Integer limit;
  private Integer offset;
  private String origin;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryWallets(
      String customBasePath,
      String namespace,
      String currencyCode,
      Integer limit,
      Integer offset,
      String origin,
      String userId) {
    this.namespace = namespace;
    this.currencyCode = currencyCode;
    this.limit = limit;
    this.offset = offset;
    this.origin = origin;
    this.userId = userId;
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
    queryParams.put(
        "currencyCode", this.currencyCode == null ? null : Arrays.asList(this.currencyCode));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("origin", this.origin == null ? null : Arrays.asList(this.origin));
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public QueryWalletsOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final QueryWalletsOpResponse response = new QueryWalletsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new WalletPagingSlicedResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public WalletPagingSlicedResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new WalletPagingSlicedResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("currencyCode", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("origin", "None");
    result.put("userId", "None");
    return result;
  }

  public enum Origin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    Origin(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryWalletsBuilder {
    private String origin;

    public QueryWalletsBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public QueryWalletsBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }
  }
}

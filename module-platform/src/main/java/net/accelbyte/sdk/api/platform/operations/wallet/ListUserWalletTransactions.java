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
import net.accelbyte.sdk.api.platform.operation_responses.wallet.ListUserWalletTransactionsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * listUserWalletTransactions
 *
 * <p>List user wallet transactions ordered by create time desc. Other detail info:
 *
 * <p>* Returns : wallet transaction info
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class ListUserWalletTransactions extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/transactions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String walletId;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   * @param userId required
   * @param walletId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListUserWalletTransactions(
      String customBasePath,
      String namespace,
      String userId,
      String walletId,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.userId = userId;
    this.walletId = walletId;
    this.limit = limit;
    this.offset = offset;
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
    if (this.walletId != null) {
      pathParams.put("walletId", this.walletId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
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
    if (this.walletId == null) {
      return false;
    }
    return true;
  }

  public ListUserWalletTransactionsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final ListUserWalletTransactionsOpResponse response =
        new ListUserWalletTransactionsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new DetailedWalletTransactionPagingSlicedResult().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public DetailedWalletTransactionPagingSlicedResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new DetailedWalletTransactionPagingSlicedResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}

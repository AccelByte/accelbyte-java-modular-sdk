/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicGetMyRedirectionAfterLinkV3OpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicGetMyRedirectionAfterLinkV3
 *
 * <p>Get my redirect uri after link, this endpoint will return NotFound(404) if redirect uri is not
 * found
 */
@Getter
@Setter
public class PublicGetMyRedirectionAfterLinkV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/me/link/redirection";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String oneTimeLinkCode;

  /**
   * @param oneTimeLinkCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetMyRedirectionAfterLinkV3(String customBasePath, String oneTimeLinkCode) {
    this.oneTimeLinkCode = oneTimeLinkCode;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "oneTimeLinkCode",
        this.oneTimeLinkCode == null ? null : Arrays.asList(this.oneTimeLinkCode));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.oneTimeLinkCode == null) {
      return false;
    }
    return true;
  }

  public PublicGetMyRedirectionAfterLinkV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicGetMyRedirectionAfterLinkV3OpResponse response =
        new PublicGetMyRedirectionAfterLinkV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelOneTimeCodeLinkRedirectionResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 404) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError404(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelOneTimeCodeLinkRedirectionResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelOneTimeCodeLinkRedirectionResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("oneTimeLinkCode", "None");
    return result;
  }
}

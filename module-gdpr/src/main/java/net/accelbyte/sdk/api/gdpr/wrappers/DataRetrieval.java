/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class DataRetrieval {

  private RequestRunner sdk;

  public DataRetrieval(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetListPersonalDataRequest
   */
  public ModelsListPersonalDataResponse adminGetListPersonalDataRequest(
      AdminGetListPersonalDataRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserPersonalDataRequests
   */
  public ModelsUserPersonalDataResponse adminGetUserPersonalDataRequests(
      AdminGetUserPersonalDataRequests input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRequestDataRetrieval
   */
  public ModelsDataRetrievalResponse adminRequestDataRetrieval(AdminRequestDataRetrieval input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCancelUserPersonalDataRequest
   */
  public void adminCancelUserPersonalDataRequest(AdminCancelUserPersonalDataRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGeneratePersonalDataURL
   */
  public ModelsUserDataURL adminGeneratePersonalDataURL(AdminGeneratePersonalDataURL input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserPersonalDataRequests
   */
  public ModelsUserPersonalDataResponse publicGetUserPersonalDataRequests(
      PublicGetUserPersonalDataRequests input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicRequestDataRetrieval
   */
  public ModelsDataRetrievalResponse publicRequestDataRetrieval(PublicRequestDataRetrieval input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelUserPersonalDataRequest
   */
  public void publicCancelUserPersonalDataRequest(PublicCancelUserPersonalDataRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGeneratePersonalDataURL
   */
  public ModelsUserDataURL publicGeneratePersonalDataURL(PublicGeneratePersonalDataURL input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

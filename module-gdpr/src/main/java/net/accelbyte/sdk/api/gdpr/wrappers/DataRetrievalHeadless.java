/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval_headless.*;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class DataRetrievalHeadless {

  private RequestRunner sdk;
  private String customBasePath = "";

  public DataRetrievalHeadless(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("gdpr");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public DataRetrievalHeadless(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see PublicSubmitMyHeadlessPersonalDataRequest
   */
  public PublicSubmitMyHeadlessPersonalDataRequestOpResponse
      publicSubmitMyHeadlessPersonalDataRequest(PublicSubmitMyHeadlessPersonalDataRequest input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyHeadlessPersonalDataURL
   */
  public PublicGenerateMyHeadlessPersonalDataURLOpResponse publicGenerateMyHeadlessPersonalDataURL(
      PublicGenerateMyHeadlessPersonalDataURL input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyPersonalDataRequests
   */
  public PublicGetMyPersonalDataRequestsOpResponse publicGetMyPersonalDataRequests(
      PublicGetMyPersonalDataRequests input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSubmitMyPersonalDataRequest
   */
  public PublicSubmitMyPersonalDataRequestOpResponse publicSubmitMyPersonalDataRequest(
      PublicSubmitMyPersonalDataRequest input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelMyPersonalDataRequest
   */
  public PublicCancelMyPersonalDataRequestOpResponse publicCancelMyPersonalDataRequest(
      PublicCancelMyPersonalDataRequest input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

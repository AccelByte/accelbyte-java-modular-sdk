/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.wrappers;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.api.sessionhistory.operations.x_ray.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class XRay {

  private RequestRunner sdk;
  private String customBasePath = "";

  public XRay(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("sessionhistory");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public XRay(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see QueryXrayMatchPool
   */
  public ApimodelsXRayMatchPoolQueryResponse queryXrayMatchPool(QueryXrayMatchPool input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryDetailTickMatchPool
   */
  public ApimodelsXRayMatchPoolPodTickQueryResponse queryDetailTickMatchPool(
      QueryDetailTickMatchPool input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryDetailTickMatchPoolMatches
   */
  public ApimodelsXRayMatchPoolPodTickMatchResponse queryDetailTickMatchPoolMatches(
      QueryDetailTickMatchPoolMatches input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryDetailTickMatchPoolTicket
   */
  public ApimodelsXRayMatchPoolPodTickTicketResponse queryDetailTickMatchPoolTicket(
      QueryDetailTickMatchPoolTicket input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryMatchHistories
   */
  public ApimodelsXRayMatchHistorQueryResponse queryMatchHistories(QueryMatchHistories input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryMatchTicketHistories
   */
  public ApimodelsXRayMatchTicketHistoryQueryResponse queryMatchTicketHistories(
      QueryMatchTicketHistories input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryXrayMatch
   */
  public ApimodelsXRayMatchesQueryResponse queryXrayMatch(QueryXrayMatch input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryAcquiringDS
   */
  public ApimodelsXRayAcquiringDsQueryResponse queryAcquiringDS(QueryAcquiringDS input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryAcquiringDSWaitTimeAvg
   */
  public ApimodelsXRayAcquiringDsWaitTimeQueryResponse queryAcquiringDSWaitTimeAvg(
      QueryAcquiringDSWaitTimeAvg input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryMatchLengthDurationpAvg
   */
  public ApimodelsXRayMatchLengthDurationQueryResponse queryMatchLengthDurationpAvg(
      QueryMatchLengthDurationpAvg input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryMatchLengthDurationp99
   */
  public ApimodelsXRayMatchLengthDurationQueryResponse queryMatchLengthDurationp99(
      QueryMatchLengthDurationp99 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalActiveSession
   */
  public ApimodelsXRayTotalActiveSessionQueryResponse queryTotalActiveSession(
      QueryTotalActiveSession input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalMatchmakingMatch
   */
  public ApimodelsXRayMatchMatchmakingQueryResponse queryTotalMatchmakingMatch(
      QueryTotalMatchmakingMatch input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalPlayerPersession
   */
  public ApimodelsXRayTotalPlayerPersessionAVGQueryResponse queryTotalPlayerPersession(
      QueryTotalPlayerPersession input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalMatchmakingCanceled
   */
  public ApimodelsXRayCanceledMatchmakingTicketQueryResponse queryTotalMatchmakingCanceled(
      QueryTotalMatchmakingCanceled input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalMatchmakingCreated
   */
  public ApimodelsXRayCreatedMatchmakingTicketQueryResponse queryTotalMatchmakingCreated(
      QueryTotalMatchmakingCreated input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalMatchmakingExpired
   */
  public ApimodelsXRayExpiredMatchmakingTicketQueryResponse queryTotalMatchmakingExpired(
      QueryTotalMatchmakingExpired input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryTotalMatchmakingMatchTicket
   */
  public ApimodelsXRayMatchMatchmakingTicketQueryResponse queryTotalMatchmakingMatchTicket(
      QueryTotalMatchmakingMatchTicket input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryXrayTimelineByTicketID
   */
  public ApimodelsXRayTicketQueryResponse queryXrayTimelineByTicketID(
      QueryXrayTimelineByTicketID input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryXrayTimelineByUserID
   */
  public ApimodelsXRayTicketQueryResponse queryXrayTimelineByUserID(QueryXrayTimelineByUserID input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

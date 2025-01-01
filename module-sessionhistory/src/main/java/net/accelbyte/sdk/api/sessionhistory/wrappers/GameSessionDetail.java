/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.wrappers;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.api.sessionhistory.operation_responses.game_session_detail.*;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class GameSessionDetail {

  private RequestRunner sdk;
  private String customBasePath = "";

  public GameSessionDetail(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("sessionhistory");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public GameSessionDetail(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminQueryGameSessionDetail
   */
  public AdminQueryGameSessionDetailOpResponse adminQueryGameSessionDetail(
      AdminQueryGameSessionDetail input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameSessionDetail
   */
  public GetGameSessionDetailOpResponse getGameSessionDetail(GetGameSessionDetail input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryMatchmakingDetail
   */
  public AdminQueryMatchmakingDetailOpResponse adminQueryMatchmakingDetail(
      AdminQueryMatchmakingDetail input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMatchmakingDetailBySessionID
   */
  public AdminGetMatchmakingDetailBySessionIDOpResponse adminGetMatchmakingDetailBySessionID(
      AdminGetMatchmakingDetailBySessionID input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMatchmakingDetailByTicketID
   */
  public AdminGetMatchmakingDetailByTicketIDOpResponse adminGetMatchmakingDetailByTicketID(
      AdminGetMatchmakingDetailByTicketID input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryPartyDetail
   */
  public AdminQueryPartyDetailOpResponse adminQueryPartyDetail(AdminQueryPartyDetail input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPartyDetail
   */
  public GetPartyDetailOpResponse getPartyDetail(GetPartyDetail input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryTicketDetail
   */
  public AdminQueryTicketDetailOpResponse adminQueryTicketDetail(AdminQueryTicketDetail input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTicketDetailGetByTicketID
   */
  public AdminTicketDetailGetByTicketIDOpResponse adminTicketDetailGetByTicketID(
      AdminTicketDetailGetByTicketID input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryGameSessionMe
   */
  public PublicQueryGameSessionMeOpResponse publicQueryGameSessionMe(PublicQueryGameSessionMe input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

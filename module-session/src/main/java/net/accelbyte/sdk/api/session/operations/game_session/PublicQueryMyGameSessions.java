/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operation_responses.game_session.PublicQueryMyGameSessionsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicQueryMyGameSessions
 *
 * <p>Query user's game sessions. By default, API will return a list of user's active game sessions
 * (INVITED,JOINED,CONNECTED).
 *
 * <p>Session service has several DSInformation status to track DS request to DS providers: -
 * NEED_TO_REQUEST: number of active players hasn't reached session's minPlayers therefore DS has
 * not yet requested. - REQUESTED: DS is being requested to DSMC. - PREPARING: DS needs to call
 * manual set ready for the game session - AVAILABLE: DS is ready to use. The DSMC status for this
 * DS is either READY/BUSY. - FAILED_TO_REQUEST: DSMC fails to spin up a DS for session. - DS_ERROR:
 * DS provider fails to spin up the DS or the DS itself becomes unreachable - DS_CANCELLED: when
 * DSMC is preparing the DS, DSMC will give a temporary DS. In this phase, if you delete the game
 * session, the DS request will be canceled. - ENDED: when a game session (match) has finished and
 * DS has done its job, it will terminate itself. - UNKNOWN: if any unknown DS status is detected.
 * DSInformation has 2 fields for DS status: "status" and "statusV2". The "status" is there for
 * backward-compatibility, therefore we encourage to just rely on "statusV2" for the more updated
 * statuses. DS Source can be DSMC, AMS or custom. In DSMC, a DS request will be put in queue if
 * they dont have available buffers, and DSMC will let the service knows when they finished spinning
 * it up. While AMS doesn't have a concept of queue. Therefore some "DSInformation.statusV2" only
 * applicable for DSMC.
 */
@Getter
@Setter
public class PublicQueryMyGameSessions extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/users/me/gamesessions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String order;
  private String orderBy;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryMyGameSessions(
      String customBasePath, String namespace, String order, String orderBy, String status) {
    this.namespace = namespace;
    this.order = order;
    this.orderBy = orderBy;
    this.status = status;
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
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PublicQueryMyGameSessionsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicQueryMyGameSessionsOpResponse response = new PublicQueryMyGameSessionsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApimodelsGameSessionQueryResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ApimodelsGameSessionQueryResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApimodelsGameSessionQueryResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("status", "None");
    return result;
  }
}

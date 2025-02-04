/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.challenge_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operation_responses.challenge_configuration.AdminUpdateChallengeOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminUpdateChallenge
 *
 * <p>- Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [UPDATE] Request body: - name:
 * name of the challenge - description: text describing about the challenge (optional) - startDate:
 * timestamp of when the challenge is started - endDate: timestamp of when the challenge is ended
 * (optional) - endAfter: describe number of period challenge will be retired after (optional). To
 * configure challenge that never end, leave the endDate and endAfter field null/empty. -
 * repeatAfter: describe number of period challenge's goals will be repeated after. Leave it empty
 * if you don't want to repeat the challenge. - rotation: describe how long goals in a challenge
 * will be available for players to progress before rotated with another goals.
 * (DAILY|WEEKLY|MONTHLY|NONE) - activeGoalsPerRotation: number of goals per rotation (currently
 * only applicable for RANDOMIZE assignment) - assignmentRule: describe how the goals will be
 * assigned and scheduled to users. (FIXED|RANDOMIZED|UNSCHEDULED|CUSTOM) - goalsVisibility:
 * describe whether users can see all goals under challenge, or only active goal in one rotation
 * period only. (SHOWALL|PERIODONLY) - resetConfig: describe when rotation reset will happen
 * (optional). - resetTime: Reset time must follow hours:minutes in 24 hours format (e.g. 01:30,
 * 23:15) and in UTC timezone. Default to "00:00" - resetDay: Reset Day follows the ISO-8601
 * standard, from 1 (Monday) to 7 (Sunday). Default to 1 in WEEKLY rotation. - resetDate: Reset Date
 * must be a number 1 - 31. Default to 1 in MONTHLY rotation. - randomizedPerRotation: - true: each
 * goal will be randomly assigned to multiple periods - false: a goal will only be assigned to one
 * period - tags: challenge's labels.
 */
@Getter
@Setter
public class AdminUpdateChallenge extends Operation {
  /** generated field's value */
  private String path = "/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String challengeCode;

  private String namespace;
  private ModelUpdateChallengeRequest body;

  /**
   * @param challengeCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateChallenge(
      String customBasePath,
      String challengeCode,
      String namespace,
      ModelUpdateChallengeRequest body) {
    this.challengeCode = challengeCode;
    this.namespace = namespace;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.challengeCode != null) {
      pathParams.put("challengeCode", this.challengeCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelUpdateChallengeRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.challengeCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminUpdateChallengeOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminUpdateChallengeOpResponse response = new AdminUpdateChallengeOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelChallengeResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseError().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ResponseError().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelChallengeResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelChallengeResponse().createFromJson(json);
  }
  */

}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.wrappers;

import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operations.rule_sets.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class RuleSets {

  private RequestRunner sdk;

  public RuleSets(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RuleSetList
   */
  public ApiListRuleSetsResponse ruleSetList(RuleSetList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateRuleSet
   */
  public void createRuleSet(CreateRuleSet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RuleSetDetails
   */
  public ApiRuleSetPayload ruleSetDetails(RuleSetDetails input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateRuleSet
   */
  public ApiRuleSetPayload updateRuleSet(UpdateRuleSet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteRuleSet
   */
  public void deleteRuleSet(DeleteRuleSet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

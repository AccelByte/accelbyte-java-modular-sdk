/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.eligibilities.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Eligibilities {

  private RequestRunner sdk;

  public Eligibilities(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveEligibilitiesPublic
   */
  public List<RetrieveUserEligibilitiesResponse> retrieveEligibilitiesPublic(
      RetrieveEligibilitiesPublic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveEligibilitiesPublicIndirect
   */
  public RetrieveUserEligibilitiesIndirectResponse retrieveEligibilitiesPublicIndirect(
      RetrieveEligibilitiesPublicIndirect input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

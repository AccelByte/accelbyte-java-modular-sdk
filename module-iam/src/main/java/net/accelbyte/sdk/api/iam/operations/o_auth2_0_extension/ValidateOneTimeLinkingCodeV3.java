/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ValidateOneTimeLinkingCodeV3
 *
 * <p>This endpoint is being used to validate one time link code.
 */
@Getter
@Setter
public class ValidateOneTimeLinkingCodeV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/link/code/validate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String oneTimeLinkCode;

  /**
   * @param oneTimeLinkCode required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ValidateOneTimeLinkingCodeV3(String oneTimeLinkCode) {
    this.oneTimeLinkCode = oneTimeLinkCode;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.oneTimeLinkCode != null) {
      formDataParams.put("oneTimeLinkCode", this.oneTimeLinkCode);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.oneTimeLinkCode == null) {
      return false;
    }
    return true;
  }

  public OauthmodelOneTimeLinkingCodeValidationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelOneTimeLinkingCodeValidationResponse().createFromJson(json);
  }
}

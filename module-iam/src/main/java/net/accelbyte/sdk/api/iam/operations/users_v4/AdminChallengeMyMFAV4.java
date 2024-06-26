/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
 * AdminChallengeMyMFAV4
 *
 * <p>This endpoint will verify user's' MFA code and generate a MFA token.
 */
@Getter
@Setter
public class AdminChallengeMyMFAV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/challenge/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String code;

  private String factor;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminChallengeMyMFAV4(String customBasePath, String code, String factor) {
    this.code = code;
    this.factor = factor;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.factor != null) {
      formDataParams.put("factor", this.factor);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ModelUserMFATokenResponseV4 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserMFATokenResponseV4().createFromJson(json);
  }
}

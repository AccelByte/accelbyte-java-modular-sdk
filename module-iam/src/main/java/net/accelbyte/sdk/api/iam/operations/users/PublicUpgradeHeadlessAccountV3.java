/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * PublicUpgradeHeadlessAccountV3
 *
 * <p>If validateOnly is set false, consume code and upgrade headless account and automatically
 * verified the email address if it is succeeded The endpoint upgrades a headless account by linking
 * the headless account with the email address and the password. By upgrading the headless account
 * into a full account, the user could use the email address and password for using Justice IAM. The
 * endpoint is a shortcut for upgrading a headless account and verifying the email address in one
 * call. In order to get a verification code for the endpoint, please check the send verification
 * code endpoint. This endpoint also have an ability to update user data (if the user data field is
 * specified) right after the upgrade account process is done. Supported user data fields : -
 * displayName - dateOfBirth : format YYYY-MM-DD, e.g. 2019-04-29 - country : format ISO3166-1
 * alpha-2 two letter, e.g. US
 *
 * <p>action code : 10124
 */
@Getter
@Setter
public class PublicUpgradeHeadlessAccountV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/me/headless/code/verify";

  private String customBasePath = "";
  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpgradeHeadlessAccountV3(
      String customBasePath,
      String namespace,
      ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 body) {
    this.namespace = namespace;
    this.body = body;
    this.customBasePath = customBasePath;

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
  public ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponseV3().createFromJson(json);
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_config.TestXsollaConfigOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * testXsollaConfig
 *
 * <p>[Not supported yet in AGS Shared Cloud] Check xsolla configuration, Reference: [Xsolla
 * Document](https://developers.xsolla.com/?#simple-checkout).
 *
 * <p>#### Check List:
 *
 * <p>* merchantId * projectId * apiKey
 *
 * <p>#### Non-check list:
 *
 * <p>* projectSecretKey
 *
 * <p>Other detail info: * Returns : test result
 */
@Getter
@Setter
public class TestXsollaConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/xsollaconfig/test";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private XsollaConfig body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TestXsollaConfig(String customBasePath, XsollaConfig body) {
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public XsollaConfig getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public TestXsollaConfigOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final TestXsollaConfigOpResponse response = new TestXsollaConfigOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new TestResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public TestResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new TestResult().createFromJson(json);
  }
  */

}

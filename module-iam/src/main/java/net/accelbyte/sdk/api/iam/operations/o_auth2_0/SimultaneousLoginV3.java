/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0.SimultaneousLoginV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SimultaneousLoginV3
 *
 * <p># This endpoint is in ALPHA, avoid using this endpoint fow now, reach out to AB support for
 * inquiries
 *
 * <p>Simultaneous login flow.
 *
 * <p>The primary goals of this project are to entitle players to authenticate on a native PC
 * platform(Steam/Epic) and the PlayStation platform, link their accounts, and provide support for
 * platform sync with a valid 3rd platform access token.
 *
 * <p>## Given a valid native ticket and empty simultaneous ticket, these cases will be failed -
 * Native ticket's account is not linked AGS account yet - Native ticket's account is linked AGS
 * account, but AGS account is not linked simultaneous platform yet - Native ticket's account is
 * linked AGS account, AGS account is linked simultaneous platform but there is no available
 * simultaneous token.(only if this platform is expected to store the platform token)
 *
 * <p>## Given a valid native ticket and empty simultaneous ticket, this case will be success -
 * Native ticket's account already linked AGS account, this AGS account already linked simultaneous
 * platform. There is valid simultaneous token.(this is required only when this simultaneous is
 * expected to cache platform token)
 *
 * <p>## Given a valid native ticket token and valid simultaneous ticket, these cases will be failed
 * #### Native ticket's account is already linked with AGS account - Native linked AGS account is
 * linked this simultaneous platform but is different with simultaneous ticket's account - Native
 * linked AGS account is not linked with simultaneous but has a linking history with simultaneous
 * platform and it is different with simultaneous ticket's account #### Native ticket's account is
 * not linked with AGS account and Simultaneous ticket's account is already linked wth AGS account -
 * Simultaneous linked AGS account is linked this native platform but is different with native
 * ticket's account - Simultaneous linked AGS account is not linked with native but has a linking
 * history with native platform and it is different with native ticket's account
 *
 * <p>## Given a valid native ticket and valid simultaneous ticket, these cases will be success -
 * Native ticket's account & Simultaneous ticket's account are both not linked to AGS account yet -
 * Native ticket's account & Simultaneous ticket's account are already linked to same AGS account
 */
@Getter
@Setter
public class SimultaneousLoginV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/simultaneousLogin";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String simultaneousPlatform;

  private String simultaneousTicket;
  private String nativePlatform;
  private String nativePlatformTicket;

  /**
   * @param nativePlatform required
   * @param nativePlatformTicket required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SimultaneousLoginV3(
      String customBasePath,
      String simultaneousPlatform,
      String simultaneousTicket,
      String nativePlatform,
      String nativePlatformTicket) {
    this.simultaneousPlatform = simultaneousPlatform;
    this.simultaneousTicket = simultaneousTicket;
    this.nativePlatform = nativePlatform;
    this.nativePlatformTicket = nativePlatformTicket;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.simultaneousPlatform != null) {
      formDataParams.put("simultaneousPlatform", this.simultaneousPlatform);
    }
    if (this.simultaneousTicket != null) {
      formDataParams.put("simultaneousTicket", this.simultaneousTicket);
    }
    if (this.nativePlatform != null) {
      formDataParams.put("nativePlatform", this.nativePlatform);
    }
    if (this.nativePlatformTicket != null) {
      formDataParams.put("nativePlatformTicket", this.nativePlatformTicket);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.nativePlatform == null) {
      return false;
    }
    if (this.nativePlatformTicket == null) {
      return false;
    }
    return true;
  }

  public SimultaneousLoginV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SimultaneousLoginV3OpResponse response = new SimultaneousLoginV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public OauthmodelTokenResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthmodelTokenResponseV3().createFromJson(json);
  }
  */

  public enum NativePlatform {
    Epicgames("epicgames"),
    Steam("steam");

    private String value;

    NativePlatform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SimultaneousLoginV3Builder {
    private String nativePlatform;

    public SimultaneousLoginV3Builder nativePlatform(final String nativePlatform) {
      this.nativePlatform = nativePlatform;
      return this;
    }

    public SimultaneousLoginV3Builder nativePlatformFromEnum(final NativePlatform nativePlatform) {
      this.nativePlatform = nativePlatform.toString();
      return this;
    }
  }
}

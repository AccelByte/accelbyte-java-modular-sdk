/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.agreement_with_namespace.*;
import net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AgreementWithNamespace {

  private RequestRunner sdk;
  private String customBasePath = "";

  public AgreementWithNamespace(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("legal");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public AgreementWithNamespace(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see RetrieveAcceptedAgreementsForMultiUsers
   */
  public RetrieveAcceptedAgreementsForMultiUsersOpResponse retrieveAcceptedAgreementsForMultiUsers(
      RetrieveAcceptedAgreementsForMultiUsers input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAcceptedAgreements1
   */
  public RetrieveAcceptedAgreements1OpResponse retrieveAcceptedAgreements1(
      RetrieveAcceptedAgreements1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllUsersByPolicyVersion1
   */
  public RetrieveAllUsersByPolicyVersion1OpResponse retrieveAllUsersByPolicyVersion1(
      RetrieveAllUsersByPolicyVersion1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DownloadExportedAgreementsInCSV
   */
  public DownloadExportedAgreementsInCSVOpResponse downloadExportedAgreementsInCSV(
      DownloadExportedAgreementsInCSV input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InitiateExportAgreementsToCSV
   */
  public InitiateExportAgreementsToCSVOpResponse initiateExportAgreementsToCSV(
      InitiateExportAgreementsToCSV input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

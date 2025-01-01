/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_record.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminRecord {

  private RequestRunner sdk;
  private String customBasePath = "";

  public AdminRecord(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public AdminRecord(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminListAdminGameRecordV1
   */
  public AdminListAdminGameRecordV1OpResponse adminListAdminGameRecordV1(
      AdminListAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetAdminGameRecordV1
   */
  public AdminBulkGetAdminGameRecordV1OpResponse adminBulkGetAdminGameRecordV1(
      AdminBulkGetAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAdminGameRecordV1
   */
  public AdminGetAdminGameRecordV1OpResponse adminGetAdminGameRecordV1(
      AdminGetAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutAdminGameRecordV1
   */
  public AdminPutAdminGameRecordV1OpResponse adminPutAdminGameRecordV1(
      AdminPutAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostAdminGameRecordV1
   */
  public AdminPostAdminGameRecordV1OpResponse adminPostAdminGameRecordV1(
      AdminPostAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteAdminGameRecordV1
   */
  public AdminDeleteAdminGameRecordV1OpResponse adminDeleteAdminGameRecordV1(
      AdminDeleteAdminGameRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetAdminPlayerRecordByUserIdsV1
   */
  public BulkGetAdminPlayerRecordByUserIdsV1OpResponse bulkGetAdminPlayerRecordByUserIdsV1(
      BulkGetAdminPlayerRecordByUserIdsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListAdminUserRecordsV1
   */
  public AdminListAdminUserRecordsV1OpResponse adminListAdminUserRecordsV1(
      AdminListAdminUserRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetAdminPlayerRecordV1
   */
  public AdminBulkGetAdminPlayerRecordV1OpResponse adminBulkGetAdminPlayerRecordV1(
      AdminBulkGetAdminPlayerRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAdminPlayerRecordV1
   */
  public AdminGetAdminPlayerRecordV1OpResponse adminGetAdminPlayerRecordV1(
      AdminGetAdminPlayerRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutAdminPlayerRecordV1
   */
  public AdminPutAdminPlayerRecordV1OpResponse adminPutAdminPlayerRecordV1(
      AdminPutAdminPlayerRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerAdminRecordV1
   */
  public AdminPostPlayerAdminRecordV1OpResponse adminPostPlayerAdminRecordV1(
      AdminPostPlayerAdminRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteAdminPlayerRecordV1
   */
  public AdminDeleteAdminPlayerRecordV1OpResponse adminDeleteAdminPlayerRecordV1(
      AdminDeleteAdminPlayerRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

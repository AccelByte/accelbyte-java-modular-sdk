/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_player_binary_record.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_player_binary_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminPlayerBinaryRecord {

  private RequestRunner sdk;
  private String customBasePath = "";

  public AdminPlayerBinaryRecord(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public AdminPlayerBinaryRecord(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminListPlayerBinaryRecordsV1
   */
  public AdminListPlayerBinaryRecordsV1OpResponse adminListPlayerBinaryRecordsV1(
      AdminListPlayerBinaryRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerBinaryRecordV1
   */
  public AdminPostPlayerBinaryRecordV1OpResponse adminPostPlayerBinaryRecordV1(
      AdminPostPlayerBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerBinaryRecordV1
   */
  public AdminGetPlayerBinaryRecordV1OpResponse adminGetPlayerBinaryRecordV1(
      AdminGetPlayerBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerBinaryRecordV1
   */
  public AdminPutPlayerBinaryRecordV1OpResponse adminPutPlayerBinaryRecordV1(
      AdminPutPlayerBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlayerBinaryRecordV1
   */
  public AdminDeletePlayerBinaryRecordV1OpResponse adminDeletePlayerBinaryRecordV1(
      AdminDeletePlayerBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerBinaryRecorMetadataV1
   */
  public AdminPutPlayerBinaryRecorMetadataV1OpResponse adminPutPlayerBinaryRecorMetadataV1(
      AdminPutPlayerBinaryRecorMetadataV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerBinaryPresignedURLV1
   */
  public AdminPostPlayerBinaryPresignedURLV1OpResponse adminPostPlayerBinaryPresignedURLV1(
      AdminPostPlayerBinaryPresignedURLV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

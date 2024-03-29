/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminGameBinaryRecord {

  private RequestRunner sdk;

  public AdminGameBinaryRecord(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListGameBinaryRecordsV1
   */
  public ModelsListGameBinaryRecordsAdminResponse adminListGameBinaryRecordsV1(
      AdminListGameBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostGameBinaryRecordV1
   */
  public ModelsUploadBinaryRecordResponse adminPostGameBinaryRecordV1(
      AdminPostGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetGameBinaryRecordV1
   */
  public ModelsGameBinaryRecordAdminResponse adminGetGameBinaryRecordV1(
      AdminGetGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutGameBinaryRecordV1
   */
  public ModelsGameBinaryRecordAdminResponse adminPutGameBinaryRecordV1(
      AdminPutGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteGameBinaryRecordV1
   */
  public void adminDeleteGameBinaryRecordV1(AdminDeleteGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutGameBinaryRecorMetadataV1
   */
  public ModelsGameBinaryRecordAdminResponse adminPutGameBinaryRecorMetadataV1(
      AdminPutGameBinaryRecorMetadataV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostGameBinaryPresignedURLV1
   */
  public ModelsUploadBinaryRecordResponse adminPostGameBinaryPresignedURLV1(
      AdminPostGameBinaryPresignedURLV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

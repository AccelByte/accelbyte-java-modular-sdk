/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_player_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminPlayerRecord {

  private RequestRunner sdk;
  private String customBasePath = "";

  public AdminPlayerRecord(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public AdminPlayerRecord(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see BulkGetPlayerRecordSizeHandlerV1
   */
  public ModelsBulkGetPlayerRecordSizeResponse bulkGetPlayerRecordSizeHandlerV1(
      BulkGetPlayerRecordSizeHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListPlayerRecordHandlerV1
   * @deprecated
   */
  @Deprecated
  public ModelsListPlayerRecordKeysResponse listPlayerRecordHandlerV1(
      ListPlayerRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkPutPlayerRecordsByKeyHandlerV1
   */
  public List<ModelsBulkUpdatePlayerRecordByKeyResponse> adminBulkPutPlayerRecordsByKeyHandlerV1(
      AdminBulkPutPlayerRecordsByKeyHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetPlayerRecordsByUserIDsHandlerV1
   */
  public ModelsBulkGetPlayerRecordResponse adminBulkGetPlayerRecordsByUserIDsHandlerV1(
      AdminBulkGetPlayerRecordsByUserIDsHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRetrievePlayerRecords
   */
  public ModelsListPlayerRecordKeysResponse adminRetrievePlayerRecords(
      AdminRetrievePlayerRecords input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerRecordsHandlerV1
   */
  public List<ModelsBulkUpdatePlayerRecordResponse> adminPutPlayerRecordsHandlerV1(
      AdminPutPlayerRecordsHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerRecordsHandlerV1
   */
  public ModelsBulkGetAdminPlayerRecordResponse adminGetPlayerRecordsHandlerV1(
      AdminGetPlayerRecordsHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminGetPlayerRecordHandlerV1(
      AdminGetPlayerRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminPutPlayerRecordHandlerV1(
      AdminPutPlayerRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminPostPlayerRecordHandlerV1(
      AdminPostPlayerRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlayerRecordHandlerV1
   */
  public void adminDeletePlayerRecordHandlerV1(AdminDeletePlayerRecordHandlerV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminGetPlayerPublicRecordHandlerV1(
      AdminGetPlayerPublicRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminPutPlayerPublicRecordHandlerV1(
      AdminPutPlayerPublicRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse adminPostPlayerPublicRecordHandlerV1(
      AdminPostPlayerPublicRecordHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlayerPublicRecordHandlerV1
   */
  public void adminDeletePlayerPublicRecordHandlerV1(AdminDeletePlayerPublicRecordHandlerV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerRecordSizeHandlerV1
   */
  public ModelsPlayerRecordSizeResponse adminGetPlayerRecordSizeHandlerV1(
      AdminGetPlayerRecordSizeHandlerV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

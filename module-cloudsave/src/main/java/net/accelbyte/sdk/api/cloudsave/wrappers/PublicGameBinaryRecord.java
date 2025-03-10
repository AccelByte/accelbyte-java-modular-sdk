/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.public_game_binary_record.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_binary_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PublicGameBinaryRecord {

  private RequestRunner sdk;
  private String customBasePath = "";

  public PublicGameBinaryRecord(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public PublicGameBinaryRecord(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see ListGameBinaryRecordsV1
   */
  public ListGameBinaryRecordsV1OpResponse listGameBinaryRecordsV1(ListGameBinaryRecordsV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostGameBinaryRecordV1
   */
  public PostGameBinaryRecordV1OpResponse postGameBinaryRecordV1(PostGameBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetGameBinaryRecordV1
   */
  public BulkGetGameBinaryRecordV1OpResponse bulkGetGameBinaryRecordV1(
      BulkGetGameBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameBinaryRecordV1
   */
  public GetGameBinaryRecordV1OpResponse getGameBinaryRecordV1(GetGameBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutGameBinaryRecordV1
   */
  public PutGameBinaryRecordV1OpResponse putGameBinaryRecordV1(PutGameBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGameBinaryRecordV1
   */
  public DeleteGameBinaryRecordV1OpResponse deleteGameBinaryRecordV1(DeleteGameBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostGameBinaryPresignedURLV1
   */
  public PostGameBinaryPresignedURLV1OpResponse postGameBinaryPresignedURLV1(
      PostGameBinaryPresignedURLV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

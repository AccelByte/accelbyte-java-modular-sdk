/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.public_player_binary_record.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_binary_record.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PublicPlayerBinaryRecord {

  private RequestRunner sdk;
  private String customBasePath = "";

  public PublicPlayerBinaryRecord(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public PublicPlayerBinaryRecord(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see BulkGetPlayerPublicBinaryRecordsV1
   */
  public BulkGetPlayerPublicBinaryRecordsV1OpResponse bulkGetPlayerPublicBinaryRecordsV1(
      BulkGetPlayerPublicBinaryRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListMyBinaryRecordsV1
   */
  public ListMyBinaryRecordsV1OpResponse listMyBinaryRecordsV1(ListMyBinaryRecordsV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetMyBinaryRecordV1
   */
  public BulkGetMyBinaryRecordV1OpResponse bulkGetMyBinaryRecordV1(BulkGetMyBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerBinaryRecordV1
   */
  public PostPlayerBinaryRecordV1OpResponse postPlayerBinaryRecordV1(PostPlayerBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListOtherPlayerPublicBinaryRecordsV1
   */
  public ListOtherPlayerPublicBinaryRecordsV1OpResponse listOtherPlayerPublicBinaryRecordsV1(
      ListOtherPlayerPublicBinaryRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetOtherPlayerPublicBinaryRecordsV1
   */
  public BulkGetOtherPlayerPublicBinaryRecordsV1OpResponse bulkGetOtherPlayerPublicBinaryRecordsV1(
      BulkGetOtherPlayerPublicBinaryRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerBinaryRecordV1
   */
  public GetPlayerBinaryRecordV1OpResponse getPlayerBinaryRecordV1(GetPlayerBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerBinaryRecordV1
   */
  public PutPlayerBinaryRecordV1OpResponse putPlayerBinaryRecordV1(PutPlayerBinaryRecordV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeletePlayerBinaryRecordV1
   */
  public DeletePlayerBinaryRecordV1OpResponse deletePlayerBinaryRecordV1(
      DeletePlayerBinaryRecordV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerBinaryRecorMetadataV1
   */
  public PutPlayerBinaryRecorMetadataV1OpResponse putPlayerBinaryRecorMetadataV1(
      PutPlayerBinaryRecorMetadataV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerBinaryPresignedURLV1
   */
  public PostPlayerBinaryPresignedURLV1OpResponse postPlayerBinaryPresignedURLV1(
      PostPlayerBinaryPresignedURLV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerPublicBinaryRecordsV1
   */
  public GetPlayerPublicBinaryRecordsV1OpResponse getPlayerPublicBinaryRecordsV1(
      GetPlayerPublicBinaryRecordsV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;


import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.public_player_record.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicPlayerRecord {

    private RequestRunner sdk;
    private String customBasePath = "";

    public PublicPlayerRecord(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public PublicPlayerRecord(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see BulkGetPlayerPublicRecordHandlerV1
     */
    public BulkGetPlayerPublicRecordHandlerV1OpResponse bulkGetPlayerPublicRecordHandlerV1(BulkGetPlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RetrievePlayerRecords
     */
    public RetrievePlayerRecordsOpResponse retrievePlayerRecords(RetrievePlayerRecords input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetPlayerRecordsBulkHandlerV1
     */
    public GetPlayerRecordsBulkHandlerV1OpResponse getPlayerRecordsBulkHandlerV1(GetPlayerRecordsBulkHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicDeletePlayerPublicRecordHandlerV1
     */
    public PublicDeletePlayerPublicRecordHandlerV1OpResponse publicDeletePlayerPublicRecordHandlerV1(PublicDeletePlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetOtherPlayerPublicRecordKeyHandlerV1
     */
    public GetOtherPlayerPublicRecordKeyHandlerV1OpResponse getOtherPlayerPublicRecordKeyHandlerV1(GetOtherPlayerPublicRecordKeyHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetOtherPlayerPublicRecordHandlerV1
     */
    public GetOtherPlayerPublicRecordHandlerV1OpResponse getOtherPlayerPublicRecordHandlerV1(GetOtherPlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetPlayerRecordHandlerV1
     */
    public GetPlayerRecordHandlerV1OpResponse getPlayerRecordHandlerV1(GetPlayerRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PutPlayerRecordHandlerV1
     */
    public PutPlayerRecordHandlerV1OpResponse putPlayerRecordHandlerV1(PutPlayerRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PostPlayerRecordHandlerV1
     */
    public PostPlayerRecordHandlerV1OpResponse postPlayerRecordHandlerV1(PostPlayerRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeletePlayerRecordHandlerV1
     */
    public DeletePlayerRecordHandlerV1OpResponse deletePlayerRecordHandlerV1(DeletePlayerRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetPlayerPublicRecordHandlerV1
     */
    public GetPlayerPublicRecordHandlerV1OpResponse getPlayerPublicRecordHandlerV1(GetPlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PutPlayerPublicRecordHandlerV1
     */
    public PutPlayerPublicRecordHandlerV1OpResponse putPlayerPublicRecordHandlerV1(PutPlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PostPlayerPublicRecordHandlerV1
     */
    public PostPlayerPublicRecordHandlerV1OpResponse postPlayerPublicRecordHandlerV1(PostPlayerPublicRecordHandlerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}

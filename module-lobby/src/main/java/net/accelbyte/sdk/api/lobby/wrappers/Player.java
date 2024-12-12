/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;


import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.player.*;
import net.accelbyte.sdk.api.lobby.operation_responses.player.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class Player {

    private RequestRunner sdk;
    private String customBasePath = "";

    public Player(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("lobby");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public Player(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminGetLobbyCCU
     */
    public AdminGetLobbyCCUOpResponse adminGetLobbyCCU(AdminGetLobbyCCU input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetBulkPlayerBlockedPlayersV1
     */
    public AdminGetBulkPlayerBlockedPlayersV1OpResponse adminGetBulkPlayerBlockedPlayersV1(AdminGetBulkPlayerBlockedPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetAllPlayerSessionAttribute
     */
    public AdminGetAllPlayerSessionAttributeOpResponse adminGetAllPlayerSessionAttribute(AdminGetAllPlayerSessionAttribute input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminSetPlayerSessionAttribute
     */
    public AdminSetPlayerSessionAttributeOpResponse adminSetPlayerSessionAttribute(AdminSetPlayerSessionAttribute input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetPlayerSessionAttribute
     */
    public AdminGetPlayerSessionAttributeOpResponse adminGetPlayerSessionAttribute(AdminGetPlayerSessionAttribute input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetPlayerBlockedPlayersV1
     */
    public AdminGetPlayerBlockedPlayersV1OpResponse adminGetPlayerBlockedPlayersV1(AdminGetPlayerBlockedPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetPlayerBlockedByPlayersV1
     */
    public AdminGetPlayerBlockedByPlayersV1OpResponse adminGetPlayerBlockedByPlayersV1(AdminGetPlayerBlockedByPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminBulkBlockPlayersV1
     */
    public AdminBulkBlockPlayersV1OpResponse adminBulkBlockPlayersV1(AdminBulkBlockPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminBulkUnblockPlayersV1
     */
    public AdminBulkUnblockPlayersV1OpResponse adminBulkUnblockPlayersV1(AdminBulkUnblockPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicPlayerBlockPlayersV1
     */
    public PublicPlayerBlockPlayersV1OpResponse publicPlayerBlockPlayersV1(PublicPlayerBlockPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetPlayerBlockedPlayersV1
     */
    public PublicGetPlayerBlockedPlayersV1OpResponse publicGetPlayerBlockedPlayersV1(PublicGetPlayerBlockedPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetPlayerBlockedByPlayersV1
     */
    public PublicGetPlayerBlockedByPlayersV1OpResponse publicGetPlayerBlockedByPlayersV1(PublicGetPlayerBlockedByPlayersV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicUnblockPlayerV1
     */
    public PublicUnblockPlayerV1OpResponse publicUnblockPlayerV1(PublicUnblockPlayerV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}

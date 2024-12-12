/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.wrappers;


import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operations.backfill.*;
import net.accelbyte.sdk.api.match2.operation_responses.backfill.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class Backfill {

    private RequestRunner sdk;
    private String customBasePath = "";

    public Backfill(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("match2");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public Backfill(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see CreateBackfill
     */
    public CreateBackfillOpResponse createBackfill(CreateBackfill input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetBackfillProposal
     */
    public GetBackfillProposalOpResponse getBackfillProposal(GetBackfillProposal input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetBackfill
     */
    public GetBackfillOpResponse getBackfill(GetBackfill input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteBackfill
     */
    public DeleteBackfillOpResponse deleteBackfill(DeleteBackfill input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AcceptBackfill
     */
    public AcceptBackfillOpResponse acceptBackfill(AcceptBackfill input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RejectBackfill
     */
    public RejectBackfillOpResponse rejectBackfill(RejectBackfill input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}

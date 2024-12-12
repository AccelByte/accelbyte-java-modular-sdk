/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;


import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.notification_subscription.*;
import net.accelbyte.sdk.api.csm.operation_responses.notification_subscription.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class NotificationSubscription {

    private RequestRunner sdk;
    private String customBasePath = "";

    public NotificationSubscription(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("csm");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public NotificationSubscription(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see GetNotificationSubscriberListV2
     */
    public GetNotificationSubscriberListV2OpResponse getNotificationSubscriberListV2(GetNotificationSubscriberListV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see BulkSaveSubscriptionAppNotificationV2
     */
    public BulkSaveSubscriptionAppNotificationV2OpResponse bulkSaveSubscriptionAppNotificationV2(BulkSaveSubscriptionAppNotificationV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see SubscribeAppNotificationV2
     */
    public SubscribeAppNotificationV2OpResponse subscribeAppNotificationV2(SubscribeAppNotificationV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetSubscriptionV2Handler
     */
    public GetSubscriptionV2HandlerOpResponse getSubscriptionV2Handler(GetSubscriptionV2Handler input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see SubscribeV2Handler
     */
    public SubscribeV2HandlerOpResponse subscribeV2Handler(SubscribeV2Handler input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see UnsubscribeV2Handler
     */
    public UnsubscribeV2HandlerOpResponse unsubscribeV2Handler(UnsubscribeV2Handler input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteSubscriptionAppNotificationByUserIDV2
     */
    public DeleteSubscriptionAppNotificationByUserIDV2OpResponse deleteSubscriptionAppNotificationByUserIDV2(DeleteSubscriptionAppNotificationByUserIDV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteSubscriptionAppNotificationV2
     * @deprecated
     */
    @Deprecated
    public DeleteSubscriptionAppNotificationV2OpResponse deleteSubscriptionAppNotificationV2(DeleteSubscriptionAppNotificationV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}

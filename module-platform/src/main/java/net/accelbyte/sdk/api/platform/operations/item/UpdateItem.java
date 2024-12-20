/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.platform.operation_responses.item.UpdateItemOpResponse;

/**
 * updateItem
 *
 * This API is used to update an item.
 * 
 * An item update example:
 * 
 * 
 *     {
 * 
 *         "categoryPath": "/games",
 * 
 *         "localizations": {
 * 
 *            "en": {
 * 
 *                "title":"required",
 * 
 *                "description":"optional",
 * 
 *                "longDescription":"optional",
 * 
 *                "localExt": {
 * 
 *                       "properties":[
 * 
 *                                        {
 * 
 *                                            "key1":"value1",
 * 
 *                                            "key2":"value2"
 * 
 *                                        }
 * 
 *                       ],
 * 
 *                       "functions":[
 * 
 *                                        {
 * 
 *                                            "key1":"value1",
 * 
 *                                            "key2":"value2"
 * 
 *                                        }
 * 
 *                      ]
 * 
 *                }
 * 
 *            }
 * 
 *        },
 * 
 *        "images": [
 * 
 *          {
 * 
 *                "as":"optional, image for",
 * 
 *                "caption":"optional",
 * 
 *                "height":10,
 * 
 *                "width":10,
 * 
 *                "imageUrl":"http://img-url-required",
 * 
 *                "smallImageUrl":"http://small-img-url-required"
 * 
 *          }
 * 
 *        ],
 * 
 *        "thumbnailUrl": "optional, thumbnail url",
 * 
 *        "status": "ACTIVE",
 * 
 *        "listable": true,
 * 
 *        "purchasable": true,
 * 
 *        "itemType": "APP(allowed: [APP,COINS,INGAMEITEM,CODE,BUNDLE])",
 * 
 *        "name": "optional",
 * 
 *        "entitlementType": "DURABLE(allowed:[DURABLE,CONSUMABLE], should be CONSUMABLE when item type is COINS)",
 * 
 *        "useCount": 1(optional, required if the entitlement type is consumable),
 * 
 *        "stackable": false,
 * 
 *        "appId": "optional, required if itemType is APP",
 * 
 *        "baseAppId": "optional, set value of game app id if you want to link to a game",
 * 
 *        "appType": "GAME(optional, required if itemType is APP)",
 * 
 *        "seasonType": "PASS(optional, required if itemType is SEASON)",
 * 
 *        "sku": "optional, commonly unique item code",
 * 
 *        "targetCurrencyCode": "optional, required if itemType is COINS",
 * 
 *        "targetNamespace": "optional, required when itemType is INGAMEITEM, the targetNamespace will only take effect when the item
 * 
 *        created belongs to the publisher namespace",
 * 
 *        "regionData": {
 * 
 *            "US(store's default region is required)": [
 * 
 *              {
 * 
 *                 "price":10,
 * 
 *                 "discountPercentage":0(integer, optional, range[0,100], discountedPrice = price*((100 - discountPercentage) * 0.01),
 * 
 *                   if it is not 0, will use it to calculate discounted price),
 * 
 *                 "discountAmount":0(integer, optional, range[0,itemPrice], will use it to calculate discounted price if discountPercentage is 0),
 * 
 *                 "currencyCode":"code(required, example: USD)",
 * 
 *                 "currencyNamespace":"test-ns-required(allow publisher namespace if namespace is publisher namespace, allow publisher and game namespace if namespace is not publisher namespace)",
 * 
 *                 "trialPrice":5(required while fixedTrialCycles set, should >=0 and <= price, will same as price if not present),
 * 
 *                 "purchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 * 
 *                 "expireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 * 
 *                 "discountPurchaseAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
 * 
 *                 "discountExpireAt":"optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 * 
 *              }
 * 
 *            ]
 * 
 *        },
 * 
 *        "itemIds": [
 * 
 *            "itemId"
 * 
 *        ],
 * 
 *        "itemQty": {
 * 
 *            "itemId":1
 * 
 *        },
 * 
 *        "recurring": {
 * 
 *            "cycle":"MONTHLY(allowed: [WEEKLY,MONTHLY,QUARTERLY,YEARLY])",
 * 
 *            "fixedFreeDays":0(integer, fixed free days, 0 means not set),
 * 
 *            "fixedTrialCycles":0(integer, fixed trial cycles, 0 means not set, will not take effect if fixedFreeDays set),
 * 
 *            "graceDays":7(integer, recurring grace days, retry recurring charge within configured days if charge fail, default 7)
 * 
 *        },
 * 
 *        "tags": [
 * 
 *            "exampleTag24"
 * 
 *        ],
 * 
 *        "features": [
 * 
 *            "feature"
 * 
 *        ],
 * 
 *        "clazz": "weapon",
 * 
 *        "boothName": "C_campaign1",
 * 
 *        "displayOrder": 1000,
 * 
 *        "ext": {
 * 
 *            "properties":[
 * 
 *                {
 * 
 *                    "key1":"value1",
 * 
 *                    "key2":"value2"
 * 
 *                }
 * 
 *            ],
 * 
 *            "functions":[
 * 
 *                {
 * 
 *                    "key1":"value1",
 * 
 *                    "key2":"value2"
 * 
 *                }
 * 
 *            ]
 * 
 *        },
 * 
 *        "maxCountPerUser": 1(integer, optional, -1 means UNLIMITED),
 * 
 *        "maxCount": 1(integer, optional, -1 means UNLIMITED, new value should >= old value if both old value and new value is
 * 
 *        limited, unset when item type is CODE)
 * 
 *     }
 * 
 * Other detail info:
 * 
 *   * Returns : updated item data
 * 
 * 
 * 
 * ## Restrictions for item extension and localization extension
 * 
 * 
 * 1. Cannot use "." as the key name
 * -
 * 
 * 
 *     { "data.2": "value" }
 * 
 * 
 * 2. Cannot use "$" as the prefix in key names
 * -
 * 
 * 
 *     { "$data": "value" }
 */
@Getter
@Setter
public class UpdateItem extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String itemId;
    private String namespace;
    private String storeId;
    private ItemUpdate body;

    /**
    * @param itemId required
    * @param namespace required
    * @param storeId required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdateItem(
            String customBasePath,            String itemId,
            String namespace,
            String storeId,
            ItemUpdate body
    )
    {
        this.itemId = itemId;
        this.namespace = namespace;
        this.storeId = storeId;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.itemId != null){
            pathParams.put("itemId", this.itemId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        return queryParams;
    }


    @Override
    public ItemUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.itemId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.storeId == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdateItemOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdateItemOpResponse response = new UpdateItemOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new FullItemInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ErrorEntity().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }

        return response;
    }

    /*
    public FullItemInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new FullItemInfo().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("storeId", "None");
        return result;
    }
}
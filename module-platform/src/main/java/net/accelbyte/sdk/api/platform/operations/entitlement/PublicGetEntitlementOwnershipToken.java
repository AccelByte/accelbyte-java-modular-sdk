/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

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
import net.accelbyte.sdk.api.platform.operation_responses.entitlement.PublicGetEntitlementOwnershipTokenOpResponse;

/**
 * publicGetEntitlementOwnershipToken
 *
 * Gets an entitlement ownership token of specified itemIds, skus and appIds
 * 
 * The decoded ownership token header like below:
 * 
 * 
 *     {
 * 
 *       "kid": "9fd4cd5f991cebe3323605cd12d3b8bfdfc73fa4",
 * 
 *       "typ": "JWT",
 * 
 *       "alg": "RS256"
 * 
 *     }
 * 
 * 
 * 
 * That you can get the jwks by api /platform/jwks, if the configured private key is same as IAM,
 * 
 * you can also get jwks from IAM endpoint.
 * 
 * The decoded ownership token payload like below:
 * 
 * 
 *     {
 * 
 *      "namespace": "accelbyte",
 * 
 *      "entitlements": [
 * 
 *       {
 * 
 *         "itemId": "4c1296291f604c199f7bb7f0ee02e5f8",
 * 
 *         "appType": null,
 * 
 *         "appId": null,
 * 
 *         "namespace": "accelbyte",
 * 
 *         "itemNamespace": "accelbyte",
 * 
 *         "sku": "prime-plus"
 * 
 *       },
 * 
 *       {
 * 
 *         "itemId": "e8f4974cf45c4e1f8d4f0c6990c518bd",
 * 
 *         "appType": "GAME",
 * 
 *         "appId": "omeganebula",
 * 
 *         "namespace": "accelbyte",
 * 
 *         "itemNamespace": "accelbyte",
 * 
 *         "sku": "APPG005ON"
 * 
 *       }
 * 
 *      ],
 * 
 *     "sub": "66459eb6a4e44e6fb0040bd20c1079a5",
 * 
 *     "exp": 1619624360,
 * 
 *     "iat": 1619624060
 * 
 *     }
 * 
 * 
 * 
 * if there's no active entitlement for the specific params, the entitlements section will be omitted.
 */
@Getter
@Setter
public class PublicGetEntitlementOwnershipToken extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/public/namespaces/{namespace}/users/me/entitlements/ownershipToken";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private List<String> appIds;
    private List<String> itemIds;
    private List<String> skus;

    /**
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetEntitlementOwnershipToken(
            String customBasePath,            String namespace,
            List<String> appIds,
            List<String> itemIds,
            List<String> skus
    )
    {
        this.namespace = namespace;
        this.appIds = appIds;
        this.itemIds = itemIds;
        this.skus = skus;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("appIds", this.appIds == null ? null : this.appIds.stream().map(i -> String.valueOf(i)).collect(java.util.stream.Collectors.toList()));
        queryParams.put("itemIds", this.itemIds == null ? null : this.itemIds.stream().map(i -> String.valueOf(i)).collect(java.util.stream.Collectors.toList()));
        queryParams.put("skus", this.skus == null ? null : this.skus.stream().map(i -> String.valueOf(i)).collect(java.util.stream.Collectors.toList()));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public PublicGetEntitlementOwnershipTokenOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetEntitlementOwnershipTokenOpResponse response = new PublicGetEntitlementOwnershipTokenOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new OwnershipToken().createFromJson(json));
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public OwnershipToken parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new OwnershipToken().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("appIds", "multi");
        result.put("itemIds", "multi");
        result.put("skus", "multi");
        return result;
    }
}
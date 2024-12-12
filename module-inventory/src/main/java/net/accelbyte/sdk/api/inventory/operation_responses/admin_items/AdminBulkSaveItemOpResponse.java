/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operation_responses.admin_items;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.inventory.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class AdminBulkSaveItemOpResponse extends ApiResponseWithData<List<ApimodelsBulkSaveItemResp>> {
    
    private ApimodelsErrorResponse error400 = null;

    private ApimodelsErrorResponse error401 = null;

    private ApimodelsErrorResponse error403 = null;

    private ApimodelsErrorResponse error404 = null;

    private ApimodelsErrorResponse error422 = null;

    private ApimodelsErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.inventory.operations.admin_items.AdminBulkSaveItem";
    }
}
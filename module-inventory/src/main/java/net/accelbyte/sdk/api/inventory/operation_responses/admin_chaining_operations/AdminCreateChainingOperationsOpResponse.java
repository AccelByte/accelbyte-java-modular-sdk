/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operation_responses.admin_chaining_operations;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.inventory.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class AdminCreateChainingOperationsOpResponse extends ApiResponseWithData<ApimodelsChainingOperationResp> {
    
    private ApimodelsChainingOperationResp error400 = null;

    private ApimodelsChainingOperationResp error401 = null;

    private ApimodelsChainingOperationResp error403 = null;

    private ApimodelsChainingOperationResp error404 = null;

    private ApimodelsChainingOperationResp error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.inventory.operations.admin_chaining_operations.AdminCreateChainingOperations";
    }
}
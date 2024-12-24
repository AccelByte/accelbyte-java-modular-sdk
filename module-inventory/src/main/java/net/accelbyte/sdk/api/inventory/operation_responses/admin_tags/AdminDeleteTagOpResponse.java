/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operation_responses.admin_tags;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.inventory.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class AdminDeleteTagOpResponse extends ApiResponse {
    
    private ApimodelsErrorResponse error404 = null;

    private ApimodelsErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.inventory.operations.admin_tags.AdminDeleteTag";
    }
}
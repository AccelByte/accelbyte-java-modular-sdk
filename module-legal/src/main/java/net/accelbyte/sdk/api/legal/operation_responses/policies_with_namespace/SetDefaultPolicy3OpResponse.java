/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operation_responses.policies_with_namespace;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class SetDefaultPolicy3OpResponse extends ApiResponse {
    
    private ErrorEntity error400 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.legal.operations.policies_with_namespace.SetDefaultPolicy3";
    }
}
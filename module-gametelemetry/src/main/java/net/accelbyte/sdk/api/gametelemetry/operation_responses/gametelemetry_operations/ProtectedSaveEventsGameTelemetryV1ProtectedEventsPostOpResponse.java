/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operation_responses.gametelemetry_operations;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gametelemetry.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPostOpResponse extends ApiResponse {
    
    private BaseErrorResponse error422 = null;

    private BaseErrorResponse error500 = null;

    private BaseErrorResponse error507 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost";
    }
}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operation_responses.telemetry;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gametelemetry.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class GetNamespacesGameTelemetryV1AdminNamespacesGetOpResponse extends ApiResponseWithData<ListBaseResponseStr> {
    
    private BaseErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.gametelemetry.operations.telemetry.GetNamespacesGameTelemetryV1AdminNamespacesGet";
    }
}
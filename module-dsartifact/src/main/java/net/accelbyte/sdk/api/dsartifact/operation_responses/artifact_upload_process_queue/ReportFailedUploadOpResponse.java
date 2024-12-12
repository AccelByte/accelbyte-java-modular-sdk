/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.operation_responses.artifact_upload_process_queue;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsartifact.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class ReportFailedUploadOpResponse extends ApiResponse {
    
    private ResponseError error400 = null;

    private ResponseError error401 = null;

    private ResponseError error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.dsartifact.operations.artifact_upload_process_queue.ReportFailedUpload";
    }
}
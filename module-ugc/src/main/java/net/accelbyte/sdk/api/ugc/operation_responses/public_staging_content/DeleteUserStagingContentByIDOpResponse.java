/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operation_responses.public_staging_content;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class DeleteUserStagingContentByIDOpResponse extends ApiResponse {
    
    private ResponseError error401 = null;

    private ResponseError error403 = null;

    private ResponseError error404 = null;

    private ResponseError error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.ugc.operations.public_staging_content.DeleteUserStagingContentByID";
    }
}
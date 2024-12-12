/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operation_responses.session;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class GetSessionHistoryDetailedOpResponse extends ApiResponseWithData<List<ModelsGetSessionHistoryDetailedResponseItem>> {
    
    private RestapiErrorV1 error400 = null;

    private RestapiErrorV1 error401 = null;

    private RestapiErrorV1 error403 = null;

    private RestapiErrorV1 error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSessionHistoryDetailed";
    }
}
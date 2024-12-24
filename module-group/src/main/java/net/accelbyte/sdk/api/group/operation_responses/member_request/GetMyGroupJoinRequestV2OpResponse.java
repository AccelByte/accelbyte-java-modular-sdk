/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operation_responses.member_request;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class GetMyGroupJoinRequestV2OpResponse extends ApiResponseWithData<ModelsGetMemberRequestsListResponseV1> {
    
    private ResponseErrorResponse error400 = null;

    private ResponseErrorResponse error401 = null;

    private ResponseErrorResponse error403 = null;

    private ResponseErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.group.operations.member_request.GetMyGroupJoinRequestV2";
    }
}
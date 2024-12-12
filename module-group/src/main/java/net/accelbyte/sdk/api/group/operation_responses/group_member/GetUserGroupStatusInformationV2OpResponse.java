/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operation_responses.group_member;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class GetUserGroupStatusInformationV2OpResponse extends ApiResponseWithData<ModelsGetUserGroupInformationResponseV1> {
    
    private ResponseErrorResponse error401 = null;

    private ResponseErrorResponse error403 = null;

    private ResponseErrorResponse error404 = null;

    private ResponseErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.group.operations.group_member.GetUserGroupStatusInformationV2";
    }
}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval_s2s;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class S2SGetListFinishedPersonalDataRequestOpResponse extends ApiResponseWithData<DtoListFinishedDataRequests> {
    
    private ResponseError error400 = null;

    private ResponseError error401 = null;

    private ResponseError error403 = null;

    private ResponseError error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.gdpr.operations.data_retrieval_s2s.S2SGetListFinishedPersonalDataRequest";
    }
}
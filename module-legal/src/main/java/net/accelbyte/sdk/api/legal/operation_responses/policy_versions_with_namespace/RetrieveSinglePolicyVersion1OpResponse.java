/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operation_responses.policy_versions_with_namespace;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class RetrieveSinglePolicyVersion1OpResponse extends ApiResponseWithData<List<RetrievePolicyVersionResponse>> {
    
    private ErrorEntity error404 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.RetrieveSinglePolicyVersion1";
    }
}
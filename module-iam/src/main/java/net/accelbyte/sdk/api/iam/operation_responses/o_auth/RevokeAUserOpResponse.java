/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operation_responses.o_auth;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;

import net.accelbyte.sdk.core.ApiResponse;

@Deprecated
@Getter
@Setter
public class RevokeAUserOpResponse extends ApiResponse {
    
    private String error400 = "";

    private String error401 = "";


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.iam.operations.o_auth.RevokeAUser";
    }
}
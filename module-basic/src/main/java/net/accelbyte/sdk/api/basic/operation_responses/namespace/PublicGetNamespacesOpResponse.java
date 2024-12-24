/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operation_responses.namespace;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicGetNamespacesOpResponse extends ApiResponseWithData<List<NamespaceInfo>> {
    
    private ErrorEntity error401 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.basic.operations.namespace.PublicGetNamespaces";
    }
}
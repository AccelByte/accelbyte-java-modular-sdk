/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operation_responses.misc;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicGetLanguagesOpResponse extends ApiResponseWithData<Map<String, ?>> {
    
    private ValidationErrorEntity error400 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.basic.operations.misc.PublicGetLanguages";
    }
}
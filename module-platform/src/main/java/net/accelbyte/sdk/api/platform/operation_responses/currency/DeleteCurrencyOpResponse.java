/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operation_responses.currency;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class DeleteCurrencyOpResponse extends ApiResponseWithData<CurrencyInfo> {
    
    private ErrorEntity error404 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.platform.operations.currency.DeleteCurrency";
    }
}
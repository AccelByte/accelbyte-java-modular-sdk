/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class ApiResponse extends BaseApiResponse {

    public void ensureSuccess() throws ApiResponseException {
        this.throwExceptionIfError();
    }    
}
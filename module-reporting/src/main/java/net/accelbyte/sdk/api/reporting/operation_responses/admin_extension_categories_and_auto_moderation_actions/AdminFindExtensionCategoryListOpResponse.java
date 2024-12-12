/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operation_responses.admin_extension_categories_and_auto_moderation_actions;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.reporting.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class AdminFindExtensionCategoryListOpResponse extends ApiResponseWithData<RestapiExtensionCategoryListApiResponse> {
    
    private RestapiErrorResponse error400 = null;

    private RestapiErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.reporting.operations.admin_extension_categories_and_auto_moderation_actions.AdminFindExtensionCategoryList";
    }
}
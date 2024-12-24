/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operation_responses.admin_moderation_rule;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.reporting.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class UpdateModerationRuleOpResponse extends ApiResponseWithData<RestapiModerationRuleResponse> {
    
    private RestapiErrorResponse error400 = null;

    private RestapiErrorResponse error404 = null;

    private RestapiErrorResponse error409 = null;

    private RestapiErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.reporting.operations.admin_moderation_rule.UpdateModerationRule";
    }
}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operation_responses.slot_config;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Deprecated
@Getter
@Setter
public class GetUserSlotConfigOpResponse extends ApiResponseWithData<UserSlotConfigInfo> {

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.social.operations.slot_config.GetUserSlotConfig";
  }
}

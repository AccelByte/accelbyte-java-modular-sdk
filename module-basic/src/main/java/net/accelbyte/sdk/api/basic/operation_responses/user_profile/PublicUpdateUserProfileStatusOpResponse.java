/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operation_responses.user_profile;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicUpdateUserProfileStatusOpResponse extends ApiResponseWithData<UserProfileInfo> {

  private ValidationErrorEntity error400 = null;

  private ErrorEntity error401 = null;

  private ErrorEntity error403 = null;

  private ErrorEntity error404 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.basic.operations.user_profile.PublicUpdateUserProfileStatus";
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class RestapiErrorResponseBody extends Model {

  @JsonProperty("ErrorCode")
  private Integer errorCode;

  @JsonProperty("ErrorMessage")
  private String errorMessage;

  @JsonIgnore
  public RestapiErrorResponseBody createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiErrorResponseBody> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RestapiErrorResponseBody>>() {});
  }

  public ApiError translateToApiError() {

    final String theCode = errorCode != null ? Integer.toString(errorCode) : "";

    final String theMessage = errorMessage != null ? errorMessage : "";

    return new ApiError(theCode, theMessage);
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.models;

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
public class ResponseErrorResponse extends Model {

  @JsonProperty("errorMessage")
  private String errorMessage;

  @JsonProperty("errorType")
  private String errorType;

  @JsonProperty("traceId")
  private String traceId;

  @JsonIgnore
  public ResponseErrorResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ResponseErrorResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ResponseErrorResponse>>() {});
  }

  public ApiError translateToApiError() {

    final String theCode = errorType != null ? errorType : "";

    final String theMessage = errorMessage != null ? errorMessage : "";

    return new ApiError(theCode, theMessage);
  }
}

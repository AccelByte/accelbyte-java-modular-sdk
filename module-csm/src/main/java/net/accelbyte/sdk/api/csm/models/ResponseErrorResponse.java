/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.models;

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

  @JsonProperty("error")
  private String error;

  @JsonProperty("errorCode")
  private Integer errorCode;

  @JsonProperty("errorMessage")
  private String errorMessage;

  @JsonProperty("errors")
  private String errors;

  @JsonProperty("messageVariables")
  private Map<String, String> messageVariables;

  @JsonProperty("name")
  private String name;

  @JsonProperty("reason")
  private String reason;

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

    final String theCode =
        error != null ? error : errorCode != null ? Integer.toString(errorCode) : "";

    final String theMessage = errorMessage != null ? errorMessage : "";

    return new ApiError(theCode, theMessage);
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ApimodelsBulkSaveItemResp extends Model {

  @JsonProperty("errorDetails")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelsBulkSaveItemError errorDetails;

  @JsonProperty("item")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelsItemResp item;

  @JsonProperty("success")
  private Boolean success;

  @JsonIgnore
  public ApimodelsBulkSaveItemResp createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsBulkSaveItemResp> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsBulkSaveItemResp>>() {});
  }
}

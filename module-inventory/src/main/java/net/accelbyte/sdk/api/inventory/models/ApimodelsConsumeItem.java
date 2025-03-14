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
public class ApimodelsConsumeItem extends Model {

  @JsonProperty("dateRangeValidation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean dateRangeValidation;

  @JsonProperty("inventoryId")
  private String inventoryId;

  @JsonProperty("options")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> options;

  @JsonProperty("qty")
  private Integer qty;

  @JsonProperty("slotId")
  private String slotId;

  @JsonProperty("sourceItemId")
  private String sourceItemId;

  @JsonIgnore
  public ApimodelsConsumeItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsConsumeItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsConsumeItem>>() {});
  }
}

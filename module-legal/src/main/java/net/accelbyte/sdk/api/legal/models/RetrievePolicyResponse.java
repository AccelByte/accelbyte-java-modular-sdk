/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class RetrievePolicyResponse extends Model {

  @JsonProperty("countryCode")
  private String countryCode;

  @JsonProperty("countryGroupCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String countryGroupCode;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isDefaultOpted")
  private Boolean isDefaultOpted;

  @JsonProperty("isDefaultSelection")
  private Boolean isDefaultSelection;

  @JsonProperty("isMandatory")
  private Boolean isMandatory;

  @JsonProperty("policyName")
  private String policyName;

  @JsonProperty("policyVersions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<PolicyVersionObject> policyVersions;

  @JsonProperty("readableId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String readableId;

  @JsonProperty("shouldNotifyOnUpdate")
  private Boolean shouldNotifyOnUpdate;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public RetrievePolicyResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RetrievePolicyResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyResponse>>() {});
  }
}

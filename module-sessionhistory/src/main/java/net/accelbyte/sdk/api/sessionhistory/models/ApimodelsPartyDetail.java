/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ApimodelsPartyDetail extends Model {

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("histories")
  private List<ApimodelsPartyHistory> histories;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("last_data")
  private ModelsParty lastData;

  @JsonProperty("leader_id")
  private String leaderId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("partySessionID")
  private String partySessionID;

  @JsonProperty("session_template")
  private String sessionTemplate;

  @JsonProperty("updated_at")
  private String updatedAt;

  @JsonIgnore
  public ApimodelsPartyDetail createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsPartyDetail> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsPartyDetail>>() {});
  }
}

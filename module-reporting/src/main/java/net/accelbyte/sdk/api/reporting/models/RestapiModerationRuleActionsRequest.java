/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.models;

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
public class RestapiModerationRuleActionsRequest extends Model {

  @JsonProperty("banAccount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RestapiBanAccountActionRequest banAccount;

  @JsonProperty("deleteChat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean deleteChat;

  @JsonProperty("extensionActionIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> extensionActionIds;

  @JsonProperty("hideContent")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean hideContent;

  @JsonIgnore
  public RestapiModerationRuleActionsRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiModerationRuleActionsRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RestapiModerationRuleActionsRequest>>() {});
  }
}

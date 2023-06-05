/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsRuleSet extends Model {

  @JsonProperty("alliance")
  private ModelsAllianceRule alliance;

  @JsonProperty("alliance_flexing_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsAllianceFlexingRule> allianceFlexingRule;

  @JsonProperty("bucket_mmr_rule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBucketMMRRule bucketMmrRule;

  @JsonProperty("flexing_rule")
  private List<ModelsFlexingRule> flexingRule;

  @JsonProperty("match_options")
  private ModelsMatchOptionRule matchOptions;

  @JsonProperty("matching_rule")
  private List<ModelsMatchingRule> matchingRule;

  @JsonProperty("rebalance_enable")
  private Boolean rebalanceEnable;

  @JsonProperty("sub_game_modes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ModelsSubGameMode> subGameModes;

  @JsonProperty("use_newest_ticket_for_flexing")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useNewestTicketForFlexing;

  @JsonIgnore
  public ModelsRuleSet createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsRuleSet> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRuleSet>>() {});
  }
}

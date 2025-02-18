/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.models;

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
public class MatchmakerTicket extends Model {

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("ExcludedSessions")
  private List<String> excludedSessions;

  @JsonProperty("IsActive")
  private Boolean isActive;

  @JsonProperty("IsPivot")
  private Boolean isPivot;

  @JsonProperty("IsSinglePlay")
  private Boolean isSinglePlay;

  @JsonProperty("Latencies")
  private Map<String, Integer> latencies;

  @JsonProperty("MatchPool")
  private String matchPool;

  @JsonProperty("MatchedAt")
  private String matchedAt;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("PartySessionID")
  private String partySessionID;

  @JsonProperty("Players")
  private List<PlayerPlayerData> players;

  @JsonProperty("ProposedProposal")
  private MatchmakerProposedProposal proposedProposal;

  @JsonProperty("TicketAttributes")
  private Map<String, ?> ticketAttributes;

  @JsonProperty("TicketID")
  private String ticketID;

  @JsonProperty("TicketInformation")
  private Map<String, ?> ticketInformation;

  @JsonIgnore
  public MatchmakerTicket createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<MatchmakerTicket> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<MatchmakerTicket>>() {});
  }
}

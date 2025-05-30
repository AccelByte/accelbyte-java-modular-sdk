/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsConfig extends Model {

  @JsonProperty("allowInviteNonConnectedUser")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean allowInviteNonConnectedUser;

  @JsonProperty("allowJoinPartyDuringMatchmaking")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean allowJoinPartyDuringMatchmaking;

  @JsonProperty("autoKickOnDisconnect")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoKickOnDisconnect;

  @JsonProperty("autoKickOnDisconnectDelay")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long autoKickOnDisconnectDelay;

  @JsonProperty("cancelTicketOnDisconnect")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean cancelTicketOnDisconnect;

  @JsonProperty("chatRateLimitBurst")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer chatRateLimitBurst;

  @JsonProperty("chatRateLimitDuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long chatRateLimitDuration;

  @JsonProperty("concurrentUsersLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer concurrentUsersLimit;

  @JsonProperty("disableInvitationOnJoinParty")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean disableInvitationOnJoinParty;

  @JsonProperty("disableRemoveSocketOldConnection")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean disableRemoveSocketOldConnection;

  @JsonProperty("enableChat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableChat;

  @JsonProperty("entitlementCheck")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean entitlementCheck;

  @JsonProperty("entitlementItemID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String entitlementItemID;

  @JsonProperty("generalRateLimitBurst")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer generalRateLimitBurst;

  @JsonProperty("generalRateLimitDuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long generalRateLimitDuration;

  @JsonProperty("keepPresenceActivityOnDisconnect")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean keepPresenceActivityOnDisconnect;

  @JsonProperty("maxDSWaitTime")
  private Long maxDSWaitTime;

  @JsonProperty("maxFriendsLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxFriendsLimit;

  @JsonProperty("maxPartyMember")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxPartyMember;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("profanityFilter")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean profanityFilter;

  @JsonProperty("readyConsentTimeout")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long readyConsentTimeout;

  @JsonProperty("requestMetadataMaxSize")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer requestMetadataMaxSize;

  @JsonProperty("unregisterDelay")
  private Long unregisterDelay;

  @JsonIgnore
  public ModelsConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsConfig>>() {});
  }
}

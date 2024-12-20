/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

import java.util.*;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;

import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor=@__(@Deprecated))
@NoArgsConstructor
public class ModelsMatchmakingResult extends Model {

    @JsonProperty("channel")
    private String channel;

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("error_code")
    private Integer errorCode;

    @JsonProperty("error_message")
    private String errorMessage;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("is_mock")
    private String isMock;

    @JsonProperty("joinable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean joinable;

    @JsonProperty("match_id")
    private String matchId;

    @JsonProperty("matching_allies")
    private List<ModelsMatchingAlly> matchingAllies;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("party_attributes")
    private Map<String, ?> partyAttributes;

    @JsonProperty("party_id")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String partyId;

    @JsonProperty("queued_at")
    private Long queuedAt;

    @JsonProperty("region")
    private String region;

    @JsonProperty("server_name")
    private String serverName;

    @JsonProperty("status")
    private String status;

    @JsonProperty("ticket_id")
    private String ticketId;

    @JsonProperty("ticket_ids")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> ticketIds;

    @JsonProperty("updated_at")
    private String updatedAt;



    @JsonIgnore
    public ModelsMatchmakingResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsMatchmakingResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchmakingResult>>() {});
    }


}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ApimodelsCreateGameSessionRequest extends Model {

    @JsonProperty("appName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String appName;

    @JsonProperty("attributes")
    private Map<String, ?> attributes;

    @JsonProperty("autoJoin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean autoJoin;

    @JsonProperty("backfillTicketID")
    private String backfillTicketID;

    @JsonProperty("clientVersion")
    private String clientVersion;

    @JsonProperty("configurationName")
    private String configurationName;

    @JsonProperty("customURLGRPC")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String customURLGRPC;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("dsSource")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String dsSource;

    @JsonProperty("fallbackClaimKeys")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> fallbackClaimKeys;

    @JsonProperty("inactiveTimeout")
    private Integer inactiveTimeout;

    @JsonProperty("inviteTimeout")
    private Integer inviteTimeout;

    @JsonProperty("joinability")
    private String joinability;

    @JsonProperty("matchPool")
    private String matchPool;

    @JsonProperty("maxPlayers")
    private Integer maxPlayers;

    @JsonProperty("minPlayers")
    private Integer minPlayers;

    @JsonProperty("preferredClaimKeys")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> preferredClaimKeys;

    @JsonProperty("requestedRegions")
    private List<String> requestedRegions;

    @JsonProperty("serverName")
    private String serverName;

    @JsonProperty("storage")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ApimodelsSessionStorageRequest storage;

    @JsonProperty("teams")
    private List<ModelsTeam> teams;

    @JsonProperty("textChat")
    private Boolean textChat;

    @JsonProperty("ticketIDs")
    private List<String> ticketIDs;

    @JsonProperty("tieTeamsSessionLifetime")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean tieTeamsSessionLifetime;

    @JsonProperty("type")
    private String type;



    @JsonIgnore
    public ApimodelsCreateGameSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsCreateGameSessionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsCreateGameSessionRequest>>() {});
    }


}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsGameSession extends Model {

    @JsonProperty("all_players")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> allPlayers;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("game_session_setting")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ModelsGameSessionSetting gameSessionSetting;

    @JsonProperty("game_version")
    private String gameVersion;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("match")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ModelsMatchMaking match;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("players")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> players;

    @JsonProperty("server")
    private ModelsServer server;

    @JsonProperty("session_id")
    private String sessionId;

    @JsonProperty("session_type")
    private String sessionType;

    @JsonProperty("spectators")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> spectators;

    @JsonProperty("user_id")
    private String userId;

    @JsonProperty("username")
    private String username;



    @JsonIgnore
    public ModelsGameSession createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsGameSession> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameSession>>() {});
    }


}
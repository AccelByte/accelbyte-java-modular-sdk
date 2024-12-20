/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ModelsSessionConfig extends Model {

    @JsonProperty("ClientVersion")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String clientVersion;

    @JsonProperty("Deployment")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String deployment;

    @JsonProperty("InactiveTimeout")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer inactiveTimeout;

    @JsonProperty("InviteTimeout")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer inviteTimeout;

    @JsonProperty("Joinability")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String joinability;

    @JsonProperty("MaxPlayers")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer maxPlayers;

    @JsonProperty("MinPlayers")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer minPlayers;

    @JsonProperty("Name")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String name;

    @JsonProperty("Persistent")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean persistent;

    @JsonProperty("RequestedRegions")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> requestedRegions;

    @JsonProperty("Type")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String type;



    @JsonIgnore
    public ModelsSessionConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsSessionConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsSessionConfig>>() {});
    }


}
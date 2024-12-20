/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class UserStatCycleItemInfo extends Model {

    @JsonProperty("additionalData")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> additionalData;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("cycleId")
    private String cycleId;

    @JsonProperty("cycleName")
    private String cycleName;

    @JsonProperty("cycleVersion")
    private Integer cycleVersion;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("statName")
    private String statName;

    @JsonProperty("tags")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("value")
    private Float value;



    @JsonIgnore
    public UserStatCycleItemInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserStatCycleItemInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserStatCycleItemInfo>>() {});
    }


}
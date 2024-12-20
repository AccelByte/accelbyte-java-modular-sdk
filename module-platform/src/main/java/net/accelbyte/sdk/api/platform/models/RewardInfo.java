/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class RewardInfo extends Model {

    @JsonProperty("createdAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String createdAt;

    @JsonProperty("description")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String description;

    @JsonProperty("eventTopic")
    private String eventTopic;

    @JsonProperty("maxAwarded")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer maxAwarded;

    @JsonProperty("maxAwardedPerUser")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer maxAwardedPerUser;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("namespaceExpression")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String namespaceExpression;

    @JsonProperty("rewardCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String rewardCode;

    @JsonProperty("rewardConditions")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<RewardCondition> rewardConditions;

    @JsonProperty("rewardId")
    private String rewardId;

    @JsonProperty("updatedAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String updatedAt;

    @JsonProperty("userIdExpression")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String userIdExpression;



    @JsonIgnore
    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
    }


}
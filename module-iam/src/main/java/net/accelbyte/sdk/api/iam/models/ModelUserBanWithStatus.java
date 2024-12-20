/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserBanWithStatus extends Model {

    @JsonProperty("active")
    private Boolean active;

    @JsonProperty("ban")
    private String ban;

    @JsonProperty("banId")
    private String banId;

    @JsonProperty("bannedBy")
    private AccountcommonBannedByV3 bannedBy;

    @JsonProperty("comment")
    private String comment;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("disabledDate")
    private String disabledDate;

    @JsonProperty("enabled")
    private Boolean enabled;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public ModelUserBanWithStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserBanWithStatus> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserBanWithStatus>>() {});
    }


}
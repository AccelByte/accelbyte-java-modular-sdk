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
public class ModelUserPlatformInfo extends Model {

    @JsonProperty("platformAvatarUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String platformAvatarUrl;

    @JsonProperty("platformDisplayName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String platformDisplayName;

    @JsonProperty("platformGroup")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String platformGroup;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("platformUserId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String platformUserId;



    @JsonIgnore
    public ModelUserPlatformInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserPlatformInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserPlatformInfo>>() {});
    }


}
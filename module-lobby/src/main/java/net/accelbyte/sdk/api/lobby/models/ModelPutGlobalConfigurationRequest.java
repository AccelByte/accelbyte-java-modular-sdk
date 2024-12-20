/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelPutGlobalConfigurationRequest extends Model {

    @JsonProperty("regionRetryMapping")
    private Map<String, List<String>> regionRetryMapping;

    @JsonProperty("regionURLMapping")
    private List<String> regionURLMapping;

    @JsonProperty("testGameMode")
    private String testGameMode;

    @JsonProperty("testRegionURLMapping")
    private List<String> testRegionURLMapping;

    @JsonProperty("testTargetUserIDs")
    private List<String> testTargetUserIDs;



    @JsonIgnore
    public ModelPutGlobalConfigurationRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelPutGlobalConfigurationRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelPutGlobalConfigurationRequest>>() {});
    }


}
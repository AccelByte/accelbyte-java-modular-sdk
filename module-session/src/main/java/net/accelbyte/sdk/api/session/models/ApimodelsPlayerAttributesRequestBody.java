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
public class ApimodelsPlayerAttributesRequestBody extends Model {

    @JsonProperty("crossplayEnabled")
    private Boolean crossplayEnabled;

    @JsonProperty("currentPlatform")
    private String currentPlatform;

    @JsonProperty("data")
    private Map<String, ?> data;

    @JsonProperty("platforms")
    private List<ModelsUserPlatformInfo> platforms;

    @JsonProperty("roles")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> roles;

    @JsonProperty("simultaneousPlatform")
    private String simultaneousPlatform;



    @JsonIgnore
    public ApimodelsPlayerAttributesRequestBody createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsPlayerAttributesRequestBody> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsPlayerAttributesRequestBody>>() {});
    }


}
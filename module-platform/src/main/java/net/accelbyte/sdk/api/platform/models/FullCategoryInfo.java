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
public class FullCategoryInfo extends Model {

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("localizationDisplayNames")
    private Map<String, String> localizationDisplayNames;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("parentCategoryPath")
    private String parentCategoryPath;

    @JsonProperty("root")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean root;

    @JsonProperty("updatedAt")
    private String updatedAt;



    @JsonIgnore
    public FullCategoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FullCategoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FullCategoryInfo>>() {});
    }


}
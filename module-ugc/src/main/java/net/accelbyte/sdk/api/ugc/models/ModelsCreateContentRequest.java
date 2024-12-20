/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsCreateContentRequest extends Model {

    @JsonProperty("customAttributes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> customAttributes;

    @JsonProperty("name")
    private String name;

    @JsonProperty("payload")
    private String payload;

    @JsonProperty("preview")
    private String preview;

    @JsonProperty("previewMetadata")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ModelsPreviewMetadata previewMetadata;

    @JsonProperty("subType")
    private String subType;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("type")
    private String type;



    @JsonIgnore
    public ModelsCreateContentRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCreateContentRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateContentRequest>>() {});
    }


}
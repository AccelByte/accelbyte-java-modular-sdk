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
public class ModelUserPermissionsResponseV3 extends Model {

    @JsonProperty("action")
    private Integer action;

    @JsonProperty("resource")
    private String resource;

    @JsonProperty("schedAction")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer schedAction;

    @JsonProperty("schedCron")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String schedCron;

    @JsonProperty("schedRange")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> schedRange;



    @JsonIgnore
    public ModelUserPermissionsResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserPermissionsResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserPermissionsResponseV3>>() {});
    }


}
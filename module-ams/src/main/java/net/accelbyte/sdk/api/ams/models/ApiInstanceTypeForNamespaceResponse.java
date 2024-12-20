/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.models;

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
public class ApiInstanceTypeForNamespaceResponse extends Model {

    @JsonProperty("capacity")
    private List<ApiCapacity> capacity;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("memoryGiB")
    private Float memoryGiB;

    @JsonProperty("minSpeed")
    private String minSpeed;

    @JsonProperty("name")
    private String name;

    @JsonProperty("ownerAccountId")
    private String ownerAccountId;

    @JsonProperty("provider")
    private String provider;

    @JsonProperty("virtualCpu")
    private Integer virtualCpu;



    @JsonIgnore
    public ApiInstanceTypeForNamespaceResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApiInstanceTypeForNamespaceResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApiInstanceTypeForNamespaceResponse>>() {});
    }


}
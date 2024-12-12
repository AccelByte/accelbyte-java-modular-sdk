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
public class ApiAccountLimits extends Model {

    @JsonProperty("allowedNodeClasses")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> allowedNodeClasses;

    @JsonProperty("allowedRegions")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> allowedRegions;

    @JsonProperty("fleetCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer fleetCount;

    @JsonProperty("fleetVmCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer fleetVmCount;

    @JsonProperty("imageStorageQuotaBytes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long imageStorageQuotaBytes;



    @JsonIgnore
    public ApiAccountLimits createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApiAccountLimits> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApiAccountLimits>>() {});
    }


}
/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.models;

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
public class ApimodelGetAppImageListV2Response extends Model {

    @JsonProperty("data")
    private List<ApimodelGetAppImageListV2DataItem> data;

    @JsonProperty("paging")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private GeneratedPagination paging;

    @JsonProperty("vulnerabilityStatus")
    private String vulnerabilityStatus;



    @JsonIgnore
    public ApimodelGetAppImageListV2Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelGetAppImageListV2Response> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelGetAppImageListV2Response>>() {});
    }


}
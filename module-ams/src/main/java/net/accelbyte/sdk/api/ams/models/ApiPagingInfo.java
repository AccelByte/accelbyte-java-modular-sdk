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
public class ApiPagingInfo extends Model {

    @JsonProperty("currentPage")
    private Integer currentPage;

    @JsonProperty("hasNext")
    private Boolean hasNext;

    @JsonProperty("hasPages")
    private Boolean hasPages;

    @JsonProperty("hasPrev")
    private Boolean hasPrev;

    @JsonProperty("next")
    private String next;

    @JsonProperty("pageNums")
    private List<Integer> pageNums;

    @JsonProperty("previous")
    private String previous;

    @JsonProperty("total")
    private Integer total;



    @JsonIgnore
    public ApiPagingInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApiPagingInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApiPagingInfo>>() {});
    }


}
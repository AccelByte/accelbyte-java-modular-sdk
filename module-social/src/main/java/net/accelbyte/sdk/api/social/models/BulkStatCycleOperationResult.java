/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class BulkStatCycleOperationResult extends Model {

    @JsonProperty("cycleId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String cycleId;

    @JsonProperty("details")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> details;

    @JsonProperty("statCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String statCode;

    @JsonProperty("success")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean success;



    @JsonIgnore
    public BulkStatCycleOperationResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<BulkStatCycleOperationResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatCycleOperationResult>>() {});
    }


}
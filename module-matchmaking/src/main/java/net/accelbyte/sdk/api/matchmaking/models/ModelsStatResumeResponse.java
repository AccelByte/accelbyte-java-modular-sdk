/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsStatResumeResponse extends Model {

    @JsonProperty("max")
    private String max;

    @JsonProperty("mean")
    private String mean;

    @JsonProperty("min")
    private String min;

    @JsonProperty("multiplier")
    private String multiplier;

    @JsonProperty("stddev")
    private String stddev;

    @JsonProperty("valueShifts")
    private Map<String, String> valueShifts;

    @JsonProperty("zscores")
    private Map<String, String> zscores;



    @JsonIgnore
    public ModelsStatResumeResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsStatResumeResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsStatResumeResponse>>() {});
    }


}
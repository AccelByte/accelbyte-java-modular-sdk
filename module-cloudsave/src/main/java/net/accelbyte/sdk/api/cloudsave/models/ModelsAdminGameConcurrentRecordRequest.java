/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsAdminGameConcurrentRecordRequest extends Model {

    @JsonProperty("tags")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> tags;

    @JsonProperty("ttl_config")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ModelsTTLConfigDTO ttlConfig;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private Map<String, ?> value;



    @JsonIgnore
    public ModelsAdminGameConcurrentRecordRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAdminGameConcurrentRecordRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdminGameConcurrentRecordRequest>>() {});
    }


}
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
public class XsollaConfig extends Model {

    @JsonProperty("apiKey")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String apiKey;

    @JsonProperty("flowCompletionUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String flowCompletionUrl;

    @JsonProperty("merchantId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer merchantId;

    @JsonProperty("projectId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer projectId;

    @JsonProperty("projectSecretKey")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String projectSecretKey;



    @JsonIgnore
    public XsollaConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XsollaConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XsollaConfig>>() {});
    }


}
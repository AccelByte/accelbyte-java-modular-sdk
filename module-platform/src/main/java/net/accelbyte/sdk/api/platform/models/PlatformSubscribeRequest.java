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
public class PlatformSubscribeRequest extends Model {

    @JsonProperty("grantDays")
    private Integer grantDays;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("language")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String language;

    @JsonProperty("reason")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String reason;

    @JsonProperty("region")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String region;

    @JsonProperty("source")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String source;



    @JsonIgnore
    public PlatformSubscribeRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PlatformSubscribeRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PlatformSubscribeRequest>>() {});
    }


}
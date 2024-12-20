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
public class PlaystationIAPConfigRequest extends Model {

    @JsonProperty("backOfficeServerClientId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String backOfficeServerClientId;

    @JsonProperty("backOfficeServerClientSecret")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String backOfficeServerClientSecret;

    @JsonProperty("enableStreamJob")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean enableStreamJob;

    @JsonProperty("environment")
    private String environment;

    @JsonProperty("streamName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String streamName;

    @JsonProperty("streamPartnerName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String streamPartnerName;



    @JsonIgnore
    public PlaystationIAPConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PlaystationIAPConfigRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PlaystationIAPConfigRequest>>() {});
    }


}
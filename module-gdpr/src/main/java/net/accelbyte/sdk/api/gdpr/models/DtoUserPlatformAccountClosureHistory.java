/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.models;

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
public class DtoUserPlatformAccountClosureHistory extends Model {

    @JsonProperty("closedDate")
    private Long closedDate;

    @JsonProperty("environment")
    private String environment;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("platform")
    private String platform;

    @JsonProperty("platformUserId")
    private String platformUserId;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public DtoUserPlatformAccountClosureHistory createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<DtoUserPlatformAccountClosureHistory> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<DtoUserPlatformAccountClosureHistory>>() {});
    }


}
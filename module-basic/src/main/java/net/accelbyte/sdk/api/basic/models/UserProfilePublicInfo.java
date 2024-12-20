/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.models;

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
public class UserProfilePublicInfo extends Model {

    @JsonProperty("avatarLargeUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String avatarLargeUrl;

    @JsonProperty("avatarSmallUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String avatarSmallUrl;

    @JsonProperty("avatarUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String avatarUrl;

    @JsonProperty("customAttributes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> customAttributes;

    @JsonProperty("namespace")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String namespace;

    @JsonProperty("publicId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String publicId;

    @JsonProperty("timeZone")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String timeZone;

    @JsonProperty("userId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String userId;



    @JsonIgnore
    public UserProfilePublicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserProfilePublicInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserProfilePublicInfo>>() {});
    }


}
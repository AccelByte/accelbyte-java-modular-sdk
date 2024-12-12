/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelPublicUserInformationV3 extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("uniqueDisplayName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String uniqueDisplayName;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("userName")
    private String userName;

    @JsonProperty("userPlatformInfos")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ModelUserPlatformInfo> userPlatformInfos;



    @JsonIgnore
    public ModelPublicUserInformationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelPublicUserInformationV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelPublicUserInformationV3>>() {});
    }


}
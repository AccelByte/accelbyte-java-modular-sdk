/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelNativeFriendRequest extends Model {

    @JsonProperty("isLogin")
    private Boolean isLogin;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("platformToken")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String platformToken;

    @JsonProperty("psnEnv")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String psnEnv;



    @JsonIgnore
    public ModelNativeFriendRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelNativeFriendRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelNativeFriendRequest>>() {});
    }


}
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
public class ModelUserCreateResponseV3 extends Model {

    @JsonProperty("authType")
    private String authType;

    @JsonProperty("country")
    private String country;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("emailAddress")
    private String emailAddress;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("uniqueDisplayName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String uniqueDisplayName;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public ModelUserCreateResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserCreateResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserCreateResponseV3>>() {});
    }


}
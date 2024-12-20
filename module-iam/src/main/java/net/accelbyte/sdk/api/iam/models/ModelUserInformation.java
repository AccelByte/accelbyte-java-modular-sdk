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
public class ModelUserInformation extends Model {

    @JsonProperty("Country")
    private String country;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailAddresses")
    private List<String> emailAddresses;

    @JsonProperty("LinkedPlatformAccounts")
    private List<ModelPlatformUserInformation> linkedPlatformAccounts;

    @JsonProperty("PhoneNumber")
    private String phoneNumber;

    @JsonProperty("Username")
    private String username;

    @JsonProperty("XUID")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String xuid;



    @JsonIgnore
    public ModelUserInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserInformation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserInformation>>() {});
    }


}
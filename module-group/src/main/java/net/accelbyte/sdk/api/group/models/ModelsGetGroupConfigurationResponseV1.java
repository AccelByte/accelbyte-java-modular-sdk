/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.models;

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
public class ModelsGetGroupConfigurationResponseV1 extends Model {

    @JsonProperty("allowMultiple")
    private Boolean allowMultiple;

    @JsonProperty("configurationCode")
    private String configurationCode;

    @JsonProperty("description")
    private String description;

    @JsonProperty("globalRules")
    private List<ModelsRuleResponseV1> globalRules;

    @JsonProperty("groupAdminRoleId")
    private String groupAdminRoleId;

    @JsonProperty("groupMaxMember")
    private Integer groupMaxMember;

    @JsonProperty("groupMemberRoleId")
    private String groupMemberRoleId;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;



    @JsonIgnore
    public ModelsGetGroupConfigurationResponseV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsGetGroupConfigurationResponseV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGetGroupConfigurationResponseV1>>() {});
    }


}
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
public class ModelsUpdateGroupRequestV1 extends Model {

    @JsonProperty("customAttributes")
    private ModelsUpdateGroupRequestV1CustomAttributes customAttributes;

    @JsonProperty("groupDescription")
    private String groupDescription;

    @JsonProperty("groupIcon")
    private String groupIcon;

    @JsonProperty("groupName")
    private String groupName;

    @JsonProperty("groupRegion")
    private String groupRegion;

    @JsonProperty("groupType")
    private String groupType;



    @JsonIgnore
    public String getGroupType() {
        return this.groupType;
    }

    @JsonIgnore
    public GroupType getGroupTypeAsEnum() {
        return GroupType.valueOf(this.groupType);
    }

    @JsonIgnore
    public void setGroupType(final String groupType) {
        this.groupType = groupType;
    }

    @JsonIgnore
    public void setGroupTypeFromEnum(final GroupType groupType) {
        this.groupType = groupType.toString();
    }

    @JsonIgnore
    public ModelsUpdateGroupRequestV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsUpdateGroupRequestV1> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdateGroupRequestV1>>() {});
    }


    public enum GroupType {
        OPEN("OPEN"),
        PRIVATE("PRIVATE"),
        PUBLIC("PUBLIC");

        private String value;

        GroupType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class ModelsUpdateGroupRequestV1Builder {
        private String groupType;


        public ModelsUpdateGroupRequestV1Builder groupType(final String groupType) {
            this.groupType = groupType;
            return this;
        }

        public ModelsUpdateGroupRequestV1Builder groupTypeFromEnum(final GroupType groupType) {
            this.groupType = groupType.toString();
            return this;
        }
    }
}
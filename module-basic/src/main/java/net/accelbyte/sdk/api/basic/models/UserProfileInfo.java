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
public class UserProfileInfo extends Model {

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

    @JsonProperty("dateOfBirth")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String dateOfBirth;

    @JsonProperty("firstName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String firstName;

    @JsonProperty("language")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String language;

    @JsonProperty("lastName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String lastName;

    @JsonProperty("namespace")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String namespace;

    @JsonProperty("publicId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String publicId;

    @JsonProperty("status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String status;

    @JsonProperty("timeZone")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String timeZone;

    @JsonProperty("userId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String userId;

    @JsonProperty("zipCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String zipCode;



    @JsonIgnore
    public String getStatus() {
        return this.status;
    }

    @JsonIgnore
    public Status getStatusAsEnum() {
        return Status.valueOf(this.status);
    }

    @JsonIgnore
    public void setStatus(final String status) {
        this.status = status;
    }

    @JsonIgnore
    public void setStatusFromEnum(final Status status) {
        this.status = status.toString();
    }

    @JsonIgnore
    public UserProfileInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserProfileInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserProfileInfo>>() {});
    }


    public enum Status {
        ACTIVE("ACTIVE"),
        INACTIVE("INACTIVE");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class UserProfileInfoBuilder {
        private String status;


        public UserProfileInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public UserProfileInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
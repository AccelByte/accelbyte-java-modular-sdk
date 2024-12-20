/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.models;

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
public class RestapiTicketResponse extends Model {

    @JsonProperty("category")
    private String category;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("extensionCategory")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String extensionCategory;

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("notes")
    private String notes;

    @JsonProperty("objectId")
    private String objectId;

    @JsonProperty("objectType")
    private String objectType;

    @JsonProperty("reportsCount")
    private Integer reportsCount;

    @JsonProperty("status")
    private String status;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public String getCategory() {
        return this.category;
    }

    @JsonIgnore
    public Category getCategoryAsEnum() {
        return Category.valueOf(this.category);
    }

    @JsonIgnore
    public void setCategory(final String category) {
        this.category = category;
    }

    @JsonIgnore
    public void setCategoryFromEnum(final Category category) {
        this.category = category.toString();
    }

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
    public RestapiTicketResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RestapiTicketResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RestapiTicketResponse>>() {});
    }


    public enum Category {
        CHAT("CHAT"),
        EXTENSION("EXTENSION"),
        UGC("UGC"),
        USER("USER");

        private String value;

        Category(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum Status {
        AUTOMODERATED("AUTO_MODERATED"),
        CLOSED("CLOSED"),
        OPEN("OPEN"),
        UNKNOWN("UNKNOWN");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class RestapiTicketResponseBuilder {
        private String category;
        private String status;


        public RestapiTicketResponseBuilder category(final String category) {
            this.category = category;
            return this;
        }

        public RestapiTicketResponseBuilder categoryFromEnum(final Category category) {
            this.category = category.toString();
            return this;
        }

        public RestapiTicketResponseBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public RestapiTicketResponseBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
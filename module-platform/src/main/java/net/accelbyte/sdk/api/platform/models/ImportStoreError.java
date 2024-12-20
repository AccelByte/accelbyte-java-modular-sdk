/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class ImportStoreError extends Model {

    @JsonProperty("app")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ImportStoreAppInfo app;

    @JsonProperty("category")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ImportStoreCategoryInfo category;

    @JsonProperty("errors")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ImportErrorDetails> errors;

    @JsonProperty("item")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ImportStoreItemInfo item;

    @JsonProperty("section")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ImportStoreSectionInfo section;

    @JsonProperty("type")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String type;

    @JsonProperty("view")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ImportStoreViewInfo view;



    @JsonIgnore
    public String getType() {
        return this.type;
    }

    @JsonIgnore
    public Type getTypeAsEnum() {
        return Type.valueOf(this.type);
    }

    @JsonIgnore
    public void setType(final String type) {
        this.type = type;
    }

    @JsonIgnore
    public void setTypeFromEnum(final Type type) {
        this.type = type.toString();
    }

    @JsonIgnore
    public ImportStoreError createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ImportStoreError> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ImportStoreError>>() {});
    }


    public enum Type {
        APP("APP"),
        CATEGORY("CATEGORY"),
        ITEM("ITEM"),
        SECTION("SECTION"),
        STORE("STORE"),
        VIEW("VIEW");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class ImportStoreErrorBuilder {
        private String type;


        public ImportStoreErrorBuilder type(final String type) {
            this.type = type;
            return this;
        }

        public ImportStoreErrorBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
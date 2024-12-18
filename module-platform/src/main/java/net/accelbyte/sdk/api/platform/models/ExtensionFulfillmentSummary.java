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
public class ExtensionFulfillmentSummary extends Model {

    @JsonProperty("grantedAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String grantedAt;

    @JsonProperty("itemClazz")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemClazz;

    @JsonProperty("itemExt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> itemExt;

    @JsonProperty("itemId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemId;

    @JsonProperty("itemType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemType;

    @JsonProperty("metadata")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> metadata;

    @JsonProperty("namespace")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String namespace;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("userId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String userId;



    @JsonIgnore
    public String getItemType() {
        return this.itemType;
    }

    @JsonIgnore
    public ItemType getItemTypeAsEnum() {
        return ItemType.valueOf(this.itemType);
    }

    @JsonIgnore
    public void setItemType(final String itemType) {
        this.itemType = itemType;
    }

    @JsonIgnore
    public void setItemTypeFromEnum(final ItemType itemType) {
        this.itemType = itemType.toString();
    }

    @JsonIgnore
    public ExtensionFulfillmentSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ExtensionFulfillmentSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ExtensionFulfillmentSummary>>() {});
    }


    public enum ItemType {
        APP("APP"),
        BUNDLE("BUNDLE"),
        CODE("CODE"),
        COINS("COINS"),
        EXTENSION("EXTENSION"),
        INGAMEITEM("INGAMEITEM"),
        LOOTBOX("LOOTBOX"),
        MEDIA("MEDIA"),
        OPTIONBOX("OPTIONBOX"),
        SEASON("SEASON"),
        SUBSCRIPTION("SUBSCRIPTION");

        private String value;

        ItemType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class ExtensionFulfillmentSummaryBuilder {
        private String itemType;


        public ExtensionFulfillmentSummaryBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }

        public ExtensionFulfillmentSummaryBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
    }
}
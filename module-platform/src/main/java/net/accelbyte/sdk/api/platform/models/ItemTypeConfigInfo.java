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
public class ItemTypeConfigInfo extends Model {

    @JsonProperty("clazz")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String clazz;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("dryRun")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean dryRun;

    @JsonProperty("fulfillmentUrl")
    private String fulfillmentUrl;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("purchaseConditionUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String purchaseConditionUrl;

    @JsonProperty("updatedAt")
    private String updatedAt;



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
    public ItemTypeConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemTypeConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemTypeConfigInfo>>() {});
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

    public static class ItemTypeConfigInfoBuilder {
        private String itemType;


        public ItemTypeConfigInfoBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }

        public ItemTypeConfigInfoBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }
    }
}
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
public class IAPItemEntry extends Model {

    @JsonProperty("itemIdentity")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemIdentity;

    @JsonProperty("itemIdentityType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemIdentityType;

    @JsonProperty("platformProductIdMap")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, String> platformProductIdMap;



    @JsonIgnore
    public String getItemIdentityType() {
        return this.itemIdentityType;
    }

    @JsonIgnore
    public ItemIdentityType getItemIdentityTypeAsEnum() {
        return ItemIdentityType.valueOf(this.itemIdentityType);
    }

    @JsonIgnore
    public void setItemIdentityType(final String itemIdentityType) {
        this.itemIdentityType = itemIdentityType;
    }

    @JsonIgnore
    public void setItemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
        this.itemIdentityType = itemIdentityType.toString();
    }

    @JsonIgnore
    public IAPItemEntry createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<IAPItemEntry> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<IAPItemEntry>>() {});
    }


    public enum ItemIdentityType {
        ITEMID("ITEM_ID"),
        ITEMSKU("ITEM_SKU");

        private String value;

        ItemIdentityType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class IAPItemEntryBuilder {
        private String itemIdentityType;


        public IAPItemEntryBuilder itemIdentityType(final String itemIdentityType) {
            this.itemIdentityType = itemIdentityType;
            return this;
        }

        public IAPItemEntryBuilder itemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
            this.itemIdentityType = itemIdentityType.toString();
            return this;
        }
    }
}
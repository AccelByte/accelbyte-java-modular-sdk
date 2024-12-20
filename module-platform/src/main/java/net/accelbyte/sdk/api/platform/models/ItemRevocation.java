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
public class ItemRevocation extends Model {

    @JsonProperty("creditRevocations")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<CreditRevocation> creditRevocations;

    @JsonProperty("customRevocation")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> customRevocation;

    @JsonProperty("entitlementOrigin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String entitlementOrigin;

    @JsonProperty("entitlementRevocations")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<EntitlementRevocation> entitlementRevocations;

    @JsonProperty("itemId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemId;

    @JsonProperty("itemRevocations")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ItemRevocation> itemRevocations;

    @JsonProperty("itemSku")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemSku;

    @JsonProperty("itemType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemType;

    @JsonProperty("quantity")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long quantity;

    @JsonProperty("reason")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String reason;

    @JsonProperty("skipped")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean skipped;

    @JsonProperty("status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String status;

    @JsonProperty("strategy")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String strategy;



    @JsonIgnore
    public String getEntitlementOrigin() {
        return this.entitlementOrigin;
    }

    @JsonIgnore
    public EntitlementOrigin getEntitlementOriginAsEnum() {
        return EntitlementOrigin.valueOf(this.entitlementOrigin);
    }

    @JsonIgnore
    public void setEntitlementOrigin(final String entitlementOrigin) {
        this.entitlementOrigin = entitlementOrigin;
    }

    @JsonIgnore
    public void setEntitlementOriginFromEnum(final EntitlementOrigin entitlementOrigin) {
        this.entitlementOrigin = entitlementOrigin.toString();
    }

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
    public ItemRevocation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemRevocation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemRevocation>>() {});
    }


    public enum EntitlementOrigin {
        Epic("Epic"),
        GooglePlay("GooglePlay"),
        IOS("IOS"),
        Nintendo("Nintendo"),
        Oculus("Oculus"),
        Other("Other"),
        Playstation("Playstation"),
        Steam("Steam"),
        System("System"),
        Twitch("Twitch"),
        Xbox("Xbox");

        private String value;

        EntitlementOrigin(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
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

    public enum Status {
        FAIL("FAIL"),
        SUCCESS("SUCCESS");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class ItemRevocationBuilder {
        private String entitlementOrigin;
        private String itemType;
        private String status;


        public ItemRevocationBuilder entitlementOrigin(final String entitlementOrigin) {
            this.entitlementOrigin = entitlementOrigin;
            return this;
        }

        public ItemRevocationBuilder entitlementOriginFromEnum(final EntitlementOrigin entitlementOrigin) {
            this.entitlementOrigin = entitlementOrigin.toString();
            return this;
        }

        public ItemRevocationBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }

        public ItemRevocationBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }

        public ItemRevocationBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public ItemRevocationBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
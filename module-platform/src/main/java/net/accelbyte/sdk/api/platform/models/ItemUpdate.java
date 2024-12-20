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
public class ItemUpdate extends Model {

    @JsonProperty("appId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String appId;

    @JsonProperty("appType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String appType;

    @JsonProperty("baseAppId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String baseAppId;

    @JsonProperty("boothName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String boothName;

    @JsonProperty("categoryPath")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String categoryPath;

    @JsonProperty("clazz")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String clazz;

    @JsonProperty("displayOrder")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer displayOrder;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("ext")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> ext;

    @JsonProperty("features")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> features;

    @JsonProperty("flexible")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean flexible;

    @JsonProperty("images")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<Image> images;

    @JsonProperty("inventoryConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private InventoryConfig inventoryConfig;

    @JsonProperty("itemIds")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> itemIds;

    @JsonProperty("itemQty")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, Integer> itemQty;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("listable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean listable;

    @JsonProperty("localizations")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, Localization> localizations;

    @JsonProperty("lootBoxConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private LootBoxConfig lootBoxConfig;

    @JsonProperty("maxCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer maxCount;

    @JsonProperty("maxCountPerUser")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer maxCountPerUser;

    @JsonProperty("name")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String name;

    @JsonProperty("optionBoxConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private OptionBoxConfig optionBoxConfig;

    @JsonProperty("purchasable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean purchasable;

    @JsonProperty("recurring")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Recurring recurring;

    @JsonProperty("regionData")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, List<RegionDataItemDTO>> regionData;

    @JsonProperty("saleConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private SaleConfig saleConfig;

    @JsonProperty("seasonType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String seasonType;

    @JsonProperty("sectionExclusive")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean sectionExclusive;

    @JsonProperty("sellable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean sellable;

    @JsonProperty("sku")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String sku;

    @JsonProperty("stackable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean stackable;

    @JsonProperty("status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String status;

    @JsonProperty("tags")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> tags;

    @JsonProperty("targetCurrencyCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String targetCurrencyCode;

    @JsonProperty("targetNamespace")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String targetNamespace;

    @JsonProperty("thumbnailUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String thumbnailUrl;

    @JsonProperty("useCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer useCount;



    @JsonIgnore
    public String getAppType() {
        return this.appType;
    }

    @JsonIgnore
    public AppType getAppTypeAsEnum() {
        return AppType.valueOf(this.appType);
    }

    @JsonIgnore
    public void setAppType(final String appType) {
        this.appType = appType;
    }

    @JsonIgnore
    public void setAppTypeFromEnum(final AppType appType) {
        this.appType = appType.toString();
    }

    @JsonIgnore
    public String getEntitlementType() {
        return this.entitlementType;
    }

    @JsonIgnore
    public EntitlementType getEntitlementTypeAsEnum() {
        return EntitlementType.valueOf(this.entitlementType);
    }

    @JsonIgnore
    public void setEntitlementType(final String entitlementType) {
        this.entitlementType = entitlementType;
    }

    @JsonIgnore
    public void setEntitlementTypeFromEnum(final EntitlementType entitlementType) {
        this.entitlementType = entitlementType.toString();
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
    public String getSeasonType() {
        return this.seasonType;
    }

    @JsonIgnore
    public SeasonType getSeasonTypeAsEnum() {
        return SeasonType.valueOf(this.seasonType);
    }

    @JsonIgnore
    public void setSeasonType(final String seasonType) {
        this.seasonType = seasonType;
    }

    @JsonIgnore
    public void setSeasonTypeFromEnum(final SeasonType seasonType) {
        this.seasonType = seasonType.toString();
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
    public ItemUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemUpdate>>() {});
    }


    public enum AppType {
        DEMO("DEMO"),
        DLC("DLC"),
        GAME("GAME"),
        SOFTWARE("SOFTWARE");

        private String value;

        AppType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum EntitlementType {
        CONSUMABLE("CONSUMABLE"),
        DURABLE("DURABLE");

        private String value;

        EntitlementType(String value){
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

    public enum SeasonType {
        PASS("PASS"),
        TIER("TIER");

        private String value;

        SeasonType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
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

    public static class ItemUpdateBuilder {
        private String appType;
        private String entitlementType;
        private String itemType;
        private String seasonType;
        private String status;


        public ItemUpdateBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }

        public ItemUpdateBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }

        public ItemUpdateBuilder entitlementType(final String entitlementType) {
            this.entitlementType = entitlementType;
            return this;
        }

        public ItemUpdateBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
            this.entitlementType = entitlementType.toString();
            return this;
        }

        public ItemUpdateBuilder itemType(final String itemType) {
            this.itemType = itemType;
            return this;
        }

        public ItemUpdateBuilder itemTypeFromEnum(final ItemType itemType) {
            this.itemType = itemType.toString();
            return this;
        }

        public ItemUpdateBuilder seasonType(final String seasonType) {
            this.seasonType = seasonType;
            return this;
        }

        public ItemUpdateBuilder seasonTypeFromEnum(final SeasonType seasonType) {
            this.seasonType = seasonType.toString();
            return this;
        }

        public ItemUpdateBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public ItemUpdateBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
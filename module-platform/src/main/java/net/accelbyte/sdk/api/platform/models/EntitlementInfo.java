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
public class EntitlementInfo extends Model {

    @JsonProperty("appId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String appId;

    @JsonProperty("appType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String appType;

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("collectionId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String collectionId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("endDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String endDate;

    @JsonProperty("features")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> features;

    @JsonProperty("grantedAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String grantedAt;

    @JsonProperty("grantedCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String grantedCode;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemNamespace")
    private String itemNamespace;

    @JsonProperty("itemSnapshot")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ItemSnapshot itemSnapshot;

    @JsonProperty("name")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("noOrigin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean noOrigin;

    @JsonProperty("origin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String origin;

    @JsonProperty("platformAvailable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean platformAvailable;

    @JsonProperty("sku")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String sku;

    @JsonProperty("source")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String source;

    @JsonProperty("stackable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean stackable;

    @JsonProperty("startDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String startDate;

    @JsonProperty("status")
    private String status;

    @JsonProperty("storeId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String storeId;

    @JsonProperty("type")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer useCount;

    @JsonProperty("userId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String userId;



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
    public String getClazz() {
        return this.clazz;
    }

    @JsonIgnore
    public Clazz getClazzAsEnum() {
        return Clazz.valueOf(this.clazz);
    }

    @JsonIgnore
    public void setClazz(final String clazz) {
        this.clazz = clazz;
    }

    @JsonIgnore
    public void setClazzFromEnum(final Clazz clazz) {
        this.clazz = clazz.toString();
    }

    @JsonIgnore
    public String getOrigin() {
        return this.origin;
    }

    @JsonIgnore
    public Origin getOriginAsEnum() {
        return Origin.valueOf(this.origin);
    }

    @JsonIgnore
    public void setOrigin(final String origin) {
        this.origin = origin;
    }

    @JsonIgnore
    public void setOriginFromEnum(final Origin origin) {
        this.origin = origin.toString();
    }

    @JsonIgnore
    public String getSource() {
        return this.source;
    }

    @JsonIgnore
    public Source getSourceAsEnum() {
        return Source.valueOf(this.source);
    }

    @JsonIgnore
    public void setSource(final String source) {
        this.source = source;
    }

    @JsonIgnore
    public void setSourceFromEnum(final Source source) {
        this.source = source.toString();
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
    public EntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {});
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

    public enum Clazz {
        APP("APP"),
        CODE("CODE"),
        ENTITLEMENT("ENTITLEMENT"),
        LOOTBOX("LOOTBOX"),
        MEDIA("MEDIA"),
        OPTIONBOX("OPTIONBOX"),
        SUBSCRIPTION("SUBSCRIPTION");

        private String value;

        Clazz(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum Origin {
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

        Origin(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum Source {
        ACHIEVEMENT("ACHIEVEMENT"),
        GIFT("GIFT"),
        IAP("IAP"),
        OTHER("OTHER"),
        PROMOTION("PROMOTION"),
        PURCHASE("PURCHASE"),
        REDEEMCODE("REDEEM_CODE"),
        REFERRALBONUS("REFERRAL_BONUS"),
        REWARD("REWARD");

        private String value;

        Source(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum Status {
        ACTIVE("ACTIVE"),
        CONSUMED("CONSUMED"),
        INACTIVE("INACTIVE"),
        REVOKED("REVOKED"),
        SOLD("SOLD");

        private String value;

        Status(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum Type {
        CONSUMABLE("CONSUMABLE"),
        DURABLE("DURABLE");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class EntitlementInfoBuilder {
        private String appType;
        private String clazz;
        private String origin;
        private String source;
        private String status;
        private String type;


        public EntitlementInfoBuilder appType(final String appType) {
            this.appType = appType;
            return this;
        }

        public EntitlementInfoBuilder appTypeFromEnum(final AppType appType) {
            this.appType = appType.toString();
            return this;
        }

        public EntitlementInfoBuilder clazz(final String clazz) {
            this.clazz = clazz;
            return this;
        }

        public EntitlementInfoBuilder clazzFromEnum(final Clazz clazz) {
            this.clazz = clazz.toString();
            return this;
        }

        public EntitlementInfoBuilder origin(final String origin) {
            this.origin = origin;
            return this;
        }

        public EntitlementInfoBuilder originFromEnum(final Origin origin) {
            this.origin = origin.toString();
            return this;
        }

        public EntitlementInfoBuilder source(final String source) {
            this.source = source;
            return this;
        }

        public EntitlementInfoBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }

        public EntitlementInfoBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public EntitlementInfoBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }

        public EntitlementInfoBuilder type(final String type) {
            this.type = type;
            return this;
        }

        public EntitlementInfoBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
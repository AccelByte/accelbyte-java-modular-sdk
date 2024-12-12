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
public class FulfillmentV2RequestItem extends Model {

    @JsonProperty("duration")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer duration;

    @JsonProperty("endDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String endDate;

    @JsonProperty("entitlementCollectionId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String entitlementCollectionId;

    @JsonProperty("entitlementOrigin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String entitlementOrigin;

    @JsonProperty("itemId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemId;

    @JsonProperty("itemSku")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemSku;

    @JsonProperty("language")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String language;

    @JsonProperty("metadata")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> metadata;

    @JsonProperty("orderNo")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String orderNo;

    @JsonProperty("origin")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String origin;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("region")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String region;

    @JsonProperty("source")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String source;

    @JsonProperty("startDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String startDate;

    @JsonProperty("storeId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String storeId;



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
    public FulfillmentV2RequestItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FulfillmentV2RequestItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentV2RequestItem>>() {});
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
        CONSUMEENTITLEMENT("CONSUME_ENTITLEMENT"),
        DLC("DLC"),
        EXPIRATION("EXPIRATION"),
        GIFT("GIFT"),
        IAP("IAP"),
        IAPCHARGEBACKREVERSED("IAP_CHARGEBACK_REVERSED"),
        ORDERREVOCATION("ORDER_REVOCATION"),
        OTHER("OTHER"),
        PAYMENT("PAYMENT"),
        PROMOTION("PROMOTION"),
        PURCHASE("PURCHASE"),
        REDEEMCODE("REDEEM_CODE"),
        REFERRALBONUS("REFERRAL_BONUS"),
        REWARD("REWARD"),
        SELLBACK("SELL_BACK");

        private String value;

        Source(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class FulfillmentV2RequestItemBuilder {
        private String entitlementOrigin;
        private String origin;
        private String source;


        public FulfillmentV2RequestItemBuilder entitlementOrigin(final String entitlementOrigin) {
            this.entitlementOrigin = entitlementOrigin;
            return this;
        }

        public FulfillmentV2RequestItemBuilder entitlementOriginFromEnum(final EntitlementOrigin entitlementOrigin) {
            this.entitlementOrigin = entitlementOrigin.toString();
            return this;
        }

        public FulfillmentV2RequestItemBuilder origin(final String origin) {
            this.origin = origin;
            return this;
        }

        public FulfillmentV2RequestItemBuilder originFromEnum(final Origin origin) {
            this.origin = origin.toString();
            return this;
        }

        public FulfillmentV2RequestItemBuilder source(final String source) {
            this.source = source;
            return this;
        }

        public FulfillmentV2RequestItemBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }
    }
}
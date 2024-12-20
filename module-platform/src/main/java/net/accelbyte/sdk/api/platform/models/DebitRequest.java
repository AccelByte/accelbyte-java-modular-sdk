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
public class DebitRequest extends Model {

    @JsonProperty("amount")
    private Long amount;

    @JsonProperty("balanceSource")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String balanceSource;

    @JsonProperty("metadata")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> metadata;

    @JsonProperty("reason")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String reason;



    @JsonIgnore
    public String getBalanceSource() {
        return this.balanceSource;
    }

    @JsonIgnore
    public BalanceSource getBalanceSourceAsEnum() {
        return BalanceSource.valueOf(this.balanceSource);
    }

    @JsonIgnore
    public void setBalanceSource(final String balanceSource) {
        this.balanceSource = balanceSource;
    }

    @JsonIgnore
    public void setBalanceSourceFromEnum(final BalanceSource balanceSource) {
        this.balanceSource = balanceSource.toString();
    }

    @JsonIgnore
    public DebitRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<DebitRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<DebitRequest>>() {});
    }


    public enum BalanceSource {
        DLCREVOCATION("DLC_REVOCATION"),
        EXPIRATION("EXPIRATION"),
        IAPREVOCATION("IAP_REVOCATION"),
        ORDERREVOCATION("ORDER_REVOCATION"),
        OTHER("OTHER"),
        PAYMENT("PAYMENT"),
        TRADE("TRADE");

        private String value;

        BalanceSource(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class DebitRequestBuilder {
        private String balanceSource;


        public DebitRequestBuilder balanceSource(final String balanceSource) {
            this.balanceSource = balanceSource;
            return this;
        }

        public DebitRequestBuilder balanceSourceFromEnum(final BalanceSource balanceSource) {
            this.balanceSource = balanceSource.toString();
            return this;
        }
    }
}
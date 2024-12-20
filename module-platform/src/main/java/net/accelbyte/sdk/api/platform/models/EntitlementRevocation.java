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
public class EntitlementRevocation extends Model {

    @JsonProperty("customRevocation")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Map<String, ?> customRevocation;

    @JsonProperty("entitlementId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String entitlementId;

    @JsonProperty("itemId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemId;

    @JsonProperty("itemSku")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemSku;

    @JsonProperty("quantity")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long quantity;

    @JsonProperty("reason")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String reason;

    @JsonProperty("revocationStrategy")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String revocationStrategy;

    @JsonProperty("skipped")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean skipped;

    @JsonProperty("status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String status;



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
    public EntitlementRevocation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementRevocation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementRevocation>>() {});
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

    public static class EntitlementRevocationBuilder {
        private String status;


        public EntitlementRevocationBuilder status(final String status) {
            this.status = status;
            return this;
        }

        public EntitlementRevocationBuilder statusFromEnum(final Status status) {
            this.status = status.toString();
            return this;
        }
    }
}
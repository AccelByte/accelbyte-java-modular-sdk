/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class RewardUpdate extends Model {

    @JsonProperty("currency")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private RewardCurrency currency;

    @JsonProperty("image")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Image image;

    @JsonProperty("itemId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String itemId;

    @JsonProperty("nullFields")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> nullFields;

    @JsonProperty("quantity")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer quantity;

    @JsonProperty("type")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String type;



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
    public RewardUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardUpdate>>() {});
    }


    public enum Type {
        CURRENCY("CURRENCY"),
        ITEM("ITEM");

        private String value;

        Type(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class RewardUpdateBuilder {
        private String type;


        public RewardUpdateBuilder type(final String type) {
            this.type = type;
            return this;
        }

        public RewardUpdateBuilder typeFromEnum(final Type type) {
            this.type = type.toString();
            return this;
        }
    }
}
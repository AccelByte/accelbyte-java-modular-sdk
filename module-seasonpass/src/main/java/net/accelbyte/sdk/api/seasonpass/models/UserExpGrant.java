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
public class UserExpGrant extends Model {

    @JsonProperty("exp")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer exp;

    @JsonProperty("source")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String source;

    @JsonProperty("tags")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> tags;



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
    public UserExpGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserExpGrant> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserExpGrant>>() {});
    }


    public enum Source {
        PAIDFOR("PAID_FOR"),
        SWEAT("SWEAT");

        private String value;

        Source(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class UserExpGrantBuilder {
        private String source;


        public UserExpGrantBuilder source(final String source) {
            this.source = source;
            return this;
        }

        public UserExpGrantBuilder sourceFromEnum(final Source source) {
            this.source = source.toString();
            return this;
        }
    }
}
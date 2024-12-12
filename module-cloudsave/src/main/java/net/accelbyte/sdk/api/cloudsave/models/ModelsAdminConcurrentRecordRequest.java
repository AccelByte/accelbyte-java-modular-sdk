/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsAdminConcurrentRecordRequest extends Model {

    @JsonProperty("set_by")
    private String setBy;

    @JsonProperty("tags")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> tags;

    @JsonProperty("ttl_config")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ModelsTTLConfigDTO ttlConfig;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private Map<String, ?> value;



    @JsonIgnore
    public String getSetBy() {
        return this.setBy;
    }

    @JsonIgnore
    public SetBy getSetByAsEnum() {
        return SetBy.valueOf(this.setBy);
    }

    @JsonIgnore
    public void setSetBy(final String setBy) {
        this.setBy = setBy;
    }

    @JsonIgnore
    public void setSetByFromEnum(final SetBy setBy) {
        this.setBy = setBy.toString();
    }

    @JsonIgnore
    public ModelsAdminConcurrentRecordRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAdminConcurrentRecordRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdminConcurrentRecordRequest>>() {});
    }


    public enum SetBy {
        CLIENT("CLIENT"),
        SERVER("SERVER");

        private String value;

        SetBy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public static class ModelsAdminConcurrentRecordRequestBuilder {
        private String setBy;


        public ModelsAdminConcurrentRecordRequestBuilder setBy(final String setBy) {
            this.setBy = setBy;
            return this;
        }

        public ModelsAdminConcurrentRecordRequestBuilder setByFromEnum(final SetBy setBy) {
            this.setBy = setBy.toString();
            return this;
        }
    }
}
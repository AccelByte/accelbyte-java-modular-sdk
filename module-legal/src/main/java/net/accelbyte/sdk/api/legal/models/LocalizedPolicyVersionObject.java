/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class LocalizedPolicyVersionObject extends Model {

    @JsonProperty("attachmentChecksum")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String attachmentChecksum;

    @JsonProperty("attachmentLocation")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String attachmentLocation;

    @JsonProperty("attachmentVersionIdentifier")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String attachmentVersionIdentifier;

    @JsonProperty("contentType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String contentType;

    @JsonProperty("createdAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String createdAt;

    @JsonProperty("description")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isDefaultSelection")
    private Boolean isDefaultSelection;

    @JsonProperty("localeCode")
    private String localeCode;

    @JsonProperty("publishedDate")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String publishedDate;

    @JsonProperty("status")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String status;

    @JsonProperty("updatedAt")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String updatedAt;



    @JsonIgnore
    public LocalizedPolicyVersionObject createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<LocalizedPolicyVersionObject> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedPolicyVersionObject>>() {});
    }


}
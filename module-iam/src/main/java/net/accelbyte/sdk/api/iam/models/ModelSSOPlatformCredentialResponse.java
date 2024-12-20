/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelSSOPlatformCredentialResponse extends Model {

    @JsonProperty("acsUrl")
    private String acsUrl;

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("federationMetadataUrl")
    private String federationMetadataUrl;

    @JsonProperty("isActive")
    private Boolean isActive;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("redirectUri")
    private String redirectUri;

    @JsonProperty("secret")
    private String secret;

    @JsonProperty("ssoUrl")
    private String ssoUrl;

    @JsonProperty("truncatedApiKey")
    private String truncatedApiKey;



    @JsonIgnore
    public ModelSSOPlatformCredentialResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelSSOPlatformCredentialResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelSSOPlatformCredentialResponse>>() {});
    }


}
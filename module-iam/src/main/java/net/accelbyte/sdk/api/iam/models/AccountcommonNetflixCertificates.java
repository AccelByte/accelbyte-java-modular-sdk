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
public class AccountcommonNetflixCertificates extends Model {

    @JsonProperty("encryptedPrivateKey")
    private String encryptedPrivateKey;

    @JsonProperty("encryptedPrivateKeyName")
    private String encryptedPrivateKeyName;

    @JsonProperty("publicCertificate")
    private String publicCertificate;

    @JsonProperty("publicCertificateName")
    private String publicCertificateName;

    @JsonProperty("rootCertificate")
    private String rootCertificate;

    @JsonProperty("rootCertificateName")
    private String rootCertificateName;



    @JsonIgnore
    public AccountcommonNetflixCertificates createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AccountcommonNetflixCertificates> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonNetflixCertificates>>() {});
    }


}
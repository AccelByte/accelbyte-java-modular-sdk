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
public class StripeConfig extends Model {

    @JsonProperty("allowedPaymentMethodTypes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<String> allowedPaymentMethodTypes;

    @JsonProperty("publishableKey")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String publishableKey;

    @JsonProperty("secretKey")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String secretKey;

    @JsonProperty("webhookSecret")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String webhookSecret;



    @JsonIgnore
    public StripeConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<StripeConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StripeConfig>>() {});
    }


}
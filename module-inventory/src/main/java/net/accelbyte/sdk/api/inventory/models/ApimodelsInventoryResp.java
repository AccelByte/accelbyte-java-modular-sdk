/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

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
public class ApimodelsInventoryResp extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("inventoryConfigurationCode")
    private String inventoryConfigurationCode;

    @JsonProperty("inventoryConfigurationId")
    private String inventoryConfigurationId;

    @JsonProperty("maxSlots")
    private Integer maxSlots;

    @JsonProperty("maxUpgradeSlots")
    private Integer maxUpgradeSlots;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("usedCountSlots")
    private Integer usedCountSlots;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public ApimodelsInventoryResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsInventoryResp> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsInventoryResp>>() {});
    }


}
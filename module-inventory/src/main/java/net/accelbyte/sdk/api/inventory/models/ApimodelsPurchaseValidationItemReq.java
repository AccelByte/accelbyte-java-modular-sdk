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
public class ApimodelsPurchaseValidationItemReq extends Model {

    @JsonProperty("bundledQty")
    private Integer bundledQty;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("inventoryConfig")
    private ApimodelsInventoryConfig inventoryConfig;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("useCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer useCount;



    @JsonIgnore
    public ApimodelsPurchaseValidationItemReq createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsPurchaseValidationItemReq> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsPurchaseValidationItemReq>>() {});
    }


}
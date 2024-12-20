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
public class ApimodelsPurchaseValidationReq extends Model {

    @JsonProperty("entitlementType")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String entitlementType;

    @JsonProperty("inventoryConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ApimodelsInventoryConfig inventoryConfig;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("items")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<ApimodelsPurchaseValidationItemReq> items;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean stackable;

    @JsonProperty("useCount")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer useCount;



    @JsonIgnore
    public ApimodelsPurchaseValidationReq createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsPurchaseValidationReq> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsPurchaseValidationReq>>() {});
    }


}
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
public class ItemTypeConfigUpdate extends Model {

    @JsonProperty("clazz")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String clazz;

    @JsonProperty("dryRun")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean dryRun;

    @JsonProperty("fulfillmentUrl")
    private String fulfillmentUrl;

    @JsonProperty("purchaseConditionUrl")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String purchaseConditionUrl;



    @JsonIgnore
    public ItemTypeConfigUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemTypeConfigUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemTypeConfigUpdate>>() {});
    }


}
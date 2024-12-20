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
public class DiscountCodeDeductionDetail extends Model {

    @JsonProperty("discountAmountCodes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<DiscountCodeInfo> discountAmountCodes;

    @JsonProperty("discountPercentageCodes")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<DiscountCodeInfo> discountPercentageCodes;

    @JsonProperty("totalAmountDeduction")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer totalAmountDeduction;

    @JsonProperty("totalDeduction")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer totalDeduction;

    @JsonProperty("totalPercentageDeduction")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer totalPercentageDeduction;



    @JsonIgnore
    public DiscountCodeDeductionDetail createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<DiscountCodeDeductionDetail> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<DiscountCodeDeductionDetail>>() {});
    }


}
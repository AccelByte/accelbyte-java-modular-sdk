/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.models;

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
public class AddCountryGroupRequest extends Model {

    @JsonProperty("countries")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<CountryObject> countries;

    @JsonProperty("countryGroupCode")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String countryGroupCode;

    @JsonProperty("countryGroupName")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String countryGroupName;



    @JsonIgnore
    public AddCountryGroupRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AddCountryGroupRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AddCountryGroupRequest>>() {});
    }


}
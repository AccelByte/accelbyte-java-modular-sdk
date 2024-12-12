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
import net.accelbyte.sdk.core.ApiError;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor=@__(@Deprecated))
@NoArgsConstructor
public class ApimodelsChainingOperationResp extends Model {

    @JsonProperty("errorDetails")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ApimodelsErrorResponse errorDetails;

    @JsonProperty("message")
    private String message;

    @JsonProperty("replayed")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean replayed;

    @JsonProperty("requestId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String requestId;



    @JsonIgnore
    public ApimodelsChainingOperationResp createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsChainingOperationResp> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsChainingOperationResp>>() {});
    }

    public ApiError translateToApiError() {

        final String theCode = 
            errorDetails != null ? String.valueOf(errorDetails) :
            "";
        
        final String theMessage = 
            message != null ? message : 
            "";
        
        return new ApiError(theCode, theMessage);
    }


}
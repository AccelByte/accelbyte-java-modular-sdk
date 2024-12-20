/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.models;

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
public class ApiMatchTicketStatus extends Model {

    @JsonProperty("isActive")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Boolean isActive;

    @JsonProperty("matchFound")
    private Boolean matchFound;

    @JsonProperty("matchPool")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String matchPool;

    @JsonProperty("matchTicketID")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String matchTicketID;

    @JsonProperty("proposedProposal")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private ApiProposedProposal proposedProposal;

    @JsonProperty("sessionID")
    private String sessionID;



    @JsonIgnore
    public ApiMatchTicketStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApiMatchTicketStatus> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApiMatchTicketStatus>>() {});
    }


}
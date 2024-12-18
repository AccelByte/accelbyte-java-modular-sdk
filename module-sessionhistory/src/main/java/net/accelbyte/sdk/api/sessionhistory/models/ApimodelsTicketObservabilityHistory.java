/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ApimodelsTicketObservabilityHistory extends Model {

    @JsonProperty("Action")
    private String action;

    @JsonProperty("ExpiredAt")
    private String expiredAt;

    @JsonProperty("ID")
    private String id;

    @JsonProperty("Payload")
    private Map<String, ?> payload;

    @JsonProperty("PodName")
    private String podName;

    @JsonProperty("TickID")
    private Long tickID;

    @JsonProperty("Timestamp")
    private String timestamp;

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("ticket_id")
    private String ticketId;



    @JsonIgnore
    public ApimodelsTicketObservabilityHistory createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ApimodelsTicketObservabilityHistory> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsTicketObservabilityHistory>>() {});
    }


}
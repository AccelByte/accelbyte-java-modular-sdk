/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsMatchingParty extends Model {

    @JsonProperty("first_ticket_created_at")
    private Long firstTicketCreatedAt;

    @JsonProperty("party_attributes")
    private Map<String, ?> partyAttributes;

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("party_members")
    private List<ModelsPartyMember> partyMembers;

    @JsonProperty("ticket_created_at")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long ticketCreatedAt;

    @JsonProperty("ticket_id")
    private String ticketId;



    @JsonIgnore
    public ModelsMatchingParty createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsMatchingParty> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchingParty>>() {});
    }


}
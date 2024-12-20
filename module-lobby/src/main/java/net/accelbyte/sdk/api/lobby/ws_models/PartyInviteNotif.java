/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.ws_models;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

import static net.accelbyte.sdk.core.util.Helper.generateUUID;
import static net.accelbyte.sdk.core.util.Helper.parseWSM;
import static net.accelbyte.sdk.core.util.Helper.getWSMType;
import static net.accelbyte.sdk.core.util.Helper.listToWSMList;
import static net.accelbyte.sdk.core.util.Helper.convertJsonToMap;
import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListString;
import static net.accelbyte.sdk.core.util.Helper.convertWSMListToListInteger;

@Getter
@Setter
public class PartyInviteNotif {
    private String inviteeId;
    private String inviterId;

    private PartyInviteNotif() {}

    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PartyInviteNotif (
        String inviteeId,
        String inviterId
    ) {
        this.inviteeId = inviteeId;
        this.inviterId = inviterId;
    }

    public static String getType(){
        return "partyInviteNotif";
    }

    public static PartyInviteNotif createFromWSM(String message) {
        PartyInviteNotif result = new PartyInviteNotif();
        Map<String, String> response = parseWSM(message);
        result.inviteeId = response.get("inviteeId") != null ? response.get("inviteeId") : null;
        result.inviterId = response.get("inviterId") != null ? response.get("inviterId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(PartyInviteNotif.getType());
        if (inviteeId != null) {
            stringBuilder
                    .append("\n")
                    .append("inviteeId: ")
                    .append(inviteeId);
        }
        if (inviterId != null) {
            stringBuilder
                    .append("\n")
                    .append("inviterId: ")
                    .append(inviterId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("inviteeId","inviteeId");
        result.put("inviterId","inviterId");
        return result;
    }
}
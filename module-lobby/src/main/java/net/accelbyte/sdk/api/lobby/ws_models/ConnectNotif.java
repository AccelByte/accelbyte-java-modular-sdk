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
public class ConnectNotif {
    private String lobbySessionID;

    private ConnectNotif() {}

    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ConnectNotif (
        String lobbySessionID
    ) {
        this.lobbySessionID = lobbySessionID;
    }

    public static String getType(){
        return "connectNotif";
    }

    public static ConnectNotif createFromWSM(String message) {
        ConnectNotif result = new ConnectNotif();
        Map<String, String> response = parseWSM(message);
        result.lobbySessionID = response.get("lobbySessionID") != null ? response.get("lobbySessionID") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ConnectNotif.getType());
        if (lobbySessionID != null) {
            stringBuilder
                    .append("\n")
                    .append("lobbySessionID: ")
                    .append(lobbySessionID);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("lobbySessionID","lobbySessionID");
        return result;
    }
}
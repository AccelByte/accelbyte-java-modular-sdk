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
public class DisconnectNotif {
    private String connectionId;
    private String namespace;

    private DisconnectNotif() {}

    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public DisconnectNotif (
        String connectionId,
        String namespace
    ) {
        this.connectionId = connectionId;
        this.namespace = namespace;
    }

    public static String getType(){
        return "disconnectNotif";
    }

    public static DisconnectNotif createFromWSM(String message) {
        DisconnectNotif result = new DisconnectNotif();
        Map<String, String> response = parseWSM(message);
        result.connectionId = response.get("connectionId") != null ? response.get("connectionId") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(DisconnectNotif.getType());
        if (connectionId != null) {
            stringBuilder
                    .append("\n")
                    .append("connectionId: ")
                    .append(connectionId);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("connectionId","connectionId");
        result.put("namespace","namespace");
        return result;
    }
}
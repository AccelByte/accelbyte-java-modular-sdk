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
public class BlockPlayerNotif {
    private String blockedUserId;
    private String userId;

    private BlockPlayerNotif() {}

    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public BlockPlayerNotif (
        String blockedUserId,
        String userId
    ) {
        this.blockedUserId = blockedUserId;
        this.userId = userId;
    }

    public static String getType(){
        return "blockPlayerNotif";
    }

    public static BlockPlayerNotif createFromWSM(String message) {
        BlockPlayerNotif result = new BlockPlayerNotif();
        Map<String, String> response = parseWSM(message);
        result.blockedUserId = response.get("blockedUserId") != null ? response.get("blockedUserId") : null;
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(BlockPlayerNotif.getType());
        if (blockedUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("blockedUserId: ")
                    .append(blockedUserId);
        }
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("blockedUserId","blockedUserId");
        result.put("userId","userId");
        return result;
    }
}
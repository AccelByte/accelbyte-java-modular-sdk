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
public class XblAchievementUpdateRequest extends Model {

    @JsonProperty("achievements")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private List<XboxAchievement> achievements;

    @JsonProperty("serviceConfigId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String serviceConfigId;

    @JsonProperty("titleId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String titleId;

    @JsonProperty("xboxUserId")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String xboxUserId;



    @JsonIgnore
    public XblAchievementUpdateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XblAchievementUpdateRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XblAchievementUpdateRequest>>() {});
    }


}
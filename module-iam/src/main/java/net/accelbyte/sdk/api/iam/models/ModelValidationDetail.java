/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelValidationDetail extends Model {

    @JsonProperty("allowAllSpecialCharacters")
    private Boolean allowAllSpecialCharacters;

    @JsonProperty("allowDigit")
    private Boolean allowDigit;

    @JsonProperty("allowLetter")
    private Boolean allowLetter;

    @JsonProperty("allowSpace")
    private Boolean allowSpace;

    @JsonProperty("allowUnicode")
    private Boolean allowUnicode;

    @JsonProperty("avatarConfig")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private AccountcommonAvatarConfig avatarConfig;

    @JsonProperty("blockedWord")
    private List<String> blockedWord;

    @JsonProperty("description")
    private List<AccountcommonInputValidationDescription> description;

    @JsonProperty("isCustomRegex")
    private Boolean isCustomRegex;

    @JsonProperty("letterCase")
    private String letterCase;

    @JsonProperty("maxLength")
    private Integer maxLength;

    @JsonProperty("maxRepeatingAlphaNum")
    private Integer maxRepeatingAlphaNum;

    @JsonProperty("maxRepeatingSpecialCharacter")
    private Integer maxRepeatingSpecialCharacter;

    @JsonProperty("minCharType")
    private Integer minCharType;

    @JsonProperty("minLength")
    private Integer minLength;

    @JsonProperty("profanityFilter")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String profanityFilter;

    @JsonProperty("regex")
    private String regex;

    @JsonProperty("specialCharacterLocation")
    private String specialCharacterLocation;

    @JsonProperty("specialCharacters")
    private List<String> specialCharacters;



    @JsonIgnore
    public ModelValidationDetail createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelValidationDetail> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelValidationDetail>>() {});
    }


}
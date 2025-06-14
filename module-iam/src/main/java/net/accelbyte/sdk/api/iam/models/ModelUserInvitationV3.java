/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelUserInvitationV3 extends Model {

  @JsonProperty("acceptanceLink")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String acceptanceLink;

  @JsonProperty("additionalData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String additionalData;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("email")
  private String email;

  @JsonProperty("expiredAt")
  private String expiredAt;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("isNewStudio")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isNewStudio;

  @JsonProperty("languageTag")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String languageTag;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("namespaceDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespaceDisplayName;

  @JsonProperty("roles")
  private List<AccountcommonNamespaceRole> roles;

  @JsonProperty("studioNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String studioNamespace;

  @JsonIgnore
  public ModelUserInvitationV3 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserInvitationV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserInvitationV3>>() {});
  }
}

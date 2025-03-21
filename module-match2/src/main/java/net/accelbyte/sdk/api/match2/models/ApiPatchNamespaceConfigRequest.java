/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.models;

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
public class ApiPatchNamespaceConfigRequest extends Model {

  @JsonProperty("crossPlatformNoCurrentPlatform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean crossPlatformNoCurrentPlatform;

  @JsonProperty("extraPlatforms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> extraPlatforms;

  @JsonProperty("matchAnyCommon")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean matchAnyCommon;

  @JsonProperty("platformGroup")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, List<String>> platformGroup;

  @JsonIgnore
  public ApiPatchNamespaceConfigRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiPatchNamespaceConfigRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApiPatchNamespaceConfigRequest>>() {});
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class GoogleIAPConfigInfo extends Model {

  @JsonProperty("applicationName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String applicationName;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("notificationTokenAudience")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notificationTokenAudience;

  @JsonProperty("notificationTokenEmail")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notificationTokenEmail;

  @JsonProperty("p12FileName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String p12FileName;

  @JsonProperty("packageName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String packageName;

  @JsonProperty("serviceAccountId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String serviceAccountId;

  @JsonIgnore
  public GoogleIAPConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GoogleIAPConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GoogleIAPConfigInfo>>() {});
  }
}

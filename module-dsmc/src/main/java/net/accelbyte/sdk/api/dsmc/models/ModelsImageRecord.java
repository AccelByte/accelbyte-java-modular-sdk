/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsImageRecord extends Model {

  @JsonProperty("artifactPath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String artifactPath;

  @JsonProperty("coreDumpEnabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean coreDumpEnabled;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("dockerPath")
  private String dockerPath;

  @JsonProperty("image")
  private String image;

  @JsonProperty("imageReplications")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsImageReplication> imageReplications;

  @JsonProperty("imageReplicationsMap")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ModelsImageReplication> imageReplicationsMap;

  @JsonProperty("imageSize")
  private Integer imageSize;

  @JsonProperty("modifiedBy")
  private String modifiedBy;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("ulimitFileSize")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer ulimitFileSize;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("version")
  private String version;

  @JsonIgnore
  public ModelsImageRecord createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsImageRecord> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsImageRecord>>() {});
  }
}

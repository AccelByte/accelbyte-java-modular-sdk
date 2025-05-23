/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

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
public class ApimodelsCreateItem extends Model {

  @JsonProperty("customAttributes")
  private Map<String, ?> customAttributes;

  @JsonProperty("inventoryConfigurationCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String inventoryConfigurationCode;

  @JsonProperty("inventoryId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String inventoryId;

  @JsonProperty("qty")
  private Integer qty;

  @JsonProperty("serverCustomAttributes")
  private Map<String, ?> serverCustomAttributes;

  @JsonProperty("slotId")
  private String slotId;

  @JsonProperty("slotUsed")
  private Integer slotUsed;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("sourceItemId")
  private String sourceItemId;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("toSpecificInventory")
  private Boolean toSpecificInventory;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public String getSource() {
    return this.source;
  }

  @JsonIgnore
  public Source getSourceAsEnum() {
    return Source.valueOf(this.source);
  }

  @JsonIgnore
  public void setSource(final String source) {
    this.source = source;
  }

  @JsonIgnore
  public void setSourceFromEnum(final Source source) {
    this.source = source.toString();
  }

  @JsonIgnore
  public ApimodelsCreateItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreateItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsCreateItem>>() {});
  }

  public enum Source {
    ECOMMERCE("ECOMMERCE"),
    OTHER("OTHER");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsCreateItemBuilder {
    private String source;

    public ApimodelsCreateItemBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public ApimodelsCreateItemBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}

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
public class GoogleIAPReceipt extends Model {

  @JsonProperty("autoAck")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoAck;

  @JsonProperty("autoConsume")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoConsume;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("orderId")
  private String orderId;

  @JsonProperty("packageName")
  private String packageName;

  @JsonProperty("productId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String productId;

  @JsonProperty("purchaseTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long purchaseTime;

  @JsonProperty("purchaseToken")
  private String purchaseToken;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("subscriptionPurchase")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean subscriptionPurchase;

  @JsonIgnore
  public GoogleIAPReceipt createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GoogleIAPReceipt> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GoogleIAPReceipt>>() {});
  }
}

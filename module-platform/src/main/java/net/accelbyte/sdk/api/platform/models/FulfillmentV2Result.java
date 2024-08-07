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
public class FulfillmentV2Result extends Model {

  @JsonProperty("creditSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<CreditSummary> creditSummaries;

  @JsonProperty("entitlementSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementSummary> entitlementSummaries;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("items")
  private List<FulfillmentItem> items;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("state")
  private String state;

  @JsonProperty("stateInfo")
  private FulfillmentStateInfo stateInfo;

  @JsonProperty("subscriptionSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<SubscriptionSummary> subscriptionSummaries;

  @JsonProperty("transactionId")
  private String transactionId;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getState() {
    return this.state;
  }

  @JsonIgnore
  public State getStateAsEnum() {
    return State.valueOf(this.state);
  }

  @JsonIgnore
  public void setState(final String state) {
    this.state = state;
  }

  @JsonIgnore
  public void setStateFromEnum(final State state) {
    this.state = state.toString();
  }

  @JsonIgnore
  public FulfillmentV2Result createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulfillmentV2Result> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentV2Result>>() {});
  }

  public enum State {
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    REVOKED("REVOKED"),
    REVOKEFAILED("REVOKE_FAILED");

    private String value;

    State(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class FulfillmentV2ResultBuilder {
    private String state;

    public FulfillmentV2ResultBuilder state(final String state) {
      this.state = state;
      return this;
    }

    public FulfillmentV2ResultBuilder stateFromEnum(final State state) {
      this.state = state.toString();
      return this;
    }
  }
}

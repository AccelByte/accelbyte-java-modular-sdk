/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.models;

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
public class DtoFinishedDataDeletion extends Model {

  @JsonProperty("failedMessage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String failedMessage;

  @JsonProperty("finishedDate")
  private String finishedDate;

  @JsonProperty("requestDate")
  private String requestDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public DtoFinishedDataDeletion createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DtoFinishedDataDeletion> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DtoFinishedDataDeletion>>() {});
  }

  public enum Status {
    Completed("Completed"),
    Failed("Failed");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DtoFinishedDataDeletionBuilder {
    private String status;

    public DtoFinishedDataDeletionBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public DtoFinishedDataDeletionBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.artifacts;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ArtifactBulkDelete
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA [DELETE]
 */
@Getter
@Setter
public class ArtifactBulkDelete extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/artifacts";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String artifactType;
  private String fleetId;
  private String uploadedBefore;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ArtifactBulkDelete(
      String customBasePath,
      String namespace,
      String artifactType,
      String fleetId,
      String uploadedBefore) {
    this.namespace = namespace;
    this.artifactType = artifactType;
    this.fleetId = fleetId;
    this.uploadedBefore = uploadedBefore;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "artifactType", this.artifactType == null ? null : Arrays.asList(this.artifactType));
    queryParams.put("fleetId", this.fleetId == null ? null : Arrays.asList(this.fleetId));
    queryParams.put(
        "uploadedBefore", this.uploadedBefore == null ? null : Arrays.asList(this.uploadedBefore));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 202) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("artifactType", "None");
    result.put("fleetId", "None");
    result.put("uploadedBefore", "None");
    return result;
  }
}

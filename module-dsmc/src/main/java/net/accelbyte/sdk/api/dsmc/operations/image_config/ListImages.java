/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.image_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operation_responses.image_config.ListImagesOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ListImages
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint lists all of dedicated servers images.
 *
 * <p>Parameter Offset and Count is Required
 */
@Getter
@Setter
public class ListImages extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/namespaces/{namespace}/images";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String q;
  private String sortBy;
  private String sortDirection;
  private Integer count;
  private Integer offset;

  /**
   * @param namespace required
   * @param count required
   * @param offset required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListImages(
      String customBasePath,
      String namespace,
      String q,
      String sortBy,
      String sortDirection,
      Integer count,
      Integer offset) {
    this.namespace = namespace;
    this.q = q;
    this.sortBy = sortBy;
    this.sortDirection = sortDirection;
    this.count = count;
    this.offset = offset;
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
    queryParams.put("q", this.q == null ? null : Arrays.asList(this.q));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put(
        "sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.count == null) {
      return false;
    }
    if (this.offset == null) {
      return false;
    }
    return true;
  }

  public ListImagesOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final ListImagesOpResponse response = new ListImagesOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsListImageResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsListImageResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsListImageResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("q", "None");
    result.put("sortBy", "None");
    result.put("sortDirection", "None");
    result.put("count", "None");
    result.put("offset", "None");
    return result;
  }

  public enum SortBy {
    CreatedAt("createdAt"),
    UpdatedAt("updatedAt"),
    Version("version");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SortDirection {
    Asc("asc"),
    Desc("desc");

    private String value;

    SortDirection(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ListImagesBuilder {
    private String sortBy;
    private String sortDirection;

    public ListImagesBuilder sortBy(final String sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public ListImagesBuilder sortByFromEnum(final SortBy sortBy) {
      this.sortBy = sortBy.toString();
      return this;
    }

    public ListImagesBuilder sortDirection(final String sortDirection) {
      this.sortDirection = sortDirection;
      return this;
    }

    public ListImagesBuilder sortDirectionFromEnum(final SortDirection sortDirection) {
      this.sortDirection = sortDirection.toString();
      return this;
    }
  }
}

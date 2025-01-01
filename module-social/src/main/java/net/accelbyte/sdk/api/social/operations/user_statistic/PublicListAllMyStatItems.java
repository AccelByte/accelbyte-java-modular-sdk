/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operation_responses.user_statistic.PublicListAllMyStatItemsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicListAllMyStatItems
 *
 * <p>Public list all statItems of user. NOTE: * If stat code does not exist, will ignore this stat
 * code. * If stat item does not exist, will return default value Other detail info: * Returns :
 * stat items
 */
@Getter
@Setter
public class PublicListAllMyStatItems extends Operation {
  /** generated field's value */
  private String path = "/social/v1/public/namespaces/{namespace}/users/me/statitems/value/bulk";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String additionalKey;
  private List<String> statCodes;
  private List<String> tags;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicListAllMyStatItems(
      String customBasePath,
      String namespace,
      String additionalKey,
      List<String> statCodes,
      List<String> tags) {
    this.namespace = namespace;
    this.additionalKey = additionalKey;
    this.statCodes = statCodes;
    this.tags = tags;
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
        "additionalKey", this.additionalKey == null ? null : Arrays.asList(this.additionalKey));
    queryParams.put(
        "statCodes",
        this.statCodes == null
            ? null
            : this.statCodes.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    queryParams.put(
        "tags",
        this.tags == null
            ? null
            : this.tags.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PublicListAllMyStatItemsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicListAllMyStatItemsOpResponse response = new PublicListAllMyStatItemsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(
          new ObjectMapper()
              .readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {}));
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ErrorEntity().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ErrorEntity().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ValidationErrorEntity().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    }

    return response;
  }

  /*
  public List<ADTOObjectForUserStatItemValue> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {});
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("additionalKey", "None");
    result.put("statCodes", "multi");
    result.put("tags", "multi");
    return result;
  }
}

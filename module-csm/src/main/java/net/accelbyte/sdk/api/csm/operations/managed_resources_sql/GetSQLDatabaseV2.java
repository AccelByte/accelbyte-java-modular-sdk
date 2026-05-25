/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.managed_resources_sql;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operation_responses.managed_resources_sql.GetSQLDatabaseV2OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetSQLDatabaseV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:SQL:DATABASES [READ]`
 *
 * <p>Get a SQL database information returns the SQL database related information by given game
 * namespace and app name.
 *
 * <p>`resourceStatus` field - indicates the SQL cluster status: - `starting` : The cluster is
 * transitioning from stopped to running, or is rebooting. - `available` : The cluster is
 * accessible. - `updating` : The cluster is being modified and is not yet accessible (e.g.,
 * updating min/max ACU). - `creating` : The cluster or instance is being created and is not yet
 * accessible. - `maintenance` : The cluster is undergoing maintenance operations and is not
 * accessible. - `unknown` : The cluster status is not recognized - `configuring-replica` : The
 * cluster is configuring replica instances for multi-AZ deployment. - `deleting` : The cluster is
 * in the process of being deleted and is not accessible. - `failed` : The cluster failed to
 * provision or is in an error state and not accessible. - `stopping` : The cluster is in the
 * process of stopping and will soon become inaccessible. - `stopped` : The cluster is stopped and
 * not accessible.
 */
@Getter
@Setter
public class GetSQLDatabaseV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/apps/{app}/sql/databases";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;

  /**
   * @param app required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSQLDatabaseV2(String customBasePath, String app, String namespace) {
    this.app = app;
    this.namespace = namespace;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.app != null) {
      pathParams.put("app", this.app);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.app == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public GetSQLDatabaseV2OpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final GetSQLDatabaseV2OpResponse response = new GetSQLDatabaseV2OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApimodelSQLDatabaseResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ApimodelSQLDatabaseResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApimodelSQLDatabaseResponse().createFromJson(json);
  }
  */

}

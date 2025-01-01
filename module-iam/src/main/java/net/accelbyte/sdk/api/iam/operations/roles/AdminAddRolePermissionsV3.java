/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.roles.AdminAddRolePermissionsV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminAddRolePermissionsV3
 *
 * <p>This endpoint will ATTACH permission(s) into the role action code: 10404 Schedule contains
 * cron string or date range (both are UTC, also in cron syntax) to indicate when a permission and
 * action are in effect. Both schedule types accepts quartz compatible cron syntax e.g. * * * * * *
 * *. In ranged schedule, first element will be start date, and second one will be end date If
 * schedule is set, the scheduled action must be valid too, that is between 1 to 15, inclusive
 * Syntax reference Fields: 1. Seconds: 0-59 * / , - 1. Minutes: 0-59 * / , - 1. Hours: 0-23 * / , -
 * 1. Day of month: 1-31 * / , - L W 1. Month: 1-12 JAN-DEC * / , - 1. Day of week: 0-6 SUN-SAT * /
 * , - L # 1. Year: 1970-2099 * / , -
 *
 * <p>Special characters: 1. *: all values in the fields, e.g. * in seconds fields indicates every
 * second 1. /: increments of ranges, e.g. 3-59/15 in the minute field indicate the third minute of
 * the hour and every 15 minutes thereafter 1. ,: separate items of a list, e.g. MON,WED,FRI in day
 * of week 1. -: range, e.g. 2010-2018 indicates every year between 2010 and 2018, inclusive 1. L:
 * last, e.g. When used in the day-of-week field, it allows you to specify constructs such as "the
 * last Friday" (5L) of a given month. In the day-of-month field, it specifies the last day of the
 * month. 1. W: business day, e.g. if you were to specify 15W as the value for the day-of-month
 * field, the meaning is: "the nearest business day to the 15th of the month." 1. #: must be
 * followed by a number between one and five. It allows you to specify constructs such as "the
 * second Friday" of a given month.
 */
@Getter
@Setter
public class AdminAddRolePermissionsV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/roles/{roleId}/permissions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String roleId;

  private AccountcommonPermissionsV3 body;

  /**
   * @param roleId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminAddRolePermissionsV3(
      String customBasePath, String roleId, AccountcommonPermissionsV3 body) {
    this.roleId = roleId;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.roleId != null) {
      pathParams.put("roleId", this.roleId);
    }
    return pathParams;
  }

  @Override
  public AccountcommonPermissionsV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.roleId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminAddRolePermissionsV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminAddRolePermissionsV3OpResponse response = new AdminAddRolePermissionsV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 204){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}

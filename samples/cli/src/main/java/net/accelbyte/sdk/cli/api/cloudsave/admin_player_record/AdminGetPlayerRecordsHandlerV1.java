/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.cloudsave.admin_player_record;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.wrappers.AdminPlayerRecord;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "adminGetPlayerRecordsHandlerV1", mixinStandardHelpOptions = true)
public class AdminGetPlayerRecordsHandlerV1 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminGetPlayerRecordsHandlerV1.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminGetPlayerRecordsHandlerV1()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public Integer call() {
    try {
      final OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      final AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      final AdminPlayerRecord wrapper = new AdminPlayerRecord(sdk);
      final net.accelbyte.sdk.api.cloudsave.operations.admin_player_record
              .AdminGetPlayerRecordsHandlerV1
          operation =
              net.accelbyte.sdk.api.cloudsave.operations.admin_player_record
                  .AdminGetPlayerRecordsHandlerV1.builder()
                  .namespace(namespace)
                  .userId(userId)
                  .body(new ObjectMapper().readValue(body, ModelsBulkGetPlayerRecordsRequest.class))
                  .build();
      final ModelsBulkGetAdminPlayerRecordResponse response =
          wrapper.adminGetPlayerRecordsHandlerV1(operation).ensureSuccess();
      final String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful\n{}", responseString);
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}

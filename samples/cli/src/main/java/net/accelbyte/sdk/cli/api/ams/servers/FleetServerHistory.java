/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ams.servers;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.wrappers.Servers;
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

@Command(name = "fleetServerHistory", mixinStandardHelpOptions = true)
public class FleetServerHistory implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(FleetServerHistory.class);

  @Option(
      names = {"--fleetID"},
      description = "fleetID")
  String fleetID;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--count"},
      description = "count")
  Integer count;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--reason"},
      description = "reason")
  String reason;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--serverId"},
      description = "serverId")
  String serverId;

  @Option(
      names = {"--sortDirection"},
      description = "sortDirection")
  String sortDirection;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new FleetServerHistory()).execute(args);
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
      final Servers wrapper = new Servers(sdk);
      final net.accelbyte.sdk.api.ams.operations.servers.FleetServerHistory operation =
          net.accelbyte.sdk.api.ams.operations.servers.FleetServerHistory.builder()
              .fleetID(fleetID)
              .namespace(namespace)
              .count(count)
              .offset(offset)
              .reason(reason)
              .region(region)
              .serverId(serverId)
              .sortDirection(sortDirection)
              .status(status)
              .build();
      final ApiDSHistoryList response = wrapper.fleetServerHistory(operation).ensureSuccess();
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

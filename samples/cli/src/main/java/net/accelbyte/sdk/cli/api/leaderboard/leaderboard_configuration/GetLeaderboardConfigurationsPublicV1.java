/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
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

@Command(name = "getLeaderboardConfigurationsPublicV1", mixinStandardHelpOptions = true)
public class GetLeaderboardConfigurationsPublicV1 implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(GetLeaderboardConfigurationsPublicV1.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--isArchived"},
      description = "isArchived")
  Boolean isArchived;

  @Option(
      names = {"--isDeleted"},
      description = "isDeleted")
  Boolean isDeleted;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new GetLeaderboardConfigurationsPublicV1()).execute(args);
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
      final LeaderboardConfiguration wrapper = new LeaderboardConfiguration(sdk);
      final net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration
              .GetLeaderboardConfigurationsPublicV1
          operation =
              net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration
                  .GetLeaderboardConfigurationsPublicV1.builder()
                  .namespace(namespace)
                  .isArchived(isArchived)
                  .isDeleted(isDeleted)
                  .limit(limit)
                  .offset(offset)
                  .build();
      final ModelsGetAllLeaderboardConfigsPublicResp response =
          wrapper.getLeaderboardConfigurationsPublicV1(operation).ensureSuccess();
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

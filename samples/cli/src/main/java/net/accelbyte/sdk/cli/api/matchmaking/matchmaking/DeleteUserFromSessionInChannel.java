/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "deleteUserFromSessionInChannel", mixinStandardHelpOptions = true)
public class DeleteUserFromSessionInChannel implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteUserFromSessionInChannel.class);

  @Option(
      names = {"--channelName"},
      description = "channelName")
  String channelName;

  @Option(
      names = {"--matchID"},
      description = "matchID")
  String matchID;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userID"},
      description = "userID")
  String userID;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteUserFromSessionInChannel()).execute(args);
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
      final Matchmaking wrapper = new Matchmaking(sdk);
      final net.accelbyte.sdk.api.matchmaking.operations.matchmaking.DeleteUserFromSessionInChannel
          operation =
              net.accelbyte.sdk.api.matchmaking.operations.matchmaking
                  .DeleteUserFromSessionInChannel.builder()
                  .channelName(channelName)
                  .matchID(matchID)
                  .namespace(namespace)
                  .userID(userID)
                  .build();
      wrapper.deleteUserFromSessionInChannel(operation).ensureSuccess();
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}

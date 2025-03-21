/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.dsartifact.terminated_servers;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.api.dsartifact.wrappers.TerminatedServers;
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

@Command(name = "listTerminatedServersWithNamespace", mixinStandardHelpOptions = true)
public class ListTerminatedServersWithNamespace implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ListTerminatedServersWithNamespace.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--deployment"},
      description = "deployment")
  String deployment;

  @Option(
      names = {"--gameMode"},
      description = "gameMode")
  String gameMode;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--next"},
      description = "next")
  String next;

  @Option(
      names = {"--partyId"},
      description = "partyId")
  String partyId;

  @Option(
      names = {"--podName"},
      description = "podName")
  String podName;

  @Option(
      names = {"--previous"},
      description = "previous")
  String previous;

  @Option(
      names = {"--provider"},
      description = "provider")
  String provider;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--sessionId"},
      description = "sessionId")
  String sessionId;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ListTerminatedServersWithNamespace()).execute(args);
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
      final TerminatedServers wrapper = new TerminatedServers(sdk);
      final net.accelbyte.sdk.api.dsartifact.operations.terminated_servers
              .ListTerminatedServersWithNamespace
          operation =
              net.accelbyte.sdk.api.dsartifact.operations.terminated_servers
                  .ListTerminatedServersWithNamespace.builder()
                  .namespace(namespace)
                  .deployment(deployment)
                  .gameMode(gameMode)
                  .limit(limit)
                  .next(next)
                  .partyId(partyId)
                  .podName(podName)
                  .previous(previous)
                  .provider(provider)
                  .region(region)
                  .sessionId(sessionId)
                  .userId(userId)
                  .build();
      final ModelsListTerminatedServersResponse response =
          wrapper.listTerminatedServersWithNamespace(operation).ensureSuccess();
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

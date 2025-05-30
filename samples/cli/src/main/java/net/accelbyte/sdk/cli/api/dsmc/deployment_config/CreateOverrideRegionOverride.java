/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.dsmc.deployment_config;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.DeploymentConfig;
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

@Command(name = "createOverrideRegionOverride", mixinStandardHelpOptions = true)
public class CreateOverrideRegionOverride implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(CreateOverrideRegionOverride.class);

  @Option(
      names = {"--deployment"},
      description = "deployment")
  String deployment;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--version"},
      description = "version")
  String version;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new CreateOverrideRegionOverride()).execute(args);
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
      final DeploymentConfig wrapper = new DeploymentConfig(sdk);
      final net.accelbyte.sdk.api.dsmc.operations.deployment_config.CreateOverrideRegionOverride
          operation =
              net.accelbyte.sdk.api.dsmc.operations.deployment_config.CreateOverrideRegionOverride
                  .builder()
                  .deployment(deployment)
                  .namespace(namespace)
                  .region(region)
                  .version(version)
                  .body(new ObjectMapper().readValue(body, ModelsCreateRegionOverrideRequest.class))
                  .build();
      final ModelsDeploymentWithOverride response =
          wrapper.createOverrideRegionOverride(operation).ensureSuccess();
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

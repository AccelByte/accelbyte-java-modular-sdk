/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.achievement.global_achievements;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.wrappers.GlobalAchievements;
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

@Command(name = "resetGlobalAchievement", mixinStandardHelpOptions = true)
public class ResetGlobalAchievement implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ResetGlobalAchievement.class);

  @Option(
      names = {"--achievementCode"},
      description = "achievementCode")
  String achievementCode;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ResetGlobalAchievement()).execute(args);
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
      final GlobalAchievements wrapper = new GlobalAchievements(sdk);
      final net.accelbyte.sdk.api.achievement.operations.global_achievements.ResetGlobalAchievement
          operation =
              net.accelbyte.sdk.api.achievement.operations.global_achievements
                  .ResetGlobalAchievement.builder()
                  .achievementCode(achievementCode)
                  .namespace(namespace)
                  .build();
      wrapper.resetGlobalAchievement(operation).ensureSuccess();
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

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ugc.public_content_v2;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContentV2;
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

@Command(name = "deleteContentScreenshotV2", mixinStandardHelpOptions = true)
public class DeleteContentScreenshotV2 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteContentScreenshotV2.class);

  @Option(
      names = {"--contentId"},
      description = "contentId")
  String contentId;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--screenshotId"},
      description = "screenshotId")
  String screenshotId;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteContentScreenshotV2()).execute(args);
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
      final PublicContentV2 wrapper = new PublicContentV2(sdk);
      final net.accelbyte.sdk.api.ugc.operations.public_content_v2.DeleteContentScreenshotV2
          operation =
              net.accelbyte.sdk.api.ugc.operations.public_content_v2.DeleteContentScreenshotV2
                  .builder()
                  .contentId(contentId)
                  .namespace(namespace)
                  .screenshotId(screenshotId)
                  .userId(userId)
                  .build();
      wrapper.deleteContentScreenshotV2(operation).ensureSuccess();
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

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
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

@Command(name = "publicExistsAnyMyActiveEntitlement", mixinStandardHelpOptions = true)
public class PublicExistsAnyMyActiveEntitlement implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicExistsAnyMyActiveEntitlement.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--appIds"},
      description = "appIds",
      split = ",")
  List<String> appIds;

  @Option(
      names = {"--itemIds"},
      description = "itemIds",
      split = ",")
  List<String> itemIds;

  @Option(
      names = {"--skus"},
      description = "skus",
      split = ",")
  List<String> skus;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicExistsAnyMyActiveEntitlement()).execute(args);
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
      final Entitlement wrapper = new Entitlement(sdk);
      final net.accelbyte.sdk.api.platform.operations.entitlement.PublicExistsAnyMyActiveEntitlement
          operation =
              net.accelbyte.sdk.api.platform.operations.entitlement
                  .PublicExistsAnyMyActiveEntitlement.builder()
                  .namespace(namespace)
                  .appIds(appIds)
                  .itemIds(itemIds)
                  .skus(skus)
                  .build();
      final Ownership response =
          wrapper.publicExistsAnyMyActiveEntitlement(operation).ensureSuccess();
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

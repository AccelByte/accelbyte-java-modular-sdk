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

@Command(name = "publicQueryUserEntitlements", mixinStandardHelpOptions = true)
public class PublicQueryUserEntitlements implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicQueryUserEntitlements.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--appType"},
      description = "appType")
  String appType;

  @Option(
      names = {"--entitlementClazz"},
      description = "entitlementClazz")
  String entitlementClazz;

  @Option(
      names = {"--entitlementName"},
      description = "entitlementName")
  String entitlementName;

  @Option(
      names = {"--features"},
      description = "features",
      split = ",")
  List<String> features;

  @Option(
      names = {"--itemId"},
      description = "itemId",
      split = ",")
  List<String> itemId;

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
    int exitCode = new CommandLine(new PublicQueryUserEntitlements()).execute(args);
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
      final net.accelbyte.sdk.api.platform.operations.entitlement.PublicQueryUserEntitlements
          operation =
              net.accelbyte.sdk.api.platform.operations.entitlement.PublicQueryUserEntitlements
                  .builder()
                  .namespace(namespace)
                  .userId(userId)
                  .appType(appType)
                  .entitlementClazz(entitlementClazz)
                  .entitlementName(entitlementName)
                  .features(features)
                  .itemId(itemId)
                  .limit(limit)
                  .offset(offset)
                  .build();
      final EntitlementPagingSlicedResult response =
          wrapper.publicQueryUserEntitlements(operation).ensureSuccess();
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

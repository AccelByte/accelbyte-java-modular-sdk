/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "queryItemsV2", mixinStandardHelpOptions = true)
public class QueryItemsV2 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryItemsV2.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--appType"},
      description = "appType")
  String appType;

  @Option(
      names = {"--availableDate"},
      description = "availableDate")
  String availableDate;

  @Option(
      names = {"--baseAppId"},
      description = "baseAppId")
  String baseAppId;

  @Option(
      names = {"--categoryPath"},
      description = "categoryPath")
  String categoryPath;

  @Option(
      names = {"--features"},
      description = "features")
  String features;

  @Option(
      names = {"--includeSubCategoryItem"},
      description = "includeSubCategoryItem")
  Boolean includeSubCategoryItem;

  @Option(
      names = {"--itemName"},
      description = "itemName")
  String itemName;

  @Option(
      names = {"--itemStatus"},
      description = "itemStatus")
  String itemStatus;

  @Option(
      names = {"--itemType"},
      description = "itemType",
      split = ",")
  List<String> itemType;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--sectionExclusive"},
      description = "sectionExclusive")
  Boolean sectionExclusive;

  @Option(
      names = {"--sortBy"},
      description = "sortBy",
      split = ",")
  List<String> sortBy;

  @Option(
      names = {"--storeId"},
      description = "storeId")
  String storeId;

  @Option(
      names = {"--tags"},
      description = "tags")
  String tags;

  @Option(
      names = {"--targetNamespace"},
      description = "targetNamespace")
  String targetNamespace;

  @Option(
      names = {"--withTotal"},
      description = "withTotal")
  Boolean withTotal;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryItemsV2()).execute(args);
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
      final Item wrapper = new Item(sdk);
      final net.accelbyte.sdk.api.platform.operations.item.QueryItemsV2 operation =
          net.accelbyte.sdk.api.platform.operations.item.QueryItemsV2.builder()
              .namespace(namespace)
              .appType(appType)
              .availableDate(availableDate)
              .baseAppId(baseAppId)
              .categoryPath(categoryPath)
              .features(features)
              .includeSubCategoryItem(includeSubCategoryItem)
              .itemName(itemName)
              .itemStatus(itemStatus)
              .itemType(itemType)
              .limit(limit)
              .offset(offset)
              .region(region)
              .sectionExclusive(sectionExclusive)
              .sortBy(sortBy)
              .storeId(storeId)
              .tags(tags)
              .targetNamespace(targetNamespace)
              .withTotal(withTotal)
              .build();
      final FullItemPagingResult response = wrapper.queryItemsV2(operation).ensureSuccess();
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

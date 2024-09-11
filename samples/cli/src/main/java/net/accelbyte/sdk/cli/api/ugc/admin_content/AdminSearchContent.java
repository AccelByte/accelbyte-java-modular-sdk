/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ugc.admin_content;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminContent;
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

@Command(name = "adminSearchContent", mixinStandardHelpOptions = true)
public class AdminSearchContent implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminSearchContent.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--creator"},
      description = "creator")
  String creator;

  @Option(
      names = {"--ishidden"},
      description = "ishidden")
  String ishidden;

  @Option(
      names = {"--isofficial"},
      description = "isofficial")
  String isofficial;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--name"},
      description = "name")
  String name;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--orderby"},
      description = "orderby")
  String orderby;

  @Option(
      names = {"--sortby"},
      description = "sortby")
  String sortby;

  @Option(
      names = {"--subtype"},
      description = "subtype")
  String subtype;

  @Option(
      names = {"--tags"},
      description = "tags",
      split = ",")
  List<String> tags;

  @Option(
      names = {"--type"},
      description = "type")
  String type;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminSearchContent()).execute(args);
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
      final AdminContent wrapper = new AdminContent(sdk);
      final net.accelbyte.sdk.api.ugc.operations.admin_content.AdminSearchContent operation =
          net.accelbyte.sdk.api.ugc.operations.admin_content.AdminSearchContent.builder()
              .namespace(namespace)
              .creator(creator)
              .ishidden(ishidden)
              .isofficial(isofficial)
              .limit(limit)
              .name(name)
              .offset(offset)
              .orderby(orderby)
              .sortby(sortby)
              .subtype(subtype)
              .tags(tags)
              .type(type)
              .userId(userId)
              .build();
      final ModelsPaginatedContentDownloadResponse response = wrapper.adminSearchContent(operation);
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

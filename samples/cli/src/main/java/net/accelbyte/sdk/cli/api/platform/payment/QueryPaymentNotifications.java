/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.payment;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Payment;
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

@Command(name = "queryPaymentNotifications", mixinStandardHelpOptions = true)
public class QueryPaymentNotifications implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryPaymentNotifications.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--externalId"},
      description = "externalId")
  String externalId;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--notificationSource"},
      description = "notificationSource")
  String notificationSource;

  @Option(
      names = {"--notificationType"},
      description = "notificationType")
  String notificationType;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--paymentOrderNo"},
      description = "paymentOrderNo")
  String paymentOrderNo;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryPaymentNotifications()).execute(args);
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
      final Payment wrapper = new Payment(sdk);
      final net.accelbyte.sdk.api.platform.operations.payment.QueryPaymentNotifications operation =
          net.accelbyte.sdk.api.platform.operations.payment.QueryPaymentNotifications.builder()
              .namespace(namespace)
              .endDate(endDate)
              .externalId(externalId)
              .limit(limit)
              .notificationSource(notificationSource)
              .notificationType(notificationType)
              .offset(offset)
              .paymentOrderNo(paymentOrderNo)
              .startDate(startDate)
              .status(status)
              .build();
      final PaymentNotificationPagingSlicedResult response =
          wrapper.queryPaymentNotifications(operation).ensureSuccess();
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

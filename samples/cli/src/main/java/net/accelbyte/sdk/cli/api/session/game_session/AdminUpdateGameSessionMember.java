/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.session.game_session;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.wrappers.GameSession;
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

@Command(name = "adminUpdateGameSessionMember", mixinStandardHelpOptions = true)
public class AdminUpdateGameSessionMember implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminUpdateGameSessionMember.class);

  @Option(
      names = {"--memberId"},
      description = "memberId")
  String memberId;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--sessionId"},
      description = "sessionId")
  String sessionId;

  @Option(
      names = {"--statusType"},
      description = "statusType")
  String statusType;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminUpdateGameSessionMember()).execute(args);
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
      final GameSession wrapper = new GameSession(sdk);
      final net.accelbyte.sdk.api.session.operations.game_session.AdminUpdateGameSessionMember
          operation =
              net.accelbyte.sdk.api.session.operations.game_session.AdminUpdateGameSessionMember
                  .builder()
                  .memberId(memberId)
                  .namespace(namespace)
                  .sessionId(sessionId)
                  .statusType(statusType)
                  .build();
      final ApimodelsUpdateGameSessionMemberStatusResponse response =
          wrapper.adminUpdateGameSessionMember(operation).ensureSuccess();
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

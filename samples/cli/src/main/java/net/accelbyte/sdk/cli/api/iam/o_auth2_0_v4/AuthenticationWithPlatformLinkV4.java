/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0_v4;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20V4;
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

@Command(name = "authenticationWithPlatformLinkV4", mixinStandardHelpOptions = true)
public class AuthenticationWithPlatformLinkV4 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AuthenticationWithPlatformLinkV4.class);

  @Option(
      names = {"--extendExp"},
      description = "extendExp")
  Boolean extendExp;

  @Option(
      names = {"--clientId"},
      description = "clientId")
  String clientId;

  @Option(
      names = {"--linkingToken"},
      description = "linkingToken")
  String linkingToken;

  @Option(
      names = {"--password"},
      description = "password")
  String password;

  @Option(
      names = {"--username"},
      description = "username")
  String username;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AuthenticationWithPlatformLinkV4()).execute(args);
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
      final OAuth20V4 wrapper = new OAuth20V4(sdk);
      final net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.AuthenticationWithPlatformLinkV4
          operation =
              net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.AuthenticationWithPlatformLinkV4
                  .builder()
                  .extendExp(extendExp != null ? extendExp : null)
                  .clientId(clientId != null ? clientId : null)
                  .linkingToken(linkingToken != null ? linkingToken : null)
                  .password(password != null ? password : null)
                  .username(username != null ? username : null)
                  .build();
      final OauthmodelTokenResponseV3 response =
          wrapper.authenticationWithPlatformLinkV4(operation).ensureSuccess();
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

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "verify2faCode", mixinStandardHelpOptions = true)
public class Verify2faCode implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(Verify2faCode.class);

  @Option(
      names = {"--code"},
      description = "code")
  String code;

  @Option(
      names = {"--factor"},
      description = "factor")
  String factor;

  @Option(
      names = {"--mfaToken"},
      description = "mfaToken")
  String mfaToken;

  @Option(
      names = {"--rememberDevice"},
      description = "rememberDevice")
  Boolean rememberDevice;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new Verify2faCode()).execute(args);
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
      final OAuth20 wrapper = new OAuth20(sdk);
      final net.accelbyte.sdk.api.iam.operations.o_auth2_0.Verify2faCode operation =
          net.accelbyte.sdk.api.iam.operations.o_auth2_0.Verify2faCode.builder()
              .code(code != null ? code : null)
              .factor(factor != null ? factor : null)
              .mfaToken(mfaToken != null ? mfaToken : null)
              .rememberDevice(rememberDevice != null ? rememberDevice : null)
              .build();
      final OauthmodelTokenResponseV3 response = wrapper.verify2faCode(operation).ensureSuccess();
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

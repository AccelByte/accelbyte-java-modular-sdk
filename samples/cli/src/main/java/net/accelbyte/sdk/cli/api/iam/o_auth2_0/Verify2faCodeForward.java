/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "verify2faCodeForward", mixinStandardHelpOptions = true)
public class Verify2faCodeForward implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(Verify2faCodeForward.class);

    @Option(names = {"--defaultFactor"}, description = "defaultFactor")
    String defaultFactor;

    @Option(names = {"--factors"}, description = "factors")
    String factors;

    @Option(names = {"--rememberDevice"}, description = "rememberDevice")
    Boolean rememberDevice;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--code"}, description = "code")
    String code;

    @Option(names = {"--factor"}, description = "factor")
    String factor;

    @Option(names = {"--mfaToken"}, description = "mfaToken")
    String mfaToken;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new Verify2faCodeForward()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            final OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            final AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            final OAuth20 wrapper = new OAuth20(sdk);
            final net.accelbyte.sdk.api.iam.operations.o_auth2_0.Verify2faCodeForward operation =
                    net.accelbyte.sdk.api.iam.operations.o_auth2_0.Verify2faCodeForward.builder()
                            .defaultFactor(defaultFactor != null ? defaultFactor : null)
                            .factors(factors != null ? factors : null)
                            .rememberDevice(rememberDevice != null ? rememberDevice : null)
                            .clientId(clientId != null ? clientId : null)
                            .code(code != null ? code : null)
                            .factor(factor != null ? factor : null)
                            .mfaToken(mfaToken != null ? mfaToken : null)
                            .build();
                    wrapper.verify2faCodeForward(operation).ensureSuccess();
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
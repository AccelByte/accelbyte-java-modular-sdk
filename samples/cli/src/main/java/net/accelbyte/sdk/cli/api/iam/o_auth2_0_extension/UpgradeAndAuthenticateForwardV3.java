/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0_extension;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
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

@Command(name = "upgradeAndAuthenticateForwardV3", mixinStandardHelpOptions = true)
public class UpgradeAndAuthenticateForwardV3 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(UpgradeAndAuthenticateForwardV3.class);

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--upgradeSuccessToken"}, description = "upgradeSuccessToken")
    String upgradeSuccessToken;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new UpgradeAndAuthenticateForwardV3()).execute(args);
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
            final OAuth20Extension wrapper = new OAuth20Extension(sdk);
            final net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UpgradeAndAuthenticateForwardV3 operation =
                    net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UpgradeAndAuthenticateForwardV3.builder()
                            .clientId(clientId != null ? clientId : null)
                            .upgradeSuccessToken(upgradeSuccessToken != null ? upgradeSuccessToken : null)
                            .build();
                    wrapper.upgradeAndAuthenticateForwardV3(operation).ensureSuccess();
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
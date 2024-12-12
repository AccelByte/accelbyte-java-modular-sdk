/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.session.configuration_template;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.wrappers.ConfigurationTemplate;
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

@Command(name = "adminGetConfigurationTemplateV1", mixinStandardHelpOptions = true)
public class AdminGetConfigurationTemplateV1 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminGetConfigurationTemplateV1.class);

    @Option(names = {"--name"}, description = "name")
    String name;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AdminGetConfigurationTemplateV1()).execute(args);
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
            final ConfigurationTemplate wrapper = new ConfigurationTemplate(sdk);
            final net.accelbyte.sdk.api.session.operations.configuration_template.AdminGetConfigurationTemplateV1 operation =
                    net.accelbyte.sdk.api.session.operations.configuration_template.AdminGetConfigurationTemplateV1.builder()
                            .name(name)
                            .namespace(namespace)
                            .build();
            final ApimodelsConfigurationTemplateResponse response =
                    wrapper.adminGetConfigurationTemplateV1(operation).ensureSuccess();
            final String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
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
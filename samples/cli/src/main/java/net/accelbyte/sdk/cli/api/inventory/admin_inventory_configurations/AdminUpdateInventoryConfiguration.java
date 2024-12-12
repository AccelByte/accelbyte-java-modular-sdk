/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.inventory.admin_inventory_configurations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.wrappers.AdminInventoryConfigurations;
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

@Command(name = "adminUpdateInventoryConfiguration", mixinStandardHelpOptions = true)
public class AdminUpdateInventoryConfiguration implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminUpdateInventoryConfiguration.class);

    @Option(names = {"--inventoryConfigurationId"}, description = "inventoryConfigurationId")
    String inventoryConfigurationId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AdminUpdateInventoryConfiguration()).execute(args);
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
            final AdminInventoryConfigurations wrapper = new AdminInventoryConfigurations(sdk);
            final net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations.AdminUpdateInventoryConfiguration operation =
                    net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations.AdminUpdateInventoryConfiguration.builder()
                            .inventoryConfigurationId(inventoryConfigurationId)
                            .namespace(namespace)
                            .body(new ObjectMapper().readValue(body, ApimodelsInventoryConfigurationReq.class)) 
                            .build();
            final ApimodelsInventoryConfigurationResp response =
                    wrapper.adminUpdateInventoryConfiguration(operation).ensureSuccess();
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
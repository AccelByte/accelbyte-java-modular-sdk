/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ugc.public_content_v2;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContentV2;
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

@Command(name = "publicDeleteContentByShareCodeV2", mixinStandardHelpOptions = true)
public class PublicDeleteContentByShareCodeV2 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicDeleteContentByShareCodeV2.class);

    @Option(names = {"--channelId"}, description = "channelId")
    String channelId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--shareCode"}, description = "shareCode")
    String shareCode;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicDeleteContentByShareCodeV2()).execute(args);
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
            final PublicContentV2 wrapper = new PublicContentV2(sdk);
            final net.accelbyte.sdk.api.ugc.operations.public_content_v2.PublicDeleteContentByShareCodeV2 operation =
                    net.accelbyte.sdk.api.ugc.operations.public_content_v2.PublicDeleteContentByShareCodeV2.builder()
                            .channelId(channelId)
                            .namespace(namespace)
                            .shareCode(shareCode)
                            .userId(userId)
                            .build();
                    wrapper.publicDeleteContentByShareCodeV2(operation).ensureSuccess();
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
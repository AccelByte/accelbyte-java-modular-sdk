/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import com.google.common.cache.CacheBuilder;
import java.util.List;
import net.accelbyte.sdk.api.basic.models.NamespaceContext;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload.Types.Permission;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

public class StaticTestTokenValidator extends AccelByteSDK {

  public static final String PUBLISHER_NAMESPACE = "accelbyte";
  public static final String STUDIO_NAMESPACE = "accelbyte-studio";
  public static final String GAME_NAMESPACE = "accelbyte-studio-game";

  public StaticTestTokenValidator() {
    super(buildConfig(), buildNamespaceContextCache());
  }

  private static AccelByteConfig buildConfig() {
    DefaultConfigRepository configRepo =
        new DefaultConfigRepository() {
          @Override
          public String getNamespace() {
            return PUBLISHER_NAMESPACE;
          }
        };
    return new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo);
  }

  private static com.google.common.cache.Cache<String, NamespaceContext>
      buildNamespaceContextCache() {
    com.google.common.cache.Cache<String, NamespaceContext> cache =
        CacheBuilder.newBuilder().build();
    cache.put(
        GAME_NAMESPACE,
        NamespaceContext.builder()
            .namespace(GAME_NAMESPACE)
            .publisherNamespace(PUBLISHER_NAMESPACE)
            .studioNamespace(STUDIO_NAMESPACE)
            .type("Game")
            .build());
    return cache;
  }

  public boolean testValidateResource(
      List<Permission> permissions, String resource, int action) {
    return validatePermission(permissions, resource, action);
  }
}

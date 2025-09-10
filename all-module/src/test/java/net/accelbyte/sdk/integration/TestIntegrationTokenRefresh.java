/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GetCountryLocationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.repository.OnDemandTokenRefreshOptions;
import net.accelbyte.sdk.core.repository.OnDemandTokenRefreshRepository;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationTokenRefresh extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Test
  @Order(1)
  public void testUser() throws Exception {
    OnDemandTokenRefreshOptions refreshOpts = OnDemandTokenRefreshOptions.getDefault();
    refreshOpts.setRate(0.0005f);
    final OnDemandTokenRefreshRepository refreshRepo = new OnDemandTokenRefreshRepository(refreshOpts);

    final AccelByteConfig sdkConfig = AccelByteConfig.getDefault()
      .setTokenRefresh(refreshRepo);
    final AccelByteSDK sdk = new AccelByteSDK(sdkConfig);

    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginUser(this.username, this.password);

    assertTrue(refreshRepo.getToken() != null && !"".equals(refreshRepo.getToken()));
    assertTrue(refreshRepo.getRefreshToken() != null && !"".equals(refreshRepo.getRefreshToken()));

    final int expirationDuration = 10; // in seconds
    Thread.sleep(expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    assertTrue(refreshRepo.getToken() != null && !"".equals(refreshRepo.getToken()));
    assertTrue(refreshRepo.getRefreshToken() != null && !"".equals(refreshRepo.getRefreshToken()));
  }

  @Test
  @Order(1)
  public void testClient() throws Exception {
    OnDemandTokenRefreshOptions refreshOpts = OnDemandTokenRefreshOptions.getDefault();
    refreshOpts.setRate(0.0005f);
    final OnDemandTokenRefreshRepository refreshRepo = new OnDemandTokenRefreshRepository(refreshOpts);

    final AccelByteConfig sdkConfig = AccelByteConfig.getDefault()
      .setTokenRefresh(refreshRepo);
    final AccelByteSDK sdk = new AccelByteSDK(sdkConfig);

    final OAuth20Extension wrapper = new OAuth20Extension(sdk);

    sdk.loginClient();

    assertTrue(refreshRepo.getToken() != null && !"".equals(refreshRepo.getToken()));
    assertTrue(refreshRepo.getRefreshToken() == null); // Login client does not return refresh token

    final int expirationDuration = 10; // in seconds
    Thread.sleep(expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    wrapper.getCountryLocationV3(GetCountryLocationV3.builder().build());

    assertTrue(refreshRepo.getToken() != null && !"".equals(refreshRepo.getToken()));
    assertTrue(refreshRepo.getRefreshToken() == null); // Login client does not return refresh token
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.lang.reflect.Field;
import java.time.Instant;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import net.accelbyte.sdk.core.repository.TokenRefreshV2;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationLoginOrRefresh extends TestIntegration {

  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshUser() throws Exception {
    final OkhttpClient httpClient = new OkhttpClient();
    final DefaultConfigRepository configRepo = new DefaultConfigRepository();
    final DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, refreshRepo, configRepo);

    forceSetRefreshRatioTestingOnly(sdk, 0.0005f); // ~1.8 second

    final int expirationDuration = 10; // in seconds

    final Instant firstLoginTime = Instant.now();
    final boolean firstLoginOk = sdk.loginOrRefreshUser(username, password);

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Instant firstLoginTokenExpiredTime =
        ((TokenRefreshV2) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();

    assertTrue(
        getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime)
            <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Instant secondLoginTime = Instant.now();
    final boolean secondLoginOk = sdk.loginOrRefreshUser(username, password);

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Instant secondLoginExpiredTime =
        ((TokenRefreshV2) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(
        getTimeDifferenceInSeconds(secondLoginTime, secondLoginExpiredTime) <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload =
        sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginExpiredTime);
  }

  @Order(1)
  @Test
  public void testLoginOrRefreshClient() throws Exception {
    final OkhttpClient httpClient = new OkhttpClient();
    final DefaultConfigRepository configRepo = new DefaultConfigRepository();
    final DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
    final AccelByteSDK sdk = new AccelByteSDK(httpClient, refreshRepo, configRepo);

    forceSetRefreshRatioTestingOnly(sdk, 0.0005f); // ~1.8 second

    final int expirationDuration = 10; // in second

    final Instant firstLoginTime = Instant.now();
    final boolean firstLoginOk = sdk.loginOrRefreshClient();

    assertTrue(firstLoginOk);

    final String firstLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Instant firstLoginTokenExpiredTime =
        ((TokenRefreshV2) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(
        getTimeDifferenceInSeconds(firstLoginTime, firstLoginTokenExpiredTime)
            <= expirationDuration);

    final AccessTokenPayload firstLoginTokenPayload = sdk.parseAccessToken(firstLoginToken, false);

    assertNotNull(firstLoginTokenPayload);
    assertEquals(namespace, firstLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), firstLoginTokenPayload.getClientId());

    Thread.sleep(
        expirationDuration * 1_000); // sleep for 2 second, since expiredAt was set 1.8 second

    final Instant secondLoginTime = Instant.now();
    final boolean secondLoginOk = sdk.loginOrRefreshClient();

    assertTrue(secondLoginOk);

    final String secondLoginToken = sdk.getSdkConfiguration().getTokenRepository().getToken();
    final Instant secondLoginTokenExpiredTime =
        ((TokenRefreshV2) sdk.getSdkConfiguration().getTokenRepository()).getTokenExpiresAt();
    assertTrue(
        getTimeDifferenceInSeconds(secondLoginTime, secondLoginTokenExpiredTime)
            <= expirationDuration);

    final AccessTokenPayload secondLoginTokenPayload =
        sdk.parseAccessToken(secondLoginToken, false);

    assertNotNull(secondLoginTokenPayload);
    assertEquals(namespace, secondLoginTokenPayload.getNamespace());
    assertEquals(configRepo.getClientId(), secondLoginTokenPayload.getClientId());

    assertNotEquals(firstLoginToken, secondLoginToken);
    assertNotEquals(firstLoginTokenExpiredTime, secondLoginTokenExpiredTime);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }

  private void forceSetRefreshRatioTestingOnly(AccelByteSDK sdk, float refreshRatio) {
    Field fieldRefreshRation;
    try {
      fieldRefreshRation = AccelByteSDK.class.getDeclaredField("tokenRefreshRatio");
      fieldRefreshRation.setAccessible(true);
      fieldRefreshRation.setFloat(sdk, refreshRatio);
    } catch (NoSuchFieldException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
  }

  private int getTimeDifferenceInSeconds(Instant date1, Instant date2) {
    return (int) (date1.getEpochSecond() - date2.getEpochSecond());
  }
}

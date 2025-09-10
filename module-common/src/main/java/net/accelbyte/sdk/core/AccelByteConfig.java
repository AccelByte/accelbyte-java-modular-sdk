/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.BaseTokenRefresh;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.FlightIdRepository;
import net.accelbyte.sdk.core.repository.TokenRefreshOptions;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Setter
@Getter
public class AccelByteConfig {
  private HttpClient<?> httpClient;
  private TokenRepository tokenRepository;
  private ConfigRepository configRepository;
  private FlightIdRepository flightIdRepository;
  private TokenRefreshOptions tokenRefreshOptions;

  public static AccelByteConfig getDefault() {
    final OkhttpClient httpClient = new OkhttpClient();
    final DefaultConfigRepository configRepo = new DefaultConfigRepository();
    final DefaultTokenRepository tokenRepo = new DefaultTokenRepository();
    return new AccelByteConfig(httpClient, tokenRepo, configRepo);
  }

  public AccelByteConfig(
    HttpClient<?> httpClient,
    ConfigRepository configRepository
  ) {
    this(httpClient, new DefaultTokenRepository(), configRepository, FlightIdRepository.getInstance());
  }

  public AccelByteConfig(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository) {
    this(httpClient, tokenRepository, configRepository, FlightIdRepository.getInstance());
  }

  public AccelByteConfig(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository,
      FlightIdRepository flightIdRepository) {
    this.httpClient = httpClient;
    this.tokenRepository = tokenRepository;
    this.configRepository = configRepository;
    this.flightIdRepository = flightIdRepository;
  }

  public AccelByteConfig(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository,
      FlightIdRepository flightIdRepository,
      TokenRefreshOptions refreshOpts) {
    this.httpClient = httpClient;
    this.tokenRepository = tokenRepository;
    this.configRepository = configRepository;
    this.flightIdRepository = flightIdRepository;
    this.tokenRefreshOptions = refreshOpts;
  }

  public AccelByteConfig setTokenRefresh(BaseTokenRefresh tokenRefreshRepository) {
    this.tokenRefreshOptions = tokenRefreshRepository.getBaseOptions();
    this.tokenRepository = tokenRefreshRepository;
    return this;
  }

  public AccelByteConfig getClone() {
    return new AccelByteConfig(
      this.getHttpClient(),
      this.getTokenRepository(),
      this.getConfigRepository(),
      this.getFlightIdRepository(),
      this.getTokenRefreshOptions());
  }
}

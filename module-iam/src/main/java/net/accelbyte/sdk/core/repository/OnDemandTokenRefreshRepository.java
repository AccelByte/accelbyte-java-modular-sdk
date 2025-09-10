/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.time.Instant;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenWithDeviceCookieResponseV3;
import net.accelbyte.sdk.core.AccelByteSDK;

public class OnDemandTokenRefreshRepository extends DefaultTokenRepository implements TokenRefreshV3 {

  private String refreshToken = null;
  private TokenRefreshOptions options = null;

  private int tokenExpiresIn = 0;
  private long tokenIssuedTime = 0;
  private int refreshTokenExpiresIn = 0;

  public static OnDemandTokenRefreshRepository createDefault() {
    return new OnDemandTokenRefreshRepository(OnDemandTokenRefreshOptions.getDefault());
  }

  public OnDemandTokenRefreshRepository(TokenRefreshOptions options) {
    this.options = options;
  }

  @Override
  public TokenRefreshOptions getBaseOptions() {
    return this.options;
  }

  @Override
  public Instant getTokenExpiresAt() {
    final long expiresAt = this.tokenIssuedTime + this.tokenExpiresIn;
    return Instant.ofEpochSecond(expiresAt);
  }

  @Override
  public void storeRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
  }

  @Override
  public String getRefreshToken() {
    return this.refreshToken;
  }

  @Override
  public void removeRefreshToken() {
    this.refreshToken = "";
  }

  @Override
  public Instant getRefreshTokenExpiresAt() {
    final long expiresAt = this.tokenIssuedTime + this.refreshTokenExpiresIn;
    return Instant.ofEpochSecond(expiresAt);
  }

  @Override
  public void storeTokenData(OauthmodelTokenWithDeviceCookieResponseV3 token) {    
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    if (token.getRefreshExpiresIn() != null)
      this.refreshTokenExpiresIn = token.getRefreshExpiresIn();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
    
  }

  @Override
  public void storeTokenData(OauthmodelTokenResponse token) {
    this.tokenExpiresIn = token.getExpiresIn();
    this.refreshToken = token.getRefreshToken();
    if (token.getRefreshExpiresIn() != null)
      this.refreshTokenExpiresIn = token.getRefreshExpiresIn();
    this.tokenIssuedTime = Instant.now().getEpochSecond();
  }

  @Override
  public void clearTokenData() {
    this.tokenExpiresIn = 0;    
    this.refreshToken = "";
    this.refreshTokenExpiresIn = 0;
    this.tokenIssuedTime = 0;
  }

  @Override
  public boolean isTokenExpiring() {
    final int tExpiry = Math.round(options.getRate() * (float)tokenExpiresIn);
    final long targetTs = tokenIssuedTime + tExpiry;
    return (Instant.now().getEpochSecond() >= targetTs);
  }  

  @Override
  public Instant getTokenExpiringAt() {
    final int tExpiry = Math.round(options.getRate() * (float)tokenExpiresIn);
    final long targetTs = tokenIssuedTime + tExpiry;
    return Instant.ofEpochSecond(targetTs);
  }

  @Override
  public boolean isTokenExpired() {
    final long targetTs = tokenIssuedTime + tokenExpiresIn;
    return (Instant.now().getEpochSecond() >= targetTs);
  }

  @Override
  public boolean isRefreshTokenExpired() {    
    final long targetTs = tokenIssuedTime + refreshTokenExpiresIn;
    return (Instant.now().getEpochSecond() >= targetTs);
  }

  @Override
  public void doTokenRefresh(AccelByteSDK sdk, boolean rethrowOnError, TokenRefreshCallbacks callbacks) {
    if (options == null)
      return;
    if (!options.isEnabled())
      return;

    if (isTokenAvailable() && isTokenExpiring()) {
      int retryCount = 0;
      while (true) {
        try {
          sdk.refreshToken();
          if (callbacks != null)
            callbacks.onUpdated();
          break;
        } catch (Exception x) {
          retryCount++;
          if (retryCount >= options.getMaxRetry()) {
            if (callbacks != null)
              callbacks.onFailed(x);
            if (rethrowOnError)
              throw x;
            else
              break;
          }          
        }
      }
    }
  }
}

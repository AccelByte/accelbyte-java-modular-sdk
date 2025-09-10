package net.accelbyte.sdk.core.repository;

import java.time.Instant;

// @deprecated 2025-09-09 - Use DefaultTokenRefreshRepositoryV2 instead
public class DefaultTokenRefreshRepository extends DefaultTokenRepository
    implements TokenRefreshV2 {
  private Instant tokenExpiresAt = null;
  private String refreshToken = null;
  private Instant refreshTokenExpiresAt = null;

  @Override
  public void setTokenExpiresAt(Instant dateTime) {
    this.tokenExpiresAt = dateTime;
  }

  @Override
  public Instant getTokenExpiresAt() {
    return this.tokenExpiresAt;
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
  public void setRefreshTokenExpiresAt(Instant instant) {
    this.refreshTokenExpiresAt = instant;
  }

  @Override
  public Instant getRefreshTokenExpiresAt() {
    return this.refreshTokenExpiresAt;
  }
}

/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.time.Instant;

public interface BaseTokenRefresh extends TokenRepository {

    TokenRefreshOptions getBaseOptions();
    
    Instant getTokenExpiresAt() throws Exception;

    void storeRefreshToken(String refreshToken) throws Exception;
    
    String getRefreshToken() throws Exception;
    
    void removeRefreshToken() throws Exception;
    
    Instant getRefreshTokenExpiresAt() throws Exception;

    void clearTokenData();

    boolean isTokenExpiring();

    Instant getTokenExpiringAt();

    boolean isTokenExpired();

    boolean isRefreshTokenExpired();
}

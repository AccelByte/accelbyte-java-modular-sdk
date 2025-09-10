/*
 * Copyright (c) 2024-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import java.time.Instant;

public interface TokenRefreshV2 {  

  void setTokenExpiresAt(Instant instant) throws Exception;

  Instant getTokenExpiresAt() throws Exception;

  void storeRefreshToken(String refreshToken) throws Exception;

  String getRefreshToken() throws Exception;

  void removeRefreshToken() throws Exception;

  void setRefreshTokenExpiresAt(Instant instant) throws Exception;

  Instant getRefreshTokenExpiresAt() throws Exception;
}

/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core.repository;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenWithDeviceCookieResponseV3;
import net.accelbyte.sdk.core.AccelByteSDK;

public interface TokenRefreshV3 extends BaseTokenRefresh {

  void storeTokenData(OauthmodelTokenWithDeviceCookieResponseV3 token);

  void storeTokenData(OauthmodelTokenResponse token);

  void doTokenRefresh(AccelByteSDK sdk, boolean rethrowOnError, TokenRefreshCallbacks callbacks);
}

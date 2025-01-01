/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.io.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users_v4.*;
import net.accelbyte.sdk.api.iam.operations.users_v4.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class UsersV4 {

  private RequestRunner sdk;
  private String customBasePath = "";

  public UsersV4(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("iam");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public UsersV4(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminListInvitationHistoriesV4
   */
  public AdminListInvitationHistoriesV4OpResponse adminListInvitationHistoriesV4(
      AdminListInvitationHistoriesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetNamespaceInvitationHistoryV4
   */
  public AdminGetNamespaceInvitationHistoryV4OpResponse adminGetNamespaceInvitationHistoryV4(
      AdminGetNamespaceInvitationHistoryV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetNamespaceUserInvitationHistoryV4
   */
  public AdminGetNamespaceUserInvitationHistoryV4OpResponse
      adminGetNamespaceUserInvitationHistoryV4(AdminGetNamespaceUserInvitationHistoryV4 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateTestUsersV4
   */
  public AdminCreateTestUsersV4OpResponse adminCreateTestUsersV4(AdminCreateTestUsersV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateUserV4
   */
  public AdminCreateUserV4OpResponse adminCreateUserV4(AdminCreateUserV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkUpdateUserAccountTypeV4
   */
  public AdminBulkUpdateUserAccountTypeV4OpResponse adminBulkUpdateUserAccountTypeV4(
      AdminBulkUpdateUserAccountTypeV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkCheckValidUserIDV4
   */
  public AdminBulkCheckValidUserIDV4OpResponse adminBulkCheckValidUserIDV4(
      AdminBulkCheckValidUserIDV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserV4
   */
  public AdminUpdateUserV4OpResponse adminUpdateUserV4(AdminUpdateUserV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserEmailAddressV4
   */
  public AdminUpdateUserEmailAddressV4OpResponse adminUpdateUserEmailAddressV4(
      AdminUpdateUserEmailAddressV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableUserMFAV4
   */
  public AdminDisableUserMFAV4OpResponse adminDisableUserMFAV4(AdminDisableUserMFAV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserMFAStatusV4
   */
  public AdminGetUserMFAStatusV4OpResponse adminGetUserMFAStatusV4(AdminGetUserMFAStatusV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserRolesV4
   */
  public AdminListUserRolesV4OpResponse adminListUserRolesV4(AdminListUserRolesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserRoleV4
   */
  public AdminUpdateUserRoleV4OpResponse adminUpdateUserRoleV4(AdminUpdateUserRoleV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddUserRoleV4
   */
  public AdminAddUserRoleV4OpResponse adminAddUserRoleV4(AdminAddUserRoleV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveUserRoleV4
   */
  public AdminRemoveUserRoleV4OpResponse adminRemoveUserRoleV4(AdminRemoveUserRoleV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminInviteUserNewV4
   */
  public AdminInviteUserNewV4OpResponse adminInviteUserNewV4(AdminInviteUserNewV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateMyUserV4
   */
  public AdminUpdateMyUserV4OpResponse adminUpdateMyUserV4(AdminUpdateMyUserV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyAuthenticatorV4
   */
  public AdminDisableMyAuthenticatorV4OpResponse adminDisableMyAuthenticatorV4(
      AdminDisableMyAuthenticatorV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyAuthenticatorV4
   */
  public AdminEnableMyAuthenticatorV4OpResponse adminEnableMyAuthenticatorV4(
      AdminEnableMyAuthenticatorV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateMyAuthenticatorKeyV4
   */
  public AdminGenerateMyAuthenticatorKeyV4OpResponse adminGenerateMyAuthenticatorKeyV4(
      AdminGenerateMyAuthenticatorKeyV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public AdminGetMyBackupCodesV4OpResponse adminGetMyBackupCodesV4(AdminGetMyBackupCodesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public AdminGenerateMyBackupCodesV4OpResponse adminGenerateMyBackupCodesV4(
      AdminGenerateMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyBackupCodesV4
   */
  public AdminDisableMyBackupCodesV4OpResponse adminDisableMyBackupCodesV4(
      AdminDisableMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDownloadMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public AdminDownloadMyBackupCodesV4OpResponse adminDownloadMyBackupCodesV4(
      AdminDownloadMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public AdminEnableMyBackupCodesV4OpResponse adminEnableMyBackupCodesV4(
      AdminEnableMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBackupCodesV4
   */
  public AdminGetBackupCodesV4OpResponse adminGetBackupCodesV4(AdminGetBackupCodesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateBackupCodesV4
   */
  public AdminGenerateBackupCodesV4OpResponse adminGenerateBackupCodesV4(
      AdminGenerateBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableBackupCodesV4
   */
  public AdminEnableBackupCodesV4OpResponse adminEnableBackupCodesV4(AdminEnableBackupCodesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChallengeMyMFAV4
   */
  public AdminChallengeMyMFAV4OpResponse adminChallengeMyMFAV4(AdminChallengeMyMFAV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSendMyMFAEmailCodeV4
   */
  public AdminSendMyMFAEmailCodeV4OpResponse adminSendMyMFAEmailCodeV4(
      AdminSendMyMFAEmailCodeV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyEmailV4
   */
  public AdminDisableMyEmailV4OpResponse adminDisableMyEmailV4(AdminDisableMyEmailV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyEmailV4
   */
  public AdminEnableMyEmailV4OpResponse adminEnableMyEmailV4(AdminEnableMyEmailV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyEnabledFactorsV4
   */
  public AdminGetMyEnabledFactorsV4OpResponse adminGetMyEnabledFactorsV4(
      AdminGetMyEnabledFactorsV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminMakeFactorMyDefaultV4
   */
  public AdminMakeFactorMyDefaultV4OpResponse adminMakeFactorMyDefaultV4(
      AdminMakeFactorMyDefaultV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyOwnMFAStatusV4
   */
  public AdminGetMyOwnMFAStatusV4OpResponse adminGetMyOwnMFAStatusV4(AdminGetMyOwnMFAStatusV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyMFAStatusV4
   * @deprecated
   */
  @Deprecated
  public AdminGetMyMFAStatusV4OpResponse adminGetMyMFAStatusV4(AdminGetMyMFAStatusV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminInviteUserV4
   * @deprecated
   */
  @Deprecated
  public AdminInviteUserV4OpResponse adminInviteUserV4(AdminInviteUserV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserIDByPlatformUserIDsV4
   */
  public PublicListUserIDByPlatformUserIDsV4OpResponse publicListUserIDByPlatformUserIDsV4(
      PublicListUserIDByPlatformUserIDsV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateTestUserV4
   */
  public PublicCreateTestUserV4OpResponse publicCreateTestUserV4(PublicCreateTestUserV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserV4
   */
  public PublicCreateUserV4OpResponse publicCreateUserV4(PublicCreateUserV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateUserFromInvitationV4
   */
  public CreateUserFromInvitationV4OpResponse createUserFromInvitationV4(
      CreateUserFromInvitationV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserV4
   */
  public PublicUpdateUserV4OpResponse publicUpdateUserV4(PublicUpdateUserV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserEmailAddressV4
   */
  public PublicUpdateUserEmailAddressV4OpResponse publicUpdateUserEmailAddressV4(
      PublicUpdateUserEmailAddressV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessAccountWithVerificationCodeV4
   */
  public PublicUpgradeHeadlessAccountWithVerificationCodeV4OpResponse
      publicUpgradeHeadlessAccountWithVerificationCodeV4(
          PublicUpgradeHeadlessAccountWithVerificationCodeV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessAccountV4
   */
  public PublicUpgradeHeadlessAccountV4OpResponse publicUpgradeHeadlessAccountV4(
      PublicUpgradeHeadlessAccountV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyAuthenticatorV4
   */
  public PublicDisableMyAuthenticatorV4OpResponse publicDisableMyAuthenticatorV4(
      PublicDisableMyAuthenticatorV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyAuthenticatorV4
   */
  public PublicEnableMyAuthenticatorV4OpResponse publicEnableMyAuthenticatorV4(
      PublicEnableMyAuthenticatorV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyAuthenticatorKeyV4
   */
  public PublicGenerateMyAuthenticatorKeyV4OpResponse publicGenerateMyAuthenticatorKeyV4(
      PublicGenerateMyAuthenticatorKeyV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public PublicGetMyBackupCodesV4OpResponse publicGetMyBackupCodesV4(PublicGetMyBackupCodesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public PublicGenerateMyBackupCodesV4OpResponse publicGenerateMyBackupCodesV4(
      PublicGenerateMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyBackupCodesV4
   */
  public PublicDisableMyBackupCodesV4OpResponse publicDisableMyBackupCodesV4(
      PublicDisableMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDownloadMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public PublicDownloadMyBackupCodesV4OpResponse publicDownloadMyBackupCodesV4(
      PublicDownloadMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public PublicEnableMyBackupCodesV4OpResponse publicEnableMyBackupCodesV4(
      PublicEnableMyBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetBackupCodesV4
   */
  public PublicGetBackupCodesV4OpResponse publicGetBackupCodesV4(PublicGetBackupCodesV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateBackupCodesV4
   */
  public PublicGenerateBackupCodesV4OpResponse publicGenerateBackupCodesV4(
      PublicGenerateBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableBackupCodesV4
   */
  public PublicEnableBackupCodesV4OpResponse publicEnableBackupCodesV4(
      PublicEnableBackupCodesV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicChallengeMyMFAV4
   */
  public PublicChallengeMyMFAV4OpResponse publicChallengeMyMFAV4(PublicChallengeMyMFAV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicRemoveTrustedDeviceV4
   */
  public PublicRemoveTrustedDeviceV4OpResponse publicRemoveTrustedDeviceV4(
      PublicRemoveTrustedDeviceV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSendMyMFAEmailCodeV4
   */
  public PublicSendMyMFAEmailCodeV4OpResponse publicSendMyMFAEmailCodeV4(
      PublicSendMyMFAEmailCodeV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyEmailV4
   */
  public PublicDisableMyEmailV4OpResponse publicDisableMyEmailV4(PublicDisableMyEmailV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyEmailV4
   */
  public PublicEnableMyEmailV4OpResponse publicEnableMyEmailV4(PublicEnableMyEmailV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEnabledFactorsV4
   */
  public PublicGetMyEnabledFactorsV4OpResponse publicGetMyEnabledFactorsV4(
      PublicGetMyEnabledFactorsV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicMakeFactorMyDefaultV4
   */
  public PublicMakeFactorMyDefaultV4OpResponse publicMakeFactorMyDefaultV4(
      PublicMakeFactorMyDefaultV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyOwnMFAStatusV4
   */
  public PublicGetMyOwnMFAStatusV4OpResponse publicGetMyOwnMFAStatusV4(
      PublicGetMyOwnMFAStatusV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyMFAStatusV4
   * @deprecated
   */
  @Deprecated
  public PublicGetMyMFAStatusV4OpResponse publicGetMyMFAStatusV4(PublicGetMyMFAStatusV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserPublicInfoByUserIdV4
   */
  public PublicGetUserPublicInfoByUserIdV4OpResponse publicGetUserPublicInfoByUserIdV4(
      PublicGetUserPublicInfoByUserIdV4 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicInviteUserV4
   */
  public PublicInviteUserV4OpResponse publicInviteUserV4(PublicInviteUserV4 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessWithCodeV4Forward
   */
  public PublicUpgradeHeadlessWithCodeV4ForwardOpResponse publicUpgradeHeadlessWithCodeV4Forward(
      PublicUpgradeHeadlessWithCodeV4Forward input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

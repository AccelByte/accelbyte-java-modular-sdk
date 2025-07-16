/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operation_responses.notification.*;
import net.accelbyte.sdk.api.lobby.operations.notification.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Notification {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Notification(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("lobby");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Notification(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see SendMultipleUsersFreeformNotificationV1Admin
   */
  public SendMultipleUsersFreeformNotificationV1AdminOpResponse
      sendMultipleUsersFreeformNotificationV1Admin(
          SendMultipleUsersFreeformNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendUsersFreeformNotificationV1Admin
   */
  public SendUsersFreeformNotificationV1AdminOpResponse sendUsersFreeformNotificationV1Admin(
      SendUsersFreeformNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendPartyFreeformNotificationV1Admin
   * @deprecated
   */
  @Deprecated
  public SendPartyFreeformNotificationV1AdminOpResponse sendPartyFreeformNotificationV1Admin(
      SendPartyFreeformNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendPartyTemplatedNotificationV1Admin
   * @deprecated
   */
  @Deprecated
  public SendPartyTemplatedNotificationV1AdminOpResponse sendPartyTemplatedNotificationV1Admin(
      SendPartyTemplatedNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllNotificationTemplatesV1Admin
   */
  public GetAllNotificationTemplatesV1AdminOpResponse getAllNotificationTemplatesV1Admin(
      GetAllNotificationTemplatesV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNotificationTemplateV1Admin
   */
  public CreateNotificationTemplateV1AdminOpResponse createNotificationTemplateV1Admin(
      CreateNotificationTemplateV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendUsersTemplatedNotificationV1Admin
   */
  public SendUsersTemplatedNotificationV1AdminOpResponse sendUsersTemplatedNotificationV1Admin(
      SendUsersTemplatedNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTemplateSlugLocalizationsTemplateV1Admin
   */
  public GetTemplateSlugLocalizationsTemplateV1AdminOpResponse
      getTemplateSlugLocalizationsTemplateV1Admin(GetTemplateSlugLocalizationsTemplateV1Admin input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNotificationTemplateSlugV1Admin
   */
  public DeleteNotificationTemplateSlugV1AdminOpResponse deleteNotificationTemplateSlugV1Admin(
      DeleteNotificationTemplateSlugV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleTemplateLocalizationV1Admin
   */
  public GetSingleTemplateLocalizationV1AdminOpResponse getSingleTemplateLocalizationV1Admin(
      GetSingleTemplateLocalizationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateTemplateLocalizationV1Admin
   */
  public UpdateTemplateLocalizationV1AdminOpResponse updateTemplateLocalizationV1Admin(
      UpdateTemplateLocalizationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTemplateLocalizationV1Admin
   */
  public DeleteTemplateLocalizationV1AdminOpResponse deleteTemplateLocalizationV1Admin(
      DeleteTemplateLocalizationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublishTemplateLocalizationV1Admin
   */
  public PublishTemplateLocalizationV1AdminOpResponse publishTemplateLocalizationV1Admin(
      PublishTemplateLocalizationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllNotificationTopicsV1Admin
   */
  public GetAllNotificationTopicsV1AdminOpResponse getAllNotificationTopicsV1Admin(
      GetAllNotificationTopicsV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNotificationTopicV1Admin
   */
  public CreateNotificationTopicV1AdminOpResponse createNotificationTopicV1Admin(
      CreateNotificationTopicV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNotificationTopicV1Admin
   */
  public GetNotificationTopicV1AdminOpResponse getNotificationTopicV1Admin(
      GetNotificationTopicV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNotificationTopicV1Admin
   */
  public UpdateNotificationTopicV1AdminOpResponse updateNotificationTopicV1Admin(
      UpdateNotificationTopicV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNotificationTopicV1Admin
   */
  public DeleteNotificationTopicV1AdminOpResponse deleteNotificationTopicV1Admin(
      DeleteNotificationTopicV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendSpecificUserFreeformNotificationV1Admin
   */
  public SendSpecificUserFreeformNotificationV1AdminOpResponse
      sendSpecificUserFreeformNotificationV1Admin(SendSpecificUserFreeformNotificationV1Admin input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendSpecificUserTemplatedNotificationV1Admin
   */
  public SendSpecificUserTemplatedNotificationV1AdminOpResponse
      sendSpecificUserTemplatedNotificationV1Admin(
          SendSpecificUserTemplatedNotificationV1Admin input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyNotifications
   */
  public GetMyNotificationsOpResponse getMyNotifications(GetMyNotifications input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyOfflineNotifications
   */
  public GetMyOfflineNotificationsOpResponse getMyOfflineNotifications(
      GetMyOfflineNotifications input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTopicByNamespace
   */
  public GetTopicByNamespaceOpResponse getTopicByNamespace(GetTopicByNamespace input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateTopic
   */
  public CreateTopicOpResponse createTopic(CreateTopic input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTopicByTopicName
   */
  public GetTopicByTopicNameOpResponse getTopicByTopicName(GetTopicByTopicName input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateTopicByTopicName
   */
  public UpdateTopicByTopicNameOpResponse updateTopicByTopicName(UpdateTopicByTopicName input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTopicByTopicName
   */
  public DeleteTopicByTopicNameOpResponse deleteTopicByTopicName(DeleteTopicByTopicName input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FreeFormNotificationByUserID
   */
  public FreeFormNotificationByUserIDOpResponse freeFormNotificationByUserID(
      FreeFormNotificationByUserID input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see NotificationWithTemplateByUserID
   */
  public NotificationWithTemplateByUserIDOpResponse notificationWithTemplateByUserID(
      NotificationWithTemplateByUserID input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}

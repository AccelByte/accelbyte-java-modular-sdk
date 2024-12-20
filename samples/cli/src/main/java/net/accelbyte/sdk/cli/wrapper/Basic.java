/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.basic.namespace.*;
import net.accelbyte.sdk.cli.api.basic.config.*;
import net.accelbyte.sdk.cli.api.basic.file_upload.*;
import net.accelbyte.sdk.cli.api.basic.misc.*;
import net.accelbyte.sdk.cli.api.basic.user_profile.*;
import net.accelbyte.sdk.cli.api.basic.anonymization.*;

import picocli.CommandLine.Command;

@Command(name = "basic",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetNamespaces.class,
                CreateNamespace.class,
                GetNamespace.class,
                DeleteNamespace.class,
                UpdateNamespace.class,
                GetChildNamespaces.class,
                CreateConfig.class,
                GetConfig.class,
                DeleteConfig.class,
                UpdateConfig.class,
                GetNamespaceContext.class,
                GeneratedUploadUrl.class,
                GetGameNamespaces.class,
                GetCountries.class,
                GetCountryGroups.class,
                AddCountryGroup.class,
                UpdateCountryGroup.class,
                DeleteCountryGroup.class,
                GetLanguages.class,
                GetTimeZones.class,
                GetUserProfileInfoByPublicId.class,
                AdminGetUserProfilePublicInfoByIds.class,
                GetNamespacePublisher.class,
                GetPublisherConfig.class,
                ChangeNamespaceStatus.class,
                AnonymizeUserProfile.class,
                GeneratedUserUploadContentUrl.class,
                GetUserProfileInfo.class,
                UpdateUserProfile.class,
                DeleteUserProfile.class,
                GetCustomAttributesInfo.class,
                UpdateCustomAttributesPartially.class,
                GetPrivateCustomAttributesInfo.class,
                UpdatePrivateCustomAttributesPartially.class,
                UpdateUserProfileStatus.class,
                PublicGetTime.class,
                PublicGetNamespaces.class,
                GetNamespace1.class,
                PublicGeneratedUploadUrl.class,
                PublicGetCountries.class,
                PublicGetLanguages.class,
                PublicGetTimeZones.class,
                PublicGetUserProfilePublicInfoByIds.class,
                PublicBulkGetUserProfilePublicInfo.class,
                PublicGetUserProfileInfoByPublicId.class,
                PublicGetNamespacePublisher.class,
                GetMyProfileInfo.class,
                UpdateMyProfile.class,
                CreateMyProfile.class,
                GetMyPrivateCustomAttributesInfo.class,
                UpdateMyPrivateCustomAttributesPartially.class,
                GetMyZipCode.class,
                UpdateMyZipCode.class,
                PublicGeneratedUserUploadContentUrl.class,
                PublicGetUserProfileInfo.class,
                PublicUpdateUserProfile.class,
                PublicCreateUserProfile.class,
                PublicGetCustomAttributesInfo.class,
                PublicUpdateCustomAttributesPartially.class,
                PublicGetUserProfilePublicInfo.class,
                PublicUpdateUserProfileStatus.class,
        }
)
public class Basic implements Runnable {

    @Override
    public void run() {

    }
}
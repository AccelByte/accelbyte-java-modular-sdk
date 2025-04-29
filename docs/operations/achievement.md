[//]: # (Code generated. DO NOT EDIT.)

# Achievement Service Index

&nbsp;

## Operations

### Achievements Wrapper:  [Achievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Achievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/achievements` | GET | AdminListAchievements | [AdminListAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminListAchievements.java) | [AdminListAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminListAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements` | POST | AdminCreateNewAchievement | [AdminCreateNewAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminCreateNewAchievement.java) | [AdminCreateNewAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminCreateNewAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/export` | GET | ExportAchievements | [ExportAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/ExportAchievements.java) | [ExportAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/ExportAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/import` | POST | ImportAchievements | [ImportAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/ImportAchievements.java) | [ImportAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/ImportAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | GET | AdminGetAchievement | [AdminGetAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminGetAchievement.java) | [AdminGetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminGetAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | PUT | AdminUpdateAchievement | [AdminUpdateAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminUpdateAchievement.java) | [AdminUpdateAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminUpdateAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | DELETE | AdminDeleteAchievement | [AdminDeleteAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminDeleteAchievement.java) | [AdminDeleteAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminDeleteAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/achievements/{achievementCode}` | PATCH | AdminUpdateAchievementListOrder | [AdminUpdateAchievementListOrder](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/AdminUpdateAchievementListOrder.java) | [AdminUpdateAchievementListOrder](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/AdminUpdateAchievementListOrder.java) |
| `/achievement/v1/public/namespaces/{namespace}/achievements` | GET | PublicListAchievements | [PublicListAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/PublicListAchievements.java) | [PublicListAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/PublicListAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/achievements/{achievementCode}` | GET | PublicGetAchievement | [PublicGetAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/achievements/PublicGetAchievement.java) | [PublicGetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/achievements/PublicGetAchievement.java) |

### Global Achievements Wrapper:  [GlobalAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/GlobalAchievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements` | GET | AdminListGlobalAchievements | [AdminListGlobalAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListGlobalAchievements.java) | [AdminListGlobalAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListGlobalAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/contributors` | GET | AdminListGlobalAchievementContributors | [AdminListGlobalAchievementContributors](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListGlobalAchievementContributors.java) | [AdminListGlobalAchievementContributors](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListGlobalAchievementContributors.java) |
| `/achievement/v1/admin/namespaces/{namespace}/global/achievements/{achievementCode}/reset` | DELETE | ResetGlobalAchievement | [ResetGlobalAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ResetGlobalAchievement.java) | [ResetGlobalAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ResetGlobalAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/global/achievements` | GET | AdminListUserContributions | [AdminListUserContributions](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/AdminListUserContributions.java) | [AdminListUserContributions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/AdminListUserContributions.java) |
| `/achievement/v1/public/namespaces/{namespace}/global/achievements` | GET | PublicListGlobalAchievements | [PublicListGlobalAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/PublicListGlobalAchievements.java) | [PublicListGlobalAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/PublicListGlobalAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/global/achievements/{achievementCode}/contributors` | GET | ListGlobalAchievementContributors | [ListGlobalAchievementContributors](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ListGlobalAchievementContributors.java) | [ListGlobalAchievementContributors](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ListGlobalAchievementContributors.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/global/achievements` | GET | ListUserContributions | [ListUserContributions](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ListUserContributions.java) | [ListUserContributions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ListUserContributions.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/global/achievements/{achievementCode}/claim` | POST | ClaimGlobalAchievementReward | [ClaimGlobalAchievementReward](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/global_achievements/ClaimGlobalAchievementReward.java) | [ClaimGlobalAchievementReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/global_achievements/ClaimGlobalAchievementReward.java) |

### Platform Achievement Wrapper:  [PlatformAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/PlatformAchievement.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/platforms/psn/bulk` | POST | BulkCreatePSNEvent | [BulkCreatePSNEvent](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/platform_achievement/BulkCreatePSNEvent.java) | [BulkCreatePSNEvent](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/platform_achievement/BulkCreatePSNEvent.java) |

### Tags Wrapper:  [Tags](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Tags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/tags` | GET | AdminListTags | [AdminListTags](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/tags/AdminListTags.java) | [AdminListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/tags/AdminListTags.java) |
| `/achievement/v1/public/namespaces/{namespace}/tags` | GET | PublicListTags | [PublicListTags](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/tags/PublicListTags.java) | [PublicListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/tags/PublicListTags.java) |

### User Achievements Wrapper:  [UserAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/UserAchievements.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements` | GET | AdminListUserAchievements | [AdminListUserAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminListUserAchievements.java) | [AdminListUserAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminListUserAchievements.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements/bulkUnlock` | PUT | AdminBulkUnlockAchievement | [AdminBulkUnlockAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminBulkUnlockAchievement.java) | [AdminBulkUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminBulkUnlockAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/reset` | DELETE | AdminResetAchievement | [AdminResetAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminResetAchievement.java) | [AdminResetAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminResetAchievement.java) |
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/unlock` | PUT | AdminUnlockAchievement | [AdminUnlockAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/AdminUnlockAchievement.java) | [AdminUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/AdminUnlockAchievement.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements` | GET | PublicListUserAchievements | [PublicListUserAchievements](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/PublicListUserAchievements.java) | [PublicListUserAchievements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/PublicListUserAchievements.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements/bulkUnlock` | PUT | PublicBulkUnlockAchievement | [PublicBulkUnlockAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/PublicBulkUnlockAchievement.java) | [PublicBulkUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/PublicBulkUnlockAchievement.java) |
| `/achievement/v1/public/namespaces/{namespace}/users/{userId}/achievements/{achievementCode}/unlock` | PUT | PublicUnlockAchievement | [PublicUnlockAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/user_achievements/PublicUnlockAchievement.java) | [PublicUnlockAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/user_achievements/PublicUnlockAchievement.java) |

### Anonymization Wrapper:  [Anonymization](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/achievement/v1/admin/namespaces/{namespace}/users/{userId}/anonymization/achievements` | DELETE | AdminAnonymizeUserAchievement | [AdminAnonymizeUserAchievement](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/operations/anonymization/AdminAnonymizeUserAchievement.java) | [AdminAnonymizeUserAchievement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/achievement/anonymization/AdminAnonymizeUserAchievement.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `models.AchievementOrderUpdateRequest` | [ModelsAchievementOrderUpdateRequest](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementOrderUpdateRequest.java) |
| `models.AchievementRequest` | [ModelsAchievementRequest](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementRequest.java) |
| `models.AchievementResponse` | [ModelsAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementResponse.java) |
| `models.AchievementUpdateRequest` | [ModelsAchievementUpdateRequest](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAchievementUpdateRequest.java) |
| `models.AdditionalInfo` | [ModelsAdditionalInfo](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsAdditionalInfo.java) |
| `models.BulkCreatePSNEventResponse` | [ModelsBulkCreatePSNEventResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsBulkCreatePSNEventResponse.java) |
| `models.BulkCreatePSNEvents` | [ModelsBulkCreatePSNEvents](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsBulkCreatePSNEvents.java) |
| `models.BulkUnlockAchievementRequest` | [ModelsBulkUnlockAchievementRequest](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsBulkUnlockAchievementRequest.java) |
| `models.BulkUnlockAchievementResponse` | [ModelsBulkUnlockAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsBulkUnlockAchievementResponse.java) |
| `models.ContributorResponse` | [ModelsContributorResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsContributorResponse.java) |
| `models.CreatePSNEvent` | [ModelsCreatePSNEvent](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsCreatePSNEvent.java) |
| `models.ErrorDetails` | [ModelsErrorDetails](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsErrorDetails.java) |
| `models.GlobalAchievementResponse` | [ModelsGlobalAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsGlobalAchievementResponse.java) |
| `models.Icon` | [ModelsIcon](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsIcon.java) |
| `models.PSNEvent` | [ModelsPSNEvent](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPSNEvent.java) |
| `models.PSNEventData` | [ModelsPSNEventData](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPSNEventData.java) |
| `models.PSNEventResult` | [ModelsPSNEventResult](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPSNEventResult.java) |
| `models.PaginatedAchievementResponse` | [ModelsPaginatedAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedAchievementResponse.java) |
| `models.PaginatedContributorResponse` | [ModelsPaginatedContributorResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedContributorResponse.java) |
| `models.PaginatedGlobalAchievementResponse` | [ModelsPaginatedGlobalAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedGlobalAchievementResponse.java) |
| `models.PaginatedTagResponse` | [ModelsPaginatedTagResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedTagResponse.java) |
| `models.PaginatedUserAchievementResponse` | [ModelsPaginatedUserAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedUserAchievementResponse.java) |
| `models.PaginatedUserContributionResponse` | [ModelsPaginatedUserContributionResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPaginatedUserContributionResponse.java) |
| `models.Pagination` | [ModelsPagination](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPagination.java) |
| `models.PublicAchievementResponse` | [ModelsPublicAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPublicAchievementResponse.java) |
| `models.PublicAchievementsResponse` | [ModelsPublicAchievementsResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsPublicAchievementsResponse.java) |
| `models.TagResponse` | [ModelsTagResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsTagResponse.java) |
| `models.UserAchievementResponse` | [ModelsUserAchievementResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsUserAchievementResponse.java) |
| `models.UserContributionResponse` | [ModelsUserContributionResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ModelsUserContributionResponse.java) |
| `response.Error` | [ResponseError](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ResponseError.java) |
| `service.ImportConfigResponse` | [ServiceImportConfigResponse](../../module-achievement/src/main/java/net/accelbyte/sdk/api/achievement/models/ServiceImportConfigResponse.java) |

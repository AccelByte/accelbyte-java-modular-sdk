[//]: # (Code generated. DO NOT EDIT.)

# Seasonpass Service Index

&nbsp;

## Operations

### Export Wrapper:  [Export](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Export.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespace/{namespace}/export` | GET | ExportSeason | [ExportSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/export/ExportSeason.java) | [ExportSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/export/ExportSeason.java) |

### Season Wrapper:  [Season](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Season.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons` | GET | QuerySeasons | [QuerySeasons](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QuerySeasons.java) | [QuerySeasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QuerySeasons.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons` | POST | CreateSeason | [CreateSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CreateSeason.java) | [CreateSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CreateSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/current` | GET | GetCurrentSeason | [GetCurrentSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetCurrentSeason.java) | [GetCurrentSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetCurrentSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/current/users/bulk/progression` | POST | BulkGetUserSeasonProgression | [BulkGetUserSeasonProgression](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/BulkGetUserSeasonProgression.java) | [BulkGetUserSeasonProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/BulkGetUserSeasonProgression.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | GET | GetSeason | [GetSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetSeason.java) | [GetSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | DELETE | DeleteSeason | [DeleteSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/DeleteSeason.java) | [DeleteSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/DeleteSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}` | PATCH | UpdateSeason | [UpdateSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/UpdateSeason.java) | [UpdateSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/UpdateSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/clone` | POST | CloneSeason | [CloneSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CloneSeason.java) | [CloneSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CloneSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/full` | GET | GetFullSeason | [GetFullSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetFullSeason.java) | [GetFullSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetFullSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/publish` | PUT | PublishSeason | [PublishSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublishSeason.java) | [PublishSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublishSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/retire` | PUT | RetireSeason | [RetireSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/RetireSeason.java) | [RetireSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/RetireSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/unpublish` | PUT | UnpublishSeason | [UnpublishSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/UnpublishSeason.java) | [UnpublishSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/UnpublishSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons` | GET | GetUserParticipatedSeasons | [GetUserParticipatedSeasons](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetUserParticipatedSeasons.java) | [GetUserParticipatedSeasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetUserParticipatedSeasons.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/passes/ownership/any` | GET | ExistsAnyPassByPassCodes | [ExistsAnyPassByPassCodes](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/ExistsAnyPassByPassCodes.java) | [ExistsAnyPassByPassCodes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/ExistsAnyPassByPassCodes.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/progression` | GET | GetCurrentUserSeasonProgression | [GetCurrentUserSeasonProgression](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetCurrentUserSeasonProgression.java) | [GetCurrentUserSeasonProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetCurrentUserSeasonProgression.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/purchasable` | POST | CheckSeasonPurchasable | [CheckSeasonPurchasable](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/CheckSeasonPurchasable.java) | [CheckSeasonPurchasable](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/CheckSeasonPurchasable.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/reset` | DELETE | ResetUserSeason | [ResetUserSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/ResetUserSeason.java) | [ResetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/ResetUserSeason.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/exp/history` | GET | QueryUserExpGrantHistory | [QueryUserExpGrantHistory](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QueryUserExpGrantHistory.java) | [QueryUserExpGrantHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QueryUserExpGrantHistory.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/exp/history/tags` | GET | QueryUserExpGrantHistoryTag | [QueryUserExpGrantHistoryTag](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/QueryUserExpGrantHistoryTag.java) | [QueryUserExpGrantHistoryTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/QueryUserExpGrantHistoryTag.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/{seasonId}/data` | GET | GetUserSeason | [GetUserSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/GetUserSeason.java) | [GetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/GetUserSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/seasons/current` | GET | PublicGetCurrentSeason | [PublicGetCurrentSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetCurrentSeason.java) | [PublicGetCurrentSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetCurrentSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/data` | GET | PublicGetCurrentUserSeason | [PublicGetCurrentUserSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetCurrentUserSeason.java) | [PublicGetCurrentUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetCurrentUserSeason.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/{seasonId}/data` | GET | PublicGetUserSeason | [PublicGetUserSeason](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/season/PublicGetUserSeason.java) | [PublicGetUserSeason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/season/PublicGetUserSeason.java) |

### Utilities Wrapper:  [Utilities](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Utilities.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/item/references` | GET | GetItemReferences | [GetItemReferences](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/utilities/GetItemReferences.java) | [GetItemReferences](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/utilities/GetItemReferences.java) |

### Pass Wrapper:  [Pass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Pass.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes` | GET | QueryPasses | [QueryPasses](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/QueryPasses.java) | [QueryPasses](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/QueryPasses.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes` | POST | CreatePass | [CreatePass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/CreatePass.java) | [CreatePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/CreatePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | GET | GetPass | [GetPass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/GetPass.java) | [GetPass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/GetPass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | DELETE | DeletePass | [DeletePass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/DeletePass.java) | [DeletePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/DeletePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}` | PATCH | UpdatePass | [UpdatePass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/UpdatePass.java) | [UpdatePass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/UpdatePass.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/passes` | POST | GrantUserPass | [GrantUserPass](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/pass/GrantUserPass.java) | [GrantUserPass](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/pass/GrantUserPass.java) |

### Reward Wrapper:  [Reward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Reward.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards` | GET | QueryRewards | [QueryRewards](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/QueryRewards.java) | [QueryRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/QueryRewards.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards` | POST | CreateReward | [CreateReward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/CreateReward.java) | [CreateReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/CreateReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | GET | GetReward | [GetReward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/GetReward.java) | [GetReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/GetReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | DELETE | DeleteReward | [DeleteReward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/DeleteReward.java) | [DeleteReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/DeleteReward.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/rewards/{code}` | PATCH | UpdateReward | [UpdateReward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/UpdateReward.java) | [UpdateReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/UpdateReward.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/rewards` | POST | PublicClaimUserReward | [PublicClaimUserReward](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/PublicClaimUserReward.java) | [PublicClaimUserReward](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/PublicClaimUserReward.java) |
| `/seasonpass/public/namespaces/{namespace}/users/{userId}/seasons/current/rewards/bulk` | POST | PublicBulkClaimUserRewards | [PublicBulkClaimUserRewards](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/reward/PublicBulkClaimUserRewards.java) | [PublicBulkClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/reward/PublicBulkClaimUserRewards.java) |

### Tier Wrapper:  [Tier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/wrappers/Tier.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers` | GET | QueryTiers | [QueryTiers](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/QueryTiers.java) | [QueryTiers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/QueryTiers.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers` | POST | CreateTier | [CreateTier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/CreateTier.java) | [CreateTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/CreateTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}` | PUT | UpdateTier | [UpdateTier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/UpdateTier.java) | [UpdateTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/UpdateTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}` | DELETE | DeleteTier | [DeleteTier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/DeleteTier.java) | [DeleteTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/DeleteTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/tiers/{id}/reorder` | PUT | ReorderTier | [ReorderTier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/ReorderTier.java) | [ReorderTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/ReorderTier.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/exp` | POST | GrantUserExp | [GrantUserExp](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/GrantUserExp.java) | [GrantUserExp](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/GrantUserExp.java) |
| `/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/tiers` | POST | GrantUserTier | [GrantUserTier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/operations/tier/GrantUserTier.java) | [GrantUserTier](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/seasonpass/tier/GrantUserTier.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `BulkUserProgressionRequest` | [BulkUserProgressionRequest](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/BulkUserProgressionRequest.java) |
| `ClaimableRewards` | [ClaimableRewards](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ClaimableRewards.java) |
| `ClaimableUserSeasonInfo` | [ClaimableUserSeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ClaimableUserSeasonInfo.java) |
| `ErrorEntity` | [ErrorEntity](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ErrorEntity.java) |
| `ExcessStrategy` | [ExcessStrategy](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExcessStrategy.java) |
| `ExpGrantHistoryInfo` | [ExpGrantHistoryInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExpGrantHistoryInfo.java) |
| `ExpGrantHistoryPagingSlicedResult` | [ExpGrantHistoryPagingSlicedResult](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ExpGrantHistoryPagingSlicedResult.java) |
| `FieldValidationError` | [FieldValidationError](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/FieldValidationError.java) |
| `FullSeasonInfo` | [FullSeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/FullSeasonInfo.java) |
| `Image` | [Image](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Image.java) |
| `ItemReference` | [ItemReference](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ItemReference.java) |
| `ItemReferenceInfo` | [ItemReferenceInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ItemReferenceInfo.java) |
| `ListSeasonInfo` | [ListSeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListSeasonInfo.java) |
| `ListSeasonInfoPagingSlicedResult` | [ListSeasonInfoPagingSlicedResult](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListSeasonInfoPagingSlicedResult.java) |
| `ListUserSeasonInfo` | [ListUserSeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListUserSeasonInfo.java) |
| `ListUserSeasonInfoPagingSlicedResult` | [ListUserSeasonInfoPagingSlicedResult](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ListUserSeasonInfoPagingSlicedResult.java) |
| `Localization` | [Localization](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Localization.java) |
| `LocalizedPassInfo` | [LocalizedPassInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/LocalizedPassInfo.java) |
| `LocalizedSeasonInfo` | [LocalizedSeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/LocalizedSeasonInfo.java) |
| `Ownership` | [Ownership](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Ownership.java) |
| `Paging` | [Paging](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Paging.java) |
| `PassCreate` | [PassCreate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassCreate.java) |
| `PassInfo` | [PassInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassInfo.java) |
| `PassUpdate` | [PassUpdate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/PassUpdate.java) |
| `Permission` | [Permission](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Permission.java) |
| `ReasonTagsResult` | [ReasonTagsResult](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ReasonTagsResult.java) |
| `RewardCreate` | [RewardCreate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardCreate.java) |
| `RewardCurrency` | [RewardCurrency](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardCurrency.java) |
| `RewardInfo` | [RewardInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardInfo.java) |
| `RewardUpdate` | [RewardUpdate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/RewardUpdate.java) |
| `SeasonCloneRequest` | [SeasonCloneRequest](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonCloneRequest.java) |
| `SeasonCreate` | [SeasonCreate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonCreate.java) |
| `SeasonInfo` | [SeasonInfo](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonInfo.java) |
| `SeasonSummary` | [SeasonSummary](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonSummary.java) |
| `SeasonUpdate` | [SeasonUpdate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/SeasonUpdate.java) |
| `Tier` | [Tier](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/Tier.java) |
| `TierCreate` | [TierCreate](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierCreate.java) |
| `TierInput` | [TierInput](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierInput.java) |
| `TierPagingSlicedResult` | [TierPagingSlicedResult](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierPagingSlicedResult.java) |
| `TierReorder` | [TierReorder](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/TierReorder.java) |
| `UserExpGrant` | [UserExpGrant](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserExpGrant.java) |
| `UserPassGrant` | [UserPassGrant](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserPassGrant.java) |
| `UserPurchasable` | [UserPurchasable](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserPurchasable.java) |
| `UserRewardClaim` | [UserRewardClaim](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserRewardClaim.java) |
| `UserSeasonSummary` | [UserSeasonSummary](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserSeasonSummary.java) |
| `UserTierGrant` | [UserTierGrant](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/UserTierGrant.java) |
| `ValidationErrorEntity` | [ValidationErrorEntity](../../module-seasonpass/src/main/java/net/accelbyte/sdk/api/seasonpass/models/ValidationErrorEntity.java) |

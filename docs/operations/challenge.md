[//]: # (Code generated. DO NOT EDIT.)

# Challenge Service Index

&nbsp;

## Operations

### Challenge Configuration Wrapper:  [ChallengeConfiguration](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeConfiguration.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges` | GET | AdminGetChallenges | [AdminGetChallenges](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetChallenges.java) | [AdminGetChallenges](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetChallenges.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges` | POST | AdminCreateChallenge | [AdminCreateChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminCreateChallenge.java) | [AdminCreateChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminCreateChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/users/{userId}` | GET | AdminGetActiveChallenges | [AdminGetActiveChallenges](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetActiveChallenges.java) | [AdminGetActiveChallenges](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetActiveChallenges.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | GET | AdminGetChallenge | [AdminGetChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetChallenge.java) | [AdminGetChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | PUT | AdminUpdateChallenge | [AdminUpdateChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminUpdateChallenge.java) | [AdminUpdateChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminUpdateChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}` | DELETE | AdminDeleteChallenge | [AdminDeleteChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminDeleteChallenge.java) | [AdminDeleteChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminDeleteChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/periods` | GET | AdminGetPeriods | [AdminGetPeriods](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminGetPeriods.java) | [AdminGetPeriods](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminGetPeriods.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/randomize` | POST | AdminRandomizeChallenge | [AdminRandomizeChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminRandomizeChallenge.java) | [AdminRandomizeChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminRandomizeChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/tied` | DELETE | AdminDeleteTiedChallenge | [AdminDeleteTiedChallenge](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminDeleteTiedChallenge.java) | [AdminDeleteTiedChallenge](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminDeleteTiedChallenge.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/tied/schedule` | PUT | AdminUpdateTiedChallengeSchedule | [AdminUpdateTiedChallengeSchedule](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_configuration/AdminUpdateTiedChallengeSchedule.java) | [AdminUpdateTiedChallengeSchedule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_configuration/AdminUpdateTiedChallengeSchedule.java) |

### Utilities Wrapper:  [Utilities](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/Utilities.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges/item/references` | GET | AdminGetItemReferences | [AdminGetItemReferences](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/utilities/AdminGetItemReferences.java) | [AdminGetItemReferences](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/utilities/AdminGetItemReferences.java) |

### Goal Configuration Wrapper:  [GoalConfiguration](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/GoalConfiguration.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals` | GET | AdminGetGoals | [AdminGetGoals](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminGetGoals.java) | [AdminGetGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminGetGoals.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals` | POST | AdminCreateGoal | [AdminCreateGoal](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminCreateGoal.java) | [AdminCreateGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminCreateGoal.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | GET | AdminGetGoal | [AdminGetGoal](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminGetGoal.java) | [AdminGetGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminGetGoal.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | PUT | AdminUpdateGoals | [AdminUpdateGoals](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminUpdateGoals.java) | [AdminUpdateGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminUpdateGoals.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}` | DELETE | AdminDeleteGoal | [AdminDeleteGoal](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/goal_configuration/AdminDeleteGoal.java) | [AdminDeleteGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/goal_configuration/AdminDeleteGoal.java) |

### Schedules Wrapper:  [Schedules](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/Schedules.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}/schedules` | GET | AdminListSchedulesByGoal | [AdminListSchedulesByGoal](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/schedules/AdminListSchedulesByGoal.java) | [AdminListSchedulesByGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/schedules/AdminListSchedulesByGoal.java) |
| `/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/schedules` | GET | AdminListSchedules | [AdminListSchedules](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/schedules/AdminListSchedules.java) | [AdminListSchedules](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/schedules/AdminListSchedules.java) |
| `/challenge/v1/public/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}/schedules` | GET | PublicListSchedulesByGoal | [PublicListSchedulesByGoal](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/schedules/PublicListSchedulesByGoal.java) | [PublicListSchedulesByGoal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/schedules/PublicListSchedulesByGoal.java) |
| `/challenge/v1/public/namespaces/{namespace}/challenges/{challengeCode}/schedules` | GET | PublicListSchedules | [PublicListSchedules](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/schedules/PublicListSchedules.java) | [PublicListSchedules](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/schedules/PublicListSchedules.java) |

### Plugins Wrapper:  [Plugins](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/Plugins.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/plugins/assignment` | GET | AdminGetAssignmentPlugin | [AdminGetAssignmentPlugin](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/plugins/AdminGetAssignmentPlugin.java) | [AdminGetAssignmentPlugin](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/plugins/AdminGetAssignmentPlugin.java) |
| `/challenge/v1/admin/namespaces/{namespace}/plugins/assignment` | PUT | AdminUpdateAssignmentPlugin | [AdminUpdateAssignmentPlugin](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/plugins/AdminUpdateAssignmentPlugin.java) | [AdminUpdateAssignmentPlugin](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/plugins/AdminUpdateAssignmentPlugin.java) |
| `/challenge/v1/admin/namespaces/{namespace}/plugins/assignment` | POST | AdminCreateAssignmentPlugin | [AdminCreateAssignmentPlugin](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/plugins/AdminCreateAssignmentPlugin.java) | [AdminCreateAssignmentPlugin](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/plugins/AdminCreateAssignmentPlugin.java) |
| `/challenge/v1/admin/namespaces/{namespace}/plugins/assignment` | DELETE | AdminDeleteAssignmentPlugin | [AdminDeleteAssignmentPlugin](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/plugins/AdminDeleteAssignmentPlugin.java) | [AdminDeleteAssignmentPlugin](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/plugins/AdminDeleteAssignmentPlugin.java) |

### Challenge Progression Wrapper:  [ChallengeProgression](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeProgression.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/progress/evaluate` | POST | AdminEvaluateProgress | [AdminEvaluateProgress](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/AdminEvaluateProgress.java) | [AdminEvaluateProgress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/AdminEvaluateProgress.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/progress/{challengeCode}` | GET | AdminGetUserProgression | [AdminGetUserProgression](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/AdminGetUserProgression.java) | [AdminGetUserProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/AdminGetUserProgression.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/progress/evaluate` | POST | EvaluateMyProgress | [EvaluateMyProgress](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/EvaluateMyProgress.java) | [EvaluateMyProgress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/EvaluateMyProgress.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/progress/{challengeCode}` | GET | PublicGetUserProgression | [PublicGetUserProgression](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/PublicGetUserProgression.java) | [PublicGetUserProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/PublicGetUserProgression.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/progress/{challengeCode}/index/{index}` | GET | PublicGetPastUserProgression | [PublicGetPastUserProgression](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_progression/PublicGetPastUserProgression.java) | [PublicGetPastUserProgression](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_progression/PublicGetPastUserProgression.java) |

### Player Reward Wrapper:  [PlayerReward](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/PlayerReward.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/admin/namespaces/{namespace}/users/rewards/claim` | POST | AdminClaimUsersRewards | [AdminClaimUsersRewards](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminClaimUsersRewards.java) | [AdminClaimUsersRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminClaimUsersRewards.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/challenges/{challengeCode}/rewards/claim` | POST | AdminClaimUserRewardsByGoalCode | [AdminClaimUserRewardsByGoalCode](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminClaimUserRewardsByGoalCode.java) | [AdminClaimUserRewardsByGoalCode](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminClaimUserRewardsByGoalCode.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/rewards` | GET | AdminGetUserRewards | [AdminGetUserRewards](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminGetUserRewards.java) | [AdminGetUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminGetUserRewards.java) |
| `/challenge/v1/admin/namespaces/{namespace}/users/{userId}/rewards/claim` | POST | AdminClaimUserRewards | [AdminClaimUserRewards](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/AdminClaimUserRewards.java) | [AdminClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/AdminClaimUserRewards.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/challenges/{challengeCode}/rewards/claim` | POST | PublicClaimUserRewardsByGoalCode | [PublicClaimUserRewardsByGoalCode](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/PublicClaimUserRewardsByGoalCode.java) | [PublicClaimUserRewardsByGoalCode](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/PublicClaimUserRewardsByGoalCode.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/rewards` | GET | PublicGetUserRewards | [PublicGetUserRewards](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/PublicGetUserRewards.java) | [PublicGetUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/PublicGetUserRewards.java) |
| `/challenge/v1/public/namespaces/{namespace}/users/me/rewards/claim` | POST | PublicClaimUserRewards | [PublicClaimUserRewards](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/player_reward/PublicClaimUserRewards.java) | [PublicClaimUserRewards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/player_reward/PublicClaimUserRewards.java) |

### Challenge List Wrapper:  [ChallengeList](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/wrappers/ChallengeList.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/challenge/v1/public/namespaces/{namespace}/challenges` | GET | GetChallenges | [GetChallenges](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_list/GetChallenges.java) | [GetChallenges](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_list/GetChallenges.java) |
| `/challenge/v1/public/namespaces/{namespace}/challenges/{challengeCode}/goals` | GET | PublicGetScheduledGoals | [PublicGetScheduledGoals](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/operations/challenge_list/PublicGetScheduledGoals.java) | [PublicGetScheduledGoals](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/challenge/challenge_list/PublicGetScheduledGoals.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `iam.ErrorResponse` | [IamErrorResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/IamErrorResponse.java) |
| `iam.Permission` | [IamPermission](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/IamPermission.java) |
| `model.ChallengeReference` | [ModelChallengeReference](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelChallengeReference.java) |
| `model.ChallengeResponse` | [ModelChallengeResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelChallengeResponse.java) |
| `model.ClaimUserRewardsByGoalCodeRequest` | [ModelClaimUserRewardsByGoalCodeRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUserRewardsByGoalCodeRequest.java) |
| `model.ClaimUserRewardsReq` | [ModelClaimUserRewardsReq](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUserRewardsReq.java) |
| `model.ClaimUsersRewardsRequest` | [ModelClaimUsersRewardsRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUsersRewardsRequest.java) |
| `model.ClaimUsersRewardsResponse` | [ModelClaimUsersRewardsResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimUsersRewardsResponse.java) |
| `model.ClaimableUserReward` | [ModelClaimableUserReward](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelClaimableUserReward.java) |
| `model.CreateChallengeRequest` | [ModelCreateChallengeRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelCreateChallengeRequest.java) |
| `model.CreateGoalRequest` | [ModelCreateGoalRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelCreateGoalRequest.java) |
| `model.EvaluatePlayerProgressionRequest` | [ModelEvaluatePlayerProgressionRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelEvaluatePlayerProgressionRequest.java) |
| `model.GetGoalsResponse` | [ModelGetGoalsResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGetGoalsResponse.java) |
| `model.GoalInSchedulesResponse` | [ModelGoalInSchedulesResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalInSchedulesResponse.java) |
| `model.GoalMeta` | [ModelGoalMeta](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalMeta.java) |
| `model.GoalOrder` | [ModelGoalOrder](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalOrder.java) |
| `model.GoalProgressionResponse` | [ModelGoalProgressionResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalProgressionResponse.java) |
| `model.GoalResponse` | [ModelGoalResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalResponse.java) |
| `model.GoalSchedule` | [ModelGoalSchedule](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalSchedule.java) |
| `model.GoalScheduleRequest` | [ModelGoalScheduleRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelGoalScheduleRequest.java) |
| `model.ItemReference` | [ModelItemReference](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelItemReference.java) |
| `model.ItemReferenceResponse` | [ModelItemReferenceResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelItemReferenceResponse.java) |
| `model.ListChallengeResponse` | [ModelListChallengeResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListChallengeResponse.java) |
| `model.ListPeriodsResponse` | [ModelListPeriodsResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListPeriodsResponse.java) |
| `model.ListScheduleByGoalResponse` | [ModelListScheduleByGoalResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListScheduleByGoalResponse.java) |
| `model.ListSchedulesResponse` | [ModelListSchedulesResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListSchedulesResponse.java) |
| `model.ListUserRewardsResponse` | [ModelListUserRewardsResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelListUserRewardsResponse.java) |
| `model.Pagination` | [ModelPagination](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPagination.java) |
| `model.PluginAsignmentAppConfig` | [ModelPluginAsignmentAppConfig](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPluginAsignmentAppConfig.java) |
| `model.PluginAssignmentCustomConfig` | [ModelPluginAssignmentCustomConfig](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPluginAssignmentCustomConfig.java) |
| `model.PluginAssignmentRequest` | [ModelPluginAssignmentRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPluginAssignmentRequest.java) |
| `model.PluginAssignmentResponse` | [ModelPluginAssignmentResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPluginAssignmentResponse.java) |
| `model.Predicate` | [ModelPredicate](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelPredicate.java) |
| `model.Requirement` | [ModelRequirement](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelRequirement.java) |
| `model.RequirementProgressionResponse` | [ModelRequirementProgressionResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelRequirementProgressionResponse.java) |
| `model.ResetConfig` | [ModelResetConfig](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelResetConfig.java) |
| `model.Reward` | [ModelReward](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelReward.java) |
| `model.Schedule` | [ModelSchedule](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelSchedule.java) |
| `model.ScheduleByGoalResponse` | [ModelScheduleByGoalResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelScheduleByGoalResponse.java) |
| `model.ScheduleResponse` | [ModelScheduleResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelScheduleResponse.java) |
| `model.UpdateChallengeRequest` | [ModelUpdateChallengeRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUpdateChallengeRequest.java) |
| `model.UpdateChallengeScheduleRequest` | [ModelUpdateChallengeScheduleRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUpdateChallengeScheduleRequest.java) |
| `model.UpdateGoalRequest` | [ModelUpdateGoalRequest](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUpdateGoalRequest.java) |
| `model.UserProgressionPeriodResponseMeta` | [ModelUserProgressionPeriodResponseMeta](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserProgressionPeriodResponseMeta.java) |
| `model.UserProgressionResponse` | [ModelUserProgressionResponse](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserProgressionResponse.java) |
| `model.UserProgressionResponseMeta` | [ModelUserProgressionResponseMeta](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserProgressionResponseMeta.java) |
| `model.UserReward` | [ModelUserReward](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelUserReward.java) |
| `models.Period` | [ModelsPeriod](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ModelsPeriod.java) |
| `response.Error` | [ResponseError](../../module-challenge/src/main/java/net/accelbyte/sdk/api/challenge/models/ResponseError.java) |

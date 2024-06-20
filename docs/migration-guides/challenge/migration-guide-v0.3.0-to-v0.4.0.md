<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-20

### BREAKING CHANGE


### Challenge
The following models have been updated:
- Model `net.accelbyte.sdk.api.challenge.models.ModelsUpdateChallengeRequest` is now renamed into `ModelUpdateChallengeRequest`
- Model `net.accelbyte.sdk.api.challenge.models.ModelUpdateGoalRequest` have existing fields now marked as `NON_NULL`:
    - `description`
    - `requirementGroups`
    - `rewards`
    - `tags`
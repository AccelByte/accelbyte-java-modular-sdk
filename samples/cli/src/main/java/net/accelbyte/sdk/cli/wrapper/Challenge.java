/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.challenge.challenge_configuration.*;
import net.accelbyte.sdk.cli.api.challenge.utilities.*;
import net.accelbyte.sdk.cli.api.challenge.goal_configuration.*;
import net.accelbyte.sdk.cli.api.challenge.schedules.*;
import net.accelbyte.sdk.cli.api.challenge.plugins.*;
import net.accelbyte.sdk.cli.api.challenge.challenge_progression.*;
import net.accelbyte.sdk.cli.api.challenge.player_reward.*;
import net.accelbyte.sdk.cli.api.challenge.challenge_list.*;

import picocli.CommandLine.Command;

@Command(name = "challenge",
        mixinStandardHelpOptions = true,
        subcommands = {
                AdminGetChallenges.class,
                AdminCreateChallenge.class,
                AdminGetItemReferences.class,
                AdminGetActiveChallenges.class,
                AdminGetChallenge.class,
                AdminUpdateChallenge.class,
                AdminDeleteChallenge.class,
                AdminGetGoals.class,
                AdminCreateGoal.class,
                AdminGetGoal.class,
                AdminUpdateGoals.class,
                AdminDeleteGoal.class,
                AdminListSchedulesByGoal.class,
                AdminGetPeriods.class,
                AdminRandomizeChallenge.class,
                AdminListSchedules.class,
                AdminDeleteTiedChallenge.class,
                AdminUpdateTiedChallengeSchedule.class,
                AdminGetAssignmentPlugin.class,
                AdminUpdateAssignmentPlugin.class,
                AdminCreateAssignmentPlugin.class,
                AdminDeleteAssignmentPlugin.class,
                AdminEvaluateProgress.class,
                AdminClaimUsersRewards.class,
                AdminClaimUserRewardsByGoalCode.class,
                AdminGetUserProgression.class,
                AdminGetUserRewards.class,
                AdminClaimUserRewards.class,
                GetChallenges.class,
                PublicGetScheduledGoals.class,
                PublicListSchedulesByGoal.class,
                PublicListSchedules.class,
                PublicClaimUserRewardsByGoalCode.class,
                EvaluateMyProgress.class,
                PublicGetUserProgression.class,
                PublicGetPastUserProgression.class,
                PublicGetUserRewards.class,
                PublicClaimUserRewards.class,
        }
)
public class Challenge implements Runnable {

    @Override
    public void run() {

    }
}
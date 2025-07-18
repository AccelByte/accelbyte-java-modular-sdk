/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.match2.operations.*;
import net.accelbyte.sdk.cli.api.match2.config.*;
import net.accelbyte.sdk.cli.api.match2.play_feature_flag.*;
import net.accelbyte.sdk.cli.api.match2.environment_variables.*;
import net.accelbyte.sdk.cli.api.match2.backfill.*;
import net.accelbyte.sdk.cli.api.match2.match_functions.*;
import net.accelbyte.sdk.cli.api.match2.match_pools.*;
import net.accelbyte.sdk.cli.api.match2.match_tickets.*;
import net.accelbyte.sdk.cli.api.match2.rule_sets.*;

import picocli.CommandLine.Command;

@Command(name = "match2",
        mixinStandardHelpOptions = true,
        subcommands = {
                GetHealthcheckInfo.class,
                GetHealthcheckInfoV1.class,
                AdminGetLogConfig.class,
                AdminPatchUpdateLogConfig.class,
                AdminGetPlayFeatureFlag.class,
                AdminUpsertPlayFeatureFlag.class,
                AdminDeletePlayFeatureFlag.class,
                AdminGetAllConfigV1.class,
                AdminGetConfigV1.class,
                AdminPatchConfigV1.class,
                EnvironmentVariableList.class,
                AdminQueryBackfill.class,
                CreateBackfill.class,
                GetBackfillProposal.class,
                GetBackfill.class,
                DeleteBackfill.class,
                AcceptBackfill.class,
                RejectBackfill.class,
                MatchFunctionList.class,
                CreateMatchFunction.class,
                MatchFunctionGet.class,
                UpdateMatchFunction.class,
                DeleteMatchFunction.class,
                MatchPoolList.class,
                CreateMatchPool.class,
                MatchPoolDetails.class,
                UpdateMatchPool.class,
                DeleteMatchPool.class,
                MatchPoolMetric.class,
                PostMatchErrorMetric.class,
                GetPlayerMetric.class,
                AdminGetMatchPoolTickets.class,
                CreateMatchTicket.class,
                GetMyMatchTickets.class,
                MatchTicketDetails.class,
                DeleteMatchTicket.class,
                RuleSetList.class,
                CreateRuleSet.class,
                RuleSetDetails.class,
                UpdateRuleSet.class,
                DeleteRuleSet.class,
                PublicGetPlayerMetric.class,
                VersionCheckHandler.class,
        }
)
public class Match2 implements Runnable {

    @Override
    public void run() {

    }
}
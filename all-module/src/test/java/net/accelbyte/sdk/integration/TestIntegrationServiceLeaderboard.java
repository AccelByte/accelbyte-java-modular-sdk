/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import net.accelbyte.sdk.api.leaderboard.models.ModelsDailyConfig;
import net.accelbyte.sdk.api.leaderboard.models.ModelsGetLeaderboardConfigResp;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsMonthlyConfig;
import net.accelbyte.sdk.api.leaderboard.models.ModelsUpdateLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsWeeklyConfig;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.CreateLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.DeleteLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.GetLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.UpdateLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
import net.accelbyte.sdk.api.social.models.StatCreate;
import net.accelbyte.sdk.api.social.models.StatInfo;
import net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.DeleteStat;
import net.accelbyte.sdk.api.social.wrappers.StatConfiguration;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceLeaderboard extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String leaderboardName = "Java Server SDK Integration Test";
    final String leaderboardCode =
        "javasdklbtest" + java.util.UUID.randomUUID().toString().substring(0, 6);
    final String startTime =
        Instant.now()
            .plus(31, ChronoUnit.DAYS)
            .atZone(ZoneId.systemDefault())
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSxxx"));

    // Setup requirement to use leaderboard, by setting up Stat Configuration in Social
    final StatConfiguration statConfiguration = new StatConfiguration(sdk);
    final StatCreate statCreate =
        StatCreate.builder()
            .defaultValue(1.0f)
            .setBy("SERVER")
            .name(leaderboardName)
            .statCode(leaderboardCode)
            .build();
    final CreateStat createStatReq =
        CreateStat.builder().namespace(namespace).body(statCreate).build();
    StatInfo createStateResult = statConfiguration.createStat(createStatReq).ensureSuccess();

    assertNotNull(createStateResult);
    assertEquals(leaderboardCode, createStateResult.getStatCode());

    final LeaderboardConfiguration leaderboardConfigWrapper = new LeaderboardConfiguration(sdk);

    // CASE Create a leaderboard

    final ModelsLeaderboardConfigReq createLeaderboardBody =
        ModelsLeaderboardConfigReq.builder()
            .leaderboardCode(leaderboardCode)
            .name(leaderboardName)
            .statCode(leaderboardCode)
            .seasonPeriod(36)
            .descending(false)
            .startTime(startTime)
            .daily(ModelsDailyConfig.builder().resetTime("00:00:00").build())
            .weekly(ModelsWeeklyConfig.builder().resetDay(0).resetTime("00:00:00").build())
            .monthly(ModelsMonthlyConfig.builder().resetDate(1).resetTime("00:00:00").build())
            .build();

    final ModelsLeaderboardConfigReq createLeaderboardResult =
        leaderboardConfigWrapper
            .createLeaderboardConfigurationAdminV1(
                CreateLeaderboardConfigurationAdminV1.builder()
                    .namespace(this.namespace)
                    .body(createLeaderboardBody)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(createLeaderboardResult);
    assertEquals(leaderboardName, createLeaderboardResult.getName());

    // CASE Get a leaderboard

    final ModelsGetLeaderboardConfigResp getLeaderboardResult =
        leaderboardConfigWrapper
            .getLeaderboardConfigurationAdminV1(
                GetLeaderboardConfigurationAdminV1.builder()
                    .namespace(this.namespace)
                    .leaderboardCode(leaderboardCode)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(getLeaderboardResult);
    assertEquals(leaderboardName, getLeaderboardResult.getName());

    // CASE Update a leaderboard

    final ModelsUpdateLeaderboardConfigReq updateLeaderboardBody =
        ModelsUpdateLeaderboardConfigReq.builder()
            .name(leaderboardName)
            .statCode(leaderboardCode)
            .startTime(startTime)
            .seasonPeriod(40)
            .build();

    final ModelsGetLeaderboardConfigResp updateLeaderboardResult =
        leaderboardConfigWrapper
            .updateLeaderboardConfigurationAdminV1(
                UpdateLeaderboardConfigurationAdminV1.builder()
                    .namespace(this.namespace)
                    .leaderboardCode(leaderboardCode)
                    .body(updateLeaderboardBody)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(updateLeaderboardResult);
    assertEquals(40, updateLeaderboardResult.getSeasonPeriod());

    // CASE Delete a leaderboard

    leaderboardConfigWrapper.deleteLeaderboardConfigurationAdminV1(
        DeleteLeaderboardConfigurationAdminV1.builder()
            .namespace(this.namespace)
            .leaderboardCode(leaderboardCode)
            .build());

    // ESAC

    // Confirm if leaderboard is deleted

    final ModelsGetLeaderboardConfigResp getLeaderboardConfirmResult =
        leaderboardConfigWrapper
            .getLeaderboardConfigurationAdminV1(
                GetLeaderboardConfigurationAdminV1.builder()
                    .namespace(this.namespace)
                    .leaderboardCode(leaderboardCode)
                    .build())
            .ensureSuccess();

    assertNotNull(getLeaderboardConfirmResult);
    assertTrue(getLeaderboardConfirmResult.getIsDeleted());

    // Clean up stat configuration
    final DeleteStat deleteStat =
        DeleteStat.builder().namespace(this.namespace).statCode(leaderboardCode).build();
    statConfiguration.deleteStat(deleteStat);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

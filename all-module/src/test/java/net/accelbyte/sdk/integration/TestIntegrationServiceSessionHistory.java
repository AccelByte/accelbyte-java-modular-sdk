/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsGameSessionDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsMatchmakingDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsPartyDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsXRayMatchMatchmakingQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryGameSessionDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryMatchmakingDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryPartyDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.x_ray.QueryTotalMatchmakingMatch;
import net.accelbyte.sdk.api.sessionhistory.wrappers.GameSessionDetail;
import net.accelbyte.sdk.api.sessionhistory.wrappers.XRay;

import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceSessionHistory extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  public void GameSessionTests() throws Exception {
    final String endDate =
        Instant.now()
          .plus(31, ChronoUnit.DAYS)
          .atZone(ZoneId.systemDefault())
          .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'"));
        
    final String startDate =
        Instant.now()
            .atZone(ZoneId.systemDefault())
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'"));

    final GameSessionDetail gameSessionDetailWrapper = new GameSessionDetail(sdk);
    final XRay xRayWrapper = new XRay(sdk);

    // CASE Get all game sessions history
    final AdminQueryGameSessionDetail adminQueryGameSessionDetail =
        AdminQueryGameSessionDetail.builder().namespace(this.namespace).offset(0).limit(20).build();

    ApimodelsGameSessionDetailQueryResponse gameSessionHistoryResp =
        gameSessionDetailWrapper.adminQueryGameSessionDetail(adminQueryGameSessionDetail).ensureSuccess();
    assertNotNull(gameSessionHistoryResp);

    // ESAC

    if ((gameSessionHistoryResp != null) && (gameSessionHistoryResp.getData() != null)) {
      assertTrue(gameSessionHistoryResp.getData().size() >= 0);
    }

    // CASE Get all matchmaking history

    final AdminQueryMatchmakingDetail adminQueryMatchmakingDetail =
        AdminQueryMatchmakingDetail.builder().namespace(this.namespace).offset(0).limit(20).build();

    ApimodelsMatchmakingDetailQueryResponse matchMakingHistoryResp =
        gameSessionDetailWrapper.adminQueryMatchmakingDetail(adminQueryMatchmakingDetail).ensureSuccess();
    assertNotNull(matchMakingHistoryResp);

    // ESAC

    if ((matchMakingHistoryResp != null) && (matchMakingHistoryResp.getData() != null)) {
      assertTrue(matchMakingHistoryResp.getData().size() >= 0);
    }

    // CASE Query party detail

    final AdminQueryPartyDetail adminQueryPartyDetail =
        AdminQueryPartyDetail.builder().namespace(this.namespace).build();

    ApimodelsPartyDetailQueryResponse adminQueryPartyDetailResp =
        gameSessionDetailWrapper.adminQueryPartyDetail(adminQueryPartyDetail).ensureSuccess();
    assertNotNull(adminQueryPartyDetailResp);

    // ESAC

    if ((adminQueryPartyDetailResp != null) && (adminQueryPartyDetailResp.getData() != null)) {
      assertTrue(adminQueryPartyDetailResp.getData().size() >= 0);
    }

    // CASE Get all total matchmaking match
    ApimodelsXRayMatchMatchmakingQueryResponse queryTotalMatchmakingMatchResp =
        xRayWrapper.queryTotalMatchmakingMatch(QueryTotalMatchmakingMatch.builder()
          .namespace(this.namespace)
          .endDate(endDate)
          .startDate(startDate)
        .build()).ensureSuccess();
    assertNotNull(queryTotalMatchmakingMatchResp);

    // ESAC

    if ((queryTotalMatchmakingMatchResp != null) && (queryTotalMatchmakingMatchResp.getData() != null)) {
      assertTrue(queryTotalMatchmakingMatchResp.getData().size() >= 0);
    }


  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

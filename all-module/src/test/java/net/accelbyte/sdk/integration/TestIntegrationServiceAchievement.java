/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementRequest;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementResponse;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementUpdateRequest;
import net.accelbyte.sdk.api.achievement.models.ModelsIcon;
import net.accelbyte.sdk.api.achievement.models.ModelsPaginatedAchievementResponse;
import net.accelbyte.sdk.api.achievement.operations.achievements.*;
import net.accelbyte.sdk.api.achievement.wrappers.Achievements;
import net.accelbyte.sdk.core.ApiResponseException;
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
public class TestIntegrationServiceAchievement extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String achievementCode = "java-server-sdk-integration-test";
    final String achievementName = "Java Server SDK Integration Test";
    final String achievementDescription = "This is a test";
    final String achievementLanguage = "en";
    final String lockedIconUrl =
        "https://cdn.demo.accelbyte.io/files/accelbyte/achievements/50000f325ef841a6972a005779e20991.png";
    final String unlockedIconUrl =
        "https://cdn.demo.accelbyte.io/files/accelbyte/achievements/fe89fd07102f4057be202fbd3fdd9a21.png";

    final Achievements achievementsWrapper = new Achievements(sdk);

    // CASE Create an achievement

    final ModelsAchievementRequest createAchievementBody =
        ModelsAchievementRequest.builder()
            .achievementCode(achievementCode)
            .defaultLanguage(achievementLanguage)
            .name(Collections.singletonMap(achievementLanguage, achievementName))
            .description(Collections.singletonMap(achievementLanguage, achievementDescription))
            .goalValue(1000f)
            .statCode(achievementCode)
            .hidden(true)
            .incremental(false)
            .lockedIcons(
                Arrays.asList(
                    new ModelsIcon[] {
                      ModelsIcon.builder().slug("shield-locked").url(lockedIconUrl).build()
                    }))
            .unlockedIcons(
                Arrays.asList(
                    new ModelsIcon[] {
                      ModelsIcon.builder().slug("shield-unlocked").url(unlockedIconUrl).build()
                    }))
            .tags(Arrays.asList(new String[] {"java", "server", "sdk", "integration", "test"}))
            .build();

    final ModelsAchievementResponse createAchievementResult =
        achievementsWrapper
            .adminCreateNewAchievement(
                AdminCreateNewAchievement.builder()
                    .namespace(this.namespace)
                    .body(createAchievementBody)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(createAchievementResult);
    assertEquals(createAchievementResult.getAchievementCode(), achievementCode);

    // CASE Update an achievement

    final ModelsAchievementUpdateRequest updateAchievementBody =
        ModelsAchievementUpdateRequest.builder()
            .name(Collections.singletonMap(achievementLanguage, achievementName))
            .description(Collections.singletonMap(achievementLanguage, achievementDescription))
            .goalValue(2000f)
            .build();

    final ModelsAchievementResponse updateAchievementResult =
        achievementsWrapper
            .adminUpdateAchievement(
                AdminUpdateAchievement.builder()
                    .namespace(this.namespace)
                    .achievementCode(achievementCode)
                    .body(updateAchievementBody)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(updateAchievementResult);
    assertEquals(updateAchievementResult.getGoalValue(), 2000f);

    // CASE Get an achievement by achievement code

    final ModelsAchievementResponse getAchievementResult =
        achievementsWrapper
            .adminGetAchievement(
                AdminGetAchievement.builder()
                    .namespace(this.namespace)
                    .achievementCode(achievementCode)
                    .build())
            .ensureSuccess();

    assertNotNull(getAchievementResult);
    assertEquals(getAchievementResult.getGoalValue(), 2000f);
    assertEquals(getAchievementResult.getName().get(achievementLanguage), achievementName);

    // ESAC

    // CASE Export achievement

    final File exportAchievementFile = new File("export-store.zip");

    if (exportAchievementFile.exists()) {
      exportAchievementFile.delete();
    }

    exportAchievementFile.deleteOnExit();

    final InputStream exportAchievementsResult =
        achievementsWrapper
            .exportAchievements(ExportAchievements.builder().namespace(this.namespace).build())
            .ensureSuccess();
    java.nio.file.Files.copy(
        exportAchievementsResult,
        exportAchievementFile.toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    org.apache.commons.io.IOUtils.closeQuietly(exportAchievementsResult);

    // ESAC

    assertTrue(exportAchievementFile.exists());
    assertTrue(Files.size(exportAchievementFile.toPath()) > 0);

    // CASE Get a list of achievements

    final ModelsPaginatedAchievementResponse getAchievementListResult =
        achievementsWrapper
            .adminListAchievements(
                AdminListAchievements.builder()
                    .namespace(this.namespace)
                    .limit(100)
                    .offset(0)
                    .build())
            .ensureSuccess();

    assertNotNull(getAchievementListResult);
    assertTrue(getAchievementListResult.getData().size() > 0);

    // ESAC

    // CASE Delete an achievement

    achievementsWrapper
        .adminDeleteAchievement(
            AdminDeleteAchievement.builder()
                .namespace(this.namespace)
                .achievementCode(achievementCode)
                .build())
        .ensureSuccess();

    // ESAC

    // Confirm if achievement is deleted

    assertThrows(
        ApiResponseException.class,
        () -> {
          achievementsWrapper
              .adminGetAchievement(
                  AdminGetAchievement.builder()
                      .namespace(this.namespace)
                      .achievementCode(achievementCode)
                      .build())
              .ensureSuccess();
        });
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

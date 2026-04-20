/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.core.AccessTokenPayload.Types.Permission;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class StaticTestTokenValidationTest {

  private StaticTestTokenValidator validator;

  @BeforeAll
  public void setup() {
    validator = new StaticTestTokenValidator();
  }

  @Test
  public void testGameNamespaceExactMatch() {
    List<Permission> permissions =
        Arrays.asList(
            Permission.builder()
                .resource(
                    "NAMESPACE:" + StaticTestTokenValidator.GAME_NAMESPACE + ":CLOUDSAVE:RECORD")
                .action(2)
                .build());

    boolean result =
        validator.testValidateResource(
            permissions,
            "NAMESPACE:" + StaticTestTokenValidator.GAME_NAMESPACE + ":CLOUDSAVE:RECORD",
            2);

    assertTrue(result);
  }

  @Test
  public void testStudioNamespaceWithTrailingDash() {
    List<Permission> permissions =
        Arrays.asList(
            Permission.builder()
                .resource(
                    "NAMESPACE:"
                        + StaticTestTokenValidator.STUDIO_NAMESPACE
                        + "-:CLOUDSAVE:RECORD")
                .action(2)
                .build());

    boolean result =
        validator.testValidateResource(
            permissions,
            "NAMESPACE:" + StaticTestTokenValidator.GAME_NAMESPACE + ":CLOUDSAVE:RECORD",
            2);

    assertTrue(result);
  }

  @Test
  public void testDifferentGameNamespace() {
    List<Permission> permissions =
        Arrays.asList(
            Permission.builder()
                .resource(
                    "NAMESPACE:"
                        + StaticTestTokenValidator.STUDIO_NAMESPACE
                        + "-:CLOUDSAVE:RECORD")
                .action(2)
                .build());

    boolean result =
        validator.testValidateResource(
            permissions, "NAMESPACE:other-studio-game:CLOUDSAVE:RECORD", 2);

    assertFalse(result);
  }

  @Test
  public void testDifferentStudioNamespace() {
    List<Permission> permissions =
        Arrays.asList(
            Permission.builder()
                .resource(
                    "NAMESPACE:"
                        + StaticTestTokenValidator.STUDIO_NAMESPACE
                        + "-:CLOUDSAVE:RECORD")
                .action(2)
                .build());

    boolean result =
        validator.testValidateResource(
            permissions, "NAMESPACE:diffstudio-game:CLOUDSAVE:RECORD", 2);

    assertFalse(result);
  }
}

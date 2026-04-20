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

  // [FEEDBACK-HIGH] Exercises the cache-rejection branch: the requested namespace IS present in
  // the namespace context cache (so no exception is thrown) but its studioNamespace belongs to a
  // different studio, so isResourceElementMatch must return false. The previous tests
  // (testDifferentGameNamespace / testDifferentStudioNamespace) only covered the case where the
  // namespace is absent from the cache (exception path), not this found-but-wrong-studio path.
  @Test
  public void testCrossStudioNamespaceRejectedViaCacheLookup() {
    List<Permission> permissions =
        Arrays.asList(
            Permission.builder()
                .resource(
                    "NAMESPACE:"
                        + StaticTestTokenValidator.STUDIO_NAMESPACE
                        + "-:CLOUDSAVE:RECORD")
                .action(2)
                .build());

    // CROSS_STUDIO_GAME_NAMESPACE starts with STUDIO_NAMESPACE + "-" (prefix check passes)
    // but its studioNamespace in the cache is CROSS_STUDIO_NAMESPACE, not STUDIO_NAMESPACE.
    boolean result =
        validator.testValidateResource(
            permissions,
            "NAMESPACE:" + StaticTestTokenValidator.CROSS_STUDIO_GAME_NAMESPACE + ":CLOUDSAVE:RECORD",
            2);

    assertFalse(result);
  }
}

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

import java.util.Map;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsPlayerRecordResponse;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.DeleteGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.GetGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PostGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PutGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.DeletePlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.GetPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.PostPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.PutPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicGameRecord;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicPlayerRecord;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.core.ApiResponseException;
import net.accelbyte.sdk.core.DummyGameRecord;
import net.accelbyte.sdk.core.DummyPlayerRecord;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceCloudSave extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String gameRecordKey = "foo_bar_record";
    final String gameRecordFoo = "bar";
    final String gameRecordFooBar = "foo";
    final String gameRecordFooBarUpdate = "foo_update";
    final int gameRecordFooValue = 4893;

    final PublicGameRecord publicGameRecordWrapper = new PublicGameRecord(sdk);

    // CASE Create a game record

    final DummyGameRecord createGameRecordBody =
        DummyGameRecord.builder()
            .Foo(gameRecordFoo)
            .FooBar(gameRecordFooBar)
            .FooValue(gameRecordFooValue)
            .build();

    publicGameRecordWrapper.postGameRecordHandlerV1(
        PostGameRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(gameRecordKey)
            .body(createGameRecordBody)
            .build());

    // ESAC

    // CASE Get a game record

    final ModelsGameRecordResponse getGameRecordResult =
        publicGameRecordWrapper
            .getGameRecordHandlerV1(
                GetGameRecordHandlerV1.builder()
                    .namespace(this.namespace)
                    .key(gameRecordKey)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(getGameRecordResult);

    final Map<String, ?> gameRecordValue1 = getGameRecordResult.getValue();

    assertNotNull(gameRecordValue1);
    assertTrue(gameRecordValue1.containsKey("foo_bar"));
    assertEquals(gameRecordFooBar, gameRecordValue1.get("foo_bar").toString());

    // CASE Update a game record

    DummyGameRecord updateRecord =
        DummyGameRecord.builder()
            .Foo(gameRecordFoo)
            .FooBar(gameRecordFooBarUpdate)
            .FooValue(gameRecordFooValue)
            .build();

    publicGameRecordWrapper.putGameRecordHandlerV1(
        PutGameRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(gameRecordKey)
            .body(updateRecord)
            .build());

    // ESAC

    // Confirm if game record is updated

    final ModelsGameRecordResponse getGameRecordConfirmResult =
        publicGameRecordWrapper
            .getGameRecordHandlerV1(
                GetGameRecordHandlerV1.builder()
                    .namespace(this.namespace)
                    .key(gameRecordKey)
                    .build())
            .ensureSuccess();

    assertNotNull(getGameRecordConfirmResult);
    final Map<String, ?> gameRecordValue2 = getGameRecordConfirmResult.getValue();
    assertNotNull(gameRecordValue2);
    assertTrue(gameRecordValue2.containsKey("foo"));
    assertEquals(gameRecordFoo, gameRecordValue2.get("foo").toString());
    assertTrue(gameRecordValue2.containsKey("foo_bar"));
    assertEquals(gameRecordFooBarUpdate, gameRecordValue2.get("foo_bar").toString());

    // CASE Delete a game record

    publicGameRecordWrapper
        .deleteGameRecordHandlerV1(
            DeleteGameRecordHandlerV1.builder()
                .namespace(this.namespace)
                .key(gameRecordKey)
                .build())
        .ensureSuccess();

    // ESAC

    // Confirm if game record is deleted

    assertThrows(
        ApiResponseException.class,
        () -> {
          publicGameRecordWrapper
              .getGameRecordHandlerV1(
                  GetGameRecordHandlerV1.builder()
                      .namespace(this.namespace)
                      .key(gameRecordKey)
                      .build())
              .ensureSuccess();
        });
  }

  @Test
  @Order(1)
  public void testPlayerRecord() throws Exception {
    final String playerRecordKey = "foo_bar_record";
    final String playerRecordFoo = "bar";
    final String playerRecordFooBar = "foo";
    final String playerRecordFooBarUpdate = "foo_update";
    final int playerRecordFooValue = 4893;

    final PublicPlayerRecord publicPlayerRecordWrapper = new PublicPlayerRecord(sdk);

    final Users usersWrapper = new Users(sdk);

    final ModelUserResponseV3 getUserResult =
        usersWrapper.adminGetMyUserV3(AdminGetMyUserV3.builder().build()).ensureSuccess();

    assertNotNull(getUserResult);

    final String userId = getUserResult.getUserId();

    // CASE Create a player record

    final DummyPlayerRecord createPlayerRecordBody =
        DummyPlayerRecord.builder()
            .Foo(playerRecordFoo)
            .FooBar(playerRecordFooBar)
            .FooValue(playerRecordFooValue)
            .build();

    publicPlayerRecordWrapper.postPlayerRecordHandlerV1(
        PostPlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(playerRecordKey)
            .body(createPlayerRecordBody)
            .userId(userId)
            .build());

    // ESAC

    // CASE Get a player record

    final ModelsPlayerRecordResponse getPlayerRecordResult =
        publicPlayerRecordWrapper
            .getPlayerRecordHandlerV1(
                GetPlayerRecordHandlerV1.builder()
                    .namespace(this.namespace)
                    .key(playerRecordKey)
                    .userId(userId)
                    .build())
            .ensureSuccess();

    // ESAC

    assertNotNull(getPlayerRecordResult);

    final Map<String, ?> playerRecordValue1 = getPlayerRecordResult.getValue();

    assertNotNull(playerRecordValue1);
    assertTrue(playerRecordValue1.containsKey("foo_bar"));
    assertEquals(playerRecordFooBar, playerRecordValue1.get("foo_bar").toString());

    // CASE Update a player record

    DummyPlayerRecord updatePlayerRecord =
        DummyPlayerRecord.builder()
            .Foo(playerRecordFoo)
            .FooBar(playerRecordFooBarUpdate)
            .FooValue(playerRecordFooValue)
            .build();

    publicPlayerRecordWrapper.putPlayerRecordHandlerV1(
        PutPlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(playerRecordKey)
            .body(updatePlayerRecord)
            .userId(userId)
            .build());

    // ESAC

    // CASE Delete a player record

    publicPlayerRecordWrapper.deletePlayerRecordHandlerV1(
        DeletePlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(playerRecordKey)
            .userId(userId)
            .build());

    // ESAC

  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

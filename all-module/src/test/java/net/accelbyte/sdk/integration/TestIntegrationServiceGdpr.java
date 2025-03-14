/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval.PublicGetUserPersonalDataRequestsOpResponse;
import net.accelbyte.sdk.api.gdpr.operations.configuration.DeleteAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.configuration.GetAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.configuration.SaveAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.configuration.UpdateAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.PublicGetUserPersonalDataRequests;
import net.accelbyte.sdk.api.gdpr.wrappers.Configuration;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrieval;
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
public class TestIntegrationServiceGdpr extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final String email1 = "email1@example.com";
    final String email2 = "email2@dummy.com";

    final Configuration configurationWrapper = new Configuration(sdk);
    final DataRetrieval dataRetrievalWrapper = new DataRetrieval(sdk);

    // CASE Get user personal data request

    final PublicGetUserPersonalDataRequestsOpResponse getUserPersonalData =
        dataRetrievalWrapper.publicGetUserPersonalDataRequests(
            PublicGetUserPersonalDataRequests.builder()
                .namespace(this.namespace)
                .userId(this.username)
                .build());

    // ESAC

    assertNotNull(getUserPersonalData);

    // CASE Save admin email configuration

    configurationWrapper.saveAdminEmailConfiguration(
        SaveAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .body(Arrays.asList(new String[] {email1}))
            .build());

    // ESAC

    // CASE Get admin email configuration

    final List<String> emails =
        configurationWrapper
            .getAdminEmailConfiguration(
                GetAdminEmailConfiguration.builder().namespace(this.namespace).build())
            .ensureSuccess();

    // ESAC

    assertNotNull(emails);

    // CASE Update admin email configuration

    configurationWrapper.updateAdminEmailConfiguration(
        UpdateAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .body(Arrays.asList(new String[] {email2}))
            .build());

    // ESAC

    // CASE Delete admin email configuration

    configurationWrapper.deleteAdminEmailConfiguration(
        DeleteAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .emails(Arrays.asList(new String[] {email2}))
            .build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementResponse;
import net.accelbyte.sdk.api.legal.models.CreateBasePolicyRequest;
import net.accelbyte.sdk.api.legal.models.CreateBasePolicyResponse;
import net.accelbyte.sdk.api.legal.models.CreatePolicyVersionRequest;
import net.accelbyte.sdk.api.legal.models.CreatePolicyVersionResponse;
import net.accelbyte.sdk.api.legal.models.RetrieveAcceptedAgreementResponse;
import net.accelbyte.sdk.api.legal.operations.agreement.BulkAcceptVersionedPolicy;
import net.accelbyte.sdk.api.legal.operations.agreement.ChangePreferenceConsent;
import net.accelbyte.sdk.api.legal.operations.agreement.RetrieveAgreementsPublic;
import net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldCreatePolicy;
import net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.CreatePolicy;
import net.accelbyte.sdk.api.legal.operations.policy_versions.OldCreatePolicyVersion;
import net.accelbyte.sdk.api.legal.wrappers.Agreement;
import net.accelbyte.sdk.api.legal.wrappers.BaseLegalPolicies;
import net.accelbyte.sdk.api.legal.wrappers.PolicyVersions;
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
public class TestIntegrationServiceLegal extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final Agreement agreementWrapper = new Agreement(sdk);
    final BaseLegalPolicies baseLegalWrapper = new BaseLegalPolicies(sdk);
    final PolicyVersions policyVersionsWrapper = new PolicyVersions(sdk);

    final String basePolicyName = "Java SDK Policy Test";
    final String basePolicyDesc = "Java SDK Policy";

    // CASE Get agreements

    final List<RetrieveAcceptedAgreementResponse> agreements =
            agreementWrapper
                    .retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build())
                    .ensureSuccess();

    // ESAC

    assertNotNull(agreements);

    // CASE Retrieved aggreement

    final List<RetrieveAcceptedAgreementResponse> retrievedAgreement =
            agreementWrapper
                    .retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build())
                    .ensureSuccess();

    // ESAC

    assertNotNull(retrievedAgreement);

    if (!retrievedAgreement.isEmpty()) {
      // Create the AcceptAgreementRequest using the first element
      final List<AcceptAgreementRequest> bodyLegal =
              Collections.singletonList(
                      AcceptAgreementRequest.builder()
                              .policyId(retrievedAgreement.get(0).getPolicyId())
                              .policyVersionId(retrievedAgreement.get(0).getPolicyId())
                              .localizedPolicyVersionId(
                                      retrievedAgreement.get(0).getLocalizedPolicyVersion().toString())
                              .build());

      // CASE Bulk accept versioned policy

      final AcceptAgreementResponse bulkAcceptAgreement =
              agreementWrapper
                      .bulkAcceptVersionedPolicy(
                              BulkAcceptVersionedPolicy.builder().body(bodyLegal).build())
                      .ensureSuccess();

      // ESAC

      assertNotNull(bulkAcceptAgreement);

      // CASE Create policy

      final CreateBasePolicyResponse createPolicy =
              baseLegalWrapper
                      .oldCreatePolicy(
                              OldCreatePolicy.builder()
                                      .body(
                                              CreateBasePolicyRequest.builder()
                                                      .basePolicyName(basePolicyName)
                                                      .isHidden(false)
                                                      .isHiddenPublic(false)
                                                      .namespace(this.namespace)
                                                      .typeId("")
                                                      .description(basePolicyDesc)
                                                      .tags(Arrays.asList(new String[] {"java", "sdk", "test"}))
                                                      .affectedCountries(Arrays.asList(new String[] {""}))
                                                      .affectedClientIds(Arrays.asList(new String[] {"ID"}))
                                                      .build())
                                      .build())
                      .ensureSuccess();

      // ESAC

      assertNotNull(createPolicy);

      // CASE Create policy version

      final CreatePolicyVersionResponse createPolicyVersions =
              policyVersionsWrapper
                      .oldCreatePolicyVersion(
                              OldCreatePolicyVersion.builder()
                                      .body(
                                              CreatePolicyVersionRequest.builder()
                                                      .description(basePolicyDesc)
                                                      .displayVersion("1")
                                                      .isCommitted(false)
                                                      .build())
                                      .policyId(createPolicy.getPolicyId())
                                      .build())
                      .ensureSuccess();

      // ESAC

      assertNotNull(createPolicyVersions);

      // CASE Change preference consent

      agreementWrapper
              .changePreferenceConsent(
                      ChangePreferenceConsent.builder()
                              .body(bodyLegal)
                              .namespace(this.namespace)
                              .userId(this.username)
                              .build())
              .ensureSuccess();

      // ESAC
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

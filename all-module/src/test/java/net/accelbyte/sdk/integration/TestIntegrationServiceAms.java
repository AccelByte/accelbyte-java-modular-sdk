package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import net.accelbyte.sdk.api.ams.models.ApiAMSRegionsResponse;
import net.accelbyte.sdk.api.ams.models.ApiDSHostConfigurationParameters;
import net.accelbyte.sdk.api.ams.models.ApiFleetGetResponse;
import net.accelbyte.sdk.api.ams.models.ApiFleetParameters;
import net.accelbyte.sdk.api.ams.models.ApiImageDeploymentProfile;
import net.accelbyte.sdk.api.ams.models.ApiImageList;
import net.accelbyte.sdk.api.ams.models.ApiInstanceTypesForNamespaceResponse;
import net.accelbyte.sdk.api.ams.models.ApiRegionConfig;
import net.accelbyte.sdk.api.ams.operation_responses.fleets.FleetCreateOpResponse;
import net.accelbyte.sdk.api.ams.operations.ams_info.InfoRegions;
import net.accelbyte.sdk.api.ams.operations.ams_info.InfoSupportedInstances;
import net.accelbyte.sdk.api.ams.operations.fleets.FleetCreate;
import net.accelbyte.sdk.api.ams.operations.fleets.FleetDelete;
import net.accelbyte.sdk.api.ams.operations.fleets.FleetGet;
import net.accelbyte.sdk.api.ams.operations.fleets.FleetUpdate;
import net.accelbyte.sdk.api.ams.operations.images.ImageList;
import net.accelbyte.sdk.api.ams.wrappers.AMSInfo;
import net.accelbyte.sdk.api.ams.wrappers.Fleets;
import net.accelbyte.sdk.api.ams.wrappers.Images;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceAms extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final AMSInfo amsInfoWrapper = new AMSInfo(sdk);
    final Images imagesWrapper = new Images(sdk);
    final Fleets fleetsWrapper = new Fleets(sdk);

    final String nameFleet = "JavaSDKFleet";
    final String regionFleet = "us-west-1";
    String imageIdFleet = "";
    String instanceIdFleet = "";

    // CASE Image list

    final ApiImageList imageList =
        imagesWrapper
            .imageList(ImageList.builder().namespace(this.namespace).build())
            .ensureSuccess();

    // ESAC

    assertNotNull(imageList);

    if (imageList.getImages().size() > 0) {
      imageIdFleet = imageList.getImages().get(0).getId();
    }

    // CASE Get AMS info for info region operation

    final ApiAMSRegionsResponse infoRegions =
        amsInfoWrapper
            .infoRegions(InfoRegions.builder().namespace(this.namespace).build())
            .ensureSuccess();

    // ESAC

    assertNotNull(infoRegions);
    assertTrue(infoRegions.getRegions().size() > 0);

    // CASE Get AMS info for info region operation

    final ApiInstanceTypesForNamespaceResponse infoInstances =
        amsInfoWrapper
            .infoSupportedInstances(
                InfoSupportedInstances.builder().namespace(this.namespace).build())
            .ensureSuccess();

    // ESAC

    assertNotNull(infoInstances);
    assertTrue(infoInstances.getAvailableInstanceTypes().size() > 0);

    if (infoInstances.getAvailableInstanceTypes().size() > 0) {
      instanceIdFleet = infoInstances.getAvailableInstanceTypes().get(0).getId();
    }

    if (imageIdFleet != "" && instanceIdFleet != "") {

      // CASE Fleet create

      final ApiFleetParameters fleetCreateBody =
          ApiFleetParameters.builder()
              .active(false)
              .claimKeys(Arrays.asList(new String[] {"beta"}))
              .name(nameFleet)
              .regions(
                  Arrays.asList(
                      new ApiRegionConfig[] {
                        ApiRegionConfig.builder().bufferSize(10).region(regionFleet).build()
                      }))
              .imageDeploymentProfile(
                  ApiImageDeploymentProfile.builder().imageId(imageIdFleet).build())
              .dsHostConfiguration(
                  ApiDSHostConfigurationParameters.builder()
                      .instanceId(imageIdFleet)
                      .serversPerVm(null)
                      .build())
              .build();

      final FleetCreateOpResponse fleetCreate =
          fleetsWrapper.fleetCreate(
              FleetCreate.builder().namespace(this.namespace).body(fleetCreateBody).build());

      // ESAC

      assertNotNull(fleetCreate);

      if (fleetCreate != null) {

        // CASE Fleet update
        final ApiFleetParameters fleetUpdateBody =
            ApiFleetParameters.builder()
                .active(false)
                .claimKeys(Arrays.asList(new String[] {"alpha"}))
                .name(nameFleet)
                .regions(
                    Arrays.asList(
                        new ApiRegionConfig[] {
                          ApiRegionConfig.builder().bufferSize(10).region(regionFleet).build()
                        }))
                .build();

        fleetsWrapper
            .fleetUpdate(
                FleetUpdate.builder().namespace(this.namespace).body(fleetUpdateBody).build())
            .ensureSuccess();

        // ESAC

        // CASE Fleet get
        final ApiFleetGetResponse fleetGet =
            fleetsWrapper
                .fleetGet(FleetGet.builder().namespace(this.namespace).build())
                .ensureSuccess();

        assertNotNull(fleetGet);

        // ESAC

        // CASE Fleet delete
        fleetsWrapper
            .fleetDelete(FleetDelete.builder().namespace(this.namespace).build())
            .ensureSuccess();

        // ESAC
      }
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}

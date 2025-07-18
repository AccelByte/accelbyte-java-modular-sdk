/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelThirdPartyLoginPlatformCredentialRequest extends Model {

  @JsonProperty("ACSURL")
  private String acsurl;

  @JsonProperty("AWSCognitoRegion")
  private String awsCognitoRegion;

  @JsonProperty("AWSCognitoUserPool")
  private String awsCognitoUserPool;

  @JsonProperty("AllowedClients")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> allowedClients;

  @JsonProperty("AppId")
  private String appId;

  @JsonProperty("AuthorizationEndpoint")
  private String authorizationEndpoint;

  @JsonProperty("ClientId")
  private String clientId;

  @JsonProperty("EmptyStrFieldList")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> emptyStrFieldList;

  @JsonProperty("EnableServerLicenseValidation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableServerLicenseValidation;

  @JsonProperty("Environment")
  private String environment;

  @JsonProperty("FederationMetadataURL")
  private String federationMetadataURL;

  @JsonProperty("GenericOauthFlow")
  private Boolean genericOauthFlow;

  @JsonProperty("IncludePUID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean includePUID;

  @JsonProperty("IsActive")
  private Boolean isActive;

  @JsonProperty("Issuer")
  private String issuer;

  @JsonProperty("JWKSEndpoint")
  private String jwksEndpoint;

  @JsonProperty("KeyID")
  private String keyID;

  @JsonProperty("LogoURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String logoURL;

  @JsonProperty("NetflixCertificates")
  private AccountcommonNetflixCertificates netflixCertificates;

  @JsonProperty("OrganizationId")
  private String organizationId;

  @JsonProperty("PlatformName")
  private String platformName;

  @JsonProperty("PrivateKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String privateKey;

  @JsonProperty("RedirectUri")
  private String redirectUri;

  @JsonProperty("RegisteredDomains")
  private List<AccountcommonRegisteredDomain> registeredDomains;

  @JsonProperty("RelyingParty")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String relyingParty;

  @JsonProperty("SandboxId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sandboxId;

  @JsonProperty("Secret")
  private String secret;

  @JsonProperty("TeamID")
  private String teamID;

  @JsonProperty("TokenAuthenticationType")
  private String tokenAuthenticationType;

  @JsonProperty("TokenClaimsMapping")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> tokenClaimsMapping;

  @JsonProperty("TokenEndpoint")
  private String tokenEndpoint;

  @JsonProperty("UserInfoEndpoint")
  private String userInfoEndpoint;

  @JsonProperty("UserInfoHTTPMethod")
  private String userInfoHTTPMethod;

  @JsonProperty("googleAdminConsoleKey")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String googleAdminConsoleKey;

  @JsonProperty("scopes")
  private List<String> scopes;

  @JsonIgnore
  public ModelThirdPartyLoginPlatformCredentialRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelThirdPartyLoginPlatformCredentialRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json, new TypeReference<List<ModelThirdPartyLoginPlatformCredentialRequest>>() {});
  }
}

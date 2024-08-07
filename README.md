# AccelByte Modular Java SDK

> :warning: **This [accelbyte-java-modular-sdk](https://github.com/AccelByte/accelbyte-java-modular-sdk) 
> is not to be confused with [accelbyte-java-sdk](https://github.com/AccelByte/accelbyte-java-sdk):** 
> * The former (modular SDK) is **experimental** and is planned to be the sucessor for the latter (monolithic SDK).
> * The modular SDK allows developers to include only the required modules in projects.
> * If you are starting a new project, you may try to use modular SDK.
> * If you use monolithic SDK in an existing project, a migration path is available via compatibility layer in modular SDK.
> * Both monolithic and modular SDK will be maintained for some time to give time for migration until monolithic SDK is deprecated in the future.

A software development kit (SDK) for interacting with AccelByte Gaming Services (AGS) written in Java.

This SDK was generated from AGS OpenAPI spec files included in the [spec](spec) directory.


## Setup

This SDK is developed using JDK 8 and Gradle 7.5.

### Gradle

Add the required configuration in `gradle.build`. Replace `{VERSION}` with 
a specific release version tag from [releases](https://github.com/AccelByte/accelbyte-java-sdk/releases) 
without the leading `v` character.

The artifacts are published in Maven Central.

```java
repositories {
   mavenCentral()
}

dependencies {
    ...
    implementation 'net.accelbyte.sdk:module-iam:{VERSION}'
}
```

PS. `module-iam` is the minimum dependency to use AGS, which is an SDK that wraps AGS IAM service. For more detail please refer to the [samples](./samples)

#### Migrating from monolithic to modular SDK

To migrate from monolitic SDK  you need to replace the gradle include statement, from this

```groovy

dependencies {
    ...
    implementation 'net.accelbyte.sdk:sdk:{VERSION}'
}

```

into this

```groovy
dependencies {
    ...
    implementation 'net.accelbyte.sdk:module-iam:{VERSION}'
    // also define other module that you needed 
    implementation 'net.accelbyte.sdk:module-{SERVICE_NAME}:{VERSION}'
}

```

### Environment Variables

The following environment variables need to be set when using `DefaultConfigRepository`.

| Name               | Required                                              | Example                          |
|--------------------|-------------------------------------------------------|----------------------------------|
| `AB_BASE_URL`      | Yes                                                   | https://test.accelbyte.io        |
| `AB_CLIENT_ID`     | Yes                                                   | abcdef0123456789abcdef0123456789 |
| `AB_CLIENT_SECRET` | Yes, but only if you use a confidential `AB_CLIENT_ID`| ab#c,d)ef(ab#c,d)ef(ab#c,d)ef(ab |

## Usage

### Instantiation

#### With Default HTTP Client (OkhttpClient)

Use the following to get SDK instance with basic HTTP functionality.
    
```java
AccelByteConfig config = new AccelByteConfig(
      new OkhttpClient(),
      DefaultTokenRepository.getInstance(),
      new DefaultConfigRepository());     // Using DefaultConfigRepository, make sure the required environment variables are set

AccelByteSDK sdk = new AccelByteSDK(config);
```

#### With Reliable HTTP client

Use the following to get SDK instance with HTTP retry functionality.

```java
final DefaultHttpRetryPolicy retryPolicy = new DefaultHttpRetryPolicy();

retryPolicy.setCallTimeout(3000);   // In milliseconds
retryPolicy.setMaxRetry(3);
retryPolicy.setRetryInterval(2000);    // In milliseconds
retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);    // LINEAR, EXPONENTIAL are available

private final ReliableHttpClient reliableHttpClient = new ReliableHttpClient(retryPolicy);

AccelByteConfig config = new AccelByteConfig(
      reliableHttpClient,
      DefaultTokenRepository.getInstance(),
      new DefaultConfigRepository());     // Using DefaultConfigRepository, make sure the required environment variables are set

AccelByteSDK sdk = new AccelByteSDK(config);
```

#### Automatic Token Refresh

Use the following to get SDK instance with automatic token refresh functionality which is performed before each HTTP request but only if access token is almost expired.
    
```java
AccelByteConfig config = new AccelByteConfig(
      new OkhttpClient(),
      new DefaultTokenRefreshRepository();   // Using DefaultTokenRefreshRepository which implements TokenRefresh interface to enable automatic token refresh
      new DefaultConfigRepository());     // Using DefaultConfigRepository, make sure the required environment variables are set

AccelByteSDK sdk = new AccelByteSDK(config);
```

#### On-demand Refresh Token (Preview)

The on-demand refresh token is intended to be used in environment where automatic refresh token cannot work properly e.g. AWS Lambda.`

```java
DefaultConfigRepository configRepo = new DefaultConfigRepository();
// Must use this if you want to use LoginOrRefresh
DefaultTokenRefreshRepository refreshRepo = new DefaultTokenRefreshRepository();
AccelByteConfig config = new AccelByteConfig(new OkhttpClient(), refreshRepo, configRepo);
AccelByteSDK sdk = new AccelByteSDK(config);
// Before making endpoint call
// Either use this for user credentials
boolean result = sdk.loginOrRefreshUser("username", "password");
// Or this for client credentials
boolean result = sdk.loginOrRefreshClient();

```

You can refer to this example of more details, [sample login or refresh](samples/login-or-refresh)

#### Local Token Validation

To enable local token validation, use the following when instantiating the SDK. When enabled, the SDK instance will cache JWKS and revocation list for performing token validation so that it does not have to call AccelByte Gaming Services endpoint each time. See [Validate Token](#validate-token) section on how to validate token using SDK.

```java
final DefaultConfigRepository defaultConfigRepository = new DefaultConfigRepository();    // Using DefaultConfigRepository, make sure the required environment variables are set

defaultConfigRepository.setLocalTokenValidationEnabled(true);     // Enable local token validation
defaultConfigRepository.setJwksRefreshInterval(300);    // Refresh JWKS for local token validation every 5 minutes
defaultConfigRepository.setRevocationListRefreshInterval(300);    // Refresh revocation list for local token validation every 5 minutes

AccelByteConfig config = new AccelByteConfig(
      new OkhttpClient(),
      DefaultTokenRepository.getInstance(),
      defaultConfigRepository);

AccelByteSDK sdk = new AccelByteSDK(config);
```

### Login

#### Login Using Username and Password

```java
boolean login = sdk.loginUser("myUsername", "myPassword");

if (!login) {
    // Login failed  
}
```

#### Login Using Username and Password with Specific Scope

```java
boolean login = sdk.loginUser("myUsername", "myPassword", "scopeA scopeB");   // Space separated scope values

if (!login) {
    // Login failed  
}
```

#### Login Using OAuth Client

```java
boolean login = sdk.loginClient();

if (!login) {
    // Login failed   
}
```

> :warning: **Please use loginClient() function with confidential OAuth client:** Using loginClient() function with public OAuth client is not supported.

### Validate Token

To validate if an access token is valid and has the required permission, use the `ValidateToken` method of `AccelByteSDK` instance. To validate an access token without validating the required permission, omit the optional `permission` and `action` parameters of `ValidateToken` method. By default, remote token validation is performed. However, if higher throughput is required, you may enable local token validation as mentioned in [Local Token Validation](#local-token-validation) section. With local token validation, token validation will be quicker at the expense of delayed revocation list update (a revoked token may still be regarded as valid until local cache of the revocation list is updated).

```java
boolean isOk = sdk.validateToken("token", "ADMIN:NAMESPACE:serversdktest:INFORMATION:USER:abdedef", 2);  // Validate token

if (isOk) {
    // Token is valid and has the required permission
}
else {
   // Token is not valid or expired or does not have the required permission
```

### Interacting with a Service Endpoint

As an example, we will get current user profile info using [getMyProfileInfo](https://docs.accelbyte.io/api-explorer/#Basic/getMyProfileInfo) endpoint available in [basic](https://docs.accelbyte.io/api-explorer/#Basic) service.

```java
// Login using username and password

boolean login = sdk.loginUser("myUsername", "myPassword");

if (!login) {
      System.out.println("login failed");
      return;
}

// Instantiate UserProfile wrapper class which is part of basic service

UserProfile userProfile = new UserProfile(sdk);

try {
   // Make a call to getMyProfileInfo endpoint
   UserProfilePrivateInfo response = userProfile
         .getMyProfileInfo(new GetMyProfileInfo("accelbyte"));

   System.out.println(response.getUserId());    // Success response

} catch (HttpResponseException e) {     // Error response from the service
   e.printStackTrace();

   if (e.getHttpCode() == 400) {
      // Handle specific error response HTTP code
   }

} catch (IOException e) {     // Network error
   e.printStackTrace();    
}
```

### Refresh Token

```java
boolean isOk = sdk.refreshToken();  // Trigger token refresh manually when not using automatic token refresh functionality

if (isOk) {
    // Refresh token is succesful or not required
}
else {
   // Refresh token failed
}
```

### Logout

```java
boolean logout = sdk.logout();

if (!logout) {
    // Logout failed
}
```

## Samples

Sample apps are available in the [samples](samples) directory.

## Documentation

Reference about AccelByte service endpoints and their corresponding SDK API is available in [docs/operations](docs/operations) directory.

For more information on how to use AccelByte services and SDKs, see [docs.accelbyte.io](https://docs.accelbyte.io/).

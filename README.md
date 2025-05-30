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
      new DefaultTokenRefreshRepository();   // Using DefaultTokenRefreshRepository which implements TokenRefreshV2 interface to enable automatic token refresh
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

### Working with Call Response

Every operation in Java Modular SDK will returns a response object. Use this object to do check whether the call is success or not, get the response data or error object.

- `isSuccess()` getter method will be `true` if the call is success, otherwise `false`.
- `getData()` getter method contains response data from service. This property is **optional** depending whether the endpoint has response or not.
- `getError()` getter method contains error object if call failed, otherwise null.

Known errors are available in `<ServiceName>Errors` static class. E.g `BasicErrors`, `IamErrors`, and so on.

```java
UserProfile userProfile = new UserProfile(sdk);

GetMyProfileInfoOpResponse response = userProfile.getMyProfileInfo(new GetMyProfileInfo("accelbyte"));

if (response.isSuccess())
{
    // do something with response data
}
else
{
    // do something with response error object

    // get error code
    String errorCode = response.getError().getCode();

    // get error message
    String errorMessage = response.getError().getMessage();

    // or throw an exception
    response.getError().throwException();

    // compare to known error to handle more specific error
    if (response.getError().isEqualWith(BasicErrors.error11440))
    {
        //do something if user profile not found.
    }
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

### Websocket
- **Automatic Ping Interval:** by default, automatic ping frames are not sent.

  To enable the feature, for the LobbyWebSocketClient.create() call, simply pass in:
    - `pingIntervalMs` > 0 to set the number of seconds between each automatic ping (until the connection is closed)
    - `pingIntervalMs` = 0 means disabled

- **Websocket Reconnection:**  Websocket Reconnection is a feature to help support auto-reconnection on websocket disconnects resulting from RFC 6455 status codes between 1001 to 2999. By default, the feature is off.

  To enable the feature, for the LobbyWebSocketClient.create() call, simply pass in:
    - `reconnectDelayMs` > 0 to control the delay between each reconnect attempt (with exponential backoff)
    - `reconnectDelayMs` = 0 means disabled
    - `maxNumReconnectAttempts` to control the maximum number of reconnection attempts
    - `maxNumReconnectAttempts` = -1 means unlimited reconnect attempts (`reconnectDelayMs` must be > 0 to enable)

Example:
```java
final WebSocketListener listener =
    new WebSocketListener() {
        @Override
        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
            log.info("Received onMessage: " + text);
            ...
        }
    };

final int RECONNECT_DELAY_MS = 60000;  // 1m (0 to disable)
final int MAX_NUM_RECONNECT_ATTEMPTS = 10; // -1 for unlimited reconnect attempts (RECONNECT_DELAY_MS must be > 0 to enable)

final int PING_INTERVAL_MS = 30000;  // 30s (0 to disable)

final LobbyWebSocketClient ws =
        LobbyWebSocketClient.create(
            new DefaultConfigRepository(), DefaultTokenRepository.getInstance(), listener, RECONNECT_DELAY_MS, MAX_NUM_RECONNECT_ATTEMPTS, PING_INTERVAL_MS);

ws.connect();

final String requestMessage = PartyCreateRequest.builder().id(request_id).build().toWSM();
ws.sendMessage(requestMessage);
...
```
**Lobby session preservation logic upon reconnect:**
In the event of a disconnection and a reconnection, the previous lobby session id will be requested for reuse via the "X-Ab-LobbySessionID" header with the cached value from the previous lobby session.

## Samples

Sample apps are available in the [samples](samples) directory.

## Documentation

Reference about AccelByte service endpoints and their corresponding SDK API is available in [docs/operations](docs/operations) directory.

For more information on how to use AccelByte services and SDKs, see [docs.accelbyte.io](https://docs.accelbyte.io/).

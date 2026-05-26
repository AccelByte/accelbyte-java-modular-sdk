# [v0.15.0]

## BREAKING CHANGE

Following changes in AccelByte Gaming Services OpenAPI specification:

- Operation `net.accelbyte.sdk.api.challenge.operations.challenge_configuration.AdminDeleteTiedChallenge`
    - Constructor signature changed: added parameter `safeDelete` (String). Old: `AdminDeleteTiedChallenge(String challengeCode, String namespace)`. New: `AdminDeleteTiedChallenge(String challengeCode, String namespace, String safeDelete)`.

[v0.15.0]: https://github.com/AccelByte/accelbyte-java-modular-sdk/compare/module-challenge/v0.14.0..module-challenge/v0.15.0

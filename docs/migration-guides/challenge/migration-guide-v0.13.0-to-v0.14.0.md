# [v0.14.0]

## BREAKING CHANGE

Following changes in AccelByte Gaming Services OpenAPI specification:

- Operation `net.accelbyte.sdk.api.challenge.operations.challenge_progression.EvaluateMyProgress`
    - Constructor signature changed: new required parameter `includeOneTimeEvent` (`String`) added to the deprecated all-args constructor. Callers using the builder pattern are not affected, but direct constructor calls must be updated.

[v0.14.0]: https://github.com/AccelByte/accelbyte-java-modular-sdk/compare/module-challenge/v0.13.0..module-challenge/v0.14.0

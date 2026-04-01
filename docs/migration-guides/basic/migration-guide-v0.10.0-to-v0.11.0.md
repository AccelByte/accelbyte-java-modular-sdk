# [v0.11.0]

## BREAKING CHANGE

Following changes in AccelByte Gaming Services OpenAPI specification:

- Operation `net.accelbyte.sdk.api.basic.operations.namespace.GetNamespaces`
    - Constructor signature changed: new required parameter `isTesting` (`Boolean`) added to the deprecated all-args constructor. Callers using the builder pattern are not affected, but direct constructor calls must be updated.

[v0.11.0]: https://github.com/AccelByte/accelbyte-java-modular-sdk/compare/module-basic/v0.10.0..module-basic/v0.11.0

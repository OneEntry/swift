# User authorization and management

Management of user data such as password, names, etc.

## Overview

User authorization works on the principle of token exchange.
For the sake of simplicity, hide this process under the hood of the sdk. On
You always have the opportunity to get all the data for more detailed configuration.
Tokens are automatically saved in a keychain to implement auto login.

## Authorization

```swift
let email = "oneentry@sample.com"
try await AuthService.shared.auth("email") {
    AuthData(marker: "email_auth", value: email)
    AuthData(marker: "pass_auth", value: "password")
}
```

This method performs obtaining authorization tokens. SDK independently monitor their relevance.

## Getting a user

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let user = try await AuthService.shared.user
```

## Logout

In fact, the output can be implemented in different ways and without this method.
However, its call is necessary to cancel authorization tokens

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let success = try await AuthService.shared.logout()
```

## Changing user data

The method helps to change any data, including the password.

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let success = try await service.changeUser(form: "email_auth", langCode: "en_US") {
    AuthDataContainer {
        AuthData(
            marker: "pass_auth",
            value: "password"
        )
    }
    
    FormDataContainer {
        FormData(
            marker: "name_auth",
            value: "Arthur"
        )
    }
}
```

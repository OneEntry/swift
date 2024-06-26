# Changing the password in case of loss of access to the account

Changing the password in case the user has forgotten it

## Overview

To change the password in case of its loss, you should follow a few steps:

1. Send verification code by user ID
2. Change the password using the activation code

> ImPortant: Use this instruction only if you lose access to your account. Otherwise, you should use ``AuthService/changeUser(form:langCode:data:)``

## Password change

```swift
let email = "oneentry@sample.com"
let code = "123456"
let success = try await AuthService.shared.changePassword(
    user: email,
    code: code,
    password: "password",
    confirmation: "password",
    with: "email"
)
```

## Topics

### Sending a verification code

- <doc:CodeGeneration>

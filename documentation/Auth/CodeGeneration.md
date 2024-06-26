# Code generation

Sending and checking verification codes

## Overview

OneEntry supports sending verification codes.
Three scenarios are supported for this:

- Password change
- Registration
- User code

You can customize the message template in the event settings in your personal account

![Events](oneentry-code-event.png)

## Code generation

After setting up the necessary event, we can start code generation. 

```swift
let email = "oneentry@sample.com"
try await AuthService.shared.generateCode(email, event: "send_code", with: "email")
```

## Code verification

Password or registration codes are checked by ``AuthService/changePassword(user:code:password:confirmation:with:)`` and ``AuthService/activate(user:code:with:)`` methods, respectively.

To check the user code, use the ``AuthService/check(_:code:with:)`` method

```swift
let email = "oneentry@sample.com"
let code = "123456"
let success = try await AuthService.shared.check(email, code: code, with: "email")
```

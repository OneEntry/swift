# User registration and activation

Registration and activation of new users. Verification using activation code.

## Overview

OneEntry users can be created through your personal account on the website, or using our sdk.
In both cases, you must first configure the authentication provider. 
There you can configure many parameters, such as seret phrases, token formats, etc.
But the most important thing is the authorization form.

@Row {
    @Column {
        ![Setting up the authorization provider](oneentry-auth-provider.png)
    }
    
    @Column {
        ![Auth Form](oneentry-auth-form.png)
    }
}

> Important: In order for everything to work correctly, each attribute of the form must be highlighted with the corresponding ticks

@Row {
    @Column(size: 2) {
        ![Password](oneentry-pass-attribute.png)
    }
    
    @Column {
        For example, you can highlight the user password. It was ticked "**Use as password**" so that cms identified it as a password
    }
}


## New user registration

After setting up the authorization provider, we can proceed to user registration.
For this purpose, the method ``AuthService/signUp(marker:form:langCode:data:)`` is used.

> Note: User registration supports sending data to an additional form using the `form` and ``AuthDataContainer`` parameters

```swift
let email = "oneentry@sample.com"
let phone = "+0000000000"
let user = try await AuthService.shared.signUp(
    marker: "email",
    form: "email_auth",
    langCode: "en_US"
) {
    AuthDataContainer {
        AuthData(marker: "email_auth", value: email)
        AuthData(marker: "pass_auth", value: "password")
        AuthData(marker: "email_notification", value: email)
    }
    
    FormDataContainer {
        FormData(marker: "name_auth", value: name)
    }
    
    NotificationData(email: email, phonePush: "<device_token>", phoneSMS: phone)
}
```

- ``AuthDataContainer`` - is responsible for the authorization data we configured above
- ``FormDataContainer`` - sends data to the `email_auth` form
- ``NotificationData`` - sends information to the registration

> Important: After a successful registration request, a confirmation code will be automatically sent to the selected address

## User activation

User activation is needed to verify the authenticity of his data.

> Important: Without user activation, methods of working with him, such as authorization, will not work

```swift
let email = "oneentry@sample.com"
let otp = "123456"
let success = try await AuthService.shared.activate(user: email, code: otp, with: "email")
```

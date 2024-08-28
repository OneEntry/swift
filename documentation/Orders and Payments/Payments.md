# Payment for created orders

## Overview

Most often, the user wants to pay for online orders immediately by card, without resorting to cash.
The `Payment Service` module has been created for this purpose.

You can connect payment services such as Stripe or PayPal and create a payment session

The payment session is the OneEntry entity that shows the available payment information.

The creation of a payment session implies the user's desire to pay for the order online, after its registration

### Creating a payment session

> To create a session, you need to know the ID of the order that the user wants to pay for

```swift
let session = try await service.createSession(order: 27, type: .session)
```

The session information contains all the necessary information for further payment. You can combine the result with the sdk of payment services and pay for orders

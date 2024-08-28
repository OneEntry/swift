# Orders and payment

Creation and payment of orders

## Overview

Creating and paying for orders is closely related to users.
Therefore, before creating orders, it is necessary to authorize the user using ``AuthService``

You can read more about authorization from <doc:AuthUsage>

## Topics

### Orders creating

- <doc:Orders>
- <doc:Payments>

### Receiving orders

- <doc:OrdersService/orders(storage:offset:limit:langCode:)>

### Order storage

- ``OrdersService/storage(with:langCode:)``
- ``OrdersService/storages(offset:limit:langCode:)``

### Payments sessions

- ``PaymentService/session(with:)``
- ``PaymentService/sessions(limit:offset:)``

### Payment sessions

- ``PaymentService/accounts``
- ``PaymentService/connected``



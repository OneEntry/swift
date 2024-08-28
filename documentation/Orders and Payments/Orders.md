# Creating and modification orders

## Overview

With the help of sdk you can create, modify and receive orders.

> Important: For many operations, you need to have an authorized client through ``AuthService``.
>
> You can read more about this in <doc:AuthUsage>

### Order creation

To successfully create an order, you need to set up an order storage in your personal account.
It will allow you to configure and group data correctly

```swift
let ids = [24, 20, 18]
let products = ids.map { OrderProduct(id: $0, quantity: .random(in: 1...4)) }

let address = "51 Cottage Lane Clifton New York NEW YORK 07012"
let comment = "Order unit tests"

let order = try await OrdersService.shared.create(
    storage: "delivery",
    form: "delivery",
    payment: "cash",
    langCode: "en_US"
) {
    FormDataContainer {
        FormData(marker: "address", value: address)
        FormData(marker: "comment", value: comment)
    }
    
    ProductsContainer(products)
}
```

``ProductsContainer`` is used to add products to the order.
It supports different uses:

@TabNavigator {
    @Tab("Regular") {
        ```swift
        let ids = [24, 20, 18]
        let products = ids.map { OrderProduct(id: $0, quantity: .random(in: 1...4)) }

        // ...
        ProductsContainer(products)
        // ...
        ```
    }
    
    @Tab("DSL") {
        ```swift
        let ids = [24, 20, 18]

        // ...
        ProductsContainer {
            for id in ids {
                OrderProduct(id: id, quantity: .random(in: 1...4))
            }
        }
        // ...
        ```
    }        
}


### Order updating

OneEntry supports updates of an already created order.

```swift
let address = "California, San Francisco, 24a"
let ids = [24, 20]
let products = ids.map { OrderProduct(id: $0, quantity: .random(in: 1...4)) }

let order = try await service.update(
    order: 26,
    storage: "delivery",
    form: "delivery",
    payment: "cash",
    langCode: "en_US") {
        FormDataContainer {
            FormData(marker: "address", value: address)
        }
        
        ProductsContainer(products)
    }
```

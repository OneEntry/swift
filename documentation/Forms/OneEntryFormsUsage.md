# FormsService

User data sending service

## Overview

OneEntry Forms is a tool that allows you to store, receive and send user data.
This can be applied in many scenarios, such as users, orders, etc.

## Forms

In your personal account, you can configure the template of the received data by creating a form and attaching attributes to it.

![Creating a form in your personal account](oneentry-delivery-form@4x.png)

You may need to get information about the form. To do this, you can request information about all forms:

```swift
let forms = try await FormsService.shared.forms(langCode: "en_US")
```

Or some specific one according to her identifier:

```swift
let form = try await FormsService.shared.form(with: "delivery", langCode: "en_US")
```

## Sending data to the form

The main idea of the forms is to send data to them. This can be done using the method ``FormsService/sendData(with:locale:data:)``

```swift
let response = try await FormsService.shared.sendData(with: "delivery", locale: "en_US") {
    FormData(marker: "address", value: "London")
    FormData(marker: "comment", value: "Comment")
    FormData(type: \.integer, marker: "entrance", value: "1")
}
```

> It is worth noting that by default the ``FormData`` object initializes the `String` data type.
> If you need to use another one, you can change the `type` parameter, the compiler will tell you what the value should be

## Receiving data

The functionality of receiving and processing the sent data may also be useful. 

You can get all the data sent:

```swift
let data = try await FormsService.shared.fetchData(langCode: "en_US")
```

Or request the data of a specific form by its identifier:

```swift
let data = try await FormsService.shared.data(with: "delivery")
```

## Topics

### Service

- ``FormsService``

### Forms

- ``OneEntryForm``

### Form Data

- ``FormData``
- ``FormData/DataType``

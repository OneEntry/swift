# FormsService

Controllers for working with form objects

## Getting all forms

```swift
let forms = try await FormsService.shared.forms(langCode: "en_US")
```

``OneEntryForm`` array will return as a result

## Getting a form by its marker

```swift
let form = try await FormsService.shared.form(with: "auth", langCode: "en_US")
```

``OneEntryForm`` will return as a result

## Sending data to the form

```swift
let data: [String : [OneEntryFormData]] = [
    "en_US": [
        .init(marker: "login", value: "Archibbald"),
        .init(marker: "password", value: "password")
    ]
]

let reponse = try await FormsService.shared.sendData(with: "auth", data: data)
```

``OneEntryFormDataResponse`` will return as a response

## Getting all form data

```swift
let data = try await FormsService.shared.data
```

``OneEntryFormDataResponse`` array will return as a response

## Getting form data from its marker

```swift
let data = try await FormsService.shared.data(with: "marker")
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryFormDataResponse`` objects

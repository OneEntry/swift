#  AttributesService

Sometimes you need to be able to get information about an attribute. Most often, this requires to get all the elements of the list: all colors, stickers, etc. This service will help to solve this problem

## Getting all attributes within the set

This method allows you to get all the attributes within the set. Sets are tied to OneEntry entities (products, blocks, pages, etc.)

```swift
let attributes = try await AttributesService.shared.attributes(from: "all", langCode: "en_US")
```

## Getting a single attribute within a set

This method can be useful if you know where to look for the necessary attribute and need to get information about it

```swift
let attribute = try await AttributesService.shared.attribute(with: "list", from: "all", langCode: "en_US")
```

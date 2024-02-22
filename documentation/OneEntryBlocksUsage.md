# OneEntryBlocks

Controllers for working with block objects

## Getting a block by its marker

> This method automatically detects the type and loads the data of the product blocks.
> If you need manual control to get products, use ``OneEntryBlocks/products(_:offset:limit:langCode:)`` or ``OneEntryBlocks/similarProducts(_:offset:limit:langCode:)``

```swift
let block = try await OneEntryBlocks.shared.block("dev", langCode: "en_US")
```

``OneEntryBlock`` will return as a result

## Getting all block objects with pagination

> The result of this method does not include the content of product blocks

```swift
let blocks = try await OneEntryBlocks.shared.blocks(langCode: "en_US")
```

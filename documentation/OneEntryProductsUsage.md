# CatalogService

Controllers for working with product pages

## Receiving all products with pagination

|    Parameter    | Description                                                           |
| :-------------: | --------------------------------------------------------------------- |
|    langCode     | Locale code, used only when searching with a filter                   |
|  statusMarker   | Identifier of the product page status                                 |
| conditionValue  | Value that is being searched                                          |
| conditionMarker | Filter condition identifier by which values are filtered              |
| attributeMarker | Text identifier of the indexed attribute by which values are filtered |
|    sortOrder    | Sorting order DESC, ASC                                               |
|     sortKey     | Sorting field, possible values: id, title, date, position             |
|      limit      | Parameter for pagination, default 30                                  |
|     offset      | Parameter for pagination, default 0                                   |

```swift
let result = try await CatalogService.shared.products(langCode: "en_US")
```
Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Getting all products uncategorized, with pagination

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await CatalogService.shared.emptyPageProducts(langCode: "en_US")
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Getting all products in the category by its id, with pagination

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
|  page id  | Category id                                               |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await CatalogService.shared.products(page: 12, langCode: "en_US")
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Getting all products in the category by its url, with pagination 

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
| page url  | Category url                                              |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await CatalogService.shared.products(page: "dev", langCode: "en_US")
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Getting related products for another product by its id

| Parameter  | Description                                                      |
| :--: | - |
| product id | Id of the product for which you want to get the related products |
|  langCode  | Locale code, used only when searching with a filter              |
| sortOrder  | Sorting order DESC, ASC                                          |
|  sortKey   | Sorting field, possible values: id, title, date, position        |
|   limit    | Parameter for pagination, default 30                             |
|   offset   | Parameter for pagination, default 0                              |

```swift
let related = try await CatalogService.shared.relatedProducts(product: 191, langCode: "en_US")
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Getting a product by its id

```swift
let product = try await CatalogService.shared.product(with: id, langCode: "en_US")
```

The answer will return ``OneEntryProduct``

## Receiving blocks linked to the product

> To get blocks tied to the product, you should use the method ``CatalogService/blocks(for:)``, as indicated in the example
```swift
let blocks = try await CatalogService.shared.blocks(for: 15)
```

The answer will return ``OneEntryBlock`` array

## Product filter

The OneEntry filter allows you to get products that meet the specified parameters. Our sdk uses DSL to build the filter. All you need to do is use the right set of filters in `@resultBuilder`

```swift            
let result = try await CatalogService.shared.filterProducts(langCode: "en_US") {
    OneEntryFilter(attributeMarker: "price", conditionMarker: .mth, conditionValue: 500, pageId: 12)
    OneEntryFilter(attributeMarker: "price", conditionMarker: .lth, conditionValue: 1500, pageId: 12)

    if condition {
        OneEntryFilter(attributeMarker: "color", conditionMarker: .in, conditionValue: "blue", pageId: 12)
    }    
}
```

Returns an ``OneEntryResult`` object, where items - an array of ``OneEntryProduct`` objects

## Quick search

All you need to quickly find products is a search string and `langCode`

```swift
let results = try await CatalogService.shared.quickSearch("iPhone", langCode: "en_US")
```

The answer will be the ``OneEntrySearchProduct`` array

## Product statuses

### All statuses

```swift
let statuses: [OneEntryProductStatus] = try await CatalogService.shared.productStatuses
```

The answer will be the ``OneEntryProductStatus`` array

### Status by id

```swift
let status: OneEntryProductStatus = try await CatalogService.shared.productStatus(with: 2)
```

The answer will be the ``OneEntryProductStatus``

### Status by marker

```swift
let status: OneEntryProductStatus = try await CatalogService.shared.productStatus(with: "storage")
```

The answer will be the ``OneEntryProductStatus`` 

### Status marker validation

You can check the validation of the token either using the appropriate method

```swift
let valid: Bool = try await CatalogService.shared.productStatusMarkerValidation("marker")
```

Or, if you have already received the status of a product, call the property

```swift
let status: OneEntryProductStatus = ...
let valid: Bool = try await status.markerValidation
```

The answer will be the `true` or `false`

# PagesService

Controllers for working with page objects, including catalog pages

## Getting child pages
In OneEntry it is possible to position pages in a flash style, which means that it is possible to get a list of child pages for the main entity

```swift
let rootURL = "dev"
let children: [OneEntryPage] = try await PagesService.shared.children(for: rootURL, langCode: "en_US")
```

The ``OneEntryPage`` array will be returned as an answer

## Getting the root pages

Getting top-level pages. These are the pages whose `parentId` is equal to `nil`

```swift
let root: [OneEntryPage] = try await PagesService.shared.rootPages(langCode: "en_US")
```

The ``OneEntryPage`` array will be returned as an answer

## Getting all pages within the catalog

All pages that are contained in the 'catalog' tab. In other words, the categories of products.

| Parameter | Description                           |
| :-------: | ------------------------------------- |
| langCode  | Language code. For example: **en_US** |
|   limit   | Limit of pagination elements          |
|  offset   | Pagination offset                     |

```swift
let catalog: [OneEntryPage] = try await PagesService.shared.catalogPages(langCode: "en_US")
```

The ``OneEntryPage`` array will be returned as an answer

## Getting all the pages

Getting all OneEntry pages

```swift
let pages: [OneEntryPage] = try await PagesService.shared.pages(langCode: "en_US")
```

The ``OneEntryPage`` array will be returned as an answer

## Getting one page with all the information

### Receiving by id

```swift
let page: OneEntryPage = try await PagesService.shared.page(with: 12, langCode: "en_US")
```

The ``OneEntryPage`` will be returned as an answer

### Receiving by URL

```swift
let page: OneEntryPage = try await PagesService.shared.page(with: "dev", langCode: "en_US")
```

The ``OneEntryPage`` will be returned as an answer

## Getting a page config

### Receiving by URL

```swift
let config: OneEntryPageConfig = try await PagesService.shared.config(with: "dev")
```

The ``OneEntryPageConfig`` will be returned as an answer

## Quick search

This method searches for pages by keywords

```swift
let result: [OneEntrySearchPage] = try await PagesService.shared.quickSearch("Development", langCode: "en_US")
```

The ``OneEntrySearchPage`` array will be returned as an answer

## Getting all the blocks tied to the page

To get all the blocks, you should use the ``PagesService/blocks(page:langCode:)`` method. To use it, you need to know the page address and language code. The ``OneEntryBlock`` array will return as the answer.

```swift
let blocks = try await PagesService.shared.blocks(page: "url", langCode: "en_US")
```

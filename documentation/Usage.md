# Usage

The full use of the entire sdk is described here

- [Usage](#usage)
  - [Add OneEntry SDK to your Swift project](#add-oneentry-sdk-to-your-swift-project)
    - [Step 1: Create OneEntry project:](#step-1-create-oneentry-project)
    - [Step 2: Add OneEntry SDK to your app](#step-2-add-oneentry-sdk-to-your-app)
      - [CocoaPods](#cocoapods)
        - [dyld\[\]: missing symbol called](#dyld-missing-symbol-called)
      - [Swift Package Manager](#swift-package-manager)
    - [Step 3: Initialize OneEntry in your app](#step-3-initialize-oneentry-in-your-app)
      - [Initialization with an authentication token](#initialization-with-an-authentication-token)
      - [Initialization with certificates](#initialization-with-certificates)
        - [Using the built-in certificate](#using-the-built-in-certificate)
        - [Generation of your .p12 certificate](#generation-of-your-p12-certificate)
  - [Using OneEntry Swift SDK](#using-oneentry-swift-sdk)
    - [OneEntryBlocks](#oneentryblocks)
      - [Getting a block by its marker](#getting-a-block-by-its-marker)
      - [Getting all block objects with pagination](#getting-all-block-objects-with-pagination)
    - [OneEntryForms](#oneentryforms)
      - [Getting all forms](#getting-all-forms)
      - [Getting a form by its marker](#getting-a-form-by-its-marker)
      - [Sending data to the form](#sending-data-to-the-form)
      - [Getting all form data](#getting-all-form-data)
      - [Getting form data from its marker](#getting-form-data-from-its-marker)
    - [Attributes](#attributes)
      - [Introduction](#introduction)
      - [Available data types](#available-data-types)
      - [Receiving attributes](#receiving-attributes)
        - [Custom processing](#custom-processing)
        - [Processing of numerical values](#processing-of-numerical-values)
        - [Date and time processing](#date-and-time-processing)
        - [Files processing](#files-processing)
        - [Images processing](#images-processing)
        - [Text data types](#text-data-types)
          - [String](#string)
          - [Text](#text)
          - [Text with header](#text-with-header)
    - [OneEntryProducts](#oneentryproducts)
      - [Receiving all products with pagination](#receiving-all-products-with-pagination)
      - [Getting all products uncategorized, with pagination](#getting-all-products-uncategorized-with-pagination)
      - [Getting all products in the category by its id, with pagination](#getting-all-products-in-the-category-by-its-id-with-pagination)
      - [Getting all products in the category by its url, with pagination](#getting-all-products-in-the-category-by-its-url-with-pagination)
      - [Getting related products for another product by its id](#getting-related-products-for-another-product-by-its-id)
      - [Getting a product by its id](#getting-a-product-by-its-id)
      - [Product filter](#product-filter)
      - [Quick search](#quick-search)
      - [Product statuses](#product-statuses)
        - [All statuses](#all-statuses)
        - [Status by id](#status-by-id)
        - [Status by marker](#status-by-marker)
        - [Status marker validation](#status-marker-validation)
    - [OneEntryPages](#oneentrypages)
      - [Getting all the blocks tied to the page](#getting-all-the-blocks-tied-to-the-page)
      - [Getting child pages](#getting-child-pages)
      - [Getting the root pages](#getting-the-root-pages)
      - [Getting all pages within the catalog](#getting-all-pages-within-the-catalog)
      - [Getting all the pages](#getting-all-the-pages)
      - [Getting one page with all the information](#getting-one-page-with-all-the-information)
        - [Receiving by id](#receiving-by-id)
        - [Receiving by URL](#receiving-by-url)
      - [Getting a page config](#getting-a-page-config)
        - [Receiving by URL](#receiving-by-url-1)
      - [Quick search](#quick-search-1)
    - [OneEntryProject](#oneentryproject)
      - [File uploading](#file-uploading)
      - [Deleting files](#deleting-files)
      - [Getting all administrators](#getting-all-administrators)
      - [Getting all active locales](#getting-all-active-locales)
      - [Getting all general types](#getting-all-general-types)
      - [Getting a menu item by its marker](#getting-a-menu-item-by-its-marker)
      - [Testing error 404](#testing-error-404)
      - [Testing error 500](#testing-error-500)
    - [OneEntryTemplates](#oneentrytemplates)
      - [Getting all templates](#getting-all-templates)
        - [Available types by properties](#available-types-by-properties)
      - [Request templates by type](#request-templates-by-type)
    - [OneEntryTemplatePreviews](#oneentrytemplatepreviews)
      - [Getting all preview templates](#getting-all-preview-templates)
      - [Getting a preview template by its id](#getting-a-preview-template-by-its-id)
      - [Getting a preview template by its marker](#getting-a-preview-template-by-its-marker)

## Add OneEntry SDK to your Swift project

### Step 1: Create OneEntry project:
In order to create a OneEntry project, you need to create an account on our [site](https://account.oneentry.cloud/).

After that, go to the [projects](https://account.oneentry.cloud/projects) tab and create a new project.

### Step 2: Add OneEntry SDK to your app

#### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate OneEntry into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'OneEntry'
```

##### dyld[]: missing symbol called

If you have this error as a result of installing Sdk, via CocoaPods, add the following code to your Podfile

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end

target 'OneEntrySDKTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OneEntrySDKTest
  pod 'OneEntry'
end
```

#### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding OneEntry as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/OneEntry/oneentry-ios-sdk", .upToNextMajor(from: "1.0.4"))
]
```

### Step 3: Initialize OneEntry in your app

This is the final step you need to take in order to add OneEntry to your application.

> Before using SDK classes and methods, you need to go through initialization.
> Otherwise there will be an error

#### Initialization with an authentication token

1. To initialize with an authorization token, you need to get a link to the project and the token. You can do this in the project settings in the tab `App tokens`

2. Import the `OneEntry` module:

   ```swift
   import Foundation
   import SwiftUI
   import OneEntry

   // ...
   ```
3. Configure a `OneEntryCore` shared instance, before using SDK methods. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.

    ```swift
    let token = "..."
    let url = "https://sample.oneentry.cloud"
    let credential = OneEntryTokenCredential(token: token)

    OneEntryCore.initializeApp(url, credentials: credential)
    ```

#### Initialization with certificates

> iOS Sdk OneEntry uses .p12(PKCS#12) certificates for authorization. Such a certificate can be generated independently from the `key` & `certificate` pair or use the one provided by OneEntry

In any case, you need to download the archive with certificates. You can do this in the project settings, in the `Application Certificates` tab

The following files will be inside:
- `.cert` - Certificate, encrypted in base64
- `.csr` - Certificate request
- `.key` - Key, encrypted in base64
- `.p12` - The `Certificate` & `Key` bundle, encrypted in PKCS#12

##### Using the built-in certificate

1. Move the .p12 file to the project, make sure it is included in Target Membership
2. Initialize the application. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.

> By default, OneEntry certificates do not have a password
   
```swift
let url = "https://sample.oneentry.cloud"
let name = "swift_certificate"
let credential = OneEntryCertificateCredential(name: name)

OneEntryCore.initializeApp(domain, credentials: credential)
```

##### Generation of your .p12 certificate

1. To do this, you will need a key(`.key`) and certificate(`.cert`) file, download them
2. Generate .p12 with `openSSL`
    ```shell
    openssl pkcs12 -legacy -export -out certificate.p12 -inkey key.key -in cert.cert
    ```
3.  Move the .p12 file to the project, make sure it is included in Target Membership
4.  Using the certificate and password you specified when creating it, initialize the application. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.
    ```swift
    let url = "https://sample.oneentry.cloud"
    let name = "swift_certificate"
    let password = "password"
    let credential = OneEntryCertificateCredential(name: certificate, password: password)

    OneEntryCore.initializeApp(domain, credentials: credential)
    ```

## Using OneEntry Swift SDK

### OneEntryBlocks

Controllers for working with block objects

#### Getting a block by its marker

> This method automatically detects the type and loads the data of the product blocks.
> If you need manual control to get products, use ``OneEntryBlocks/products(_:offset:limit:langCode:)`` or ``OneEntryBlocks/similarProducts(_:offset:limit:langCode:)``

```swift
let block = try await OneEntryBlocks.shared.block("dev", langCode: "en_US")
```

``OneEntryBlock`` will return as a result

#### Getting all block objects with pagination

> The result of this method does not include the content of product blocks

```swift
let blocks = try await OneEntryBlocks.shared.blocks(langCode: "en_US")
```

### OneEntryForms

OneEntry forms allow you to send all kinds of data to the admin application

#### Getting all forms

```swift
let forms = try await OneEntryForms.shared.forms(langCode: "en_US")
```

`OneEntryForm` array will return as a result`

```swift
/// OneEntry form model
public struct OneEntryForm: Identifiable, Decodable, LocalizeContent {
    public let id: Int
    public let localizeInfos: [String : LocalizeInfo]?
    public let attributeValues: [String : [String : OneEntryAttribute]]?
    public let version: Int
    public let identifier: String
    public let processingType: String?
}
```

#### Getting a form by its marker

```swift
let form = try await OneEntryForms.shared.form(with: "auth", langCode: "en_US")
```

`OneEntryForm` will return as a result`

```swift
/// OneEntry form model
public struct OneEntryForm: Identifiable, Decodable, LocalizeContent {
    public let id: Int
    public let localizeInfos: [String : LocalizeInfo]?
    public let attributeValues: [String : [String : OneEntryAttribute]]?
    public let version: Int
    public let identifier: String
    public let processingType: String?
}
```

#### Sending data to the form

```swift
let data: [String : [OneEntryFormData]] = [
    "en_US": [
        .init(marker: "login", value: "Archibbald"),
        .init(marker: "password", value: "password")
    ]
]

let reponse = try await OneEntryForms.shared.sendData(with: "auth", data: data)
```

`OneEntryFormDataResponse` will return as a response

```swift
/// Represents a response containing form data for a single entry with an identity and time.
public struct OneEntryFormDataResponse: Identifiable, Decodable {
    /// Unique identifier for the form data response.
    public let id: Int
    /// Time when the form data was submitted.
    public let time: String
    /// Identifier for the form.
    public let formIdentifier: String
    /// Form data organized as a dictionary of arrays of OneEntryFormData.
    public let formData: [String : [OneEntryFormData]]
}
```

#### Getting all form data

```swift
let data = try await OneEntryForms.shared.data
```

`OneEntryFormDataResponse` array will return as a response

```swift
/// Represents a response containing form data for a single entry with an identity and time.
public struct OneEntryFormDataResponse: Identifiable, Decodable {
    /// Unique identifier for the form data response.
    public let id: Int
    /// Time when the form data was submitted.
    public let time: String
    /// Identifier for the form.
    public let formIdentifier: String
    /// Form data organized as a dictionary of arrays of OneEntryFormData.
    public let formData: [String : [OneEntryFormData]]
}
```

#### Getting form data from its marker

```swift
let data = try await OneEntryForms.shared.data(with: "marker")
```

`OneEntryResult<OneEntryFormDataResponse>` will return as a response

```swift
/// Represents a response containing form data for a single entry with an identity and time.
public struct OneEntryFormDataResponse: Identifiable, Decodable {
    /// Unique identifier for the form data response.
    public let id: Int
    /// Time when the form data was submitted.
    public let time: String
    /// Identifier for the form.
    public let formIdentifier: String
    /// Form data organized as a dictionary of arrays of OneEntryFormData.
    public let formData: [String : [OneEntryFormData]]
}
```

### Attributes

#### Introduction

The `OneEntryAttribute` data structure is provided to work with attributes in OneEntry

```swift
/// OneEntry entity attribute
public struct OneEntryAttribute: Decodable {
    /// Type of attribute
    let type: AttributeType
    /// Value of attribute
    let value: Any?
}
```

`value` - Attribute value
`type` - Attribute data type

#### Available data types

```swift
/// Type of attribute
enum AttributeType: String, Decodable {
    /// Integer attribute
    case integer
    /// Date attribute without time
    case date
    /// File attribute
    case file
    /// Attribute with floating point
    case real
    /// Text attribute
    case text
    /// Time attribute without date
    case time
    /// Attribute with floating point
    case float
    /// Image attribute
    case image
    /// String attribute
    case string
    /// Date & time attribute
    case dateTime
    /// Text attribute with header
    case textWithHeader
    /// Group of image attribute
    case groupOfImages    
}
```

#### Receiving attributes

Let's try to get the attributes from the page, for products and other entities the process will be similar

```swift
let page = try await OneEntryPages.shared.page(with: "dev", langCode: "en_US")
let attribute = page.localizeAttribute("int", languageCode: "en_US")
```

##### Custom processing

If you are sure that your attribute has accepted a specific data type, you can process `value` yourself

```swift
let value = attribute?.value as? Int
```

##### Processing of numerical values

All numeric OneEntry values (`real`, `integer`, `float`) can be easily converted to Swift data types

```swift
let attribute = page.localizeAttribute("int", languageCode: "en_US")
let intAttribute = attribute?.intValue
let doubleAttribute = attribute?.doubleValue
let stringAttribute = attribute?.stringValue
                        
print(intAttribute) // 500
print(doubleAttribute) // 500.0
print(stringAttribute) // "500"
```

##### Date and time processing

OneEntry has several types of date and time data:

- `Date`
- `Time`
- `DateTime`

All of them will eventually be converted to a Swift `Date` object

```swift
let date = page.localizeAttribute("date", languageCode: "en_US")?.dateValue
let time = page.localizeAttribute("time", languageCode: "en_US")?.dateValue
let dateTime = page.localizeAttribute("date_time", languageCode: "en_US")?.dateValue
```

##### Files processing

```swift
let attribute = page.localizeAttribute("file", languageCode: langCode)?.fileValues
```

The `OneEntryFile` array will be returned as a response

```swift
/// Represents a file associated with a single entry.
public struct OneEntryFile: Decodable {
    /// The name of the file.
    public let filename: String
    /// The download link or URL for accessing the file.
    public let downloadLink: String    
    /// The size of the file in bytes.
    public let size: Int
}
```

##### Images processing

Attribute types such as `image` and `groupOfImages` are treated by sdk in the same way

```swift
let attributes = page.localizeAttribute("imagegroup", languageCode: langCode)?.imageValues
```

The `OneEntryImage` array will be returned as an answer

```swift
/// OneEntry image model
public struct OneEntryImage: Decodable {
    /// Image size
    public let size: Int
    // Full path to image
    public let filename: String
    // Preview link
    public let previewLink: String
    /// Link to download the image
    public let downloadLink: String
}
```

##### Text data types

###### String

Most types of attributes can be obtained as a string

```swift
let value = page.localizeAttribute("string", languageCode: "en_US")?.stringValue
```

###### Text

```swift
let attribute = page.localizeAttribute("text", languageCode: langCode)?.textValues
```

The `OneEntryText` structure will be returned as an answer

```swift
/// Object of text
public struct OneEntryText: Decodable {
    /// The HTML value associated with the object.
    public let htmlValue: String
    /// The plain text value associated with the object.
    public let plainValue: String
}
```

###### Text with header

```swift
let attribute = page.localizeAttribute("header_text", languageCode: langCode)?.textWithHeaderValues
```

The array of `OneEntryTextWithHeader` structures will return as an answer

```swift
public struct OneEntryTextWithHeader: Identifiable, Decodable {    
    /// The unique identifier for the object
    public var id: UUID { index }
    /// The unique identifier for the object
    public let index: UUID
    /// The header information for the object.
    public let header: String
    /// The HTML value associated with the object.
    public let htmlValue: String
    /// The plain text value associated with the object.
    public let plainValue: String
}
```

### OneEntryProducts

#### Receiving all products with pagination

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
let result = try await OneEntryProducts.shared.products(langCode: "en_US")
```

The `OneEntryProductResult` will come as an response

```swift
/// The structure that comes when you request products
public struct OneEntryProductResult: Decodable { 
    /// All products
    public let items: [OneEntryProduct]
    /// Number of products
    public let total: Int
}
```

#### Getting all products uncategorized, with pagination

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await OneEntryProducts.shared.emptyPageProducts(langCode: "en_US")
```

The `OneEntryProductResult` will come as an response

```swift
/// The structure that comes when you request products
public struct OneEntryProductResult: Decodable { 
    /// All products
    public let items: [OneEntryProduct]
    /// Number of products
    public let total: Int
}
```

#### Getting all products in the category by its id, with pagination

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
|  page id  | Category id                                               |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await OneEntryProducts.shared.products(page: 12, langCode: "en_US")
```

The `OneEntryProductResult` will come as an response

```swift
/// The structure that comes when you request products
public struct OneEntryProductResult: Decodable { 
    /// All products
    public let items: [OneEntryProduct]
    /// Number of products
    public let total: Int
}
```

#### Getting all products in the category by its url, with pagination 

| Parameter | Description                                               |
| :-------: | --------------------------------------------------------- |
| page url  | Category url                                              |
| langCode  | Locale code, used only when searching with a filter       |
| sortOrder | Sorting order DESC, ASC                                   |
|  sortKey  | Sorting field, possible values: id, title, date, position |
|   limit   | Parameter for pagination, default 30                      |
|  offset   | Parameter for pagination, default 0                       |

```swift
let result = try await OneEntryProducts.shared.products(page: "dev", langCode: "en_US")
```

The `OneEntryProductResult` will come as an response

```swift
/// The structure that comes when you request products
public struct OneEntryProductResult: Decodable { 
    /// All products
    public let items: [OneEntryProduct]
    /// Number of products
    public let total: Int
}
```

#### Getting related products for another product by its id

| Parameter  | Description                                                      |
| :--: | - |
| product id | Id of the product for which you want to get the related products |
|  langCode  | Locale code, used only when searching with a filter              |
| sortOrder  | Sorting order DESC, ASC                                          |
|  sortKey   | Sorting field, possible values: id, title, date, position        |
|   limit    | Parameter for pagination, default 30                             |
|   offset   | Parameter for pagination, default 0                              |

```swift
let related = try await OneEntryProducts.shared.relatedProducts(product: 191, langCode: "en_US")
```

The `OneEntryProductResult` will come as an response

```swift
/// The structure that comes when you request products
public struct OneEntryProductResult: Decodable { 
    /// All products
    public let items: [OneEntryProduct]
    /// Number of products
    public let total: Int
}
```

#### Getting a product by its id

```swift
let product = try await OneEntryProducts.shared.product(with: id, langCode: "en_US")
```

The answer will return `OneEntryProduct`

```swift
/// OneEntry catalog products
public struct OneEntryProduct: Identifiable, Decodable, LocalizeContent {
    /// Product Id
    public let id: Int
    /// Product price
    public let price: Double?
    /// Product localize info
    public let localizeInfos: [String : LocalizeInfo]?
    /// ID of related products for this product
    public let relatedIds: [Int]
    /// Product template ID
    public let templateIdentifier: String?
    /// Product attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Product filter

The OneEntry filter allows you to get products that meet the specified parameters. Our sdk uses DSL to build the filter. All you need to do is use the right set of filters in `@resultBuilder`

```swift            
let result = try await OneEntryProducts.shared.filterProducts(langCode: "en_US") {
    OneEntryFilter(attributeMarker: "price", conditionMarker: .mth, conditionValue: 500, pageId: 12)
    OneEntryFilter(attributeMarker: "price", conditionMarker: .lth, conditionValue: 1500, pageId: 12)

    if condition {
        OneEntryFilter(attributeMarker: "color", conditionMarker: .in, conditionValue: "blue", pageId: 12)
    }    
}
```

In all cases of filtering, the answer will be `OneEntryResult<OneEntryProduct>`

```swift
/// The structure that comes when you request items
public struct OneEntryResult<T: Decodable>: Decodable {    
    /// All items
    public let items: [T]
    /// Number of items
    public let total: Int
}
```

#### Quick search

All you need to quickly find products is a search string and `langCode`

```swift
let results = try await OneEntryProducts.shared.quickSearch("iPhone", langCode: "en_US")
```

The answer will be the `OneEntrySearchProduct` array

```swift
public struct OneEntrySearchProduct: Identifiable, Decodable {
    /// Product Id
    public let id: Int
    /// Product title
    public let title: String
    /// Id of the page to which the product is linked
    public let pageId: Int
}
```

#### Product statuses

##### All statuses

```swift
let statuses: [OneEntryProductStatus] = try await OneEntryProducts.shared.productStatuses
```

The answer will be the `OneEntryProductStatus` array

```swift
/// OneEntry Product Status
public struct OneEntryProductStatus: Identifiable, Decodable, LocalizeContent {
    /// Product status id
    public let id: Int
    /// Product status update date
    public let updatedDate: String
    /// Product status version number
    public let version: Int
    /// Product status marker
    public let identifier: String
    /// Product status marker localize info
    public let localizeInfos: [String : LocalizeInfo]?
}
```

##### Status by id

```swift
let status: OneEntryProductStatus = try await OneEntryProducts.shared.productStatus(with: 2)
```

The answer will be the `OneEntryProductStatus`

```swift
/// OneEntry Product Status
public struct OneEntryProductStatus: Identifiable, Decodable, LocalizeContent {
    /// Product status id
    public let id: Int
    /// Product status update date
    public let updatedDate: String
    /// Product status version number
    public let version: Int
    /// Product status marker
    public let identifier: String
    /// Product status marker localize info
    public let localizeInfos: [String : LocalizeInfo]?
}
```

##### Status by marker

```swift
let status: OneEntryProductStatus = try await OneEntryProducts.shared.productStatus(with: "storage")
```

The answer will be the `OneEntryProductStatus` 

```swift
/// OneEntry Product Status
public struct OneEntryProductStatus: Identifiable, Decodable, LocalizeContent {
    /// Product status id
    public let id: Int
    /// Product status update date
    public let updatedDate: String
    /// Product status version number
    public let version: Int
    /// Product status marker
    public let identifier: String
    /// Product status marker localize info
    public let localizeInfos: [String : LocalizeInfo]?
}
```

##### Status marker validation

You can check the validation of the token either using the appropriate method

```swift
let valid: Bool = try await OneEntryProducts.shared.productStatusMarkerValidation("marker")
```

Or, if you have already received the status of a product, call the property

```swift
let status: OneEntryProductStatus = ...
let valid: Bool = try await status.markerValidation
```

The answer will be the `true` or `false` 

### OneEntryPages

#### Getting all the blocks tied to the page

To get all the blocks, you should use the ``OneEntryPages/blocks(page:langCode:)`` method. To use it, you need to know the page address and language code. The ``OneEntryBlock`` array will return as the answer.

```swift
let blocks = try await OneEntryPages.shared.blocks(page: "url", langCode: "en_US")
```

#### Getting child pages
In OneEntry it is possible to position pages in a flash style, which means that it is possible to get a list of child pages for the main entity

```swift
let rootURL = "dev"
let children: [OneEntryPage] = try await OneEntryPages.shared.children(for: rootURL, langCode: "en_US")
```

The `OneEntryPage` array will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Getting the root pages

Getting top-level pages. These are the pages whose `parentId` is equal to `nil`

```swift
let root: [OneEntryPage] = try await OneEntryPages.shared.rootPages(langCode: "en_US")
```

The `OneEntryPage` array will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Getting all pages within the catalog

All pages that are contained in the 'catalog' tab. In other words, the categories of products.

| Parameter | Description                           |
| :-------: | ------------------------------------- |
| langCode  | Language code. For example: **en_US** |
|   limit   | Limit of pagination elements          |
|  offset   | Pagination offset                     |

```swift
let catalog: [OneEntryPage] = try await OneEntryPages.shared.catalogPages(langCode: "en_US")
```

The `OneEntryPage` array will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Getting all the pages

Getting all OneEntry pages

```swift
let pages: [OneEntryPage] = try await OneEntryPages.shared.pages(langCode: "en_US")
```

The `OneEntryPage` array will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Getting one page with all the information

##### Receiving by id

```swift
let page: OneEntryPage = try await OneEntryPages.shared.page(with: 12, langCode: "en_US")
```

The `OneEntryPage` will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

##### Receiving by URL

```swift
let page: OneEntryPage = try await OneEntryPages.shared.page(with: "dev", langCode: "en_US")
```

The `OneEntryPage` will be returned as an answer

```swift
/// OneEntry page object
public struct OneEntryPage: Identifiable, Decodable, LocalizeContent {        
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page depth
    public let depth: Int?
    /// Is the page active
    public let isVisible: Bool?
    /// Page position
    public let position: Int?
    /// Page type
    public let type: String?
    /// Page template marker
    public let templateIdentifier: String?
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Page attributes
    public let attributeValues: [String : [String : OneEntryAttribute]]?
}
```

#### Getting a page config

##### Receiving by URL

```swift
let config: OneEntryPageConfig = try await OneEntryPages.shared.config(with: "dev")
```

The `OneEntryPageConfig` will be returned as an answer

```swift
/// Page config
public struct OneEntryPageConfig: Decodable {
    /// Rows value per page
    public let rowsPerPage: Int?
    /// Products value per row
    public let productsPerRow: Int?
}
```

#### Quick search

This method searches for pages by keywords

```swift
let result: [OneEntrySearchPage] = try await OneEntryPages.shared.quickSearch("Development", langCode: "en_US")
```

The `OneEntrySearchPage` array will be returned as an answer

```swift
/// OneEntry page search dto
public struct OneEntrySearchPage: Identifiable, Decodable {
    /// Page id
    public let id: Int
    /// Page title
    public let title: String
}
```

### OneEntryProject

#### File uploading

OneEntry supports the ability to save your files to storage. To do this, you need to specify additional information about the file.

|  Field   | Description                                                                                         |
| :: |  |
| fileURL  | Path to the file you want to save                                                                   |
|   type   | Type, determines the folder name in the storage                                                     |
|  entity  | Entity name from which the file is uploaded, determines the folder name in the storage              |
|    id    | identifier of the object from which the file is uploaded, determines the folder name in the storage |
|  width   | Width parameter                                                                                     |
|  height  | Height parameter                                                                                    |
| compress | Boolean flag of optimization (compression) for images                                               |

```swift
let path = ".../dev.png"
let url = URL(fileURLWithPath: path)
let result = try await OneEntryProject.shared.uploadFile(fileURL: url, type: "page", entity: "test", id: 15)
```

The `OneEntryFile` array will be returned as a response

```swift
/// Represents a file associated with a single entry.
public struct OneEntryFile: Decodable {
    /// The full path to the file.
    public let filename: String
    /// The download link or URL for accessing the file.
    public let downloadLink: String    
    /// The size of the file in bytes.
    public let size: Int
}
```

#### Deleting files

This SDK method allows you to delete saved files. Additional fields must also be specified for it.

| Field  | Description                                                                                         |
| :-: |  |
|  name  | File name                                                                                           |
|  type  | Type, determines the folder name in the storage                                                     |
| entity | Entity name from which the file is uploaded, determines the folder name in the storage              |
|   id   | identifier of the object from which the file is uploaded, determines the folder name in the storage |

```swift
let name = "dev.png"

try await OneEntryProject.shared.deleteFile(name: name, type: "page", entity: "test", id: 15)
```

#### Getting all administrators
```swift
let admins = try await OneEntryProject.shared.admins
```

The answer will be array of `OneEntryAdmin`

```swift
/// Admin model
public struct OneEntryAdmin: Identifiable, Decodable {
    /// Admin id
    public let id: Int
    /// Admin marker
    public let identifier: String
    /// Admin position
    public let position: Int?
}
```

#### Getting all active locales
```swift
let locales = try await OneEntryProject.shared.activeLocales
```

The answer will be array of `OneEntryLocale`
```swift
/// Localization model
public struct OneEntryLocale: Identifiable, Decodable {
    /// Locale id
    public let id: Int
    /// Locale short code
    public let shortCode: String
    /// Locale full code
    public let code: String
    /// Locale name
    public let name: String
    /// Locale native name
    public let nativeName: String
    /// Is locale active
    public let isActive: Bool
    /// Locale icon
    public let image: String?
    /// Locale position
    public let position: Int?
}
```

#### Getting all general types
```swift
let types = try await OneEntryProject.shared.generalTypes
```
The answer will be array of `OneEntryGeneralType`

```swift
/// OneEntry general type
public struct OneEntryGeneralType: Identifiable, Decodable {
    /// Generale type id
    public let id: Int
    /// General type string value
    public let type: String
}
```

#### Getting a menu item by its marker

The menu is a very important essence of OneEntry. It allows you to group pages by features. These pages will be returned as a tree, and you can easily get all the subpages (children) of each page

```swift
let menu = try await OneEntryProject.shared.menu(with: "dev")
```

The answer will be the `OneEntryMenu` structure

```swift
/// Structure of the OneEntry menu item
public struct OneEntryMenu: Identifiable, Decodable, LocalizeContent {
    /// Menu id
    public let id: Int
    /// Menu marker
    public let identifier: String
    /// Menu localize info
    public let localizeInfos: [String : LocalizeInfo]?
    /// Pages inside the menu item
    public let pages: [OneEntryMenuPage]
}
```

```swift
public struct OneEntryMenuPage: Identifiable, Decodable, LocalizeContent, Treelike {            
    /// Page id
    public let id: Int
    /// Page parent id
    public var parentId: Int?
    /// Page url
    public let pageUrl: String
    /// Page position
    public let position: Int
    /// Page localize content
    public let localizeInfos: [String : LocalizeInfo]?
    /// Child pages
    public var children: [OneEntryMenuPage]?
}
```

#### Testing error 404
```swift
do {
    try await OneEntryProject.shared.test404()
} catch let error as OneEntryError where error.statusCode == 404 {
    // handle 404 error
} catch {
    // Other errors
}
```


#### Testing error 500
```swift
do {
    try await OneEntryProject.shared.test500()
} catch let error as OneEntryError where error.statusCode == 500 {
    // handle 500 error
} catch {
    // Other errors
}
```

### OneEntryTemplates

#### Getting all templates

```swift
let templates = try await OneEntryTemplates.shared.templates
```

This property returns an array of `OneEntryAllTemplates`. This model contains the `asDisctionary` field, which stores the data of all templates by key. 

```swift
let templates = try await OneEntryTemplates.shared.templates
template.asDictionary["forCatalogProducts"] // forCatalogProducts templates as array of OneEntryTemplate
```

There are also have properties to quickly get basic templates

```swift
let templates = try await OneEntryTemplates.shared.templates
templates.forCatalogProducts // forCatalogProducts templates as array of OneEntryTemplate
```

##### Available types by properties

- forCatalogProducts
- forBasketPage
- forErrorPage
- forCatalogPages
- forProductPreview
- forProductPage
- forSimilarProductBlock
- forStatisticProductBlock
- forProductBlock
- forForm
- forFormField
- forNewsPage
- forNewsBlock
- forNewsPreview
- forOneNewsPage
- forUsualPage
- forTextBlock
- forSlider
- service

#### Request templates by type
In order not to request all the templates from the server and search for the right one among them, you can immediately send the data according to the desired type.

```swift
let templates = try await OneEntryTemplates.shared.templates(with: "forCatalogProducts") 
```

### OneEntryTemplatePreviews

#### Getting all preview templates

```swift
let previews = try await OneEntryTemplatePreviews.shared.templates
```
The `OneEntryTemplatePreview` array will be responsed

```swift
/// Represents a template preview for a single entry, with support for localization.
public struct OneEntryTemplatePreview: Identifiable, Decodable, LocalizeContent {
    /// Unique identifier for the preview.
    public let id: Int
    /// Version of the template, if available.
    public let version: Int?
    /// Identifier for the template.
    public let identifier: String
    /// Localization information organized as a dictionary of LocalizeInfo objects, if available.
    public let localizeInfos: [String : LocalizeInfo]?
}
```

#### Getting a preview template by its id

```swift
let preview = try await OneEntryTemplatePreviews.shared.template(with: 1)
```

The `OneEntryTemplatePreview` model will be responsed

```swift
/// Represents a template preview for a single entry, with support for localization.
public struct OneEntryTemplatePreview: Identifiable, Decodable, LocalizeContent {
    /// Unique identifier for the preview.
    public let id: Int
    /// Version of the template, if available.
    public let version: Int?
    /// Identifier for the template.
    public let identifier: String
    /// Localization information organized as a dictionary of LocalizeInfo objects, if available.
    public let localizeInfos: [String : LocalizeInfo]?
}
```

#### Getting a preview template by its marker

```swift
let preview = try await OneEntryTemplatePreviews.shared.template(with: "preview")
```

The `OneEntryTemplatePreview` model will be responsed

```swift
/// Represents a template preview for a single entry, with support for localization.
public struct OneEntryTemplatePreview: Identifiable, Decodable, LocalizeContent {
    /// Unique identifier for the preview.
    public let id: Int
    /// Version of the template, if available.
    public let version: Int?
    /// Identifier for the template.
    public let identifier: String
    /// Localization information organized as a dictionary of LocalizeInfo objects, if available.
    public let localizeInfos: [String : LocalizeInfo]?
}
```

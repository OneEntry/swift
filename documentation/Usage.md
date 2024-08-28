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
    - [Payment for created orders](#payment-for-created-orders)
      - [Overview](#overview)
        - [Creating a payment session](#creating-a-payment-session)
    - [Creating and modification orders](#creating-and-modification-orders)
      - [Overview](#overview-1)
        - [Order creation](#order-creation)
        - [Order updating](#order-updating)
    - [Code generation](#code-generation)
      - [Overview](#overview-2)
      - [Code generation](#code-generation-1)
      - [Code verification](#code-verification)
    - [Changing the password in case of loss of access to the account](#changing-the-password-in-case-of-loss-of-access-to-the-account)
      - [Overview](#overview-3)
      - [Password change](#password-change)
    - [User authorization and management](#user-authorization-and-management)
      - [Overview](#overview-4)
      - [Authorization](#authorization)
      - [Getting a user](#getting-a-user)
      - [Logout](#logout)
      - [Changing user data](#changing-user-data)
    - [User registration and activation](#user-registration-and-activation)
      - [Overview](#overview-5)
      - [New user registration](#new-user-registration)
      - [User activation](#user-activation)
    - [AttributesService](#attributesservice)
      - [Getting all attributes within the set](#getting-all-attributes-within-the-set)
      - [Getting a single attribute within a set](#getting-a-single-attribute-within-a-set)
    - [BlocksService](#blocksservice)
      - [Getting a block by its marker](#getting-a-block-by-its-marker)
      - [Getting all block objects with pagination](#getting-all-block-objects-with-pagination)
    - [FormsService](#formsservice)
      - [Overview](#overview-6)
      - [Forms](#forms)
      - [Sending data to the form](#sending-data-to-the-form)
      - [Receiving data](#receiving-data)
    - [Attributes](#attributes)
      - [Overview](#overview-7)
      - [Receiving attributes](#receiving-attributes)
        - [Custom processing](#custom-processing)
        - [Processing of numerical values](#processing-of-numerical-values)
        - [Date and time processing](#date-and-time-processing)
        - [Files processing](#files-processing)
        - [Images processing](#images-processing)
        - [List with extended values](#list-with-extended-values)
        - [Text data types](#text-data-types)
          - [String](#string)
          - [Text](#text)
          - [Text with header](#text-with-header)
    - [CatalogService](#catalogservice)
      - [Receiving all products with pagination](#receiving-all-products-with-pagination)
      - [Getting all products uncategorized, with pagination](#getting-all-products-uncategorized-with-pagination)
      - [Getting all products in the category by its id, with pagination](#getting-all-products-in-the-category-by-its-id-with-pagination)
      - [Getting all products in the category by its url, with pagination](#getting-all-products-in-the-category-by-its-url-with-pagination)
      - [Getting related products for another product by its id](#getting-related-products-for-another-product-by-its-id)
      - [Getting a product by its id](#getting-a-product-by-its-id)
      - [Receiving blocks linked to the product](#receiving-blocks-linked-to-the-product)
      - [Product filter](#product-filter)
      - [Quick search](#quick-search)
      - [Product statuses](#product-statuses)
        - [All statuses](#all-statuses)
        - [Status by id](#status-by-id)
        - [Status by marker](#status-by-marker)
        - [Status marker validation](#status-marker-validation)
    - [PagesService](#pagesservice)
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
    - [ProjectService](#projectservice)
      - [File uploading](#file-uploading)
      - [Deleting files](#deleting-files)
      - [Getting all administrators](#getting-all-administrators)
      - [Getting all active locales](#getting-all-active-locales)
      - [Getting all general types](#getting-all-general-types)
      - [Getting a menu item by its marker](#getting-a-menu-item-by-its-marker)
      - [Testing error 404](#testing-error-404)
      - [Testing error 500](#testing-error-500)
    - [TemplatesService](#templatesservice)
      - [Getting all templates](#getting-all-templates)
        - [Available types by properties](#available-types-by-properties)
      - [Request templates by type](#request-templates-by-type)
    - [TemplatePreviewsService](#templatepreviewsservice)
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

### Payment for created orders

#### Overview

Most often, the user wants to pay for online orders immediately by card, without resorting to cash.
The `Payment Service` module has been created for this purpose.

You can connect payment services such as Stripe or PayPal and create a payment session

The payment session is the OneEntry entity that shows the available payment information.

The creation of a payment session implies the user's desire to pay for the order online, after its registration

##### Creating a payment session

> To create a session, you need to know the ID of the order that the user wants to pay for

```swift
let session = try await service.createSession(order: 27, type: .session)
```

The session information contains all the necessary information for further payment. You can combine the result with the sdk of payment services and pay for orders


### Creating and modification orders

#### Overview

With the help of sdk you can create, modify and receive orders.

> Important: For many operations, you need to have an authorized client through ``AuthService``.

##### Order creation

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

##### Order updating

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


### Code generation

Sending and checking verification codes

#### Overview

OneEntry supports sending verification codes.
Three scenarios are supported for this:

- Password change
- Registration
- User code

You can customize the message template in the event settings in your personal account

![Events](oneentry-code-event.png)

#### Code generation

After setting up the necessary event, we can start code generation. 

```swift
let email = "oneentry@sample.com"
try await AuthService.shared.generateCode(email, event: "send_code", with: "email")
```

#### Code verification

Password or registration codes are checked by ``AuthService/changePassword(user:code:password:confirmation:with:)`` and ``AuthService/activate(user:code:with:)`` methods, respectively.

To check the user code, use the ``AuthService/check(_:code:with:)`` method

```swift
let email = "oneentry@sample.com"
let code = "123456"
let success = try await AuthService.shared.check(email, code: code, with: "email")
```

### Changing the password in case of loss of access to the account

Changing the password in case the user has forgotten it

#### Overview

To change the password in case of its loss, you should follow a few steps:

1. Send verification code by user ID
2. Change the password using the activation code

> Important: Use this instruction only if you lose access to your account. Otherwise, you should use ``AuthService/changeUser(form:langCode:data:)``

#### Password change

```swift
let email = "oneentry@sample.com"
let code = "123456"
let success = try await AuthService.shared.changePassword(
    user: email,
    code: code,
    password: "password",
    confirmation: "password",
    with: "email"
)
```

### User authorization and management

Management of user data such as password, names, etc.

#### Overview

User authorization works on the principle of token exchange.
For the sake of simplicity, hide this process under the hood of the sdk. On
You always have the opportunity to get all the data for more detailed configuration.
Tokens are automatically saved in a keychain to implement auto login.

#### Authorization

```swift
let email = "oneentry@sample.com"
try await AuthService.shared.auth("email") {
    AuthData(marker: "email_auth", value: email)
    AuthData(marker: "pass_auth", value: "password")
}
```

This method performs obtaining authorization tokens. SDK independently monitor their relevance.

#### Getting a user

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let user = try await AuthService.shared.user
```

#### Logout

In fact, the output can be implemented in different ways and without this method.
However, its call is necessary to cancel authorization tokens

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let success = try await AuthService.shared.logout()
```

#### Changing user data

The method helps to change any data, including the password.

> Important: The method for obtaining user information is available only after successful authorization via sdk

```swift
let success = try await service.changeUser(form: "email_auth", langCode: "en_US") {
    AuthDataContainer {
        AuthData(
            marker: "pass_auth",
            value: "password"
        )
    }
    
    FormDataContainer {
        FormData(
            marker: "name_auth",
            value: "Arthur"
        )
    }
}
```

### User registration and activation

Registration and activation of new users. Verification using activation code.

#### Overview

OneEntry users can be created through your personal account on the website, or using our sdk.
In both cases, you must first configure the authentication provider. 
There you can configure many parameters, such as seret phrases, token formats, etc.
But the most important thing is the authorization form.

#### New user registration

After setting up the authorization provider, we can proceed to user registration.
For this purpose, the method ``AuthService/signUp(marker:form:langCode:data:)`` is used.

> Note: User registration supports sending data to an additional form using the `form` and ``AuthDataContainer`` parameters

```swift
let email = "oneentry@sample.com"
let phone = "+0000000000"
let user = try await AuthService.shared.signUp(
    marker: "email",
    form: "email_auth",
    langCode: "en_US"
) {
    AuthDataContainer {
        AuthData(marker: "email_auth", value: email)
        AuthData(marker: "pass_auth", value: "password")
        AuthData(marker: "email_notification", value: email)
    }
    
    FormDataContainer {
        FormData(marker: "name_auth", value: name)
    }
    
    NotificationData(email: email, phonePush: "<device_token>", phoneSMS: phone)
}
```

- ``AuthDataContainer`` - is responsible for the authorization data we configured above
- ``FormDataContainer`` - sends data to the `email_auth` form
- ``NotificationData`` - sends information to the registration

> Important: After a successful registration request, a confirmation code will be automatically sent to the selected address

#### User activation

User activation is needed to verify the authenticity of his data.

> Important: Without user activation, methods of working with him, such as authorization, will not work

```swift
let email = "oneentry@sample.com"
let otp = "123456"
let success = try await AuthService.shared.activate(user: email, code: otp, with: "email")
```

### AttributesService

Sometimes you need to be able to get information about an attribute. Most often, this requires to get all the elements of the list: all colors, stickers, etc. This service will help to solve this problem

#### Getting all attributes within the set

This method allows you to get all the attributes within the set. Sets are tied to OneEntry entities (products, blocks, pages, etc.)

```swift
let attributes = try await AttributesService.shared.attributes(from: "all", langCode: "en_US")
```

#### Getting a single attribute within a set

This method can be useful if you know where to look for the necessary attribute and need to get information about it

```swift
let attribute = try await AttributesService.shared.attribute(with: "list", from: "all", langCode: "en_US")
```

### BlocksService

Controllers for working with block objects

#### Getting a block by its marker

> This method automatically detects the type and loads the data of the product blocks.
> If you need manual control to get products, use ``BlocksService/products(_:offset:limit:langCode:)`` or ``BlocksService/similarProducts(_:offset:limit:langCode:)``

```swift
let block = try await BlocksService.shared.block("dev", langCode: "en_US")
```

``OneEntryBlock`` will return as a result

#### Getting all block objects with pagination

> The result of this method does not include the content of product blocks

```swift
let blocks = try await BlocksService.shared.blocks(langCode: "en_US")
```

### FormsService

#### Overview

OneEntry Forms is a tool that allows you to store, receive and send user data.
This can be applied in many scenarios, such as users, orders, etc.

#### Forms

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

#### Sending data to the form

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

#### Receiving data

The functionality of receiving and processing the sent data may also be useful. 

You can get all the data sent:

```swift
let data = try await FormsService.shared.fetchData(langCode: "en_US")
```

Or request the data of a specific form by its identifier:

```swift
let data = try await FormsService.shared.data(with: "delivery")
```

### Attributes

Attributes can be added to all OneEntry entities. This is an important tool that allows you to transfer custom data

#### Overview

OneEntry attributes are used everywhere. All data types that can be processed using the ``OneEntry`` module can be found here ``AttributeType``.

> Important: For a more readable syntax, sdk uses `dynamicMember`. Therefore, do not be afraid of the absence of hints from autocompletion, the main thing is to specify the correct names of the attributes that coincide with the admin panel

#### Receiving attributes

Let's try to get the attributes from the page, for products and other entities the process will be similar

```swift
let page = try await OneEntryPages.shared.page(with: "dev", langCode: "en_US")
let attribute = page..attributeValues?.en_US.int
```

##### Custom processing

If you are sure that your attribute has accepted a specific data type, you can process `value` yourself

```swift
let value = attribute?.value as? Int
```

##### Processing of numerical values

All numeric OneEntry values (`real`, `integer`, `float`) can be easily converted to Swift data types

```swift
let attribute = page.attributeValues?.en_US.int
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
let date = page.attributeValues?.en_US.date?.dateValue
let time = page.attributeValues?.en_US.time?.dateValue
let dateTime = page.attributeValues?.en_US.date_time?.dateValue
```

##### Files processing

```swift
let attribute = page.attributeValues?.en_US.file?.fileValues
```

The ``OneEntryFile`` array will be returned as a response

##### Images processing

Attribute types such as `image` and `groupOfImages` are treated by sdk in the same way

```swift
let attributes = page.attributeValues?.en_US.image_group?.imageValues
```

The ``OneEntryImage`` array will be returned as an answer

##### List with extended values

OneEntry has a list attribute. It allows you to create a drop-down list in the admin panel and select some basic product settings (color sticker, etc.). For ease of use, any element of the list can be expanded with an additional parameter.

> You can get the element that expands the list through the model field ``OneEntryList/extended``

```swift
let attribute: OneEntryList = ...
let extended: String? = attribute.extended?.stringValue
```

##### Text data types

###### String

Most types of attributes can be obtained as a string

```swift
let value = page.attributeValues?.en_US.string?.stringValue
```

###### Text

```swift
let attribute = page.attributeValues?.en_US.text?.textValues
```

The ``OneEntryText`` structure will be returned as an answer

###### Text with header

```swift
let attribute = page..attributeValues?.en_US.header_text?.textWithHeaderValues
```

The array of ``OneEntryTextWithHeader`` structures will return as an answer

### CatalogService

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
let result = try await CatalogService.shared.products(langCode: "en_US")
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
let result = try await CatalogService.shared.emptyPageProducts(langCode: "en_US")
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
let result = try await CatalogService.shared.products(page: 12, langCode: "en_US")
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
let result = try await CatalogService.shared.products(page: "dev", langCode: "en_US")
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
let related = try await CatalogService.shared.relatedProducts(product: 191, langCode: "en_US")
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
let product = try await CatalogService.shared.product(with: id, langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// ID of related products for this product
    public let relatedIds: [Int]
    /// Product template ID
    public let templateIdentifier: String?
    /// Product attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

#### Receiving blocks linked to the product

> To get blocks tied to the product, you should use the method ``CatalogService/blocks(for:)``, as indicated in the example
```swift
let blocks = try await CatalogService.shared.blocks(for: 15)
```

The answer will return ``OneEntryBlock`` array

#### Product filter

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
let results = try await CatalogService.shared.quickSearch("iPhone", langCode: "en_US")
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
let statuses: [OneEntryProductStatus] = try await CatalogService.shared.productStatuses
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
    public let localizeInfos: LocalizedInfoCollection?
}
```

##### Status by id

```swift
let status: OneEntryProductStatus = try await CatalogService.shared.productStatus(with: 2)
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
    public let localizeInfos: LocalizedInfoCollection?
}
```

##### Status by marker

```swift
let status: OneEntryProductStatus = try await CatalogService.shared.productStatus(with: "storage")
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
    public let localizeInfos: LocalizedInfoCollection?
}
```

##### Status marker validation

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

### PagesService

#### Getting all the blocks tied to the page

To get all the blocks, you should use the ``PagesService/blocks(page:langCode:)`` method. To use it, you need to know the page address and language code. The ``OneEntryBlock`` array will return as the answer.

```swift
let blocks = try await PagesService.shared.blocks(page: "url", langCode: "en_US")
```

#### Getting child pages
In OneEntry it is possible to position pages in a flash style, which means that it is possible to get a list of child pages for the main entity

```swift
let rootURL = "dev"
let children: [OneEntryPage] = try await PagesService.shared.children(for: rootURL, langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

#### Getting the root pages

Getting top-level pages. These are the pages whose `parentId` is equal to `nil`

```swift
let root: [OneEntryPage] = try await PagesService.shared.rootPages(langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
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
let catalog: [OneEntryPage] = try await PagesService.shared.catalogPages(langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

#### Getting all the pages

Getting all OneEntry pages

```swift
let pages: [OneEntryPage] = try await PagesService.shared.pages(langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

#### Getting one page with all the information

##### Receiving by id

```swift
let page: OneEntryPage = try await PagesService.shared.page(with: 12, langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

##### Receiving by URL

```swift
let page: OneEntryPage = try await PagesService.shared.page(with: "dev", langCode: "en_US")
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Page attributes
    public let attributeValues: LocalizedAttributeCollection?
}
```

#### Getting a page config

##### Receiving by URL

```swift
let config: OneEntryPageConfig = try await PagesService.shared.config(with: "dev")
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
let result: [OneEntrySearchPage] = try await PagesService.shared.quickSearch("Development", langCode: "en_US")
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

### ProjectService

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
let result = try await ProjectService.shared.uploadFile(fileURL: url, type: "page", entity: "test", id: 15)
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

try await ProjectService.shared.deleteFile(name: name, type: "page", entity: "test", id: 15)
```

#### Getting all administrators
```swift
let admins = try await ProjectService.shared.admins
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
let locales = try await ProjectService.shared.activeLocales
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
let types = try await ProjectService.shared.generalTypes
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
let menu = try await ProjectService.shared.menu(with: "dev")
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
    public let localizeInfos: LocalizedInfoCollection?
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
    public let localizeInfos: LocalizedInfoCollection?
    /// Child pages
    public var children: [OneEntryMenuPage]?
}
```

#### Testing error 404
```swift
do {
    try await ProjectService.shared.test404()
} catch let error as OneEntryError where error.statusCode == 404 {
    // handle 404 error
} catch {
    // Other errors
}
```


#### Testing error 500
```swift
do {
    try await ProjectService.shared.test500()
} catch let error as OneEntryError where error.statusCode == 500 {
    // handle 500 error
} catch {
    // Other errors
}
```

### TemplatesService

#### Getting all templates

```swift
let templates = try await TemplatesService.shared.templates
```

This property returns an array of `OneEntryAllTemplates`. This model contains the `asDisctionary` field, which stores the data of all templates by key. 

```swift
let templates = try await TemplatesService.shared.templates
template.asDictionary["forCatalogProducts"] // forCatalogProducts templates as array of OneEntryTemplate
```

There are also have properties to quickly get basic templates

```swift
let templates = try await TemplatesService.shared.templates
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
let templates = try await TemplatesService.shared.templates(with: "forCatalogProducts") 
```

### TemplatePreviewsService

#### Getting all preview templates

```swift
let previews = try await TemplatePreviewsService.shared.templates
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
    public let localizeInfos: LocalizedInfoCollection?
}
```

#### Getting a preview template by its id

```swift
let preview = try await TemplatePreviewsService.shared.template(with: 1)
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
    public let localizeInfos: LocalizedInfoCollection?
}
```

#### Getting a preview template by its marker

```swift
let preview = try await TemplatePreviewsService.shared.template(with: "preview")
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
    public let localizeInfos: LocalizedInfoCollection?
}
```



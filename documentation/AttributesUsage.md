# Attributes

Attributes can be added to all OneEntry entities. This is an important tool that allows you to transfer custom data

## Overview

OneEntry attributes are used everywhere. All data types that can be processed using the ``OneEntry`` module can be found here ``AttributeType``.

> Important: For a more readable syntax, sdk uses `dynamicMember`. Therefore, do not be afraid of the absence of hints from autocompletion, the main thing is to specify the correct names of the attributes that coincide with the admin panel

@Row {
    @Column(size: 2) {
        ![Attributes](oneentry-attributes)
    }
    
    @Column {
        For example, there is such a set of attributes. And we are interested in the release date field

        Then getting it will look like this:
    }
}

```swift
let release = product.attributeValues?.en_US.release?.dateValue
```

> Tip: If you don't like this setting, there is an outdated method of obtaining an attribute. ``LocalizeContent/localizeAttribute(_:languageCode:)-zuyk``
> ```swift
> let release = product.localizeAttribute("release", languageCode: "en_US")?.dateValue
> ```

## Receiving attributes

Let's try to get the attributes from the page, for products and other entities the process will be similar

```swift
let page = try await OneEntryPages.shared.page(with: "dev", langCode: "en_US")
let attribute = page..attributeValues?.en_US.int
```

### Custom processing

If you are sure that your attribute has accepted a specific data type, you can process `value` yourself

```swift
let value = attribute?.value as? Int
```

### Processing of numerical values

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

### Date and time processing

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

### Files processing

```swift
let attribute = page.attributeValues?.en_US.file?.fileValues
```

The ``OneEntryFile`` array will be returned as a response

### Images processing

Attribute types such as `image` and `groupOfImages` are treated by sdk in the same way

```swift
let attributes = page.attributeValues?.en_US.image_group?.imageValues
```

The ``OneEntryImage`` array will be returned as an answer

### List with extended values

OneEntry has a list attribute. It allows you to create a drop-down list in the admin panel and select some basic product settings (color sticker, etc.). For ease of use, any element of the list can be expanded with an additional parameter.

> You can get the element that expands the list through the model field ``OneEntryList/extended``

```swift
let attribute: OneEntryList = ...
let extended: String? = attribute.extended?.stringValue
```

### Text data types

#### String

Most types of attributes can be obtained as a string

```swift
let value = page.attributeValues?.en_US.string?.stringValue
```

#### Text

```swift
let attribute = page.attributeValues?.en_US.text?.textValues
```

The ``OneEntryText`` structure will be returned as an answer

#### Text with header

```swift
let attribute = page..attributeValues?.en_US.header_text?.textWithHeaderValues
```

The array of ``OneEntryTextWithHeader`` structures will return as an answer

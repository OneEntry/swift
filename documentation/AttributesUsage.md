# Attributes

Attributes can be added to all OneEntry entities. This is an important tool that allows you to transfer custom data

## Receiving attributes

Let's try to get the attributes from the page, for products and other entities the process will be similar

```swift
let page = try await OneEntryPages.shared.page(with: "dev", langCode: "en_US")
let attribute = page.localizeAttribute("int", languageCode: "en_US")
```

### Custom processing

If you are sure that your attribute has accepted a specific data type, you can process `value` yourself

```swift
let value = attribute?.value as? Int
```

### Processing of numerical values

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

### Date and time processing

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

### Files processing

```swift
let attribute = page.localizeAttribute("file", languageCode: langCode)?.fileValues
```

The ``OneEntryFile`` array will be returned as a response

### Images processing

Attribute types such as `image` and `groupOfImages` are treated by sdk in the same way

```swift
let attributes = page.localizeAttribute("imagegroup", languageCode: langCode)?.imageValues
```

The ``OneEntryImage`` array will be returned as an answer

### Text data types

## String

Most types of attributes can be obtained as a string

```swift
let value = page.localizeAttribute("string", languageCode: "en_US")?.stringValue
```

## Text

```swift
let attribute = page.localizeAttribute("text", languageCode: langCode)?.textValues
```

The ``OneEntryText`` structure will be returned as an answer

## Text with header

```swift
let attribute = page.localizeAttribute("header_text", languageCode: langCode)?.textWithHeaderValues
```

The array of ``OneEntryTextWithHeader`` structures will return as an answer

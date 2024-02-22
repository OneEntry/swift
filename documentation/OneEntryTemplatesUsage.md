# OneEntryTemplates

Controllers for working with template objects

## Getting all templates

```swift
let templates = try await OneEntryTemplates.shared.templates
```

This property returns an array of ``OneEntryAllTemplates``. This model contains the `asDisctionary` field, which stores the data of all templates by key. 

```swift
let templates = try await OneEntryTemplates.shared.templates
template.asDictionary["forCatalogProducts"] // forCatalogProducts templates as array of OneEntryTemplate
```

There are also have properties to quickly get basic templates. A list of all properties can be found here ``OneEntryAllTemplates``

```swift
let templates = try await OneEntryTemplates.shared.templates
templates.forCatalogProducts // forCatalogProducts templates as array of OneEntryTemplate
```

## Request templates by type
> In order not to request all the templates from the server and search for the right one among them, you can immediately send the data according to the desired type.

```swift
let templates = try await OneEntryTemplates.shared.templates(with: "forCatalogProducts") 
```

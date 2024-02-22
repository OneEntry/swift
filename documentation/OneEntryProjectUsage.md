# OneEntryProject

With this class, you can configure work with projects: files, available locales and error testing

## File uploading

OneEntry supports the ability to save your files to storage. To do this, you need to specify additional information about the file.

|  Field   | Description                                                                                         |
| :------: | --------------------------------------------------------------------------------------------------- |
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

The ``OneEntryFile`` array will be returned as a response

## Deleting files

This SDK method allows you to delete saved files. Additional fields must also be specified for it.

| Field  | Description                                                                                         |
| :----: | --------------------------------------------------------------------------------------------------- |
|  name  | File name                                                                                           |
|  type  | Type, determines the folder name in the storage                                                     |
| entity | Entity name from which the file is uploaded, determines the folder name in the storage              |
|   id   | identifier of the object from which the file is uploaded, determines the folder name in the storage |

```swift
let name = "dev.png"

try await OneEntryProject.shared.deleteFile(name: name, type: "page", entity: "test", id: 15)
```

## Getting all administrators
```swift
let admins = try await OneEntryProject.shared.admins
```

The answer will be array of ``OneEntryAdmin``

## Getting all active locales
```swift
let locales = try await OneEntryProject.shared.activeLocales
```

The answer will be array of ``OneEntryLocale``

## Getting all general types
```swift
let types = try await OneEntryProject.shared.generalTypes
```
The answer will be array of ``OneEntryGeneralType``

## Getting a menu item by its marker

The menu is a very important essence of OneEntry. It allows you to group pages by features. These pages will be returned as a tree, and you can easily get all the subpages (children) of each page

```swift
let menu = try await OneEntryProject.shared.menu(with: "dev")
```

The answer will be the ``OneEntryMenu`` structure

## Testing error 404
```swift
do {
    try await OneEntryProject.shared.test404()
} catch let error as OneEntryError where error.statusCode == 404 {
    // handle 404 error
} catch {
    // Other errors
}
```

## Testing error 500
```swift
do {
    try await OneEntryProject.shared.test500()
} catch let error as OneEntryError where error.statusCode == 500 {
    // handle 500 error
} catch {
    // Other errors
}
```

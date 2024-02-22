# OneEntry iOS Sdk

- [OneEntry iOS Sdk](#oneentry-ios-sdk)
  - [Supported platforms](#supported-platforms)
  - [Installation](#installation)
    - [CocoaPods](#cocoapods)
      - [dyld\[\]: missing symbol called](#dyld-missing-symbol-called)
    - [Swift Package Manager](#swift-package-manager)
  - [Documentation](#documentation)
  - [License](#license)

HeadlessCMS OneEntry is based on many years of unique experience of CMS developers and users. We know what everyone needs and our product is created taking into account the needs of business, users and developers. All tools are designed for development and ease of interaction with your projects.

## Supported platforms

| Platform | Versions |
| -------- | :------: |
| iOS      |  13.0+   |
| MacOS    |  10.15+  |
| WatchOS  |   6.0+   |
| tvOS     |  13.0+   |

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate OneEntry into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'OneEntry'
```

#### dyld[]: missing symbol called

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

### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding OneEntry as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/OneEntry/oneentry-ios-sdk", .upToNextMajor(from: "1.1.0"))
]
```

## Documentation
We provide documentation in several formats:
- [DocC](https://oneentry.github.io/oneentry-ios-sdk/documentation/oneentry/)
- [OneEntry](https://oneentry.cloud/en/instructions#SWIFT)
- [Markdown](https://github.com/OneEntry/oneentry-ios-sdk/blob/main/documentation)

## [License](https://github.com/OneEntry/oneentry-ios-sdk/blob/main/LICENSE.txt)
Content management system OneEntry
© 2023 OneEntry, by [oneentry.cloud](https://oneentry.cloud/)

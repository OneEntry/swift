// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OneEntry",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OneEntry",
            targets: ["OneEntryTarget"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OneEntryTarget",
            dependencies: [
                "OneEntryFramework",
                "Moya",
                "Alamofire"
            ]
        ),
        .binaryTarget(
            name: "OneEntryFramework",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.4/XCFrameworks.zip",
            checksum: "143dc5d7a1ff093321c6fc7f51c91b18f1c11f8291a7633b555726a6e39173d1"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.4/Alamofire.zip",
            checksum: "4a518ffa95950fa8d0490bf9c1d3217bace464a9d94bc4ed8d8a6c9bc69630eb"
        ),
        .binaryTarget(
            name: "Moya",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.4/Moya.zip",
            checksum: "7b6f48587546ad4530000beab9b8fab2d735480cbff9e26969ab3960bd006a71"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

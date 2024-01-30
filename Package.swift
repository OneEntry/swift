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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.7/XCFrameworks.zip",
            checksum: "31e36717fbffda6745b4ff4dff74a8f3836cd080f075b1377f1d6773d2673c85"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.7/Alamofire.zip",
            checksum: "6f2cfca72db76154ee395ced93b95757b9413dba38a8d9050220725c5cb743da"
        ),
        .binaryTarget(
            name: "Moya",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.7/Moya.zip",
            checksum: "81f738d5116c91ab28eddf8001d9fcfe3b2ed008970f791cf8e35708bc8a486b"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

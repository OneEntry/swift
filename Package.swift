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
                "HMNetworking",
                "Alamofire"
            ]
        ),
        .binaryTarget(
            name: "OneEntryFramework",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.7/XCFrameworks.zip",
            checksum: "7837fc20e02c8538431a137bbba319d0dfcfa637f00d46c3ec61434e1e433252"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.7/Alamofire.zip",
            checksum: "c062bc7a3742a7723af72512f8ebe8791f618212d7d6849ddab765b54d99801a"
        ),
        .binaryTarget(
            name: "HMNetworking",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.7/HMNetworking.zip",
            checksum: "e14d476379ab72470f29592268030d429eac7c09a443b7902c09ad0dc1d72d70"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

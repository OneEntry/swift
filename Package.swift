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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.5/XCFrameworks.zip",
            checksum: "c5a807f832d48e83fbea97754c176570a5d55a135c0eaae1581f36825106390b"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.5/Alamofire.zip",
            checksum: "26b22e0de965e3aa23f3cbc6d3fbd31fa4687da39d2220c6ab69e485e3e37b7a"
        ),
        .binaryTarget(
            name: "Moya",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.0.5/Moya.zip",
            checksum: "33ec5f95e50486af94699ff33d03dbcab6dca579f4e4277035421314235958c6"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

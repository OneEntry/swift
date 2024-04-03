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
                "OneEntry",
                "HMNetworking",
                "Alamofire"
            ]
        ),
        .binaryTarget(
            name: "OneEntry",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.8/XCFrameworks.zip",
            checksum: "1dadddd4505ff07f6f27fd554607745003ab00aa1290a4fe5f21dae6ef9e6c1c"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.8/Alamofire.zip",
            checksum: "b9a250cc448892fcbff1e5988667aeaae4fa7e359a211cb94079672b94ee63ab"
        ),
        .binaryTarget(
            name: "HMNetworking",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.8/HMNetworking.zip",
            checksum: "0dfb71f20d0d12c5bacdbe814d9e89a622d504c129e64a69e21b4d643a7c604c"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

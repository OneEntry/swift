// swift-tools-version: 6.0
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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.1/XCFrameworks.zip",
            checksum: "33070c2ee910be176809d38ee1dcd6e1a71cd342f3202a0045520cf1c68b6828"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.1/Alamofire.zip",
            checksum: "b8435c0d2e41f64d049ac161d59d3cefcebeea6f16e88709ad19080689e0260c"
        ),
        .binaryTarget(
            name: "HMNetworking",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.1/HMNetworking.zip",
            checksum: "c054d0163c1c120e8b72d394d4b6d7e7ea118f8d4a77636815bdfea9fe09dc96"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

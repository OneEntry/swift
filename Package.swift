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
            targets: [ "OneEntry" ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "OneEntry",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.3/XCFrameworks.zip",
            checksum: "15429553900fd2f5d14a2c8d5d2277508e5743316adef0bd39a36fd15048bdcc"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntry"]
        )
    ]
)

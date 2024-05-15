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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.0/XCFrameworks.zip",
            checksum: "8abd06bf5971e2d1417672940e3630671cd7dd929561751d6a008ba9dfe49b4c"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.0/Alamofire.zip",
            checksum: "634e0a0ac06a95aecaba2083be8026af8b46a344384b0827f0e131dc2864a0d0"
        ),
        .binaryTarget(
            name: "HMNetworking",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.2.0/HMNetworking.zip",
            checksum: "164650b2ca978edeb49ac4f2475a840655b64d8187ef271382c5206638d9bd35"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

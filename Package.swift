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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.9/XCFrameworks.zip",
            checksum: "0ab87ebd66b2af7ad2f9ae989334c22cec2530bbb80b36bd678c79addcc1d4e1"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.9/Alamofire.zip",
            checksum: "7ba5c66e8da20c501dd2c35217e960b42b7aa68fc7cf05fcb9e481046bc649e8"
        ),
        .binaryTarget(
            name: "HMNetworking",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.9/HMNetworking.zip",
            checksum: "13310f76d4ea723dbfc13a35ceec67d54df33c649543cc6fdf750c9a35d97e8d"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

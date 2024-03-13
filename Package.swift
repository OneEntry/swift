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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.5/XCFrameworks.zip",
            checksum: "abb150de4629e0289a9bea3ab5efb778d6ee790e59ab87b3623f58d03626f518"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.5/Alamofire.zip",
            checksum: "c6b7512902b17f552b9c5274d2ef2854b9934fe6ba19697aee71b494b97cb046"
        ),
        .binaryTarget(
            name: "Moya",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.5/Moya.zip",
            checksum: "45706a802b401d7ce3b70d5efcab4f83ee64c34ae021234e481353265ea6c113"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

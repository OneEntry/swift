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
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.6/XCFrameworks.zip",
            checksum: "01864294b0b339df6baab5879ed4bf6144df823991c296adb56e36551d1def46"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.6/Alamofire.zip",
            checksum: "45b02277179fd4603070e383b780a75d5a0702aaa68038657a648d6d6dc4bc9c"
        ),
        .binaryTarget(
            name: "Moya",
            url: "https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.6/Moya.zip",
            checksum: "a4c4701ab858d921172d3e750dde80ad5e3fbc048e4379f2b5cd9785883dbf3b"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

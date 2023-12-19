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
                "Alamofire"
            ]
        ),
        .binaryTarget(
            name: "OneEntryFramework",
            url: "https://firebasestorage.googleapis.com/v0/b/ar-garden-b5b0c.appspot.com/o/OneEntry%2FXCFrameworks.zip?alt=media&token=3e81adb9-e8a4-423e-a6e2-6a063ec55057",
            checksum: "a46198ea545033ece0aeee24446994254acd8dd34ac62eba60eef3224ee6b3c3"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: "https://firebasestorage.googleapis.com/v0/b/ar-garden-b5b0c.appspot.com/o/OneEntry%2FAlamofire.zip?alt=media&token=b499a741-bf20-4f70-9c1c-736d701690e6",
            checksum: "5d76d1fdda8a1326829825bd3d9d14c273ad055961960d77623069d9b4811237"
        ),
        .testTarget(
            name: "OneEntryTests",
            dependencies: ["OneEntryTarget"]
        )
    ]
)

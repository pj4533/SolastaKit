// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SolastaKit",
    platforms: [
        .macOS("10.10")
    ],
    products: [
        .library(
            name: "SolastaKit",
            targets: ["SolastaKit"]
        ),
    ],
    targets: [
        .target(
            name: "SolastaKit",
            resources: [
                .process("Resources")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)

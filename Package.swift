// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SolastaKit",
    platforms: [
        .macOS("10.10")
    ],
    products: [
        .library(
            name: "SolastaKit",
            targets: ["SolastaKit"]),
    ],
    targets: [
        .target(
            name: "SolastaKit",
            path: "SolastaKit")
    ],
    swiftLanguageVersions: [.v5, .v4_2]
)
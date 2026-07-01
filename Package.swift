// swift-tools-version: 6.3.1

import PackageDescription



extension String {
    static let localeStandard: Self = "Locale Standard"
}

extension String {
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var localeStandard: Self { .target(name: .localeStandard) }
    static var standards: Self { .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions") }
    static var bcp47: Self { .product(name: "BCP 47", package: "swift-bcp-47") }
    static var iso639: Self { .product(name: "ISO 639", package: "swift-iso-639") }
    static var iso3166: Self { .product(name: "ISO 3166", package: "swift-iso-3166") }
    static var iso15924: Self { .product(name: "ISO 15924", package: "swift-iso-15924") }
}

let package = Package(
    name: "swift-locale-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: "Locale Standard", targets: ["Locale Standard"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-standard-library-extensions.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-bcp-47.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-639.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-3166.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-15924.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Locale Standard",
            dependencies: [
                .standards,
                .bcp47,
                .iso639,
                .iso3166,
                .iso15924
            ]
        ),
        .testTarget(
            name: "Locale Standard Tests",
            dependencies: [
                "Locale Standard",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}

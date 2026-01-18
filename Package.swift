// swift-tools-version:6.2

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
    static var standardsTestSupport: Self { .product(name: "Test Primitives", package: "swift-test-primitives") }
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
        .library(name: .localeStandard, targets: [.localeStandard])
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-standard-library-extensions"),
        .package(path: "../../swift-primitives/swift-test-primitives"),
        .package(path: "../swift-bcp-47"),
        .package(path: "../swift-iso-639"),
        .package(path: "../swift-iso-3166"),
        .package(path: "../swift-iso-15924"),
    ],
    targets: [
        .target(
            name: .localeStandard,
            dependencies: [
                .standards,
                .bcp47,
                .iso639,
                .iso3166,
                .iso15924,
            ]
        ),
        .testTarget(
            name: .localeStandard.tests,
            dependencies: [
                .localeStandard,
                .standardsTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

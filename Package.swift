// swift-tools-version:6.0

import PackageDescription

extension String {
    static let localeStandard: Self = "Locale Standard"
}

extension String {
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var localeStandard: Self { .target(name: .localeStandard) }
    static var standards: Self { .product(name: "Standards", package: "swift-standards") }
    static var bcp47: Self { .product(name: "BCP 47", package: "swift-bcp-47") }
    static var iso639: Self { .product(name: "ISO 639", package: "swift-iso-639") }
    static var iso3166: Self { .product(name: "ISO 3166", package: "swift-iso-3166") }
    static var iso15924: Self { .product(name: "ISO 15924", package: "swift-iso-15924") }
    static var standardsTestSupport: Self { .product(name: "StandardsTestSupport", package: "swift-standards") }
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
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-bcp-47", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-iso-639", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-iso-3166", from: "0.1.0"),
        .package(url: "https://github.com/swift-standards/swift-iso-15924", from: "0.1.0"),
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

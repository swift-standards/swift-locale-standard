// Locale.swift
// Locale Standard
//
// A locale combining language, region, and script

import BCP_47
import ISO_15924
import ISO_3166
import ISO_639

/// A locale combining language, region, and script.
///
/// `Locale` represents a complete locale identifier following BCP 47 conventions,
/// composed of a language (required), region (optional), and script (optional).
///
/// ## Usage
///
/// ```swift
/// // Language only
/// let english = Locale(language: .en)
///
/// // Language + region
/// let americanEnglish = Locale(language: .en, region: .us)
/// let britishEnglish = Locale(language: .en, region: .gb)
///
/// // Language + script
/// let simplifiedChinese = Locale(language: .zh, script: .Hans)
/// let traditionalChinese = Locale(language: .zh, script: .Hant)
///
/// // Language + script + region
/// let serbianLatinSerbia = Locale(language: .sr, region: .rs, script: .Latn)
///
/// // Using static accessors
/// let locale = Locale.en_US
/// ```
///
/// ## Design Notes
///
/// - `Locale` is the complete locale representation (language + region + script)
/// - For pure language without region/script, use `Language`
/// - Interoperates with `BCP_47.LanguageTag` for standards compliance
///
/// - SeeAlso: ``Language`` for pure language identifiers
/// - SeeAlso: ``BCP_47.LanguageTag`` for the underlying BCP 47 standard
public struct Locale: Sendable, Equatable, Hashable {
    /// The language component
    public let language: Language

    /// The region component (ISO 3166-1 alpha-2), if specified
    public let region: ISO_3166.Alpha2?

    /// The script component (ISO 15924 alpha-4), if specified
    public let script: ISO_15924.Alpha4?

    /// Creates a locale with the specified components
    ///
    /// - Parameters:
    ///   - language: The language (required)
    ///   - region: The region (optional)
    ///   - script: The script (optional)
    public init(
        language: Language,
        region: ISO_3166.Alpha2? = nil,
        script: ISO_15924.Alpha4? = nil
    ) {
        self.language = language
        self.region = region
        self.script = script
    }

    /// Creates a locale from a Language (language-only locale)
    ///
    /// - Parameter language: The language
    public init(language: Language) {
        self.language = language
        self.region = nil
        self.script = nil
    }
}

// MARK: - BCP 47 Interoperability

extension Locale {
    /// Creates a locale from a BCP 47 language tag
    ///
    /// - Parameter tag: A BCP 47 language tag
    /// - Throws: If the language tag cannot be converted to a locale
    public init(_ tag: BCP_47.LanguageTag) throws {
        // Extract language
        let language: Language
        switch tag.language {
        case .iso639(let code):
            language = Language(code)
        case .reserved(let code):
            // Try to parse reserved codes as ISO 639
            let languageCode = try ISO_639.LanguageCode(code)
            language = Language(languageCode)
        }

        self.language = language
        self.script = tag.script

        // Extract region (only alpha-2 supported)
        if let region = tag.region {
            switch region {
            case .alpha2(let alpha2):
                self.region = alpha2
            case .numeric:
                // Numeric regions not directly supported in Locale
                self.region = nil
            }
        } else {
            self.region = nil
        }
    }

    /// Converts the locale to a BCP 47 language tag
    ///
    /// - Returns: A BCP 47 language tag representing this locale
    /// - Throws: If the locale cannot be converted to a valid BCP 47 tag
    public func languageTag() throws -> BCP_47.LanguageTag {
        var tagString = language.code.description

        if let script = script {
            tagString += "-\(script.value)"
        }

        if let region = region {
            tagString += "-\(region.value.uppercased())"
        }

        return try BCP_47.LanguageTag(tagString)
    }
}

// MARK: - String Representation

extension Locale: CustomStringConvertible {
    /// Returns the locale as a BCP 47-style string (e.g., "en-US", "zh-Hans")
    public var description: String {
        var result = language.description

        if let script = script {
            result += "-\(script.value)"
        }

        if let region = region {
            result += "-\(region.value.uppercased())"
        }

        return result
    }
}

// MARK: - Codable

extension Locale: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let tag = try BCP_47.LanguageTag(string)
        try self.init(tag)
    }
}

// MARK: - ExpressibleByStringLiteral (for convenience)

extension Locale: ExpressibleByStringLiteral {
    /// Creates a locale from a string literal
    ///
    /// - Warning: This will crash at runtime if the string is not a valid BCP 47 tag
    public init(stringLiteral value: String) {
        // swiftlint:disable:next force_try
        let tag = try! BCP_47.LanguageTag(value)
        // swiftlint:disable:next force_try
        try! self.init(tag)
    }
}

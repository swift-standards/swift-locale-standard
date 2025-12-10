// Language.swift
// Locale Standard
//
// A language without regional or script information

import ISO_639

/// A language without regional or script information.
///
/// `Language` provides a type-safe wrapper around `ISO_639.LanguageCode`,
/// representing a pure language identifier without region or script variants.
///
/// ## Usage
///
/// ```swift
/// // Using static accessors
/// let english = Language.en
/// let dutch = Language.nl
///
/// // From ISO 639 codes
/// let spanish = Language(.es)
/// let german = try Language("de")
///
/// // Access underlying code
/// print(english.code.alpha2)  // Optional("en")
/// print(english.code.alpha3)  // "eng"
/// ```
///
/// ## Design Notes
///
/// - `Language` represents a pure language (e.g., English, Dutch, Chinese)
/// - For language + region (e.g., en-US, zh-CN), use `Locale`
/// - For language + script (e.g., zh-Hans, sr-Latn), use `Locale`
/// - All ISO 639-1 languages are available via static accessors
///
/// - SeeAlso: ``Locale`` for language + region + script combinations
/// - SeeAlso: ``ISO_639.LanguageCode`` for the underlying ISO standard type
public struct Language: Sendable, Equatable, Hashable {
    /// The underlying ISO 639 language code
    public let code: ISO_639.LanguageCode

    /// Creates a language from an ISO 639 language code
    ///
    /// This is a total function since the input is already validated.
    ///
    /// - Parameter code: A validated ISO 639 language code
    public init(_ code: ISO_639.LanguageCode) {
        self.code = code
    }

    /// Creates a language from an ISO 639-1 (2-letter) code
    ///
    /// This is a total function since the input is already validated.
    ///
    /// - Parameter alpha2: A validated ISO 639-1 alpha-2 code
    public init(_ alpha2: ISO_639.Alpha2) {
        self.code = ISO_639.LanguageCode(alpha2: alpha2, alpha3: ISO_639.Alpha3(alpha2))
    }

    /// Creates a language from an ISO 639-2/3 (3-letter) code
    ///
    /// This is a total function since the input is already validated.
    ///
    /// - Parameter alpha3: A validated ISO 639-2/3 alpha-3 code
    public init(_ alpha3: ISO_639.Alpha3) {
        let alpha2 = ISO_639.Alpha2(alpha3)
        self.code = ISO_639.LanguageCode(alpha2: alpha2, alpha3: alpha3)
    }

    /// Creates a language from a string (partial function)
    ///
    /// Accepts either 2-letter (ISO 639-1) or 3-letter (ISO 639-2/3) codes.
    ///
    /// - Parameter string: Language code string
    /// - Throws: `ISO_639.Error` if the code is invalid
    public init(_ string: some StringProtocol) throws {
        self.code = try ISO_639.LanguageCode(string)
    }
}

// MARK: - String Representation

extension Language: CustomStringConvertible {
    /// Returns the preferred string representation (2-letter if available, otherwise 3-letter)
    public var description: String {
        code.description
    }
}

// MARK: - Codable

extension Language: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(code)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.code = try container.decode(ISO_639.LanguageCode.self)
    }
}

// MARK: - CaseIterable

extension Language: CaseIterable {
    /// All ISO 639-1 languages
    public static var allCases: [Language] {
        ISO_639.Alpha2.allCases.map { Language($0) }
    }
}

// MARK: - Convenience Properties

extension Language {
    /// The ISO 639-1 (2-letter) code, if available
    public var alpha2: ISO_639.Alpha2? {
        code.alpha2
    }

    /// The ISO 639-2/3 (3-letter) code
    public var alpha3: ISO_639.Alpha3 {
        code.alpha3
    }
}

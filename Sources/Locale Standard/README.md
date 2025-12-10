# Cross-Standard Conversions (Placeholder)

This file will contain cross-standard conversion extensions between locale standards.

## Future Extensions

When individual locale standard packages are created, this package will provide:

### BCP 47 ↔ ISO 639 + ISO 3166

```swift
extension BCP_47.LanguageTag {
    /// Initialize from ISO 639 language + ISO 3166 region
    public init(language: ISO_639.LanguageCode, region: ISO_3166.CountryCode?) throws
}

extension ISO_639.LanguageCode {
    /// Extract language code from BCP 47 tag
    public init(_ tag: BCP_47.LanguageTag) throws
}

extension ISO_3166.CountryCode {
    /// Extract region code from BCP 47 tag
    public init?(_ tag: BCP_47.LanguageTag)
}
```

### BCP 47 ↔ ISO 15924 (Script Codes)

```swift
extension BCP_47.LanguageTag {
    /// Initialize with script code
    public init(language: ISO_639.LanguageCode, script: ISO_15924.ScriptCode?, region: ISO_3166.CountryCode?) throws
}

extension ISO_15924.ScriptCode {
    /// Extract script code from BCP 47 tag
    public init?(_ tag: BCP_47.LanguageTag)
}
```

### ISO 3166 ↔ ISO 4217 (Country ↔ Currency)

```swift
extension ISO_4217.CurrencyCode {
    /// Get default currency for a country
    public static func `default`(for country: ISO_3166.CountryCode) -> ISO_4217.CurrencyCode?
}

extension ISO_3166.CountryCode {
    /// Get countries that use a currency
    public static func countries(using currency: ISO_4217.CurrencyCode) -> [ISO_3166.CountryCode]
}
```

## Architecture

Following the same pattern as swift-time-standard:

1. **Layer 1**: `swift-standards/Locale` - Foundation locale type
2. **Layer 2**: Individual standards
   - `swift-bcp-47` - BCP 47 language tags
   - `swift-iso-639` - Language codes
   - `swift-iso-3166` - Country codes
   - `swift-iso-4217` - Currency codes
   - `swift-iso-15924` - Script codes
3. **Layer 3**: `swift-locale-standard` (this package) - Cross-standard conversions

Each individual standard package will provide conversions to/from the foundation Locale type.
This package provides conversions BETWEEN the standards.

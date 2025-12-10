# Locale Standard

Unified locale standard providing cross-format conversions between locale standards in pure Swift.

## Overview

Locale Standard is an **aggregation package** that provides conversions BETWEEN different locale format standards (BCP 47, ISO 639, ISO 3166, ISO 4217, ISO 15924, etc.). It follows the same architectural pattern as [Time Standard](https://github.com/swift-standards/swift-time-standard), [EmailAddress Standard](https://github.com/swift-standards/swift-emailaddress-standard), and [URI Standard](https://github.com/swift-standards/swift-uri-standard).

## Status

**🚧 PLACEHOLDER - Individual standard packages not yet created 🚧**

This package structure is ready for implementation once the individual locale standard packages are created:
- `swift-bcp-47` (BCP 47 language tags)
- `swift-iso-639` (ISO 639 language codes)
- `swift-iso-3166` (ISO 3166 country codes)
- `swift-iso-4217` (ISO 4217 currency codes)
- `swift-iso-15924` (ISO 15924 script codes)

## Architecture

### Three-Layer Design

```
Layer 1: Foundation
    swift-standards/Locale          ← Foundation locale type

Layer 2: Individual Standards (each provides conversions to/from Locale)
    swift-bcp-47                    ← BCP 47 language tags (e.g., "en-US")
    swift-iso-639                   ← ISO 639 language codes (e.g., "en")
    swift-iso-3166                  ← ISO 3166 country codes (e.g., "US")
    swift-iso-4217                  ← ISO 4217 currency codes (e.g., "USD")
    swift-iso-15924                 ← ISO 15924 script codes (e.g., "Latn")

Layer 3: Cross-Standard Integration (THIS PACKAGE)
    swift-locale-standard           ← BCP 47 ↔ ISO 639+3166, etc.
```

### Responsibility Separation

1. **swift-standards/Locale**: Foundation locale type
   - Core `Locale.Locale` type
   - Language, region, script, variant fields
   - Locale-agnostic representation

2. **Individual standard packages** (when created):
   - Their own format-specific types
   - Extensions: `init(_ locale: Locale.Locale)` for converting FROM foundation Locale
   - Extensions: `extension Locale.Locale { init(_ format: FormatType) }` for converting TO foundation Locale

3. **swift-locale-standard** (this package):
   - Cross-standard conversions ONLY
   - Extensions: `init(_ otherFormat: OtherFormatType)` between standards
   - Example: `BCP_47.LanguageTag(language: ISO_639, region: ISO_3166)`

### Design Principles

1. **No Transformation Methods**: Only extension initializers
2. **Foundation as Hub**: Locale.Locale is the canonical representation
3. **Standards are Independent**: Each standard can work standalone
4. **Cross-Format via This Package**: Inter-standard conversions only in swift-locale-standard

## Future Usage (Once Standards Exist)

### Cross-Standard Conversions

```swift
import Locale_Standard
import BCP_47
import ISO_639
import ISO_3166

// BCP 47 → ISO 639 + ISO 3166
let tag = try BCP_47.LanguageTag("en-US")
let language = try ISO_639.LanguageCode(tag)  // "en"
let region = try ISO_3166.CountryCode(tag)    // "US"

// ISO 639 + ISO 3166 → BCP 47
let language = try ISO_639.LanguageCode("en")
let region = try ISO_3166.CountryCode("US")
let tag = try BCP_47.LanguageTag(language: language, region: region)  // "en-US"
```

### Via Foundation Locale (Hub Pattern)

```swift
import Locale  // From swift-standards
import BCP_47
import ISO_639

// Any format → Locale → Any other format

// BCP 47 → Locale → ISO 639
let tag = try BCP_47.LanguageTag("en-US")
let locale = try Locale.Locale(tag)              // Provided by swift-bcp-47
let language = try ISO_639.LanguageCode(locale)  // Provided by swift-iso-639
```

## Planned Standards

- **[BCP 47](https://tools.ietf.org/html/bcp47)** - Language tags (e.g., "en-US", "zh-Hans-CN")
- **[ISO 639](https://www.iso.org/iso-639-language-codes.html)** - Language codes (e.g., "en", "zh")
- **[ISO 3166](https://www.iso.org/iso-3166-country-codes.html)** - Country codes (e.g., "US", "CN")
- **[ISO 4217](https://www.iso.org/iso-4217-currency-codes.html)** - Currency codes (e.g., "USD", "EUR")
- **[ISO 15924](https://www.unicode.org/iso15924/)** - Script codes (e.g., "Latn", "Hans")

## Requirements

- Swift 6.0+
- macOS 15.0+ / iOS 18.0+ / tvOS 18.0+ / watchOS 11.0+

## Dependencies

- [swift-standards](https://github.com/swift-standards/swift-standards) - Foundation utilities and Locale

## Related Packages

**Same Pattern** (aggregation packages):
- **[swift-time-standard](https://github.com/swift-standards/swift-time-standard)** - Unified time (IMPLEMENTED)
- **[swift-emailaddress-standard](https://github.com/swift-standards/swift-emailaddress-standard)** - Unified email address
- **[swift-uri-standard](https://github.com/swift-standards/swift-uri-standard)** - Unified URI
- **[swift-domain-standard](https://github.com/swift-standards/swift-domain-standard)** - Unified domain

## Contributing

Contributions welcome! This package follows the swift-standards philosophy:

1. **Academic rigor**: Category theory foundations
2. **Type safety**: Invalid states unrepresentable
3. **Pure Swift**: No Foundation dependencies in core
4. **Standard compliance**: Literal implementation of specs
5. **No transformation methods**: Only extension initializers

## License

Apache License 2.0

## See Also

- **[Swift Standards Organization](https://github.com/swift-standards)** - All standards packages
- **[swift-time-standard](https://github.com/swift-standards/swift-time-standard)** - Similar aggregation pattern for time

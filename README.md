# swift-locale-standard

Use this package when you need a locale built from a language, an optional region and an optional script, read from or written as a BCP 47 tag such as `zh-Hans-CN`. Start from `Locale`, or from `Language` when you only need a language and its fallbacks. If you need the full BCP 47 grammar, such as variants and extensions, use `BCP47.LanguageTag` from swift-bcp-47.

## Laws

- A `Locale` describes itself as language, then script, then region, joined by hyphens. The region is always written uppercase, so `en-us` reads back as `en-US`.
- A tag a `Locale` cannot hold is refused instead of shortened: a region that is not an ISO 3166 alpha-2 country code, such as `419` in `es-419` or `DG` in `en-DG`, and any variant, extension or private use subtag.
- A locale round trips through its description and through `Locale.languageTag()`.
- With `Codable`, a `Locale` encodes as its tag string, such as `"pt-BR"`. A string that isn't a valid tag fails to decode.
- A two letter and a three letter code for the same language give equal values, so `Language("en")` equals `Language("eng")`.
- `Language.fallbackChain` lists the languages to try after this one, in order. English has an empty chain. Every other chain ends in English, never contains its own language, and names each language once.

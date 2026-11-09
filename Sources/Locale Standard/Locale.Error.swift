import BCP_47
import ISO_639

extension Locale {

    /// Why a BCP 47 language tag has no `Locale`.
    ///
    /// A `Locale` carries a language, an ISO 15924 script and an ISO 3166 alpha-2 region. A tag with
    /// anything else is rejected instead of being shortened to a different locale.
    public enum Error: Swift::Error, Sendable, Equatable {

        /// The language subtag is not an ISO 639 code.
        case language(ISO_639.Error)

        /// The region is a UN M.49 numeric code, such as `419` in `es-419`.
        case unsupportedRegion(String)

        /// The tag has variant subtags, such as `1901` in `de-DE-1901`.
        case unsupportedVariants([String])

        /// The tag has extensions, such as `u-ca-gregory`.
        case unsupportedExtensions([BCP47.LanguageTag.Extension])

        /// The tag has private use subtags, such as `x-private`.
        case unsupportedPrivateUse([String])
    }
}

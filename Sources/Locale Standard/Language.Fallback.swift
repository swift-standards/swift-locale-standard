// Language.Fallback.swift
// Locale Standard
//
// Language fallback chains for translation resolution

/// Language fallback chain support
///
/// Provides fallback chains for languages based on linguistic and geographical relationships.
/// Used for translation resolution when an exact match is unavailable.
///
/// ## Usage
///
/// ```swift
/// let fallbacks = Language.nl.fallbackChain  // [.en]
/// let fallbacks2 = Language.af.fallbackChain // [.nl, .en]
/// ```
///
/// ## Fallback Chain Design
///
/// Fallback chains follow these principles:
/// 1. **Linguistic proximity**: Related languages first (e.g., Afrikaans → Dutch)
/// 2. **Regional influence**: Former colonial languages (e.g., Lingala → French)
/// 3. **Universal fallback**: English as the final fallback for most languages
///
extension Language {
    /// Returns the fallback chain for this language.
    ///
    /// The fallback chain is ordered by preference, with the most similar
    /// language first and English typically last.
    ///
    /// - Returns: An array of languages to try in order when this language is unavailable
    public var fallbackChain: [Language] {
        // Use the alpha2 code for matching, fall back to English if unknown
        guard let alpha2 = code.alpha2 else {
            return [.en]
        }

        return Self.fallbackChains[alpha2.value] ?? [.en]
    }

    /// Fallback chain lookup table
    ///
    /// Maps ISO 639-1 codes to their fallback chains.
    /// Languages not in this table default to [.en].
    private static let fallbackChains: [String: [Language]] = [
        // Abkhazian → Russian → Georgian → English
        "ab": [.ru, .ka, .en],

        // Afar → Amharic → Oromo → Somali → Tigrinya → English
        "aa": [.am, .om, .so, .ti, .en],

        // Afrikaans → Dutch → English
        "af": [.nl, .en],

        // Akan → English
        "ak": [.en],

        // Albanian → Italian → English
        "sq": [.it, .en],

        // Amharic → Oromo → Somali → Tigrinya → English
        "am": [.om, .so, .ti, .en],

        // Arabic → English
        "ar": [.en],

        // Aragonese → Spanish → English
        "an": [.es, .en],

        // Armenian → English
        "hy": [.en],

        // Assamese → English
        "as": [.en],

        // Avaric → English
        "av": [.en],

        // Avestan → English
        "ae": [.en],

        // Aymara → Spanish → English
        "ay": [.es, .en],

        // Azerbaijani → English
        "az": [.en],

        // Bambara → English
        "bm": [.en],

        // Bashkir → English
        "ba": [.en],

        // Basque → Spanish → French → English
        "eu": [.es, .fr, .en],

        // Belarusian → Russian → English
        "be": [.ru, .en],

        // Bengali → English
        "bn": [.en],

        // Bislama → English
        "bi": [.en],

        // Bosnian → English
        "bs": [.en],

        // Breton → French → English
        "br": [.fr, .en],

        // Bulgarian → English
        "bg": [.en],

        // Burmese → English
        "my": [.en],

        // Catalan → Spanish → French → Portuguese → English
        "ca": [.es, .fr, .pt, .en],

        // Chamorro → English
        "ch": [.en],

        // Chechen → English
        "ce": [.en],

        // Chinese → English
        "zh": [.en],

        // Chuvash → English
        "cv": [.en],

        // Cornish → English
        "kw": [.en],

        // Corsican → French → English
        "co": [.fr, .en],

        // Cree → English
        "cr": [.en],

        // Croatian → English
        "hr": [.en],

        // Czech → English
        "cs": [.en],

        // Danish → English
        "da": [.en],

        // Dutch → English
        "nl": [.en],

        // Dzongkha → English
        "dz": [.en],

        // English → (no fallback)
        "en": [],

        // Esperanto → English
        "eo": [.en],

        // Estonian → Russian → English
        "et": [.ru, .en],

        // Ewe → English
        "ee": [.en],

        // Faroese → Danish → English
        "fo": [.da, .en],

        // Fijian → English
        "fj": [.en],

        // Finnish → Swedish → English
        "fi": [.sv, .en],

        // French → English
        "fr": [.en],

        // Galician → Spanish → English
        "gl": [.es, .en],

        // Gaelic (Scottish) → English
        "gd": [.en],

        // Georgian → Russian → English
        "ka": [.ru, .en],

        // German → English
        "de": [.en],

        // Greek → English
        "el": [.en],

        // Guarani → Spanish → English
        "gn": [.es, .en],

        // Gujarati → English
        "gu": [.en],

        // Haitian Creole → French → English
        "ht": [.fr, .en],

        // Hausa → French → English
        "ha": [.fr, .en],

        // Hebrew → English
        "he": [.en],

        // Herero → English
        "hz": [.en],

        // Hindi → English
        "hi": [.en],

        // Hiri Motu → English
        "ho": [.en],

        // Hungarian → English
        "hu": [.en],

        // Icelandic → English
        "is": [.en],

        // Ido → English
        "io": [.en],

        // Igbo → English
        "ig": [.en],

        // Indonesian → English
        "id": [.en],

        // Interlingua → English
        "ia": [.en],

        // Interlingue → English
        "ie": [.en],

        // Inuktitut → English
        "iu": [.en],

        // Inupiak → English
        "ik": [.en],

        // Irish → English
        "ga": [.en],

        // Italian → English
        "it": [.en],

        // Japanese → English
        "ja": [.en],

        // Javanese → Indonesian → English
        "jv": [.id, .en],

        // Kannada → English
        "kn": [.en],

        // Kanuri → French → English
        "kr": [.fr, .en],

        // Kashmiri → English
        "ks": [.en],

        // Kazakh → Russian → English
        "kk": [.ru, .en],

        // Khmer → English
        "km": [.en],

        // Kikuyu → English
        "ki": [.en],

        // Kinyarwanda → English
        "rw": [.en],

        // Kirundi → English
        "rn": [.en],

        // Komi → English
        "kv": [.en],

        // Kongo → English
        "kg": [.en],

        // Korean → English
        "ko": [.en],

        // Kurdish → Arabic → English
        "ku": [.ar, .en],

        // Kwanyama → Portuguese → English
        "kj": [.pt, .en],

        // Kyrgyz → Russian → English
        "ky": [.ru, .en],

        // Lao → English
        "lo": [.en],

        // Latin → English
        "la": [.en],

        // Latvian → Russian → English
        "lv": [.ru, .en],

        // Limburgish → Dutch → English
        "li": [.nl, .en],

        // Lingala → French → English
        "ln": [.fr, .en],

        // Lithuanian → Russian → English
        "lt": [.ru, .en],

        // Luba-Katanga → English
        "lu": [.en],

        // Luxembourgish → French → German → English
        "lb": [.fr, .de, .en],

        // Macedonian → English
        "mk": [.en],

        // Malagasy → French → English
        "mg": [.fr, .en],

        // Malay → English
        "ms": [.en],

        // Malayalam → English
        "ml": [.en],

        // Maltese → English
        "mt": [.en],

        // Manx → English
        "gv": [.en],

        // Maori → English
        "mi": [.en],

        // Marathi → English
        "mr": [.en],

        // Marshallese → English
        "mh": [.en],

        // Mongolian → English
        "mn": [.en],

        // Nauru → English
        "na": [.en],

        // Navajo → English
        "nv": [.en],

        // Ndonga → English
        "ng": [.en],

        // Nepali → English
        "ne": [.en],

        // Northern Ndebele → English
        "nd": [.en],

        // Norwegian → English
        "no": [.en],

        // Norwegian Bokmål → Norwegian → English
        "nb": [.no, .en],

        // Norwegian Nynorsk → Norwegian → English
        "nn": [.no, .en],

        // Occitan → Spanish → English
        "oc": [.es, .en],

        // Ojibwe → English
        "oj": [.en],

        // Oriya → English
        "or": [.en],

        // Oromo → English
        "om": [.en],

        // Ossetian → Russian → English
        "os": [.ru, .en],

        // Pali → English
        "pi": [.en],

        // Persian → Arabic → English
        "fa": [.ar, .en],

        // Polish → English
        "pl": [.en],

        // Portuguese → English
        "pt": [.en],

        // Punjabi → English
        "pa": [.en],

        // Quechua → Spanish → English
        "qu": [.es, .en],

        // Romanian → Russian → English
        "ro": [.ru, .en],

        // Romansh → French → Italian → German → English
        "rm": [.fr, .it, .de, .en],

        // Russian → English
        "ru": [.en],

        // Sami → Norwegian → English
        "se": [.no, .en],

        // Samoan → English
        "sm": [.en],

        // Sango → French → English
        "sg": [.fr, .en],

        // Sanskrit → English
        "sa": [.en],

        // Serbian → Albanian → English
        "sr": [.sq, .en],

        // Sesotho → English
        "st": [.en],

        // Setswana → English
        "tn": [.en],

        // Shona → English
        "sn": [.en],

        // Sindhi → Urdu → English
        "sd": [.ur, .en],

        // Sinhalese → English
        "si": [.en],

        // Slovak → German → English
        "sk": [.de, .en],

        // Slovenian → English
        "sl": [.en],

        // Somali → English
        "so": [.en],

        // Southern Ndebele → English
        "nr": [.en],

        // Spanish → English
        "es": [.en],

        // Sundanese → English
        "su": [.en],

        // Swahili → English
        "sw": [.en],

        // Swati → English
        "ss": [.en],

        // Swedish → English
        "sv": [.en],

        // Tagalog → English
        "tl": [.en],

        // Tahitian → English
        "ty": [.en],

        // Tajik → Russian → English
        "tg": [.ru, .en],

        // Tamil → Malay → English
        "ta": [.ms, .en],

        // Tatar → English
        "tt": [.en],

        // Telugu → English
        "te": [.en],

        // Thai → English
        "th": [.en],

        // Tibetan → Chinese → English
        "bo": [.zh, .en],

        // Tigrinya → Arabic → Italian → English
        "ti": [.ar, .it, .en],

        // Tonga → English
        "to": [.en],

        // Tsonga → Afrikaans → English
        "ts": [.af, .en],

        // Turkish → English
        "tr": [.en],

        // Turkmen → Russian → English
        "tk": [.ru, .en],

        // Twi → English
        "tw": [.en],

        // Ukrainian → English
        "uk": [.en],

        // Urdu → English
        "ur": [.en],

        // Uyghur → Chinese → English
        "ug": [.zh, .en],

        // Uzbek → English
        "uz": [.en],

        // Venda → English
        "ve": [.en],

        // Vietnamese → English
        "vi": [.en],

        // Volapük → English
        "vo": [.en],

        // Walloon → French → English
        "wa": [.fr, .en],

        // Welsh → English
        "cy": [.en],

        // Western Frisian → Dutch → English
        "fy": [.nl, .en],

        // Wolof → French → Arabic → English
        "wo": [.fr, .ar, .en],

        // Xhosa → English
        "xh": [.en],

        // Yiddish → English
        "yi": [.en],

        // Yoruba → English
        "yo": [.en],

        // Zulu → English
        "zu": [.en]
    ]
}

extension Language {

    public var fallbackChain: [Language] {

        guard let alpha2 = code.alpha2 else {
            return [.en]
        }

        return Self.fallbackChains[alpha2.value] ?? [.en]
    }

    private static let fallbackChains: [String: [Language]] = [

        "ab": [.ru, .ka, .en],

        "aa": [.am, .om, .so, .ti, .en],

        "af": [.nl, .en],

        "ak": [.en],

        "sq": [.it, .en],

        "am": [.om, .so, .ti, .en],

        "ar": [.en],

        "an": [.es, .en],

        "hy": [.en],

        "as": [.en],

        "av": [.en],

        "ae": [.en],

        "ay": [.es, .en],

        "az": [.en],

        "bm": [.en],

        "ba": [.en],

        "eu": [.es, .fr, .en],

        "be": [.ru, .en],

        "bn": [.en],

        "bi": [.en],

        "bs": [.en],

        "br": [.fr, .en],

        "bg": [.en],

        "my": [.en],

        "ca": [.es, .fr, .pt, .en],

        "ch": [.en],

        "ce": [.en],

        "zh": [.en],

        "cv": [.en],

        "kw": [.en],

        "co": [.fr, .en],

        "cr": [.en],

        "hr": [.en],

        "cs": [.en],

        "da": [.en],

        "nl": [.en],

        "dz": [.en],

        "en": [],

        "eo": [.en],

        "et": [.ru, .en],

        "ee": [.en],

        "fo": [.da, .en],

        "fj": [.en],

        "fi": [.sv, .en],

        "fr": [.en],

        "gl": [.es, .en],

        "gd": [.en],

        "ka": [.ru, .en],

        "de": [.en],

        "el": [.en],

        "gn": [.es, .en],

        "gu": [.en],

        "ht": [.fr, .en],

        "ha": [.fr, .en],

        "he": [.en],

        "hz": [.en],

        "hi": [.en],

        "ho": [.en],

        "hu": [.en],

        "is": [.en],

        "io": [.en],

        "ig": [.en],

        "id": [.en],

        "ia": [.en],

        "ie": [.en],

        "iu": [.en],

        "ik": [.en],

        "ga": [.en],

        "it": [.en],

        "ja": [.en],

        "jv": [.id, .en],

        "kn": [.en],

        "kr": [.fr, .en],

        "ks": [.en],

        "kk": [.ru, .en],

        "km": [.en],

        "ki": [.en],

        "rw": [.en],

        "rn": [.en],

        "kv": [.en],

        "kg": [.en],

        "ko": [.en],

        "ku": [.ar, .en],

        "kj": [.pt, .en],

        "ky": [.ru, .en],

        "lo": [.en],

        "la": [.en],

        "lv": [.ru, .en],

        "li": [.nl, .en],

        "ln": [.fr, .en],

        "lt": [.ru, .en],

        "lu": [.en],

        "lb": [.fr, .de, .en],

        "mk": [.en],

        "mg": [.fr, .en],

        "ms": [.en],

        "ml": [.en],

        "mt": [.en],

        "gv": [.en],

        "mi": [.en],

        "mr": [.en],

        "mh": [.en],

        "mn": [.en],

        "na": [.en],

        "nv": [.en],

        "ng": [.en],

        "ne": [.en],

        "nd": [.en],

        "no": [.en],

        "nb": [.no, .en],

        "nn": [.no, .en],

        "oc": [.es, .en],

        "oj": [.en],

        "or": [.en],

        "om": [.en],

        "os": [.ru, .en],

        "pi": [.en],

        "fa": [.ar, .en],

        "pl": [.en],

        "pt": [.en],

        "pa": [.en],

        "qu": [.es, .en],

        "ro": [.ru, .en],

        "rm": [.fr, .it, .de, .en],

        "ru": [.en],

        "se": [.no, .en],

        "sm": [.en],

        "sg": [.fr, .en],

        "sa": [.en],

        "sr": [.sq, .en],

        "st": [.en],

        "tn": [.en],

        "sn": [.en],

        "sd": [.ur, .en],

        "si": [.en],

        "sk": [.de, .en],

        "sl": [.en],

        "so": [.en],

        "nr": [.en],

        "es": [.en],

        "su": [.en],

        "sw": [.en],

        "ss": [.en],

        "sv": [.en],

        "tl": [.en],

        "ty": [.en],

        "tg": [.ru, .en],

        "ta": [.ms, .en],

        "tt": [.en],

        "te": [.en],

        "th": [.en],

        "bo": [.zh, .en],

        "ti": [.ar, .it, .en],

        "to": [.en],

        "ts": [.af, .en],

        "tr": [.en],

        "tk": [.ru, .en],

        "tw": [.en],

        "uk": [.en],

        "ur": [.en],

        "ug": [.zh, .en],

        "uz": [.en],

        "ve": [.en],

        "vi": [.en],

        "vo": [.en],

        "wa": [.fr, .en],

        "cy": [.en],

        "fy": [.nl, .en],

        "wo": [.fr, .ar, .en],

        "xh": [.en],

        "yi": [.en],

        "yo": [.en],

        "zu": [.en],
    ]
}

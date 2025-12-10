// Locale+StaticAccessors.swift
// Locale Standard
//
// Static accessors for common locales

import ISO_3166
import ISO_15924

extension Locale {
    // MARK: - Language-Only Locales (ISO 639-1)

    /// English
    public static let en = Locale(language: .en)

    /// Spanish
    public static let es = Locale(language: .es)

    /// French
    public static let fr = Locale(language: .fr)

    /// German
    public static let de = Locale(language: .de)

    /// Italian
    public static let it = Locale(language: .it)

    /// Portuguese
    public static let pt = Locale(language: .pt)

    /// Dutch
    public static let nl = Locale(language: .nl)

    /// Russian
    public static let ru = Locale(language: .ru)

    /// Chinese
    public static let zh = Locale(language: .zh)

    /// Japanese
    public static let ja = Locale(language: .ja)

    /// Korean
    public static let ko = Locale(language: .ko)

    /// Arabic
    public static let ar = Locale(language: .ar)

    /// Hindi
    public static let hi = Locale(language: .hi)

    /// Polish
    public static let pl = Locale(language: .pl)

    /// Turkish
    public static let tr = Locale(language: .tr)

    /// Vietnamese
    public static let vi = Locale(language: .vi)

    /// Thai
    public static let th = Locale(language: .th)

    /// Swedish
    public static let sv = Locale(language: .sv)

    /// Danish
    public static let da = Locale(language: .da)

    /// Norwegian
    public static let no = Locale(language: .no)

    /// Finnish
    public static let fi = Locale(language: .fi)

    /// Greek
    public static let el = Locale(language: .el)

    /// Hebrew
    public static let he = Locale(language: .he)

    /// Indonesian
    public static let id = Locale(language: .id)

    /// Malay
    public static let ms = Locale(language: .ms)

    /// Czech
    public static let cs = Locale(language: .cs)

    /// Romanian
    public static let ro = Locale(language: .ro)

    /// Hungarian
    public static let hu = Locale(language: .hu)

    /// Ukrainian
    public static let uk = Locale(language: .uk)

    /// Catalan
    public static let ca = Locale(language: .ca)

    /// Croatian
    public static let hr = Locale(language: .hr)

    /// Slovak
    public static let sk = Locale(language: .sk)

    /// Bulgarian
    public static let bg = Locale(language: .bg)

    /// Serbian
    public static let sr = Locale(language: .sr)

    /// Slovenian
    public static let sl = Locale(language: .sl)

    /// Lithuanian
    public static let lt = Locale(language: .lt)

    /// Latvian
    public static let lv = Locale(language: .lv)

    /// Estonian
    public static let et = Locale(language: .et)

    // MARK: - English Locales

    /// English (United States)
    public static let en_US = Locale(language: .en, region: .us)

    /// English (United Kingdom)
    public static let en_GB = Locale(language: .en, region: .gb)

    /// English (Australia)
    public static let en_AU = Locale(language: .en, region: .au)

    /// English (Canada)
    public static let en_CA = Locale(language: .en, region: .ca)

    /// English (New Zealand)
    public static let en_NZ = Locale(language: .en, region: .nz)

    /// English (Ireland)
    public static let en_IE = Locale(language: .en, region: .ie)

    /// English (South Africa)
    public static let en_ZA = Locale(language: .en, region: .za)

    /// English (India)
    public static let en_IN = Locale(language: .en, region: .`in`)

    // MARK: - Spanish Locales

    /// Spanish (Spain)
    public static let es_ES = Locale(language: .es, region: .es)

    /// Spanish (Mexico)
    public static let es_MX = Locale(language: .es, region: .mx)

    /// Spanish (Argentina)
    public static let es_AR = Locale(language: .es, region: .ar)

    /// Spanish (Colombia)
    public static let es_CO = Locale(language: .es, region: .co)

    /// Spanish (Chile)
    public static let es_CL = Locale(language: .es, region: .cl)

    /// Spanish (Peru)
    public static let es_PE = Locale(language: .es, region: .pe)

    // MARK: - French Locales

    /// French (France)
    public static let fr_FR = Locale(language: .fr, region: .fr)

    /// French (Canada)
    public static let fr_CA = Locale(language: .fr, region: .ca)

    /// French (Belgium)
    public static let fr_BE = Locale(language: .fr, region: .be)

    /// French (Switzerland)
    public static let fr_CH = Locale(language: .fr, region: .ch)

    // MARK: - German Locales

    /// German (Germany)
    public static let de_DE = Locale(language: .de, region: .de)

    /// German (Austria)
    public static let de_AT = Locale(language: .de, region: .at)

    /// German (Switzerland)
    public static let de_CH = Locale(language: .de, region: .ch)

    // MARK: - Portuguese Locales

    /// Portuguese (Brazil)
    public static let pt_BR = Locale(language: .pt, region: .br)

    /// Portuguese (Portugal)
    public static let pt_PT = Locale(language: .pt, region: .pt)

    // MARK: - Chinese Locales

    /// Chinese (Simplified)
    public static let zh_Hans = Locale(language: .zh, script: .Hans)

    /// Chinese (Traditional)
    public static let zh_Hant = Locale(language: .zh, script: .Hant)

    /// Chinese (Simplified, China)
    public static let zh_Hans_CN = Locale(language: .zh, region: .cn, script: .Hans)

    /// Chinese (Traditional, Taiwan)
    public static let zh_Hant_TW = Locale(language: .zh, region: .tw, script: .Hant)

    /// Chinese (Traditional, Hong Kong)
    public static let zh_Hant_HK = Locale(language: .zh, region: .hk, script: .Hant)

    /// Chinese (Simplified, Singapore)
    public static let zh_Hans_SG = Locale(language: .zh, region: .sg, script: .Hans)

    // MARK: - Arabic Locales

    /// Arabic (Saudi Arabia)
    public static let ar_SA = Locale(language: .ar, region: .sa)

    /// Arabic (Egypt)
    public static let ar_EG = Locale(language: .ar, region: .eg)

    /// Arabic (United Arab Emirates)
    public static let ar_AE = Locale(language: .ar, region: .ae)

    // MARK: - Other Common Locales

    /// Japanese (Japan)
    public static let ja_JP = Locale(language: .ja, region: .jp)

    /// Korean (South Korea)
    public static let ko_KR = Locale(language: .ko, region: .kr)

    /// Russian (Russia)
    public static let ru_RU = Locale(language: .ru, region: .ru)

    /// Italian (Italy)
    public static let it_IT = Locale(language: .it, region: .it)

    /// Dutch (Netherlands)
    public static let nl_NL = Locale(language: .nl, region: .nl)

    /// Dutch (Belgium)
    public static let nl_BE = Locale(language: .nl, region: .be)

    /// Polish (Poland)
    public static let pl_PL = Locale(language: .pl, region: .pl)

    /// Turkish (Turkey)
    public static let tr_TR = Locale(language: .tr, region: .tr)

    /// Thai (Thailand)
    public static let th_TH = Locale(language: .th, region: .th)

    /// Vietnamese (Vietnam)
    public static let vi_VN = Locale(language: .vi, region: .vn)

    /// Hindi (India)
    public static let hi_IN = Locale(language: .hi, region: .`in`)

    /// Swedish (Sweden)
    public static let sv_SE = Locale(language: .sv, region: .se)

    /// Danish (Denmark)
    public static let da_DK = Locale(language: .da, region: .dk)

    /// Norwegian (Norway)
    public static let no_NO = Locale(language: .no, region: .no)

    /// Finnish (Finland)
    public static let fi_FI = Locale(language: .fi, region: .fi)

    /// Greek (Greece)
    public static let el_GR = Locale(language: .el, region: .gr)

    /// Hebrew (Israel)
    public static let he_IL = Locale(language: .he, region: .il)

    /// Indonesian (Indonesia)
    public static let id_ID = Locale(language: .id, region: .id)

    /// Malay (Malaysia)
    public static let ms_MY = Locale(language: .ms, region: .my)

    /// Czech (Czech Republic)
    public static let cs_CZ = Locale(language: .cs, region: .cz)

    /// Romanian (Romania)
    public static let ro_RO = Locale(language: .ro, region: .ro)

    /// Hungarian (Hungary)
    public static let hu_HU = Locale(language: .hu, region: .hu)

    /// Ukrainian (Ukraine)
    public static let uk_UA = Locale(language: .uk, region: .ua)

    // MARK: - Serbian Script Variants

    /// Serbian (Latin)
    public static let sr_Latn = Locale(language: .sr, script: .Latn)

    /// Serbian (Cyrillic)
    public static let sr_Cyrl = Locale(language: .sr, script: .Cyrl)

    /// Serbian (Latin, Serbia)
    public static let sr_Latn_RS = Locale(language: .sr, region: .rs, script: .Latn)

    /// Serbian (Cyrillic, Serbia)
    public static let sr_Cyrl_RS = Locale(language: .sr, region: .rs, script: .Cyrl)
}

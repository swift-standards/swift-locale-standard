import BCP_47
import ISO_15924
import ISO_3166
import ISO_639

public struct Locale: Sendable, Equatable, Hashable {

    public let language: Language

    public let region: ISO_3166.Alpha2?

    public let script: ISO_15924.Alpha4?

    public init(
        language: Language,
        region: ISO_3166.Alpha2? = nil,
        script: ISO_15924.Alpha4? = nil
    ) {
        self.language = language
        self.region = region
        self.script = script
    }

    public init(language: Language) {
        self.language = language
        self.region = nil
        self.script = nil
    }
}

extension Locale {

    public init(_ tag: BCP47.LanguageTag) throws(ISO_639.Error) {

        let language: Language
        switch tag.language {
        case .iso639(let code):
            language = Language(code)

        case .reserved(let code):

            let languageCode = try ISO_639.LanguageCode(code)
            language = Language(languageCode)
        }

        self.language = language
        self.script = tag.script

        if let region = tag.region {
            switch region {
            case .alpha2(let alpha2):
                self.region = alpha2

            case .numeric:

                self.region = nil
            }
        } else {
            self.region = nil
        }
    }

    public func languageTag() throws(BCP47.Error) -> BCP47.LanguageTag {
        var tagString = language.code.description

        if let script {
            tagString += "-\(script.value)"
        }

        if let region {
            tagString += "-\(region.value.uppercased())"
        }

        return try BCP47.LanguageTag(tagString)
    }
}

extension Locale: CustomStringConvertible {

    public var description: String {
        var result = language.description

        if let script {
            result += "-\(script.value)"
        }

        if let region {
            result += "-\(region.value.uppercased())"
        }

        return result
    }
}

extension Locale: Codable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let tag = try BCP47.LanguageTag(string)
        try self.init(tag)
    }
}

extension Locale: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {

        let tag = try! BCP47.LanguageTag(value)

        try! self.init(tag)
    }
}

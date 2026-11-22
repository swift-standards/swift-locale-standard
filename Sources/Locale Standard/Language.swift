import ISO_639

public struct Language: Sendable, Equatable, Hashable {

    public let code: ISO.`639`.LanguageCode

    public init(_ code: ISO.`639`.LanguageCode) {
        self.code = code
    }

    public init(_ alpha2: ISO.`639`.Alpha2) {
        self.code = ISO.`639`.LanguageCode(alpha2: alpha2, alpha3: ISO.`639`.Alpha3(alpha2))
    }

    public init(_ alpha3: ISO.`639`.Alpha3) {
        let alpha2 = ISO.`639`.Alpha2(alpha3)
        self.code = ISO.`639`.LanguageCode(alpha2: alpha2, alpha3: alpha3)
    }

    public init(_ string: some StringProtocol) throws(ISO.`639`.Error) {
        self.code = try ISO.`639`.LanguageCode(string)
    }
}

extension Language: CustomStringConvertible {

    public var description: String {
        code.description
    }
}

extension Language: Codable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(code)
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.code = try container.decode(ISO.`639`.LanguageCode.self)
    }
}

extension Language: CaseIterable {

    public static var allCases: [Language] {
        ISO.`639`.Alpha2.allCases.map { Language($0) }
    }
}

extension Language {

    public var alpha2: ISO.`639`.Alpha2? {
        code.alpha2
    }

    public var alpha3: ISO.`639`.Alpha3 {
        code.alpha3
    }
}

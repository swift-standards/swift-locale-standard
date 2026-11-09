import Testing

import struct Foundation.Data
import class Foundation.JSONDecoder
import class Foundation.JSONEncoder

@testable import Locale_Standard

enum `Locale Boundary Tests` {}

extension `Locale Boundary Tests` {
    @Suite
    struct `Locale boundaries` {
        @Test(arguments: ["en", "en-US", "zh-Hans", "zh-Hans-CN", "pt-BR"])
        func `a tag round trips through its description`(tag: String) {
            #expect(Locale(stringLiteral: tag).description == tag)
        }

        @Test
        func `a lowercase region is written uppercase`() {
            #expect(Locale(stringLiteral: "en-us").description == "en-US")
        }

        @Test
        func `a locale round trips through its language tag`() throws {
            let locale: Locale = "zh-Hans-CN"
            #expect(try Locale(locale.languageTag()) == locale)
        }

        @Test
        func `a locale round trips through JSON`() throws {
            let locale: Locale = "pt-BR"
            let data = try JSONEncoder().encode(locale)
            #expect(String(decoding: data, as: UTF8.self) == #""pt-BR""#)
            #expect(try JSONDecoder().decode(Locale.self, from: data) == locale)
        }

        @Test
        func `a numeric region is rejected instead of dropped`() throws {
            let tag = try BCP47.LanguageTag("es-419")
            #expect(throws: Locale.Error.unsupportedRegion("419")) { try Locale(tag) }
        }

        @Test
        func `variants are rejected instead of dropped`() throws {
            let tag = try BCP47.LanguageTag("de-DE-1901")
            #expect(throws: Locale.Error.unsupportedVariants(["1901"])) { try Locale(tag) }
        }

        @Test(arguments: ["en-US-u-ca-gregory", "en-x-private"])
        func `extensions and private use are rejected instead of dropped`(tag: String) throws {
            let tag = try BCP47.LanguageTag(tag)
            #expect(throws: Locale.Error.self) { try Locale(tag) }
        }

        @Test
        func `decoding a tag with a numeric region throws`() {
            #expect(throws: (any Swift.Error).self) {
                try JSONDecoder().decode(Locale.self, from: Data(#""es-419""#.utf8))
            }
        }

        @Test
        func `decoding an invalid tag throws`() {
            #expect(throws: (any Swift.Error).self) {
                try JSONDecoder().decode(Locale.self, from: Data(#""not a tag!""#.utf8))
            }
        }
    }
}

extension `Locale Boundary Tests` {
    @Suite
    struct `Language boundaries` {
        @Test
        func `two and three letter codes name the same language`() throws {
            #expect(try Language("en") == Language("eng"))
        }

        @Test(arguments: ["", "e", "english", "e1"])
        func `malformed codes are rejected`(code: String) {
            #expect(throws: (any Swift.Error).self) { try Language(code) }
        }

        @Test
        func `english has no fallback`() {
            #expect(Language.en.fallbackChain.isEmpty)
        }

        @Test
        func `a chain names a language once and never itself`() {
            for language in Language.allCases {
                let chain = language.fallbackChain
                #expect(!chain.contains(language), "\(language)")
                #expect(Set(chain).count == chain.count, "\(language)")
            }
        }

        @Test
        func `every chain except english ends in english`() {
            for language in Language.allCases where language != .en {
                #expect(language.fallbackChain.last == .en, "\(language)")
            }
        }
    }
}

//
//  PrettyError.swift
//  SwiftPrettyPrint
//
//  Created by Yusuke Hosonuma on 2020/02/25.
//

import Foundation

enum PrettyError: Error {
    case notSupported(target: Any)
    case failedExtractKeyValue(dictionary: Any)
    case unknownError(target: Any)
}

extension PrettyError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .notSupported(target: target):
            return "Not supported:\n\(dumpString(target))"

        case let .failedExtractKeyValue(target):
            return "Extract key or value is failed:\n\(dumpString(target))"

        case let .unknownError(target: target):
            return "Unknown error:\n\(dumpString(target))"
        }
    }

    func dumpString(_ target: Any) -> String {
        var string: String = ""
        dump(target, to: &string)
        return string
    }
}

extension PrettyError: CustomStringConvertible {
    var description: String {
        switch self {
        case .notSupported:
            return "<< not supported >>"

        case .failedExtractKeyValue, .unknownError:
            return "<< unknown error >>"
        }
    }
}

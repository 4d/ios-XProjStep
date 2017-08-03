//
//  CommandHelper.swift
//  Xcodestep
//
//  Created by Eric Marchand on 03/08/2017.
//  Copyright © 2017 4D. All rights reserved.
//

import Foundation

extension Path {
    static var defaultOutput = Path("Input")
}

public func isReadable(_ path: Path) -> Path {
    if !path.isReadable {
        print("'\(path)' does not exist or is not readable.")
        exit(1)
    }
    
    return path
}

extension Path: ArgumentConvertible {
    public init(parser: ArgumentParser) throws {
        if let path = parser.shift() {
            self.init(path)
        } else {
            throw ArgumentError.missingValue(argument: nil)
        }
    }
}


extension PropertyListSerialization.PropertyListFormat: ArgumentConvertible, CustomStringConvertible {
    
    public static let `default`: PropertyListSerialization.PropertyListFormat = .openStep
    public init(parser: ArgumentParser) throws {
        if let path = parser.shift() {
            
            switch path.lowercased() {
            case "openstep":
                self = .openStep
            case "xml":
                self = .xml
            case "binary":
                self = .binary
            default:
                throw ArgumentError.invalidType(value: path, type: "format", argument: nil)
            }
            
        } else {
            throw ArgumentError.missingValue(argument: nil)
        }
    }
    
    public var description: String {
        switch self {
        case . openStep:
            return "openStep"
        case .xml:
            return "xml"
        case .binary:
            return "binary"
        }
    }
}


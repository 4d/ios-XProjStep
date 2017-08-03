//
//  main.swift
//  Xcodestep
//
//  Created by Eric Marchand on 03/08/2017.
//  Copyright © 2017 4D. All rights reserved.
//

import Foundation

let version = "0.1.0"

let main = Commander.command(
    Argument<Path>("input", validator: isReadable),
    Option("ouput", Path.defaultOutput, description: "specify alternate file path name for result"),
    Option("format", PropertyListSerialization.PropertyListFormat.default, description: "specify alternate output format")
) { input, output, format in

    let url = input.url
    do {
        let xcodeProj = try XcodeProj(url: url)
        var outputURL = output == Path.defaultOutput ? url : output.url
        if outputURL.isDirectoryURL {
            outputURL = outputURL.appendingPathComponent(input.lastComponent)
        } else {
            try output.parent().mkpath()
        }
        try xcodeProj.write(to: outputURL, format: format)
    } catch {
        print(error)
        exit(1)
    }
}

main.run(version)

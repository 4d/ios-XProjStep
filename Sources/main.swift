//
//  main.swift
//  Xcodestep
//
//  Created by Eric Marchand on 03/08/2017.
//  Copyright © 2017 4D. All rights reserved.
//

import Foundation

let version = "0.2.0"

let main = Commander.command(
    Argument<Path>("input", validator: isReadable),
    Option("ouput", default: Path.defaultOutput, description: "specify alternate file path name for result"),
    Option("format", default: PropertyListSerialization.PropertyListFormat.default, description: "specify alternate output format"),
    Option("projectName", default: "___PRODUCT___", description: "project name (not readable from some format)")
) { input, output, format, projectName in

    let url = input.url
    do {
        let xcodeProj = try XcodeProj(url: url)

        if !projectName.isEmpty {
            xcodeProj.projectName = projectName
        }

        var outputURL = output == Path.defaultOutput ? url : output.url
        if outputURL.isDirectoryURL {
            outputURL = outputURL.appendingPathComponent(input.lastComponent)
        } else {
            try output.parent().mkpath()
        }
        try xcodeProj.write(to: outputURL, format: format)
    } catch {
        print("error: \(error)")
        exit(1)
    }
}

main.run(version)

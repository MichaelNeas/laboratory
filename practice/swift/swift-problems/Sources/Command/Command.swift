//
//  Command.swift
//  runner
//
//  Created by Eneko Alonso on 3/3/18.
//

import Foundation
import Utility
import Basic

public protocol Command {
    var command: String { get }
    var overview: String { get }

    init(parser: ArgumentParser)
    func run(with arguments: ArgumentParser.Result) throws
}

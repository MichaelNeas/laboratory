import Foundation
import Command

public struct Username {
    static private let filename = ".username"

    public let value: String

    public init?() {
        guard FileManager.default.fileExists(atPath: Username.filename) else {
            return nil
        }
        let fileURL = URL(fileURLWithPath: Username.filename)
        guard let value = try? String(contentsOf: fileURL) else {
            return nil
        }
        self.value = value.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public static func set(username: String) throws {
        try username.write(toFile: filename, atomically: true, encoding: .utf8)
    }

}

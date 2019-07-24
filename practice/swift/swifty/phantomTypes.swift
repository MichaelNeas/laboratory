
// phantom types are never refered to in Named but have the important job of providing 2 distinct types
struct Named<T>: Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
    var name: String
    init(_ name: String) {
        self.name = name
    }
    init(stringLiteral value: StringLiteralType) {
        name = value
    }
    var description: String {
        return name
    }
}

/// unhabitable enum is good to use cause it can't be instantiated
enum StateTag {}
enum CapitalTag {}

typealias State = Named<StateTag>
typealias Capital = Named<CapitalTag>

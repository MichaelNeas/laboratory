
/// Compiler will generate the conformance
/// due to Email being a value type and address being a String
struct Email: Hashable {
    // protected invariant
    private(set) var address: String
    
    // failable initializer
    init?(_ raw: String) {
        guard raw.contains("@") else { return nil }
        address = raw
    }
}

/// compiler does not automatically generate conformance for a reference type
/// due to reference types potentially forming a circular reference
class User: Hashable {
    var id: Int?
    var name: String
    var email: Email
    
    init(id: Int?, name: String, email: Email) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email
    }
    
    /// passed in hasher object combines all of our properties and produces a hash value to use
    /// best practice is to combine all the == properties into the hash into method
    /// because if two objects are equal, they must return the same hash value
    /// two different objects can return the same value, but you will get a collision
    /// Hash will produce a cryptologically sound hash values for us
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(email)
    }
}

guard let email = Email("test@example.com") else {
    fatalError("not valid email")
}


let userA = User(id: nil, name: "Mike", email: email)
let userB = User(id: nil, name: "Mike", email: email)

/// == tells you if you have the same values, === means same reference
userA == userB
userA === userB

let userC = userA
userA === userC

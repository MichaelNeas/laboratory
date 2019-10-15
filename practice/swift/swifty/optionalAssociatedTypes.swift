import UIKit

var bleh: String?

enum SomeEnum: CustomStringConvertible {
    case optionalAssociatedValue(thing: String?)
    
    var description: String {
        switch self {
        case .optionalAssociatedValue(let thing?): return "SOMETHING \(thing)"
        case .optionalAssociatedValue(.none): return "NOTHING"
        }
    }
}

print(SomeEnum.optionalAssociatedValue(thing: bleh).description)
bleh = "hi"
print(SomeEnum.optionalAssociatedValue(thing: bleh).description)

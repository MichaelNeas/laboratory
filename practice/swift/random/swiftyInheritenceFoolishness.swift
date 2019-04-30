import Foundation

var i32: Int32 = 199
let regInt = Int(i32)
print(type(of: regInt))


protocol A {var cat: Int{ get }}
class ClassA: A {var cat = 1}
protocol B:A {}
class ClassB: B {var cat = 2}
/// This is possible because it can make sense to switch from stored property to computed property and the cat is originally a var
/// But override a stored var property with a stored var property does not make sense, because you can ony change the value of the property.
/// You can however not override a stored property with a stored property at all.
class ClassC: ClassA{ override var cat: Int{ get { return 3 } set {} }}

print(ClassA.self is A.Type) // true
print(ClassB.self is A.Type) // true
print(ClassC.self is A.Type) // true

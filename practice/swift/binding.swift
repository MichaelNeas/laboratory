if let constantName = someOptional {
   //statements using 'constantName' 
} else {
// the value of someOptional is not set (or nil).
}

if let myValue = myObject.value as NSString? {
    myValue = "Something else" // <-- Compiler error
}

let someOptionalString:String?

someOptionalString = "abcd"

if var varString = someOptionalString {

print(varString) //prints abcd

varString = "efgh"

print(varString) //prints efgh

} else {

// the value of someOptionalString is not set (or nil).

}

func greet(person: [String: String]) {

guard let name = person["name"] else {

return

}

print("Hello \(name)!")

guard let location = person["location"] else {

print("I hope the weather is nice near you.")

return

}

print("I hope the weather is nice in \(location).")

}

greet(person: ["name": "John"])

// Prints "Hello John!"

// Prints "I hope the weather is nice near you."

greet(person: ["name": "Jane", "location": "Cupertino"])

// Prints "Hello Jane!"

// Prints "I hope the weather is nice in Cupertino."


func doSomething() {

defer { print(“1”)}

defer { print(“2”)}

defer { print(“3”)}

if 1<2 {

defer { print("1<2")}

}

defer { print(“4”)}

defer { print(“5”)}

defer { print(“6”)}

}

//1<2
//6
//5
//4
//3
//2
//1
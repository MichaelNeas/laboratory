// Inouts and (&)references are used together to allow modification of variables being passed into functions

var myMoneys = 1000

// inouts modify original values
// inout means that modifying the local variable will also modify the passed-in parameters. Without it, the passed-in parameters will remain the same value. Trying to think of reference type when you are using inout and value type without using it.
func addMoneys(_ money: inout Int) {
    let increment = 100
    money += increment
}

// ampersand(&) in front of our variable to indicate that we are going to modify the variable that’s coming up next.
//In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.
addMoneys(&myMoneys) //1100
addMoneys(&myMoneys) // 1200
addMoneys(&myMoneys) // 1300

// … → variadic parameter
func eatHealthy(food: String...) { }
func drinkCoffee() { }
func kickass() { }

func runPlan() {
    eatHealthy(food: "sweet potato", "chicken breast", "boiled egg")
    drinkCoffee()
    kickass()
}
runPlan()

// (Int) -> Int → function type parameter that takes an int and returns an int
func shoot(_ target: inout Int, onHitEffect: (Int) -> Int) {
    target = onHitEffect(target)
}

func damage(_ hp: Int) -> Int {
    return hp - 20
}
func heal(_ hp: Int) -> Int {
    return hp + 20
}

var badRobot = 100
shoot(&badRobot, onHitEffect: damage) // badRobot = 80
shoot(&badRobot, onHitEffect: damage) // badRobot = 60
shoot(&badRobot, onHitEffect: heal)  // badRobot = 80

//variadic parameter, A function may have at most one variadic parameter.
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

//define functions inside the bodies of other functions, known as nested functions.
// Just like js you can encasulate errything

// Closure Expression Syntax
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//Inferring Type From Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

//Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 } )

//Operator Methods
reversedNames = names.sorted(by: >)

//Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// Same closure rules as all other languages, Capturing Values is the term in swift for scoped var alterations
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60

// @escaping
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"


// Autoclosure
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// The argument is automatically converted to a closure, because the customerProvider parameter’s type is marked with the @autoclosure attribute.
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"


// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"

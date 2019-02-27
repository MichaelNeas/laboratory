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
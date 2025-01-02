protocol Human {
    var name: String { get }
    var like: [String] { get }
    var adjective: String { get }
}

class Person: Human {
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        lhs.name == rhs.name && lhs.like == rhs.like && lhs.adjective == rhs.adjective
//    }
    
    var name: String
    
    var like: [String]
    
    var adjective: String
    
    init(name: String, like: [String], adjective: String) {
        self.name = name
        self.like = like
        self.adjective = adjective
    }
}

let jorah = Person(name: "Jorah", like: ["shrimp", "wine"], adjective: "happy")
let daley = Person(name: "Daley", like: ["cats", "chicken"], adjective: "helpful")
let marySue = Person(name: "MSC", like: ["garden", "clean"], adjective:  "AMAZING")
let tim = Person(name: "Tim", like: ["MSC", "painting"], adjective: "sweet")
let mike = Person(name: "mike", like: ["bike", "projects"], adjective: "fast")
let peg = Person(name: "Peg", like: ["Egg", "tuna"], adjective: "strong")
let alex = Person(name: "alex", like: ["bird", "mammals", "cats"], adjective: "funny & special")
let wally = Person(name: "wally", like: ["stairs", "boobs"], adjective: "silly crazy wild")
let mariah = Person(name: "Mariah", like: ["noah", "wally"], adjective: "smart")
let eric = Person(name: "Erik", like: ["Wally", "Chimneys", "bikes"], adjective: "more silly crazy wild")
let meggo = Person(name: "Meggo", like: ["Danny", "bball"], adjective: "hYPE HEIGHT HIIIIGHT")
let danny = Person(name: "Danny", like: ["trombone", "tom", "meggo", "jazz"], adjective: "strawberry")
let hannah = Person(name: "Hannah", like: ["Walking", "Eating", "puttering"], adjective: "putterer")
let anna = Person(name: "Anna", like: ["cows", "keilbasie", "perogie", "sunsets"], adjective: "silly")
let madison = Person(name: "Madison", like: ["skiing", "hike", "tomatoes", "sunflowers"], adjective: "sweet")
let jack = Person(name: "Jack", like: ["Madison", "phishing"], adjective: "Sweet kind nice")
let dan = Person(name: "Dan", like: ["fishing", "tuna", "spoons", "travel"], adjective: "patient")


let onetwotwoSouthMain = [dan, jack, madison, anna, hannah, danny, danny, meggo, eric, mariah, daley, marySue, wally, eric, peg, mike, dan, alex, jorah, tim, marySue]

//print(onetwotwoSouthMain.flatMap { $0.like })
//print(onetwotwoSouthMain.compactMap { $0.adjective })
print(onetwotwoSouthMain.compactMap { $0.name })

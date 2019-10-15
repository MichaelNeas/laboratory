
let dependencies = ["a":["b"], "b":["c", "d"], "c":[], "d":[] ]

// brute force solution 6:54, guarentees about data include no circular references and there is always a resolution
func ordered(dependencies: [String: [String]]) -> [String] {
    var solution = [String]()
    var dependencies = dependencies
    let count = dependencies.keys.count
    while solution.count != count {
        dependencies.forEach { key, value in
            if value.isEmpty {
                solution.append(key)
                dependencies.forEach { secondKey, secondValue in
                    var secondValue = secondValue
                    if let keyLocation = secondValue.firstIndex(of: key) {
                        dependencies[secondKey]?.remove(at: keyLocation)
                    }
                }
                dependencies.removeValue(forKey: key)
            }
        }
    }
    return solution
}

print(ordered(dependencies: dependencies))

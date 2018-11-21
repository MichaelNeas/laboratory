import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    var primesUnder200: [Int] {
        return [
            2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53,
            59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113,
            127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181,
            191, 193, 197, 199
        ]
    }

    // P31 (**) Determine whether a given integer number is prime.
    func testP31() {
        Test("Test primes under 200") {
            for number in (2...200) {
                assertEquals(number.isPrime(), primesUnder200.contains(number))
            }
        }
    }
}

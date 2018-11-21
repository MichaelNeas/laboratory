import Foundation
import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P06 (*) Find out whether a list is a palindrome.
    func testP06() {
        Test("Find out whether a list is a palindrome") {
            assertEquals(TestData.singleElementList.isPalindrome(), true)
            assertEquals(TestData.twoElementList.isPalindrome(), false)
            assertEquals(TestData.multiElementList.isPalindrome(), false)
            assertEquals(TestData.veryLongList.isPalindrome(), false)

            for _ in 0...10 {
                assertEquals(randomPalindrome().isPalindrome(), true)
            }
        }
    }

    private func randomPalindrome() -> List<Int> {
        let number = randomInt(under: 1000)
        let elements: [Int] = Array(0...number)
        let reversed: [Int] = elements.reversed()
        return List(elements + reversed)
    }

}


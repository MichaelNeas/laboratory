import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P02 (*) Find the last but one element of a list.
    func testP02() {
        Test("Find penultimate element") {
            assertEquals(TestData.singleElementList.penultimate, nil)
            assertEquals(TestData.twoElementList.penultimate, 1)
            assertEquals(TestData.multiElementList.penultimate, 13)
            assertEquals(TestData.veryLongList.penultimate, 999)
        }
    }

}

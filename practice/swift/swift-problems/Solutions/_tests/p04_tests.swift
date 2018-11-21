import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P04 (*) Find the number of elements of a list.
    func testP04() {
        Test("Find number of elements") {
            assertEquals(TestData.singleElementList.length, 1)
            assertEquals(TestData.twoElementList.length, 2)
            assertEquals(TestData.multiElementList.length, 7)
            assertEquals(TestData.veryLongList.length, 1000)
        }
    }

}

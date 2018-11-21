import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P03 (*) Find the Kth element of a list.
    func testP03() {
        Test("Find Kth element") {
            // Index 0
            assertEquals(TestData.singleElementList[0], 1)
            assertEquals(TestData.twoElementList[0], 1)
            assertEquals(TestData.multiElementList[0], 1)
            assertEquals(TestData.veryLongList[0], 1)

            // Index 2
            assertEquals(TestData.singleElementList[2], nil)
            assertEquals(TestData.twoElementList[2], nil)
            assertEquals(TestData.multiElementList[2], 3)
            assertEquals(TestData.veryLongList[2], 3)

            // Index 999
            assertEquals(TestData.singleElementList[999], nil)
            assertEquals(TestData.twoElementList[999], nil)
            assertEquals(TestData.multiElementList[999], nil)
            assertEquals(TestData.veryLongList[999], 1000)

            // Index 1000
            assertEquals(TestData.singleElementList[1000], nil)
            assertEquals(TestData.twoElementList[1000], nil)
            assertEquals(TestData.multiElementList[1000], nil)
            assertEquals(TestData.veryLongList[1000], nil)
        }
    }

}

import XCTest
/// swiftc -Onone -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks/ -Xlinker -rpath -Xlinker /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -lswiftCore factPerformance.swift -o performance
class PerformanceTests: XCTestCase {

    func testRecursive() {
		func factorial(_ n: UInt64) -> UInt64 {
			return n < 1 ? 1 : n * factorial(n-1)
		}

        measure {
        	_ = factorial(20)
        }
    }

	func testMemoized() {
		var memo: [UInt64: UInt64] = [UInt64: UInt64]()
		func mFactorial(_ n: UInt64) -> UInt64 {
			if let memoi = memo[n]{
				return memoi
			} else if n < 1 {
				return 1
			} else {
				memo[n] = n * mFactorial(n-1)
				return memo[n]!
			}
		}

        measure {
        	_ = mFactorial(20)
        }
	}

    func testIterative() {
		func factorialIterative(_ n: UInt64) -> UInt64 {
			var sol: UInt64 = 1
			for i in 1..<n {
				sol = sol * i
			}
			return sol
		}
        measure {
			_ = factorialIterative(20)
        }
    }

	func testTailCall() {
		func tailFact(_ n: UInt64, _ total: UInt64 = 0) -> UInt64 {
			return n < 1 ? total : tailFact(n - 1, total * n)
		}
		measure {
			_ = tailFact(20)
        }
	}
}

/// In case of a Playground:
PerformanceTests.defaultTestSuite.run()

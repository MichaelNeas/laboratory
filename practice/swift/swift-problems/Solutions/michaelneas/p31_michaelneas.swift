import Foundation

// https://www.enekoalonso.com/projects/99-swift-problems/#p31

extension Int {
    func isPrime() -> Bool {
        // Corner case 
        if self <= 1 { 
            return false
        }
  
        // Check from 2 to n-1 
        for i in 2..<self {
            if self%i == 0 {
                return false
            }
        }

        return true
    }
}
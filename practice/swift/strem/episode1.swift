class Solution {
    func reverse(_ x: Int) -> Int {       
        var signed: Int32 = 1
        if x < 0 {
            signed = -1
        }

        if let d = Int32(String(String(abs(x)).reversed())) {
            return Int(d * signed)
        }
        return 0
        
// Not as fast as string concat
//         var signed = 1
//         if x < 0 {
//             signed = -1
//         }
        
//         var multiplier = 10
//         var temp = abs(x)
//         var result = 0
//         while(temp > 0) {
//             result = (result * multiplier) + (temp % multiplier)
//             temp = temp / multiplier
//         }
        
//         if Int(Int32.max) > result {
//             return result * signed
//         }
        
//         return 0
        
// slowest, pulled from internets
//         //flag marks if x is negative
//         var flag  = false
//         var temp = x
//         if x < 0 {
//             temp = 0 - temp
//             flag = true
//         }
//         var res = 0
//         var p = temp
//         while p > 0 {
//             var mod = p % 10
//             p = p / 10
//             res = res * 10 + mod
//         }
//         if Int(Int32.max) > res {
//             if flag {
//                 return 0 - res
//             }
//             return res
//         }
        


//         return 0
    }
}

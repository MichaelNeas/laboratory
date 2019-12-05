/// Write a class RecentCounter to count recent requests.
/// It has only one method: ping(int t), where t represents some time in milliseconds.
/// Return the number of pings that have been made from 3000 milliseconds ago until now.
/// Any ping with time in [t - 3000, t] will count, including the current ping.
/// It is guaranteed that every call to ping uses a strictly larger value of t than before.
/// Input: inputs = ["RecentCounter","ping","ping","ping","ping"], inputs = [[],[1],[100],[3001],[3002]]
/// Output: [null,1,2,3,3]

class RecentCounter {
    var pings:[Int] = []
    
    init() {}
    
    func ping(_ t: Int) -> Int {
        pings.append(t)
        while pings[0] < t - 3000 {
            pings.removeFirst()
        }
        return pings.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
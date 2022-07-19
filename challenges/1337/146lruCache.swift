/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

class LRUCache {
    let capacity: Int
    var cache = [(Int, Int)]()

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        for (index, val) in cache.enumerated() {
            if val.0 == key {
                let element = cache.remove(at: index)
                cache.append(element)
                return element.1
            }   
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        for (index, val) in cache.enumerated() {
            if val.0 == key {
                let element = cache.remove(at: index)
                cache.append((element.0, value))
                return
            }   
        }
        cache.append((key, value))
        if cache.count > capacity {
            cache.remove(at: 0)
        }
    }
}
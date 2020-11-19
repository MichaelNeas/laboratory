// There are n (id, value) pairs, where id is an integer between 1 and n and value is a string. No two pairs have the same id.
// Design a stream that takes the n pairs in an arbitrary order, and returns the values over several calls in increasing order of their ids.
// Implement the OrderedStream class:
//     OrderedStream(int n) Constructs the stream to take n values and sets a current ptr to 1.
//     String[] insert(int id, String value) Stores the new (id, value) pair in the stream. After storing the pair:
//         If the stream has stored a pair with id = ptr, then find the longest contiguous incrementing sequence of ids starting with id = ptr and return a list of the values associated with those ids in order. Then, update ptr to the last id + 1.
//         Otherwise, return an empty list.


class OrderedStream {
    var ptr: Int
    var stream: [String]

    init(_ n: Int) {
        stream = Array(repeating: String(), count: n)
        ptr = 0
    }
    
    func insert(_ id: Int, _ value: String) -> [String] {
        var result = [String]()
        stream[id - 1] = value
        while ptr < stream.count && !stream[ptr].isEmpty {
            result.append(stream[ptr])
            ptr += 1
        }
        return result
        
    }
}

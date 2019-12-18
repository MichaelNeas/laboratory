import Promises
import Foundation

let pageNumber = 10
// general function to make batched requests and return as an array of promises to resolve in the future
func batchsRequests(for list: [Int]) -> [Promise<[Value]>] {
    var promises: [Promise<[Value]>] = []
    
    for batchIndex in stride(from: 0, to: list.count, by: self.pageNumber) {
        let batchPromise = Promise<[Value]>.pending()
        promises.append(batchPromise)
        let pageAmount = batchIndex >= (list.count - self.pageNumber) ? list.endIndex : batchIndex + self.pageNumber
        let responseHandler = { (result: Swift.Result<[Value], Error>) in
            switch result {
            case .success(let values):
                batchPromise.fulfill(values)
            case .failure(let error):
                batchPromise.reject(error)
            }
        }
        let batch = list[batchIndex..<pageAmount]
        
        getBatch(for: batch, completion: responseHandler)
    }
    return promises
}
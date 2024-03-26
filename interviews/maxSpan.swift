/// Span is the difference in characters between the first and last value of a string
/// Return max span and all qualifying words in a given sentence 

private let invalidChars = Set(";,.'!?")

func calculateMaxSpan(from words: String) -> (Int, [String]) {
  let freqDict = Set(words
  .filter { !invalidChars.contains($0) }
  .components(separatedBy: " ")
  .map { $0.lowercased() })
  .map { word in 
    let firstChar = word.first?.asciiValue ?? UInt8.min
    let lastChar = word.last?.asciiValue ?? UInt8.min
    return (word, abs(Int(lastChar) - Int(firstChar)))
  }.reduce(into: [Int: [String]](), { (acc, curr: (String, Int)) in
    acc[curr.1, default: [String]()].append(curr.0)
  })

  let max = freqDict.keys.max()!
  return (max, freqDict[max]!)
}

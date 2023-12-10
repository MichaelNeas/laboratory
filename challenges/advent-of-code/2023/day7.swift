import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let dataURL = URL(fileURLWithPath: "data/day7.txt", relativeTo: currentDirectoryURL)


let rankOrder: [Character] = ["J", "2", "3", "4", "5", "6", "7", "8", "9", "T", "Q", "K", "A"]

enum HandType: Comparable {
    case five
    case four
    case full
    case three
    case twoPair
    case pair
    case high

    private var order: Int {
        switch self {
        case .high: return 0
        case .pair: return 1
        case .twoPair: return 2
        case .three: return 3
        case .four: return 5
        case .full: return 4
        case .five: return 6
        }
    }

    static func < (lhs: HandType, rhs: HandType) -> Bool {
        return lhs.order < rhs.order
    }

    static func == (lhs: HandType, rhs: HandType) -> Bool {
        return lhs.order == rhs.order
    }
}

func compareCamels(hand1: String, hand2: String) -> Bool {
    let cards1 = Array(hand1)
    let cards2 = Array(hand2)

    for (rank1, rank2) in zip(cards1, cards2) {
        if rank1 != rank2 {
            return rankOrder.firstIndex(of: rank1)! < rankOrder.firstIndex(of: rank2)!
        }
    }

    print("TIE")
    return false
}

struct HandBet {
    let hand: String
    let bet: Int
    var frequency: [Character: Int]
    var type: HandType {
        if isFiveOfAKind {
            return .five
        } else if isFourOfAKind {
            return .four
        } else if isFullHouse {
            return .full
        } else if isThreeOfAKind {
            return .three
        } else if isTwoPair {
            return .twoPair
        } else if isOnePair {
            return .pair
        } else {
            return .high
        }
    }

    init(hand: String, bet: Int) {
        self.bet = bet
        self.hand = hand
        self.frequency = self.hand.reduce(into: [Character:Int]()) { acc, curr in
            acc[curr, default: 0] += 1
        }

        if let jokerCount = frequency["J"], jokerCount != 5 {
            frequency.removeValue(forKey: "J")
            let sortedFrequencies = frequency.sorted(by: { $0.value < $1.value })
            frequency[sortedFrequencies.last!.key]! += jokerCount
        }   
    }

    var hasJokers: Bool {
        frequency["J"] != nil
    }

    var isFiveOfAKind: Bool {
        frequency.values.count == 1
    }

    var isFourOfAKind: Bool {
        frequency.values.sorted().last! == 4
    }

    var isFullHouse: Bool {
        frequency.values.sorted().last! == 3 && frequency.values.count == 2
    }

    var isThreeOfAKind: Bool {
        frequency.values.sorted().last! == 3
    }

    var isTwoPair: Bool {
        frequency.values.filter({ $0 == 2 }).count == 2
    }

    var isOnePair: Bool {
        let sortedFreq = frequency.values.sorted()
        return sortedFreq.last! == 2 && sortedFreq.count == 4
    }

    var isHighCard: Bool {
        frequency.values.count == 5
    }
}

do {
    let allHandsAndBets = try String(contentsOf: dataURL, encoding: .utf8)
                                        .components(separatedBy: .newlines)
                                        .map { $0.components(separatedBy: " ") }
                                        .map { HandBet(hand: $0[0], bet: Int($0[1])!)}
    let sortedHandsAndBets = allHandsAndBets
                                        .sorted(by: { hand1, hand2 in
                                            if hand1.type == hand2.type {
                                                return compareCamels(hand1: hand1.hand, hand2: hand2.hand)
                                            } else {
                                                return hand1.type < hand2.type
                                            }
                                        })
                                        .enumerated()
                                        .map { offset, handBet in 
                                            (offset + 1) * handBet.bet
                                        }
                                        .reduce(0, +)
   

    // for handsndbet in sortedHandsAndBets {
    //     print("\(handsndbet.type): \(handsndbet)")
    // }
                                
    print(sortedHandsAndBets) 
    //  part 1: 254105463
}
catch {
    print("Error reading text. \(error)")
}

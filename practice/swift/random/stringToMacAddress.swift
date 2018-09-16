func makeMac(from uid: String) -> String{ 
    return String(String(uid.prefix(12)).enumerated().map { $0 > 0 && $0 % 2 == 0 ? [":", $1] : [$1]}.joined())
}

func message(msg: String) -> (String) -> () {
    return { (name: String) in
        print("Dear \(name), \(msg) ")
    }
}

/// declared version
//func message(msg: String) -> (String) -> () {
//    func to(name: String){
//        print("Dear \(name), \(msg) ")
//    }
//    return to
//}

message(msg: "You're the best")("friend")

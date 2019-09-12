let defaults = UserDefaults.standard

defaults.set(25, forKey: "Age")
defaults.set(true, forKey: "UseFaceID")
defaults.set(CGFloat.pi, forKey: "Pi")
defaults.set("Paul Hudson", forKey: "Name")
defaults.set(Date(), forKey: "LastRun")
defaults.set(["Hello", "World"], forKey: "SavedArray")
defaults.set(["Name": "Paul", "Country": "UK"], forKey: "SavedDictionary")

let savedInteger = defaults.integer(forKey: "Age")
let savedBoolean = defaults.bool(forKey: "UseFaceID")
let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String: String]()

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶


let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"


/// String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals. 
/// Each item that you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslash (\):
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

/// The letter é can be represented as the single Unicode scalar é (LATIN SMALL LETTER E WITH ACUTE, or U+00E9).
/// However, the same letter can also be represented as a pair of scalars—a standard letter e (LATIN SMALL LETTER E, 
/// or U+0065), followed by the COMBINING ACUTE ACCENT scalar (U+0301). The COMBINING ACUTE ACCENT scalar is 
/// graphically applied to the scalar that precedes it, turning an e into an é when it’s rendered by a Unicode-aware 
// text-rendering system.

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é


/// Extended grapheme clusters are a flexible way to represent many complex script characters as a single Character value. 
/// For example, Hangul syllables from the Korean alphabet can be represented as either a precomposed or decomposed sequence. 
/// Both of these representations qualify as a single Character value in Swift:

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

/// Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value, 
/// such as this combination of REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) and REGIONAL INDICATOR SYMBOL 
/// LETTER S (U+1F1F8):

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸


/// If you initialize a new string with the four-character word cafe, 
/// and then append a COMBINING ACUTE ACCENT (U+0301) to the end of the string,
/// the resulting string will still have a character count of 4, with a fourth character of é, not e:

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

/* Note

Extended grapheme clusters can be composed of multiple Unicode scalars. 
This means that different characters—and different representations of the same character—can 
require different amounts of memory to store. Because of this, characters in Swift don’t each 
take up the same amount of memory within a string’s representation. As a result, the number of 
characters in a string can’t be calculated without iterating through the string to determine its 
extended grapheme cluster boundaries. If you are working with particularly long string values, 
be aware that the count property must iterate over the Unicode scalars in the entire string in 
order to determine the characters for that string.

The count of the characters returned by the count property isn’t always the same as the length property 
of an NSString that contains the same characters. The length of an NSString is based on the number of 
16-bit code units within the string’s UTF-16 representation and not the number of Unicode extended 
grapheme clusters within the string.
*/

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

greeting[greeting.endIndex] // Error
greeting.index(after: greeting.endIndex) // Error

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"

/*
You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods 
on any type that conforms to the RangeReplaceableCollection protocol. 
This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

Both String and Substring conform to the StringProtocol protocol, which means it’s often 
convenient for string-manipulation functions to accept a StringProtocol value.
 You can call such functions with either a String or Substring value.
*/

/*
    A collection of UTF-8 code units (accessed with the string’s utf8 property)
    A collection of UTF-16 code units (accessed with the string’s utf16 property)
    A collection of 21-bit Unicode scalar values, equivalent to the string’s UTF-32 encoding form (accessed with the string’s unicodeScalars property)
*/
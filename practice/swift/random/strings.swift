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

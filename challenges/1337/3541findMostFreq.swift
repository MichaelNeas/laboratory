// You are given a string s consisting of lowercase English letters ('a' to 'z').

// Your task is to:

// Find the vowel (one of 'a', 'e', 'i', 'o', or 'u') with the maximum frequency.
// Find the consonant (all other letters excluding vowels) with the maximum frequency.
// Return the sum of the two frequencies.

// Note: If multiple vowels or consonants have the same maximum frequency, you may choose any one of them. If there are no vowels or no consonants in the string, consider their frequency as 0.

// The frequency of a letter x is the number of times it occurs in the string.
 

class Solution {

    let vowelSet = Set<Character>(["a", "e", "i", "o", "u"])
    func maxFreqSum(_ s: String) -> Int {
        // cons, vowels, another option is to make 1 frequency map then iterate through maxing values for each char 
        // another option is an upfront sort then count as you go along nlogn + n
        let (consMap, vowelMap) = s.reduce(into: ([Character:Int](), [Character:Int]()), { acc, curr in 
            if vowelSet.contains(curr) {
                acc.1[curr, default: 0] += 1
            } else {
                acc.0[curr, default: 0] += 1
            }
            
        })
        
        return ((consMap.max { a, b in a.value < b.value })?.value ?? 0) + ((vowelMap.max { a, b in a.value < b.value })?.value ?? 0)
    }
}
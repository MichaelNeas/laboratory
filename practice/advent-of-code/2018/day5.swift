import Foundation

let location = "/Users/michael.neas/workspace/laboratory/practice/advent-of-code/2018/data/day5.txt"

do {
    let fileContent = try String(contentsOfFile: location, encoding: .utf8)
    let allPolymers = fileContent.components(separatedBy: .newlines)
    .compactMap { String($0) }
    var allPolymerArr = Array(allPolymers[0])
    var polymerFound = true

    while polymerFound {
        var newPolyArray:[Character] = []
        polymerFound = false
        var skip = 0
        for index in 0..<allPolymerArr.count-1 {
            
            if skip == 0 , 
                (String(allPolymerArr[index]).uppercased() == String(allPolymerArr[index + 1]) || String(allPolymerArr[index]).lowercased() == String(allPolymerArr[index + 1])),
                String(allPolymerArr[index]) != String(allPolymerArr[index+1]) {
                polymerFound = true
                skip = 1
            } else {
                if skip == 0 {
                    newPolyArray.append(allPolymerArr[index])
                }
                if index == allPolymerArr.count-2{
                    newPolyArray.append(allPolymerArr[index+1])
                }
                skip = 0
            }
        }
        allPolymerArr = newPolyArray
    }
    
    print(allPolymerArr.count)
    
} catch {
    print("Error reading text. \(error)")
}
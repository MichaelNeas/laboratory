/**
 * Input: 
 * ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
 * Output: 
 * ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
 * Explanation: 
 * We will visit "google.mail.com" 900 times, "yahoo.com" 50 times, "intel.mail.com" once and "wiki.org" 5 times. For the subdomains, we will visit "mail.com" 900 + 1 = 901 times, "com" 900 + 50 + 1 = 951 times, and "org" 5 times.
 * @param {string[]} cpdomains
 * @return {string[]}
 */
var subdomainVisits = function(cpdomains) {
    let visitedDict = {};
    cpdomains.map(domain => {
        let val = domain.split(" ")
        let str = ""
        let subDs = val[1].split(".")
        for(let i=subDs.length-1; i>=0; i--){
            str==="" ? str = subDs[i] : str=subDs[i]+"."+str
            if (visitedDict[str]){
                visitedDict[str] += parseInt(val[0])
            } else{
                visitedDict[str] = parseInt(val[0])
            }
        }
        str
    })
    
    let ans = []
    for (var prop in visitedDict) {
      ans.push(`${visitedDict[prop]} ${prop}`);
    }
    return ans
    
};
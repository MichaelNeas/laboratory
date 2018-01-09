public class HashExample{
    boolean symbolsPermutation(String word1, String word2) {
        int[] hash = new int[128];
            Arrays.fill(hash, 0);
        if(word1.length() != word2.length()){
            return false;
        }
        for(int i =0; i < word1.length(); i++){
            hash[word1.charAt(i)]+=1;
            hash[word2.charAt(i)]-=1;
        }
        for(int i = 0; i < hash.length; i++){
            if(hash[i] != 0){
                return false;
            }
        }
        
        return true;
    }
}
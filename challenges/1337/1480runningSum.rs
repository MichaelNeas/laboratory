// Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
// Return the running sum of nums.

impl Solution {
    pub fn running_sum(nums: Vec<i32>) -> Vec<i32> {
        let mut sol: Vec<i32> = vec![nums[0]];
        for i in 1..nums.len() {
            sol.push(nums[i] + sol[i - 1]);
        }
        return sol
    }

    pub fn running_sum(nums: Vec<i32>) -> Vec<i32> {
        let mut sum = 0;
        nums.iter().map(|x| { 
            sum += x; 
            sum 
        }).collect::<Vec<i32>>()
    }
};
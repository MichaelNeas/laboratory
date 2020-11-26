# Interviews

[Practice](./interview-practice)

# Technical Interview Questions

10/2/15

- Can a string or sentence of strings form a palindrome?

09/27/16

- Read file, how many toys can we buy?

09/28/16

- Can a string or sentence be permutated to form a palindrome?

10/24/16

- Find maxCount of an array, make api requests, and style like a button

10/26/16

- isFib, is a number a fibonnaci number?
- evenOddWords, Takes and array and parses through, returning each string as two strings comprised of original even + " " + odd characters.
- reverse Array and return as string: console.log(arr.reverse().join(" "));
- makeDictionaryandSearch, creates a dictionary from a given input and searches on test inputs
- factorial, recursion
- consecutiveBinaryOnes, convert base 10 to base 2 and return maximum consecutive 1's

10/27/16

- hourGlass, checks a 6x6 array for maximum sum in an hourglass
- studentPerson, displays inheritence in java
- bookTitlePrice, shows abstraction in java
- absMaxDifference, scoping and trickery in java

10/28/16

- linkedListInsert, add a new data obj to linked list and return the head.

4/11/17

- Poker hands < 21 or -1

12/20/17

- Elevation Change

02/15/18

- Moncala

02/16/18

- Scan a list of pairs and return total time interval coverage

02/18/18

1. es5 -> es6 closures
1. Bank function with a private variable where they all chain to eatch other
1. Recursive multiplication
1. Memoization cache return
1. Balance brace problem

02/20/18

- App menu w/ json req and user drill down

08/24/18

- Rotate a matrix

08/26/18

- Given a grid find the max number of connected colors, added some optimizations

09/20/18

- Implement Promise.all
- Connect pylons so water will flow in a full connection
- Is it possible to get to the otherside? hopscotch problem
- Build a DOM and traverse
- Trie dictionary
- Sorting algo from a proof

11/28/18

- Givin a 2d array with strings, parse it for meaningful information efficiently

12/4/18

- Given an array of strings, calculate max character value where both words don't contain any of the same chars
- MSPaint implementation

02/15/19

- Count the number of out of order pairs in an array of ints: 1,4,2,3  { 2 } 4,2 and 4,3, do better than n^2 time
- Kth smallest element in an array, nlogn nlogk and n

03/11/19

- Tableview with location search and maps
- Multiplayer game

03/23/19

- Array of bucks with ints corresponding to max size of buckets, 2nd array of ints with how much those buckets are filled, how can we move all the water with the least amount of buckets
- 3 arrays, all n items long, each ith element of each array corresponds to 1 product, how many duplicate products are there?
- Find the retain cycle, weak refs with force unwraps

08/28/20

- You have an array of sorted arrays, write and algie to find the existence of an Int within the matrix

09/02/20

- Async NodeJS requests, map, reduce, filter to get an expected output

10/15/20

- Color points on a map in JS

10/22/20

- Conways game of life
- Architectures

10/30/20

- listview detail view
- nxn solve tic-tac-toe

11/9/20

- Max stack

11/14/20

- Remove peaks
- Lexicographical merge strings
- array mutation based on rules
- tiny pairs
- implement a hashmap
- some math calculation problem (brute force takes too long)
- another 2 leetcode mediums

11/20/20

- sliding window problem
- make tableview from objc api, describe architecture
- architecture of CL
- architecture of my own app


### Lee's Algie Questions

-  Consider a 5x5 chess board where each side has a king and a queen available. Your task is to determine, given input positions only, can white mate within three moves.
```
Assume white moves first.
Your function will be given four integers representing the positions of the white king, white queen, black king and black queen.
Assume a row-major order matrix for the purpose of placing the pieces.
```

- Nth stair with at most mth [steps](https://www.techiedelight.com/find-total-ways-reach-nth-stair-with-atmost-m-steps/)

- You're trying to impress your manager with a wonderful blueberry pie, but after several different attempts and unrelated disasters you have a kitchen full of *slices* of blueberry pie. Every slice is a uniform 6 inches in radius, but they differ in size by arc.  Each slice is on a separate paper plate which you have labelled with two values:

```
t = an integer from 1 up to 360 representing the degree of the primary angle (theta)
v = a positive real number representing the total volume of blueberries in kg that are in the slice. Note that this second number does not correlate with weight in any way (I did mention the disasters right?)

Naturally, you decide to take this opportunity to construct an optimal whole pie from the piece. Being a great engineer, you fire up your computer to help. You've managed to construct an array (A) of tuples where each tuple holds (int, float) values representing  t and v respectively. Compose an algorithm that constructs an optimal pie from the pieces available, maximizing the total weight of blueberries in the pie.

Notes: Pie slices aren't unique. Presume you have an infinite number available of each slice in the array.
Also, you don't have to fill all 360 degrees of the pie. Just get as many blueberries as possible in there while staying within 180 degrees.
```

- You have an MxN matrix A which obeys the following rules:
```
...for each element A(i,j) in A
1) A(i,j) < A(i,j+1)
2) A(i,j) < A(i+1,j)
Given a value x, design an algorithm that returns the index
of x in A or (-1,-1) if x isn't present in A.
```

- NQueens
```
You have N-queens on an M^2 chess board
Write an algorithm that determines if any of the queens threaten each other. (edited) 
Your function should accept a list of (r,c) ordered pairs representing queens and a return a bool
```

- Database of treesets
```
You have a database full of tree sets stored as adjacency lists. The the verticies of each individual tree form a set of values in the domain of 32-bit integers.
Your task is to write a function that converts these tree sets into "diff trees." To do this, we need to identify an edge in each tree which we can "split" to form a root. This edge should be selected in such a way as to maximize the difference of the sum of all values on the left and right subtrees formed by the split.
As input you should accept an adjacency list in the form of a map of ints to lists of ints. Your output should return a tuple of verticies representing the edge to split on.
Receiving a tree with only one vertex is an error.
Example:
Input: {
    1:[2,3], 
    2:[1], 
    3:[1],
}
Output: [1,2]
```

- You have an array of lexicographically sorted strings. Your task is to write a function that accepts a string and tells you if that string is a substring of any element in the array.
_Bonus points for doing it in less than quadratic time._

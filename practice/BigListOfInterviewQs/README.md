# [Reddit Programming Challenges](https://www.reddit.com/r/cscareerquestions/comments/20ahfq/heres_a_pretty_big_list_of_programming_interview/)++

## General

- ~~Find the most frequent integer in an array~~
- ~~Randomly reorder an array given rand and floor in place~~
- ~~Find pairs in an integer array whose sum is equal to 10 (bonus: do it in linear time)~~
- ~~Given 2 integer arrays, determine if the 2nd array is a rotated version of the 1st array. Ex. Original Array A={1,2,3,5,6,7,8} Rotated Array B={5,6,7,8,1,2,3}~~
- ~~Write fibbonaci iteratively and recursively (bonus: use dynamic programming)~~
- ~~Find the only element in an array that only occurs once.~~
- ~~Find the common elements of 2 int arrays~~
- ~~Implement binary search of a sorted array of integers~~
- ~~Implement binary search in a rotated array (ex. {5,6,7,8,1,2,3})~~
- ~~Use dynamic programming to find the first X prime numbers~~
- ~~Write a function that prints out the binary form of an int~~
- ~~Implement parseInt~~
- ~~Implement squareroot function~~
- ~~Implement an exponent function (bonus: now try in log(n) time)~~
- ~~Write a multiply function that multiples 2 integers without using *~~
- ~~Maximum Sum Subarray~~
- Given a Matrix (n X m) that has sorted columns and rows count the total number of negative numbers
- ~~HARD: Given a function rand5() that returns a random int between 0 and 5, implement rand7()~~
- HARD: Given a 2D array of 1s and 0s, count the number of "islands of 1s" (e.g. groups of connecting 1s, A group of connected 1s forms an island, 1 or more 1's)

## Strings

- ~~Find the first non-repeated character in a String~~
- ~~Given a string find the first reoccuring character in that string~~
- ~~Find the longest consecutive characters in a string~~
- ~~Reverse a String iteratively and recursively~~
- ~~Determine if 2 Strings are anagrams~~
- ~~Check if String is a palindrome~~
- ~~Check if a String is composed of all unique characters~~
- ~~Determine if a String is an int or a double~~
- Check if the string can be reordered to a different string
- HARD: Find the shortest palindrome in a String
- HARD: Print all permutations of a String
- HARD: Given a single-line text String and a maximum width value, write the function 'String justify(String text, int maxWidth)' that formats the input text using full-justification, i.e., extra spaces on each line are equally distributed between the words; the first word on each line is flushed left and the last word on each line is flushed right

## Trees

- ~~Implement a BST with insert and delete functions~~
- ~~Print a tree using BFS and DFS~~
- ~~Write a function that determines if a tree is a BST~~
- ~~Find the smallest element in a BST~~
- ~~Find the 2nd largest number in a BST~~
- ~~Given a binary tree which is a sum tree (child nodes add to parent), write an algorithm to determine whether the tree is a valid sum tree~~
- ~~Find the distance between 2 nodes in a BST and a normal binary tree~~
- ~~Print the coordinates of every node in a binary tree, where root is 0,0~~
- ~~Print a tree by levels~~
- ~~Given a binary tree which is a sum tree, write an algorithm to determine whether the tree is a valid sum tree~~
- Recursive BFS/DFS, Know when you should use one over the other
- Topological sort with BFS/DFS
- BFS/DFS on an adjacency list
- BFS/DFS on an adjacency matrix
- General [Traversals](https://en.wikipedia.org/wiki/Tree_traversal#Pre-order_(NLR)): Preorder, PostOrder, InOrder
- Implement a tree with arrays for children to allow larger fan out
- Given a tree, verify that it contains a subtree.
- HARD: Find the max distance between 2 nodes in a BST.
- HARD: Construct a BST given the pre-order and in-order traversal Strings

## Stacks, Queues, and Heaps

- ~~Implement a stack with push and pop functions~~
- ~~Implement a queue with queue and dequeue functions~~
- ~~Find the minimum element in a stack in O(1) time~~
- ~~Write a function that sorts a stack (bonus: sort the stack in place without extra memory)~~
- Implement a binary min heap. Turn it into a binary max heap
- ~~HARD: Implement a queue using 2 stacks~~

## Graphs

- Given a list of sorted words from an alien dictionary, find the order of the alphabet.
    Alien Dictionary Topological Sort question.
- [Dijkstras](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)
- Differences in weighted, unweighted, directed, and undirected graphs
- Find if a given string matches any path in a labeled graph. A path may contain cycles.
- Given a bipartite graph, separate the vertices into two sets.
- You are a thief trying to sneak across a rectangular 100 x 100m field. There are alarms placed on the fields and they each have a circular sensing radius which will trigger if anyone steps into it. Each alarm has its own radius. Determine if you can get from one end of the field to the other end.
- Given a graph and two nodes, determine if there exists a path between them.
- Determine if a cycle exists in the graph.


## Linked Lists

- ~~Implement a linked list (with insert and delete functions)~~
- ~~Find the Nth element in a linked list~~
- ~~Remove the Nth element of a linked list~~
- ~~Check if a linked list has cycles~~
- ~~Given a circular linked list, find the node at the beginning of the loop. Example: A--&gt;B--&gt;C --&gt; D--&gt;E --&gt;C, C is the node that begins the loop~~
- ~~Check whether a link list is a palindrome~~
- ~~Reverse a linked list iteratively and recursively~~

## Sorting

- ~~Implement bubble sort~~
- ~~Implement selection sort~~
- ~~Implement insertion sort~~
- ~~Implement merge sort~~
- ~~Implement quick sort~~

## Top algorithms for coding interviews from The Tech Lead

1. Tree Traversal
1. Use a helper function for clean recursion, always clarify base case (recursion is limited to stack space)
1. Stacks and Queues to give an iterative solution for recursion
1. OOP, yes js OOP: class, methods, constructors, private, public
1. Grid class could save time, with edge checks, sanitation, helpers
1. HashMaps are huge in all interview questions, hashing function
1. Add C or C++ to language mix to give some pointers ;)
1. Sorting: Bubble(lol), Quick and merge... but generally those implementations won't be asked
1. Dynamic Programming: Know the basics don't drill them tho, caching/memoization is DP

## Design Patterns

- What are the dependencies in the module of your program? Programmer multithreading working with apps
- Primary Data objects in your program and how do they flow? Simplicity and 1 way data flow
- Single Responsibility (every class/method has a single responsibility)
- Which object owns which other object?
- Singleton - floating globals, dep injection - they can introduce two way data flow - Communication pattern is huge
- Pub/Sub is versitle and encourages 1 way delegate
- Delegate 
- Chain of hierarchy - communicate events upwards, bubbling up (anti pattern?)
- OOP - inheritence is a pretty poor design structure, two way communication, deeply tied structure
- Containment - objs and controllers to delegate messages
- Lazy Initialization - don't create objects until need them
- Adapter - Many objects with apis and adapter can allow a common api with wrapper classes
- Factory/Builder - Catalog, for heterogeneous group of components
- The simpler the better.

### Extra

- [Geeks for geeks key algies](https://www.geeksforgeeks.org/top-10-algorithms-in-interview-questions/#algo1)
- [Repo with q's](https://github.com/yangshun/tech-interview-handbook)
- [fullstack github q's](https://github.com/ratracegrad/Full-Stack-Interview-Questions)
- [frontend github q's](https://github.com/h5bp/Front-end-Developer-Interview-Questions)

#### Please feel free to submit a PR with solutions

### Notes

- Ask interviewer if they prefer semi colons or nah
- Solving the Problem is NOT the goal, it really is the analysis.
- How well can you analyze the solution, often a time or memory type of solution.
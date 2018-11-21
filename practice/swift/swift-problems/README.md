# Problem [Source](https://github.com/eneko/Ninety-Nine-Swift-Solutions)

## Step 1: Set up your username

Run the following command to set up your GitHub username:

```
$ swift run setup <your_username>
```

_Note: You are free to use any username you want. However, pull requests will only be accepted when the username matches the GitHub account where the pull request is being submitted from._

To set up the Xcode project, run:

```
$ swift package generate-xcodeproj
$ open NinetyNineSwiftSolutions.xcodeproj
```

In Xcode, select the scheme corresponding to your user name and you should be good to go!

## Step 2: Solving a problem

To solve a problem, please create a new file with the problem ID and your user name as follows:

```
$ touch Solutions/<your_username>/p01_<your_username>.swift
```

This is the most important part of the process, go have fun! Be creative and enjoy!

Example solution:

```swift
import NinetyNineSwiftProblems

extension List {

    /// P01 (*) Find the last element of a linked list.
    /// - returns: T last element of the linked list
    /// - author: Eneko Alonso (eneko.alonso@gmail.com)
    /// - complexity: O(n)
    public var last: T {
        var current = self
        while let next = current.nextItem {
            current = next
        }
        return current.value
    }

}
```

## Step 3: Testing your solutions

Once you have developed a solution, you can easily test it by runnig the test runner:

```
$ swift run test <your_username>
```

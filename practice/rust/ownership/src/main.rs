fn main() {
    
    // Each value in Rust has a variable that’s called its owner.
    // There can only be one owner at a time.
    // When the owner goes out of scope, the value will be dropped.

    {                      // s is not valid here, it’s not yet declared
        let s = "hello";   // s is valid from this point forward

        // do stuff with s
    }                      // this scope is now over, and s is no longer valid

    
    // When s comes into scope, it is valid.
    // It remains valid until it goes out of scope.

    let mut s = String::from("hello");

    s.push_str(", world!"); // push_str() appends a literal to a String

    println!("{}", s); // This will print `hello, world!`

    // the memory is automatically returned once the variable that owns it goes out of scope.

    {
        let s = String::from("hello"); // s is valid from this point forward

        // do stuff with s
    }                                  // this scope is now over, and s is no
                                       // longer valid

    // When a variable goes out of scope, Rust calls a special function for us. 
    // This function is called drop, and it’s where the author of String can put the code to return the memory. 
    // Rust calls drop automatically at the closing curly bracket.

    // major difference, copy is made from x to y because we know 5 at compile time
    // types that are known at compile time are pushed onto the stack
    let x = 5;
    let y = x;

    // with string being on the heap we point to the memory address of s1 for s2
    // this could lead to a double free error and is one of the memory safety bugs 
    // Freeing memory twice can lead to memory corruption, which can potentially lead to security vulnerabilities.
    // To ensure memory safety, there’s one more detail to what happens in this situation in Rust. 
    // Instead of trying to copy the allocated memory, Rust considers s1 to no longer be valid and,
    // therefore, Rust doesn’t need to free anything when s1 goes out of scope. Check out what happens when you try to use s1 after s2 is created; it won’t work:
    let s1 = String::from("hello");
    let s2 = s1; // This is called a MOVE

    //println!("{}, world!", s1);
    // In addition, there’s a design choice that’s implied by this: Rust will never automatically create “deep” copies of your data. 
    // Therefore, any automatic copying can be assumed to be inexpensive in terms of runtime performance.
    let s1 = String::from("hello");
    let s2 = s1.clone(); // explicitly copy the heap

    println!("s1 = {}, s2 = {}", s1, s2);

    // Rust won’t let us annotate a type with the Copy trait if the type, or any of its parts, has implemented the Drop trait.

    // As a general rule, any group of simple scalar values can be Copy, and nothing that requires allocation or is some form of resource is Copy. Here are some of the types that are Copy:

    // All the integer types, such as u32.
    // The Boolean type, bool, with values true and false.
    // All the floating point types, such as f64.
    // The character type, char.
    // Tuples, if they only contain types that are also Copy. For example, (i32, i32) is Copy, but (i32, String) is not.
    let s = String::from("hello");  // s comes into scope

    takes_ownership(s);             // s's value moves into the function...
                                    // ... and so is no longer valid here

    let x = 5;                      // x comes into scope

    makes_copy(x);                  // x would move into the function,
                                    // but i32 is Copy, so it’s okay to still
                                    // use x afterward
    let s1 = String::from("hello");

    let (s2, len) = calculate_length(s1);

    println!("The length of '{}' is {}.", s2, len);
} // Here, x goes out of scope, then s. But because s's value was moved, nothing
  // special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{}", some_string);
} // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("{}", some_integer);
} // Here, some_integer goes out of scope. Nothing special happens.

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String

    (s, length)
}

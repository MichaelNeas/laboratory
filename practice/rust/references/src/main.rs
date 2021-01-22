fn main() {
    let s1 = String::from("hello");
    // The &s1 syntax lets us create a reference that refers to the value of s1 but does not own it.
    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);

    let mut s = String::from("hello");

    change(&mut s);

    // you can have only one mutable reference to a particular piece of data in a particular scope
    //let r1 = &mut s;
    // //let r2 = &mut s; // uncomment and this will be unusable
    // Race conditions can occur if
    // Two or more pointers access the same data at the same time.
    // At least one of the pointers is being used to write to the data.
    // There’s no mechanism being used to synchronize access to the data.

    // same thing will happen when you mix mutable and immutable references
    // let r1 = &s; // no problem
    // let r2 = &s; // no problem
    // let r3 = &mut s; // BIG PROBLEM

    // but
    let r1 = &s; // no problem
    let r2 = &s; // no problem
    println!("{} and {}", r1, r2);
    // r1 and r2 are no longer used after this point

    let r3 = &mut s; // no problem
    println!("{}", r3);
    // These scopes don’t overlap, so this code is allowed.

}

// reference to an object as a parameter instead of taking ownership of the value
fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len() 
    // Just as variables are immutable by default, so are references. We’re not allowed to modify something we have a reference to.
} // Here, s goes out of scope. But because it does not have ownership of what
  // it refers to, nothing happens.

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

// dangling pointers
// fn dangle() -> &String { // dangle returns a reference to a String

//     let s = String::from("hello"); // s is a new String

//     &s // we return a reference to the String, s
// } // Here, s goes out of scope, and is dropped. Its memory goes away.
//   // Danger!

fn no_dangle() -> String {
    let s = String::from("hello");

    s
}
// brings the input/output lib in to scope from standard library
use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("Guess the number!");
    let secret_number = rand::thread_rng().gen_range(1, 101);
    //println!("The secret number is: {}", secret_number);

    // loop keyword creates an infinite loop.
    loop {
        println!("Input your guess");
        // let creates a variable
        // variables are immutable by default
        // using mut makes the variable mutable
        // new is an associated function of the string type (Static)
        let mut guess = String::new();
        // std::io::stdin
        // & indicates the argument is a reference
        // Result type just like swift!
        // expect is how to handle the error variant of the enum
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        // shadow the previous value of guess with a new one
        // trim elimnates whitespace at beginning and end
        // parse - https://doc.rust-lang.org/std/primitive.str.html#method.parse
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };//.expect("Please type a number!");
        
        // {} is a place holder for guess
        println!("You guessed: {}", guess);

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => { 
                println!("You win!");
                break;
            },
        }

        println!("guess = {} and times 5 = {}", guess, guess * 5)
    }
}

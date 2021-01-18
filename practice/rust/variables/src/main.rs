fn main() {
    let mut x = 5;
    println!("The value of x is {}", x);
    x = 6;
    println!("The value of x is {}", x);
    const MAX_POINTS: u32 = 100_000;
    println!("Constant variable {}", MAX_POINTS);
    let x = 7; // shadowing
    println!("The value of x is {}", x);
    let spaces = "    ";
    let spaces = spaces.len();
    println!("Space count {}", spaces);
    let a = 2.0; // f64, double precision
    let b: f32 = 3.4; // explicit f32
    let c = 'z';
    let z = 'ℤ';
    let heart_eyed_cat = '😻'; // Unicode Scalar Value support
    let tup = (2, 5.4, "hi"); // mixed type tuple
    let (x, y, z) = tup;

    println!("The value of z is: {}", z);
    println!("first {} and second {}", tup.0, tup.1);
    
    let d: [i32; 5] = [1, 2, 3, 4, 5]; 
    let e: [i32; 3];
    // rust will exit the program during runtime when attempting to access out of bounds element d[6]
    // this is an example of rust safety principles

}

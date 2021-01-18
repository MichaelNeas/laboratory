fn main() {
    another_fun(5);
    let a = {
        let x = 3;
        x + 1 // Expressions do not include ending semicolons.
        // If you add a semicolon to the end of an expression, you turn it into a statement, which will then not return a value.
    };
    println!("{}", a);
    // x = y = 5 is not allowed in rust
    println!("{}", five());

    let t = five();

    if t > 5 {
        println!("Greater than 5");
    } else {
        println!("Less than or equal to 5");
    }

    let condition = true;
    let number = if condition { 5 } else { 6 }; // surely rust will have a ternary

    println!("The value of number is: {}", number);

    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("The result is {}", result);

    let mut number = 3;

    while number != 0 {
        println!("{}!", number);

        number -= 1;
    }

    println!("LIFTOFF!!!");

    let a = [10, 20, 30, 40, 50];
    let mut index = 0;

    while index < 5 {
        println!("the value is: {}", a[index]);

        index += 1;
    }

    for element in a.iter() {
        println!("the value is: {}", element);
    }

    for number in (1..4).rev() {
        println!("{}!", number);
    }
    println!("LIFTOFF!!!");
}

fn another_fun(x: i32) {
    println!("Hello, world! {}", x);
}

fn five() -> i32 {
    5
}
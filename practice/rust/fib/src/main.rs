fn main() {
    let x = 10;
    println!("fib of {} is {}", x, fib(x));
}

fn fib(n: i64) -> i64 {
    if n == 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        return fib(n-1) + fib(n-2);
    }
}

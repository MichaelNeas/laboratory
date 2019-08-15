/*
    Suppose we have a class:

    public class Foo {
    public void first() { print("first"); }
    public void second() { print("second"); }
    public void third() { print("third"); }
    }
    The same instance of Foo will be passed to three different threads. 
    Thread A will call first(), thread B will call second(), and thread C will call third(). 
    Design a mechanism and modify the program to ensure that second() is executed after first(), and third() is executed after second().
*/
class Foo {   
    mutex m1, m2;
public:
    Foo() {
        m1.lock(), m2.lock();
    }

    void first(function<void()> printFirst) {
        printFirst();
        m1.unlock();
    }

    void second(function<void()> printSecond) {
        m1.lock();
        printSecond();
        m1.unlock();
        m2.unlock();
    }

    void third(function<void()> printThird) {
        m2.lock();
        printThird();
        m2.unlock();
    }
};
# Be a light, not a judge. Be a model, not a critic

## Unit testing is IMPORTANT

### Understanding a new code base

1. Find a mentor
1. Get an overview
1. Do a small quest
1. Don't get stuck
1. Code Review!
1. Teach Others

### Better Programmers

1. Wild Ideas
1. Old Wisdom
1. Teaching
1. Having FUN

### Test Driven Developing

1. Commits require test cases
1. Teach with manditory code review
1. Unbraid your code - injection and facades

### Top Notes

- **Closures** are frequently used in js for object data privacy, private data to your function
- They provide access to an outer function's scope from an inner function
- **Currying** is when a function, instead of taking all arguments at one time, takes the first one and returns a new function that takes the second one and returns a new function which takes the third one, and so forth, until all arguments have been fulfilled.
- ```new``` ties your hands behind your back, dont use if you don't have to!
- ```null``` is for objects, ```undefined``` is for variables, properties, and methods.
- Functional === verbs , objects === nouns
- Abstraction takes complicated things and makes it simple, leaky abstraction fails to full encapsulation

### To Know

1. Js supports multiple paradigms
  - has prototypal inheritance(new)keyword [Objects Linking Other Objects]
  - **functional programming** (closures, first class functions, and lambdas)
1. Functional Programming includes mathematical functions and avoids mutability as all costs.
  - **First Class Function** - objects and functions are treated as the same thing
  - **Higher-order function** - takes 1 or more functions as args and returns a function as a result
  - **Pure functions** - Always return the same value for the same given input 1to1, item potent, you run them once and subsequent times will not change an output, doesnt log anything it just returns something back, parrallel processing can happen easier without race conditions like in threaded code, threads lock the resources for no competes.  Unit testing can happen in parallel with assurance that tests can run at the same time because of the being of pure functions
  - **Function Composition** - Putting functions together f(g(x))
  - A **side effect** is any effect other than that return value, mutated data from other functions, with no sideaffects there is no need for locking, any interation with the screen is a side effect, **ANYTHING** outside of returning something, favor pure functions but its not entirely possible.
1. Classical inheritance vs prototypal inheritance?
  - **Class:** creates tight coupling or hierarchies, predicting the future
  - **Prototypes:** Concatenative inheritance(putting together), prototype delegation, functional inheritance, object composition, inheritance is directly from other objects, instantiated via factory functions
  - **Prototype** - a regular js object, with a target object you want to access properties on, and if the properties arent there then you have to look up the prototype chain to find the property you need
  - **Factory Function** - any function can create a new object, which is a factory function and you dont have to use a constructor function
1. Pros and Cons of functional programming vs oop
  - **OOP Pro:** Easy to understand objects, and meaning of method calls, imperative style modeling/repping real life
  - **OOP Con:** Depends on shared state, objects held together by the same entitiy, plausible race conditions, complicated to understand all of the effects that objects have on each other.  *Fragile base class problem* what you change in the base class can critically effect all the subclasses that use it
  - **FP Pro:** Simple functions, reusable code, readable, step-by-step, scalable, declarative, elimate looping/business logic dedicated to objects, you can generalize everything, object composition to replace things easier
  - **FP Con:** large compositions reducing readability
1. When is classical inheritance appropriate?
  - **Never**, object componsition > class inheritance
1. When is prototypal inheritance appropriate?
  - **Delegation** - Prototype chain, searching for parent prototypes for properties
  - **Concatenative** - Mixins, Object.assign(), look at properties of a source object and copy them into a new object, to compose objects together
  - **Functional** - functions used to create closures
  - **Situations** where modules or functional programming dont provide obvious solution
1. What does favor object composition over class inheritance mean?
  - Dont use **is-a** relationships, **avoid** class hierarchies and rigid taxonomys
1. What are 2way data binding and 1way data flow, how are they different?
  - **2way(angular)** - UI fields are bound to model data dynamically and they both change on each others change
  - **1way(react)** - Model is the only source of data, 1 way flows are deterministic, model->UI
1. What are pros and cons of monolithic and microservice architectures?
  - **Monolithic** - app is written as one cohesive unit of code, components designated to work together, gigantic frameworks, tons of libraries
  - **Pros** - When everything runs on the same app, its easy to hook components together and increase performance
  - **Cons** - Tightly coupled and entangled as app evolves, difficult to isolate services for purposes such as independent scaling or maintainability, hard to understand with many dependencies, side affects and magic
  - **Microservice** - App made up of smaller independent apps capable of running in their own mem and scale independently
  - **Pros** - Better organized, each service has a specific job and thats it, scalable independently of app
  - **Cons** - Incur overhead of separate modules for cross0cutting concern or encapsulate cross-cutting concerns in another service layer
  - Positive attitude toward microservices, despite the higher initial cost vs monolthic apps. Aware that microservices tend to perform and scale better in the long run.
1. What is async and why is it important in js?
  - **Synchronous** means that code is executed sequentially from top-to-bottom, blocking on long tasks*
  - **Async** is that the engine runs in an event loop and when a blocking op is needed the request is started and code keeps running without blocking for the result, when the response is ready an interrupt is fired and cause the event handler to be run, and flow continues, allowing for many concurrent operations
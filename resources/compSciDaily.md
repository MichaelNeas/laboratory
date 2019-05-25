# CompSci Daily
## Daily questions for newcomers 😄

Comp Sci daily has begun from desire to learn new things in our slack group! The following will be a list of the proposed new cool technologies and a short reading to follow up.

### Day0: SSHFS, try to get it working too
```
A tool that mounts and allows interaction with remote directories and contents.  This technology is made available by SFTP and SSH.
```
- Jack got [it](https://en.wikipedia.org/wiki/SSHFS) working from WSL!

### Day1: Ascii vs Unicode
```
Ascii is 2^8 bit encoding to represent 128 characters
Unicode is masssssive  < 2^21 bit encoding and has emojis and a ton of different symbols (edited) 
Further studies: what does UTF stand for and what are popular encodings for it?
    Stands for "Unicode Transformation Format." UTF refers to several types of Unicode character encodings, including UTF-7, UTF-8, UTF-16, and UTF-32.
```
- [Ascii](https://en.wikipedia.org/wiki/ASCII)
- [Unicode](https://en.wikipedia.org/wiki/Unicode)
- [UTF](https://en.wikipedia.org/wiki/UTF)

### Day 2: Introspection & Reflection
```
Introspection - Examine types or properties of an object at runtime
Reflection - Goes a step further and allows manipulation of the values, data, props of an object at runtime.
```
- [Jack's Article!](https://medium.com/@jdcorley/introspection-vs-reflection-part-1-1cb2c5f5f7d7)

### Day 3: Protobufs
```
Googles lightweight data format to provide easier structure and serialization to developers
```
- [Google Documentation](https://developers.google.com/protocol-buffers/)

### Day 4: RTP, what is it? when/why would you use it?
```
Real-time Transport Protocol used for things that need to be in real time i.e. minimal latency

Ex. Sports, phone calls, TV
```
- [RTP](https://en.wikipedia.org/wiki/Real-time_Transport_Protocol)

### Day 5: Declarative programming, why/what? An an example.
```
Imperative - How one does something (C, C++, Java)
Declarative - What one wants (SQL, HTML)
Hybrid - Both! (JS, Python, C#)

It's important to remember that these are paradigms and can be implemented in any language.
```

- [The VS article](https://tylermcginnis.com/imperative-vs-declarative-programming/)

#### Declarative Examples (What)

```
function double (arr) {
  return arr.map((item) => item * 2)
}
function add (arr) {
  return arr.reduce((prev, current) => prev + current, 0)
}
<Btn
  onToggleHighlight={this.handleToggleHighlight}
  highlight={this.state.highlight}>
    {this.state.buttonText}
</Btn>
```

#### Imperative Examples (How)

```
function double (arr) {
  let results = []
  for (let i = 0; i < arr.length; i++){
    results.push(arr[i] * 2)
  }
  return results
}
function add (arr) {
  let result = 0
  for (let i = 0; i < arr.length; i++){
    result += arr[i]
  }
  return result
}
$("#btn").click(function() {
  $(this).toggleClass("highlight")
  $(this).text() === 'Add Highlight'
    ? $(this).text('Remove Highlight')
    : $(this).text('Add Highlight')
})
```
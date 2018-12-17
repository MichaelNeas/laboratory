# Turn some code into some other codes

3 Things
1. The source language (the one it parses)
2. The target language (the one it generates)
3. Its implementation language (the one in which it itself is written)

A few parts allow this to happen
1. Scan characters
2. Parse for tokens
3. Generate an abstract syntax tree based on semantics
4. Convert to an intermediate representation
5. Optomize!
6. Select Instructions
7. Allocate Registers
8. Emit Machine Code

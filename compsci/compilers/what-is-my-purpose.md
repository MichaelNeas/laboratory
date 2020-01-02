# Turn some code into some other codes

- _Compilers_ are software systems that translate human readable _source_ code into computer executable _target_ code.  Machine language produced by a compiler is usually much faster.
- _Interpreters_ do the same thing but in small chunks, on the fly.  Interpreter's can usually give better error diagnostics than a compiler, since it is executing line by line.
- An assembly-language program output is easier to produce as output and easier to debug.  _Assemblers_ handle the relocating machine code as its output.
- _Linkers_ resolve external memory addresses, _loaders_ put together all of the executable object files into memory for execution
- If a _source_ to _source_ translator is used, where another language such as C is a target language, we can use existing C compilers to do the heavy lifting.

#### 3 Things
1. The source language (the one it parses)
2. The target language (the one it generates)
3. Its implementation language (the one in which it itself is written)

#### A few phases allow this to happen
1. Scan characters (Lexical Analyzer), produce tokens
2. Parse for tokens (Syntax Analyzer), produce syntax tree
3. Generate an abstract syntax tree based on semantics (Semantic Analyzer), produce syntax tree
4. Convert to an intermediate representation (Intermediate Code Generator)
5. Optomize! (Machine-Independent Code Optimizer)
6. Select Instructions
7. Allocate Registers
8. Emit Machine Code

#### Structure of a compiler
- _analysis_ breaks up the source into pieces, imposes grammatical structure, provides error messages if the structure is off and maintains the _symbol table_ 
- _synthesis_ constructs the target program from intermediate representation and information from the symbol table
- _lexeme_ grouped characters from source into meaningful sequences, for each lexeme , the lexical analyzer produces a token: _<token-name, attribute-value>_
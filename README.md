Lambda Calculus Interpreter
---------------------------

The source code of the following variants of lambda calculus interpreter where studied and the semantics and type system where changed accordingly inorder to facilitate the following extensions:

- [Simple Boolean](simplebool) language interpreter with extensions:
	- 'let' construct (Let keyword)
	- 'unit' type (Analogous to void type)
	- 'make-pair' function (Takes two arguments and returns a pair)
- [Simple Boolean](simplebool_2) language interpreter with extensions:
	- 'fst' function (Returns the first element of a pair given as argument)
	- 'snd' function (Returns the second element of a pair given as argument)
- [Untyped arithmetic expressions] (utar_interpreter) language interpreter with extensions:
	- 'and' operator
	- 'or' operator
	- 'not' operator
- [Untyped arithmetic expressions] (utar_interpreter_2) language interpreter with extensions:
	- if-then-else statement with modified order of evaluation
- [Other] (ml_basics) Simple programs in OCaml

Run Instructions for an interpreter:

	# To build the executable 'f'
		make
	# To run executable file on test.f
		./f < test.f
	# To build and run the executable on test file
		make test
	# To remove all intermediate and temporary files
		make clean

Author: Nachiappan V.

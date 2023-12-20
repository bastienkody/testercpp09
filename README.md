# WHAT IS THIS
__Ecole 42 cpp09 tester__  
  
[ ON CONSTRUCTION ] --> in december 2023 : only ex00 + ex01 available  
  
[ DISCLAIMER ] : it only prints the test and launch it : it's UP TO YOU to eyecheck if the program output match the test.

##	EX00 BitcoinExchange 
*	Makefile flags and relink
*	bad input.txt format tester (name, date, value overflow etc)
*	no tests that modify the database (btc price cotation)

##	EX01 Reverse Polish Notation
*	Makefile flags and relink
*	parsing tester (space parsing, bad: nb, order, operator, number of nb or operator)
*	space parsing choices is up to you (only one or multiple, leading one, tabs)
*	value calculation tests (expected results written for each test)

#  INSTALL
clone inside your cpp09 : `cd cpp09 && git clone git@github.com:bastienkody/testercpp09.git`  

### EX00
copy tester_cpp09ex00btc.sh in ex00/ : `cp testercpp09/tester_cpp09ex00btc.sh ./ex00`  
launch : `cd ex00 && ./tester_cpp09ex00btc.sh`  
Quick look on all inputs.txt : `cat ../testercpp09/inputstxt/*`  
Quick look on specific test X : `cat ../testercpp09/inputstxt/inputsX.txt`  

### EX01
copy the tester_cpp09ex01rpn.sh in ex01/ : `cp testercpp09/tester_cpp09ex01rpn.sh ./ex01`  
launch : `cd ex01 && ./tester_cpp09ex01rpn.sh`  

# REQUIREMENTS
bash  
expected files in cpp09/ex00 : Makefile, main.cpp, BitcoinExchange.{cpp, hpp}  
expected files in cpp09/ex01 : Makefile, main.cpp, RPN.{cpp, hpp}  

## Solution of the exam of 26th June 2012

See the pdf at [this link](http://www.skenz.it/compilers/exams/20120626.pdf)

To solve this exercise I started writing the scanner and testing it standalone.
Because there are conflicts in many of the types declared in the input I 
needed to use 3 state in the scanner to make sure that the matched value are 
correct for this part of input.

The main problem I found in this exam is to docide when I should do an operation 
in the parser or in the scanner. For example to respect the condition that number
of the code value must be between `-138` and `824` and an odd number, I started
doing it with regex in the scanner but then I noticed that it was more easy to
do it in the parser using Java, and the same thing is for the time

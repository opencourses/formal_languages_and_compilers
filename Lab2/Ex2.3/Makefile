default: scanner
	javac scanner.java

scanner: scanner.lex
	jflex scanner.lex

clean:
	rm -f scanner.java
	rm -f output.html
	rm -f *.class
	rm -f *.*~


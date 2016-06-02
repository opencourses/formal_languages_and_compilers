default: scanner parser
	javac *.java

scanner:
	jflex scanner.jflex

parser:
	java java_cup.Main -parser parser parser.cup

clean:
	rm -f parser.java scanner.java sym.java
	rm -f *.class
	rm -f *.*~

default: scanner parser
	javac *.java

draw: scanner parser_draw
	javac *.java

scanner: scanner.jflex
	jflex scanner.jflex

parser: parser.cup
	java java_cup.Main parser.cup

parser_draw: parser.cup
	java java_cup.MainDrawTree parser.cup

clean:
	rm -f parser.java scanner.java sym.java
	rm -f *.class
	rm -f *.*~


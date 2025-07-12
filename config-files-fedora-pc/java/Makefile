make: compile run cleanup

compile: *.java
	javac *.java

run: Demo.class
	java Demo < input.txt > output.txt

cleanup:
	rm *.class

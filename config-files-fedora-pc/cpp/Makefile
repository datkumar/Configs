CC=g++

make: compile run cleanup

compile: code.cpp
	$(CC) -std=c++17 -Wall -O2 code.cpp -o executable

run: ./executable
	./executable < input.txt > output.txt

cleanup:
	rm executable

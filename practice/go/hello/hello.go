// Declare a main package (a package is a way to group functions, and it's made up of all the files in the same directory).
package main

// Import the popular fmt package, which contains functions for formatting text, including printing to the console. This package is one of the standard library packages you got when you installed Go.
import (
	"fmt"
	"log"

	"example.com/greetings"
	//"rsc.io/quote"
) // https://pkg.go.dev/search?q=

// Implement a main function to print a message to the console. A main function executes by default when you run the main package.
func main() {
	// Set properties of the predefined Logger, including
	// the log entry prefix and a flag to disable printing
	// the time, source file, and line number.
	log.SetPrefix("greetings: ")
	log.SetFlags(0)

	// A slice of names.
	names := []string{"Gladys", "Samantha", "Darrin"}

	// Request a greeting message.
	message, err := greetings.Hellos(names)
	// If an error was returned, print it to the console and
	// exit the program.
	if err != nil {
		log.Fatal(err)
	}

	// If no error was returned, print the returned message
	// to the console.
	fmt.Println(message)

	// fmt.Println(quote.Go())
}

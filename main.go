package main

import (
	"fmt"
)

func main() {
	var num1, num2 float64
	var operator string
	var choice string

	for {
		fmt.Print("Enter first number: ")
		fmt.Scan(&num1)

		fmt.Print("Enter second number: ")
		fmt.Scan(&num2)

		fmt.Print("Enter operation (+, -, *, /): ")
		fmt.Scan(&operator)

		switch operator {
		case "+":
			fmt.Println("\033[32mResult:", num1+num2, "\033[0m")
		case "-":
			fmt.Println("\033[34mResult:", num1-num2, "\033[0m")
		case "*":
			fmt.Println("\033[35mResult:", num1*num2, "\033[0m")
		case "/":
			if num2 == 0 {
				fmt.Println("\033[31mError: Division by zero\033[0m")
			} else {
				fmt.Println("\033[36mResult:", num1/num2, "\033[0m")
			}
		default:
			fmt.Println("\033[31mInvalid operation\033[0m")
		}

		fmt.Print("Do you want to continue? (y/n): ")
		fmt.Scan(&choice)

		if choice != "y" {
			fmt.Println("Goodbye 👋")
			break
		}
	}
}

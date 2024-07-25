//
//  main.swift
//  Calculator
//
//  Created by Chaitanya Soni on 25/07/24.
//

import Foundation

/*
 User will input the operator +-\*
 user will input 2 numbers
 the calculation method will be executed between the two numbers and
 output will be shown to the user
 */
func getUserInput() -> String {
    
    print("What kind of calculation do you want to do? options: (+, -, /, *)")
    let operatorString = readLine()
    
    if let operatorString {
        
        print("Enter your first number: ")
        let first = readLine() ?? ""
        
        print("Enter your second number: ")
        let second = readLine() ?? ""
        
        guard let first = Int(first),
              let second = Int(second)
        else {
            print("Do you want to try again? y/n")
            let answer = readLine() ?? "n"
            return answer
        }
        
        if operatorString == "+" {
            
            print("result- ", first + second)
            
        } else if operatorString == "-" {
            
            print("result- ", first - second)
            
        } else if operatorString == "/" {
            
            print("result- ", first / second)
            
        } else if operatorString == "*" {
            
            print("result- ", first * second)
            
        } else {
            print("wrong input")
        }
    }
    
    print("Do you want to try again? y/n")
    let answer = readLine() ?? "n"
    return answer
}

while getUserInput() == "y" { }

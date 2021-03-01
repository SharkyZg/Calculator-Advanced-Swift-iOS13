//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Marko Sarkanj on 01.03.21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double?
    
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func calcOperation(calcMethod: String?) -> Double?{
        if number != nil {
            if let calcMethod = calcMethod {
                switch calcMethod {
                case "+/-":
                    return number! * -1.0
                case "AC":
                    return 0
                case "%":
                    return number! * 0.01
                case "+", "-", "÷", "×":
                    intermediateCalculation = (n1: number!, calcMethod: calcMethod)
                case "=":
                    return performTwoNumCalculation(n2: number!)
                default:
                    fatalError("Cannot assign calc method")
                }
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("Cannot assign calc method")
            }
        }
        return 0
    }
    
    func numberEntered(isFinishedTypingNumber: Bool, currentDisplayText: String, numValue: String) -> String{
        var textValue: String = currentDisplayText
        if isFinishedTypingNumber &&  numValue != "." {
            textValue = numValue
        } else if isFinishedTypingNumber &&  numValue == "." {
            textValue = "0."
        } else if numValue == "." {
            if !textValue.contains("."){
                textValue.append(".")
            }
        } else {
            textValue.append(numValue)
        }
        return textValue
    }
}

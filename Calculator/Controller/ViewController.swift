//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var calculatorLogic = CalculatorLogic(number: nil)
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")}
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calculatorLogic.number = displayValue
        if let tempValue = calculatorLogic.calcOperation(calcMethod: sender.currentTitle) {
            displayValue = tempValue
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            displayLabel.text = calculatorLogic.numberEntered(isFinishedTypingNumber: isFinishedTypingNumber, currentDisplayText: displayLabel.text!, numValue: numValue)
            isFinishedTypingNumber = false
        }
    }
}

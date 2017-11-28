//
//  trigViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/15/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class trigViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
     var userIsInTheMiddleOfTypingANumber = false
    private let defaultDisplayText = "0"
    var digitTouched = false
   
   
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digitTouched {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else {
            displayLabel.text = digit
            digitTouched = true
        }
    }
    
    var displayValue: Double{
        get{
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func performOperation(_ sender: UIButton) {
        digitTouched = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "Sin":
                displayValue = sin(displayValue)
            case "Cos":
                displayValue = cos(displayValue)
            case "tan":
                displayValue = tan(displayValue)
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
        
    }
    
    
    

       @IBAction func backSpace(_ sender: UIButton) {
        
        if displayLabel.text!.characters.count > 1 {
            displayLabel.text = String(displayLabel.text!.characters.dropLast())
        } else {
            userIsInTheMiddleOfTypingANumber = false
            displayLabel.text = defaultDisplayText
        }
    }
    
       
    @IBAction func Reset(_ sender: UIButton) {
        displayLabel.text = ""
    }
}

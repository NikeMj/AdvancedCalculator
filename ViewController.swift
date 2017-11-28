//
//  ViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/13/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var lable: UILabel!
    var numberOnScreen:Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false
    var operation = 0;
    var afterequal = false

    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
        lable.text = String(sender.tag-1)
        numberOnScreen = Double(lable.text!)!
            performingMath = false
        }
        else
        {
            lable.text = lable.text! + String(sender.tag-1)
            numberOnScreen = Double(lable.text!)!

        }
    }
    
    func forTailingZero(temp: Double) -> String {
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if lable.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(lable.text!)!
            if sender.tag == 12 //Divide
            {
                lable.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
               lable.text = "*";
            }
            else if sender.tag == 14 //Minus
            {
                lable.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                lable.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
               lable.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                lable.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                lable.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                lable.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            lable.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
    }
    
    
    @IBAction func positiveNegative(_ sender: UIButton) {
        var textResult: String = ""
        textResult = lable.text!
        if textResult [textResult.startIndex] == "-" {
            var name: String = ""
            name = lable.text!
            name.remove(at: name.startIndex)
            lable.text = name
        } else {
            lable.text = "-" + lable.text!
            
        }
        
    }
    
    
    @IBAction func percent(_ sender: UIButton) {
        var ipercent :Double = 0;
        ipercent = Double(lable.text!)!
        ipercent = ipercent/100
        lable.text = String(forTailingZero(temp: ipercent))
        
    }
    

    @IBAction func Dot(_ sender: UIButton) {
        var textResult: String = ""
        textResult = lable.text!
        let countDot = textResult.characters.filter {$0 == "."}.count
        if afterequal == true || lable.text == "" {
            lable.text = "0."
        }
        else if lable.text != "" && countDot == 0 {
            lable.text = lable.text! + "."
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

       
}


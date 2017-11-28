//
//  Decimal-BinaryViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/18/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class Decimal_BinaryViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var digitTouched = false
    
    
    @IBAction func numbers(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digitTouched {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else {
            displayLabel.text = digit
            digitTouched = true
        }

        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeNavBar()
    }

       func convertToDecimal(binaryVal: Int) -> String {
        
        var num = 0, c = 0,i:Double = 0, result = 0
        
        num = binaryVal
        
        while num != 0 {
            
            c = num % 10
            
            num = num / 10
            result += c * Int(pow(2, i))
            i += 1
            
            
        }
        
        return "\(result)"
    }
    
    func convertToBinary(decimal: Int) -> String {
        
        var num = 0, c = 0,i = 1, result = 0
        
        num = decimal
        
        while num != 0 {
            
            c = num % 2
           
            num = num / 2
             result += c * i
            i *= 10
            
            
        }
        
        return "\(result)"
        
    }
    
    @IBAction func toDecimal(_ sender: UIButton) {
        displayLabel.text = convertToDecimal(binaryVal: (displayLabel.text! as NSString).integerValue)    }
    
    @IBAction func toBinary(_ sender: UIButton) {
        displayLabel.text = convertToBinary(decimal: (displayLabel.text! as NSString).integerValue)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        displayLabel.text = ""
    }
    
    
    var displayValue: Double{
        get{
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    func customizeNavBar() {
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 87/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }

    
}

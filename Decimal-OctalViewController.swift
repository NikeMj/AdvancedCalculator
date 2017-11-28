//
//  Decimal-OctalViewController.swift
//  advancedCalculator
//
//  Created by ADENIKE TOMOMEWO on 9/19/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class Decimal_OctalViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var digitTouched = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeNavBar()
    }

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
    func convertToDecimal(decimal: Int) -> String {
        
        var num = 0, deci = 0
        var result: Double = 0;
         var i: Double = 0;
        num = decimal
        
        while num != 0 {
            result = Double(num % 10)
            num = num / 10
            deci = deci + Int(result * pow(8, i))
            i += 1
            
        }
        
                return "\(deci)"
    }
        
    
    func convertToOctal(Octal: Int) -> String {
        
        var num = 0, octal = 0
        var result: Double = 0;
        var i: Double = 1;
        num = Octal
        
        while num != 0 {
            result = Double(num % 8)
            num = num / 8
            octal = octal + Int(result*i)
            i *= 10
            
        }
        
        return "\(octal)"
    }
    

    
    @IBAction func toDecimal(_ sender: UIButton) {
         displayLabel.text = convertToDecimal(decimal: (displayLabel.text! as NSString).integerValue)
    }
   
    @IBAction func toOctal(_ sender: UIButton) {
        displayLabel.text = convertToOctal(Octal: (displayLabel.text! as NSString).integerValue)
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        displayLabel.text = ""

    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 87/255, blue: 35/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }

}
